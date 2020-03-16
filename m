Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B6B186F0E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 16:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731887AbgCPPtc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 11:49:32 -0400
Received: from mga09.intel.com ([134.134.136.24]:50166 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731848AbgCPPtc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 11:49:32 -0400
IronPort-SDR: ZorYWwblkVI9TwCYeUcfBf4x2H4u3jr0dWwHfu3w6Gl+hZf37doJjNKgpsW7R10xizOHzY9x6I
 Az1MhqWI9CYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 08:49:31 -0700
IronPort-SDR: froSjGBTvLOYFt0MUjj3VZkPPuP02fM9rO9rUXdxTmvWxiD9Sg0j1zRBk2NHXs2On6v5Tux7Ex
 jgOuWDnCXRsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,560,1574150400"; 
   d="scan'208";a="355049867"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2020 08:49:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BD7EE76; Mon, 16 Mar 2020 17:49:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/6] i2c: core: Allow override timing properties with 0
Date:   Mon, 16 Mar 2020 17:49:25 +0200
Message-Id: <20200316154929.20886-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some drivers may allow to override properties with 0 value when defaults
are not in use, thus, replace memset() with corresponding per property
update.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new patch
 drivers/i2c/busses/i2c-rcar.c |  2 +-
 drivers/i2c/i2c-core-base.c   | 30 +++++++++++++++++-------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 879f0e61a496..f1f915bfdb9d 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -920,7 +920,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct rcar_i2c_priv *priv;
 	struct i2c_adapter *adap;
 	struct device *dev = &pdev->dev;
-	struct i2c_timings i2c_t;
+	struct i2c_timings i2c_t = {0};
 	int ret;
 
 	/* Otherwise logic will break because some bytes must always use PIO */
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9b2972c7faa2..5cc0b0ec5570 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1593,23 +1593,21 @@ EXPORT_SYMBOL(i2c_del_adapter);
  * @dev: The device to scan for I2C timing properties
  * @t: the i2c_timings struct to be filled with values
  * @use_defaults: bool to use sane defaults derived from the I2C specification
- *		  when properties are not found, otherwise use 0
+ *		  when properties are not found, otherwise don't update
  *
  * Scan the device for the generic I2C properties describing timing parameters
  * for the signal and fill the given struct with the results. If a property was
  * not found and use_defaults was true, then maximum timings are assumed which
  * are derived from the I2C specification. If use_defaults is not used, the
- * results will be 0, so drivers can apply their own defaults later. The latter
- * is mainly intended for avoiding regressions of existing drivers which want
- * to switch to this function. New drivers almost always should use the defaults.
+ * results will be as before, so drivers can apply their own defaults before
+ * calling this helper. The latter is mainly intended for avoiding regressions
+ * of existing drivers which want to switch to this function. New drivers
+ * almost always should use the defaults.
  */
-
 void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults)
 {
 	int ret;
 
-	memset(t, 0, sizeof(*t));
-
 	ret = device_property_read_u32(dev, "clock-frequency", &t->bus_freq_hz);
 	if (ret && use_defaults)
 		t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
@@ -1632,19 +1630,25 @@ void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_de
 			t->scl_fall_ns = 120;
 	}
 
-	device_property_read_u32(dev, "i2c-scl-internal-delay-ns", &t->scl_int_delay_ns);
+	ret = device_property_read_u32(dev, "i2c-scl-internal-delay-ns", &t->scl_int_delay_ns);
+	if (ret && use_defaults)
+		t->scl_int_delay_ns = 0;
 
 	ret = device_property_read_u32(dev, "i2c-sda-falling-time-ns", &t->sda_fall_ns);
 	if (ret && use_defaults)
 		t->sda_fall_ns = t->scl_fall_ns;
 
-	device_property_read_u32(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns);
+	ret = device_property_read_u32(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns);
+	if (ret && use_defaults)
+		t->sda_hold_ns = 0;
 
-	device_property_read_u32(dev, "i2c-digital-filter-width-ns",
-				 &t->digital_filter_width_ns);
+	ret = device_property_read_u32(dev, "i2c-digital-filter-width-ns", &t->digital_filter_width_ns);
+	if (ret && use_defaults)
+		t->digital_filter_width_ns = 0;
 
-	device_property_read_u32(dev, "i2c-analog-filter-cutoff-frequency",
-				 &t->analog_filter_cutoff_freq_hz);
+	ret = device_property_read_u32(dev, "i2c-analog-filter-cutoff-frequency", &t->analog_filter_cutoff_freq_hz);
+	if (ret && use_defaults)
+		t->analog_filter_cutoff_freq_hz = 0;
 }
 EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
 
-- 
2.25.1

