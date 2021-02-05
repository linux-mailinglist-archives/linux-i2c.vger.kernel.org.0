Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EAA310BDE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 14:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhBENcs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 08:32:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:30367 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229876AbhBEN2w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:28:52 -0500
IronPort-SDR: FE//1QypzqFqykF/01P6B/ckCA2gSfl8TbSGn2pUqj0tP9Z4+izrEAr7ckV4eqTGOjJfOd2Cin
 xItxGjuHArNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="242934115"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="242934115"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:25:02 -0800
IronPort-SDR: T7mKaIz0pmfvEp8hRidWDEmtu19qLnpFj0GErgx1gj8tjrNndc9/6aqeK8yskSaM2n09k8F3Yz
 ZRYdEx+6/qlQ==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="508536741"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:58 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9F0CE20EFD;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GR-Dv; Fri, 05 Feb 2021 15:25:05 +0200
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
Subject: [PATCH v10 5/7] ov5670: Support probe whilst the device is in a low power state
Date:   Fri,  5 Feb 2021 15:25:03 +0200
Message-Id: <20210205132505.20173-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tell ACPI device PM code that the driver supports the device being in a
low power state when the driver's probe function is entered.

Also do identification on the first access of the device, whether in probe
or when starting streaming.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/i2c/ov5670.c | 76 +++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 866c8c2e8f59a..eb0d599f3318b 100644
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
+	bool low_power;
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
+	low_power = acpi_dev_state_low_power(&client->dev);
+	if (!low_power) {
+		/* Check module identity */
+		ret = ov5670_identify_module(ov5670);
+		if (ret) {
+			err_msg = "ov5670_identify_module() error";
+			goto error_print;
+		}
 	}
 
 	mutex_init(&ov5670->mutex);
@@ -2512,10 +2527,10 @@ static int ov5670_probe(struct i2c_client *client)
 	ov5670->streaming = false;
 
 	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
+	 * Don't set the device's state to active if it's in a low power state.
 	 */
-	pm_runtime_set_active(&client->dev);
+	if (!low_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -2557,7 +2572,7 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{"INT3479"},
+	{ "INT3479" },
 	{ /* sentinel */ }
 };
 
@@ -2572,6 +2587,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 
 module_i2c_driver(ov5670_i2c_driver);
-- 
2.20.1

