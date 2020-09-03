Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A80E25BCDC
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 10:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgICIPy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 04:15:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:55058 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728787AbgICIPo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 04:15:44 -0400
IronPort-SDR: GpqKeUXx+aNbmjFEIOgb+NiALJ9sSxXkLG6S60atlHx+cOXZPwy6ZwQ8ADnanTo2+OVeQhRo9k
 yQT/IIpaJPhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="155042681"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="155042681"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 01:15:43 -0700
IronPort-SDR: PzgkixOpBw/2MXRipbTtMdExKciOY0phgh2vceFz0ReqOW5caqWzC+8sLL+QlmNnvuyF1vzeP/
 7zpoXoC9MnnQ==
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="405416207"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 01:15:40 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 6FB2F203ED;
        Thu,  3 Sep 2020 11:15:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kDkPO-0001c9-Hc; Thu, 03 Sep 2020 11:15:50 +0300
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
Subject: [PATCH v8 1/6] i2c: Allow an ACPI driver to manage the device's power state during probe
Date:   Thu,  3 Sep 2020 11:15:45 +0300
Message-Id: <20200903081550.6012-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable drivers to tell ACPI that there's no need to power on a device for
probe. Drivers should still perform this by themselves if there's a need
to. In some cases powering on the device during probe is undesirable, and
this change enables a driver to choose what fits best for it.

Add a field called "flags" into struct i2c_driver for driver flags, and a
flag I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to tell a driver supports probe in
low power state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 19 ++++++++++++++++---
 include/linux/i2c.h         | 14 ++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5ec082e2039d9..cfb1e777c6196 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -436,6 +436,16 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 	return irq > 0 ? irq : -ENXIO;
 }
 
+static bool allow_low_power_probe(struct device *dev)
+{
+	struct i2c_driver *driver = to_i2c_driver(dev->driver);
+
+	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
+		!acpi_dev_get_property(ACPI_COMPANION(dev),
+				       "i2c-allow-low-power-probe",
+				       ACPI_TYPE_ANY, NULL);
+}
+
 static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
@@ -514,7 +524,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev, true);
+	status = dev_pm_domain_attach(&client->dev,
+				      !allow_low_power_probe(&client->dev));
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -536,7 +547,8 @@ static int i2c_device_probe(struct device *dev)
 	return 0;
 
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev,
+			     !allow_low_power_probe(&client->dev));
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -562,7 +574,8 @@ static int i2c_device_remove(struct device *dev)
 		status = driver->remove(client);
 	}
 
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev,
+			     !allow_low_power_probe(&client->dev));
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fc55ea41d3237..f8c3257a8bb25 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -11,6 +11,7 @@
 #define _LINUX_I2C_H
 
 #include <linux/acpi.h>		/* for acpi_handle */
+#include <linux/bits.h>
 #include <linux/mod_devicetable.h>
 #include <linux/device.h>	/* for struct device */
 #include <linux/sched.h>	/* for completion */
@@ -217,6 +218,16 @@ enum i2c_alert_protocol {
 	I2C_PROTOCOL_SMBUS_HOST_NOTIFY,
 };
 
+/**
+ * enum i2c_driver_flags - Flags for an I2C device driver
+ *
+ * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the ACPI driver manage the device's
+ *				      power state during probe and remove
+ */
+enum i2c_driver_flags {
+	I2C_DRV_FL_ALLOW_LOW_POWER_PROBE = BIT(0),
+};
+
 /**
  * struct i2c_driver - represent an I2C device driver
  * @class: What kind of i2c device we instantiate (for detect)
@@ -231,6 +242,7 @@ enum i2c_alert_protocol {
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
  * @clients: List of detected clients we created (for i2c-core use only)
+ * @flags: A bitmask of flags defined in &enum i2c_driver_flags
  *
  * The driver.owner field should be set to the module owner of this driver.
  * The driver.name field should be set to the name of this driver.
@@ -289,6 +301,8 @@ struct i2c_driver {
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
 	struct list_head clients;
+
+	u32 flags;
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
-- 
2.20.1

