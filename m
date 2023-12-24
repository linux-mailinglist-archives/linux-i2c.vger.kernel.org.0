Return-Path: <linux-i2c+bounces-988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B181DC9C
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D678CB21206
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E153A1078A;
	Sun, 24 Dec 2023 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gk0JsODb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01606101F2
	for <linux-i2c@vger.kernel.org>; Sun, 24 Dec 2023 21:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703453814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lb25sq0+wB67QTg81UUdstC8JMEvzMhGynpgZyMjSbc=;
	b=Gk0JsODbqexjNbh9LPlnq0ram/3zoZE8JpOLdqv4MfDl8eQg+DQfDsf9xRNmm7pSEK648U
	mRd6q0p2BUCeiVwqfO5duRP3Diqrgq5NANdy+XNPQQToSfFfXIG6SBEuQWZ1XUT/FKovqN
	Bmfod6wdJ4cp2woZk/4b7KfWb/o4CpI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-akAnjipGNz-c5TWiXcihaA-1; Sun, 24 Dec 2023 16:36:51 -0500
X-MC-Unique: akAnjipGNz-c5TWiXcihaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57F14807E6D;
	Sun, 24 Dec 2023 21:36:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A13A32026D66;
	Sun, 24 Dec 2023 21:36:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an i2c_client for the IIO st_accel driver
Date: Sun, 24 Dec 2023 22:36:21 +0100
Message-ID: <20231224213629.395741-6-hdegoede@redhat.com>
In-Reply-To: <20231224213629.395741-1-hdegoede@redhat.com>
References: <20231224213629.395741-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Instead of instantiating an i2c_client for the old misc joystick emulation
and freefall driver: drivers/misc/lis3lv02d/lis3lv02d.c use
i2c_client_id-s from the IIO st_accel driver so that the accelerometer
gets presented to userspace as an IIO device like all modern accelerometer
drivers do.

Add a new use_misc_lis3lv02d module-parameter which can be set to restore
the old behavior in case someone has a use-case depending on this.

When the st_accel IIO driver is used, also pass the IRQ to the i2c_client
and disable the /dev/freefall chardev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 82 ++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 7f7c9452a983..bb1d3e439761 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -10,6 +10,7 @@
  */
 
 #define DRIVER_NAME "smo8800"
+#define LIS3_WHO_AM_I 0x0f
 
 #include <linux/device/bus.h>
 #include <linux/dmi.h>
@@ -24,6 +25,10 @@
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
+static bool use_misc_lis3lv02d;
+module_param(use_misc_lis3lv02d, bool, 0444);
+MODULE_PARM_DESC(use_misc_lis3lv02d, "Use /dev/freefall chardev + evdev joystick emulation instead of iio accel driver");
+
 struct smo8800_device {
 	u32 irq;                     /* acpi device irq */
 	atomic_t counter;            /* count after last read */
@@ -141,6 +146,65 @@ static int smo8800_find_i801(struct device *dev, void *data)
 	return 1;
 }
 
+/*
+ * Set label to let iio-sensor-proxy know these freefall sensors are located in
+ * the laptop base (not the display) and are not intended for screen rotation.
+ */
+static const struct property_entry smo8800_accel_props[] = {
+	PROPERTY_ENTRY_STRING("label", "accel-base"),
+	{}
+};
+
+const struct software_node smo8800_accel_node = {
+	.properties = smo8800_accel_props,
+};
+
+static int smo8800_detect_accel(struct smo8800_device *smo8800,
+				struct i2c_adapter *adap, u8 addr,
+				struct i2c_board_info *info)
+{
+	union i2c_smbus_data smbus_data;
+	const char *type;
+	int err;
+
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
+			     I2C_SMBUS_BYTE_DATA, &smbus_data);
+	if (err < 0) {
+		dev_warn(smo8800->dev, "Failed to read who-am-i register: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * These who-am-i register mappings to model strings have been
+	 * taken from the old /dev/freefall chardev and joystick driver:
+	 * drivers/misc/lis3lv02d/lis3lv02d.c
+	 */
+	switch (smbus_data.byte) {
+	case 0x32:
+		type = "lis331dlh";
+		break;
+	case 0x33:
+		type = "lis2de12"; /* LIS3DC / HP3DC in drivers/misc/lis3lv02d/lis3lv02d.c */
+		break;
+	case 0x3a:
+		type = "lis3lv02dl_accel";
+		break;
+	case 0x3b:
+		type = "lis302dl";
+		break;
+	default:
+		dev_warn(smo8800->dev, "Unknown who-am-i register value 0x%02x\n",
+			 smbus_data.byte);
+		return -ENODEV;
+	}
+
+	strscpy(info->type, type, I2C_NAME_SIZE);
+	info->addr = addr;
+	info->irq = smo8800->irq;
+	info->swnode = &smo8800_accel_node;
+	return 0;
+}
+
 /*
  * Accelerometer's I2C address is not specified in DMI nor ACPI,
  * so it is needed to define mapping table based on DMI product names.
@@ -174,7 +238,7 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
 	struct i2c_adapter *adap = NULL;
 	const char *dmi_product_name;
 	u8 addr = 0;
-	int i;
+	int i, err;
 
 	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
 	if (!adap)
@@ -195,9 +259,19 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
 		goto put_adapter;
 	}
 
-	info.addr = addr;
-	info.irq = smo8800->irq;
-	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+	/* Always detect the accel-type, this also checks the accel is actually there */
+	err = smo8800_detect_accel(smo8800, adap, addr, &info);
+	if (err)
+		goto put_adapter;
+
+	/*
+	 * If requested override detected type with "lis3lv02d" i2c_client_id,
+	 * for the old drivers/misc/lis3lv02d/lis3lv02d.c driver.
+	 */
+	if (use_misc_lis3lv02d) {
+		strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+		info.swnode = NULL;
+	}
 
 	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(smo8800->i2c_dev)) {
-- 
2.43.0


