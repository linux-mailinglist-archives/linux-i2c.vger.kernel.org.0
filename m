Return-Path: <linux-i2c+bounces-4302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F136914854
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 13:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C05021C21F78
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 11:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAF1137C22;
	Mon, 24 Jun 2024 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JpWGmiFu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27E130A79
	for <linux-i2c@vger.kernel.org>; Mon, 24 Jun 2024 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227777; cv=none; b=bztNqChFjWx4KwSsivJQoJSs6HF4fjUG66nemk8UI13Ir+drzbS7GNyQDzK9z/+DmClhrmut83aA+bVZPqnj8ML2zCyxPzB1YN29JFRsag/hVQr3SkSJz4CV1G9AMWFWZ8/A0jugko4R1pQykjcs2zft9YgXRgCnslCLIrejatU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227777; c=relaxed/simple;
	bh=BYLU99DAo3CLcoepHXqPpWUYlMkmWbmZBPqnEyW/SRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbR72X4B/K0MeIAZYOKtw/uqpS2vhjPIGJycWUSjYgOsfcUf3mGa3w0oDWjaMFEXZ/HkK1ZcOsiePWPXDboCpHtY5Twk1bF1+v+i61kHTjx/71Z72s2SCQouH8xcqFJgVnArYALXs8kshKJtbRRqSBIQkl7YMKlzp1wKyjkS3cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JpWGmiFu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719227775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CyK1KrOF4fd+e+widSVGEysf25gU/VQCncTk+1YfWeQ=;
	b=JpWGmiFu36EtMNnS0BbMlr6Bp3Did+RyDPF8px14TcHfDcB50i3YY8edS3U1ELOfPYwJZw
	n/WdPEiNhDDDBvWo1PwE6PCaxGwRinRhdJTV2apdQNQOfob/YLRwMCxVL1py986ZRPwX7K
	8i7CoJ94qaw1NsTs5e/kUlUiWXY/4KQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-miDv4aJXOCCMJRAVint9cA-1; Mon,
 24 Jun 2024 07:16:08 -0400
X-MC-Unique: miDv4aJXOCCMJRAVint9cA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 050101956096;
	Mon, 24 Jun 2024 11:16:07 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.82])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 89C9E1956087;
	Mon, 24 Jun 2024 11:16:00 +0000 (UTC)
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
Subject: [PATCH v4 5/6] platform/x86: dell-smo8800: Add a couple more models to lis3lv02d_devices[]
Date: Mon, 24 Jun 2024 13:15:17 +0200
Message-ID: <20240624111519.15652-6-hdegoede@redhat.com>
In-Reply-To: <20240624111519.15652-1-hdegoede@redhat.com>
References: <20240624111519.15652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Add the accelerometer address for the following laptop models
to lis3lv02d_devices[]:

Dell Latitude E6330
Dell Latitude E6430
Dell XPS 15 9550

Tested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
q# Please enter the commit message for your changes. Lines starting
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index e581b8e2a603..a7409db0505b 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -43,10 +43,13 @@ static const struct dmi_system_id lis3lv02d_devices[] = {
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


