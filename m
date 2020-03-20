Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD9318D82B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 20:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgCTTMw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 15:12:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:49843 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726829AbgCTTMw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 15:12:52 -0400
IronPort-SDR: F8hi1v7K4zQ2k2N3mHcbMCchuGAPNBqf15PgDfD+CV9zv+gCDGbZ/6Oxy2f0NwhBBCX+s3FAd0
 x+d1g8T/KpbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 12:12:51 -0700
IronPort-SDR: kpRG4LNUWDd+fjUDz+2BS5cj5oCpTflt9/gVRwNPGQbQ0U7DkTW1owX/Amw1RELp7BPGcsuLqZ
 j21D9ZzrT7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="280519189"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2020 12:12:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 15C611A1; Fri, 20 Mar 2020 21:12:50 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 3/6] i2c: rcar: Consolidate timings calls in rcar_i2c_clock_calculate()
Date:   Fri, 20 Mar 2020 21:12:46 +0200
Message-Id: <20200320191249.28835-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320191249.28835-1-andriy.shevchenko@linux.intel.com>
References: <20200320191249.28835-1-andriy.shevchenko@linux.intel.com>
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
v4: no change
 drivers/i2c/busses/i2c-rcar.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index c8b57ded0e7b..a8a136e490fa 100644
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

