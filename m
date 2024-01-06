Return-Path: <linux-i2c+bounces-1183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948AD82608E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B0EAB21B3C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4F28485;
	Sat,  6 Jan 2024 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtRfWiAV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD358495
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2hBJGz2Wi/NPBvzLa93WdECv6trQwPMVFDwcu22NUY=;
	b=KtRfWiAVldWu6zuQc2acaHhCrR+8+vhdQbwsbzROhKfhdzwiQaH1+GxeEkC0m7WvSgAHD5
	iA5NHctoAfTK2fifceCznSL/1n4MDdDNcevM2ebQqdM1kEjB+c+7EWkO++0wW/8WkQXEE4
	nX+FNNkhxiN8dBNWPyh+aQk3UMPEAzU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-eCfChzjBMguSfeeVReIJDA-1; Sat, 06 Jan 2024 11:09:46 -0500
X-MC-Unique: eCfChzjBMguSfeeVReIJDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E76B85A588;
	Sat,  6 Jan 2024 16:09:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0D3D3C27;
	Sat,  6 Jan 2024 16:09:43 +0000 (UTC)
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
Subject: [PATCH v2 1/6] platform/x86: dell-smo8800: Change probe() ordering a bit
Date: Sat,  6 Jan 2024 17:09:28 +0100
Message-ID: <20240106160935.45487-2-hdegoede@redhat.com>
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

Retrieve the IRQ number from the platform_device a bit earlier
and only call platform_set_drvdata() on successful probe
(the drvdata is only used from the remove() callback).

This is a preparation patch for moving the lis3lv02d i2c_client
instantiation from the i2c-i801 driver to dell-smo8800.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index f7ec17c56833..87339cc78880 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -121,19 +121,17 @@ static int smo8800_probe(struct platform_device *device)
 
 	init_waitqueue_head(&smo8800->misc_wait);
 
+	err = platform_get_irq(device, 0);
+	if (err < 0)
+		return err;
+	smo8800->irq = err;
+
 	err = misc_register(&smo8800->miscdev);
 	if (err) {
 		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
 		return err;
 	}
 
-	platform_set_drvdata(device, smo8800);
-
-	err = platform_get_irq(device, 0);
-	if (err < 0)
-		goto error;
-	smo8800->irq = err;
-
 	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
 				   smo8800_interrupt_thread,
 				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -147,6 +145,7 @@ static int smo8800_probe(struct platform_device *device)
 
 	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
 		 smo8800->irq);
+	platform_set_drvdata(device, smo8800);
 	return 0;
 
 error:
-- 
2.43.0


