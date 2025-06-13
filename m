Return-Path: <linux-i2c+bounces-11423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88073AD8AF9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356C43BD6C2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08C2E762E;
	Fri, 13 Jun 2025 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="YNHl7knK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8162E6D01
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814938; cv=none; b=h/bDRid+8EI14+FAfFfNSzZewewZTrcboACNKJ0WRNKzT0n34v7JftT5eEjXRxi96dKsazoKCg/BPSi1EdMCKVgk65AGjkK3J5fErj/MJzgHZy7o1sEYdzKvFLU8K57YqAQ2FGmRtn8jLtY4V+Y8s9KmjZyaTnBjrF1iN66/VbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814938; c=relaxed/simple;
	bh=9oxZLiMqxg04N22sji4gyuqoa02gKr5691CGYVnCg7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mb32C0NyuhD0GX2JqofT65gpvlUDw7Z85kf/AR+J4rz2J/eDwoTznoi5VKZFkDq/bCFIARsL9U4b8Y1H43eyfJh/eOgjBIyw/8aseSzo+2OSAcNcOSh5MYuNrftetLo0oPCDWY6+lxD8m36FjZWwxY6T37yIGUkxxLVAQJxQt8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=YNHl7knK; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fb01566184so17750936d6.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814935; x=1750419735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FOxOys3zo2Dw07T/mQvOuXgGCEKYh0s2Uiw4mKVmQs=;
        b=YNHl7knKNDVKvypJcJhcGlGu8DrU5PyO+LN2J08UyFVzU+7XAZzimNTzhNeyR93302
         XJ2LMdkOO9R9gmdzW4xyjI6FTXvDlg8705pU5im7roRIDXChZYjgtdxTkBuIUAGCYyHF
         ZbIdAVJvz9EM2HpsG6FFia8QAVyoGD2TVmrlHDAjvnyST/jNSkF5eNqv8V491uqwnZyo
         Y0TN4hgljgTL6kYYObEddKdoAV8ixSTl1imVfV3yCIhUrsVizO3P0xsW5HEwWlWJh2GF
         o7ohjQ470K0gVZ/EUPROnnF9f9fdL+9J34FgR6gZ43GJt2vvpweBo1JzK0ocdiitTB06
         sNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814935; x=1750419735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FOxOys3zo2Dw07T/mQvOuXgGCEKYh0s2Uiw4mKVmQs=;
        b=RqdiLuEyPJsIOz9nX2V5b6eRp2j39Em9nGJyx9qLll0WPp8iBJzVyNQmRUuSVn7L4e
         BGnYMXcC/CIi8B0nEKxQSWD3AK5XJ6O1KyJn/9IlrkkYg51xosKXV483etXYQrelKGUl
         78l23ZwHKhgXWhsnF5bFFV9PqQNXrlVinUeL+D1EucWGXJzTWnrdWhY55ojMzJdFkmud
         6vZya7aX0ImKYTTk+u4lep75K4mvrzWHv8ctwgZIcXwLw+8X8cGLLs9e61Px0ihZciOq
         l5LzjIa5hjMFk0DHWLN/sdnKt0206XOWSILp5nPo22lqa+CZ4DlNblTcK7T5T2YJmvM0
         a03w==
X-Forwarded-Encrypted: i=1; AJvYcCU4Hq1q8wdi6NrozmdDR10HbZKGPhnhmYLxIjRnue4PCMsndGwjuPnB12zjop4PBtXRChcW+meCY70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzObn5cHhN2BUhQIw2OZxEI2cpA89FdAMoXjalxFwm/Wpd4iQl6
	RDOcHcjZbkGh3OnNRYRHFffvlqEbvxfxmQ8JACn6I3RZgHYZLE34XF0gdzz2kXIuCb4=
X-Gm-Gg: ASbGnctOS2/s/npsVBUARLQIXdlmsZTQlUhpnX5U+BxsZUQslvpi9kiJ5b9zzFcXs1F
	OlPzWjVW2VBIa0fvy2z1IHor0TkwZVVMEPJg44xgzB7qNk50YL4W0hprB68A54zc8E6vjxpAg4c
	JABxKNNy4CsOH0MACaxO6Pot0h2+102fectn7psTdEgTEQQIU3O7+cUnB4Hv/yLMlm9SN1wsoEq
	X1i86m3rkscc+QWKDuToVtXEhskIucyLRFgzE1nleXeL5e5dQT8QQR1eLV8m8VbR9d2aX6aFuEV
	AdMMK0ZqRZr/i9OhC6u9IrbZ3gMgvXV3B9tex3mBwKV3Hf9Xs+I7LeRsBoHIUFKXBiMg85A2hk+
	KEjWO5NpvdkB4XgbM9iddYQ==
X-Google-Smtp-Source: AGHT+IHILIH9TTHUNXKE2SXsO/39QmE4PBt4ZlHa7MSBEM/sfhXbd9DkCQeEuqozVECdWauUoscyHw==
X-Received: by 2002:a05:6214:29c1:b0:6fa:f94e:6e79 with SMTP id 6a1803df08f44-6fb3e59a197mr39514346d6.9.1749814935402;
        Fri, 13 Jun 2025 04:42:15 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:14 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 6/6] crypto: atmel-aes: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:41 +0200
Message-ID: <20250613114148.1943267-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the same crypto engine, make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 9f8a3a5bed7e..b82881e345b3 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -426,7 +426,7 @@ config CRYPTO_DEV_ATMEL_AUTHENC
 
 config CRYPTO_DEV_ATMEL_AES
 	tristate "Support for Atmel AES hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-- 
2.49.0


