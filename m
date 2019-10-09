Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51703D0CCD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 12:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbfJIK3D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Oct 2019 06:29:03 -0400
Received: from inva021.nxp.com ([92.121.34.21]:41958 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbfJIK3D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Oct 2019 06:29:03 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 89F322000C8;
        Wed,  9 Oct 2019 12:29:00 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EE0E5200114;
        Wed,  9 Oct 2019 12:28:52 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3193C402DA;
        Wed,  9 Oct 2019 18:28:44 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, wsa@the-dreams.de,
        leoyang.li@nxp.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, laurentiu.tudor@nxp.com,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: [RESEND v2] i2c: imx: support slave mode for imx I2C driver
Date:   Wed,  9 Oct 2019 18:18:02 +0800
Message-Id: <20191009101802.19309-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch supports slave mode for imx I2C driver

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- remove MACRO CONFIG_I2C_SLAVE

 drivers/i2c/busses/i2c-imx.c | 180 ++++++++++++++++++++++++++++++++---
 1 file changed, 166 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a3b61336fe55..d9858bc63656 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -203,6 +203,7 @@ struct imx_i2c_struct {
 	struct pinctrl_state *pinctrl_pins_gpio;
 
 	struct imx_i2c_dma	*dma;
+	struct i2c_client	*slave;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -588,23 +589,38 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
 }
 
-static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
+/* Clear interrupt flag bit */
+static void i2c_imx_clr_if_bit(struct imx_i2c_struct *i2c_imx)
 {
-	struct imx_i2c_struct *i2c_imx = dev_id;
-	unsigned int temp;
+	unsigned int status;
 
-	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	if (temp & I2SR_IIF) {
-		/* save status register */
-		i2c_imx->i2csr = temp;
-		temp &= ~I2SR_IIF;
-		temp |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
-		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
-		wake_up(&i2c_imx->queue);
-		return IRQ_HANDLED;
-	}
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	status &= ~I2SR_IIF;
+	status |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
+	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
+}
 
-	return IRQ_NONE;
+/* Clear arbitration lost bit */
+static void i2c_imx_clr_al_bit(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int status;
+
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	status &= ~I2SR_IAL;
+	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
+}
+
+static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int status;
+
+	/* Save status register */
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	i2c_imx->i2csr = status | I2SR_IIF;
+
+	wake_up(&i2c_imx->queue);
+
+	return IRQ_HANDLED;
 }
 
 static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
@@ -1048,11 +1064,147 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 }
 
+static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+
+	/* Set slave addr. */
+	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx, IMX_I2C_IADR);
+
+	/* Disable i2c module */
+	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN;
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+	/* Reset status register */
+	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
+			  IMX_I2C_I2SR);
+
+	/* Enable module and enable interrupt from i2c module */
+	temp = i2c_imx->hwdata->i2cr_ien_opcode | I2CR_IIEN;
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+	/* Wait controller to be stable */
+	usleep_range(50, 150);
+}
+
+static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int status, ctl;
+	u8 value;
+
+	if (!i2c_imx->slave) {
+		dev_err(&i2c_imx->adapter.dev, "cannot deal with slave irq,i2c_imx->slave is null");
+		return IRQ_NONE;
+	}
+
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	if (status & I2SR_IAL) { /* Arbitration lost */
+		i2c_imx_clr_al_bit(i2c_imx);
+	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
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
+			if (status & I2SR_IBB) { /* No STOP signal detected */
+				ctl &= ~I2CR_MTX;
+				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+
+				value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+				i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED, &value);
+			} else { /* STOP signal is detected */
+				dev_dbg(&i2c_imx->adapter.dev,
+					"STOP signal detected");
+				i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
+			}
+	} else if (!(status & I2SR_RXAK)) {	/* Transmit mode received ACK */
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
+	return IRQ_HANDLED;
+}
+
+static int i2c_imx_reg_slave(struct i2c_client *client)
+{
+	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
+
+	if (i2c_imx->slave)
+		return -EBUSY;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+	i2c_imx->slave = client;
+
+	i2c_imx_slave_init(i2c_imx);
+
+	return 0;
+}
+
+static int i2c_imx_unreg_slave(struct i2c_client *client)
+{
+	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
+
+	if (!i2c_imx->slave)
+		return -EINVAL;
+
+	i2c_imx->slave = NULL;
+
+	return 0;
+}
+
 static const struct i2c_algorithm i2c_imx_algo = {
 	.master_xfer	= i2c_imx_xfer,
 	.functionality	= i2c_imx_func,
+	.reg_slave	= i2c_imx_reg_slave,
+	.unreg_slave	= i2c_imx_unreg_slave,
 };
 
+static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
+{
+	struct imx_i2c_struct *i2c_imx = dev_id;
+	unsigned int status, ctl;
+	irqreturn_t irq_status = IRQ_NONE;
+
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+	if (status & I2SR_IIF) {
+		i2c_imx_clr_if_bit(i2c_imx);
+		if (ctl & I2CR_MSTA)
+			irq_status = i2c_imx_master_isr(i2c_imx);
+		else
+			irq_status = i2c_imx_slave_isr(i2c_imx);
+	}
+
+	return irq_status;
+}
+
 static int i2c_imx_probe(struct platform_device *pdev)
 {
 	struct imx_i2c_struct *i2c_imx;
-- 
2.17.1

