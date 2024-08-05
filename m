Return-Path: <linux-i2c+bounces-5144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF3947BF8
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 15:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68E228174E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 13:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7920C2E851;
	Mon,  5 Aug 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XebQpKz/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B592D638
	for <linux-i2c@vger.kernel.org>; Mon,  5 Aug 2024 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865129; cv=none; b=PIay6OOJqeS56eSOVnRbWdmy/8gt3Ex2dsb/4wIGeuuyvaLM0OfCxvjgq41GS9a2Db1hRhCG7te5KDZ/+ojDvfINlAmBPIOSfSjy2HVMCjhGtwz+rNVCzc48VZAZdXG8p2sEOaltkqiQdd2S66oz8zErydZ86ZZjHzTeZBeUOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865129; c=relaxed/simple;
	bh=Gva1V3/wHcf48937VYxaNijXRrpXsxevJYk/Ni7BiNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZLKxSGNinOERRAQIL+fffK64t6739iQ0LTo55fv5mmvBXgeDhoqI4vhyaJH7lILF27KLeg2Bsr8xz9GLWzi5c6qwQzUfu3nTaa0NYu/40IkgAeF7+kgGaJa4HBN6Uba/8L2u7ClmFp+koUPALwpl8K8762EgSsg0QtlqJERYVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XebQpKz/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722865127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUvfHWHLQsjJmyKq2z0XqUy//iXkyvLlwXIWLFckbAs=;
	b=XebQpKz/WH3HPwZwJ47rEk6+oDiEvpIxb18Z/XqZkwIlkGB3PqgCSgqyaYoZS0qqcf0j+c
	5R+5qPnIWW3A67KULYcC08/1AF5Y/Y3Qhb905xZiqRhFAmeQ57cPqqjhR+6RfHLsG2miVs
	GTb6rLJDKaHkfXOCe1tSrLPRxKI54AY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-FnTkWMU_OvSm1r6Bx6xzoQ-1; Mon,
 05 Aug 2024 09:38:44 -0400
X-MC-Unique: FnTkWMU_OvSm1r6Bx6xzoQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AE591955F42;
	Mon,  5 Aug 2024 13:38:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0902630001A7;
	Mon,  5 Aug 2024 13:38:19 +0000 (UTC)
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
Subject: [PATCH v7 5/6] platform/x86: dell-smo8800: Add a couple more models to lis3lv02d_devices[]
Date: Mon,  5 Aug 2024 15:37:07 +0200
Message-ID: <20240805133708.160737-6-hdegoede@redhat.com>
In-Reply-To: <20240805133708.160737-1-hdegoede@redhat.com>
References: <20240805133708.160737-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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
2.45.2


