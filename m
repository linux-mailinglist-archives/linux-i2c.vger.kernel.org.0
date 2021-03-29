Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC1A34CE34
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhC2KvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:49554 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232740AbhC2Ku4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:56 -0400
IronPort-SDR: zqkjQR61EaA4Txk/OmetrzRPnkrNQsqb6rksShmAgHs7BT3zgqq8munhgqxMY0toqjtCTXMGkZ
 ARE8alZC77gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653677"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653677"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:53 -0700
IronPort-SDR: pgLNzf0Ll9tkZNR+BajSQn1ede9BquWoZxmrSDHNLlwZg1+ZoWuEoUSlw1OckfLC7bTrHj9cCt
 yzqlWSfXTHow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955904"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:51 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 10/12] platform/chrome: chromeos_laptop - Prepare complete software nodes
Date:   Mon, 29 Mar 2021 13:50:45 +0300
Message-Id: <20210329105047.51033-11-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The older device property API is going to be removed soon
and that will affect also I2C subystem. Supplying complete
software nodes instead of only the properties in them for
the I2C devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/platform/chrome/chromeos_laptop.c | 100 +++++++++++++---------
 1 file changed, 60 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
index 472a03daa8693..4e14b4d6635d7 100644
--- a/drivers/platform/chrome/chromeos_laptop.c
+++ b/drivers/platform/chrome/chromeos_laptop.c
@@ -52,12 +52,15 @@ struct i2c_peripheral {
 	enum i2c_adapter_type type;
 	u32 pci_devid;
 
+	const struct property_entry *properties;
+
 	struct i2c_client *client;
 };
 
 struct acpi_peripheral {
 	char hid[ACPI_ID_LEN];
-	const struct property_entry *properties;
+	struct software_node swnode;
+	struct i2c_client *client;
 };
 
 struct chromeos_laptop {
@@ -68,7 +71,7 @@ struct chromeos_laptop {
 	struct i2c_peripheral *i2c_peripherals;
 	unsigned int num_i2c_peripherals;
 
-	const struct acpi_peripheral *acpi_peripherals;
+	struct acpi_peripheral *acpi_peripherals;
 	unsigned int num_acpi_peripherals;
 };
 
@@ -161,7 +164,7 @@ static void chromeos_laptop_check_adapter(struct i2c_adapter *adapter)
 
 static bool chromeos_laptop_adjust_client(struct i2c_client *client)
 {
-	const struct acpi_peripheral *acpi_dev;
+	struct acpi_peripheral *acpi_dev;
 	struct acpi_device_id acpi_ids[2] = { };
 	int i;
 	int error;
@@ -175,8 +178,7 @@ static bool chromeos_laptop_adjust_client(struct i2c_client *client)
 		memcpy(acpi_ids[0].id, acpi_dev->hid, ACPI_ID_LEN);
 
 		if (acpi_match_device(acpi_ids, &client->dev)) {
-			error = device_add_properties(&client->dev,
-						      acpi_dev->properties);
+			error = device_add_software_node(&client->dev, &acpi_dev->swnode);
 			if (error) {
 				dev_err(&client->dev,
 					"failed to add properties: %d\n",
@@ -184,6 +186,8 @@ static bool chromeos_laptop_adjust_client(struct i2c_client *client)
 				break;
 			}
 
+			acpi_dev->client = client;
+
 			return true;
 		}
 	}
@@ -193,15 +197,28 @@ static bool chromeos_laptop_adjust_client(struct i2c_client *client)
 
 static void chromeos_laptop_detach_i2c_client(struct i2c_client *client)
 {
+	struct acpi_peripheral *acpi_dev;
 	struct i2c_peripheral *i2c_dev;
 	int i;
 
-	for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
-		i2c_dev = &cros_laptop->i2c_peripherals[i];
+	if (has_acpi_companion(&client->dev))
+		for (i = 0; i < cros_laptop->num_acpi_peripherals; i++) {
+			acpi_dev = &cros_laptop->acpi_peripherals[i];
 
-		if (i2c_dev->client == client)
-			i2c_dev->client = NULL;
-	}
+			if (acpi_dev->client == client) {
+				acpi_dev->client = NULL;
+				return;
+			}
+		}
+	else
+		for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
+			i2c_dev = &cros_laptop->i2c_peripherals[i];
+
+			if (i2c_dev->client == client) {
+				i2c_dev->client = NULL;
+				return;
+			}
+		}
 }
 
 static int chromeos_laptop_i2c_notifier_call(struct notifier_block *nb,
@@ -302,28 +319,26 @@ static struct i2c_peripheral chromebook_pixel_peripherals[] __initdata = {
 		.board_info	= {
 			I2C_BOARD_INFO("atmel_mxt_ts",
 					ATMEL_TS_I2C_ADDR),
-			.properties	=
-				chromebook_atmel_touchscreen_props,
 			.flags		= I2C_CLIENT_WAKE,
 		},
 		.dmi_name	= "touchscreen",
 		.irqflags	= IRQF_TRIGGER_FALLING,
 		.type		= I2C_ADAPTER_PANEL,
 		.alt_addr	= ATMEL_TS_I2C_BL_ADDR,
+		.properties	= chromebook_atmel_touchscreen_props,
 	},
 	/* Touchpad. */
 	{
 		.board_info	= {
 			I2C_BOARD_INFO("atmel_mxt_tp",
 					ATMEL_TP_I2C_ADDR),
-			.properties	=
-				chromebook_pixel_trackpad_props,
 			.flags		= I2C_CLIENT_WAKE,
 		},
 		.dmi_name	= "trackpad",
 		.irqflags	= IRQF_TRIGGER_FALLING,
 		.type		= I2C_ADAPTER_VGADDC,
 		.alt_addr	= ATMEL_TP_I2C_BL_ADDR,
+		.properties	= chromebook_pixel_trackpad_props,
 	},
 	/* Light Sensor. */
 	{
@@ -414,8 +429,6 @@ static struct i2c_peripheral acer_c720_peripherals[] __initdata = {
 		.board_info	= {
 			I2C_BOARD_INFO("atmel_mxt_ts",
 					ATMEL_TS_I2C_ADDR),
-			.properties	=
-				chromebook_atmel_touchscreen_props,
 			.flags		= I2C_CLIENT_WAKE,
 		},
 		.dmi_name	= "touchscreen",
@@ -423,6 +436,7 @@ static struct i2c_peripheral acer_c720_peripherals[] __initdata = {
 		.type		= I2C_ADAPTER_DESIGNWARE,
 		.pci_devid	= PCI_DEVID(0, PCI_DEVFN(0x15, 0x2)),
 		.alt_addr	= ATMEL_TS_I2C_BL_ADDR,
+		.properties	= chromebook_atmel_touchscreen_props,
 	},
 	/* Touchpad. */
 	{
@@ -498,12 +512,16 @@ static struct acpi_peripheral samus_peripherals[] __initdata = {
 	/* Touchpad */
 	{
 		.hid		= "ATML0000",
-		.properties	= samus_trackpad_props,
+		.swnode		= {
+			.properties = samus_trackpad_props,
+		},
 	},
 	/* Touchsceen */
 	{
 		.hid		= "ATML0001",
-		.properties	= chromebook_atmel_touchscreen_props,
+		.swnode		= {
+			.properties = chromebook_atmel_touchscreen_props,
+		},
 	},
 };
 DECLARE_ACPI_CROS_LAPTOP(samus);
@@ -512,12 +530,16 @@ static struct acpi_peripheral generic_atmel_peripherals[] __initdata = {
 	/* Touchpad */
 	{
 		.hid		= "ATML0000",
-		.properties	= chromebook_pixel_trackpad_props,
+		.swnode		= {
+			.properties = chromebook_pixel_trackpad_props,
+		},
 	},
 	/* Touchsceen */
 	{
 		.hid		= "ATML0001",
-		.properties	= chromebook_atmel_touchscreen_props,
+		.swnode		= {
+			.properties = chromebook_atmel_touchscreen_props,
+		},
 	},
 };
 DECLARE_ACPI_CROS_LAPTOP(generic_atmel);
@@ -743,12 +765,11 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
 		if (error)
 			goto err_out;
 
-		/* We need to deep-copy properties */
-		if (info->properties) {
-			info->properties =
-				property_entries_dup(info->properties);
-			if (IS_ERR(info->properties)) {
-				error = PTR_ERR(info->properties);
+		/* Create primary fwnode for the device - copies everything */
+		if (i2c_dev->properties) {
+			info->fwnode = fwnode_create_software_node(i2c_dev->properties, NULL);
+			if (IS_ERR(info->fwnode)) {
+				error = PTR_ERR(info->fwnode);
 				goto err_out;
 			}
 		}
@@ -760,8 +781,8 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
 	while (--i >= 0) {
 		i2c_dev = &cros_laptop->i2c_peripherals[i];
 		info = &i2c_dev->board_info;
-		if (info->properties)
-			property_entries_free(info->properties);
+		if (!IS_ERR_OR_NULL(info->fwnode))
+			fwnode_remove_software_node(info->fwnode);
 	}
 	kfree(cros_laptop->i2c_peripherals);
 	return error;
@@ -801,11 +822,11 @@ chromeos_laptop_prepare_acpi_peripherals(struct chromeos_laptop *cros_laptop,
 		*acpi_dev = *src_dev;
 
 		/* We need to deep-copy properties */
-		if (src_dev->properties) {
-			acpi_dev->properties =
-				property_entries_dup(src_dev->properties);
-			if (IS_ERR(acpi_dev->properties)) {
-				error = PTR_ERR(acpi_dev->properties);
+		if (src_dev->swnode.properties) {
+			acpi_dev->swnode.properties =
+				property_entries_dup(src_dev->swnode.properties);
+			if (IS_ERR(acpi_dev->swnode.properties)) {
+				error = PTR_ERR(acpi_dev->swnode.properties);
 				goto err_out;
 			}
 		}
@@ -821,8 +842,8 @@ chromeos_laptop_prepare_acpi_peripherals(struct chromeos_laptop *cros_laptop,
 err_out:
 	while (--i >= 0) {
 		acpi_dev = &acpi_peripherals[i];
-		if (acpi_dev->properties)
-			property_entries_free(acpi_dev->properties);
+		if (!IS_ERR_OR_NULL(acpi_dev->swnode.properties))
+			property_entries_free(acpi_dev->swnode.properties);
 	}
 
 	kfree(acpi_peripherals);
@@ -833,21 +854,20 @@ static void chromeos_laptop_destroy(const struct chromeos_laptop *cros_laptop)
 {
 	const struct acpi_peripheral *acpi_dev;
 	struct i2c_peripheral *i2c_dev;
-	struct i2c_board_info *info;
 	int i;
 
 	for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
 		i2c_dev = &cros_laptop->i2c_peripherals[i];
-		info = &i2c_dev->board_info;
-
 		i2c_unregister_device(i2c_dev->client);
-		property_entries_free(info->properties);
 	}
 
 	for (i = 0; i < cros_laptop->num_acpi_peripherals; i++) {
 		acpi_dev = &cros_laptop->acpi_peripherals[i];
 
-		property_entries_free(acpi_dev->properties);
+		if (acpi_dev->client)
+			device_remove_software_node(&acpi_dev->client->dev);
+
+		property_entries_free(acpi_dev->swnode.properties);
 	}
 
 	kfree(cros_laptop->i2c_peripherals);
-- 
2.30.2

