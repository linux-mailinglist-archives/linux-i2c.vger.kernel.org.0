Return-Path: <linux-i2c+bounces-4205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64014912526
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8577E1C22262
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FA11514C9;
	Fri, 21 Jun 2024 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aVSvfytw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01A1514FF
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972765; cv=none; b=uN21ZziKDAU2MyPpRDK5ofrYeaFiyemIHOOaaJQt5N9jWwemvjHXKM/snyeB2yKd/p8k/xKVDUSCiC8hlUKA7aLlOfCSYydcxyAwTTM+jQ8U81KRmpz5jzkf26l3IqVa68IHQe6NjtDEors4498gV4ZEB8FHm/KmI6mSVTSa/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972765; c=relaxed/simple;
	bh=5zQtHHEySJrpIHG82D6ki2OwG6KBFQm58fIYJBGhuVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2L3XkNePmCRbl0JwLrMENZ1Lf4jmDZrG/3kd44FM84vv0YqRLI3D43gkI1l8nyTBC1jTAFde/+IZprAoO8ObbiSfoh9oNi7sJ3mGrtvi6D1ZmSj/LJAtYzMtfXAnKZ3LEOXg1QvOnL9zWFpnVAzIS5D5MPmZEPdrCoi5EfZ7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aVSvfytw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718972763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZgONObBZJffcLWVJq2vpGlbmD97vuv/2ZnFqkIiFGQ=;
	b=aVSvfytwaq69kUR3R+fPMHeD7EFvwDIXqlSZ/R+vBYrLwqpcDsahgBN6AuBJY58rBq4htT
	iUnV2dy7ZGyqqFOq7RPSrV6a2YFPz+3z/tLPiev8G/5uzAJLGTJ8vQKbt8r17SlBM7Jerf
	RbnAFW0kOBx0NDgWiwCXhqZ1sv+ChZs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-n771SOZxPHicxhsxLcz6ew-1; Fri,
 21 Jun 2024 08:25:53 -0400
X-MC-Unique: n771SOZxPHicxhsxLcz6ew-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7960F1953976;
	Fri, 21 Jun 2024 12:25:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C31103000603;
	Fri, 21 Jun 2024 12:25:45 +0000 (UTC)
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
Subject: [PATCH v3 4/6] platform/x86: dell-smo8800: Allow lis3lv02d i2c_client instantiation without IRQ
Date: Fri, 21 Jun 2024 14:24:59 +0200
Message-ID: <20240621122503.10034-5-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-1-hdegoede@redhat.com>
References: <20240621122503.10034-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The Dell XPS 15 9550 can have a 60Wh battery, leaving space for a 2.5"
sata disk; or a 90Wh battery in which case the battery occupies the space
for the optional 2.5" sata disk.

On models with the 90Wh battery and thus without a 2.5" sata disk, the BIOS
does not add an IRQ resource to the SMO8810 ACPI device.

Make the misc-device registration and the requesting of the IRQ optional
and instantiate a lis3lv02d i2c_client independent of the IRQ being there,
so that the non freefall lis3lv02d functionality can still be used.

Note that IRQ 0 is not a valid IRQ number for platform IRQs
and this patch relies on that.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 67 +++++++++++++-----------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index cd2e48405859..2e49bbb569c6 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -310,33 +310,32 @@ static int smo8800_probe(struct platform_device *device)
 	init_waitqueue_head(&smo8800->misc_wait);
 	INIT_WORK(&smo8800->i2c_work, smo8800_instantiate_i2c_client);
 
-	err = misc_register(&smo8800->miscdev);
-	if (err) {
-		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
-		return err;
+	err = platform_get_irq_optional(device, 0);
+	if (err > 0)
+		smo8800->irq = err;
+
+	if (smo8800->irq) {
+		err = misc_register(&smo8800->miscdev);
+		if (err) {
+			dev_err(&device->dev, "failed to register misc dev: %d\n", err);
+			return err;
+		}
+
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
+
+		dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
+			 smo8800->irq);
 	}
 
-	platform_set_drvdata(device, smo8800);
-
-	err = platform_get_irq(device, 0);
-	if (err < 0)
-		goto error;
-	smo8800->irq = err;
-
-	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
-				   smo8800_interrupt_thread,
-				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-				   DRIVER_NAME, smo8800);
-	if (err) {
-		dev_err(&device->dev,
-			"failed to request thread for IRQ %d: %d\n",
-			smo8800->irq, err);
-		goto error;
-	}
-
-	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
-		 smo8800->irq);
-
 	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
 		/*
 		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
@@ -350,14 +349,20 @@ static int smo8800_probe(struct platform_device *device)
 	} else {
 		dev_warn(&device->dev,
 			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
+		if (!smo8800->irq)
+			return -ENODEV;
 	}
 
+	platform_set_drvdata(device, smo8800);
 	return 0;
 
 error_free_irq:
-	free_irq(smo8800->irq, smo8800);
+	if (smo8800->irq) {
+		free_irq(smo8800->irq, smo8800);
 error:
-	misc_deregister(&smo8800->miscdev);
+		misc_deregister(&smo8800->miscdev);
+	}
+
 	return err;
 }
 
@@ -371,9 +376,11 @@ static void smo8800_remove(struct platform_device *device)
 		i2c_unregister_device(smo8800->i2c_dev);
 	}
 
-	free_irq(smo8800->irq, smo8800);
-	misc_deregister(&smo8800->miscdev);
-	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
+	if (smo8800->irq) {
+		free_irq(smo8800->irq, smo8800);
+		misc_deregister(&smo8800->miscdev);
+		dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
+	}
 }
 
 static const struct acpi_device_id smo8800_ids[] = {
-- 
2.45.1


