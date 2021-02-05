Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3766A311601
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhBEWrv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:47:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:3425 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229785AbhBEN2w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:28:52 -0500
IronPort-SDR: x5pevTuE5EHdXLMUh/y0TebDoTBBidkkChawExMcuPToW66pUkgQGhZZCtT+GiPChTlhmKnvSk
 Z8ElkppSJ/cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181495980"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="181495980"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:55 -0800
IronPort-SDR: gfp2U/xboQ5uRr6A/nV02d4+tku7J8fLeCZ4JSb7z1Cd9N5VhWaoqoOP2SX+P4+9xrueqrAdCp
 ttcbiT3HZfGw==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="576645181"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:53 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 892E020757;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GI-Ai; Fri, 05 Feb 2021 15:25:05 +0200
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
Subject: [PATCH v10 2/7] i2c: Allow an ACPI driver to manage the device's power state during probe
Date:   Fri,  5 Feb 2021 15:25:00 +0200
Message-Id: <20210205132505.20173-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/i2c/i2c-core-acpi.c | 10 ++++++++++
 drivers/i2c/i2c-core-base.c |  9 ++++++---
 include/linux/i2c.h         | 19 +++++++++++++++++++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8ceaa88dd78fb..7bab8b9126ee6 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -493,6 +493,16 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
 
+bool i2c_acpi_allow_low_power_probe(struct device *dev)
+{
+	struct i2c_driver *driver = to_i2c_driver(dev->driver);
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
+		adev && adev->power.state_for_enumeration >= adev->power.state;
+}
+EXPORT_SYMBOL_GPL(i2c_acpi_allow_low_power_probe);
+
 #ifdef CONFIG_ACPI_I2C_OPREGION
 static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
 		u8 cmd, u8 *data, u8 data_len)
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a4248..87b84eee01da6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -514,7 +514,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev, true);
+	status = dev_pm_domain_attach(&client->dev,
+				      !i2c_acpi_allow_low_power_probe(dev));
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -536,7 +537,8 @@ static int i2c_device_probe(struct device *dev)
 	return 0;
 
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev,
+			     !i2c_acpi_allow_low_power_probe(dev));
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -563,7 +565,8 @@ static int i2c_device_remove(struct device *dev)
 			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(status));
 	}
 
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev,
+			     !i2c_acpi_allow_low_power_probe(dev));
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b2158..1a103c5933d2f 100644
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
 
@@ -996,6 +1010,7 @@ u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
+bool i2c_acpi_allow_low_power_probe(struct device *dev);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 					     struct acpi_resource_i2c_serialbus **i2c)
@@ -1015,6 +1030,10 @@ static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle ha
 {
 	return NULL;
 }
+static inline bool i2c_acpi_allow_low_power_probe(struct device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _LINUX_I2C_H */
-- 
2.20.1

