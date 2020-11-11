Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D932AEFDB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Nov 2020 12:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgKKLnm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Nov 2020 06:43:42 -0500
Received: from inva021.nxp.com ([92.121.34.21]:47800 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726451AbgKKLmq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Nov 2020 06:42:46 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 44EA2200D0C;
        Wed, 11 Nov 2020 12:42:43 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EB4BF20005B;
        Wed, 11 Nov 2020 12:42:36 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 99D6F4029B;
        Wed, 11 Nov 2020 12:42:28 +0100 (CET)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        wsa@the-dreams.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com,
        o.rempel@pengutronix.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, Biwen Li <biwen.li@nxp.com>
Subject: [v10] i2c: imx: support slave mode for imx I2C driver
Date:   Wed, 11 Nov 2020 19:32:55 +0800
Message-Id: <20201111113255.28710-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

The patch supports slave mode for imx I2C driver

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v10:
	- totally remove CONFIG_I2C_SLAVE
	- replace api with i2c_imx_clart_irq()
	- remove robust code
	- place pm_runtime_get in i2c_imx_slave_init()
	  to i2c_imx_reg_slave()
	- apply the patch on top of this patch set:
	  [PATCH v6 0/3] i2c: imx: Fix handling of arbitration loss
	  https://lkml.org/lkml/2020/10/9/407

Change in v9:
	- remove #ifdef after select I2C_SLAVE by default

Change in v8:
	- fix build issue

Change in v7:
	- support auto switch mode between master and slave
	- enable interrupt when idle in slave mode
	- remove #ifdef

Change in v6:
	- delete robust logs and comments
	- not read status register again in master isr.

Change in v5:
	- fix a bug that cannot determine in what mode(master mode or
	  slave mode)

Change in v4:
	- add MACRO CONFIG_I2C_SLAVE to fix compilation issue

Change in v3:
	- support layerscape and i.mx platform

Change in v2:
	- remove MACRO CONFIG_I2C_SLAVE

 drivers/i2c/busses/Kconfig   |   1 +
 drivers/i2c/busses/i2c-imx.c | 219 +++++++++++++++++++++++++++++++----
 2 files changed, 196 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a97a9d058198..e2ad62481f25 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -675,6 +675,7 @@ config I2C_IMG
 config I2C_IMX
 	tristate "IMX I2C interface"
 	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE
+	select I2C_SLAVE
 	help
 	  Say Y here if you want to use the IIC bus controller on
 	  the Freescale i.MX/MXC, Layerscape or ColdFire processors.
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e6f8d6e45a15..a8e8af57e33f 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -17,6 +17,7 @@
  *	Copyright (C) 2008 Darius Augulis <darius.augulis at teltonika.lt>
  *
  *	Copyright 2013 Freescale Semiconductor, Inc.
+ *	Copyright 2020 NXP
  *
  */
 
@@ -73,6 +74,11 @@
 #define IMX_I2C_I2SR	0x03	/* i2c status */
 #define IMX_I2C_I2DR	0x04	/* i2c transfer data */
 
+/*
+ * All of the layerscape series SoCs support IBIC register.
+ */
+#define IMX_I2C_IBIC	0x05    /* i2c bus interrupt config */
+
 #define IMX_I2C_REGSHIFT	2
 #define VF610_I2C_REGSHIFT	0
 
@@ -91,6 +97,7 @@
 #define I2CR_MSTA	0x20
 #define I2CR_IIEN	0x40
 #define I2CR_IEN	0x80
+#define IBIC_BIIE	0x80 /* Bus idle interrupt enable */
 
 /* register bits different operating codes definition:
  * 1) I2SR: Interrupt flags clear operation differ between SoCs:
@@ -201,6 +208,7 @@ struct imx_i2c_struct {
 	struct pinctrl_state *pinctrl_pins_gpio;
 
 	struct imx_i2c_dma	*dma;
+	struct i2c_client	*slave;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -265,6 +273,11 @@ static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)
 	return i2c_imx->hwdata->devtype == IMX1_I2C;
 }
 
+static inline int is_vf610_i2c(struct imx_i2c_struct *i2c_imx)
+{
+	return i2c_imx->hwdata->devtype == VF610_I2C;
+}
+
 static inline void imx_i2c_write_reg(unsigned int val,
 		struct imx_i2c_struct *i2c_imx, unsigned int reg)
 {
@@ -277,6 +290,27 @@ static inline unsigned char imx_i2c_read_reg(struct imx_i2c_struct *i2c_imx,
 	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
+static void i2c_imx_clear_irq(struct imx_i2c_struct *i2c_imx, unsigned int bits)
+{
+	unsigned int temp;
+
+	/*
+	 * i2sr_clr_opcode is the value to clear all interrupts. Here we want to
+	 * clear only <bits>, so we write ~i2sr_clr_opcode with just <bits>
+	 * toggled. This is required because i.MX needs W0C and Vybrid uses W1C.
+	 */
+	temp = ~i2c_imx->hwdata->i2sr_clr_opcode ^ bits;
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
+}
+
+/* Set up i2c controller register and i2c status register to default value. */
+static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
+{
+	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
+			  i2c_imx, IMX_I2C_I2CR);
+	i2c_imx_clear_irq(i2c_imx, I2SR_IIF | I2SR_IAL);
+}
+
 /* Functions for DMA support */
 static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 						dma_addr_t phy_addr)
@@ -412,19 +446,6 @@ static void i2c_imx_dma_free(struct imx_i2c_struct *i2c_imx)
 	dma->chan_using = NULL;
 }
 
-static void i2c_imx_clear_irq(struct imx_i2c_struct *i2c_imx, unsigned int bits)
-{
-	unsigned int temp;
-
-	/*
-	 * i2sr_clr_opcode is the value to clear all interrupts. Here we want to
-	 * clear only <bits>, so we write ~i2sr_clr_opcode with just <bits>
-	 * toggled. This is required because i.MX needs W0C and Vybrid uses W1C.
-	 */
-	temp = ~i2c_imx->hwdata->i2sr_clr_opcode ^ bits;
-	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
-}
-
 static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool atomic)
 {
 	unsigned long orig_jiffies = jiffies;
@@ -638,18 +659,165 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
 }
 
+/*
+ * Enable bus idle interrupts
+ * Note: IBIC register will be cleared after disabled i2c module.
+ * All of layerscape series SoCs support IBIC register.
+ */
+static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
+{
+	if (is_vf610_i2c(i2c_imx)) {
+		unsigned int temp;
+
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_IBIC);
+		temp |= IBIC_BIIE;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_IBIC);
+	}
+}
+
+static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
+				     unsigned int status, unsigned int ctl)
+{
+	u8 value;
+
+	if (status & I2SR_IAL) { /* Arbitration lost */
+		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
+		if (!(status & I2SR_IAAS))
+			return IRQ_HANDLED;
+	}
+
+	if (status & I2SR_IAAS) { /* Addressed as a slave */
+		if (status & I2SR_SRW) { /* Master wants to read from us*/
+			dev_dbg(&i2c_imx->adapter.dev, "read requested");
+			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED, &value);
+
+			/* Slave transmit */
+			ctl |= I2CR_MTX;
+			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+
+			/* Send data */
+			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
+		} else { /* Master wants to write to us */
+			dev_dbg(&i2c_imx->adapter.dev, "write requested");
+			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_REQUESTED, &value);
+
+			/* Slave receive */
+			ctl &= ~I2CR_MTX;
+			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+			/* Dummy read */
+			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		}
+	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
+		if (status & I2SR_IBB) { /* No STOP signal detected */
+			value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED, &value);
+		} else { /* STOP signal is detected */
+			dev_dbg(&i2c_imx->adapter.dev,
+				"STOP signal detected");
+			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
+		}
+	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
+		ctl |= I2CR_MTX;
+		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+
+		i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_READ_PROCESSED, &value);
+
+		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
+	} else { /* Transmit mode received NAK */
+		ctl &= ~I2CR_MTX;
+		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
+{
+	int temp;
+
+	/* Set slave addr. */
+	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx, IMX_I2C_IADR);
+
+	i2c_imx_reset_regs(i2c_imx);
+
+	/* Enable module */
+	temp = i2c_imx->hwdata->i2cr_ien_opcode;
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+	/* Enable interrupt from i2c module */
+	temp |= I2CR_IIEN;
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+	i2c_imx_enable_bus_idle(i2c_imx);
+}
+
+static int i2c_imx_reg_slave(struct i2c_client *client)
+{
+	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (i2c_imx->slave)
+		return -EBUSY;
+
+	i2c_imx->slave = client;
+
+	/* Resume */
+	ret = pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
+	if (ret < 0) {
+		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
+		return ret;
+	}
+
+	i2c_imx_slave_init(i2c_imx);
+
+	return 0;
+}
+
+static int i2c_imx_unreg_slave(struct i2c_client *client)
+{
+	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (!i2c_imx->slave)
+		return -EINVAL;
+
+	/* Reset slave address. */
+	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
+
+	i2c_imx_reset_regs(i2c_imx);
+
+	i2c_imx->slave = NULL;
+
+	/* Suspend */
+	ret = pm_runtime_put_sync(i2c_imx->adapter.dev.parent);
+	if (ret < 0)
+		dev_err(&i2c_imx->adapter.dev, "failed to suspend i2c controller");
+
+	return ret;
+}
+
+static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
+{
+	/* save status register */
+	i2c_imx->i2csr = status;
+	wake_up(&i2c_imx->queue);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
-	unsigned int temp;
+	unsigned int ctl, status;
 
-	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	if (temp & I2SR_IIF) {
-		/* save status register */
-		i2c_imx->i2csr = temp;
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
-		wake_up(&i2c_imx->queue);
-		return IRQ_HANDLED;
+		if (i2c_imx->slave && !(ctl & I2CR_MSTA))
+			return i2c_imx_slave_isr(i2c_imx, status, ctl);
+		return i2c_imx_master_isr(i2c_imx, status);
 	}
 
 	return IRQ_NONE;
@@ -1027,6 +1195,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	dev_dbg(&i2c_imx->adapter.dev, "<%s> exit with: %s: %d\n", __func__,
 		(result < 0) ? "error" : "success msg",
 			(result < 0) ? result : num);
+	/* After data is transferred, switch to slave mode(as a receiver) */
+	if (i2c_imx->slave)
+		i2c_imx_slave_init(i2c_imx);
+
 	return (result < 0) ? result : num;
 }
 
@@ -1140,6 +1312,8 @@ static const struct i2c_algorithm i2c_imx_algo = {
 	.master_xfer = i2c_imx_xfer,
 	.master_xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
+	.reg_slave	= i2c_imx_reg_slave,
+	.unreg_slave	= i2c_imx_unreg_slave,
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
@@ -1233,10 +1407,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
 	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
 
-	/* Set up chip registers to defaults */
-	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
-			i2c_imx, IMX_I2C_I2CR);
-	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
+	i2c_imx_reset_regs(i2c_imx);
 
 	/* Init optional bus recovery function */
 	ret = i2c_imx_init_recovery_info(i2c_imx, pdev);
-- 
2.17.1

