Return-Path: <linux-i2c+bounces-984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00F81DC91
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA4C71C20DE2
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FC1F517;
	Sun, 24 Dec 2023 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XqAwE5P1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEAFEAE5
	for <linux-i2c@vger.kernel.org>; Sun, 24 Dec 2023 21:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703453807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsuJPCc7Y1QpnRJA01GfwB9KUPJKZqy9e15JEuNppOg=;
	b=XqAwE5P1KmemIgk5jVUgaw1jJuh+Kzy8Dn/ldlJwXfx5R8zrLhP81bVimVl2X6HZZ6zyja
	In5WeDzKNq7Yw420ME6dzGgzHLnyF+T+WY9/w5HBWDjR7O+IocmHczRu8vGkBRslOqzykl
	noA5aP4KKqE7YD83FkH640wdZmK3DpI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-db2_Y567P7apnkNfwm8Rzw-1; Sun,
 24 Dec 2023 16:36:44 -0500
X-MC-Unique: db2_Y567P7apnkNfwm8Rzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E573C025B6;
	Sun, 24 Dec 2023 21:36:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05D3F2026D66;
	Sun, 24 Dec 2023 21:36:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops
Date: Sun, 24 Dec 2023 22:36:17 +0100
Message-ID: <20231224213629.395741-2-hdegoede@redhat.com>
In-Reply-To: <20231224213629.395741-1-hdegoede@redhat.com>
References: <20231224213629.395741-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

The SMO8xxx ACPI HIDs are generic accelerometer ids which are also used
by other vendors. Add a sys_vendor check to ensure that the dell-smo8800
driver only loads on Dell laptops.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index f7ec17c56833..4d5f778fb599 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -10,6 +10,7 @@
 
 #define DRIVER_NAME "smo8800"
 
+#include <linux/dmi.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -108,6 +109,9 @@ static int smo8800_probe(struct platform_device *device)
 	int err;
 	struct smo8800_device *smo8800;
 
+	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
+		return false;
+
 	smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
 	if (!smo8800) {
 		dev_err(&device->dev, "failed to allocate device data\n");
-- 
2.43.0


