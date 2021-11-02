Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57904442AC1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 10:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhKBJwB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 05:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33429 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230179AbhKBJv7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 05:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635846563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eAvPoXksnzOjArBlT61WKMHJuEETVHI7qx8GL4lrmU=;
        b=fW3r/FcDp+qNDEk3+fJ1EI2TM7uWyQxlxZGTzhsRQkAMqVb/pmVoPoXqtcMPuNoeZODtar
        j17KKdvoUi16xVutHNV6Ld+WqD5oM1xT0V8BHRkAvWe8rhA5DEMc+J5odN2S47p8cW4WHk
        WUarIcH333E4OJcZhwFSlp8GIudoYQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-ySGzUL_GMNWxdCb5slvXrA-1; Tue, 02 Nov 2021 05:49:20 -0400
X-MC-Unique: ySGzUL_GMNWxdCb5slvXrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EF341927800;
        Tue,  2 Nov 2021 09:49:17 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1A7B05D9D5;
        Tue,  2 Nov 2021 09:49:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v5 01/11] ACPI: delay enumeration of devices with a _DEP pointing to an INT3472 device
Date:   Tue,  2 Nov 2021 10:48:57 +0100
Message-Id: <20211102094907.31271-2-hdegoede@redhat.com>
In-Reply-To: <20211102094907.31271-1-hdegoede@redhat.com>
References: <20211102094907.31271-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The clk and regulator frameworks expect clk/regulator consumer-devices
to have info about the consumed clks/regulators described in the device's
fw_node.

To work around cases where this info is not present in the firmware tables,
which is often the case on x86/ACPI devices, both frameworks allow the
provider-driver to attach info about consumers to the clks/regulators
when registering these.

This causes problems with the probe ordering wrt drivers for consumers
of these clks/regulators. Since the lookups are only registered when the
provider-driver binds, trying to get these clks/regulators before then
results in a -ENOENT error for clks and a dummy regulator for regulators.

One case where we hit this issue is camera sensors such as e.g. the OV8865
sensor found on the Microsoft Surface Go. The sensor uses clks, regulators
and GPIOs provided by a TPS68470 PMIC which is described in an INT3472
ACPI device. There is special platform code handling this and setting
platform_data with the necessary consumer info on the MFD cells
instantiated for the PMIC under: drivers/platform/x86/intel/int3472.

For this to work properly the ov8865 driver must not bind to the I2C-client
for the OV8865 sensor until after the TPS68470 PMIC gpio, regulator and
clk MFD cells have all been fully setup.

The OV8865 on the Microsoft Surface Go is just one example, all X86
devices using the Intel IPU3 camera block found on recent Intel SoCs
have similar issues where there is an INT3472 HID ACPI-device, which
describes the clks and regulators, and the driver for this INT3472 device
must be fully initialized before the sensor driver (any sensor driver)
binds for things to work properly.

On these devices the ACPI nodes describing the sensors all have a _DEP
dependency on the matching INT3472 ACPI device (there is one per sensor).

This allows solving the probe-ordering problem by delaying the enumeration
(instantiation of the I2C-client in the ov8865 example) of ACPI-devices
which have a _DEP dependency on an INT3472 device.

The new acpi_dev_ready_for_enumeration() helper used for this is also
exported because for devices, which have the enumeration_by_parent flag
set, the parent-driver will do its own scan of child ACPI devices and
it will try to enumerate those during its probe(). Code doing this such
as e.g. the i2c-core-acpi.c code must call this new helper to ensure
that it too delays the enumeration until all the _DEP dependencies are
met on devices which have the new honor_deps flag set.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Move the acpi_dev_ready_for_enumeration() check to acpi_bus_attach()
  (replacing the acpi_device_is_present() check there)
---
 drivers/acpi/scan.c     | 37 +++++++++++++++++++++++++++++++++----
 include/acpi/acpi_bus.h |  5 ++++-
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 6b939e2af544..73fab3c992d2 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -796,6 +796,12 @@ static const char * const acpi_ignore_dep_ids[] = {
 	NULL
 };
 
+/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
+static const char * const acpi_honor_dep_ids[] = {
+	"INT3472", /* Camera sensor PMIC / clk and regulator info */
+	NULL
+};
+
 static struct acpi_device *acpi_bus_get_parent(acpi_handle handle)
 {
 	struct acpi_device *device = NULL;
@@ -1757,8 +1763,12 @@ static void acpi_scan_dep_init(struct acpi_device *adev)
 	struct acpi_dep_data *dep;
 
 	list_for_each_entry(dep, &acpi_dep_list, node) {
-		if (dep->consumer == adev->handle)
+		if (dep->consumer == adev->handle) {
+			if (dep->honor_dep)
+				adev->flags.honor_deps = 1;
+
 			adev->dep_unmet++;
+		}
 	}
 }
 
@@ -1962,7 +1972,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
 	for (count = 0, i = 0; i < dep_devices.count; i++) {
 		struct acpi_device_info *info;
 		struct acpi_dep_data *dep;
-		bool skip;
+		bool skip, honor_dep;
 
 		status = acpi_get_object_info(dep_devices.handles[i], &info);
 		if (ACPI_FAILURE(status)) {
@@ -1971,6 +1981,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
 		}
 
 		skip = acpi_info_matches_ids(info, acpi_ignore_dep_ids);
+		honor_dep = acpi_info_matches_ids(info, acpi_honor_dep_ids);
 		kfree(info);
 
 		if (skip)
@@ -1984,6 +1995,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
 
 		dep->supplier = dep_devices.handles[i];
 		dep->consumer = handle;
+		dep->honor_dep = honor_dep;
 
 		mutex_lock(&acpi_dep_list_lock);
 		list_add_tail(&dep->node , &acpi_dep_list);
@@ -2150,8 +2162,8 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
 		register_dock_dependent_device(device, ejd);
 
 	acpi_bus_get_status(device);
-	/* Skip devices that are not present. */
-	if (!acpi_device_is_present(device)) {
+	/* Skip devices that are not ready for enumeration (e.g. not present) */
+	if (!acpi_dev_ready_for_enumeration(device)) {
 		device->flags.initialized = false;
 		acpi_device_clear_enumerated(device);
 		device->flags.power_manageable = 0;
@@ -2313,6 +2325,23 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
 }
 EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
 
+/**
+ * acpi_dev_ready_for_enumeration - Check if the ACPI device is ready for enumeration
+ * @device: Pointer to the &struct acpi_device to check
+ *
+ * Check if the device is present and has no unmet dependencies.
+ *
+ * Return true if the device is ready for enumeratino. Otherwise, return false.
+ */
+bool acpi_dev_ready_for_enumeration(const struct acpi_device *device)
+{
+	if (device->flags.honor_deps && device->dep_unmet)
+		return false;
+
+	return acpi_device_is_present(device);
+}
+EXPORT_SYMBOL_GPL(acpi_dev_ready_for_enumeration);
+
 /**
  * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
  * @supplier: Pointer to the dependee device
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 13d93371790e..2da53b7b4965 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -202,7 +202,8 @@ struct acpi_device_flags {
 	u32 coherent_dma:1;
 	u32 cca_seen:1;
 	u32 enumeration_by_parent:1;
-	u32 reserved:19;
+	u32 honor_deps:1;
+	u32 reserved:18;
 };
 
 /* File System */
@@ -284,6 +285,7 @@ struct acpi_dep_data {
 	struct list_head node;
 	acpi_handle supplier;
 	acpi_handle consumer;
+	bool honor_dep;
 };
 
 /* Performance Management */
@@ -693,6 +695,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
 
 void acpi_dev_clear_dependencies(struct acpi_device *supplier);
+bool acpi_dev_ready_for_enumeration(const struct acpi_device *device);
 struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
 struct acpi_device *
 acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
-- 
2.31.1

