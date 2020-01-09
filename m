Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C00135D18
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 16:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbgAIPoi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 10:44:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:4559 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730913AbgAIPoi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 10:44:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="246707087"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:35 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 2407420F35;
        Thu,  9 Jan 2020 17:44:33 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ipa01-00055E-G9; Thu, 09 Jan 2020 17:45:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v3 4/5] media: i2c: imx319: Support probe while the device is off
Date:   Thu,  9 Jan 2020 17:45:28 +0200
Message-Id: <20200109154529.19484-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/imx319.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 17c2e4b41221e..3bb87154dd2cd 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2424,6 +2424,7 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 static int imx319_probe(struct i2c_client *client)
 {
 	struct imx319 *imx319;
+	bool low_power;
 	int ret;
 	u32 i;
 
@@ -2436,11 +2437,14 @@ static int imx319_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx319->sd, client, &imx319_subdev_ops);
 
-	/* Check module identity */
-	ret = imx319_identify_module(imx319);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		goto error_probe;
+	low_power = acpi_dev_low_power_state_probe(&client->dev);
+	if (!low_power) {
+		/* Check module identity */
+		ret = imx319_identify_module(imx319);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			goto error_probe;
+		}
 	}
 
 	imx319->hwcfg = imx319_get_hwcfg(&client->dev);
@@ -2493,10 +2497,10 @@ static int imx319_probe(struct i2c_client *client)
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
 
@@ -2536,7 +2540,7 @@ static const struct dev_pm_ops imx319_pm_ops = {
 };
 
 static const struct acpi_device_id imx319_acpi_ids[] = {
-	{ "SONY319A" },
+	{ "SONY319A", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(acpi, imx319_acpi_ids);
@@ -2549,6 +2553,7 @@ static struct i2c_driver imx319_i2c_driver = {
 	},
 	.probe_new = imx319_probe,
 	.remove = imx319_remove,
+	.probe_low_power = true,
 };
 module_i2c_driver(imx319_i2c_driver);
 
-- 
2.20.1

