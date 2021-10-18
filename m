Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB1A43227E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 17:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhJRPTs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 11:19:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:57163 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232105AbhJRPTk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 11:19:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228542462"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="228542462"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="661403205"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 88AEB204C0;
        Mon, 18 Oct 2021 15:17:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1mcRa5-0001fV-Hi; Mon, 18 Oct 2021 15:17:29 +0300
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
Subject: [PATCH 2/6] i2c: Allow an ACPI driver to manage the device's power state during probe
Date:   Mon, 18 Oct 2021 15:17:25 +0300
Message-Id: <20211018121729.6357-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
References: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
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
flag I2C_DRV_ACPI_WAIVE_D0_PROBE to tell a driver supports probe in ACPI D
states other than 0.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/i2c-core-acpi.c | 10 ++++++++++
 drivers/i2c/i2c-core-base.c |  7 ++++---
 include/linux/i2c.h         | 18 ++++++++++++++++++
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 546cc935e035a..c025919cdaaee 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -526,6 +526,16 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
 
+bool i2c_acpi_waive_d0_probe(struct device *dev)
+{
+	struct i2c_driver *driver = to_i2c_driver(dev->driver);
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	return driver->flags & I2C_DRV_ACPI_WAIVE_D0_PROBE &&
+		adev && adev->power.state_for_enumeration >= adev->power.state;
+}
+EXPORT_SYMBOL_GPL(i2c_acpi_waive_d0_probe);
+
 #ifdef CONFIG_ACPI_I2C_OPREGION
 static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
 		u8 cmd, u8 *data, u8 data_len)
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 54964fbe3f033..f193f90585841 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -551,7 +551,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev, true);
+	status = dev_pm_domain_attach(&client->dev,
+				      !i2c_acpi_waive_d0_probe(dev));
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -590,7 +591,7 @@ static int i2c_device_probe(struct device *dev)
 err_release_driver_resources:
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -621,7 +622,7 @@ static void i2c_device_remove(struct device *dev)
 
 	devres_release_group(&client->dev, client->devres_group_id);
 
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
 	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
 		regulator_disable(adap->bus_regulator);
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2ce3efbe9198a..16119ac1aa97e 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -11,6 +11,7 @@
 #define _LINUX_I2C_H
 
 #include <linux/acpi.h>		/* for acpi_handle */
+#include <linux/bits.h>
 #include <linux/mod_devicetable.h>
 #include <linux/device.h>	/* for struct device */
 #include <linux/sched.h>	/* for completion */
@@ -222,6 +223,15 @@ enum i2c_alert_protocol {
 	I2C_PROTOCOL_SMBUS_HOST_NOTIFY,
 };
 
+/**
+ * enum i2c_driver_flags - Flags for an I2C device driver
+ *
+ * @I2C_DRV_ACPI_WAIVE_D0_PROBE: Don't put the device in D0 state for probe
+ */
+enum i2c_driver_flags {
+	I2C_DRV_ACPI_WAIVE_D0_PROBE = BIT(0),
+};
+
 /**
  * struct i2c_driver - represent an I2C device driver
  * @class: What kind of i2c device we instantiate (for detect)
@@ -236,6 +246,7 @@ enum i2c_alert_protocol {
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
  * @clients: List of detected clients we created (for i2c-core use only)
+ * @flags: A bitmask of flags defined in &enum i2c_driver_flags
  *
  * The driver.owner field should be set to the module owner of this driver.
  * The driver.name field should be set to the name of this driver.
@@ -294,6 +305,8 @@ struct i2c_driver {
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
 	struct list_head clients;
+
+	u32 flags;
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
@@ -1015,6 +1028,7 @@ u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
+bool i2c_acpi_waive_d0_probe(struct device *dev);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 					     struct acpi_resource_i2c_serialbus **i2c)
@@ -1038,6 +1052,10 @@ static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle ha
 {
 	return NULL;
 }
+static inline bool i2c_acpi_waive_d0_probe(struct device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _LINUX_I2C_H */
-- 
2.30.2

