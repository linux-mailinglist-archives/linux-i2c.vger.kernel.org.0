Return-Path: <linux-i2c+bounces-8382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F1F9E9E22
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 19:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98480281C0D
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 18:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A561D1607B4;
	Mon,  9 Dec 2024 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QmYAFi7P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF15165F16
	for <linux-i2c@vger.kernel.org>; Mon,  9 Dec 2024 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769387; cv=none; b=IsUszrd72BYR//LqDerlv/8Xmut2V3jjNU0gjasK8YFqXLBUm+SlW+Bmn7SbO39dELJWzdP6QrVVeQ92fIuggd2BVXFFvw9HRXMS/rjCSqhlDDnAtzgDdGdyVj2HOsfI4tG9BMyyW/Kc5lEffZvklyGowyk0LqEwclJtbLr9NcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769387; c=relaxed/simple;
	bh=MmeUg64gk4TPH1u585Vw1Lykg4H1gD6FpbCUDMQpS+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vgd/80+U04gLMK93bETZEeq/WoBGjhkXwTeuQKcOSilYhw2NSu83HVpebQHnb5zZyFsMAINUuwcZZhEPYOAudF4th/AjFtcIbt5/sfrcAsN2DCSboA8zktNdibsRYBG3ikqOtqp5C+eqwIGs7p9HLBkfLszlQBVxvqO+y2PpIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QmYAFi7P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733769384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWO9FeXlZFNvkeCNrXXlscD81Cc74j0w+gifCrHRLeM=;
	b=QmYAFi7PdzuZINOknP23MIL1r6MVmuoOja3NxGUnG68JkGTayCJO1l5V3TK/xjfNymdwTE
	DJGWEGOzbhSCYoLJqRMkNWqL5nZC4w3ak4OwDZKsaa3yr6Ob9eianSqbWOP9l9GEFwxuni
	Xuqlk3kTYwVe+gHtl32vqZLhZwzoTJY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-PMALzvd8OPq_V46h708wZw-1; Mon,
 09 Dec 2024 13:36:21 -0500
X-MC-Unique: PMALzvd8OPq_V46h708wZw-1
X-Mimecast-MFC-AGG-ID: PMALzvd8OPq_V46h708wZw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D17F1954AFC;
	Mon,  9 Dec 2024 18:36:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7514A1956056;
	Mon,  9 Dec 2024 18:36:14 +0000 (UTC)
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
Subject: [PATCH v9 3/4] platform/x86: dell-smo8800: Add a couple more models to lis3lv02d_devices[]
Date: Mon,  9 Dec 2024 19:35:56 +0100
Message-ID: <20241209183557.7560-4-hdegoede@redhat.com>
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
index 6dc04c89e6c9..d2b34e10c5eb 100644
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
2.47.1


