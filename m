Return-Path: <linux-i2c+bounces-985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1909F81DC93
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C25C41F218C7
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B251FBEE;
	Sun, 24 Dec 2023 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YrIno9MJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F2F510
	for <linux-i2c@vger.kernel.org>; Sun, 24 Dec 2023 21:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703453809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7lO1uaz/ZRe5FDaz+Rmivlfd0oloIIxNKefGrRzMRc=;
	b=YrIno9MJYD3hsI593qevEAZkKuGJbgo47DLO03VaiHxhwJlpPHnWXzMgzTR1EW3Ct4pVE4
	F6oD7WZu1CfJHN/OHjl9swpnzN5qxPcTDZR0dplU7hTXtxyjyMCGXhlpf/ZZd7JRP+OG2D
	vJPGwW3Huj1KJ3YTqNSsVRsd1fTK/TY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-hxyS3GeNPqe4x_PnT2y3rw-1; Sun,
 24 Dec 2023 16:36:45 -0500
X-MC-Unique: hxyS3GeNPqe4x_PnT2y3rw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AD2A3869144;
	Sun, 24 Dec 2023 21:36:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2D3D2026D66;
	Sun, 24 Dec 2023 21:36:42 +0000 (UTC)
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
Subject: [PATCH 2/6] platform/x86: dell-smo8800: Change probe() ordering a bit
Date: Sun, 24 Dec 2023 22:36:18 +0100
Message-ID: <20231224213629.395741-3-hdegoede@redhat.com>
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
index 4d5f778fb599..86f898a857e1 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -125,19 +125,17 @@ static int smo8800_probe(struct platform_device *device)
 
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
@@ -151,6 +149,7 @@ static int smo8800_probe(struct platform_device *device)
 
 	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
 		 smo8800->irq);
+	platform_set_drvdata(device, smo8800);
 	return 0;
 
 error:
-- 
2.43.0


