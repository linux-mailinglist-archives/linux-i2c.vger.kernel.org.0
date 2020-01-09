Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E6A135D19
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 16:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732547AbgAIPow (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 10:44:52 -0500
Received: from mga04.intel.com ([192.55.52.120]:31989 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732509AbgAIPoi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 10:44:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="218395583"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:35 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1D7A320EC8;
        Thu,  9 Jan 2020 17:44:33 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ipa01-00055B-Ew; Thu, 09 Jan 2020 17:45:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v3 3/5] ov5670: Support probe whilst the device is in a low power state
Date:   Thu,  9 Jan 2020 17:45:27 +0200
Message-Id: <20200109154529.19484-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tell ACPI device PM code that the driver supports the device being in a
low power state when the driver's probe function is entered.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5670.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 041fcbb4eebdf..9b10b1c0e1f8f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2444,6 +2444,7 @@ static int ov5670_probe(struct i2c_client *client)
 	struct ov5670 *ov5670;
 	const char *err_msg;
 	u32 input_clk = 0;
+	bool low_power;
 	int ret;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
@@ -2460,11 +2461,14 @@ static int ov5670_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-	/* Check module identity */
-	ret = ov5670_identify_module(ov5670);
-	if (ret) {
-		err_msg = "ov5670_identify_module() error";
-		goto error_print;
+	low_power = acpi_dev_low_power_state_probe(&client->dev);
+	if (!low_power) {
+		/* Check module identity */
+		ret = ov5670_identify_module(ov5670);
+		if (ret) {
+			err_msg = "ov5670_identify_module() error";
+			goto error_print;
+		}
 	}
 
 	mutex_init(&ov5670->mutex);
@@ -2501,10 +2505,10 @@ static int ov5670_probe(struct i2c_client *client)
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
 
@@ -2546,7 +2550,7 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{"INT3479"},
+	{ "INT3479" },
 	{ /* sentinel */ }
 };
 
@@ -2561,6 +2565,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 	},
 	.probe_new = ov5670_probe,
 	.remove = ov5670_remove,
+	.probe_low_power = true,
 };
 
 module_i2c_driver(ov5670_i2c_driver);
-- 
2.20.1

