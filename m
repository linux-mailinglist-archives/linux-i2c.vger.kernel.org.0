Return-Path: <linux-i2c+bounces-987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82081DC95
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC8C1C2123C
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C639F101CA;
	Sun, 24 Dec 2023 21:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PPe0k4dw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46657FC0C
	for <linux-i2c@vger.kernel.org>; Sun, 24 Dec 2023 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703453813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkdREibjjpny8k3gw0YDw6eSMEYK6ZS86hxwJjjW8tE=;
	b=PPe0k4dwO/ez7uax5RnhSQvi0C4NfPycKFMVQ2rVf8hHSzfxrwdgWb5Dw+fi9BcLhcUzbq
	kwi7Q3Pea9dATcsmN+Hv3Ntj5O4Ky9sgsDxh7CbplRT59jA/DAxi40KD7+5SPQ/pasegDj
	SzUGLFM69l85zvzmbhZ1gJOTpYjJIdM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-Zb9yv9WiN82j0-t_19j5RA-1; Sun,
 24 Dec 2023 16:36:49 -0500
X-MC-Unique: Zb9yv9WiN82j0-t_19j5RA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70B6C1C0514E;
	Sun, 24 Dec 2023 21:36:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B665A2026D66;
	Sun, 24 Dec 2023 21:36:46 +0000 (UTC)
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
Subject: [PATCH 4/6] platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
Date: Sun, 24 Dec 2023 22:36:20 +0100
Message-ID: <20231224213629.395741-5-hdegoede@redhat.com>
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

When a lis3lv02d i2c_client has been instantiated pass the IRQ to
the i2c_client and let the lis3lv02d driver take care of registering
/dev/freefall and handling the IRQ.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 40 ++++++++++++++----------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 416b399cb9a1..7f7c9452a983 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -196,6 +196,7 @@ static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
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


