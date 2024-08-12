Return-Path: <linux-i2c+bounces-5326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0894F854
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 22:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D37E31F21A04
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 20:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2644194C65;
	Mon, 12 Aug 2024 20:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gf47dMkv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D81194A68
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723495237; cv=none; b=baeSU/4b8RPo06+pVRit5J96LDodDvjuhY11mlZPwhn6e7iorJDNLk2DCvLiJy9d7b2bxka5yLUZh4f5XlJCCJzp57yOMkhkut8hLTwC07lFdlOYijoC0gVOXj47eb9nXvqMmzXj4Vs0//suNEkee5MVa0V/883HGh8TF7hFTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723495237; c=relaxed/simple;
	bh=bnIzSl53C1Xc0gA+yDN0x8Xn8HgNs3EUzjZuQahgYVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSOJ21MxvgtIwdfGZNTMn8CHv0UIQnS0Nu2pwJF+ofkoyk0FW/OO2WeOMzOV+klc91DurW96Xp9WQEmirc11ogfIE3W7C8sZ+dLnjkM43/fBpOUfitRMVXDhz1KbzMgZLkFd/ht0f5Rz/GjBpHjbjKRTHKEPoSR4yseogrKuLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gf47dMkv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723495235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMhiORPDs9k7vrqzUstjy59Ryx20HxNCVXIU+Jv2doc=;
	b=gf47dMkvMdkiUkMUHbB322X5Wjj24hQWshe2f1XvIJaZyo0LRd75t/BSlm5MSCVFloCPnA
	euM/inroUK5A+RYVVeVIr3WxpbveAUzr16ZlcPIf3SqMGSfLK+wP511TWm/eFDOLL2W2J+
	Q/s+KQsL1Nm8Z01ivL5QzYf/onv+lU0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-BU3HRGhmMvu6NCaWpXmdsg-1; Mon,
 12 Aug 2024 16:40:31 -0400
X-MC-Unique: BU3HRGhmMvu6NCaWpXmdsg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5A981954186;
	Mon, 12 Aug 2024 20:40:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.50])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5585419560A3;
	Mon, 12 Aug 2024 20:40:25 +0000 (UTC)
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
Subject: [PATCH v8 6/6] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
Date: Mon, 12 Aug 2024 22:39:52 +0200
Message-ID: <20240812203952.42804-7-hdegoede@redhat.com>
In-Reply-To: <20240812203952.42804-1-hdegoede@redhat.com>
References: <20240812203952.42804-1-hdegoede@redhat.com>
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
Changes in v8:
- Use dev_err() / dev_dbg() where possible using &adap->dev as the device
  for logging

Changes in v6:
- Use i2c_new_scanned_device() instead of re-inventing it

Changes in v5:
- Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 53 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index d2b34e10c5eb..8d9dc59c7d8c 100644
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
@@ -57,6 +59,39 @@ static u8 i2c_addr;
 static struct i2c_client *i2c_dev;
 static bool notifier_registered;
 
+static bool probe_i2c_addr;
+module_param(probe_i2c_addr, bool, 0444);
+MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown, this may be dangerous.");
+
+static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short addr)
+{
+	union i2c_smbus_data smbus_data;
+	int err;
+
+	dev_info(&adap->dev, "Probing for lis3lv02d on address 0x%02x\n", addr);
+
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
+			     I2C_SMBUS_BYTE_DATA, &smbus_data);
+	if (err < 0)
+		return 0; /* Not found */
+
+	/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d.c */
+	switch (smbus_data.byte) {
+	case 0x32:
+	case 0x33:
+	case 0x3a:
+	case 0x3b:
+		break;
+	default:
+		dev_warn(&adap->dev, "Unknown who-am-i register value 0x%02x\n",
+			 smbus_data.byte);
+		return 0; /* Not found */
+	}
+
+	dev_dbg(&adap->dev, "Detected lis3lv02d on address 0x%02x\n", addr);
+	return 1; /* Found */
+}
+
 static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
 {
 	/*
@@ -97,10 +132,18 @@ static void instantiate_i2c_client(struct work_struct *work)
 	if (!adap)
 		return;
 
-	info.addr = i2c_addr;
 	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
 
-	i2c_dev = i2c_new_client_device(adap, &info);
+	if (i2c_addr) {
+		info.addr = i2c_addr;
+		i2c_dev = i2c_new_client_device(adap, &info);
+	} else {
+		/* First try address 0x29 (most used) and then try 0x1d */
+		static const unsigned short addr_list[] = { 0x29, 0x1d, I2C_CLIENT_END };
+
+		i2c_dev = i2c_new_scanned_device(adap, &info, addr_list, detect_lis3lv02d);
+	}
+
 	if (IS_ERR(i2c_dev)) {
 		dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
 		i2c_dev = NULL;
@@ -169,12 +212,14 @@ static int __init dell_lis3lv02d_init(void)
 	put_device(dev);
 
 	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
-	if (!lis3lv02d_dmi_id) {
+	if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
 		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
+		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
 		return 0;
 	}
 
-	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
+	if (lis3lv02d_dmi_id)
+		i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
 
 	/*
 	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
-- 
2.46.0


