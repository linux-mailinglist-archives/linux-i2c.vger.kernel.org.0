Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9106B16A9A1
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgBXPPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:62974 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbgBXPPq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="384165597"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0F419882; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 23/40] i2c: nomadik: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:13 +0200
Message-Id: <20200224151530.31713-23-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 01a7d72e5511..4aaaf48b60fb 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -396,7 +396,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
 	 * 2 whereas it is 3 for fast and fastplus mode of
 	 * operation. TODO - high speed support.
 	 */
-	div = (dev->clk_freq > 100000) ? 3 : 2;
+	div = (dev->clk_freq > I2C_STANDARD_MODE_FREQ) ? 3 : 2;
 
 	/*
 	 * generate the mask for baud rate counters. The controller
@@ -420,7 +420,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
 	if (dev->sm > I2C_FREQ_MODE_FAST) {
 		dev_err(&dev->adev->dev,
 			"do not support this mode defaulting to std. mode\n");
-		brcr2 = i2c_clk/(100000 * 2) & 0xffff;
+		brcr2 = i2c_clk / (I2C_STANDARD_MODE_FREQ * 2) & 0xffff;
 		writel((brcr1 | brcr2), dev->virtbase + I2C_BRCR);
 		writel(I2C_FREQ_MODE_STANDARD << 4,
 				dev->virtbase + I2C_CR);
@@ -949,10 +949,10 @@ static void nmk_i2c_of_probe(struct device_node *np,
 {
 	/* Default to 100 kHz if no frequency is given in the node */
 	if (of_property_read_u32(np, "clock-frequency", &nmk->clk_freq))
-		nmk->clk_freq = 100000;
+		nmk->clk_freq = I2C_STANDARD_MODE_FREQ;
 
 	/* This driver only supports 'standard' and 'fast' modes of operation. */
-	if (nmk->clk_freq <= 100000)
+	if (nmk->clk_freq <= I2C_STANDARD_MODE_FREQ)
 		nmk->sm = I2C_FREQ_MODE_STANDARD;
 	else
 		nmk->sm = I2C_FREQ_MODE_FAST;
-- 
2.25.0

