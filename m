Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098B7344C60
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 17:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCVQyR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 12:54:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:24136 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230245AbhCVQyF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 12:54:05 -0400
IronPort-SDR: qUV44WsYqm8m7SEmCh0PqpdUt5gfg2f2BscWPyZxcHKtf/pjV5Cbtq+AfSyQi2qf9WrCaLxBuC
 MuGwdrdyL4kA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="254307240"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="254307240"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 09:54:04 -0700
IronPort-SDR: m0hSCsGpgh6MtzsPGDQ2j5rBooSYOC6PQlZV20Im9GI/4gZScYE188dEI/FdaLFqegE9ndQUwm
 XAtYz3XIXCPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="451802365"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2021 09:53:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6019CC5; Mon, 22 Mar 2021 18:54:12 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v1 1/1] i2c: drivers: Use generic definitions for bus frequencies (part 2)
Date:   Mon, 22 Mar 2021 18:54:05 +0200
Message-Id: <20210322165405.44980-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c    | 14 ++++----------
 drivers/i2c/busses/i2c-qcom-cci.c |  4 ++--
 2 files changed, 6 insertions(+), 12 deletions(-)

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

