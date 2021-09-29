Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A5741BF15
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 08:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244327AbhI2GZK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 02:25:10 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:31905 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244320AbhI2GZK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 02:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1632896609; x=1664432609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+xWHsw01t2NaxZPyXk5r3foFcaGZrEMuYu0+ycZCxs=;
  b=WNZ+61fMlH+b8wbTQyPX42iJc/rKKXp3vLZfnw70wmxkTx69q5NviRDb
   Xz5d5oEHPr4X6xj+x/G50BmoIJyqGt6JIr6w9QkUwhxTUq/9SeEVbd94M
   OXmrSTlyM+Vl9wSZJmNXbStkF0/++46wv2TIXE3OFg4Xk+G8A7HdHtzj3
   PF9XgO2IzeONz3qBJAau46BJSePFK2KhwaY+BPdUk5kVyxrZBKpipg52W
   OpH8URHBBKuhQ45mIiezMYECgTolyMPII3zJM9/9cjZrJJfU19tvmmKoC
   4SLHKzylpukEnUj1ONneFmOOVZMifneeZc1TAfvGOeAZEU0JRpM0+5JA4
   g==;
IronPort-SDR: Q18k2Ip1dtP/QGjrrxdDaqWWnnvVc01VDNgth+diS018/Zh8ZiT46dcli0KclcbW2DH9koCqqW
 s9MZGSO7MhMWsqmk8WnCj2XCyRduHEBiocZilKln1R/Rpz/uQuwHwjgnYF7uSai6qXkrQ115qy
 rBp4Rs82TW1t9XLZnm7bU1fLdsBS/kijIho4YzR8TqoMuLeOuajk7WXOQDr2krznsoaMX7egw3
 FPv39mwaezLXPs8BX2Tl4D/GQMJulGSENUb4Fcvltm2uoG7vRfpvzhOluofpi1FRw66QSfJG5K
 PybzSdd2J9fERQytDYth3gKa
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; 
   d="scan'208";a="138362179"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2021 23:23:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Sep 2021 23:23:28 -0700
Received: from CHE-LT-I17972LX.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 28 Sep 2021 23:23:22 -0700
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <digetx@gmail.com>, <treding@nvidia.com>,
        <mirq-linux@rere.qmqm.pl>, <s.shtylyov@omp.ru>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <UNGLinuxDriver@microchip.com>
Subject: [PATCH v1 2/2] i2c:busses:Read and Write routines for PCI1XXXX I2C module
Date:   Wed, 29 Sep 2021 11:52:15 +0530
Message-ID: <20210929062215.23905-3-LakshmiPraveen.Kopparthi@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Read and Write callbacks for PCI1XXXX I2C adapter is added.

Signed-off-by: LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 485 +++++++++++++++++++++++++
 1 file changed, 485 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index 5b51f20fe98e..0ac05a65a3e4 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -232,6 +232,147 @@ struct pci1xxxx_i2c {
 	u32 flags;
 };
 
+static void pci1xxxx_i2c_send_start(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CMD_REG_OFF1);
+	regval |= SMB_CORE_CMD_START;
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF1));
+}
+
+static void pci1xxxx_i2c_send_stop(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CMD_REG_OFF1);
+	regval |= SMB_CORE_CMD_STOP;
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF1));
+}
+
+/*
+ * when accessing the core control reg, we should not do a read modified write
+ * as there are write '1' to clear bits. Hence do a write with the specific
+ * bits that needs to be set
+ */
+static void pci1xxxx_i2c_set_clear_FW_ACK(struct pci1xxxx_i2c *i2c, bool set)
+{
+	u8 regval;
+
+	if (set)
+		regval = SMB_CORE_CTRL_FW_ACK | SMB_CORE_CTRL_ESO;
+	else
+		regval = SMB_CORE_CTRL_ESO;
+
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CTRL_REG_OFF));
+}
+
+static void pci1xxxx_i2c_buffer_write(struct pci1xxxx_i2c *i2c, u8 slaveaddr,
+				      u8 transferlen, unsigned char *buf)
+{
+	if (slaveaddr) {
+		writeb(slaveaddr, i2c->i2c_base + SMBUS_MST_BUF);
+		if (buf)
+			memcpy_toio((i2c->i2c_base + SMBUS_MST_BUF + 1), buf, transferlen);
+	} else {
+		if (buf)
+			memcpy_toio((i2c->i2c_base + SMBUS_MST_BUF), buf, transferlen);
+	}
+}
+
+/*
+ * when accessing the core control reg, we should not do a read modified write
+ * as there are write '1' to clear bits. Hence do a write with the
+ * specific bits that needs to be set
+ */
+static void pci1xxxx_i2c_enable_ESO(struct pci1xxxx_i2c *i2c)
+{
+	writeb(SMB_CORE_CTRL_ESO, (i2c->i2c_base + SMB_CORE_CTRL_REG_OFF));
+}
+
+static void pci1xxxx_i2c_reset_counters(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMBUS_CONTROL_REG_OFF);
+	regval |= CTL_RESET_COUNTERS;
+	writeb(regval, (i2c->i2c_base + SMBUS_CONTROL_REG_OFF));
+}
+
+static void pci1xxxx_i2c_set_transfer_dir(struct pci1xxxx_i2c *i2c, u8 direction)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMBUS_CONTROL_REG_OFF);
+	if (direction == I2C_DIR_WRITE)
+		regval &= ~CTL_TRANSFER_DIR;
+	else
+		regval |= CTL_TRANSFER_DIR;
+
+	writeb(regval, (i2c->i2c_base + SMBUS_CONTROL_REG_OFF));
+}
+
+static void pci1xxxx_i2c_set_mcu_count(struct pci1xxxx_i2c *i2c, u8 count)
+{
+	writeb(count, (i2c->i2c_base + SMBUS_MCU_COUNTER_REG_OFF));
+}
+
+static void pci1xxxx_i2c_set_read_count(struct pci1xxxx_i2c *i2c, u8 readcount)
+{
+	writeb(readcount, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF3));
+}
+
+static void pci1xxxx_i2c_set_write_count(struct pci1xxxx_i2c *i2c, u8 writecount)
+{
+	writeb(writecount, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF2));
+}
+
+static void pci1xxxx_i2c_set_proceed(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CMD_REG_OFF0);
+	regval |= SMB_CORE_CMD_M_PROCEED;
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF0));
+}
+
+static void pci1xxxx_i2c_set_DMA_run(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMBUS_CONTROL_REG_OFF);
+	regval |= CTL_RUN;
+	writeb(regval, (i2c->i2c_base + SMBUS_CONTROL_REG_OFF));
+}
+
+static void pci1xxxx_i2c_set_mrun(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CMD_REG_OFF0);
+	regval |= SMB_CORE_CMD_M_RUN;
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF0));
+}
+
+static void pci1xxxx_i2c_start_DMA(struct pci1xxxx_i2c *i2c)
+{
+	pci1xxxx_i2c_set_DMA_run(i2c);
+	pci1xxxx_i2c_set_mrun(i2c);
+	pci1xxxx_i2c_set_proceed(i2c);
+}
+
+static void pci1xxxx_i2c_config_asr(struct pci1xxxx_i2c *i2c, bool enable)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CONFIG_REG1);
+	if (enable)
+		regval |= SMB_CONFIG1_ASR;
+	else
+		regval &= ~SMB_CONFIG1_ASR;
+	writeb(regval, i2c->i2c_base + SMB_CORE_CONFIG_REG1);
+}
+
 static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
 {
 	struct pci1xxxx_i2c *i2c = dev;
@@ -284,6 +425,47 @@ static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
 		return IRQ_NONE;
 }
 
+static void pci1xxxx_i2c_set_count(struct pci1xxxx_i2c *i2c, u8 mcucount,
+				   u8 writecount, u8 readcount)
+{
+	pci1xxxx_i2c_set_mcu_count(i2c, mcucount);
+	pci1xxxx_i2c_set_write_count(i2c, writecount);
+	pci1xxxx_i2c_set_read_count(i2c, readcount);
+}
+
+static void pci1xxxx_i2c_set_readm(struct pci1xxxx_i2c *i2c, bool enable)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CMD_REG_OFF1);
+	if (enable)
+		regval |= SMB_CORE_CMD_READM;
+	else
+		regval &= ~SMB_CORE_CMD_READM;
+
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF1));
+}
+
+static void pci1xxxx_ack_nw_layer_intr(struct pci1xxxx_i2c *i2c,
+				       u8 ack_intr_msk)
+{
+	writeb(ack_intr_msk, (i2c->i2c_base + SMBUS_INTR_STAT_REG_OFF));
+}
+
+static void pci1xxxx_config_nw_layer_intr(struct pci1xxxx_i2c *i2c,
+					  u8 intr_msk, bool enable)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMBUS_INTR_MSK_REG_OFF);
+	if (enable)
+		regval &= ~(intr_msk);
+	else
+		regval |= intr_msk;
+
+	writeb(regval, (i2c->i2c_base + SMBUS_INTR_MSK_REG_OFF));
+}
+
 static void pci1xxxx_i2c_config_padctrl(struct pci1xxxx_i2c *i2c, bool enable)
 {
 	u8 regval;
@@ -428,6 +610,308 @@ static void pci1xxxx_i2c_init(struct pci1xxxx_i2c *i2c)
 	pci1xxxx_i2c_configure_core_reg(i2c, true);
 }
 
+static void pci1xxxx_i2c_clear_flags(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+	/* Reset the internal buffer counters */
+	pci1xxxx_i2c_reset_counters(i2c);
+
+	/* Clear low level interrupts */
+	regval = (COMPLETION_MNAKX | COMPLETION_IDLE | COMPLETION_MDONE);
+	writeb(regval, i2c->i2c_base + SMB_CORE_COMPLETION_REG_OFF3);
+
+	reinit_completion(&i2c->i2c_xfer_done);
+	pci1xxxx_ack_nw_layer_intr(i2c, ALL_NW_LAYER_INTERRUPTS);
+
+	pci1xxxx_ack_high_level_intr(i2c, ALL_HIGH_LAYER_INTR);
+}
+
+static int pci1xxxx_i2c_read(struct pci1xxxx_i2c *i2c, u8 slaveaddr,
+			     unsigned char *buf, u16 total_len)
+{
+	unsigned long time_left;
+	u16 remainingbytes;
+	u8 transferlen;
+	int retval = 0;
+	u8 read_count;
+	u32 regval;
+	u16 count;
+
+	/* Enable I2C master by setting the ESO bit in the CONTROL REG */
+	pci1xxxx_i2c_enable_ESO(i2c);
+
+	pci1xxxx_i2c_clear_flags(i2c);
+
+	pci1xxxx_config_nw_layer_intr(i2c, INTR_MSK_DMA_TERM, true);
+
+	pci1xxxx_i2c_config_high_level_intr(i2c, (I2C_BUF_MSTR_INTR_MASK),
+					    true);
+
+	/*
+	 * The i2c transfer could be for more thatn 128 bytes. Our Core is
+	 * capable of only sending 128 at a time.
+	 * As for as the I2C read is concerned, initailly send the
+	 * read slave address along with the number of bytes to read in
+	 * ReadCount. After sending the salve address the interrupt
+	 * is generated. On seeing the ACK for the slave address, reverse the
+	 * buffer direction and run the DMA to initiate Read from slave
+	 */
+	for (count = 0; count < total_len; count += transferlen) {
+		/*
+		 * before start of any transaction clear the existing
+		 * START/STOP conditions
+		 */
+		writeb(0x00, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF1));
+
+		remainingbytes = total_len - count;
+
+		transferlen = min(remainingbytes, (u16)(SMBUS_MAST_BUF_MAX_SIZE));
+
+		/*
+		 * See if this is last chunk in the transaction. IN that case
+		 * send a STOP at the end.
+		 * Also in case of reads > BUF_SIZE, for the first read,
+		 * we should not send NACK for the last byte.
+		 * Hence a bit FW_ACK is set for those.
+		 * For the last chunk NACK should be sent.
+		 * Hence FW_ACK is cleared for that.
+		 * Send STOP only when I2C_FLAGS_STOP bit is set in the flags
+		 * and  only for the last transaction.
+		 */
+
+		if (transferlen < SMBUS_MAST_BUF_MAX_SIZE) {
+			if (i2c->flags & I2C_FLAGS_STOP) {
+				pci1xxxx_i2c_set_clear_FW_ACK(i2c, false);
+				pci1xxxx_i2c_send_stop(i2c);
+			} else {
+				pci1xxxx_i2c_set_clear_FW_ACK(i2c, true);
+			}
+		}
+
+		/* if it is the starting of the transaction send START */
+		if (count == 0) {
+			pci1xxxx_i2c_set_transfer_dir(i2c, I2C_DIR_WRITE);
+
+			pci1xxxx_i2c_send_start(i2c);
+
+			/* write I2c buffer with just the slave addr */
+			pci1xxxx_i2c_buffer_write(i2c, slaveaddr, 0, NULL);
+
+			/* Set the count. Readcount is the transfer bytes */
+			pci1xxxx_i2c_set_count(i2c, 1, 1, transferlen);
+
+			/*
+			 * Set the Auto_start_read bit so that the HW itself
+			 * will take care of the read phase.
+			 */
+
+			pci1xxxx_i2c_config_asr(i2c, true);
+
+			if (i2c->flags & I2C_FLAGS_SMB_BLK_READ)
+				pci1xxxx_i2c_set_readm(i2c, true);
+
+		} else {
+			/* Set the count */
+			pci1xxxx_i2c_set_count(i2c, 0, 0, transferlen);
+
+			pci1xxxx_i2c_config_asr(i2c, false);
+
+			pci1xxxx_i2c_clear_flags(i2c);
+
+			pci1xxxx_i2c_set_transfer_dir(i2c, I2C_DIR_READ);
+		}
+
+		/* Start the DMA */
+		pci1xxxx_i2c_start_DMA(i2c);
+
+		/* wait for the DMA_TERM interrupt */
+		time_left = wait_for_completion_timeout
+				(&i2c->i2c_xfer_done,
+				PCI1XXXX_I2C_TIMEOUT);
+		if (time_left == 0) {
+			/* Reset the I2C core to release the bus lock */
+			pci1xxxx_i2c_init(i2c);
+			retval = -ETIMEDOUT;
+			goto cleanup;
+		}
+
+		/* Read the completion reg to know the reason for DMA_TERM */
+		regval = readb(i2c->i2c_base + SMB_CORE_COMPLETION_REG_OFF3);
+		/* Slave did not respond */
+		if (regval & COMPLETION_MNAKX) {
+			writeb(COMPLETION_MNAKX, (i2c->i2c_base +
+					SMB_CORE_COMPLETION_REG_OFF3));
+			retval = -ETIMEDOUT;
+			goto cleanup;
+		}
+
+		if (i2c->flags & I2C_FLAGS_SMB_BLK_READ) {
+			buf[0] = readb(i2c->i2c_base +
+				      SMBUS_MST_BUF);
+			read_count = buf[0];
+			memcpy_fromio(&buf[1], (i2c->i2c_base +
+						SMBUS_MST_BUF + 1),
+						read_count);
+		} else {
+			memcpy_fromio(&buf[count], (i2c->i2c_base +
+						SMBUS_MST_BUF), transferlen);
+		}
+	}
+
+cleanup:
+	/* Disable all the interrupts */
+	pci1xxxx_config_nw_layer_intr(i2c, INTR_MSK_DMA_TERM, false);
+	pci1xxxx_i2c_config_high_level_intr(i2c, (I2C_BUF_MSTR_INTR_MASK),
+					    false);
+	pci1xxxx_i2c_config_asr(i2c, false);
+	return retval;
+}
+
+static int pci1xxxx_i2c_write(struct pci1xxxx_i2c *i2c, u8 slaveaddr,
+			      unsigned char *buf, u16 total_len)
+{
+	unsigned long time_left;
+	u16 remainingbytes;
+	u8 actualwritelen;
+	u8 transferlen;
+	int retval = 0;
+	u32 regval;
+	u16 count;
+
+	/* Enable I2C master by setting the ESO bit in the CONTROL REG */
+	pci1xxxx_i2c_enable_ESO(i2c);
+
+	/* Set the Buffer direction */
+	pci1xxxx_i2c_set_transfer_dir(i2c, I2C_DIR_WRITE);
+
+	pci1xxxx_config_nw_layer_intr(i2c, INTR_MSK_DMA_TERM, true);
+
+	pci1xxxx_i2c_config_high_level_intr(i2c, (I2C_BUF_MSTR_INTR_MASK),
+					    true);
+
+	/*
+	 * The i2c transfer could be for more thatn 128 bytes. Our Core is
+	 * capable of only sending 128 at a time.
+	 */
+	for (count = 0; count < total_len; count += transferlen) {
+		/*
+		 * before start of any transaction clear the existing
+		 * START/STOP conditions
+		 */
+		writeb(0x00, (i2c->i2c_base + SMB_CORE_CMD_REG_OFF1));
+
+		pci1xxxx_i2c_clear_flags(i2c);
+
+		remainingbytes = total_len - count;
+		/* if it is the starting of the transaction send START */
+		if (count == 0) {
+			pci1xxxx_i2c_send_start(i2c);
+
+			/* -1 for the slave address */
+			transferlen = min((u16)(SMBUS_MAST_BUF_MAX_SIZE - 1),
+					  remainingbytes);
+			pci1xxxx_i2c_buffer_write(i2c, slaveaddr,
+						  transferlen, &buf[count]);
+
+			/*
+			 * the actual number of bytes written on the I2C bus
+			 * is including the slave address
+			 */
+			actualwritelen = transferlen + 1;
+
+		} else {
+			transferlen = min((u16)(SMBUS_MAST_BUF_MAX_SIZE),
+					  remainingbytes);
+			pci1xxxx_i2c_buffer_write(i2c, 0x00, transferlen,
+						  &buf[count]);
+			actualwritelen = transferlen;
+		}
+
+		pci1xxxx_i2c_set_count(i2c, actualwritelen,
+				       actualwritelen, 0x00);
+
+		/*
+		 * Send STOP only when I2C_FLAGS_STOP bit is set in the flags and
+		 * only for the last transaction.
+		 */
+
+		if (remainingbytes <= transferlen && (i2c->flags &
+							I2C_FLAGS_STOP))
+			pci1xxxx_i2c_send_stop(i2c);
+
+		pci1xxxx_i2c_start_DMA(i2c);
+
+		/*
+		 * wait for the DMA_TERM interrupt and if the timer expires, it means
+		 * the transaction has failed due to some bus lock as we dint get
+		 * the interrupt
+		 */
+		time_left = wait_for_completion_timeout
+				(&i2c->i2c_xfer_done, PCI1XXXX_I2C_TIMEOUT);
+
+		if (time_left == 0) {
+			/* Reset the I2C core to release the bus lock */
+			pci1xxxx_i2c_init(i2c);
+			retval = -ETIMEDOUT;
+			goto cleanup;
+		}
+
+		regval = readb(i2c->i2c_base + SMB_CORE_COMPLETION_REG_OFF3);
+		if (regval & COMPLETION_MNAKX) {
+			writeb(COMPLETION_MNAKX, (i2c->i2c_base +
+						SMB_CORE_COMPLETION_REG_OFF3));
+			retval = -ETIMEDOUT;
+			goto cleanup;
+		}
+	}
+cleanup:
+	/* Disable all the interrupts */
+	pci1xxxx_config_nw_layer_intr(i2c, INTR_MSK_DMA_TERM, false);
+	pci1xxxx_i2c_config_high_level_intr(i2c, (I2C_BUF_MSTR_INTR_MASK),
+					    false);
+
+	return retval;
+}
+
+static int pci1xxxx_i2c_xfer(struct i2c_adapter *adap,
+			     struct i2c_msg *msgs, int num)
+{
+	struct pci1xxxx_i2c *i2c = i2c_get_adapdata(adap);
+	u8 slaveaddr;
+	int retval;
+	u32 i;
+
+	for (i = 0; i < num; i++) {
+		slaveaddr = i2c_8bit_addr_from_msg(&msgs[i]);
+
+		/*
+		 * Send STOP if it is the Last of the transfer or
+		 * if the I2C_M_STOP flag is set
+		 */
+		if ((i == (num - 1)) || (msgs[i].flags & I2C_M_STOP))
+			i2c->flags |= I2C_FLAGS_STOP;
+		else
+			i2c->flags &= ~I2C_FLAGS_STOP;
+
+		/* When the command is a block read command */
+		if (msgs[i].flags & I2C_M_RECV_LEN)
+			i2c->flags |= I2C_FLAGS_SMB_BLK_READ;
+		else
+			i2c->flags &= ~I2C_FLAGS_SMB_BLK_READ;
+
+		if (msgs[i].flags & I2C_M_RD)
+			retval = pci1xxxx_i2c_read(i2c, slaveaddr,
+						   msgs[i].buf, msgs[i].len);
+		else
+			retval = pci1xxxx_i2c_write(i2c, slaveaddr,
+						    msgs[i].buf, msgs[i].len);
+
+		if (retval < 0)
+			return retval;
+	}
+	return num;
+}
+
 /*
  * We could have used I2C_FUNC_SMBUS_EMUL but that includes
  * SMBUS_QUICK as well.We dnt support SMBUS_QUICK hence the
@@ -448,6 +932,7 @@ static u32 pci1xxxx_i2c_get_funcs(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm pci1xxxx_i2c_algo = {
+	.master_xfer = pci1xxxx_i2c_xfer,
 	.functionality = pci1xxxx_i2c_get_funcs,
 };
 
-- 
2.25.1

