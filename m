Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C28778FEE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 14:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbjHKMxO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 08:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHKMxN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 08:53:13 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797F9114;
        Fri, 11 Aug 2023 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1691757988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=CaLitFg0AQg0SHOtu12KE1t6WKRpx9J2tJDVn0wAGlQ=;
        b=yOzChHtAdLXsrrGyrh5FOxoWirMt8GAteFEMgiS35YA97tKuLkYXifA0gjKxWbU6Bvu2re
        elEWPXyHmH0kto3SmrFMss7Io21BOGrp3LNzjGGDkSnawlOMKeKrBgGTEGPj6KllAwNeD7
        HzzUaCzbln8aOaFHe1bqqSq7xlzFvUw=
Received: from junon.lin.mbt.kalray.eu (<unknown> [217.181.231.53])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 62fa6ae0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 11 Aug 2023 12:46:28 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: [PATCH 1/2] i2c: designware: fix __i2c_dw_disable in case master is holding SCL low
Date:   Fri, 11 Aug 2023 14:46:23 +0200
Message-Id: <20230811124624.12792-1-yann@sionneau.net>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yann Sionneau <ysionneau@kalray.eu>

The designware IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
parameter.
In which case, if the TX FIFO gets empty and the last command didn't have
the STOP bit (IC_DATA_CMD[9]), the dw_apb_i2c will hold SCL low until
a new command is pushed into the TX FIFO or the transfer is aborted.

When the dw_apb_i2c is holding SCL low, it cannot be disabled.
The transfer must first be aborted.
Also, the bus recover won't work because SCL is held low by the master.

This patch checks if the master is holding SCL low in __i2c_dw_disable
before trying to disable the IP.
If SCL is held low, an abort is initiated.
When the abort is done, the disabling can then proceed.

This whole situation can happen for instance during SMBUS read data block
if the slave just responds with "byte count == 0".
This puts the master in an unrecoverable state, holding SCL low and the
current __i2c_dw_disable procedure is not working. In this situation
only a Linux reboot can fix the i2c bus.

Co-developed-by: Jonathan Borne <jborne@kalray.eu>
Signed-off-by: Jonathan Borne <jborne@kalray.eu>
Tested-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
 drivers/i2c/busses/i2c-designware-common.c | 17 +++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 9f8574320eb2..744927b0c5af 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -440,8 +440,25 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
 	int timeout = 100;
 	u32 status;
+	u32 raw_intr_stats;
+	u32 enable;
+	bool abort_needed;
+	bool abort_done = false;
+
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
+	regmap_read(dev->map, DW_IC_ENABLE, &enable);
+
+	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
+	if (abort_needed)
+		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 
 	do {
+		if (abort_needed && !abort_done) {
+			regmap_read(dev->map, DW_IC_ENABLE, &enable);
+			abort_done = !(enable & DW_IC_ENABLE_ABORT);
+			continue;
+		}
+
 		__i2c_dw_disable_nowait(dev);
 		/*
 		 * The enable status register may be unimplemented, but
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

