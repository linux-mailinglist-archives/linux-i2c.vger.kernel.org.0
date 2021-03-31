Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9209F34FE49
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 12:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbhCaKq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 06:46:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:34992 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbhCaKqS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 06:46:18 -0400
IronPort-SDR: Q+YJ1fhcwIK7A1weFGOmcBsSxUVoyajz6dbmC+fmrjGylvW8i9ETfyGijA5gdFA74JvKt1ZhqS
 xqgcwGJVgbgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179517114"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="179517114"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:46:16 -0700
IronPort-SDR: VZYHvGzA6MpnfqL9sqggMz2wjiwYJpbtFWWMwNvkdsrAaLUc4rty1Ue1rwDjhK1BEETzFB78LK
 T5YmMv+6q+EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="377217187"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 Mar 2021 03:46:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 96F4A133; Wed, 31 Mar 2021 13:46:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v2 1/1] i2c: drivers: Use generic definitions for bus frequencies (part 2)
Date:   Wed, 31 Mar 2021 13:46:22 +0300
Message-Id: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Khalil Blaiech <kblaiech@nvidia.com>
---
v2: added tag (Khalil), converted one missed place in DesignWare driver
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-mlxbf.c             | 14 ++++----------
 drivers/i2c/busses/i2c-qcom-cci.c          |  4 ++--
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dd27b9dbe931..3f4d2124e0fc 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -78,7 +78,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	 * difference is the timing parameter values since the registers are
 	 * the same.
 	 */
-	if (t->bus_freq_hz == 1000000) {
+	if (t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		/*
 		 * Check are Fast Mode Plus parameters available. Calculate
 		 * SCL timing parameters for Fast Mode Plus if not set.
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 2fb0532d8a16..80ab831df349 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -172,12 +172,6 @@
 #define MLXBF_I2C_SMBUS_THIGH_MAX_TBUF            0x14
 #define MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT           0x18
 
-enum {
-	MLXBF_I2C_TIMING_100KHZ = 100000,
-	MLXBF_I2C_TIMING_400KHZ = 400000,
-	MLXBF_I2C_TIMING_1000KHZ = 1000000,
-};
-
 /*
  * Defines SMBus operating frequency and core clock frequency.
  * According to ADB files, default values are compliant to 100KHz SMBus
@@ -1202,7 +1196,7 @@ static int mlxbf_i2c_init_timings(struct platform_device *pdev,
 
 	ret = device_property_read_u32(dev, "clock-frequency", &config_khz);
 	if (ret < 0)
-		config_khz = MLXBF_I2C_TIMING_100KHZ;
+		config_khz = I2C_MAX_STANDARD_MODE_FREQ;
 
 	switch (config_khz) {
 	default:
@@ -1210,15 +1204,15 @@ static int mlxbf_i2c_init_timings(struct platform_device *pdev,
 		pr_warn("Illegal value %d: defaulting to 100 KHz\n",
 			config_khz);
 		fallthrough;
-	case MLXBF_I2C_TIMING_100KHZ:
+	case I2C_MAX_STANDARD_MODE_FREQ:
 		config_idx = MLXBF_I2C_TIMING_CONFIG_100KHZ;
 		break;
 
-	case MLXBF_I2C_TIMING_400KHZ:
+	case I2C_MAX_FAST_MODE_FREQ:
 		config_idx = MLXBF_I2C_TIMING_CONFIG_400KHZ;
 		break;
 
-	case MLXBF_I2C_TIMING_1000KHZ:
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
 		config_idx = MLXBF_I2C_TIMING_CONFIG_1000KHZ;
 		break;
 	}
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 1c259b5188de..c63d5545fc2a 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -569,9 +569,9 @@ static int cci_probe(struct platform_device *pdev)
 		cci->master[idx].mode = I2C_MODE_STANDARD;
 		ret = of_property_read_u32(child, "clock-frequency", &val);
 		if (!ret) {
-			if (val == 400000)
+			if (val == I2C_MAX_FAST_MODE_FREQ)
 				cci->master[idx].mode = I2C_MODE_FAST;
-			else if (val == 1000000)
+			else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
 				cci->master[idx].mode = I2C_MODE_FAST_PLUS;
 		}
 
-- 
2.30.2

