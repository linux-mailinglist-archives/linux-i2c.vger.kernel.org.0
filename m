Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DCA481CEF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 15:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhL3ORk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 09:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48306 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239777AbhL3ORi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 09:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640873855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2n8AIgZnsDFRsipvor7afMsNdHwhzwmC/kCCTsAbfDY=;
        b=YU5UWf1Ra+Iqnhogtr02KJZVhpK7+7Rb1CferqWtTBxlie4PYblzPoUhB3ps9r4h2Z4+HL
        P3PojJwBXD/mtC6+QULl5u6NCcMMdPjIrR7RrAg9JHiNGblXzLr5YCID20++/oWZgsfDtB
        i7N7aUIkgD+7tlWqZRdn2CJ6ddV2ww0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-1d9mS4SmMPCZndRinITOGQ-1; Thu, 30 Dec 2021 09:17:33 -0500
X-MC-Unique: 1d9mS4SmMPCZndRinITOGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B1018460E7;
        Thu, 30 Dec 2021 14:17:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.254])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 24CA17BB63;
        Thu, 30 Dec 2021 14:17:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 1/3] ACPI / x86: Add acpi_quirk_skip_[i2c_client|serdev]_enumeration() helpers
Date:   Thu, 30 Dec 2021 15:17:20 +0100
Message-Id: <20211230141722.512395-2-hdegoede@redhat.com>
In-Reply-To: <20211230141722.512395-1-hdegoede@redhat.com>
References: <20211230141722.512395-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

x86 ACPI boards which ship with only Android as their factory image usually
declare a whole bunch of bogus I2C devs in their ACPI tables and sometimes
there are issues with serdev devices on these boards too, e.g. the resource
points to the wrong serdev_controller.

Instantiating I2C / serdev devs for these bogus devs causes various issues,
e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
The Android x86 kernel fork shipped on these devices has some special code
to remove the bogus I2C clients (and serdevs are ignored completely).

Introduce acpi_quirk_skip_i2c_client_enumeration() and
acpi_quirk_skip_serdev_enumeration() helpers. Which can be used by the I2C/
serdev code to skip instantiating any I2C or serdev devs on broken boards.

These 2 helpers are added to drivers/acpi/x86/utils.c so that the DMI table
can be shared between the I2C and serdev code.

Note these boards typically do actually have I2C and serdev devices, just
different ones then the ones described in their DSDT. The devices which
are actually present are manually instantiated by the
drivers/platform/x86/x86-android-tablets.c kernel module.

The new helpers are only build if CONFIG_X86_ANDROID_TABLETS is enabled,
otherwise they are empty stubs to not unnecessarily grow the kernel size.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Move the i2c_acpi_known_good_ids[] list and checking into this patch /
  into the new acpi_quirk_skip_i2c_client_enumeration() function
---
 drivers/acpi/x86/utils.c | 111 +++++++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h  |  16 ++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index a2ae1ac41319..375a0911f06d 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -10,6 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/platform_device.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include "../internal.h"
@@ -208,3 +209,113 @@ bool force_storage_d3(void)
 {
 	return x86_match_cpu(storage_d3_cpu_ids);
 }
+
+#if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
+/*
+ * x86 ACPI boards which ship with only Android as their factory image usually
+ * declare a whole bunch of bogus I2C devices in their ACPI tables and sometimes
+ * there are issues with serdev devices on these boards too, e.g. the resource
+ * points to the wrong serdev_controller.
+ *
+ * Instantiating I2C / serdev devs for these bogus devs causes various issues,
+ * e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
+ * The Android x86 kernel fork shipped on these devices has some special code
+ * to remove the bogus I2C clients (and AFAICT serdevs are ignored completely).
+ *
+ * The acpi_quirk_skip_*_enumeration() functions below are used by the I2C or
+ * serdev code to skip instantiating any I2C or serdev devs on broken boards.
+ *
+ * In case of I2C an exception is made for HIDs on the i2c_acpi_known_good_ids
+ * list. These are known to always be correct (and in case of the audio-codecs
+ * the drivers heavily rely on the codec being enumerated through ACPI).
+ *
+ * Note these boards typically do actually have I2C and serdev devices,
+ * just different ones then the ones described in their DSDT. The devices
+ * which are actually present are manually instantiated by the
+ * drivers/platform/x86/x86-android-tablets.c kernel module.
+ */
+#define ACPI_QUIRK_SKIP_I2C_CLIENTS				BIT(0)
+#define ACPI_QUIRK_UART1_TTY_UART2_SKIP				BIT(1)
+
+static const struct dmi_system_id acpi_skip_serial_bus_enumeration_ids[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
+		},
+		.driver_data = (void *)(ACPI_QUIRK_SKIP_I2C_CLIENTS |
+					ACPI_QUIRK_UART1_TTY_UART2_SKIP),
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
+		},
+		.driver_data = (void *)ACPI_QUIRK_SKIP_I2C_CLIENTS,
+	},
+	{
+		/* Whitelabel (sold as various brands) TM800A550L */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
+		},
+		.driver_data = (void *)ACPI_QUIRK_SKIP_I2C_CLIENTS,
+	},
+	{}
+};
+
+static const struct acpi_device_id i2c_acpi_known_good_ids[] = {
+	{ "10EC5640", 0 }, /* RealTek ALC5640 audio codec */
+	{ "INT33F4", 0 },  /* X-Powers AXP288 PMIC */
+	{ "INT33FD", 0 },  /* Intel Crystal Cove PMIC */
+	{ "NPCE69A", 0 },  /* Asus Transformer keyboard dock */
+	{}
+};
+
+bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev)
+{
+	const struct dmi_system_id *dmi_id;
+	long quirks;
+
+	dmi_id = dmi_first_match(acpi_skip_serial_bus_enumeration_ids);
+	if (!dmi_id)
+		return false;
+
+	quirks = (unsigned long)dmi_id->driver_data;
+	if (!(quirks & ACPI_QUIRK_SKIP_I2C_CLIENTS))
+		return false;
+
+	return acpi_match_device_ids(adev, i2c_acpi_known_good_ids);
+}
+EXPORT_SYMBOL_GPL(acpi_quirk_skip_i2c_client_enumeration);
+
+int acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip)
+{
+	struct acpi_device *adev = ACPI_COMPANION(controller_parent);
+	const struct dmi_system_id *dmi_id;
+	long quirks = 0;
+
+	*skip = false;
+
+	/* !dev_is_platform() to not match on PNP enumerated debug UARTs */
+	if (!adev || !adev->pnp.unique_id || !dev_is_platform(controller_parent))
+		return 0;
+
+	dmi_id = dmi_first_match(acpi_skip_serial_bus_enumeration_ids);
+	if (dmi_id)
+		quirks = (unsigned long)dmi_id->driver_data;
+
+	if (quirks & ACPI_QUIRK_UART1_TTY_UART2_SKIP) {
+		if (!strcmp(adev->pnp.unique_id, "1"))
+			return -ENODEV; /* Create tty cdev instead of serdev */
+
+		if (!strcmp(adev->pnp.unique_id, "2"))
+			*skip = true;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_quirk_skip_serdev_enumeration);
+#endif
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 5895f6c7f6db..102b1cf433c7 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -624,6 +624,22 @@ static inline bool acpi_device_override_status(struct acpi_device *adev,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
+bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev);
+int acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip);
+#else
+static inline bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev)
+{
+	return false;
+}
+static inline int
+acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip)
+{
+	*skip = false;
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_PM
 void acpi_pm_wakeup_event(struct device *dev);
 acpi_status acpi_add_pm_notifier(struct acpi_device *adev, struct device *dev,
-- 
2.33.1

