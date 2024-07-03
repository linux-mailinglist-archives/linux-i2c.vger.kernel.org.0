Return-Path: <linux-i2c+bounces-4610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA8925C61
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 13:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173C61F213F7
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7383818132E;
	Wed,  3 Jul 2024 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKN9FzAr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9277180A9C
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004760; cv=none; b=QWj8xwiplEM/8Fzg1jwb7KO8sZA7gEcPmVqsSpE1GYrD3kdUUteC3Qi2dLQ6aryovOrsjFcM1EBO0eQJgrHU88BMy9KPUuYDtpNBbyIli5r++QNNjeBOmurjchE63m9H9WFlldC/e2Sq4EAqXP6B0IjHtdfvw6ue0A2xq8qsuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004760; c=relaxed/simple;
	bh=144y2VmJ2KhLobQaGP2Vxr2omfrAl6OoF03ve4lds7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrH/+P89QCaUgpnCNIUK60Pmr1WXkVOiyQXVvZ3ak0Ei48t2da9onmi4labFCG/as8ul7j+q2tFJPv44Aq2hHzRisjdu8OZbSVqT3AB02/GKpG/5aOzCtVpaO/IrDKR8LNEUFnMDzzgVjBQs5j8gTj374FSWjrxCLAH3+jNeVfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKN9FzAr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720004758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym57UjbanLaj/WNhRorqcR9rMzA1ucQPJ6iK2rZbX+U=;
	b=jKN9FzAru49wHTN+JoNwGIHfjOGYFhy/FTrnY/woufs8QxbXiUkoHji22GpqgSg2mWhZxC
	9uRGOfBvcY2TZJjqw78oV0Io6i8Tlc8VJLxbVyR9nKCPMYPX/XbOE8xpk3IvJ6o25GP1jJ
	bmGKP5ypvw1rqy8nrmXic/Yfvuu5cNo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-ad8zO3qlM9KPh-Tqf6R2aw-1; Wed,
 03 Jul 2024 07:05:51 -0400
X-MC-Unique: ad8zO3qlM9KPh-Tqf6R2aw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1079195608C;
	Wed,  3 Jul 2024 11:05:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.199])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 050081955F1D;
	Wed,  3 Jul 2024 11:05:42 +0000 (UTC)
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
Subject: [PATCH v5 5/6] platform/x86: dell-smo8800: Add a couple more models to lis3lv02d_devices[]
Date: Wed,  3 Jul 2024 13:05:11 +0200
Message-ID: <20240703110512.21401-6-hdegoede@redhat.com>
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

Add the accelerometer address for the following laptop models
to lis3lv02d_devices[]:

Dell Latitude E6330
Dell Latitude E6430
Dell XPS 15 9550

Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index c74f0825d252..ab02ad93758a 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -43,10 +43,13 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
 	 * Additional individual entries were added after verification.
 	 */
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6430",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 7590",        0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 9550",        0x29),
 	{ }
 };
 
-- 
2.45.1


