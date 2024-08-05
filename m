Return-Path: <linux-i2c+bounces-5145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC1947BFF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 15:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97D1281A1C
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0213A1B0;
	Mon,  5 Aug 2024 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcJ84mj7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D8364AE
	for <linux-i2c@vger.kernel.org>; Mon,  5 Aug 2024 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865140; cv=none; b=QGLP5n8xx9Gk6KKZRW1xOF3yEeM1Q8t1mCesnstcg5aiqdWWNPOAm1nCT01uZNhy0hiLSqQhBNjFc5rtFAqtqh9/ilXGLeF/tNzFawfkV3YapYdyfYQh8J6Gx9Cju/BCvUXKP+PyTKV4/PNExR3LlWtwmYNgE5nDiCFn1lhwxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865140; c=relaxed/simple;
	bh=jGR8kBkPPQ7J/+W1K8e2CgUZiCz0N9ydw8bbGIB+Z0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUivM6dapCPgqHfAMYYkfNDvIGvMCsvJDI1zLhPStnbWmPVFJ888WSVz7uQCYeb3tyqimPeSqFLOGCyORwVVjRVUMhHuCgHd99h4g5QJH530Bj0HwxMa2t68NhNzFVMAjjq2adi0e9eMwDoDsod5U/yUITffJP72XGOhHHCxmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcJ84mj7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722865138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIE1Tdqjj+u6sTzRWwSTUv019AwQqHsQmCFM7783DuE=;
	b=fcJ84mj78ncAyMQhUhy643Osoh8TO6L+Nuv3vtx2hXepCDaAI31V/8I/Na6ht6h4dqmTHE
	CCAyl/WwgohjkJ8OamepWGwl2B9cI55GStdGnNPYsiuQV1ZkoqY55u/TJqCQLN1/ZVCE/2
	9Hsc4guWthIDM5yazr5g14FaxhuNGO8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-7x4l2pVVPsmPeGNM8JBTRA-1; Mon,
 05 Aug 2024 09:38:54 -0400
X-MC-Unique: 7x4l2pVVPsmPeGNM8JBTRA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7EC71955D4E;
	Mon,  5 Aug 2024 13:38:51 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47E7130001A9;
	Mon,  5 Aug 2024 13:38:40 +0000 (UTC)
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
Subject: [PATCH v7 6/6] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
Date: Mon,  5 Aug 2024 15:37:08 +0200
Message-ID: <20240805133708.160737-7-hdegoede@redhat.com>
In-Reply-To: <20240805133708.160737-1-hdegoede@redhat.com>
References: <20240805133708.160737-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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
Changes in v6:
- Use i2c_new_scanned_device() instead of re-inventing it

Changes in v5:
- Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index ab02ad93758a..21390e6302a0 100644
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
@@ -57,6 +59,38 @@ static u8 i2c_addr;
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
+	pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
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
+		pr_warn("Unknown who-am-i register value 0x%02x\n", smbus_data.byte);
+		return 0; /* Not found */
+	}
+
+	pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);
+	return 1; /* Found */
+}
+
 static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
 {
 	/*
@@ -93,10 +127,18 @@ static void instantiate_i2c_client(struct work_struct *work)
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
 		pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
 		i2c_dev = NULL;
@@ -167,12 +209,14 @@ static int __init dell_lis3lv02d_init(void)
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
2.45.2


