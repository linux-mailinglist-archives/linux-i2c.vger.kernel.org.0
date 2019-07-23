Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21ED77222B
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 00:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392444AbfGWWTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 18:19:22 -0400
Received: from foss.arm.com ([217.140.110.172]:60776 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392434AbfGWWTV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jul 2019 18:19:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E61F1684;
        Tue, 23 Jul 2019 15:19:20 -0700 (PDT)
Received: from dawn-kernel.cambridge.arm.com (unknown [10.1.197.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7DCB3F694;
        Tue, 23 Jul 2019 15:19:18 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: [PATCH v3 5/7] drivers: Introduce device lookup variants by ACPI_COMPANION device
Date:   Tue, 23 Jul 2019 23:18:36 +0100
Message-Id: <20190723221838.12024-6-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190723221838.12024-1-suzuki.poulose@arm.com>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a generic helper to match a device by the ACPI_COMPANION device
and provide wrappers for the device lookup APIs.

Cc: Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/base/core.c         |  6 ++++
 drivers/i2c/i2c-core-acpi.c | 11 ++-----
 drivers/spi/spi.c           |  8 +----
 include/linux/device.h      | 65 +++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3abc32b60c0a..57d71bc2c559 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3373,3 +3373,9 @@ int device_match_devt(struct device *dev, const void *pdevt)
 	return dev->devt == *(dev_t *)pdevt;
 }
 EXPORT_SYMBOL_GPL(device_match_devt);
+
+int device_match_acpi_dev(struct device *dev, const void *adev)
+{
+	return ACPI_COMPANION(dev) == adev;
+}
+EXPORT_SYMBOL(device_match_acpi_dev);
diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 4dbbc9a35f65..bc80aafb521f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -354,17 +354,11 @@ static int i2c_acpi_find_match_adapter(struct device *dev, const void *data)
 	return ACPI_HANDLE(dev) == (acpi_handle)data;
 }
 
-static int i2c_acpi_find_match_device(struct device *dev, const void *data)
-{
-	return ACPI_COMPANION(dev) == data;
-}
 
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
-	struct device *dev;
+	struct device *dev = bus_find_device_by_acpi_dev(&i2c_bus_type, handle);
 
-	dev = bus_find_device(&i2c_bus_type, NULL, handle,
-			      i2c_acpi_find_match_adapter);
 	return dev ? i2c_verify_adapter(dev) : NULL;
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
@@ -373,8 +367,7 @@ static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
 {
 	struct device *dev;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, adev,
-			      i2c_acpi_find_match_device);
+	dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
 	return dev ? i2c_verify_client(dev) : NULL;
 }
 
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a591da87981a..c486a6f84c2c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3741,11 +3741,6 @@ static int spi_acpi_controller_match(struct device *dev, const void *data)
 	return ACPI_COMPANION(dev->parent) == data;
 }
 
-static int spi_acpi_device_match(struct device *dev, const void *data)
-{
-	return ACPI_COMPANION(dev) == data;
-}
-
 static struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev)
 {
 	struct device *dev;
@@ -3765,8 +3760,7 @@ static struct spi_device *acpi_spi_find_device_by_adev(struct acpi_device *adev)
 {
 	struct device *dev;
 
-	dev = bus_find_device(&spi_bus_type, NULL, adev, spi_acpi_device_match);
-
+	dev = bus_find_device_by_acpi_dev(&spi_bus_type, adev);
 	return dev ? to_spi_device(dev) : NULL;
 }
 
diff --git a/include/linux/device.h b/include/linux/device.h
index 93b2f55ef44e..7514ef3d3f1a 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -168,6 +168,7 @@ int device_match_name(struct device *dev, const void *name);
 int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);
+int device_match_acpi_dev(struct device *dev, const void *adev);
 
 int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
 		     int (*fn)(struct device *dev, void *data));
@@ -224,6 +225,28 @@ static inline struct device *bus_find_device_by_devt(struct bus_type *bus,
 	return bus_find_device(bus, NULL, &devt, device_match_devt);
 }
 
+#ifdef CONFIG_ACPI
+struct acpi_device;
+
+/**
+ * bus_find_device_by_acpi_dev : device iterator for locating a particular device
+ * matching the ACPI COMPANION device.
+ * @bus: bus type
+ * @adev: ACPI COMPANION device to match.
+ */
+static inline struct device *
+bus_find_device_by_acpi_dev(struct bus_type *bus, const struct acpi_device *adev)
+{
+	return bus_find_device(bus, NULL, adev, device_match_acpi_dev);
+}
+#else
+static inline struct device *
+bus_find_device_by_acpi_dev(struct bus_type *bus, const void *adev)
+{
+	return NULL;
+}
+#endif
+
 struct device *subsys_find_device_by_id(struct bus_type *bus, unsigned int id,
 					struct device *hint);
 int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
@@ -442,6 +465,27 @@ static inline struct device *driver_find_device_by_devt(struct device_driver *dr
 	return driver_find_device(drv, NULL, &devt, device_match_devt);
 }
 
+#ifdef CONFIG_ACPI
+/**
+ * driver_find_device_by_acpi_dev : device iterator for locating a particular
+ * device matching the ACPI_COMPANION device.
+ * @driver: the driver we're iterating
+ * @adev: ACPI_COMPANION device to match.
+ */
+static inline struct device *
+driver_find_device_by_acpi_dev(struct device_driver *drv,
+			       const struct acpi_device *adev)
+{
+	return driver_find_device(drv, NULL, adev, device_match_acpi_dev);
+}
+#else
+static inline struct device *
+driver_find_device_by_acpi_dev(struct device_driver *drv, const void *adev)
+{
+	return NULL;
+}
+#endif
+
 void driver_deferred_probe_add(struct device *dev);
 int driver_deferred_probe_check_state(struct device *dev);
 int driver_deferred_probe_check_state_continue(struct device *dev);
@@ -620,6 +664,27 @@ static inline struct device *class_find_device_by_devt(struct class *class,
 	return class_find_device(class, NULL, &devt, device_match_devt);
 }
 
+#ifdef CONFIG_ACPI
+struct acpi_device;
+/**
+ * class_find_device_by_acpi_dev : device iterator for locating a particular
+ * device matching the ACPI_COMPANION device.
+ * @class: class type
+ * @adev: ACPI_COMPANION device to match.
+ */
+static inline struct device *
+class_find_device_by_acpi_dev(struct class *class, const struct acpi_device *adev)
+{
+	return class_find_device(class, NULL, adev, device_match_acpi_dev);
+}
+#else
+static inline struct device *
+class_find_device_by_acpi_dev(struct class *class, const void *adev)
+{
+	return NULL;
+}
+#endif
+
 struct class_attribute {
 	struct attribute attr;
 	ssize_t (*show)(struct class *class, struct class_attribute *attr,
-- 
2.21.0

