Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C451782B12
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 16:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjHUOBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 10:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbjHUOBP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 10:01:15 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A1BBE;
        Mon, 21 Aug 2023 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692626467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=vxOeAs0TTJcHC+u1HVYw8kARLLVZ603Ec+Vq14w/hrg=;
        b=gAT20CAtvQ5CtYG8QDEh2Q7wodnStTLc/BvlOEq6QXCKjYsjFHgdz8RJNWa2WCyzymp63g
        MF43PrAAqM/TUhZOE7qeS72/ioU1FEL+k6CYNOBc61+GjSuwJYyVha88FCgU7KUEnuvKCz
        fX1T1HymDd2ItCcUcomrBfX1AWsXyFI=
Received: from junon.lin.mbt.kalray.eu (<unknown> [217.181.231.53])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 5dbcc4ca (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Mon, 21 Aug 2023 14:01:07 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: [PATCH v2] i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low
Date:   Mon, 21 Aug 2023 16:01:03 +0200
Message-Id: <20230821140103.5272-1-yann@sionneau.net>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yann Sionneau <ysionneau@kalray.eu>

The DesignWare IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
parameter.
In this case, when the TX FIFO gets empty and the last command didn't have
the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
a new command is pushed into the TX FIFO or the transfer is aborted.

When the controller is holding SCL low, it cannot be disabled.
The transfer must first be aborted.
Also, the bus recovery won't work because SCL is held low by the master.

Check if the master is holding SCL low in __i2c_dw_disable() before trying
to disable the controller. If SCL is held low, an abort is initiated.
When the abort is done, then proceed with disabling the controller.

This whole situation can happen for instance during SMBus read data block
if the slave just responds with "byte count == 0".
This puts the driver in an unrecoverable state, because the controller is
holding SCL low and the current __i2c_dw_disable() procedure is not
working. In this situation only a SoC reset can fix the i2c bus.

Co-developed-by: Jonathan Borne <jborne@kalray.eu>
Signed-off-by: Jonathan Borne <jborne@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
V1 -> V2:
* use reverse christmas tree order for variable declarations
* use unsigned int type instead of u32 for regmap_read
* give its own loop to the abort procedure with its own timeout
* print an error message if the abort never finishes during the timeout
* rename the timeout variable for the controller disabling loop
* with the usleep_range(10, 20) it takes only 1 loop iteration.
Without it takes 75 iterations and with udelay(1) it takes 16
loop iterations.


 drivers/i2c/busses/i2c-designware-common.c | 27 ++++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h   |  3 +++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 9f8574320eb2..2e46aa398f4e 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -438,9 +438,32 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
-	int timeout = 100;
+	unsigned int raw_intr_stats;
+	bool abort_done = false;
+	int abort_timeout = 100;
+	int dis_timeout = 100;
+	unsigned int enable;
+	bool abort_needed;
 	u32 status;
 
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
+	regmap_read(dev->map, DW_IC_ENABLE, &enable);
+
+	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
+
+	if (abort_needed) {
+		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
+
+		do {
+			regmap_read(dev->map, DW_IC_ENABLE, &enable);
+			abort_done = !(enable & DW_IC_ENABLE_ABORT);
+			usleep_range(10, 20);
+		} while (!abort_done && abort_timeout--);
+
+		if (!abort_done)
+			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
+	}
+
 	do {
 		__i2c_dw_disable_nowait(dev);
 		/*
@@ -457,7 +480,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * 25us) as described in the DesignWare I2C databook.
 		 */
 		usleep_range(25, 250);
-	} while (timeout--);
+	} while (dis_timeout--);
 
 	dev_warn(dev->dev, "timeout in disabling adapter\n");
 }
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 19ae23575945..dcd9bd9ee00f 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -98,6 +98,7 @@
 #define DW_IC_INTR_START_DET	BIT(10)
 #define DW_IC_INTR_GEN_CALL	BIT(11)
 #define DW_IC_INTR_RESTART_DET	BIT(12)
+#define DW_IC_INTR_MST_ON_HOLD	BIT(13)
 
 #define DW_IC_INTR_DEFAULT_MASK		(DW_IC_INTR_RX_FULL | \
 					 DW_IC_INTR_TX_ABRT | \
@@ -109,6 +110,8 @@
 					 DW_IC_INTR_RX_UNDER | \
 					 DW_IC_INTR_RD_REQ)
 
+#define DW_IC_ENABLE_ABORT		BIT(1)
+
 #define DW_IC_STATUS_ACTIVITY		BIT(0)
 #define DW_IC_STATUS_TFE		BIT(2)
 #define DW_IC_STATUS_MASTER_ACTIVITY	BIT(5)
-- 
2.17.1

