Return-Path: <linux-i2c+bounces-1187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 441BE82608F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC3F21F23DCB
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A751F8495;
	Sat,  6 Jan 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8bZgq2/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA279C3
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTBTtEoT636PgY3gnhZioEd6sKtFJCSFKH7xNHvAW9Q=;
	b=g8bZgq2/sZ4t+vUxaY4Z0ySnl4DV/GzFUR9oggLwFHeNcdWqpCVjmMH0g1SgTfX4dviuU4
	Ch0qfTboBnVIvEBxRGux0t21bdCbNcDvqZsiTF3wncfLgAmLtPwEO2mQN1yZegvC/H53rD
	oNBvoT80g5G49Aa4cZ1DYFVbHqoxW3c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-218-jnk1nRUCOgWEBZ5GcidPWw-1; Sat,
 06 Jan 2024 11:09:55 -0500
X-MC-Unique: jnk1nRUCOgWEBZ5GcidPWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09AB01C0CCAD;
	Sat,  6 Jan 2024 16:09:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5169E3C27;
	Sat,  6 Jan 2024 16:09:53 +0000 (UTC)
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
Subject: [PATCH v2 6/6] platform/x86: dell-smo8800: Add a couple more models to dell_lis3lv02d_devices[]
Date: Sat,  6 Jan 2024 17:09:33 +0100
Message-ID: <20240106160935.45487-7-hdegoede@redhat.com>
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

Add the accelerometer address for the following laptop models
to dell_lis3lv02d_devices[]:

Dell Latitude E6330
Dell Latitude E6430

Tested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- This is a new patch in v2 of this series
---
 drivers/platform/x86/dell/dell-smo8800.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 021ad31eb84d..49547a077df7 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -318,6 +318,8 @@ static const struct {
 	 * Additional individual entries were added after verification.
 	 */
 	{ "Latitude 5480",      0x29 },
+	{ "Latitude E6330",     0x29 },
+	{ "Latitude E6430",     0x29 },
 	{ "Vostro V131",        0x1d },
 	{ "Vostro 5568",        0x29 },
 };
-- 
2.43.0


