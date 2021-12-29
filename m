Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707C848177F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhL2XOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:14:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53582 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232879AbhL2XOq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FTvLO5CtbVAXFHr/CFpPv9p8S75DsdZa2nrJRHza0xA=;
        b=HbUQC6/e7ZJRrX3CBMnf3GFNFmMDgrzs8Jwl6/WefsXaeUaQvmyQKXq9P4GfkvMROd9PKe
        vqzbcP5o8a7OCKdc0U0Q0saWxU/3SkRyBWk+dL4KSggisykTAQaCRkVrJ4NGzcpAXWYJiS
        igkv0ETLE7ePJ5HjSKQFX4b8kGeBEe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-vAh5o2NbORKaiAVergIe1g-1; Wed, 29 Dec 2021 18:14:40 -0500
X-MC-Unique: vAh5o2NbORKaiAVergIe1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DEDE801B2A;
        Wed, 29 Dec 2021 23:14:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7330C1042A7F;
        Wed, 29 Dec 2021 23:14:35 +0000 (UTC)
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
Subject: [PATCH 01/12] ACPI / x86: Add acpi_quirk_skip_[i2c_client|serdev]_enumeration() helpers
Date:   Thu, 30 Dec 2021 00:14:20 +0100
Message-Id: <20211229231431.437982-2-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 drivers/acpi/x86/utils.c | 96 ++++++++++++++++++++++++++++++++++++++++
 include/acpi/acpi_bus.h  | 16 +++++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index a2ae1ac41319..3ac7b477f2e8 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -10,6 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/platform_device.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include "../internal.h"
@@ -208,3 +209,98 @@ bool force_storage_d3(void)
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
+bool acpi_quirk_skip_i2c_client_enumeration(void)
+{
+	const struct dmi_system_id *dmi_id;
+	long quirks = 0;
+
+	dmi_id = dmi_first_match(acpi_skip_serial_bus_enumeration_ids);
+	if (dmi_id)
+		quirks = (unsigned long)dmi_id->driver_data;
+
+	return (quirks & ACPI_QUIRK_SKIP_I2C_CLIENTS);
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
+
+#endif
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 5895f6c7f6db..54652dc4ee74 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -624,6 +624,22 @@ static inline bool acpi_device_override_status(struct acpi_device *adev,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
+bool acpi_quirk_skip_i2c_client_enumeration(void);
+int acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip);
+#else
+static inline bool acpi_quirk_skip_i2c_client_enumeration(void)
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

