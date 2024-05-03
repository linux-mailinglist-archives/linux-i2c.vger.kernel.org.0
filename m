Return-Path: <linux-i2c+bounces-3389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F18BAE82
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 16:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D51E281A90
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 14:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB111154427;
	Fri,  3 May 2024 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZskZqjP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4B71AACA
	for <linux-i2c@vger.kernel.org>; Fri,  3 May 2024 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745348; cv=none; b=CurB0yUyKGr+UbexTnBabGMbbrmnJ174V003M9q5zg7SUOUybh4rHhaK4ndyI3g2Nws9WKq3bZA4jxhKLjbP+3z+RgpJWqbuX/mN3+/I6srk+9nnJ4W8b5ePosjyYiAT/swb6lQwU7HTANWpyDQAJh6oKpsJiLIa4DGp/wMUrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745348; c=relaxed/simple;
	bh=yrk8Ihtl5V2ORfjto17NRJn7oWziNX4aEAu9oj/qQQ0=;
	h=Message-ID:Date:MIME-Version:Cc:From:To:Subject:Content-Type; b=Ft+PgafKIpFCIJoOU5erpSwADOs7GOIhOkKEtzZI8i5Ucn666eHGJEaWMl6sbwQ4xICFSOcB+R/NXh9qKYb95FCcYtGvm1WWKl6048H5UnFmwty2kHTHXRmx2nl/QBmSyjJml5scXC5fkdYGJHLHD1o3eBR4FjEiUXM4JjNoZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZskZqjP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a5894c1d954so434920366b.1
        for <linux-i2c@vger.kernel.org>; Fri, 03 May 2024 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714745345; x=1715350145; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:autocrypt:from:cc
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkWIN71zSmf0it0EZFexxf4IABTHGdztATZm8urk2wk=;
        b=dZskZqjPBUR6Ijsa3zTgXzHFhg8De0Dn7kCa8xs4fkTZaOy6EiCEdLW9ui8crsUb4x
         SKVIn+2kP5lTy0M3sEBQYtThwxaLQq2uSmpGZTCFkwAVUz8kzbGi+S1k8MyHs/cStW72
         MbOKm/g6W526/SjnvV4jcjcHb8AhRaOeJUK2aQR8CNwoukr3JfjNS78d3L1UPeKjKqHJ
         /XL07ZLgAWek6CxYvTihgXvkLogxEps99Shi3gZ5Hj1g9tSyZbY51BULwr3e0II5Ged7
         pJi5roAaukmIBBWhwOKCfccIkHkojtUHIDWORyThsvhR+qCjI48b69sxeJHvdU4YsM8T
         20DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714745345; x=1715350145;
        h=content-transfer-encoding:subject:to:autocrypt:from:cc
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkWIN71zSmf0it0EZFexxf4IABTHGdztATZm8urk2wk=;
        b=jlQmwkNFjCUmgYzwXqCUsCvfz7R/4c3o9rVft7jqWLVvj8IR0qdo9B3H6oA0WhPw/f
         tTyLFJrW8jOPaqqac3rjx5Kjg4GJgxyY36wcCQwytGmw/4bvtYuCljb+1262OEoeCEGk
         ruqfSOgK+NCd06AM6CFFzJ7u1Bll9lWxFU/F9DF41qDxApscAySYOFVNfnlEj173V0eC
         BD0VYCDuo/Bcjly40SMchpeIPeCoYBv9Ozyi1J1Bfne4ewEdCpK31Jxxjiv6i1Pt6HmW
         GFFshMLZ1mFjdNnxe9zfMyggWHE+y4iVBbBOELCSOKfAqBCBxQjx4FMM77B23DHzhUeL
         1dYA==
X-Gm-Message-State: AOJu0YxrXZQv2RqbZXJ84H4uEc6rhgmaliUGBp09HeIoIfM+cP+HLSOa
	AAj5UWR6yChKFNTzqGAl4NZXsw3uAH4vtinLC2nx0SZPJeLRsYzp
X-Google-Smtp-Source: AGHT+IGBJq4K96uOKxfzlZaUJ20hUHgFmqFVuKO/0RuG3DJv4Y+LjKMAtbkGPMl6TaOSeK+DnAuvIw==
X-Received: by 2002:a50:8d5a:0:b0:56c:d35:1775 with SMTP id t26-20020a508d5a000000b0056c0d351775mr2216434edt.35.1714745344965;
        Fri, 03 May 2024 07:09:04 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6e4f:b700:d50:463f:cd1:7d5d? (dynamic-2a01-0c22-6e4f-b700-0d50-463f-0cd1-7d5d.c22.pool.telefonica.de. [2a01:c22:6e4f:b700:d50:463f:cd1:7d5d])
        by smtp.googlemail.com with ESMTPSA id e21-20020a056402149500b005705bb48307sm1719922edv.42.2024.05.03.07.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 07:09:04 -0700 (PDT)
Message-ID: <cb2e65f8-066a-41ea-ae3b-03950714f33c@gmail.com>
Date: Fri, 3 May 2024 16:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@the-dreams.de>, =?UTF-8?Q?Patrick_H=C3=B6hn?=
 <hoehnp@gmx.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH RFT] i2c: i801: Scan for Dell accelerometer i2c address
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

So far each new Dell device with an accelerometer requires a patch.
All devices, with one older system as an exception, use address 0x29.
So I think we can safely scan for the correct address, and avoid the
need for a patch per device.
Last but not least this allows to significantly simplify the code.

I don't have such a Dell system, therefore patch is compile-tested
only. If you have a Dell system with accelerometer, testing the patch
would be appreciated.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 53 ++++++-----------------------------
 1 file changed, 8 insertions(+), 45 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 5ff7ab08d..a8e3a21d9 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1217,57 +1217,20 @@ static bool is_dell_system_with_lis3lv02d(void)
 }
 
 /*
- * Accelerometer's I2C address is not specified in DMI nor ACPI,
- * so it is needed to define mapping table based on DMI product names.
+ * Accelerometer's I2C address is not specified in DMI nor ACPI.
+ * With one exception all systems use address 0x29.
  */
-static const struct {
-	const char *dmi_product_name;
-	unsigned short i2c_addr;
-} dell_lis3lv02d_devices[] = {
-	/*
-	 * Dell platform team told us that these Latitude devices have
-	 * ST microelectronics accelerometer at I2C address 0x29.
-	 */
-	{ "Latitude E5250",     0x29 },
-	{ "Latitude E5450",     0x29 },
-	{ "Latitude E5550",     0x29 },
-	{ "Latitude E6440",     0x29 },
-	{ "Latitude E6440 ATG", 0x29 },
-	{ "Latitude E6540",     0x29 },
-	/*
-	 * Additional individual entries were added after verification.
-	 */
-	{ "Latitude 5480",      0x29 },
-	{ "Precision 3540",     0x29 },
-	{ "Vostro V131",        0x1d },
-	{ "Vostro 5568",        0x29 },
-	{ "XPS 15 7590",        0x29 },
-};
+static const unsigned short dell_lis3lv02d_addr_list[] = { 0x29, 0x1d, I2C_CLIENT_END };
 
 static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 {
-	struct i2c_board_info info;
-	const char *dmi_product_name;
-	int i;
-
-	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
-	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
-		if (strcmp(dmi_product_name,
-			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
-			break;
-	}
+	struct i2c_board_info info = { .type = "lis3lv02d" };
+	struct i2c_client *cl;
 
-	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
+	cl = i2c_new_scanned_device(&priv->adapter, &info, dell_lis3lv02d_addr_list, NULL);
+	if (IS_ERR(cl))
 		dev_warn(&priv->pci_dev->dev,
-			 "Accelerometer lis3lv02d is present on SMBus but its"
-			 " address is unknown, skipping registration\n");
-		return;
-	}
-
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
-	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
-	i2c_new_client_device(&priv->adapter, &info);
+			 "Accelerometer is present, but couldn't be registered at any known address\n");
 }
 
 /* Register optional slaves */
-- 
2.45.0


