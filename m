Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F58252CF3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 13:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729200AbgHZLvP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 07:51:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:17925 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729180AbgHZLvF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 07:51:05 -0400
IronPort-SDR: IwnpxxMCcC3TArXeBv+VU3L6ovyTQPDrQvEKDndfz8rZuHWR4faNzN0SLTBblwD1JTNw7xKSkx
 9dvlJLbB0Ltw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="217822881"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="217822881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:50:56 -0700
IronPort-SDR: px8n988CDy84+lhtRf46jMlr0YkuhRc5FfvNse+yCX/X3us2HpZa2M7eej+EQ6Kughc6rJffcE
 bR6JcvFBAUng==
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="403040466"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:50:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 75E4C209D1;
        Wed, 26 Aug 2020 14:50:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kAu0e-0001bS-Rn; Wed, 26 Aug 2020 14:54:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [PATCH v6 4/6] media: i2c: imx319: Support probe while the device is off
Date:   Wed, 26 Aug 2020 14:54:30 +0300
Message-Id: <20200826115432.6103-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rajmohan Mani <rajmohan.mani@intel.com>

Tell ACPI device PM code that the driver supports the device being powered
off when the driver's probe function is entered.

Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx319.c | 74 +++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 17c2e4b41221e..6b63bb0abb138 100644
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
@@ -2210,26 +2241,6 @@ static int __maybe_unused imx319_resume(struct device *dev)
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
@@ -2424,6 +2435,7 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 static int imx319_probe(struct i2c_client *client)
 {
 	struct imx319 *imx319;
+	bool low_power;
 	int ret;
 	u32 i;
 
@@ -2436,11 +2448,14 @@ static int imx319_probe(struct i2c_client *client)
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
@@ -2493,10 +2508,10 @@ static int imx319_probe(struct i2c_client *client)
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
 
@@ -2536,7 +2551,7 @@ static const struct dev_pm_ops imx319_pm_ops = {
 };
 
 static const struct acpi_device_id imx319_acpi_ids[] = {
-	{ "SONY319A" },
+	{ "SONY319A", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(acpi, imx319_acpi_ids);
@@ -2549,6 +2564,7 @@ static struct i2c_driver imx319_i2c_driver = {
 	},
 	.probe_new = imx319_probe,
 	.remove = imx319_remove,
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 module_i2c_driver(imx319_i2c_driver);
 
-- 
2.20.1

