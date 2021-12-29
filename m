Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453F04817A5
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhL2XPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45396 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232804AbhL2XPP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HUiRYAhdhZm2jpUL+xqATRmjcFWAJoSU4byUqlhxiT0=;
        b=fXJ+C52MdMkhPM8/Q8Ll7CMgqAahan9+ts/VtSgCUYqGRTwnCKvGAN/CLsXyI/VIiZewZM
        QAr0GH/yN2IC26wvLnFPshX5lr7AQ47sOrOws9BFAbrpZ6pWwhDN261k3ZywP6P/AdPA1A
        B5nCVno3hqttbuFS0ck2MY0GVIQLb+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-zh0Nc-yRPqy4M3SXHpGkyQ-1; Wed, 29 Dec 2021 18:15:09 -0500
X-MC-Unique: zh0Nc-yRPqy4M3SXHpGkyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0EA01006AA0;
        Wed, 29 Dec 2021 23:15:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E0F401037F5B;
        Wed, 29 Dec 2021 23:15:02 +0000 (UTC)
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
Subject: [PATCH 10/12] platform/x86: x86-android-tablets: Add Asus TF103C data
Date:   Thu, 30 Dec 2021 00:14:29 +0100
Message-Id: <20211229231431.437982-11-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Asus TF103C tablets have an Android factory img with everything hardcoded
in the kernel instead of properly described in the DSDT.

Add support for manually instantiating all the missing I2C devices by
adding the necessary device info to the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 3c01c8607c26..1f4300e837c6 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/power/bq24190_charger.h>
 #include <linux/serdev.h>
 #include <linux/string.h>
 /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
@@ -152,6 +153,162 @@ struct x86_dev_info {
 	int serdev_count;
 };
 
+/* Generic / shared bq24190 settings */
+static const char * const bq24190_suppliers[] = { "tusb1210-psy" };
+
+static const struct property_entry bq24190_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node bq24190_node = {
+	.properties = bq24190_props,
+};
+
+/* For enableing the bq24190 5V boost based on id-pin */
+static struct regulator_consumer_supply intel_int3496_consumer = {
+	.supply = "vbus",
+	.dev_name = "intel-int3496",
+};
+
+static const struct regulator_init_data bq24190_vbus_init_data = {
+	.constraints = {
+		.name = "bq24190_vbus",
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.consumer_supplies = &intel_int3496_consumer,
+	.num_consumer_supplies = 1,
+};
+
+static struct bq24190_platform_data bq24190_pdata = {
+	.regulator_init_data = &bq24190_vbus_init_data,
+};
+
+static const char * const bq24190_modules[] __initconst = {
+	"crystal_cove_charger", /* For the bq24190 IRQ */
+	"bq24190_charger",      /* For the Vbus regulator for intel-int3496 */
+	NULL
+};
+
+/* Generic pdevs array and gpio-lookups for micro USB ID pin handling */
+static const struct platform_device_info int3496_pdevs[] __initconst = {
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+	},
+};
+
+static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 22, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+/* Asus TF103C tablets have an Android factory img with everything hardcoded */
+static const char * const asus_tf103c_accel_mount_matrix[] = {
+	"0", "-1", "0",
+	"-1", "0", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry asus_tf103c_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", asus_tf103c_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node asus_tf103c_accel_node = {
+	.properties = asus_tf103c_accel_props,
+};
+
+static const struct property_entry asus_tf103c_touchscreen_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "atmel,atmel_mxt_ts"),
+	{ }
+};
+
+static const struct software_node asus_tf103c_touchscreen_node = {
+	.properties = asus_tf103c_touchscreen_props,
+};
+
+static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst = {
+	{
+		/* bq24190 battery charger */
+		.board_info = {
+			.type = "bq24190",
+			.addr = 0x6b,
+			.dev_name = "bq24190",
+			.swnode = &bq24190_node,
+			.platform_data = &bq24190_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_PMIC,
+			.chip = "\\_SB_.I2C7.PMIC",
+			.domain = DOMAIN_BUS_WAKEUP,
+			.index = 0,
+		},
+	}, {
+		/* ug3105 battery monitor */
+		.board_info = {
+			.type = "ug3105",
+			.addr = 0x70,
+			.dev_name = "ug3105",
+		},
+		.adapter_path = "\\_SB_.I2C1",
+	}, {
+		/* ak09911 compass */
+		.board_info = {
+			.type = "ak09911",
+			.addr = 0x0c,
+			.dev_name = "ak09911",
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* kxtj21009 accel */
+		.board_info = {
+			.type = "kxtj21009",
+			.addr = 0x0f,
+			.dev_name = "kxtj21009",
+			.swnode = &asus_tf103c_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* atmel touchscreen */
+		.board_info = {
+			.type = "atmel_mxt_ts",
+			.addr = 0x4a,
+			.dev_name = "atmel_mxt_ts",
+			.swnode = &asus_tf103c_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 28,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static struct gpiod_lookup_table *asus_tf103c_gpios[] = {
+	&int3496_gpo2_pin22_gpios,
+	NULL
+};
+
+static const struct x86_dev_info asus_tf103c_info __initconst = {
+	.i2c_client_info = asus_tf103c_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.gpiod_lookup_tables = asus_tf103c_gpios,
+	.modules = bq24190_modules,
+};
+
 /*
  * When booted with the BIOS set to Android mode the Chuwi Hi8 (CWI509) DSDT
  * contains a whole bunch of bogus ACPI I2C devices and is missing entries
@@ -268,6 +425,14 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 };
 
 static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Asus TF103C */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
+		},
+		.driver_data = (void *)&asus_tf103c_info,
+	},
 	{
 		/* Chuwi Hi8 (CWI509) */
 		.matches = {
-- 
2.33.1

