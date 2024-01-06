Return-Path: <linux-i2c+bounces-1185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1B82608A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68D63281F2E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC33848A;
	Sat,  6 Jan 2024 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fRfAtf/g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267018493
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETQlQ24aGFnl8f397NMf2mlyswZ/lAOe6fYIvSLYAII=;
	b=fRfAtf/gLjuJuVgSlLYhj8vA8eVXpzNmIFap4zv55kzrzOhb1BEbKIhz6YhOBNT9ifiZKq
	b0iaSGFUa23m92eFrTZEGwK5Ogf5rnQ4MPBvrrut6H0kRNowzWryHS75d/AsCvd+mKL885
	pLZjZGvWL1y68wxeck5xfo5mzZ44luI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-0YOWuQWNMJ2YEbkqRxbEhA-1; Sat,
 06 Jan 2024 11:09:51 -0500
X-MC-Unique: 0YOWuQWNMJ2YEbkqRxbEhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 349343C025B9;
	Sat,  6 Jan 2024 16:09:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76CAB3C27;
	Sat,  6 Jan 2024 16:09:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 4/6] platform/x86: dell-smo8800: Allow using the IIO st_accel driver
Date: Sat,  6 Jan 2024 17:09:31 +0100
Message-ID: <20240106160935.45487-5-hdegoede@redhat.com>
In-Reply-To: <20240106160935.45487-1-hdegoede@redhat.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Allow using the IIO st_accel driver so that the accelerometer gets
presented to userspace as an IIO device like all modern accelerometer
drivers do.

Note the default is still to use the drivers/misc/lis3lv02d/lis3lv02d.c
/dev/freefall + evdev joystick emulation driver, so as to not break
existing userspace consumers.

/dev/freefall is used by the tools/laptop/freefall/freefall.c tool which
is shipped by the kernel as well as by the linux-thinkpad hdapsd daemon.

Using the IIO st_accel driver can be enabled by setting the new
use_iio_driver module parameter.

Link: https://github.com/linux-thinkpad/hdapsd/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Keep using drivers/misc/lis3lv02d/lis3lv02d.c be default
- Rename the module-parameter to use_iio_driver which can be set to
  use the IIO st_accel driver instead
---
 drivers/platform/x86/dell/dell-smo8800.c | 83 ++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 3e64ebcf4b21..58bb7275ba5c 100644
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
 
+static bool use_iio_driver;
+module_param(use_iio_driver, bool, 0444);
+MODULE_PARM_DESC(use_iio_driver, "Use IIO accelerometer driver instead of /dev/freefall chardev + evdev joystick emulation");
+
 struct smo8800_device {
 	u32 irq;                     /* acpi device irq */
 	atomic_t counter;            /* count after last read */
@@ -145,6 +150,65 @@ static int smo8800_find_i801(struct device *dev, void *data)
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
@@ -177,7 +241,7 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
 	struct i2c_adapter *adap = NULL;
 	const char *dmi_product_name;
 	u8 addr = 0;
-	int i;
+	int i, err;
 
 	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
 	if (!adap)
@@ -198,9 +262,20 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
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
+	 * Unless using the IIO driver is requested, override the detected type
+	 * with "lis3lv02d" so that drivers/misc/lis3lv02d/lis3lv02d.c is used
+	 * and /dev/freefall functionality is provided.
+	 */
+	if (!use_iio_driver) {
+		strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+		info.swnode = NULL;
+	}
 
 	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(smo8800->i2c_dev)) {
-- 
2.43.0


