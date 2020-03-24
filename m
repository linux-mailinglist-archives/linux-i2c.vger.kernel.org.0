Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44FED190D89
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 13:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgCXMcU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 08:32:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:5754 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727480AbgCXMcU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 08:32:20 -0400
IronPort-SDR: 6ktS6X9lCPYrzjDUgyK9xUG6IFc9pqb0GpkPU0fzcp/1JFonHw2ONHWaPnsEFgePFDGmla2KHs
 fdpjzrramEzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 05:32:19 -0700
IronPort-SDR: 5Ri9Ku26u4pORfE9/MN9mNDc+qqiif6CExB2NXYbnelrOG7vRMwE30yW3NmL0xYWWlxbrgVNCe
 yG2AcHIlH9bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; 
   d="scan'208";a="238221286"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 24 Mar 2020 05:32:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A5E0B14B; Tue, 24 Mar 2020 14:32:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 3/6] i2c: rcar: Consolidate timings calls in rcar_i2c_clock_calculate()
Date:   Tue, 24 Mar 2020 14:32:13 +0200
Message-Id: <20200324123216.78113-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move i2c_parse_fw_timings() to rcar_i2c_clock_calculate() to consolidate
timings calls in one place.

While here, replace hard coded values with standard bus frequency definitions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5: switched to timings definition on stack (Wolfram)
 drivers/i2c/busses/i2c-rcar.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index c8b57ded0e7b..25013641a85d 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -235,17 +235,20 @@ static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 	return i2c_recover_bus(&priv->adap);
 }
 
-static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv, struct i2c_timings *t)
+static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 {
 	u32 scgd, cdf, round, ick, sum, scl, cdf_width;
 	unsigned long rate;
 	struct device *dev = rcar_i2c_priv_to_dev(priv);
+	struct i2c_timings i2c_t = {
+		.bus_freq_hz		= I2C_MAX_STANDARD_MODE_FREQ,
+		.scl_fall_ns		= 35,
+		.scl_rise_ns		= 200,
+		.scl_int_delay_ns	= 50,
+	}, *t = &i2c_t;
 
 	/* Fall back to previously used values if not supplied */
-	t->bus_freq_hz = t->bus_freq_hz ?: 100000;
-	t->scl_fall_ns = t->scl_fall_ns ?: 35;
-	t->scl_rise_ns = t->scl_rise_ns ?: 200;
-	t->scl_int_delay_ns = t->scl_int_delay_ns ?: 50;
+	i2c_parse_fw_timings(dev, &i2c_t, false);
 
 	switch (priv->devtype) {
 	case I2C_RCAR_GEN1:
@@ -920,7 +923,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct rcar_i2c_priv *priv;
 	struct i2c_adapter *adap;
 	struct device *dev = &pdev->dev;
-	struct i2c_timings i2c_t = { 0 };
 	int ret;
 
 	/* Otherwise logic will break because some bytes must always use PIO */
@@ -957,8 +959,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(adap, priv);
 	strlcpy(adap->name, pdev->name, sizeof(adap->name));
 
-	i2c_parse_fw_timings(dev, &i2c_t, false);
-
 	/* Init DMA */
 	sg_init_table(&priv->sg, 1);
 	priv->dma_direction = DMA_NONE;
@@ -967,7 +967,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	/* Activate device for clock calculation */
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-	ret = rcar_i2c_clock_calculate(priv, &i2c_t);
+	ret = rcar_i2c_clock_calculate(priv);
 	if (ret < 0)
 		goto out_pm_put;
 
-- 
2.25.1

