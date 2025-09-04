Return-Path: <linux-i2c+bounces-12628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E1B43E12
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38B103B31B3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845763074B1;
	Thu,  4 Sep 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRYGo4fi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3D305E1D;
	Thu,  4 Sep 2025 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994838; cv=none; b=Tx3W1qqlSuSHwDtaAFVJn8wb4GWI90sqsSjjSeVscOqlpkwWP/bKiVu+1KqH/On9J4KzVzYB9Dk5I9LyrXzrSWir5g6+1kjPX1EWM8qZH8XLm/mUZZIO7SZZnhSJVirNRBMvT142PAaVCDeTg9yV+NHjekQLR2nC1yMw7h7e50Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994838; c=relaxed/simple;
	bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hf9pcLI5W5Dg+FLqtBtp5M5yFXiqNSmStDkTbX5mxZLabw6O7jKiYLzx3O4eCN+53yz5u6fXM6BdOaFV/3m0BXkBOP/IwhG2+2YxrH8x8/q17OxEHM42mvZ/XgzlQgRQXW0VpR7Z/LLXq276AczuVXy8jT9x2vmDcwkrKBAUnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRYGo4fi; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-80b7a6b2b47so105864385a.0;
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994835; x=1757599635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=CRYGo4finZFCR5tZpZsZpOXdf4XGT0NBLuWEiSee5jbK9w3AuGdsC1lvBWpO+z84UY
         baXDOfBjFQZSqClmR9HcTb/vnLg6AfpDofchhjo1ppNKMuiHTWze+l3Xprv5yDw3l6Lt
         kM5gEAhEZnsdzOSIxVMy1I1S7PHf+pl3ORz4x2fB0Ju6mZemsA8i9c1l85ufz9qNd8/W
         vbGsBKNWRxMkSP0N3pHF4uDZ6sNo4kfV2EI8mYibP6mNyLoyjHvTxtexjX0gmElNv5/V
         Qiho2E3PzsyH6x56FpSx/XyrFNfGllc9Y3vC5prxZc+71CWzQgX45Zm6BmRgm41dSNDF
         OMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994835; x=1757599635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=CLvj8o6eEcubNmwnJ0oIb70aVWJUMeQPeLLAxlFEjIg1hcJsu28YvF4DWrVUWRK26m
         ADRm0p1QrqwExylXL5hdwyqf/LqZd8lwz6GDZtlyWVwgcMyPV14m3nur5uySGl3bCuVi
         VllY5/g7xdR8h0lF0pe2aeBuo/MrRb0NNxegg38lSHB2oOuFId+6UdqHSN8jMTyTp13M
         bf4RccTBzrzsizTmCOtOgc6hc3UFM3NT1CDOjEi8p2ZhLBugFlFGjEzBr68kNa9RNklI
         4HT4HiQuH72MKmJFvOVJTy71cwMMnrLVaWMI7bI8UUgxs/3syYsnk4D64bexUHUfd2UR
         l/gg==
X-Forwarded-Encrypted: i=1; AJvYcCUrvSRKXfSqXBdQQfQmcir/KnjElasm8r5PM2Gkm2r8TWn7RzOzA724L0temvQQBXIGtwNapLHNvKA0@vger.kernel.org, AJvYcCV3KSucbRc+fglMTYhsVb+39pWhMV/RV5tW5tfCOmzOaP5vuBbz+IzVcOkPTgkri+e7NCHu1cwxjBu9@vger.kernel.org, AJvYcCWFtkhqVl3g2nu11o3QW4BfLuDbDWAT0Keh/l23t978QW+49Oe6yVwuV/pqXwvlvR3kj19l8rCSqK8Rg89t@vger.kernel.org, AJvYcCXsyIxEK9Logi5l7A5RO+fhk5Y6unpARoeFF3GoRv0MN9R5GzXP/xXAzZMTltRufNLTUD43IQhZXCFq@vger.kernel.org
X-Gm-Message-State: AOJu0YwUevPlRpi2wILt0zWB+haZ82Pz6Q0VN5UaOX1aIXN2WB4A4vD1
	h1lQmnlb+L7F8isrM3JCt1f4epR33biwSvzJmUfGkGe0fNoPihxkHfk2
X-Gm-Gg: ASbGnctG2BdEq96WDIh91IcVPXZC5yiwiPJNxmM7Y37L6vFJ0HsoT/i7xKlokTQYmig
	PjwgtSR38DKVFS8zggpaDWAkeiATB96JHk1yBbfdP6Nk0wthwI1Gk2rlJIDwzDb78mg9P619SCj
	+qHMFD+mXdC566Lv/ObU3tfKczJqFWZ02CmYoXYdBcGVXAqpUwA29gDMVIprMdtdx/zJldlkMtg
	iRkK/lmU1CalhMYqzduvRFbdo3I6U+rL4B9/mCZcJJjqsOMeCM0b+Kmy+NApbfb+K0zKhF8OcI2
	didYVbD6t7O2galOT+h+YHZQCvgwm1DatbsRUNayWgnebpf7sIEwX2psF+tYCfH0aguWru5KWP4
	42phBN9AVysf2OPc+9MCaoaLowqC8D91ablrRhQM=
X-Google-Smtp-Source: AGHT+IHj35nSbwkhonpcsIE6LnuEcLEbvD6Lw/8IqKGueIuk/hqKTIJ8PXvUK8DGI6HGTm91Dro8QQ==
X-Received: by 2002:a05:620a:454b:b0:80a:fc34:564d with SMTP id af79cd13be357-80afc43a00fmr663708685a.6.1756994835256;
        Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:12 +0000
Subject: [PATCH v3 2/4] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-2-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
In-Reply-To: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=1022;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
 b=7guy/wYSjdLOmEb4qL76oQX2nEHkn1zfJulWnyHwyvGlhcf2LNzzk0/JqXTYbW0xuScmty1V0
 RuNXz3S20fRBrhSE0Brh1eYaONapvpw8QaRMo/OIfmiqJI+3ryo3vVy
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add samsung,exynos990-hsi2c dedicated compatible for
representing I2C of Exynos990 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d0067e7e7a73a58e8bcb4aac71e87dd8..6fc03281a8f8440ba64df569f6c83ba2d9f6915e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true

-- 
2.50.1


