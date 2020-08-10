Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E1A240770
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 16:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHJOYs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 10:24:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:5304 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726897AbgHJOYs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 10:24:48 -0400
IronPort-SDR: W6DyI0fS2XxlYkJaglwXzF7uqVXGVze2ajKL6b8rklgjoaAlORi+dxr6jEgAkpZVSAK5gcdMNk
 UYl6+JFqcQcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="238371926"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="238371926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:24:46 -0700
IronPort-SDR: 52m5sVXupHSldNjkls906YBK8xA0kbrQeZ5AX59IHpMo+rS4hYsYQRa2rKzREw1s9Lushq1iYD
 pAD0Y7os7POQ==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="277292106"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:24:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B48DF20AC3;
        Mon, 10 Aug 2020 17:24:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1k58mC-0003F0-9I; Mon, 10 Aug 2020 17:27:48 +0300
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
Subject: [PATCH v5 4/6] media: i2c: imx319: Support probe while the device is off
Date:   Mon, 10 Aug 2020 17:27:45 +0300
Message-Id: <20200810142747.12400-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
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
index 17c2e4b41221e..dc5ebff6a85a3 100644
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
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 module_i2c_driver(imx319_i2c_driver);
 
-- 
2.20.1

