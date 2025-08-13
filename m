Return-Path: <linux-i2c+bounces-12281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0FB25287
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA41E8847C4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BB129CB3A;
	Wed, 13 Aug 2025 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="YbS57CMR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B08529B8F0
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107279; cv=none; b=HMgsIUMDhNhuJCfD4kMkUAAumORAaoD0nLkQCWxAmTYQ1q+BUTzhfTAwWiT0QT9aurOGBhPAUlpthQuZKaTw28pJmQUoZfyajdj3JETP0lRV4iHa7CAoVgEtPqgOu6OEFUgzV2qPPM29pUDm6c7/YlsGE3RIlLZbDV3cHEpz3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107279; c=relaxed/simple;
	bh=QybKy29Ct2YiEDYuui7hJlz/0jLfGcDQxytYrS02m+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6HzJy+gqn2QYV1rbHWUqK9L1d4S8hrN0aog2ieqTzy/FydHFqZRxaufzGeG8huyv/AhE6HHtOBCRqjLI/w+BiJkrwz9deaXdC4EXczNd3tAX8kfDLvTZCdCb1ktqZFTNbROq3C3DnrcIemDP/XAJftw2JakM9jNRp1L4m8D0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=YbS57CMR; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e8706ac44eso8378885a.3
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107276; x=1755712076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aikCCzA4JV8uW58QUohJldBg0J+53SfENsyjedVm5m4=;
        b=YbS57CMR18b+LaQ/349rUeuLORIqWyYCBiNaUxmyPAe2kJmv74oEyzD7eUQ8gcpGlU
         nkKDAxdLMCURsZ2G10y4R2bSRHGUv1u+7j2x3bmKx13scTNjmEk9aH2KP8EL/UVOsPrF
         OMhUqGSpbctUVkMvHULzpLvLNnZZxw5KlSQTFga1y7V8d47iI+ZwjR2YoLqds5HBpv7/
         KH+9ggyq8YKwZn0yz8cH4yfSYw5KCLpQCiNdHkfnYVvxswBoXGKXkFDC3vb7/R1h6wct
         7nQJAi0Ll6O4pcBmcYv4oJbb7hn65hq2THBB0JUABzbX2XZ6bq0SsxoGGYsKJ2x6pTxe
         PKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107276; x=1755712076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aikCCzA4JV8uW58QUohJldBg0J+53SfENsyjedVm5m4=;
        b=R0pViilPO1Ckb7aeTxBIgEsS9kwCfn9ANkdP7Kg7DTXfzvpge8wxc1LFfHj8WPT6ZK
         xOZCKkJ1YJBOXJ+EaK2uqcitj8hOtU6RrDQmNNROG5WtTsW2sKpIkgWT/Jve+srJrQzy
         ls8AuBBP68okyFTdboNVyqB16PTlULtiYwE4mdILXqWsjpAs5QrB152SLv//DSxumy85
         pTuqtLs7p8hqdm7LpDzAJ5iwsPjsdXkKLs7rl5QAMmxeX/yetWViSqkPZ5yeS8kzCQMs
         fE+NtnifDxNVkJggEj+yrcGVJc+xcuiKAyKBCwX6yniQn5HGc6ZzAoTgCfeSo+G4vXt/
         bZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1174+oPHTwhabnAY17r+ZyAHyxF/7DSWvpIHhxUHVG4733cvRnF0/JBa8w7cgH5XOF8AcLtbuiqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9Ps2h+uQePYVq/Y5xAJCXTTRBFYbDOM4J/96C/NIKNJkDfcr
	WrnOuP9y4NCHKsr0bYzw/j9njapNqsdhRUwEz3ecYgumbxw9ydv1cqCdpat3eRKY/yg=
X-Gm-Gg: ASbGncuSnsE9uaiLArfGVmO3nbxtlEF8fPYw14MmNjsNNMmglECV/+FWOf9KRFsaMHK
	ydlUKQl3OGoOf3w/SEW8s2tIjRZp4dirzqkXGhnL4HQlCbU3qG8MKdNszRrcYm62IZfcRgj20QH
	gd9tRIalISOUR1rH9OcPbiFIwk9tKb7yj6ONZnxBH3flLeZXbkyqstaC1DGa9BflnJQedBRgmZI
	oEvfcn2twuLjl8ICFQ8W0zjbXBiCJHkC9SNxHYWiH/kM8tn2CTJ+dkyNDgJyy5bzuSp+8Ltjtmp
	Jdp4PSQvnBVnesvYGBr2fZ4IaZfHCugZ70toz7YLcyxFDKB3MZNXmaoim/muog56T6O4tvl3g3I
	mO0+Q1UyFDkBuxlGVHqz0i/AuPmRZl9GDrtd4HkqpzKIflODtO7Qb
X-Google-Smtp-Source: AGHT+IEg3SSFyFBuMzj7VtB0BXbM4b6FpFJkYNn6QJWw/Ig9p6dazfZbmEC4UpkoJX3lIwDtCnuVhw==
X-Received: by 2002:a05:620a:201d:b0:7e8:6a84:e82e with SMTP id af79cd13be357-7e8705753c2mr21068085a.32.1755107276240;
        Wed, 13 Aug 2025 10:47:56 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:55 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 6/9] spi: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:42 +0200
Message-ID: <20250813174720.540015-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the Atmel SPI, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 891729c9c564..320b23e92cbd 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -154,7 +154,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	help
 	  This selects a driver for the Atmel SPI Controller, present on
-- 
2.50.1


