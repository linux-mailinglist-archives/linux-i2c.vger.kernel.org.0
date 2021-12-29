Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8DF4817AA
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbhL2XPc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32609 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233083AbhL2XP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819729;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7ivIG2KEEuOIoKvhqYO3zWlD+ksLVGpTusaJREZYNw0=;
        b=D+MJABSGHbZv6RlwNumakxsHBhD7Io0blIzRGpr6RYJr8N+EktqVmt4owMWJ39lFGjJ/q5
        mU7bzuEtBcn/h7/XbfoTjQAZNGjcaUU/V2qk6P3EeWujnK3LhJ79jRi3keXp1CuZOsddvW
        ync2pqNj91TXrh0MCXVgWTr6Kqk2ZJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-vSiv7OK8PNmXPF5lgxgneQ-1; Wed, 29 Dec 2021 18:15:25 -0500
X-MC-Unique: vSiv7OK8PNmXPF5lgxgneQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FAFE80BCAB;
        Wed, 29 Dec 2021 23:15:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 341C51037F5B;
        Wed, 29 Dec 2021 23:15:08 +0000 (UTC)
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
Subject: [PATCH 11/12] platform/x86: x86-android-tablets: Add Asus MeMO Pad 7 ME176C data
Date:   Thu, 30 Dec 2021 00:14:30 +0100
Message-Id: <20211229231431.437982-12-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Asus MeMO Pad 7 ME176C tablets have an Android factory img with everything
hardcoded in the kernel instead of properly described in the DSDT.

Add support for manually instantiating all the missing I2C devices by
adding the necessary device info to the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 1f4300e837c6..fb257b5811d3 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -209,6 +209,116 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
+/* Asus ME176C tablets have an Android factory img with everything hardcoded */
+static const char * const asus_me176c_accel_mount_matrix[] = {
+	"-1", "0", "0",
+	"0", "1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry asus_me176c_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", asus_me176c_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node asus_me176c_accel_node = {
+	.properties = asus_me176c_accel_props,
+};
+
+static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
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
+			.swnode = &asus_me176c_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* goodix touchscreen */
+		.board_info = {
+			.type = "GDIX1001:00",
+			.addr = 0x14,
+			.dev_name = "goodix_ts",
+		},
+		.adapter_path = "\\_SB_.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x45,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static const struct x86_serdev_info asus_me176c_serdevs[] __initconst = {
+	{
+		.ctrl_hid = "80860F0A",
+		.ctrl_uid = "2",
+		.ctrl_devname = "serial0",
+		.serdev_hid = "BCM2E3A",
+	},
+};
+
+static struct gpiod_lookup_table asus_me176c_goodix_gpios = {
+	.dev_id = "i2c-goodix_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 28, "irq", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table *asus_me176c_gpios[] = {
+	&int3496_gpo2_pin22_gpios,
+	&asus_me176c_goodix_gpios,
+	NULL
+};
+
+static const struct x86_dev_info asus_me176c_info __initconst = {
+	.i2c_client_info = asus_me176c_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.serdev_info = asus_me176c_serdevs,
+	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
+	.gpiod_lookup_tables = asus_me176c_gpios,
+	.modules = bq24190_modules,
+};
+
 /* Asus TF103C tablets have an Android factory img with everything hardcoded */
 static const char * const asus_tf103c_accel_mount_matrix[] = {
 	"0", "-1", "0",
@@ -425,6 +535,14 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 };
 
 static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Asus MeMO Pad 7 ME176C */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
+		},
+		.driver_data = (void *)&asus_me176c_info,
+	},
 	{
 		/* Asus TF103C */
 		.matches = {
-- 
2.33.1

