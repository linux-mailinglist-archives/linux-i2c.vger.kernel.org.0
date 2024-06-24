Return-Path: <linux-i2c+bounces-4303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9E914856
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 13:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 100E9B246FB
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 11:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621AB138495;
	Mon, 24 Jun 2024 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xd8KtO/l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909FC442C
	for <linux-i2c@vger.kernel.org>; Mon, 24 Jun 2024 11:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227781; cv=none; b=hyENL3oO/1Nb4s3cP+XYvTnOtSqYDEOITnI88Ez2CrkNOSofgHL4bV+Fmw14+Kq5L6vvF+9PF8zTc5GY4Geu24S73BZwaROFdZn+3JzHFo4ElJJoT4imqfXoWoEHrdM+VjfhHZMoamKrRlTZebkKMMBDx6JvfCsdp/zihJEnDdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227781; c=relaxed/simple;
	bh=f8K+KFCu4v2gxFcfZDlFE3CpP4AowUfk2+j7UrI7KIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyFKKs1GOnuCZ0x94KT0tvkD9cncXxudTto0Kf1/gByisbM6oJUjkPbqj0pyxBc2Iqjvp162xZ3/EWqEs/xAOFt6Hgq7MNGUh36Ln+5bqphPvr9L/B+5eLP6Y1cjkIEbW9Mrq4nlrs+zzp+u9YkpMoyxCVg3leuj79It1LjSQfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xd8KtO/l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719227778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MKQZAMPum9/XFHweBiLEqq+DxvimF2wmcbjyqmhaeM=;
	b=Xd8KtO/lakhkYul0XeQOiYKmt+Ckh9I2ZJpZrVa2mEZLT2Ih3VAQ1xOYZZEDS4lhCMAkaI
	kMNkSRIjEsyItfoJv1hgtjzU/fBkXOZpsNbmHgqat7KQZGIHP51Lrjfa1I5KB4HFgSE8Cz
	XfTRbPWawi43M6WprYP9HlXoEkpSNmY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-jBoqmSz_Mt2Dq9flgCss5A-1; Mon,
 24 Jun 2024 07:16:14 -0400
X-MC-Unique: jBoqmSz_Mt2Dq9flgCss5A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0035B195608E;
	Mon, 24 Jun 2024 11:16:12 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.82])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6CDB51956087;
	Mon, 24 Jun 2024 11:16:07 +0000 (UTC)
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
Subject: [PATCH v4 6/6] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
Date: Mon, 24 Jun 2024 13:15:18 +0200
Message-ID: <20240624111519.15652-7-hdegoede@redhat.com>
In-Reply-To: <20240624111519.15652-1-hdegoede@redhat.com>
References: <20240624111519.15652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
of the accelerometer. So a DMI product-name to address mapping table
is used.

At support to have the kernel probe for the i2c-address for modesl
which are not on the list.

The new probing code sits behind a new probe_i2c_addr module parameter,
which is disabled by default because probing might be dangerous.

Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 133 ++++++++++++++++++++-
 1 file changed, 131 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index a7409db0505b..173615fd2646 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -15,6 +15,8 @@
 #include <linux/workqueue.h>
 #include "dell-smo8800-ids.h"
 
+#define LIS3_WHO_AM_I 0x0f
+
 #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)                 \
 	{                                                                \
 		.matches = {                                             \
@@ -57,6 +59,121 @@ static const struct dmi_system_id *lis3lv02d_dmi_id;
 static struct i2c_client *i2c_dev;
 static bool notifier_registered;
 
+static bool probe_i2c_addr;
+module_param(probe_i2c_addr, bool, 0444);
+MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown");
+
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
+static int i2c_safety_check(struct i2c_adapter *adap, u8 addr)
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
+	pr_warn("I2C safety check for address 0x%02x failed, skipping\n", addr);
+	return -ENODEV;
+}
+
+static int detect_lis3lv02d(struct i2c_adapter *adap, u8 addr,
+			    struct i2c_board_info *info)
+{
+	union i2c_smbus_data smbus_data;
+	int err;
+
+	pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
+	err = i2c_safety_check(adap, addr);
+	if (err < 0)
+		return err;
+
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
+			     I2C_SMBUS_BYTE_DATA, &smbus_data);
+	if (err < 0) {
+		pr_warn("Failed to read who-am-i register: %d\n", err);
+		return err;
+	}
+
+	/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d.c */
+	switch (smbus_data.byte) {
+	case 0x32:
+	case 0x33:
+	case 0x3a:
+	case 0x3b:
+		break;
+	default:
+		pr_warn("Unknown who-am-i register value 0x%02x\n", smbus_data.byte);
+		return -ENODEV;
+	}
+
+	pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);
+	info->addr = addr;
+	return 0;
+}
+
 static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
 {
 	/*
@@ -93,7 +210,17 @@ static void instantiate_i2c_client(struct work_struct *work)
 	if (!adap)
 		return;
 
-	info.addr = (long)lis3lv02d_dmi_id->driver_data;
+	if (lis3lv02d_dmi_id) {
+		info.addr = (long)lis3lv02d_dmi_id->driver_data;
+	} else {
+		/* First try address 0x29 (most used) and then try 0x1d */
+		if (detect_lis3lv02d(adap, 0x29, &info) != 0 &&
+		    detect_lis3lv02d(adap, 0x1d, &info) != 0) {
+			pr_warn("failed to probe for lis3lv02d I2C address\n");
+			goto out_put_adapter;
+		}
+	}
+
 	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
 
 	i2c_dev = i2c_new_client_device(adap, &info);
@@ -104,6 +231,7 @@ static void instantiate_i2c_client(struct work_struct *work)
 		pr_debug("registered lis3lv02d on address 0x%02x\n", info.addr);
 	}
 
+out_put_adapter:
 	i2c_put_adapter(adap);
 }
 static DECLARE_WORK(i2c_work, instantiate_i2c_client);
@@ -166,8 +294,9 @@ static int __init dell_lis3lv02d_init(void)
 	put_device(dev);
 
 	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
-	if (!lis3lv02d_dmi_id) {
+	if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
 		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
+		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
 		return 0;
 	}
 
-- 
2.45.1


