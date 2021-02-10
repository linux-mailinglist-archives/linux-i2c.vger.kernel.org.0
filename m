Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D5C317408
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Feb 2021 00:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbhBJXLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 18:11:43 -0500
Received: from mga02.intel.com ([134.134.136.20]:19942 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233989AbhBJXKR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Feb 2021 18:10:17 -0500
IronPort-SDR: 4cwEnk9RHJwSErrikb12m5ZPnXybKx4/HZQAPLFFC2HeXvLqQdBdYlzAk49bBOoKeY0TFopkyv
 iDxc633UMs1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="169292258"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="169292258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 15:08:10 -0800
IronPort-SDR: MUZF07H9WDHTT8b6f3S22Xmkp352C4YFXcq9b9soc+DOuauMr30z/n9g6w/IIPatPkvD9a6iSl
 AkNT0dgLW6Dw==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="420701018"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 15:08:07 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 6058D209D5;
        Thu, 11 Feb 2021 01:08:01 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l9yaX-0007tc-1m; Thu, 11 Feb 2021 01:08:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v11 5/7] ov5670: Support probe whilst the device is in ACPI D state other than 0
Date:   Thu, 11 Feb 2021 01:07:58 +0200
Message-Id: <20210210230800.30291-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210230800.30291-1-sakari.ailus@linux.intel.com>
References: <20210210230800.30291-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tell ACPI device PM code that the driver supports the device being in a
non-zero D state when the driver's probe function is entered.

Also do identification on the first access of the device, whether in probe
or when starting streaming.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/i2c/ov5670.c | 78 ++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 866c8c2e8f59a..a00211e5d1155 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1832,6 +1832,8 @@ struct ov5670 {
 
 	/* Streaming on/off */
 	bool streaming;
+	/* True if the device has been identified */
+	bool identified;
 };
 
 #define to_ov5670(_sd)	container_of(_sd, struct ov5670, sd)
@@ -2271,6 +2273,32 @@ static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	return 0;
 }
 
+/* Verify chip ID */
+static int ov5670_identify_module(struct ov5670 *ov5670)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
+	int ret;
+	u32 val;
+
+	if (ov5670->identified)
+		return 0;
+
+	ret = ov5670_read_reg(ov5670, OV5670_REG_CHIP_ID,
+			      OV5670_REG_VALUE_24BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV5670_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			OV5670_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	ov5670->identified = true;
+
+	return 0;
+}
+
 /* Prepare streaming by writing default values and customized values */
 static int ov5670_start_streaming(struct ov5670 *ov5670)
 {
@@ -2279,6 +2307,10 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	int link_freq_index;
 	int ret;
 
+	ret = ov5670_identify_module(ov5670);
+	if (ret)
+		return ret;
+
 	/* Get out of from software reset */
 	ret = ov5670_write_reg(ov5670, OV5670_REG_SOFTWARE_RST,
 			       OV5670_REG_VALUE_08BIT, OV5670_SOFTWARE_RST);
@@ -2400,27 +2432,6 @@ static int __maybe_unused ov5670_resume(struct device *dev)
 	return 0;
 }
 
-/* Verify chip ID */
-static int ov5670_identify_module(struct ov5670 *ov5670)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
-	int ret;
-	u32 val;
-
-	ret = ov5670_read_reg(ov5670, OV5670_REG_CHIP_ID,
-			      OV5670_REG_VALUE_24BIT, &val);
-	if (ret)
-		return ret;
-
-	if (val != OV5670_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
-			OV5670_CHIP_ID, val);
-		return -ENXIO;
-	}
-
-	return 0;
-}
-
 static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 	.s_stream = ov5670_set_stream,
 };
@@ -2455,6 +2466,7 @@ static int ov5670_probe(struct i2c_client *client)
 	struct ov5670 *ov5670;
 	const char *err_msg;
 	u32 input_clk = 0;
+	bool full_power;
 	int ret;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
@@ -2471,11 +2483,14 @@ static int ov5670_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-	/* Check module identity */
-	ret = ov5670_identify_module(ov5670);
-	if (ret) {
-		err_msg = "ov5670_identify_module() error";
-		goto error_print;
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		/* Check module identity */
+		ret = ov5670_identify_module(ov5670);
+		if (ret) {
+			err_msg = "ov5670_identify_module() error";
+			goto error_print;
+		}
 	}
 
 	mutex_init(&ov5670->mutex);
@@ -2511,11 +2526,9 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ov5670->streaming = false;
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
-	pm_runtime_set_active(&client->dev);
+	/* Set the device's state to active if it's in D0 state. */
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -2557,7 +2570,7 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{"INT3479"},
+	{ "INT3479" },
 	{ /* sentinel */ }
 };
 
@@ -2572,6 +2585,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov5670_i2c_driver);
-- 
2.20.1

