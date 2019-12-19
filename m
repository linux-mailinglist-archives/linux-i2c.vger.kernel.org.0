Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A038126296
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 13:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLSMvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 07:51:05 -0500
Received: from mail-sender230.upb.ro ([141.85.13.230]:47352 "EHLO mx.upb.ro"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726694AbfLSMvF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Dec 2019 07:51:05 -0500
X-Greylist: delayed 569 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Dec 2019 07:50:59 EST
Received: from localhost (localhost [127.0.0.1])
        by mx.upb.ro (Postfix) with ESMTP id 2E6B6B561D12;
        Thu, 19 Dec 2019 14:41:28 +0200 (EET)
Received: from mx.upb.ro ([127.0.0.1])
        by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id r_lmHRd9MUMt; Thu, 19 Dec 2019 14:41:24 +0200 (EET)
Received: from localhost (localhost [127.0.0.1])
        by mx.upb.ro (Postfix) with ESMTP id 7E893B561E4D;
        Thu, 19 Dec 2019 14:41:24 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.upb.ro 7E893B561E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=upb.ro;
        s=96342B8A-77E4-11E5-BA93-D93D0963A2DF; t=1576759284;
        bh=djwm5AwoeH/zUuaFnnURslLnLriY/Da+TivkMPI8EUU=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=Py4EWSzo08BfRL6avznRFHW9qAaWXF8g7oIqgUFq3UAtTPwWR8oFN4h4UKgV7Smg5
         RVps+l0duGWRRATlJWt2qkVBfsD148v7+RafT/arrZmWJO2bzTr1DqTEYCFSWvcY2G
         TD//xNHXBDU4F62C8qIi95tslYu6W990xR1B+jRg=
X-Virus-Scanned: amavisd-new at upb.ro
Received: from mx.upb.ro ([127.0.0.1])
        by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id oMOWJeNiNllZ; Thu, 19 Dec 2019 14:41:24 +0200 (EET)
Received: from localhost.localdomain (unknown [46.222.245.86])
        by mx.upb.ro (Postfix) with ESMTPSA id 7D5A8B561D12;
        Thu, 19 Dec 2019 14:41:23 +0200 (EET)
From:   Radu Pirea <radu_nicolae.pirea@upb.ro>
To:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Radu Pirea <radu_nicolae.pirea@upb.ro>,
        Chirag Parekh <chirag.parekh@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] i2c: cadence: Added slave support
Date:   Thu, 19 Dec 2019 14:41:20 +0200
Message-Id: <20191219124120.53754-1-radu_nicolae.pirea@upb.ro>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added support for I2C slave functionality

Signed-off-by: Chirag Parekh <chirag.parekh@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Radu Pirea <radu_nicolae.pirea@upb.ro>
---

Hi,

This patch implements the slave interface for the i2c cadence driver. Mos=
t of the
work has been done by the guys from Xilinx. All I have done it was to por=
t the
patch to the upstream kernel, test it and fix some minor issues.

Any suggestion about how can I improve this patch is welcome.

Thanks.

Radu P.

 drivers/i2c/busses/i2c-cadence.c | 317 ++++++++++++++++++++++++++++++-
 1 file changed, 307 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-ca=
dence.c
index 9d71ce15db05..ea6bf989ba1c 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -23,6 +23,7 @@
 #define CDNS_I2C_ISR_OFFSET		0x10 /* IRQ Status Register, RW */
 #define CDNS_I2C_XFER_SIZE_OFFSET	0x14 /* Transfer Size Register, RW */
 #define CDNS_I2C_TIME_OUT_OFFSET	0x1C /* Time Out Register, RW */
+#define CDNS_I2C_IMR_OFFSET		0x20 /* IRQ Mask Register, RO */
 #define CDNS_I2C_IER_OFFSET		0x24 /* IRQ Enable Register, WO */
 #define CDNS_I2C_IDR_OFFSET		0x28 /* IRQ Disable Register, WO */
=20
@@ -40,9 +41,17 @@
 #define CDNS_I2C_CR_DIVB_SHIFT		8
 #define CDNS_I2C_CR_DIVB_MASK		(0x3f << CDNS_I2C_CR_DIVB_SHIFT)
=20
+#define CDNS_I2C_CR_MASTER_EN_MASK	(CDNS_I2C_CR_NEA | \
+					 CDNS_I2C_CR_ACK_EN | \
+					 CDNS_I2C_CR_MS)
+
+#define CDNS_I2C_CR_SLAVE_EN_MASK	~CDNS_I2C_CR_MASTER_EN_MASK
+
 /* Status Register Bit mask definitions */
 #define CDNS_I2C_SR_BA		BIT(8)
+#define CDNS_I2C_SR_TXDV	BIT(6)
 #define CDNS_I2C_SR_RXDV	BIT(5)
+#define CDNS_I2C_SR_RXRW	BIT(3)
=20
 /*
  * I2C Address Register Bit mask definitions
@@ -91,6 +100,14 @@
 					 CDNS_I2C_IXR_DATA | \
 					 CDNS_I2C_IXR_COMP)
=20
+#define CDNS_I2C_IXR_SLAVE_INTR_MASK	(CDNS_I2C_IXR_RX_UNF | \
+					 CDNS_I2C_IXR_TX_OVF | \
+					 CDNS_I2C_IXR_RX_OVF | \
+					 CDNS_I2C_IXR_TO | \
+					 CDNS_I2C_IXR_NACK | \
+					 CDNS_I2C_IXR_DATA | \
+					 CDNS_I2C_IXR_COMP)
+
 #define CDNS_I2C_TIMEOUT		msecs_to_jiffies(1000)
 /* timeout for pm runtime autosuspend */
 #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
@@ -117,6 +134,32 @@
 #define cdns_i2c_readreg(offset)       readl_relaxed(id->membase + offse=
t)
 #define cdns_i2c_writereg(val, offset) writel_relaxed(val, id->membase +=
 offset)
=20
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+/**
+ * enum cdns_i2c_mode - I2C Controller current operating mode
+ *
+ * @CDNS_I2C_MODE_SLAVE:       I2C controller operating in slave mode
+ * @CDNS_I2C_MODE_MASTER:      I2C Controller operating in master mode
+ */
+enum cdns_i2c_mode {
+	CDNS_I2C_MODE_SLAVE,
+	CDNS_I2C_MODE_MASTER,
+};
+
+/**
+ * enum cdns_i2c_slave_mode - Slave state when I2C is operating in slave=
 mode
+ *
+ * @CDNS_I2C_SLAVE_STATE_IDLE: I2C slave idle
+ * @CDNS_I2C_SLAVE_STATE_SEND: I2C slave sending data to master
+ * @CDNS_I2C_SLAVE_STATE_RECV: I2C slave receiving data from master
+ */
+enum cdns_i2c_slave_state {
+	CDNS_I2C_SLAVE_STATE_IDLE,
+	CDNS_I2C_SLAVE_STATE_SEND,
+	CDNS_I2C_SLAVE_STATE_RECV,
+};
+#endif
+
 /**
  * struct cdns_i2c - I2C device private data structure
  *
@@ -138,6 +181,10 @@
  * @clk:		Pointer to struct clk
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
+ * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
+ * @slave:		Registered slave instance.
+ * @dev_mode:		I2C operating role(master/slave).
+ * @slave_state:	I2C Slave state(idle/read/write).
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -158,6 +205,12 @@ struct cdns_i2c {
 	struct clk *clk;
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	u16 ctrl_reg_diva_divb;
+	struct i2c_client *slave;
+	enum cdns_i2c_mode dev_mode;
+	enum cdns_i2c_slave_state slave_state;
+#endif
 };
=20
 struct cdns_platform_data {
@@ -186,17 +239,155 @@ static inline bool cdns_is_holdquirk(struct cdns_i=
2c *id, bool hold_wrkaround)
 		(id->curr_recv_count =3D=3D CDNS_I2C_FIFO_DEPTH + 1));
 }
=20
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void cdns_i2c_set_mode(enum cdns_i2c_mode mode, struct cdns_i2c *=
id)
+{
+	/* Disable all interrupts */
+	cdns_i2c_writereg(CDNS_I2C_IXR_ALL_INTR_MASK, CDNS_I2C_IDR_OFFSET);
+
+	/* Clear FIFO and transfer size */
+	cdns_i2c_writereg(CDNS_I2C_CR_CLR_FIFO, CDNS_I2C_CR_OFFSET);
+
+	/* Update device mode and state */
+	id->dev_mode =3D mode;
+	id->slave_state =3D CDNS_I2C_SLAVE_STATE_IDLE;
+
+	switch (mode) {
+	case CDNS_I2C_MODE_MASTER:
+		/* Enable i2c master */
+		cdns_i2c_writereg(id->ctrl_reg_diva_divb |
+				  CDNS_I2C_CR_MASTER_EN_MASK,
+				  CDNS_I2C_CR_OFFSET);
+		/*
+		 * This delay is needed to give the IP some time to switch to
+		 * the master mode. With lower values(like 110 us) i2cdetect
+		 * will not detect any slave and without this delay, the IP will
+		 * trigger a timeout interrupt.
+		 */
+		usleep_range(115, 125);
+		break;
+	case CDNS_I2C_MODE_SLAVE:
+		/* Enable i2c slave */
+		cdns_i2c_writereg(id->ctrl_reg_diva_divb &
+				  CDNS_I2C_CR_SLAVE_EN_MASK,
+				  CDNS_I2C_CR_OFFSET);
+
+		/* Setting slave address */
+		cdns_i2c_writereg(id->slave->addr & CDNS_I2C_ADDR_MASK,
+				  CDNS_I2C_ADDR_OFFSET);
+
+		/* Enable slave send/receive interrupts */
+		cdns_i2c_writereg(CDNS_I2C_IXR_SLAVE_INTR_MASK,
+				  CDNS_I2C_IER_OFFSET);
+		break;
+	}
+}
+
+static void cdns_i2c_slave_rcv_data(struct cdns_i2c *id)
+{
+	u8 bytes;
+	unsigned char data;
+
+	/* Prepare backend for data reception */
+	if (id->slave_state =3D=3D CDNS_I2C_SLAVE_STATE_IDLE) {
+		id->slave_state =3D CDNS_I2C_SLAVE_STATE_RECV;
+		i2c_slave_event(id->slave, I2C_SLAVE_WRITE_REQUESTED, NULL);
+	}
+
+	/* Fetch number of bytes to receive */
+	bytes =3D cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
+
+	/* Read data and send to backend */
+	while (bytes--) {
+		data =3D cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);
+		i2c_slave_event(id->slave, I2C_SLAVE_WRITE_RECEIVED, &data);
+	}
+}
+
+static void cdns_i2c_slave_send_data(struct cdns_i2c *id)
+{
+	u8 data;
+
+	/* Prepare backend for data transmission */
+	if (id->slave_state =3D=3D CDNS_I2C_SLAVE_STATE_IDLE) {
+		id->slave_state =3D CDNS_I2C_SLAVE_STATE_SEND;
+		i2c_slave_event(id->slave, I2C_SLAVE_READ_REQUESTED, &data);
+	} else {
+		i2c_slave_event(id->slave, I2C_SLAVE_READ_PROCESSED, &data);
+	}
+
+	/* Send data over bus */
+	cdns_i2c_writereg(data, CDNS_I2C_DATA_OFFSET);
+}
+
 /**
- * cdns_i2c_isr - Interrupt handler for the I2C device
- * @irq:	irq number for the I2C device
- * @ptr:	void pointer to cdns_i2c structure
+ * cdns_i2c_slave_isr - Interrupt handler for the I2C device in slave ro=
le
+ * @ptr:       Pointer to I2C device private data
+ *
+ * This function handles the data interrupt and transfer complete interr=
upt of
+ * the I2C device in slave role.
+ *
+ * Return: IRQ_HANDLED always
+ */
+static irqreturn_t cdns_i2c_slave_isr(void *ptr)
+{
+	struct cdns_i2c *id =3D ptr;
+	unsigned int isr_status, i2c_status;
+
+	/* Fetch the interrupt status */
+	isr_status =3D cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
+	cdns_i2c_writereg(isr_status, CDNS_I2C_ISR_OFFSET);
+
+	/* Ignore masked interrupts */
+	isr_status &=3D ~cdns_i2c_readreg(CDNS_I2C_IMR_OFFSET);
+
+	/* Fetch transfer mode (send/receive) */
+	i2c_status =3D cdns_i2c_readreg(CDNS_I2C_SR_OFFSET);
+
+	/* Handle data send/receive */
+	if (i2c_status & CDNS_I2C_SR_RXRW) {
+		/* Send data to master */
+		if (isr_status & CDNS_I2C_IXR_DATA)
+			cdns_i2c_slave_send_data(id);
+
+		if (isr_status & CDNS_I2C_IXR_COMP) {
+			id->slave_state =3D CDNS_I2C_SLAVE_STATE_IDLE;
+			i2c_slave_event(id->slave, I2C_SLAVE_STOP, NULL);
+		}
+	} else {
+		/* Receive data from master */
+		if (isr_status & CDNS_I2C_IXR_DATA)
+			cdns_i2c_slave_rcv_data(id);
+
+		if (isr_status & CDNS_I2C_IXR_COMP) {
+			cdns_i2c_slave_rcv_data(id);
+			id->slave_state =3D CDNS_I2C_SLAVE_STATE_IDLE;
+			i2c_slave_event(id->slave, I2C_SLAVE_STOP, NULL);
+		}
+	}
+
+	/* Master indicated xfer stop or fifo underflow/overflow */
+	if (isr_status & (CDNS_I2C_IXR_NACK | CDNS_I2C_IXR_RX_OVF |
+			  CDNS_I2C_IXR_RX_UNF | CDNS_I2C_IXR_TX_OVF)) {
+		id->slave_state =3D CDNS_I2C_SLAVE_STATE_IDLE;
+		i2c_slave_event(id->slave, I2C_SLAVE_STOP, NULL);
+		cdns_i2c_writereg(CDNS_I2C_CR_CLR_FIFO, CDNS_I2C_CR_OFFSET);
+	}
+
+	return IRQ_HANDLED;
+}
+#endif
+
+/**
+ * cdns_i2c_master_isr - Interrupt handler for the I2C device in master =
role
+ * @ptr:       Pointer to I2C device private data
  *
  * This function handles the data interrupt, transfer complete interrupt=
 and
- * the error interrupts of the I2C device.
+ * the error interrupts of the I2C device in master role.
  *
  * Return: IRQ_HANDLED always
  */
-static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
+static irqreturn_t cdns_i2c_master_isr(void *ptr)
 {
 	unsigned int isr_status, avail_bytes, updatetx;
 	unsigned int bytes_to_send;
@@ -352,6 +543,27 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
 	return status;
 }
=20
+/**
+ * cdns_i2c_isr - Interrupt handler for the I2C device
+ * @irq:	irq number for the I2C device
+ * @ptr:	void pointer to cdns_i2c structure
+ *
+ * This function passes the control to slave/master based on current rol=
e of
+ * i2c controller.
+ *
+ * Return: IRQ_HANDLED always
+ */
+static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
+{
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct cdns_i2c *id =3D ptr;
+
+	if (id->dev_mode =3D=3D CDNS_I2C_MODE_SLAVE)
+		return cdns_i2c_slave_isr(ptr);
+#endif
+	return cdns_i2c_master_isr(ptr);
+}
+
 /**
  * cdns_i2c_mrecv - Prepare and start a master receive operation
  * @id:		pointer to the i2c device structure
@@ -572,10 +784,28 @@ static int cdns_i2c_master_xfer(struct i2c_adapter =
*adap, struct i2c_msg *msgs,
 	u32 reg;
 	struct cdns_i2c *id =3D adap->algo_data;
 	bool hold_quirk;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	bool change_role =3D false;
+#endif
=20
 	ret =3D pm_runtime_get_sync(id->dev);
 	if (ret < 0)
 		return ret;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* Check i2c operating mode and switch if possible */
+	if (id->dev_mode =3D=3D CDNS_I2C_MODE_SLAVE) {
+		if (id->slave_state !=3D CDNS_I2C_SLAVE_STATE_IDLE)
+			return -EAGAIN;
+
+		/* Set mode to master */
+		cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);
+
+		/* Mark flag to change role once xfer is completed */
+		change_role =3D true;
+	}
+#endif
+
 	/* Check if the bus is free */
 	if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA) {
 		ret =3D -EAGAIN;
@@ -634,7 +864,15 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *=
adap, struct i2c_msg *msgs,
 	}
=20
 	ret =3D num;
+
 out:
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* Switch i2c mode to slave */
+	if (change_role)
+		cdns_i2c_set_mode(CDNS_I2C_MODE_SLAVE, id);
+#endif
+
 	pm_runtime_mark_last_busy(id->dev);
 	pm_runtime_put_autosuspend(id->dev);
 	return ret;
@@ -648,14 +886,67 @@ static int cdns_i2c_master_xfer(struct i2c_adapter =
*adap, struct i2c_msg *msgs,
  */
 static u32 cdns_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
-		(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
-		I2C_FUNC_SMBUS_BLOCK_DATA;
+	u32 func =3D I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
+			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
+			I2C_FUNC_SMBUS_BLOCK_DATA;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	func |=3D I2C_FUNC_SLAVE;
+#endif
+
+	return func;
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int cdns_reg_slave(struct i2c_client *slave)
+{
+	int ret;
+	struct cdns_i2c *id =3D container_of(slave->adapter, struct cdns_i2c,
+									adap);
+
+	if (id->slave)
+		return -EBUSY;
+
+	if (slave->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	ret =3D pm_runtime_get_sync(id->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Store slave information */
+	id->slave =3D slave;
+
+	/* Enable I2C slave */
+	cdns_i2c_set_mode(CDNS_I2C_MODE_SLAVE, id);
+
+	return 0;
+}
+
+static int cdns_unreg_slave(struct i2c_client *slave)
+{
+	struct cdns_i2c *id =3D container_of(slave->adapter, struct cdns_i2c,
+									adap);
+
+	pm_runtime_put(id->dev);
+
+	/* Remove slave information */
+	id->slave =3D NULL;
+
+	/* Enable I2C master */
+	cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);
+
+	return 0;
 }
+#endif
=20
 static const struct i2c_algorithm cdns_i2c_algo =3D {
 	.master_xfer	=3D cdns_i2c_master_xfer,
 	.functionality	=3D cdns_i2c_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave	=3D cdns_reg_slave,
+	.unreg_slave	=3D cdns_unreg_slave,
+#endif
 };
=20
 /**
@@ -750,6 +1041,8 @@ static int cdns_i2c_setclk(unsigned long clk_in, str=
uct cdns_i2c *id)
 	ctrl_reg |=3D ((div_a << CDNS_I2C_CR_DIVA_SHIFT) |
 			(div_b << CDNS_I2C_CR_DIVB_SHIFT));
 	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
+	id->ctrl_reg_diva_divb =3D ctrl_reg & (CDNS_I2C_CR_DIVA_MASK |
+				 CDNS_I2C_CR_DIVB_MASK);
=20
 	return 0;
 }
@@ -943,8 +1236,12 @@ static int cdns_i2c_probe(struct platform_device *p=
dev)
 	if (ret || (id->i2c_clk > CDNS_I2C_SPEED_MAX))
 		id->i2c_clk =3D CDNS_I2C_SPEED_DEFAULT;
=20
-	cdns_i2c_writereg(CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS=
,
-			  CDNS_I2C_CR_OFFSET);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* Set initial mode to master */
+	id->dev_mode =3D CDNS_I2C_MODE_MASTER;
+	id->slave_state =3D CDNS_I2C_SLAVE_STATE_IDLE;
+#endif
+	cdns_i2c_writereg(CDNS_I2C_CR_MASTER_EN_MASK, CDNS_I2C_CR_OFFSET);
=20
 	ret =3D cdns_i2c_setclk(id->input_clk, id);
 	if (ret) {
--=20
2.24.0

