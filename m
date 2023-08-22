Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F89783CEA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 11:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbjHVJ3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 05:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234324AbjHVJ3b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 05:29:31 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613F2CCD;
        Tue, 22 Aug 2023 02:29:27 -0700 (PDT)
Received: from junon.lin.mbt.kalray.eu (<unknown> [217.181.231.53])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 901dd392 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 22 Aug 2023 09:02:45 +0000 (UTC)
From:   Yann Sionneau <ysionneau@kalray.eu>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: [PATCH v3] i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low
Date:   Tue, 22 Aug 2023 11:02:33 +0200
Message-Id: <20230822090233.14885-1-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_FAIL,SPF_HELO_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
V2 -> V3:
* do not rename timeout variable for disabling loop
in order to ease backports
* replace abort loop with regmap_read_poll_timeout()
* remove extra empty line.

V1 -> V2:
* use reverse christmas tree order for variable declarations
* use unsigned int type instead of u32 for regmap_read
* give its own loop to the abort procedure with its own timeout
* print an error message if the abort never finishes during the timeout
* rename the timeout variable for the controller disabling loop
* with the usleep_range(10, 20) it takes only 1 loop iteration.
Without it takes 75 iterations and with udelay(1) it takes 16
loop iterations.

 drivers/i2c/busses/i2c-designware-common.c | 17 +++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 9f8574320eb2..0cd0f85e1350 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -438,8 +438,25 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
+	unsigned int raw_intr_stats;
+	unsigned int enable;
 	int timeout = 100;
+	bool abort_needed;
 	u32 status;
+	int ret;
+
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
+	regmap_read(dev->map, DW_IC_ENABLE, &enable);
+
+	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
+	if (abort_needed) {
+		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
+		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
+					       !(enable & DW_IC_ENABLE_ABORT), 10,
+					       100);
+		if (ret)
+			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
+	}
 
 	do {
 		__i2c_dw_disable_nowait(dev);
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

