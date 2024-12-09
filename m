Return-Path: <linux-i2c+bounces-8381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0D39E9E1F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 19:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D11518883BE
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 18:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622C01607B4;
	Mon,  9 Dec 2024 18:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TyclXe7X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9316CD1D
	for <linux-i2c@vger.kernel.org>; Mon,  9 Dec 2024 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769379; cv=none; b=nqtysrPqqwrAfXCAiqvkNMVSmHm2+UIU1SqnPMMF2lOcISIcSythRUI5uhGw0sgWQpcjpDE2h0m9cSRAtTZk5wGQsuA28OU5G0D40WwslHVY3ShWdHupu5FuHlabZcjaoMihQVPrkj4LsI8x1ascdESgl8FrR3owx051YD1/Wwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769379; c=relaxed/simple;
	bh=gjnqAIyw7lYG69DWV9e4LUcYA396kaarLTXeu8N5ljM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYuwu0GfNbCWQZgY2mbxliS6+CaUW1Ae7U09McxhHtKHrXNMAFf3mhwcHf3t1k4+bW3AnoYSrDfjQRqGIrNzyh6odbC4dkRIt9jnbeavNt4UGKwUcpphu4HUzFviMytw/kgYOzYvm4O7PEuslPxlusLsUL0As9EOZ7q4+Wk+NnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TyclXe7X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733769376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whQanVYdGB5PT+pI3EC78eugYKRFPHTf8aVw7TloKuE=;
	b=TyclXe7XOYUBZdVxJeoMxSzY/lo3GoVIuY922io0ly2i78Z78A6smL/zqj+R1IJ0ztyp3F
	FlvM3mTuWs9KGIhKIFVvbzA8Y9nXXE7y6j10AtsONaxa/X0Qjmds9dGwOLzVf36xK0Z4sv
	YP3IpRc29Lbv0toOhQt0NcEQlUgnABs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-296-A5BdAnElMJOQi3TnRup0gA-1; Mon,
 09 Dec 2024 13:36:13 -0500
X-MC-Unique: A5BdAnElMJOQi3TnRup0gA-1
X-Mimecast-MFC-AGG-ID: A5BdAnElMJOQi3TnRup0gA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D617A1955E80;
	Mon,  9 Dec 2024 18:36:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 494EF1956056;
	Mon,  9 Dec 2024 18:36:04 +0000 (UTC)
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
Subject: [PATCH v9 1/4] platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to dell-smo8800-ids.h
Date: Mon,  9 Dec 2024 19:35:54 +0100
Message-ID: <20241209183557.7560-2-hdegoede@redhat.com>
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

Move the SMO88xx acpi_device_ids to a new dell-smo8800-ids.h header,
so that these can be shared with the new dell-lis3lv02d code.

Reviewed-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
- Add #include <linux/module.h> for MODULE_DEVICE_TABLE()

Changes in v4:
- This is a new patch in v3 of this patch-set
---
 drivers/platform/x86/dell/dell-smo8800-ids.h | 27 ++++++++++++++++++++
 drivers/platform/x86/dell/dell-smo8800.c     | 16 +-----------
 2 files changed, 28 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h

diff --git a/drivers/platform/x86/dell/dell-smo8800-ids.h b/drivers/platform/x86/dell/dell-smo8800-ids.h
new file mode 100644
index 000000000000..ec58e229ba7a
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-smo8800-ids.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  ACPI SMO88XX lis3lv02d freefall / accelerometer device-ids.
+ *
+ *  Copyright (C) 2012 Sonal Santan <sonal.santan@gmail.com>
+ *  Copyright (C) 2014 Pali Rohár <pali@kernel.org>
+ */
+#ifndef _DELL_SMO8800_IDS_H_
+#define _DELL_SMO8800_IDS_H_
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+static const struct acpi_device_id smo8800_ids[] = {
+	{ "SMO8800" },
+	{ "SMO8801" },
+	{ "SMO8810" },
+	{ "SMO8811" },
+	{ "SMO8820" },
+	{ "SMO8821" },
+	{ "SMO8830" },
+	{ "SMO8831" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, smo8800_ids);
+
+#endif
diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 87fe03f23f24..8872f9b57fce 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -14,10 +14,10 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/miscdevice.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
+#include "dell-smo8800-ids.h"
 
 struct smo8800_device {
 	u32 irq;                     /* acpi device irq */
@@ -163,20 +163,6 @@ static void smo8800_remove(struct platform_device *device)
 	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
 }
 
-/* NOTE: Keep this list in sync with drivers/i2c/busses/i2c-i801.c */
-static const struct acpi_device_id smo8800_ids[] = {
-	{ "SMO8800", 0 },
-	{ "SMO8801", 0 },
-	{ "SMO8810", 0 },
-	{ "SMO8811", 0 },
-	{ "SMO8820", 0 },
-	{ "SMO8821", 0 },
-	{ "SMO8830", 0 },
-	{ "SMO8831", 0 },
-	{ "", 0 },
-};
-MODULE_DEVICE_TABLE(acpi, smo8800_ids);
-
 static struct platform_driver smo8800_driver = {
 	.probe = smo8800_probe,
 	.remove = smo8800_remove,
-- 
2.47.1


