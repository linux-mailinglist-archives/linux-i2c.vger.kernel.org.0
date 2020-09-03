Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9053625BCF2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 10:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgICIQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 04:16:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:36319 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgICIPy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 04:15:54 -0400
IronPort-SDR: iExr8iL3ij/AeKUZ2FLD6hlL5TGhmTj7mnWW9+I8mVBagD4mrrPpt0TOGryPwdyKaG+mcxEfKE
 khaVxhpiimMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="242355730"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="242355730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 01:15:43 -0700
IronPort-SDR: 2Hr+CC48SAbma50Ari2hEVaP12Mk3zhmMNzmtLkUrvEiH/OiSSeZfz0+ePQ/5ehqMYmY3KB97S
 usX84P68zZDg==
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="375804997"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 01:15:40 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 914C22114B;
        Thu,  3 Sep 2020 11:15:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kDkPO-0001cJ-MM; Thu, 03 Sep 2020 11:15:50 +0300
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
Subject: [PATCH v8 4/6] ov5670: Support probe whilst the device is in a low power state
Date:   Thu,  3 Sep 2020 11:15:48 +0300
Message-Id: <20200903081550.6012-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tell ACPI device PM code that the driver supports the device being in a
low power state when the driver's probe function is entered.

Also do identification on the first access of the device, whether in probe
or when starting streaming.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5670.c | 76 +++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index f26252e35e08d..74b0325c22565 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1832,6 +1832,8 @@ struct ov5670 {
 
 	/* Streaming on/off */
 	bool streaming;
+	/* True if the device has been identified */
+	bool identified;
 };
 
 #define to_ov5670(_sd)	container_of(_sd, struct ov5670, sd)
@@ -2270,6 +2272,32 @@ static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
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
@@ -2278,6 +2306,10 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	int link_freq_index;
 	int ret;
 
+	ret = ov5670_identify_module(ov5670);
+	if (ret)
+		return ret;
+
 	/* Get out of from software reset */
 	ret = ov5670_write_reg(ov5670, OV5670_REG_SOFTWARE_RST,
 			       OV5670_REG_VALUE_08BIT, OV5670_SOFTWARE_RST);
@@ -2401,27 +2433,6 @@ static int __maybe_unused ov5670_resume(struct device *dev)
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
@@ -2456,6 +2467,7 @@ static int ov5670_probe(struct i2c_client *client)
 	struct ov5670 *ov5670;
 	const char *err_msg;
 	u32 input_clk = 0;
+	bool low_power;
 	int ret;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
@@ -2472,11 +2484,14 @@ static int ov5670_probe(struct i2c_client *client)
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
@@ -2513,10 +2528,10 @@ static int ov5670_probe(struct i2c_client *client)
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
 
@@ -2558,7 +2573,7 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{"INT3479"},
+	{ "INT3479" },
 	{ /* sentinel */ }
 };
 
@@ -2573,6 +2588,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 
 module_i2c_driver(ov5670_i2c_driver);
-- 
2.20.1

