Return-Path: <linux-i2c+bounces-7425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5E9A0529
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 11:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F513B2443B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 09:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83751205E06;
	Wed, 16 Oct 2024 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ojz6WkQ3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4697205E07
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070027; cv=none; b=KwPm/axsHabTlBIZiU4h1tHy5ldvbbMY1qERZ4Y9ELjXVQWTVbg5iz/UV9xgZb22rQ+KJmhdThzIPRSRRVg7xLMQcoaibXfxLqUWgLEefzfBNG+HlpQ3qDohf97tkkF2LdpWwKqfBkb3VQeumTxLw3FDHtGXgcVJsHEhV2j02Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070027; c=relaxed/simple;
	bh=KW1Nk6WykQWMWwSJRu7EyaYdoYq23z3V3mYZ6Y/dXcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SaR3g8A8//TCH5mHBRYEzgIEh1jboqPuARiSyAbSt2idBHkcJr2aZYuV/mBjTTLKdhh3V3sZ61wFA8IwPBcFMZRYbbhxNCxvYu2N+CeHDeyjpCIcqoKnrPoQhAf3HXyjmqqmxMIhWe9dNSycmscXVg6WLn8feN+2BYQXs7ESoSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ojz6WkQ3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99fa009adcso284180166b.0
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729070023; x=1729674823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/uSm37W2G79DyDBZDjJwRQAnwSufJjq2B/Phcz517I=;
        b=ojz6WkQ3Pi88QrUqaFlLWACrN+OCOfBpG5HeWZ633ENj/uSwo+3zhhdFZ8NO3LBJjv
         dBwdY45GcvoX318motz0jcfKA4BqNAtJ83iYUEbte3JriYNrNTM3B589KSa7ZB9WkKgu
         ICCCCd0my5cbbtvO0Dh/gS4qEddhQilWYqFL+/6Ag28j2gdHlchI+Alhb8IUVnN0rC9u
         em9xKdYUyoKIx6tCJrV4Vs6D3yQrn1rkQf1LZR96InhU2UD/hzOTJySikhGL2RErDQiy
         YUmOzBT2WczVpGgWscegv/Wlw3O7ci3lxh+jGzXMX81E3oZWdNLu1tAkqfvxcnI0izVc
         41OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070023; x=1729674823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/uSm37W2G79DyDBZDjJwRQAnwSufJjq2B/Phcz517I=;
        b=GhqNSQLOPyIa9OB24DY7V1bZ3TGHaAWB3V20OxMdLLq9Ah4kc8b/gnYKyCAF6w7zxy
         Sg6487Gav9UkMl2VUdtENKVHSBnM3Agsz/8rCKHAcp0P0Ps9lAsBh4Uw9hAKih/WQG+6
         luNPw2G8BE5UNZPPzDHCYlACaUq/yBYyLXwzzpviAedBJ4b3eIpq2KfB3ds2ZOgLQ8VL
         I6BG00Hjo5VVK0tmIbIKJo/xsv4onvDW/EGs+BQ3bZQjSz3xV0YDQ24N5ZnpL47qxMyA
         Vz0u5C2DyJfz5xcA50jCUIZUPB7DlR2hRCMNEotcFswyIP6aExNLICddyAdX/j++Izr1
         au5w==
X-Gm-Message-State: AOJu0Yz37yWmu+W13Vcu8lLKYue/BV1WOcnifLLrbyuL6pklGpJBnvXN
	p7WtKzYXy9oZx7mZxsTmZcB5pqtszvYlpqBbMMF7QemFXPDqk98B4BGuDO5UrP0CWx/Hdh0mKkE
	b
X-Google-Smtp-Source: AGHT+IHmybY5qnam/j3velzbFzy+uPDMc87y/RuRjLb3e+Bwf/Gzzvz4wbDQVET+Qn2ziKtnKXSHJA==
X-Received: by 2002:aa7:d3cd:0:b0:5c9:2b2f:fee0 with SMTP id 4fb4d7f45d1cf-5c95ac64190mr16604583a12.30.1729070022965;
        Wed, 16 Oct 2024 02:13:42 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d628csm1501815a12.19.2024.10.16.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:13:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: cgbc: Convert to use struct platform_driver::remove()
Date: Wed, 16 Oct 2024 11:13:21 +0200
Message-ID: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=KW1Nk6WykQWMWwSJRu7EyaYdoYq23z3V3mYZ6Y/dXcE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnD4O0lDkE9LURKgiEdXHaUobaD4Z0U2PN/RxmM UggerjK9rGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZw+DtAAKCRCPgPtYfRL+ TmWIB/4gnecOBCVsMcuUcQ4zuiUa+0PjwPlec7tEsutufqYZW2jQbTRBCjfL2EMVjPh9ZI2llQF 176vCi9Dw7x7WdGmV05u8jj7yceS2B713CRBDweVNP+tjAQ15b1hGeaQlfkTM6KZmxYU8fRfRs+ SKuF57Dxu7wHSl92+uzppbI4oHTaDx6cW6Zu0ZAicwluo677UtdVLj00TPhHbIxXE/yd1J9EhFj vRsL5cAVnuQjaCo5mDZJ7ltX2MWR9rqD7CqNQP3fFz82vGyh+jk5+/vPISz3UwEdjQnLEXlFPU9 p0ySP+f5ctUvg7TEsr5BX8l9fvInDgwrH+uTZY4fnJDfOzMV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove_new isn't supposed to be used any more. To be able
to eventually drop .remove_new, switch the driver to use .remove which
has the same functionality.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the driver was introduced in commit
6894f640b8f3f48700ccc828419ba60704f5a405 which happens after I sent the
patch that became e6be2197ec38 ("i2c: Switch back to struct
platform_driver::remove()") that converted all of drivers/i2c. So here
comes a separate patch for this driver.

Best regards
Uwe

 drivers/i2c/busses/i2c-cgbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index eba0b205de11..f054d167ac47 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -395,7 +395,7 @@ static struct platform_driver cgbc_i2c_driver = {
 		.name = "cgbc-i2c",
 	},
 	.probe		= cgbc_i2c_probe,
-	.remove_new	= cgbc_i2c_remove,
+	.remove		= cgbc_i2c_remove,
 };
 
 module_platform_driver(cgbc_i2c_driver);

base-commit: 6894f640b8f3f48700ccc828419ba60704f5a405
-- 
2.45.2


