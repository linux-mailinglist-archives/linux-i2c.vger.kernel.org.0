Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F095B3235F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2019 15:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfFBNU0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jun 2019 09:20:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40526 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfFBNUZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jun 2019 09:20:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id u16so3414540wmc.5;
        Sun, 02 Jun 2019 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTwNe906qFumDaIG0AZBysUzGIWn0KYcPiQZdVgGgBw=;
        b=ILzGGVIG+lMcnqXI0tTLfD9wEi5JQ0o51iUUpePofA6e+oDHD7lLaLoi3PTxqqqbQH
         H3mwFWeuZUG727PZ25DL2tl/PS4VgV6Z4RwLzBLWuK0pPdtjadmMdKvogKLix+Ukps6d
         XUv1tkWW8FW+LRf06TtdGFS/1kxHKW6DFpv7OAWEURmDEdJBzBW44bibIUJpI18dpJh2
         u2hhqtECAvvjb+txjROdRUqYP+c2/1tYAJhlJx01VdL5od5Mijqzf9Yn2CnemTzdV3oP
         y53ethPcC53mlrsESsrpTvF04W+5rP9EuwJfBfuz2SZczeVdHg3hG0hKZtazrCh/2uoq
         dzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTwNe906qFumDaIG0AZBysUzGIWn0KYcPiQZdVgGgBw=;
        b=huym70Q0uiWmcJp+VYMwxuqJSnCctfJG4+N1473Vtc9Wj6H+DwpONhe1PLKO3VZv2c
         w1TozgPTsmL48n6VZ5/V2ngN1G1yb43bwBen+hIBw24fSPZZCGAFCZbmHq3V8Is0Xezt
         vCFlprTroqclLJqw4CkLlUu5NoGO2WbaimRDFFt+CR61WsMKxj2YAppyijZUTqPFOVGi
         8ajA+3kVrOqHg5zYSe9H+xpZ5SvU/lzkoX7zfctH4R9uCa5O6r8mYQl47r8InwgEW0mf
         bSwBbJcmettX1i9m4sKHQ7jFSl9GEk5gXFa7v1WKOu6yb49mdgMwFyirKTzI01KAshlr
         tppg==
X-Gm-Message-State: APjAAAXrWzbFycuGHWlh9F4C4hk59jfDHnNuum2TQFf61ecBfFVxMZtn
        CiQwFNR3M4GsRJuj8U6aXio=
X-Google-Smtp-Source: APXvYqzsYFYOf+ERfUvXIY9dutCsJnUs0fKN/uPfd11jr2mLpzUvoGvC3cbhl+vF5Jsod5HjGoyGDw==
X-Received: by 2002:a1c:48c5:: with SMTP id v188mr10990796wma.175.1559481622600;
        Sun, 02 Jun 2019 06:20:22 -0700 (PDT)
Received: from Pali-Latitude.lan ([2001:718:1e03:a01::1ca])
        by smtp.gmail.com with ESMTPSA id b136sm15839022wme.30.2019.06.02.06.20.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 06:20:21 -0700 (PDT)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
        Steven Honeyman <stevenhoneyman@gmail.com>,
        Valdis.Kletnieks@vt.edu,
        Jochen Eisinger <jochen@penguin-breeder.org>,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>,
        Andy Lutomirski <luto@kernel.org>, Mario_Limonciello@dell.com,
        Alex Hung <alex.hung@canonical.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3] i2c: i801: Register optional lis3lv02d i2c device on Dell machines
Date:   Sun,  2 Jun 2019 15:20:03 +0200
Message-Id: <20190602132003.1911-1-pali.rohar@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180127133209.28995-1-pali.rohar@gmail.com>
References: <20180127133209.28995-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dell platform team told us that some (DMI whitelisted) Dell Latitude
machines have ST microelectronics accelerometer at i2c address 0x29.

Presence of that ST microelectronics accelerometer is verified by existence
of SMO88xx ACPI device which represent that accelerometer. Unfortunately
ACPI device does not specify i2c address.

This patch registers lis3lv02d device for selected Dell Latitude machines
at i2c address 0x29 after detection. And for Dell Vostro V131 machine at
i2c address 0x1d which was manually detected.

Finally commit a7ae81952cda ("i2c: i801: Allow ACPI SystemIO OpRegion to
conflict with PCI BAR") allowed to use i2c-i801 driver on Dell machines so
lis3lv02d correctly initialize accelerometer.

Tested on Dell Latitude E6440.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>

---
Changes since v2:
 * Use explicit list of SMOxx ACPI devices

Changes since v1:
 * Added Dell Vostro V131 based on Michał Kępień testing
 * Changed DMI product structure to include also i2c address
---
 drivers/i2c/busses/i2c-i801.c       | 118 ++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smo8800.c |   1 +
 2 files changed, 119 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ac7f7817dc89..2ac8ff41cc24 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1134,6 +1134,121 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
 	}
 }
 
+/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800.c */
+static const struct acpi_device_id acpi_smo8800_ids[] = {
+	{ "SMO8800", 0 },
+	{ "SMO8801", 0 },
+	{ "SMO8810", 0 },
+	{ "SMO8811", 0 },
+	{ "SMO8820", 0 },
+	{ "SMO8821", 0 },
+	{ "SMO8830", 0 },
+	{ "SMO8831", 0 },
+};
+
+static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
+					     u32 nesting_level,
+					     void *context,
+					     void **return_value)
+{
+	struct acpi_device_info *info;
+	acpi_status status;
+	char *hid;
+	int i;
+
+	status = acpi_get_object_info(obj_handle, &info);
+	if (!ACPI_SUCCESS(status) || !(info->valid & ACPI_VALID_HID))
+		return AE_OK;
+
+	hid = info->hardware_id.string;
+	if (!hid)
+		return AE_OK;
+
+	for (i = 0; i < ARRAY_SIZE(acpi_smo8800_ids); ++i) {
+		if (strcmp(hid, acpi_smo8800_ids[i].id) == 0) {
+			*((bool *)return_value) = true;
+			return AE_CTRL_TERMINATE;
+		}
+	}
+
+	return AE_OK;
+
+}
+
+static bool is_dell_system_with_lis3lv02d(void)
+{
+	bool found;
+	acpi_status status;
+	const char *vendor;
+
+	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	if (strcmp(vendor, "Dell Inc.") != 0)
+		return false;
+
+	/*
+	 * Check that ACPI device SMO88xx exists and is enabled. That ACPI
+	 * device represent our ST microelectronics lis3lv02d accelerometer but
+	 * unfortunately without any other information (like i2c address).
+	 */
+	found = false;
+	status = acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
+				  (void **)&found);
+	if (!ACPI_SUCCESS(status) || !found)
+		return false;
+
+	return true;
+}
+
+/*
+ * Accelerometer's i2c address is not specified in DMI nor ACPI,
+ * so it is needed to define mapping table based on DMI product names.
+ */
+static struct {
+	const char *dmi_product_name;
+	unsigned short i2c_addr;
+} dell_lis3lv02d_devices[] = {
+	/*
+	 * Dell platform team told us that these Latitude devices have
+	 * ST microelectronics accelerometer at i2c address 0x29.
+	 */
+	{ "Latitude E5250",     0x29 },
+	{ "Latitude E5450",     0x29 },
+	{ "Latitude E5550",     0x29 },
+	{ "Latitude E6440",     0x29 },
+	{ "Latitude E6440 ATG", 0x29 },
+	{ "Latitude E6540",     0x29 },
+	/*
+	 * Additional individual entries were added after verification.
+	 */
+	{ "Vostro V131",        0x1d },
+};
+
+static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
+{
+	struct i2c_board_info info;
+	const char *dmi_product_name;
+	int i;
+
+	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
+		if (strcmp(dmi_product_name,
+			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
+		dev_warn(&priv->pci_dev->dev,
+			 "Accelerometer lis3lv02d is present on i2c bus but its"
+			 " i2c address is unknown, skipping registration...\n");
+		return;
+	}
+
+	memset(&info, 0, sizeof(struct i2c_board_info));
+	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
+	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+	i2c_new_device(&priv->adapter, &info);
+}
+
 /* Register optional slaves */
 static void i801_probe_optional_slaves(struct i801_priv *priv)
 {
@@ -1152,6 +1267,9 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
 
 	if (dmi_name_in_vendors("FUJITSU"))
 		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
+
+	if (is_dell_system_with_lis3lv02d())
+		register_dell_lis3lv02d_i2c_device(priv);
 }
 #else
 static void __init input_apanel_init(void) {}
diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86/dell-smo8800.c
index 5cdb09cba077..bfcc1d1b9b96 100644
--- a/drivers/platform/x86/dell-smo8800.c
+++ b/drivers/platform/x86/dell-smo8800.c
@@ -198,6 +198,7 @@ static int smo8800_remove(struct acpi_device *device)
 	return 0;
 }
 
+/* NOTE: Keep this list in sync with drivers/i2c/busses/i2c-i801.c */
 static const struct acpi_device_id smo8800_ids[] = {
 	{ "SMO8800", 0 },
 	{ "SMO8801", 0 },
-- 
2.11.0

