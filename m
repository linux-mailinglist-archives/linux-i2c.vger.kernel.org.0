Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D612A23AF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Nov 2020 04:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgKBDzQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Nov 2020 22:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727805AbgKBDzP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Nov 2020 22:55:15 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DBAC061A04
        for <linux-i2c@vger.kernel.org>; Sun,  1 Nov 2020 19:55:15 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id o3so9618414pgr.11
        for <linux-i2c@vger.kernel.org>; Sun, 01 Nov 2020 19:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3F36bxg6LI1uT97DjHNWbeMZQl1FEDiKF0JQ8LQ89q4=;
        b=N8yEzbr76FLBNOnd9ME4WqXfnNOA81bLnhAPnE4PgOmU6Wu+Og361vaz2WPLlMyc6f
         SXSgX4B/cYJm807ydYjR02OdlI3UxM5uHWgiMEr9k3H0uVYHSiVfIhsJZ8EfcVgCAM/u
         GiVyRBBLFkIpSwRq98CA90lTtQ7gdVr7Qhfm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3F36bxg6LI1uT97DjHNWbeMZQl1FEDiKF0JQ8LQ89q4=;
        b=MIqwqoPbJAoO2LBwzxVWfannftqBHQ1lGphw974sCWdagNwhDwxNsJ95GMuP7TXOB/
         tWJDHRzqup7Lea3wWFwTTJk5EvWYjbRz3G2nFDJVe9Mm9ApqkPm1lBted5c43Uqx4Evj
         i2AP1s9xRhIXCCrfTlSRwmlixDRbMJ4FPLHtk3HUFAKJq82Nvi1j/Mopj2ZX9o8QYl5U
         j9xmYtRpsnpcUIbKjNeWIb2uI2nw1MgBHKi+3Dxi2EH3SgObFxcExVznu+ZD1EurZOC8
         U9lfI/B6/2w3kYgYDUM1xw5vWSDVlfcvMY95s64L63mschgJfridNuexBQAolcPaqgUi
         JlZw==
X-Gm-Message-State: AOAM533Evz8BE49Up8NO5w9x6aA+gYue9ESWGoObRzGLmqXmOfjapFap
        2vbTudMd904ZQ1ICESGRYCKXNg==
X-Google-Smtp-Source: ABdhPJxy4Qfc7cAoQ6sk9ClfnX368ToyQ1BBz5/6hFmt1hgk3l4zPGN03tyfsDgru33gY51HcGIoqA==
X-Received: by 2002:a63:6585:: with SMTP id z127mr554352pgb.210.1604289315124;
        Sun, 01 Nov 2020 19:55:15 -0800 (PST)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id y5sm5655711pfc.165.2020.11.01.19.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 19:55:14 -0800 (PST)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v3 5/6] i2c: iproc: handle master read request
Date:   Mon,  2 Nov 2020 09:24:32 +0530
Message-Id: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102035433.6774-1-rayagonda.kokatanur@broadcom.com>
References: <20201102035433.6774-1-rayagonda.kokatanur@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000c654e105b317b6d0"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000c654e105b317b6d0

Handle single or multi byte master read request with or without
repeated start.

Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 215 +++++++++++++++++++++++------
 1 file changed, 170 insertions(+), 45 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 7a235f9f5884..22e04055b447 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -160,6 +160,11 @@
 
 #define IE_S_ALL_INTERRUPT_SHIFT     21
 #define IE_S_ALL_INTERRUPT_MASK      0x3f
+/*
+ * It takes ~18us to reading 10bytes of data, hence to keep tasklet
+ * running for less time, max slave read per tasklet is set to 10 bytes.
+ */
+#define MAX_SLAVE_RX_PER_INT         10
 
 enum i2c_slave_read_status {
 	I2C_SLAVE_RX_FIFO_EMPTY = 0,
@@ -206,8 +211,18 @@ struct bcm_iproc_i2c_dev {
 	/* bytes that have been read */
 	unsigned int rx_bytes;
 	unsigned int thld_bytes;
+
+	bool slave_rx_only;
+	bool rx_start_rcvd;
+	bool slave_read_complete;
+	u32 tx_underrun;
+	u32 slave_int_mask;
+	struct tasklet_struct slave_rx_tasklet;
 };
 
+/* tasklet to process slave rx data */
+static void slave_rx_tasklet_fn(unsigned long);
+
 /*
  * Can be expanded in the future if more interrupt status bits are utilized
  */
@@ -261,6 +276,7 @@ static void bcm_iproc_i2c_slave_init(
 {
 	u32 val;
 
+	iproc_i2c->tx_underrun = 0;
 	if (need_reset) {
 		/* put controller in reset */
 		val = iproc_i2c_rd_reg(iproc_i2c, CFG_OFFSET);
@@ -297,8 +313,11 @@ static void bcm_iproc_i2c_slave_init(
 
 	/* Enable interrupt register to indicate a valid byte in receive fifo */
 	val = BIT(IE_S_RX_EVENT_SHIFT);
+	/* Enable interrupt register to indicate a Master read transaction */
+	val |= BIT(IE_S_RD_EVENT_SHIFT);
 	/* Enable interrupt register for the Slave BUSY command */
 	val |= BIT(IE_S_START_BUSY_SHIFT);
+	iproc_i2c->slave_int_mask = val;
 	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
 }
 
@@ -324,76 +343,176 @@ static void bcm_iproc_i2c_check_slave_status(
 	}
 }
 
-static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
-				    u32 status)
+static void bcm_iproc_i2c_slave_read(struct bcm_iproc_i2c_dev *iproc_i2c)
 {
+	u8 rx_data, rx_status;
+	u32 rx_bytes = 0;
 	u32 val;
-	u8 value, rx_status;
 
-	/* Slave RX byte receive */
-	if (status & BIT(IS_S_RX_EVENT_SHIFT)) {
+	while (rx_bytes < MAX_SLAVE_RX_PER_INT) {
 		val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
 		rx_status = (val >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
-		if (rx_status == I2C_SLAVE_RX_START) {
-			/* Start of SMBUS for Master write */
-			i2c_slave_event(iproc_i2c->slave,
-					I2C_SLAVE_WRITE_REQUESTED, &value);
+		rx_data = ((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
 
-			val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
-			value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
+		if (rx_status == I2C_SLAVE_RX_START) {
+			/* Start of SMBUS Master write */
 			i2c_slave_event(iproc_i2c->slave,
-					I2C_SLAVE_WRITE_RECEIVED, &value);
-		} else if (status & BIT(IS_S_RD_EVENT_SHIFT)) {
-			/* Start of SMBUS for Master Read */
+					I2C_SLAVE_WRITE_REQUESTED, &rx_data);
+			iproc_i2c->rx_start_rcvd = true;
+			iproc_i2c->slave_read_complete = false;
+		} else if (rx_status == I2C_SLAVE_RX_DATA &&
+			   iproc_i2c->rx_start_rcvd) {
+			/* Middle of SMBUS Master write */
 			i2c_slave_event(iproc_i2c->slave,
-					I2C_SLAVE_READ_REQUESTED, &value);
-			iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
+					I2C_SLAVE_WRITE_RECEIVED, &rx_data);
+		} else if (rx_status == I2C_SLAVE_RX_END &&
+			   iproc_i2c->rx_start_rcvd) {
+			/* End of SMBUS Master write */
+			if (iproc_i2c->slave_rx_only)
+				i2c_slave_event(iproc_i2c->slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						&rx_data);
+
+			i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP,
+					&rx_data);
+		} else if (rx_status == I2C_SLAVE_RX_FIFO_EMPTY) {
+			iproc_i2c->rx_start_rcvd = false;
+			iproc_i2c->slave_read_complete = true;
+			break;
+		}
 
-			val = BIT(S_CMD_START_BUSY_SHIFT);
-			iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
+		rx_bytes++;
+	}
+}
 
-			/*
-			 * Enable interrupt for TX FIFO becomes empty and
-			 * less than PKT_LENGTH bytes were output on the SMBUS
-			 */
-			val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
-			val |= BIT(IE_S_TX_UNDERRUN_SHIFT);
-			iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
-		} else {
-			/* Master write other than start */
-			value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
+static void slave_rx_tasklet_fn(unsigned long data)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c = (struct bcm_iproc_i2c_dev *)data;
+	u32 int_clr;
+
+	bcm_iproc_i2c_slave_read(iproc_i2c);
+
+	/* clear pending IS_S_RX_EVENT_SHIFT interrupt */
+	int_clr = BIT(IS_S_RX_EVENT_SHIFT);
+
+	if (!iproc_i2c->slave_rx_only && iproc_i2c->slave_read_complete) {
+		/*
+		 * In case of single byte master-read request,
+		 * IS_S_TX_UNDERRUN_SHIFT event is generated before
+		 * IS_S_START_BUSY_SHIFT event. Hence start slave data send
+		 * from first IS_S_TX_UNDERRUN_SHIFT event.
+		 *
+		 * This means don't send any data from slave when
+		 * IS_S_RD_EVENT_SHIFT event is generated else it will increment
+		 * eeprom or other backend slave driver read pointer twice.
+		 */
+		iproc_i2c->tx_underrun = 0;
+		iproc_i2c->slave_int_mask |= BIT(IE_S_TX_UNDERRUN_SHIFT);
+
+		/* clear IS_S_RD_EVENT_SHIFT interrupt */
+		int_clr |= BIT(IS_S_RD_EVENT_SHIFT);
+	}
+
+	/* clear slave interrupt */
+	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, int_clr);
+	/* enable slave interrupts */
+	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, iproc_i2c->slave_int_mask);
+}
+
+static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
+				    u32 status)
+{
+	u32 val;
+	u8 value;
+
+	/*
+	 * Slave events in case of master-write, master-write-read and,
+	 * master-read
+	 *
+	 * Master-write     : only IS_S_RX_EVENT_SHIFT event
+	 * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
+	 *                    events
+	 * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
+	 *                    events or only IS_S_RD_EVENT_SHIFT
+	 */
+	if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
+	    status & BIT(IS_S_RD_EVENT_SHIFT)) {
+		/* disable slave interrupts */
+		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
+		val &= ~iproc_i2c->slave_int_mask;
+		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
+
+		if (status & BIT(IS_S_RD_EVENT_SHIFT))
+			/* Master-write-read request */
+			iproc_i2c->slave_rx_only = false;
+		else
+			/* Master-write request only */
+			iproc_i2c->slave_rx_only = true;
+
+		/* schedule tasklet to read data later */
+		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
+
+		/* clear only IS_S_RX_EVENT_SHIFT interrupt */
+		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
+				 BIT(IS_S_RX_EVENT_SHIFT));
+	}
+
+	if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
+		iproc_i2c->tx_underrun++;
+		if (iproc_i2c->tx_underrun == 1)
+			/* Start of SMBUS for Master Read */
 			i2c_slave_event(iproc_i2c->slave,
-					I2C_SLAVE_WRITE_RECEIVED, &value);
-			if (rx_status == I2C_SLAVE_RX_END)
-				i2c_slave_event(iproc_i2c->slave,
-						I2C_SLAVE_STOP, &value);
-		}
-	} else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
-		/* Master read other than start */
-		i2c_slave_event(iproc_i2c->slave,
-				I2C_SLAVE_READ_PROCESSED, &value);
+					I2C_SLAVE_READ_REQUESTED,
+					&value);
+		else
+			/* Master read other than start */
+			i2c_slave_event(iproc_i2c->slave,
+					I2C_SLAVE_READ_PROCESSED,
+					&value);
 
 		iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
+		/* start transfer */
 		val = BIT(S_CMD_START_BUSY_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
+
+		/* clear interrupt */
+		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
+				 BIT(IS_S_TX_UNDERRUN_SHIFT));
 	}
 
-	/* Stop */
+	/* Stop received from master in case of master read transaction */
 	if (status & BIT(IS_S_START_BUSY_SHIFT)) {
-		i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP, &value);
 		/*
 		 * Disable interrupt for TX FIFO becomes empty and
 		 * less than PKT_LENGTH bytes were output on the SMBUS
 		 */
-		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
-		val &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
-		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
+		iproc_i2c->slave_int_mask &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
+		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET,
+				 iproc_i2c->slave_int_mask);
+
+		/* End of SMBUS for Master Read */
+		val = BIT(S_TX_WR_STATUS_SHIFT);
+		iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, val);
+
+		val = BIT(S_CMD_START_BUSY_SHIFT);
+		iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
+
+		/* flush TX FIFOs */
+		val = iproc_i2c_rd_reg(iproc_i2c, S_FIFO_CTRL_OFFSET);
+		val |= (BIT(S_FIFO_TX_FLUSH_SHIFT));
+		iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, val);
+
+		i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP, &value);
+
+		/* clear interrupt */
+		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
+				 BIT(IS_S_START_BUSY_SHIFT));
 	}
 
-	/* clear interrupt status */
-	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, status);
+	/* check slave transmit status only if slave is transmitting */
+	if (!iproc_i2c->slave_rx_only)
+		bcm_iproc_i2c_check_slave_status(iproc_i2c);
 
-	bcm_iproc_i2c_check_slave_status(iproc_i2c);
 	return true;
 }
 
@@ -1074,6 +1193,10 @@ static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
 		return -EAFNOSUPPORT;
 
 	iproc_i2c->slave = slave;
+
+	tasklet_init(&iproc_i2c->slave_rx_tasklet, slave_rx_tasklet_fn,
+		     (unsigned long)iproc_i2c);
+
 	bcm_iproc_i2c_slave_init(iproc_i2c, false);
 	return 0;
 }
@@ -1094,6 +1217,8 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
 			IE_S_ALL_INTERRUPT_SHIFT);
 	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
 
+	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
+
 	/* Erase the slave address programmed */
 	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
 	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
-- 
2.17.1


--000000000000c654e105b317b6d0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
xVUYGnc0GLrYeHC2X4wJbUsgi+UFM/rVW0RKe5Sg4xmLXWc/rBhXDBVPeFVdN2dYsk5MyDRM/fXj
cAA+xTX+SQGoND8CAwEAAaOCAdcwggHTMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEw
gY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVy
c29uYWxzaWduMnNoYTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFs
c2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNV
HRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJz
b25hbHNpZ24yc2hhMmczLmNybDArBgNVHREEJDAigSByYXlhZ29uZGEua29rYXRhbnVyQGJyb2Fk
Y29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJ
nXsLYTAdBgNVHQ4EFgQU1rE7oQJ7FiSTADFOqokePoGwIq4wDQYJKoZIhvcNAQELBQADggEBAD8I
VcITGu1E61LQLR1zygqFw8ByKPgiiprMuQB74Viskl7pAZigzYJB8H3Mpd2ljve+GRo8yvbBC76r
Gi5WdS06XI5vuImDJ2g6QUt754rj7xEYftM5Gy9ZMslKNvSiPPh1/ACx5w7ecD1ZK0YLMKGATeBD
XybduRFIEPZBAjgJ5LOYT2ax3ZesfAkan1XJ97yLA93edgTTO2cbUAADTIMFWm4lI/e14wdGmK0I
FtqJWw6DATg5ePiAAn+S0JoIL1xqKsZi2ioNqm02QMFb7RbB3yEGb/7ZLAGcPW666o5GSLsUnPPq
YOfL/3X6tVfGeoi3IgfI+z76/lXk8vOQzQQxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2ln
biAyIENBIC0gU0hBMjU2IC0gRzMCDDw+ri+StHzo6PJZ/DANBglghkgBZQMEAgEFAKCB1DAvBgkq
hkiG9w0BCQQxIgQgpZ3jR9eWoi9QZBdWA2kIBoSCYZBNsorqh2AOUP/3UBswGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTAyMDM1NTE1WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJQF
7nPyEkyw/PBs2WQONmUfz1BVh0xpTg+5+ZWmPC1dYagi1B3zLqPAHJ+7XpgUTSbC6m4Jm13pnAHT
9X8RH5RIrbhQE+WYwFByGz3Hz5ux0I3tjrzveQsKx4UOlcnKOkKTkkML1FHaXUukoJwqHX3YThoE
Uir3hmDBQEEiRXdonDUn1KRpSxcaAe0dVJ8H/yhGIJitIOsMRNKro/l7SDPHb9ZLQFB2mGQbx4+S
otcF/m2cJ+n0lsVX1UVtPNUE+cQtOogOMtf1076JY/VvJoiegwTD8XwCtCXlfgbEI4LDEFaEyNDB
Zp43BnklcMrp6bsVtbwIWgP51yLYIsBUOb8=
--000000000000c654e105b317b6d0--
