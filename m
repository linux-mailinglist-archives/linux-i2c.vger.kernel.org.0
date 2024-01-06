Return-Path: <linux-i2c+bounces-1186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082482608C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA171F239FB
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D8B8826;
	Sat,  6 Jan 2024 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTMnP8cx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144D479C3
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzpM8XnbTJAfg15a2BeUriVVEF0AwqH58tuAhGJLep4=;
	b=KTMnP8cxW4AOtbJ0B8NfwzjuGzEqC157i8kK55JNtDPjyFiF26wmhVotRcCbVIiWqZV3fA
	asP2cbBzbpl45JktInBiVetkhJ5j6res9SmpoSCGsT/+kpKHgZ6v51L7BPOoRKk9OOQDLp
	pkAZyByjAfjyhVqH/Cc6zEGW43oRSMg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-evxJyZRdM_mNPEcC49dcvg-1; Sat,
 06 Jan 2024 11:09:53 -0500
X-MC-Unique: evxJyZRdM_mNPEcC49dcvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FF1438143AE;
	Sat,  6 Jan 2024 16:09:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65A793C27;
	Sat,  6 Jan 2024 16:09:51 +0000 (UTC)
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
Subject: [PATCH v2 5/6] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
Date: Sat,  6 Jan 2024 17:09:32 +0100
Message-ID: <20240106160935.45487-6-hdegoede@redhat.com>
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

Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
of the accelerometer. So a DMI product-name to address mapping table
is used.

At support to have the kernel probe for the i2c-address for modesl
which are not on the list.

The new probing code sits behind a new probe_i2c_addr module parameter,
which is disabled by default because probing might be dangerous.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 112 +++++++++++++++++++++--
 1 file changed, 105 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 58bb7275ba5c..021ad31eb84d 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -29,6 +29,10 @@ static bool use_iio_driver;
 module_param(use_iio_driver, bool, 0444);
 MODULE_PARM_DESC(use_iio_driver, "Use IIO accelerometer driver instead of /dev/freefall chardev + evdev joystick emulation");
 
+static bool probe_i2c_addr;
+module_param(probe_i2c_addr, bool, 0444);
+MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown");
+
 struct smo8800_device {
 	u32 irq;                     /* acpi device irq */
 	atomic_t counter;            /* count after last read */
@@ -150,6 +154,82 @@ static int smo8800_find_i801(struct device *dev, void *data)
 	return 1;
 }
 
+/*
+ * This is the kernel version of the single register device sanity checks from
+ * the i2c_safety_check function from lm_sensors sensor-detect script:
+ * This is meant to prevent access to 1-register-only devices,
+ * which are designed to be accessed with SMBus receive byte and SMBus send
+ * byte transactions (i.e. short reads and short writes) and treat SMBus
+ * read byte as a real write followed by a read. The device detection
+ * routines would write random values to the chip with possibly very nasty
+ * results for the hardware. Note that this function won't catch all such
+ * chips, as it assumes that reads and writes relate to the same register,
+ * but that's the best we can do.
+ */
+static int i2c_safety_check(struct smo8800_device *smo8800, struct i2c_adapter *adap, u8 addr)
+{
+	union i2c_smbus_data smbus_data;
+	int err;
+	u8 data;
+
+	/*
+	 * First receive a byte from the chip, and remember it. This
+	 * also checks if there is a device at the address at all.
+	 */
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
+			     I2C_SMBUS_BYTE, &smbus_data);
+	if (err < 0)
+		return err;
+
+	data = smbus_data.byte;
+
+	/*
+	 * Receive a byte again; very likely to be the same for
+	 * 1-register-only devices.
+	 */
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
+			     I2C_SMBUS_BYTE, &smbus_data);
+	if (err < 0)
+		return err;
+
+	if (smbus_data.byte != data)
+		return 0; /* Not a 1-register-only device. */
+
+	/*
+	 * Then try a standard byte read, with a register offset equal to
+	 * the read byte; for 1-register-only device this should read
+	 * the same byte value in return.
+	 */
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data,
+			     I2C_SMBUS_BYTE_DATA, &smbus_data);
+	if (err < 0)
+		return err;
+
+	if (smbus_data.byte != data)
+		return 0; /* Not a 1-register-only device. */
+
+	/*
+	 * Then try a standard byte read, with a slightly different register
+	 * offset; this should again read the register offset in return.
+	 */
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data ^ 0x01,
+			     I2C_SMBUS_BYTE_DATA, &smbus_data);
+	if (err < 0)
+		return err;
+
+	if (smbus_data.byte != (data ^ 0x01))
+		return 0; /* Not a 1-register-only device. */
+
+	/*
+	 * Apparently this is a 1-register-only device, restore the original
+	 * register value and leave it alone.
+	 */
+	i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_WRITE, data,
+		       I2C_SMBUS_BYTE, NULL);
+	dev_warn(smo8800->dev, "I2C safety check for address 0x%02x failed, skipping\n", addr);
+	return -ENODEV;
+}
+
 /*
  * Set label to let iio-sensor-proxy know these freefall sensors are located in
  * the laptop base (not the display) and are not intended for screen rotation.
@@ -165,12 +245,19 @@ const struct software_node smo8800_accel_node = {
 
 static int smo8800_detect_accel(struct smo8800_device *smo8800,
 				struct i2c_adapter *adap, u8 addr,
-				struct i2c_board_info *info)
+				struct i2c_board_info *info, bool probe)
 {
 	union i2c_smbus_data smbus_data;
 	const char *type;
 	int err;
 
+	if (probe) {
+		dev_info(smo8800->dev, "Probing for accelerometer on address 0x%02x\n", addr);
+		err = i2c_safety_check(smo8800, adap, addr);
+		if (err < 0)
+			return err;
+	}
+
 	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
 			     I2C_SMBUS_BYTE_DATA, &smbus_data);
 	if (err < 0) {
@@ -256,17 +343,25 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
 		}
 	}
 
-	if (!addr) {
+	if (addr) {
+		/* Always detect the accel-type, this also checks the accel is actually there */
+		err = smo8800_detect_accel(smo8800, adap, addr, &info, false);
+		if (err)
+			goto put_adapter;
+	} else if (probe_i2c_addr) {
+		/* First try address 0x29 (most used) and then try 0x1d */
+		if (smo8800_detect_accel(smo8800, adap, 0x29, &info, true) != 0 &&
+		    smo8800_detect_accel(smo8800, adap, 0x1d, &info, true) != 0) {
+			dev_warn(smo8800->dev, "No accelerometer found\n");
+			goto put_adapter;
+		}
+	} else {
 		dev_warn(smo8800->dev,
 			 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
+		dev_info(smo8800->dev, "Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
 		goto put_adapter;
 	}
 
-	/* Always detect the accel-type, this also checks the accel is actually there */
-	err = smo8800_detect_accel(smo8800, adap, addr, &info);
-	if (err)
-		goto put_adapter;
-
 	/*
 	 * Unless using the IIO driver is requested, override the detected type
 	 * with "lis3lv02d" so that drivers/misc/lis3lv02d/lis3lv02d.c is used
@@ -285,6 +380,9 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
 	} else {
 		dev_info(smo8800->dev, "Registered %s accelerometer on address 0x%02x\n",
 			 info.type, info.addr);
+		if (!addr)
+			dev_info(smo8800->dev,
+				 "Please report this address upstream together with the output of 'cat /sys/class/dmi/id/product_name'\n");
 	}
 put_adapter:
 	i2c_put_adapter(adap);
-- 
2.43.0


