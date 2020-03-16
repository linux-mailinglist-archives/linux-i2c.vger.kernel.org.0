Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D3D186F0D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 16:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731868AbgCPPtc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 11:49:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:42989 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731838AbgCPPtc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 11:49:32 -0400
IronPort-SDR: Jfm5OfZPPRvsVr1SzLXQNrgavKoG3dg1XeE79q+qfeIyDjC3ELE4BnrWI2VY9iAefKB1y7zHEL
 mI2UReOFciOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 08:49:31 -0700
IronPort-SDR: LXVWI+D0dIDOZVp92yyuedH3Grz+epNIIiukVxUQL1/9JH0axFLkKZZdQEnQmWrQFmXzOSg+Zp
 x7vmaYjJ4cAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="390734531"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 16 Mar 2020 08:49:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CAF87109; Mon, 16 Mar 2020 17:49:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/6] i2c: rcar: Consolidate timings calls in rcar_i2c_clock_calculate()
Date:   Mon, 16 Mar 2020 17:49:26 +0200
Message-Id: <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
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
v3: new patch
 drivers/i2c/busses/i2c-rcar.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index f1f915bfdb9d..a8a136e490fa 100644
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
+	struct i2c_timings i2c_t, *t = &i2c_t;
 
 	/* Fall back to previously used values if not supplied */
-	t->bus_freq_hz = t->bus_freq_hz ?: 100000;
-	t->scl_fall_ns = t->scl_fall_ns ?: 35;
-	t->scl_rise_ns = t->scl_rise_ns ?: 200;
-	t->scl_int_delay_ns = t->scl_int_delay_ns ?: 50;
+	t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+	t->scl_fall_ns = 35;
+	t->scl_rise_ns = 200;
+	t->scl_int_delay_ns = 50;
+
+	i2c_parse_fw_timings(dev, &i2c_t, false);
 
 	switch (priv->devtype) {
 	case I2C_RCAR_GEN1:
@@ -920,7 +923,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct rcar_i2c_priv *priv;
 	struct i2c_adapter *adap;
 	struct device *dev = &pdev->dev;
-	struct i2c_timings i2c_t = {0};
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

