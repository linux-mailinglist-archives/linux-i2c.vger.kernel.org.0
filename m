Return-Path: <linux-i2c+bounces-8383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 432ED9E9E21
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 19:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABCDA162F75
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 18:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF02175D3A;
	Mon,  9 Dec 2024 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NI4uMts7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919687081D
	for <linux-i2c@vger.kernel.org>; Mon,  9 Dec 2024 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769387; cv=none; b=k/QfptUIS5FrLAxlWF0ZmcSLyeMNosaVGGkqfCFs8euSJ0fmDbcLRk5nTV9W5jS1KKRpj7Y3qcjS4sXGF0PDjGq6omdyMdlTnZXGYNb8kG2+mMF8jM/5Dwm0yWVbBxJw4SRDOqOfiAVBqOTHPWrSDUnVR6iemp5p5VHNt/f1sMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769387; c=relaxed/simple;
	bh=BzK/+6yJBfBuMAYnRS2HgveL+O8eYaaTBWX/cCMPSPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=loNqIzkuWTP61PpJAq1DFpLtaufDrEDfDM2NWU9zE5IXLrKhBtEUm9KTFEM3pxf+mjY9ZGAh4z20EusKw86ATPvmTABoOF3tVzu1XGwMftyjJOKIkUn76QLV5Vmt0ajxx2NLNokRTqvG8N9RPULMom4ozthFOQhpTQ+DEnIXMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NI4uMts7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733769383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6mq8PQ7NlLKkFjl5kTCkDjsCI7CTx/rGNesChA38xCs=;
	b=NI4uMts7IJtHKzTMyQjtorRB9pB3vxQhtuq4JkyaO7c57g4DlYu60ewPVpso8srR0z4B/h
	Hkdxsqs2qE02X+eZRdJCeesd1pYTRawWFome8Enk6DyFCMeCS7f/Na5gYbq/nzqKGkIIzU
	zC9j69i5gcz4aEY1vUMv2eyY8OSLj5o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-9uFi47CaNkiikH1qkSAYBw-1; Mon,
 09 Dec 2024 13:36:19 -0500
X-MC-Unique: 9uFi47CaNkiikH1qkSAYBw-1
X-Mimecast-MFC-AGG-ID: 9uFi47CaNkiikH1qkSAYBw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A88F1955F29;
	Mon,  9 Dec 2024 18:36:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45EFE1956048;
	Mon,  9 Dec 2024 18:36:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v9 2/4] platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Date: Mon,  9 Dec 2024 19:35:55 +0100
Message-ID: <20241209183557.7560-3-hdegoede@redhat.com>
In-Reply-To: <20241209183557.7560-1-hdegoede@redhat.com>
References: <20241209183557.7560-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Various Dell laptops have an lis3lv02d freefall/accelerometer sensor.
The lis3lv02d chip has an interrupt line as well as an I2C connection to
the system's main SMBus.

The lis3lv02d is described in the ACPI tables by an SMO88xx ACPI device,
but the SMO88xx ACPI fwnodes are incomplete and only list an IRQ resource.

So far this has been worked around with some SMO88xx specific quirk code
in the generic i2c-i801 driver, but it is not necessary to handle the Dell
specific instantiation of i2c_client-s for SMO88xx ACPI devices there.

The kernel already instantiates platform_device-s for these with an
acpi:SMO88xx modalias. The drivers/platform/x86/dell/dell-smo8800.c
driver binds to this platform device but this only deals with
the interrupt resource. Add a drivers/platform/x86/dell/dell-lis3lv02d.c
which will matches on the same acpi:SMO88xx modaliases and move
the i2c_client instantiation from the generic i2c-i801 driver there.

Moving the i2c_client instantiation has the following advantages:

1. This moves the SMO88xx ACPI device quirk handling away from the generic
i2c-i801 module which is loaded on all Intel x86 machines to a module
which will only be loaded when there is an ACPI SMO88xx device.

2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
between the i2c-i801 and dell-smo8800 drivers.

3. This allows extending the quirk handling by adding new code and related
module parameters to the dell-lis3lv02d driver, without needing to modify
the i2c-i801 code.

Reviewed-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
- Drop unnecessary ids helper vatiable from match_acpi_device_ids() helper
- Use dev_err() / dev_dbg() where possible using &adap->dev as the device
  for logging
- Add a comment about why bus_for_each_dev() and not i2c_for_each_dev()

Changes in v5:
- Make match_acpi_device_ids() and match_acpi_device_ids[] __init[const]
- Add "Depends on I2C" to Kconfig

Changes in v4:
- Move the i2c_client instantiation to a new dell-lis3lv02d driver instead
  of adding it to the dell-smo8800 driver

Changes in v3:
- Use an i2c bus notifier so that the i2c_client will still be instantiated if
  the i801 i2c_adapter shows up later or is re-probed (removed + added again)
- Switch to standard dmi_system_id matching to check both sys-vendor +
  product-name DMI fields
- Use unique i2c_adapter->name prefix for primary i2c_801 controller
  to avoid needing to duplicate PCI ids for extra IDF i2c_801 i2c_adapter-s
- Drop MODULE_SOFTDEP("pre: i2c-i801"), this is now no longer necessary
- Rebase on Torvalds master for recent additions of extra models in
  the dell_lis3lv02d_devices[] list

Changes in v2:
- Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
- Add a comment documenting the IDF PCI device ids
---
 drivers/i2c/busses/i2c-i801.c              | 124 -------------
 drivers/platform/x86/dell/Kconfig          |   1 +
 drivers/platform/x86/dell/Makefile         |   1 +
 drivers/platform/x86/dell/dell-lis3lv02d.c | 204 +++++++++++++++++++++
 4 files changed, 206 insertions(+), 124 deletions(-)
 create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 75dab01d43a7..b72712743cd7 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1162,127 +1162,6 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
 	}
 }
 
-/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800.c */
-static const char *const acpi_smo8800_ids[] = {
-	"SMO8800",
-	"SMO8801",
-	"SMO8810",
-	"SMO8811",
-	"SMO8820",
-	"SMO8821",
-	"SMO8830",
-	"SMO8831",
-};
-
-static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
-					     u32 nesting_level,
-					     void *context,
-					     void **return_value)
-{
-	struct acpi_device_info *info;
-	acpi_status status;
-	char *hid;
-	int i;
-
-	status = acpi_get_object_info(obj_handle, &info);
-	if (ACPI_FAILURE(status))
-		return AE_OK;
-
-	if (!(info->valid & ACPI_VALID_HID))
-		goto smo88xx_not_found;
-
-	hid = info->hardware_id.string;
-	if (!hid)
-		goto smo88xx_not_found;
-
-	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
-	if (i < 0)
-		goto smo88xx_not_found;
-
-	kfree(info);
-
-	*return_value = NULL;
-	return AE_CTRL_TERMINATE;
-
-smo88xx_not_found:
-	kfree(info);
-	return AE_OK;
-}
-
-static bool is_dell_system_with_lis3lv02d(void)
-{
-	void *err = ERR_PTR(-ENOENT);
-
-	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
-		return false;
-
-	/*
-	 * Check that ACPI device SMO88xx is present and is functioning.
-	 * Function acpi_get_devices() already filters all ACPI devices
-	 * which are not present or are not functioning.
-	 * ACPI device SMO88xx represents our ST microelectronics lis3lv02d
-	 * accelerometer but unfortunately ACPI does not provide any other
-	 * information (like I2C address).
-	 */
-	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
-
-	return !IS_ERR(err);
-}
-
-/*
- * Accelerometer's I2C address is not specified in DMI nor ACPI,
- * so it is needed to define mapping table based on DMI product names.
- */
-static const struct {
-	const char *dmi_product_name;
-	unsigned short i2c_addr;
-} dell_lis3lv02d_devices[] = {
-	/*
-	 * Dell platform team told us that these Latitude devices have
-	 * ST microelectronics accelerometer at I2C address 0x29.
-	 */
-	{ "Latitude E5250",     0x29 },
-	{ "Latitude E5450",     0x29 },
-	{ "Latitude E5550",     0x29 },
-	{ "Latitude E6440",     0x29 },
-	{ "Latitude E6440 ATG", 0x29 },
-	{ "Latitude E6540",     0x29 },
-	/*
-	 * Additional individual entries were added after verification.
-	 */
-	{ "Latitude 5480",      0x29 },
-	{ "Precision 3540",     0x29 },
-	{ "Vostro V131",        0x1d },
-	{ "Vostro 5568",        0x29 },
-	{ "XPS 15 7590",        0x29 },
-};
-
-static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
-{
-	struct i2c_board_info info;
-	const char *dmi_product_name;
-	int i;
-
-	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
-	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
-		if (strcmp(dmi_product_name,
-			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
-		dev_warn(&priv->pci_dev->dev,
-			 "Accelerometer lis3lv02d is present on SMBus but its"
-			 " address is unknown, skipping registration\n");
-		return;
-	}
-
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
-	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
-	i2c_new_client_device(&priv->adapter, &info);
-}
-
 /* Register optional targets */
 static void i801_probe_optional_targets(struct i801_priv *priv)
 {
@@ -1302,9 +1181,6 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
 	if (dmi_name_in_vendors("FUJITSU"))
 		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
 
-	if (is_dell_system_with_lis3lv02d())
-		register_dell_lis3lv02d_i2c_device(priv);
-
 	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
 #ifdef CONFIG_I2C_I801_MUX
 	if (!priv->mux_pdev)
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index 2dddafb3f7fa..d09060aedd3f 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -152,6 +152,7 @@ config DELL_SMBIOS_SMM
 config DELL_SMO8800
 	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
 	default m
+	depends on I2C
 	depends on ACPI || COMPILE_TEST
 	help
 	  Say Y here if you want to support SMO88XX freefall devices
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index 79d60f1bf4c1..bb3cbd470a46 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -15,6 +15,7 @@ dell-smbios-objs			:= dell-smbios-base.o
 dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
 dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
 obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
+obj-$(CONFIG_DELL_SMO8800)		+= dell-lis3lv02d.o
 obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
 obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
 dell-wmi-objs				:= dell-wmi-base.o
diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
new file mode 100644
index 000000000000..6dc04c89e6c9
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * lis3lv02d i2c-client instantiation for ACPI SMO88xx devices without I2C resources.
+ *
+ *  Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/device/bus.h>
+#include <linux/dmi.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+#include "dell-smo8800-ids.h"
+
+#define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)                 \
+	{                                                                \
+		.matches = {                                             \
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),    \
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, product_name), \
+		},                                                       \
+		.driver_data = (void *)(uintptr_t)(i2c_addr),            \
+	}
+
+/*
+ * Accelerometer's I2C address is not specified in DMI nor ACPI,
+ * so it is needed to define mapping table based on DMI product names.
+ */
+static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
+	/*
+	 * Dell platform team told us that these Latitude devices have
+	 * ST microelectronics accelerometer at I2C address 0x29.
+	 */
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5250",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5450",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5550",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6440",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6440 ATG", 0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6540",     0x29),
+	/*
+	 * Additional individual entries were added after verification.
+	 */
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
+	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 7590",        0x29),
+	{ }
+};
+
+static u8 i2c_addr;
+static struct i2c_client *i2c_dev;
+static bool notifier_registered;
+
+static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
+{
+	/*
+	 * Only match the main I801 adapter and reject secondary adapters
+	 * which names start with "SMBus I801 IDF adapter".
+	 */
+	return strstarts(adap->name, "SMBus I801 adapter");
+}
+
+static int find_i801(struct device *dev, void *data)
+{
+	struct i2c_adapter *adap, **adap_ret = data;
+
+	adap = i2c_verify_adapter(dev);
+	if (!adap)
+		return 0;
+
+	if (!i2c_adapter_is_main_i801(adap))
+		return 0;
+
+	*adap_ret = i2c_get_adapter(adap->nr);
+	return 1;
+}
+
+static void instantiate_i2c_client(struct work_struct *work)
+{
+	struct i2c_board_info info = { };
+	struct i2c_adapter *adap = NULL;
+
+	if (i2c_dev)
+		return;
+
+	/*
+	 * bus_for_each_dev() and not i2c_for_each_dev() to avoid
+	 * a deadlock when find_i801() calls i2c_get_adapter().
+	 */
+	bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
+	if (!adap)
+		return;
+
+	info.addr = i2c_addr;
+	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+
+	i2c_dev = i2c_new_client_device(adap, &info);
+	if (IS_ERR(i2c_dev)) {
+		dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
+		i2c_dev = NULL;
+	} else {
+		dev_dbg(&adap->dev, "registered lis3lv02d on address 0x%02x\n", info.addr);
+	}
+
+	i2c_put_adapter(adap);
+}
+static DECLARE_WORK(i2c_work, instantiate_i2c_client);
+
+static int i2c_bus_notify(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct device *dev = data;
+	struct i2c_client *client;
+	struct i2c_adapter *adap;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		adap = i2c_verify_adapter(dev);
+		if (!adap)
+			break;
+
+		if (i2c_adapter_is_main_i801(adap))
+			queue_work(system_long_wq, &i2c_work);
+		break;
+	case BUS_NOTIFY_REMOVED_DEVICE:
+		client = i2c_verify_client(dev);
+		if (!client)
+			break;
+
+		if (i2c_dev == client) {
+			dev_dbg(&client->adapter->dev, "lis3lv02d i2c_client removed\n");
+			i2c_dev = NULL;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+static struct notifier_block i2c_nb = { .notifier_call = i2c_bus_notify };
+
+static int __init match_acpi_device_ids(struct device *dev, const void *data)
+{
+	return acpi_match_device(data, dev) ? 1 : 0;
+}
+
+static int __init dell_lis3lv02d_init(void)
+{
+	const struct dmi_system_id *lis3lv02d_dmi_id;
+	struct device *dev;
+	int err;
+
+	/*
+	 * First check for a matching platform_device. This protects against
+	 * SMO88xx ACPI fwnodes which actually do have an I2C resource, which
+	 * will already have an i2c_client instantiated (not a platform_device).
+	 */
+	dev = bus_find_device(&platform_bus_type, NULL, smo8800_ids, match_acpi_device_ids);
+	if (!dev) {
+		pr_debug("No SMO88xx platform-device found\n");
+		return 0;
+	}
+	put_device(dev);
+
+	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
+	if (!lis3lv02d_dmi_id) {
+		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
+		return 0;
+	}
+
+	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
+
+	/*
+	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
+	 * i2c_client instantiation.
+	 */
+	err = bus_register_notifier(&i2c_bus_type, &i2c_nb);
+	if (err)
+		return err;
+
+	notifier_registered = true;
+
+	queue_work(system_long_wq, &i2c_work);
+	return 0;
+}
+module_init(dell_lis3lv02d_init);
+
+static void __exit dell_lis3lv02d_module_exit(void)
+{
+	if (!notifier_registered)
+		return;
+
+	bus_unregister_notifier(&i2c_bus_type, &i2c_nb);
+	cancel_work_sync(&i2c_work);
+	i2c_unregister_device(i2c_dev);
+}
+module_exit(dell_lis3lv02d_module_exit);
+
+MODULE_DESCRIPTION("lis3lv02d i2c-client instantiation for ACPI SMO88xx devices");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.47.1


