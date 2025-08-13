Return-Path: <linux-i2c+bounces-12279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4CB2526B
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0251C80A35
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6814B29ACC8;
	Wed, 13 Aug 2025 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mNv1D5ob"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888529A9CB
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107271; cv=none; b=heJhQCjDH02GlAQr4Z08VVuGbl7DNIZenUmaF6xEvkhMW3aUPORhLySMIob08hbfpC00Mo+TJb8jg/HJo56FeVRPYacDzK4HKgtvbKQxEmtLAZr+quSibBzGaRpKskOHVwFGSs5LrIOQMCgkoZiJr1hYl9cbI5cabXFoe3uyg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107271; c=relaxed/simple;
	bh=NjkCLYlKNtoy8P9olWmXk+TqDYwsdfQMHQyLM1GRmZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJxiIWZdNJ06NEyZuK8nOLDoaqwJMPDmnQf4lIJH97Z1fYXH4M4nofe/gAMB4fsTYxyA1wZuawWC/F1v6JMWnxGV3mPg/yVchxl8e8H1WCcG3NUorpsSspVkioyhWHrmimPaYiDLuiGqhxxjLpwSimFDDH1Ti80Fd4oSDH2j9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mNv1D5ob; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e870608598so6409885a.2
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107268; x=1755712068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89Z3Tvde06t5dQQQh9zIDgC5mMNPPytOaR1RQ792KEo=;
        b=mNv1D5obEG4SaFdPd9z4BvIddwABLZHkEmCbZ4IN6bo+cbYp5uHVe4+c5aYjeiYYo3
         3ir1V3M2Thdw2yOXoiol56knnhK8z3sTnqI9mLJKKHHx888cQhFq8OkHEpTW9iR8f9VQ
         fOQ5fLu/XqduHBxrqruun3UUkmVzBbWdedZZLo50fI3XTChwNcKhrLgX8/cjez7aWpb8
         c8SYkLQ3Xl470U3DPQOizAxK/6JjixekndsdsUHLdfpJzvnVXjwEOLCkYjdBqby1764F
         x+qN8zNzF5GHdVmAJQySlXwjXMM9Qv+DlhN64VxJcqqZj0GMdGvHQFeGsZtIDfiGwuvU
         YPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107268; x=1755712068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89Z3Tvde06t5dQQQh9zIDgC5mMNPPytOaR1RQ792KEo=;
        b=mpMgkIHbFoOrmPCAQkQZvcxtdIxQaMna3jn8u8iy8oLE6BRAWdIuzDdeq6JjMz7BKq
         0OtQYIDg5SFnUQZFTCESzKwPNPQ6NEI3xddShxjiVdrJaDO/D13K92Yi1eCcpkApCGJK
         X10t+7n6e1x9XnWIKx4S6JyVH8LIn8xWxq3h3fOz4gOGErL5E+CfLfPgC0v3aypCpaDE
         MLL11LfT/ekW/nUii8W4tv/x+ggBe57TbpxUXefpkQb7Ebo4e3SV0Xi1q1b4fJPTFhQ4
         01JEwFD1vy+8R/G42uxaDcyHs8eS4zwAP+srkHGRa6GIE3jh36DESF93Ei93ykbkphG3
         MfMw==
X-Forwarded-Encrypted: i=1; AJvYcCVIij86zP/0VPBmwa3TDZHvPRDZ00mMn08mL4ybSfJiDftMvyIVvb3vml5OAO0Q/laV3SCF6Cu3k4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRV2hS0pD4dyn0b+nlV/yuooeAMTB3SOj0z7OuQUaZkFFUEUH6
	B6NVzbLL2NEeBsCXOXIXcmE4RgtNc7AUY2WBzBi4TYN3gFhTOh9zw7zJO2vN+AONOps=
X-Gm-Gg: ASbGncuafUA8A3KbhzzlVx+2YSAaz2jZdbcHnFwy8dO9Hj8qvk9cFESdkewQ0ccv7Hk
	i1Vl0AYcj2sX4KBhh8Pj0PvNKAyI9fdtqTGt7wtFep1zVciZZJ5vd61HdXJbGYrlLb95d+raYHu
	odlBBkALOOzbhpg+HW0GOfSk1MEP9YqBA5uFkd62ahZKoWyLjkbAy2meGv8GYonx8rcdL/RlTIG
	LQ8Jr3nXu14qpVICN4FkOtP2PaJVIsLDxhzpVtGtlfEdir0gqyUJztq/l+Ome9duYrXzpmML5yw
	B4vo4a+uwKs5Okl+WXrSeB9LNMUin1QZmK1xJ0XAnqqz4Yw/4BsDyEI8EdBiGiqT69B1KVfPtiy
	dz1Wz92CEXEUQ2b4IGEMFwjlRqH8w9qTztZtd2TJTcQ==
X-Google-Smtp-Source: AGHT+IGsrPLNHuA2IU7WyavWdRjRrE/0nv7LFlmwkMJjixgV0JmRbdVoxVuLJtki1CHgdv8HoJD2vg==
X-Received: by 2002:a05:620a:470e:b0:7e8:66b9:f337 with SMTP id af79cd13be357-7e87031d036mr36261785a.26.1755107268237;
        Wed, 13 Aug 2025 10:47:48 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:47 -0700 (PDT)
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
Subject: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:40 +0200
Message-ID: <20250813174720.540015-5-robert.marko@sartura.hr>
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

LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1..8f11b2df1470 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.50.1


