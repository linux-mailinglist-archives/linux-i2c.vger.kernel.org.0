Return-Path: <linux-i2c+bounces-12729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC1B48059
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 584E37ABCCB
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904EC29E0FD;
	Sun,  7 Sep 2025 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCpMxvA5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7B29ACD1;
	Sun,  7 Sep 2025 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280858; cv=none; b=H++QEjJqDuOgSGTKJJE53JU4953FC7q3ZOcirqUxhoHNE1o4n1nHEuYyORjzZN75NsGDdtwvkFDqGK3C3QNekp1VrkuGcAqviFJ1wkASMWjw7tgJvYdr8gG8uL4PcvGdUrsHd64FVAZGbNpk6x+hrTlpTzqLO0JmeSiBqFENGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280858; c=relaxed/simple;
	bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/cggnL2HS2X/gTsDIGusXx9ZR/o5QEPzDisvzkDNPu4HLIBPSEJN1RmKeZvheW18xt8D/EaVbpxXM+YejYQBmh3fe4sU71xGAsDh+eKmevgEnn6e6ottx2ocwvbOyryteODNJYcMwZW/vFoTx2HhXBLvScqqEOOLHoiBptBX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCpMxvA5; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-721504645aaso29041256d6.2;
        Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280853; x=1757885653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=MCpMxvA50NMjA6g8351aik463ghl5+8c29pnRy9+UoUajxzDvt8xbda2bjmS0eqKy4
         oEz30SeSkMCjmCWira9TSE4G+PWNfG2YwZh/NwLl2cZ8QEOZ41A2m7o8PdhjFK50m7om
         s4M4lpwsKxbIqsqOGUsJkW50PLUH6TruyAzHV28i+M+TW13L9+iBd83HUo7ZdBJu2RSs
         iASmMmagzpFawQGq0Q4X88ccWZdi4A3HozJXIkCaWETQ/qMLZeb/0CLgYbn+h2utJl4l
         lS/0GUrEbfwgBMy1Ee+/VKM22jNz14NL8G/zoWaf9P/PS8fJAa6eyDQs+0lahJMQT4P1
         QgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280853; x=1757885653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=vZeqjZJTkiRmEVt8Rt/PywMrSwyLd0Snv1EHvJDLyQPiWKwyVEe07Oy314AiU8IFf2
         mQ5hNvmaxlkVG8ftzYQRxEWRkS4+NATnF66xqqJbLRNeAVMhtZgEQBis/DN4g1d7VP1s
         EqOKI5r1OVaVvEfrx4ZCwsNbnj4f4jeGArhesrVbK872Mku3s2XGISvml4qxK0m+O72P
         Rkxzx0u0g1yI88bk999GyKzBRHBxjoWR5T6Soi0qmDZGm12kGKcNT5yeXLbreRImBR8K
         Nvq2d/P9e31M3n9bUd41Wl3X0PcFs0nrGlSPnVQAcPmYk3GzS8zd0W8M/QvwEe0MC4O5
         E4GA==
X-Forwarded-Encrypted: i=1; AJvYcCUH7reNaKLnH4CnL32kKrI+n8KWOFQD3RhvQd/9KlKLMu2zunKHg7hU/MlJnrrgCSmoZ/kFQGE5eg8=@vger.kernel.org, AJvYcCV9th0EGRyKeLEdhg3b1VfQBkhLdd9CgyFLdemJLrRdM0XzcvQyR/T1Lgs8Ca0xVUkVFRYwY/rDrnUcQC8cGUAtEH8=@vger.kernel.org, AJvYcCXMgDida524Gculups8k00cgecCKrG2lNBThnGPl6t4hgsERArLXnsX4QQ/uRAQkfErrmr/O6Ixyo1a01me@vger.kernel.org, AJvYcCXQsz984YLiIRuFC5JOjYgaIvjVZ3jKEVYRNWpY3H1nV1f5HH/GjDVM9LEk7yJo3gV6tUu8IeAO+WCgzlCp@vger.kernel.org
X-Gm-Message-State: AOJu0YxRIfje8gK+/FCXlXQU9w0O5yMZhgU8jQGiLHffhIiklzq+SwSQ
	v3WqhoxVD6mrYwtDHbiQ89FBfR7Z+Bfrs1MhRyu6fG/2KlmxT+kDmIZH6C5U6wrU
X-Gm-Gg: ASbGncsPrtBiv/UVHgISGNeJsH17BX/fUGp4cuyJt362MbX2gNv5/E8v3qFVm4MRLZn
	SjwB3M3ojLgyQC2DEZ9zw4dl5mPFePw34Qu+EBiwhkSeQbC4BUPhU6xSkvoPePd2YOzg5FDBPta
	aQ23C5Quuf5RwaaXh8Ad/tJ+lM168Sij8OFri38A6pytbi7yiFGUZtwsCuU0rqlvjFUltg3NDXa
	mbkyatfUxag9E5DjbYp5LcvlnBz1wpOkRB409m45+Tsqi4EblxZydNVHghsxXrKhAlHpGfw9mq/
	6+lF+U2TepKzUEmVZ5Vxm7YpKDt3FywTprZpzH4/n+Pjm2bT2+tpU00uKbLLOHaJ9vn/2lfG9ji
	u4hUYZDkgfiBfxpLs4vkDOAull1yjMZ/aF58plfU3Jw==
X-Google-Smtp-Source: AGHT+IHvQSkv5UMBAORhjrysclu9NOkPSRFN9PIE3JvrLhNkL/nfXO7mCnSw8Az3mTsHJvVnnGZyKg==
X-Received: by 2002:a05:6214:2386:b0:71b:6414:fd06 with SMTP id 6a1803df08f44-739256bd5bdmr66881696d6.27.1757280853407;
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:33:59 +0000
Subject: [PATCH 3/8] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-3-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=951;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
 b=DxHmMNHSx9WiukarP0O/RBSvX/Q0s2sHRbFhrNVtKsNp/eXZ7T8uQY4OesFXy5tww4GWgY7OM
 zk+/zTkxd8rAGcpJHYEYl9aWg7092Wipie9OcN9ca+uy4F1u0T8sp36
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-usi compatible string to the
Universal Serial Interface (USI) bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index c694926e56ef991965153b94d704fd53addb5cbe..4a719cea81f9d3c3b5296ba2d45b05dd014a1d9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -39,6 +39,7 @@ properties:
               - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
+              - samsung,exynos990-usi
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi

-- 
2.50.1


