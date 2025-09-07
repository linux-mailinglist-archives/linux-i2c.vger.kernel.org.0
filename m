Return-Path: <linux-i2c+bounces-12726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E52ECB4804D
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4B31790D4
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9489027BF85;
	Sun,  7 Sep 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6cIxloB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE4B1B4247;
	Sun,  7 Sep 2025 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280855; cv=none; b=HRcjiU//rpZSoclZNlyOxlEXj0XrCTh/4MOvRvz7mp18wX/6ZHVNn9I13ekVo6Oos9DeQVvxHTinr3KtTJLWRRo7jJPeliPfxDKILn8zhAZQ9d/7yiSYfC5FJDUdzLF0SWEp/8xeLbSCsWSRtFl13KhWsZq0J37tL9rRRCaJt9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280855; c=relaxed/simple;
	bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WP//9Vw6Z8q7K3eGGarWlzusDitfoxE/cF10uk/vH86xU6HDpsiy5M+867gM23XNwIcTXVVOVFzAjN/R/g4f6kvbN8K4Jcs86KaFllbm3+JARlVKuy4kKtNSYpV94XAUAsVNu4A99M+yWVoqH6qGIF+fsGiBO1p7xA0NwCcDUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6cIxloB; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70df92872ceso33840436d6.1;
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280852; x=1757885652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=d6cIxloB9E0OnjmAHfQmxYGj6nmw+K/9cPpYdIQiqpXfbIv904EvNUTVmpcBaWy1FY
         /P4chMs3sYTkzaGcHjCwgMYBTTCRQ8P3wc+6qF7ZIxsTpSZtnVFxfewFdaHlSs5TkuZY
         AsRjYAnbfzHyp0mF1dv4tLPYBjMv3zgqqKEqImGnsLgF8pdcI5blU9ujnisdRljJw3we
         hHinT/w+lOAh9SnulzyeOpxuiOAa67W0ux0x23sj6aZMOPc9eG9meVdcFynLmVSwvcDs
         WQGamTcRsw4PSbyxTXCibM9HUj32GymMcn1kaLGTK3EqyQqMqBLMKoMFumMQtXdBtbgE
         JBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280852; x=1757885652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=CjpTb4SHXed1vzDTPpfZ/CnIZLWSbkrWOPNRq1JB4YD2qtU5sLuZQXT9/zWpJioHpd
         iOMO9PotZhhhVYzzxoFs4Hrgo1vhVdOFzK5kLKNGapzcaNbA3MqCDSrG6dUuCJf+Zoqe
         AM8X8MSjXwjjEJ6NxbgG+Vbk0QdSVHcSIqQsY91Tf2SiLgCw35bqowWqjYhpm3OtWJZI
         /DZTLLzZs97xiro4iEYBrsNKVdDGx/v15rYwc16xBpWK5twQSwkZG+sscSYfsxW4otYq
         jfj7YZJAjvt8C6Ajd443fvVSn3N2Ott/LuWx8Ff8MBObkrxHDrITla+ZnleEwz0ScJ+K
         3r8w==
X-Forwarded-Encrypted: i=1; AJvYcCU2wrotiAUhH6iDooo7octvILu02E5s7ujZgzm4nYCbOgfn/n1VIMbF/eeHxkE8qZ9RhO2HN4hpu10jZSxv@vger.kernel.org, AJvYcCUsGUVlTT1t0pXnbfcL0yHHdBleIXqAR6YcXN10BRhPRPOJJB5mabNd5bK25F5e30WYF0Z9K/qIAIQ=@vger.kernel.org, AJvYcCVK1JPd4PCvUu6RK8POP1PtyWCXTXgKvpfsoK7TKfCwdkKP2UULwlRDJZ26f2s6MVG+MUgrvdVnwqFKFDHQmsWz78s=@vger.kernel.org, AJvYcCW5NWNcAtqy+vdCNBZ/yYQ6+dyizKHjBTI+cHnKbvNz67+TQakQT+IIuPRRfWM0x7F4HdoYYVuVbKUB6IEA@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTJWm9KjqOnj7P+u7XTJbd7/wvQm3AhhDmy+Zxp8e9vYol66H
	mZ7o1F07ClHVYb2V6VLUkxBepRikbzuDa9igAvASoLfl8Cd7dgCvSSzbKRNSnM98
X-Gm-Gg: ASbGncuKHzgSWxft2/Q+RLQ+4MNVk3xv5zYFMqiIRoF03HWi4wSJ04AS2RkTZihGQm/
	EU7RzSxH7VlFCikM31jWFgpzZiNibz3pHqeHtFrE7vgo1LoaB0dG5oH+fPrFwdbqS9K+eAUFGxI
	kvAvo7wq9hk1dUFbsyYgazvCNPR2fmqdrAuFYSupD9vA1/DkwUINOJQCU3lDchXzvXrYdoi4xc2
	6xQ/8An6SKF1PQ2jfTt4OWtCyPamXRrXU2ihjxYefdyhYucKM9EUApV4fNHjsS+TEesCdGNIvO1
	g0Aap4YXuUfwU5JAk+VAqacf3bQw5tBqH2NDkX0W7UHHrrGFog/T+ydqzeyfP2qAg0L7cD4vHIJ
	OyvTLkls0DhcRZEGkfqgUsPavjL1wxzz9VTXlbHnk4A==
X-Google-Smtp-Source: AGHT+IGJCBXxD1HdhEmGookFJjyKI9GVEoos7/N1pVfmlWDpOtSFYVjLf6U70YbdyDJdC63cvg86rg==
X-Received: by 2002:a05:6214:2025:b0:70f:a558:2955 with SMTP id 6a1803df08f44-72bc355d107mr127401886d6.22.1757280851940;
        Sun, 07 Sep 2025 14:34:11 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:11 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:33:57 +0000
Subject: [PATCH 1/8] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-1-ae7600491a7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1475;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
 b=aYAN9dC13xRHVHd4UCSMofHM2Z2DK4PUqZAbeRIOmYa+wd5pFaMDUeBybDKdjH25UoFZkbKGf
 WT4DjP/7ZiUA46lqEX/742gxxEVwwZ/Ckuk9IyanEdloEJaUZGxulBc
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..173c51b17d9684113bb8254ee0c83e8e74de2fca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +95,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks

-- 
2.50.1


