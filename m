Return-Path: <linux-i2c+bounces-4608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B0925F2B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 13:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2E32B38CE2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A495B17DE01;
	Wed,  3 Jul 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P9rW0agV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDF17DA3A
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004749; cv=none; b=ExV17XwVuoFmLpHzZDvmtijxAZCXxqdOALoOoCWNJnylRL9dJDTx10Lj6GjtSJ75sfSp20KH0VdTP+FYdoCi31/jK0RHSiEPRaSpvCJlCbAT3q/ShfFnGVCWbC3/ymTr3+RnH7Uch619u3DINe6Pvd7Kjfb3lKXVWItUglu5Hgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004749; c=relaxed/simple;
	bh=9+5ijawvv6OCXAtYMN7exU9MzHfcU7rH6D4NZaW5bEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emI10edaztbR3ktvaRlyxOIufNABhdEY1aRoan2Zxie9wo5StMM+i0H2dP3bQ7T8NaXS50k2PjYj2C9JQwIrgzeF04LitW6SCzCaLAq7ZpKRbtahHXIw7b7nXP6W0T5fEWAbPR527n6Js37m1c6VPJeRhPLV1AXafH/RDi7Cpzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P9rW0agV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720004746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyJ1dtPmMc1CBJtThTe3+L5azwDxbWybN3OCGIWy9go=;
	b=P9rW0agVeIJsaLB5cu1oovQ7fnIpsYEyJW3WWnzVfhlR4NXCpaRL1yUEJnFSlQWucNSeiF
	4U89wf9zsMeTxBYBi1mtoqS/B7glHuRElPclicPde7csKHrWIJTmnfObXS+bW4YrZNz+Gk
	bzDO6uKQwhXh/yuZHE1cpx9UPM1yjZ0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-IGyer6KHO4yDxWq6L5zBlg-1; Wed,
 03 Jul 2024 07:05:43 -0400
X-MC-Unique: IGyer6KHO4yDxWq6L5zBlg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50E82195608C;
	Wed,  3 Jul 2024 11:05:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.199])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82E8A1955F4B;
	Wed,  3 Jul 2024 11:05:33 +0000 (UTC)
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
Subject: [PATCH v5 3/6] platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to dell-smo8800-ids.h
Date: Wed,  3 Jul 2024 13:05:09 +0200
Message-ID: <20240703110512.21401-4-hdegoede@redhat.com>
In-Reply-To: <20240703110512.21401-1-hdegoede@redhat.com>
References: <20240703110512.21401-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move the SMO88xx acpi_device_ids to a new dell-smo8800-ids.h header,
so that these can be shared with the new dell-lis3lv02d code.

Reviewed-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- This is a new patch in v3 of this patch-set
---
 drivers/platform/x86/dell/dell-smo8800-ids.h | 26 ++++++++++++++++++++
 drivers/platform/x86/dell/dell-smo8800.c     | 16 +-----------
 2 files changed, 27 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h

diff --git a/drivers/platform/x86/dell/dell-smo8800-ids.h b/drivers/platform/x86/dell/dell-smo8800-ids.h
new file mode 100644
index 000000000000..f85d8b707d85
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-smo8800-ids.h
@@ -0,0 +1,26 @@
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
index f7ec17c56833..f9119ed2bd92 100644
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
 	.remove_new = smo8800_remove,
-- 
2.45.1


