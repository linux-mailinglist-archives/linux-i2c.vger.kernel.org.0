Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE98B1BA764
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgD0PJS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727881AbgD0PJR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:17 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD70C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=95ygddAoYoWuDNWARwjHegVZydab/60DgQPw3i6r0Ko=; b=MSsra6bNvMS0TpVtWrU+WL7jaj
        S95UApZfesEaCvqDSrUEfWhE55k4IHKF1Oxu06VLindKF3GZlgyfeZHX4MK9NWQkzD7znNPX92D4q
        kMUCW/VVdAO2FEWVdZOJy8QQROoa79p1x9Izi2SL05DTUY09hlI3gGuT1vdCECFMfQFuo2aPCJ/YH
        XwuOoXY/M9y9VwxYXudTwUCB5IvxSyKm+EMSu3dfqD7H7BYWeKwNoGEycYqQX2wfUXeg5Y8BAxo6Z
        Ugx5FVRyd9I/l2+VWaOhhuB2ZwDq0B6YkX9KoxCQPhxZWm8QL2IxezYSyOK9DHGJdJJuHufz0zZqa
        TxZx8nSQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:54316 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nh-0003YM-VJ; Mon, 27 Apr 2020 16:09:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nh-0001rX-EN; Mon, 27 Apr 2020 16:09:13 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 08/12] i2c: pxa: move private definitions to i2c-pxa.c
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5Nh-0001rX-EN@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:09:13 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move driver-private definitions out of the i2c-pxa.h platform data
header file into the driver itself. Nothing outside of the driver
makes use of these constants.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c          | 43 ++++++++++++++++++++++++
 include/linux/platform_data/i2c-pxa.h | 48 ---------------------------
 2 files changed, 43 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 91e0cccb3707..6ceb31279c72 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -85,6 +85,49 @@
 #define IWCR_HS_CNT2_SHIFT	10
 #define IWCR_HS_CNT2_MASK	(0x1F << IWCR_HS_CNT2_SHIFT)
 
+/* need a longer timeout if we're dealing with the fact we may well be
+ * looking at a multi-master environment
+ */
+#define DEF_TIMEOUT             32
+
+#define BUS_ERROR               (-EREMOTEIO)
+#define XFER_NAKED              (-ECONNREFUSED)
+#define I2C_RETRY               (-2000) /* an error has occurred retry transmit */
+
+/* ICR initialize bit values
+ *
+ * 15 FM     0 (100 kHz operation)
+ * 14 UR     0 (No unit reset)
+ * 13 SADIE  0 (Disables the unit from interrupting on slave addresses
+ *              matching its slave address)
+ * 12 ALDIE  0 (Disables the unit from interrupt when it loses arbitration
+ *              in master mode)
+ * 11 SSDIE  0 (Disables interrupts from a slave stop detected, in slave mode)
+ * 10 BEIE   1 (Enable interrupts from detected bus errors, no ACK sent)
+ *  9 IRFIE  1 (Enable interrupts from full buffer received)
+ *  8 ITEIE  1 (Enables the I2C unit to interrupt when transmit buffer empty)
+ *  7 GCD    1 (Disables i2c unit response to general call messages as a slave)
+ *  6 IUE    0 (Disable unit until we change settings)
+ *  5 SCLE   1 (Enables the i2c clock output for master mode (drives SCL)
+ *  4 MA     0 (Only send stop with the ICR stop bit)
+ *  3 TB     0 (We are not transmitting a byte initially)
+ *  2 ACKNAK 0 (Send an ACK after the unit receives a byte)
+ *  1 STOP   0 (Do not send a STOP)
+ *  0 START  0 (Do not send a START)
+ */
+#define I2C_ICR_INIT	(ICR_BEIE | ICR_IRFIE | ICR_ITEIE | ICR_GCD | ICR_SCLE)
+
+/* I2C status register init values
+ *
+ * 10 BED    1 (Clear bus error detected)
+ *  9 SAD    1 (Clear slave address detected)
+ *  7 IRF    1 (Clear IDBR Receive Full)
+ *  6 ITE    1 (Clear IDBR Transmit Empty)
+ *  5 ALD    1 (Clear Arbitration Loss Detected)
+ *  4 SSD    1 (Clear Slave Stop Detected)
+ */
+#define I2C_ISR_INIT	0x7FF  /* status register init */
+
 struct pxa_reg_layout {
 	u32 ibmr;
 	u32 idbr;
diff --git a/include/linux/platform_data/i2c-pxa.h b/include/linux/platform_data/i2c-pxa.h
index 6a9b28399b39..24953981bd9f 100644
--- a/include/linux/platform_data/i2c-pxa.h
+++ b/include/linux/platform_data/i2c-pxa.h
@@ -7,54 +7,6 @@
 #ifndef _I2C_PXA_H_
 #define _I2C_PXA_H_
 
-#if 0
-#define DEF_TIMEOUT             3
-#else
-/* need a longer timeout if we're dealing with the fact we may well be
- * looking at a multi-master environment
-*/
-#define DEF_TIMEOUT             32
-#endif
-
-#define BUS_ERROR               (-EREMOTEIO)
-#define XFER_NAKED              (-ECONNREFUSED)
-#define I2C_RETRY               (-2000) /* an error has occurred retry transmit */
-
-/* ICR initialize bit values
-*
-*  15. FM       0 (100 Khz operation)
-*  14. UR       0 (No unit reset)
-*  13. SADIE    0 (Disables the unit from interrupting on slave addresses
-*                                       matching its slave address)
-*  12. ALDIE    0 (Disables the unit from interrupt when it loses arbitration
-*                                       in master mode)
-*  11. SSDIE    0 (Disables interrupts from a slave stop detected, in slave mode)
-*  10. BEIE     1 (Enable interrupts from detected bus errors, no ACK sent)
-*  9.  IRFIE    1 (Enable interrupts from full buffer received)
-*  8.  ITEIE    1 (Enables the I2C unit to interrupt when transmit buffer empty)
-*  7.  GCD      1 (Disables i2c unit response to general call messages as a slave)
-*  6.  IUE      0 (Disable unit until we change settings)
-*  5.  SCLE     1 (Enables the i2c clock output for master mode (drives SCL)
-*  4.  MA       0 (Only send stop with the ICR stop bit)
-*  3.  TB       0 (We are not transmitting a byte initially)
-*  2.  ACKNAK   0 (Send an ACK after the unit receives a byte)
-*  1.  STOP     0 (Do not send a STOP)
-*  0.  START    0 (Do not send a START)
-*
-*/
-#define I2C_ICR_INIT	(ICR_BEIE | ICR_IRFIE | ICR_ITEIE | ICR_GCD | ICR_SCLE)
-
-/* I2C status register init values
- *
- * 10. BED      1 (Clear bus error detected)
- * 9.  SAD      1 (Clear slave address detected)
- * 7.  IRF      1 (Clear IDBR Receive Full)
- * 6.  ITE      1 (Clear IDBR Transmit Empty)
- * 5.  ALD      1 (Clear Arbitration Loss Detected)
- * 4.  SSD      1 (Clear Slave Stop Detected)
- */
-#define I2C_ISR_INIT	0x7FF  /* status register init */
-
 struct i2c_pxa_platform_data {
 	unsigned int		class;
 	unsigned int		use_pio :1;
-- 
2.20.1

