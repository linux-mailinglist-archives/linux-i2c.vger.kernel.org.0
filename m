Return-Path: <linux-i2c+bounces-1184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE2826086
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8FF1C21E5D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1623C8829;
	Sat,  6 Jan 2024 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQI6kKZ0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD058494
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CI06OPnX0QyWCxuRAb5gXiPTjDRHhJHYDBQVSbJTJL8=;
	b=PQI6kKZ0oziH1f3v/VrDLqyS07Lbq66gPKlFiBGfmLxOg/4j/DpDVONsXha15DIH9O7Pma
	dVaOmuN7fQ6RIkgcPC/Fz8la7pDyQF/yyUXcvvWOScMgc6Dp27xoVmxel4hUPnPXfc+VzI
	Vqy/YwiP10MXK5CA9IE/5yPuDhFsS+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-PUPEUM5xM0yQPlUbbdmn7g-1; Sat, 06 Jan 2024 11:09:49 -0500
X-MC-Unique: PUPEUM5xM0yQPlUbbdmn7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44397185A784;
	Sat,  6 Jan 2024 16:09:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 899733C27;
	Sat,  6 Jan 2024 16:09:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 3/6] platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
Date: Sat,  6 Jan 2024 17:09:30 +0100
Message-ID: <20240106160935.45487-4-hdegoede@redhat.com>
In-Reply-To: <20240106160935.45487-1-hdegoede@redhat.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

When a lis3lv02d i2c_client has been instantiated pass the IRQ to
the i2c_client and let the lis3lv02d driver take care of registering
/dev/freefall and handling the IRQ.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 40 ++++++++++++++----------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index c674e3392270..3e64ebcf4b21 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -199,6 +199,7 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
 	}
 
 	info.addr = addr;
+	info.irq = smo8800->irq;
 	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
 
 	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
@@ -239,21 +240,24 @@ static int smo8800_probe(struct platform_device *device)
 
 	smo8800_instantiate_i2c_client(smo8800);
 
-	err = misc_register(&smo8800->miscdev);
-	if (err) {
-		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
-		goto error_unregister_i2c_client;
-	}
+	/* smo8800->irq is passed to the i2c_client and its driver will take care of this */
+	if (!smo8800->i2c_dev) {
+		err = misc_register(&smo8800->miscdev);
+		if (err) {
+			dev_err(&device->dev, "failed to register misc dev: %d\n", err);
+			goto error_unregister_i2c_client;
+		}
 
-	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
-				   smo8800_interrupt_thread,
-				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-				   DRIVER_NAME, smo8800);
-	if (err) {
-		dev_err(&device->dev,
-			"failed to request thread for IRQ %d: %d\n",
-			smo8800->irq, err);
-		goto error;
+		err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
+					   smo8800_interrupt_thread,
+					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					   DRIVER_NAME, smo8800);
+		if (err) {
+			dev_err(&device->dev,
+				"failed to request thread for IRQ %d: %d\n",
+				smo8800->irq, err);
+			goto error;
+		}
 	}
 
 	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
@@ -272,9 +276,11 @@ static void smo8800_remove(struct platform_device *device)
 {
 	struct smo8800_device *smo8800 = platform_get_drvdata(device);
 
-	free_irq(smo8800->irq, smo8800);
-	misc_deregister(&smo8800->miscdev);
-	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
+	if (!smo8800->i2c_dev) {
+		free_irq(smo8800->irq, smo8800);
+		misc_deregister(&smo8800->miscdev);
+		dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
+	}
 	i2c_unregister_device(smo8800->i2c_dev);
 }
 
-- 
2.43.0


