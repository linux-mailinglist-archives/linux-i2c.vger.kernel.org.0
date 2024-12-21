Return-Path: <linux-i2c+bounces-8683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1379FA150
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 16:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7BC01888D71
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 15:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212C61FC7D8;
	Sat, 21 Dec 2024 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIjeHJ10"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354F1FA8CA;
	Sat, 21 Dec 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734794408; cv=none; b=Z02e7dONFUaCmMf9Z672PWk5k/d+lRdY21+diPM8w5gN/o3lYZvmAVKuY2JsDMNeT2k7BPPFO4PzvgyfUl7JiilKZPVYQvym4RnGMGruACvd4IsPqJTOe4vaYbip7czbcouQmmIhxE5dOfqlbyWQtuGTqjYoWs384CqwY4gyJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734794408; c=relaxed/simple;
	bh=lz8soa2X52/Ceg+m0bgpHhYnux0n73yo4sFGO3Otuac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cX+hV8NJjV18YwyPEFcQhm8V1EpHfnuwpLCDnwjsiPQfp7ODdbPSUksxYirZcUeVVWWTAgMNtcOCKgS0FVD7fGa8TrJDGiEA4t3qoExer56rGbvMGJEsHFfurMelYNCEDN7jrKCb0xWAvcUtJKzkSABsDXXmhxtKaBKlnwhJpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIjeHJ10; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso20955175e9.2;
        Sat, 21 Dec 2024 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794405; x=1735399205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYR35pN6B2ehQmZU1zbMbYa1s94KBf/W3qkLmq3E1Sk=;
        b=QIjeHJ10EaH9iEbU+mJbcPx05UDJhcxNLKJL52GsxSP+MSNEhzvYiLVsIGlYLsoMrK
         zYkb8sS33kUFORF+VFy56SsFfuLiiF/lCUV3uO9+7c4mfaAAJeEIUMEN9M0pOPS/9KFD
         0uSJM14ho3IANY3ASl5WRhx/ZYxzVfNNNHJaripgKHmAwG+iniwnee62/wKjqetSgf7v
         e4RrK8ahgtKpahtDLbxUk0RG35JOEwiQSvJOyHn8/O2MvIe5/Dfw8xnhFkK2bLcGYIVk
         lfpNsEHeIk8fCjIH3ruNC5fKR9MdN+g1cU3vkMUPcCrX8JBzEuwn/PMlywhYvbOC+6lx
         tBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794405; x=1735399205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYR35pN6B2ehQmZU1zbMbYa1s94KBf/W3qkLmq3E1Sk=;
        b=qU8Hl+FCJu/+zh8UaPwARiTajeABq8m2nhIbBwXbmBYzyjA7+TrDpVlAn4Jk+vG+7W
         fhdG71h0Xt7E/YkuDjpijk6MorOey8wrKr7Ah8PPBDkLg3yBSy767kiCob7G+86sFWsa
         UwzIMYJsqZsrRjyTI4qk69XOxr8it2W3psqDT9svIg2pdtUkDqI9EoMEfoqR2FoXCWJz
         kv59TlEg7z7EWcHWETJEQ+ilbqGBMUDsgNXdpJqyZ2XnELQ8aQaJcvt/uSL3degeu1n7
         lmzNgWGa1DDsRF6Yg6b2YTmcHh9LUZQpIWl2LUMhSV6s7Acx0R5+m60dgoPnsWj10wnX
         BPLw==
X-Forwarded-Encrypted: i=1; AJvYcCVCA5yWmy43SIC/EwiymN2WpbQQ4IoR4IeESFTx9woP/Abca8ZSEfG/N0ZXCDS7QodbtbDCp/mmuPPf@vger.kernel.org, AJvYcCWIdn9/DMF/Cmy4wAh6hboLfA+WhHzyVP5BpJ1UJc9m26XzFklrUgyGC2mFN3FkouCZgTn8/cOPaCk18+bJJDWDNcQ=@vger.kernel.org, AJvYcCXUrzbSsH4QWQjHj+Q41KUh96e0MO0CRVj1t5q0g4c+mBCYYqeVwBmI1oM6+s8v9mXK1s3HG6tiTBFgEWI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3cmUK75j5oJBOYRiNMQH4yAjpsM6iRrZwH0eKe5cC4Sxtj74n
	mpdFIoHjVAbL43WeauSPdVz4cidrS2i2xTYK4AJfEjhHEu6Bb/2U
X-Gm-Gg: ASbGnctiC0ajv5QU4UvLHw71PZrmWkJXXh/rOW8pj6suGp9ZwWf41vLeh9fL+A7JZbx
	AdpM59hTGsWCL+MGmgwtaQyVJYHXWZ6rNlMX4QlfnYpKwAfvbjNHTSfuWPwlMg8DksSbZ8MciNi
	VmZiD0WThRyOLCt4C8SJ3BKYYcdQ1nvb0C6wtlDpnLgbsOZHOdQkzdKlFZ65kYNKxg7QK86Q200
	uTipDOlBrmq4WmAtIWgmzj0ZIxoS5jYIBXE0Ky5HobR5v+plOYAcAT9L1mIdtxv/AihMzWOH6//
	biqWo1uOQB9gyCyCoV2B5CpROYFgZwHb
X-Google-Smtp-Source: AGHT+IGQ1CK7WMo0t9Nu9b4sWeyce9VPk/h2HJZhnP+Bz9hfqh4ZvhyagojUZyJ5UUpegOnoi9OgsA==
X-Received: by 2002:a05:600c:510f:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-43668b7a284mr63092815e9.31.1734794405388;
        Sat, 21 Dec 2024 07:20:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm6629046f8f.65.2024.12.21.07.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:20:04 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
Date: Sat, 21 Dec 2024 17:19:36 +0200
Message-ID: <20241221151937.1659139-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos8895-hsi2c dedicated compatible for representing
I2C of Exynos8895 SoC. I2C buses may be implemented both as a part
of USIv1 and separately.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index cc8bba553..70cc2ee9e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
+          - samsung,exynos8895-hsi2c
           - samsung,exynosautov9-hsi2c
       - items:
           - enum:
-- 
2.43.0


