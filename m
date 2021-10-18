Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC61143226A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 17:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhJRPSs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 11:18:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:18279 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhJRPSs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 11:18:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="225730658"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="225730658"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="573107469"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B3B7D20830;
        Mon, 18 Oct 2021 15:17:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1mcRa5-0001fe-Mz; Mon, 18 Oct 2021 15:17:29 +0300
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
Subject: [PATCH 5/6] media: i2c: imx319: Support device probe in non-zero ACPI D state
Date:   Mon, 18 Oct 2021 15:17:28 +0300
Message-Id: <20211018121729.6357-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
References: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rajmohan Mani <rajmohan.mani@intel.com>

Tell ACPI device PM code that the driver supports the device being in
non-zero ACPI D state when the driver's probe function is entered.

Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/imx319.c | 74 ++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index dba0854ab5aad..daa976858e296 100644
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
@@ -2206,26 +2237,6 @@ static int __maybe_unused imx319_resume(struct device *dev)
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
@@ -2420,6 +2431,7 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 static int imx319_probe(struct i2c_client *client)
 {
 	struct imx319 *imx319;
+	bool full_power;
 	int ret;
 	u32 i;
 
@@ -2432,11 +2444,14 @@ static int imx319_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx319->sd, client, &imx319_subdev_ops);
 
-	/* Check module identity */
-	ret = imx319_identify_module(imx319);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		goto error_probe;
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		/* Check module identity */
+		ret = imx319_identify_module(imx319);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			goto error_probe;
+		}
 	}
 
 	imx319->hwcfg = imx319_get_hwcfg(&client->dev);
@@ -2488,11 +2503,9 @@ static int imx319_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_media_entity;
 
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
 
@@ -2545,6 +2558,7 @@ static struct i2c_driver imx319_i2c_driver = {
 	},
 	.probe_new = imx319_probe,
 	.remove = imx319_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 module_i2c_driver(imx319_i2c_driver);
 
-- 
2.30.2

