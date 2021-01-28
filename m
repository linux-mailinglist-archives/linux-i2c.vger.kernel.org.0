Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D7D3081E8
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 00:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbhA1XaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 18:30:09 -0500
Received: from mga03.intel.com ([134.134.136.65]:43776 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231823AbhA1X3z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 18:29:55 -0500
IronPort-SDR: 3WBZ1Nu8sYrVQR2msFLGIfKO1hYQRNs9rAb/mwLizMT38NU5FKOg6DTLiCzkMwtylvNWR5yv0e
 qbQTxB6m30Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="180409646"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="180409646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:28:09 -0800
IronPort-SDR: PKcTIpeDHXll7OPFhTlejycM7e3qTfiK+uA8wLFUo3qvu5KdbmgUtH+37NTcCZasi+1RpZRyd2
 4m/CRPeg5LKQ==
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="573829749"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:28:04 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id DC25821FFD;
        Fri, 29 Jan 2021 01:27:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l5GhF-0004FQ-Qr; Fri, 29 Jan 2021 01:27:29 +0200
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
Subject: [PATCH v9 6/7] media: i2c: imx319: Support probe while the device is off
Date:   Fri, 29 Jan 2021 01:27:28 +0200
Message-Id: <20210128232729.16064-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rajmohan Mani <rajmohan.mani@intel.com>

Tell ACPI device PM code that the driver supports the device being powered
off when the driver's probe function is entered.

Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx319.c | 72 +++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 8473c0bbb35d6..e0b22e9318fed 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -140,6 +140,8 @@ struct imx319 {
 
 	/* Streaming on/off */
 	bool streaming;
+	/* True if the device has been identified */
+	bool identified;
 };
 
 static const struct imx319_reg imx319_global_regs[] = {
@@ -2084,6 +2086,31 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/* Verify chip ID */
+static int imx319_identify_module(struct imx319 *imx319)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
+	int ret;
+	u32 val;
+
+	if (imx319->identified)
+		return 0;
+
+	ret = imx319_read_reg(imx319, IMX319_REG_CHIP_ID, 2, &val);
+	if (ret)
+		return ret;
+
+	if (val != IMX319_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+			IMX319_CHIP_ID, val);
+		return -EIO;
+	}
+
+	imx319->identified = true;
+
+	return 0;
+}
+
 /* Start streaming */
 static int imx319_start_streaming(struct imx319 *imx319)
 {
@@ -2091,6 +2118,10 @@ static int imx319_start_streaming(struct imx319 *imx319)
 	const struct imx319_reg_list *reg_list;
 	int ret;
 
+	ret = imx319_identify_module(imx319);
+	if (ret)
+		return ret;
+
 	/* Global Setting */
 	reg_list = &imx319_global_setting;
 	ret = imx319_write_regs(imx319, reg_list->regs, reg_list->num_of_regs);
@@ -2208,26 +2239,6 @@ static int __maybe_unused imx319_resume(struct device *dev)
 	return ret;
 }
 
-/* Verify chip ID */
-static int imx319_identify_module(struct imx319 *imx319)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
-	int ret;
-	u32 val;
-
-	ret = imx319_read_reg(imx319, IMX319_REG_CHIP_ID, 2, &val);
-	if (ret)
-		return ret;
-
-	if (val != IMX319_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
-			IMX319_CHIP_ID, val);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static const struct v4l2_subdev_core_ops imx319_subdev_core_ops = {
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
@@ -2422,6 +2433,7 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 static int imx319_probe(struct i2c_client *client)
 {
 	struct imx319 *imx319;
+	bool low_power;
 	int ret;
 	u32 i;
 
@@ -2434,11 +2446,14 @@ static int imx319_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx319->sd, client, &imx319_subdev_ops);
 
-	/* Check module identity */
-	ret = imx319_identify_module(imx319);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		goto error_probe;
+	low_power = acpi_dev_state_low_power(&client->dev);
+	if (!low_power) {
+		/* Check module identity */
+		ret = imx319_identify_module(imx319);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			goto error_probe;
+		}
 	}
 
 	imx319->hwcfg = imx319_get_hwcfg(&client->dev);
@@ -2491,10 +2506,10 @@ static int imx319_probe(struct i2c_client *client)
 		goto error_media_entity;
 
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
 
@@ -2547,6 +2562,7 @@ static struct i2c_driver imx319_i2c_driver = {
 	},
 	.probe_new = imx319_probe,
 	.remove = imx319_remove,
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 module_i2c_driver(imx319_i2c_driver);
 
-- 
2.20.1

