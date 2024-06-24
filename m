Return-Path: <linux-i2c+bounces-4300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA391484F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 13:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1437F1F21014
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 11:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D7513791F;
	Mon, 24 Jun 2024 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bb7yzmAT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AED442C
	for <linux-i2c@vger.kernel.org>; Mon, 24 Jun 2024 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227758; cv=none; b=UVcd9Bs1VaQ/lVGmrfKI7pY7XelnHna6yox6ePko/MQbd3g9HlZn+wX/i1LfORiOYJjUUWcB8YeyEqs3p2W6XGL4CGheR52VoLTBRdG53akoy4TMYvR2DZGxQaC9sQh1U9tQ8BxjaJuq7l2k6DTRZ30YYhDmdvHtQ4HO7D9uuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227758; c=relaxed/simple;
	bh=siDLK3+fd5aEGNwsKFUm15akOnuuWqRdyexlbGpejLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z785PQysn2BMAbxPognNlpdjCag5huVFrlucfVP8/4S1SiVCGMFn4NUEETJ9U9WOAN2UEQF4vu7jPbVwdh74Mcq4gT+Vn/GDVP6qtVuot5lfZi4RolJgEe7dOj6lojv+4EMhR7LRkoJFUndVAyv0W9VcohLklZFvyxMaFRAYsKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bb7yzmAT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719227756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzS7aq8VZgaAswwmoXOD+ZSywoFB/n4ePNCxStLsEZE=;
	b=bb7yzmATN0Cg6yvaVPPUVfQHP8hzUXtdcB2Nj/oSCo+mKO8Xszb2csWTP0xiJH/ii2pseH
	ZIClASr/67inrJrAfdsX/iTbShc/6TlyOUXzrlfWvjv3gv5Vrs1eywlr/OC2mRadmdY7fv
	izmMt4eHcLZXo+ro4geZ8jJKzPNAZDI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-KhnIE9D2NcaBQRgRFvc_eg-1; Mon,
 24 Jun 2024 07:15:52 -0400
X-MC-Unique: KhnIE9D2NcaBQRgRFvc_eg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF97C19560A7;
	Mon, 24 Jun 2024 11:15:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.82])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C3B4A1956087;
	Mon, 24 Jun 2024 11:15:44 +0000 (UTC)
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
Subject: [PATCH v4 3/6] platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to dell-smo8800-ids.h
Date: Mon, 24 Jun 2024 13:15:15 +0200
Message-ID: <20240624111519.15652-4-hdegoede@redhat.com>
In-Reply-To: <20240624111519.15652-1-hdegoede@redhat.com>
References: <20240624111519.15652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Move the SMO88xx acpi_device_ids to a new dell-smo8800-ids.h header,
so that these can be shared with the new dell-lis3lv02d code.

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


