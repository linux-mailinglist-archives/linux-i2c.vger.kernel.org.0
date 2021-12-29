Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1314817AC
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 00:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhL2XPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Dec 2021 18:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46519 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233083AbhL2XPe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Dec 2021 18:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640819734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m8EU9J0c/TaatBioeQmN+Zx8f6lc3hvej2FNIrlPMy8=;
        b=At9qg6Pl6J4vGUoVAqYgbc5mOMtnOWoYJftfEfsMOZXjGLaPtUbEKFUkY6aWnvtGvl4luR
        voTyiDDj//nl/OfqEC7y5P7yfUWXl286Rn4gZPlum4hr1t51zA20dIQKGh2Rmei+Yhq+NE
        5imdQtyLK7YmS7S0X6i47HSKYGWRc38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-qGeJnb7VPj6yPw-U75gq2Q-1; Wed, 29 Dec 2021 18:15:28 -0500
X-MC-Unique: qGeJnb7VPj6yPw-U75gq2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A15E801ADC;
        Wed, 29 Dec 2021 23:15:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 99F791037F5B;
        Wed, 29 Dec 2021 23:15:23 +0000 (UTC)
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
Subject: [PATCH 12/12] platform/x86: x86-android-tablets: Add TM800A550L data
Date:   Thu, 30 Dec 2021 00:14:31 +0100
Message-Id: <20211229231431.437982-13-hdegoede@redhat.com>
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The whitelabel (sold as various brands) TM800A550L tablets's DSDT contains
a whole bunch of bogus ACPI I2C devices and the ACPI node describing
the touchscreen is bad (the IRQ is missing). Enumeration of these is
skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the (now) missing I2C devices by
adding the necessary device info to the x86-android-tablets module,
including instantiating an actually working i2c-client for
the touchscreen.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index fb257b5811d3..5f66fab6100e 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -534,6 +534,86 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
 };
 
+/*
+ * Whitelabel (sold as various brands) TM800A550L tablets.
+ * These tablet's DSDT contains a whole bunch of bogus ACPI I2C devices
+ * (removed through acpi_quirk_skip_i2c_client_enumeration()) and
+ * the touchscreen fwnode has the wrong GPIOs.
+ */
+static const char * const whitelabel_tm800a550l_accel_mount_matrix[] = {
+	"-1", "0", "0",
+	"0", "1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry whitelabel_tm800a550l_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", whitelabel_tm800a550l_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node whitelabel_tm800a550l_accel_node = {
+	.properties = whitelabel_tm800a550l_accel_props,
+};
+
+static const struct property_entry whitelabel_tm800a550l_goodix_props[] = {
+	PROPERTY_ENTRY_STRING("firmware-name", "gt912-tm800a550l.fw"),
+	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-tm800a550l.cfg"),
+	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
+	{ }
+};
+
+static const struct software_node whitelabel_tm800a550l_goodix_node = {
+	.properties = whitelabel_tm800a550l_goodix_props,
+};
+
+static const struct x86_i2c_client_info whitelabel_tm800a550l_i2c_clients[] __initconst = {
+	{
+		/* goodix touchscreen */
+		.board_info = {
+			.type = "GDIX1001:00",
+			.addr = 0x14,
+			.dev_name = "goodix_ts",
+			.swnode = &whitelabel_tm800a550l_goodix_node,
+		},
+		.adapter_path = "\\_SB_.I2C2",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x44,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}, {
+		/* kxcj91008 accel */
+		.board_info = {
+			.type = "kxcj91008",
+			.addr = 0x0f,
+			.dev_name = "kxcj91008",
+			.swnode = &whitelabel_tm800a550l_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+	},
+};
+
+static struct gpiod_lookup_table whitelabel_tm800a550l_goodix_gpios = {
+	.dev_id = "i2c-goodix_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 3, "irq", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table *whitelabel_tm800a550l_gpios[] = {
+	&whitelabel_tm800a550l_goodix_gpios,
+	NULL
+};
+
+static const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
+	.i2c_client_info = whitelabel_tm800a550l_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(whitelabel_tm800a550l_i2c_clients),
+	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
+};
+
 static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 	{
 		/* Asus MeMO Pad 7 ME176C */
@@ -568,6 +648,16 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&xiaomi_mipad2_info,
 	},
+	{
+		/* Whitelabel (sold as various brands) TM800A550L */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
+		},
+		.driver_data = (void *)&whitelabel_tm800a550l_info,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
-- 
2.33.1

