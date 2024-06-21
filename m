Return-Path: <linux-i2c+bounces-4206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5091252C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FC4F1F23089
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71552152177;
	Fri, 21 Jun 2024 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O9mUBpJW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B015216C
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972789; cv=none; b=VbeVnsGntNB5L5l1JgdeETjGFXsTimhqcgnHmWBfxo1ntiz4GQuFzRZRwtgVXugib9rdBIdKHbn/2C3Nu2AHq6I/A4/cHT9oOvfdS9tTSuetqfWlvNHHwf07xovlNPuLF2XRClI2HlaUKU4ii2FZBnF6teWXo4xwLOGMxP1BQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972789; c=relaxed/simple;
	bh=GqCJUEu6HvllrEv6mt7zNui7VJwFT5x1A/AE8OsFp+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eghezDPy1Od9b3B0uhDmEvEN4weGsEDjN6q+d9wMnSAImTPqFIf7ceR+pdzxqYY0+w+j5uL4Tuio/QyntM5DtGPMCYKI/3rW9XpNZ5DqNeOktw/4jEe69YmLO/+nYOTqYhjrUMo40LDxalpa2PYdnFHH7H/sBX3d/OsGBmMrA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O9mUBpJW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718972787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vIlGIjnZaRmqlGYYwh9589os9i1avVj+5PIgcozfw4=;
	b=O9mUBpJWgxT+JsCsNuog5C774GOkoBFFEUQWMP/Fm/b1PojNr8ZGDqp/3KXAEwMw0eRshl
	xTAOMeKVGWJXVy897MvcBo7Ud4fAQ4vOc73XLrN2UZ/nxSa+jboLE0hCyOsYpU2EeEGjbM
	21Ys/IU5YKHI7/ASH1byAQHfc3iIeoQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-IkT0cEbvPgCDX_HyHi4ZVg-1; Fri,
 21 Jun 2024 08:26:19 -0400
X-MC-Unique: IkT0cEbvPgCDX_HyHi4ZVg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84F601955D89;
	Fri, 21 Jun 2024 12:26:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E7965300144C;
	Fri, 21 Jun 2024 12:25:49 +0000 (UTC)
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
Subject: [PATCH v3 5/6] platform/x86: dell-smo8800: Add a couple more models to dell_lis3lv02d_devices[]
Date: Fri, 21 Jun 2024 14:25:00 +0200
Message-ID: <20240621122503.10034-6-hdegoede@redhat.com>
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

Add the accelerometer address for the following laptop models
to dell_lis3lv02d_devices[]:

Dell Latitude E6330
Dell Latitude E6430
Dell XPS 15 9550

Tested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 2e49bbb569c6..4c79b2599d96 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -173,6 +173,20 @@ static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
 		},
 		.driver_data = (void *)0x29L,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6330"),
+		},
+		.driver_data = (void *)0x29L,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6430"),
+		},
+		.driver_data = (void *)0x29L,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
@@ -194,6 +208,13 @@ static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
 		},
 		.driver_data = (void *)0x29L,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
+		},
+		.driver_data = (void *)0x29L,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-- 
2.45.1


