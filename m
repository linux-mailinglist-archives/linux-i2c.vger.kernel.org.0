Return-Path: <linux-i2c+bounces-12519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87762B3CA3F
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 12:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5A921BA1189
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 10:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C432A27A446;
	Sat, 30 Aug 2025 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRIg47MI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB7277CB3
	for <linux-i2c@vger.kernel.org>; Sat, 30 Aug 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756550172; cv=none; b=NpgmjbMjxpCqs5eh0wJeFbe/jhWkKSawHKpkvcHKokyPAbxZvJcH8yG3btPKRhEpv6HJ5O8SVj3dH0QJJAIEoMfGO7ROqPQvyikE1211PSnQQPud4clqeUG0IMmOjCT3m990Fga088bxgsE7QliKdzDqTt+sRAGcGLIMjfNdtaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756550172; c=relaxed/simple;
	bh=OqkXFaVqOLu0Cm9orjJGa0kO4kQoIt5LQSmBFk9V1j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDr6u75n1GMgFKPODOdUTj3uWcjQlZkdZyN9vMcJTsiSB00UHqLEfEYnbPBHwZtYk6/8YCIcvsjbFRrzBnNUcB6323UTpXj7Y4AwRI6ynYW/fgVr3JBHoXsriGm4Jt7XJzSPyvagIYg2Ktbv9N4EQY19j6LS1CYxFITrJUrPr3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRIg47MI; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso37742066b.3
        for <linux-i2c@vger.kernel.org>; Sat, 30 Aug 2025 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756550168; x=1757154968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy2PldNrENiSaVtPT3x+tCYdtLAjiL+P5W5nR+7AJsQ=;
        b=BRIg47MITHOwGmcVnouy9G2W1oJcEfqswOh3wzGqc9NQbvKTk3qaYhJ8cCj6xYrktH
         KriOE1EoJB6OYvfIRzgjjQMBeJD1glLuKBO2ebaLdIiERLlICmmrThOJI2k/R/MsCX+y
         U/OMMSnqKDGIJdq/Pm9k1GrRwZYWzYDJeOzL2B01E6hkt79X4KTXp076kq7/cqgWbmZC
         xyxIf5SRaEWDu4lOG6Y0lkZiBAvPxmwu4BbZ5QxfdrH8+sFC27eMLlZ0rfBHsBOZZqfC
         ZrKcKr83Px36FIBrRK7DeVVqMduEnd+2CPcESGKWjD7fcPDtRrYVQ6oWcjg6koKHHHCw
         Q1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756550168; x=1757154968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy2PldNrENiSaVtPT3x+tCYdtLAjiL+P5W5nR+7AJsQ=;
        b=QQlvepBwxMdnem38SJ0aRif58lMhBeAteRKBIEQssSK/zFQyOJld0Vtsyft0yVATe5
         s72l6WMHrwyLCWyIrNShtcdnCwhKN2FEfW4cdLaAZPocyNi0HYSLtGDkxuFpEULqacfJ
         6d2xAV3HxJJLZabwd+fmD6B/qkIYIY4fBQDrphfgO0WeiJaadhmWWaTHIX+z+8sraB4O
         pPkiXNB5PevQDMeCsQ4zEu7KAku0GfKBc4XkLvwgw5OH//Vvn76sjjGDar9+E6StMoEa
         +jkIaPEBozOxaZYQWwGApQe2m7K55S77XY9hdlf1/vNq9Hpe2pnWYJPNIR6+d3C4BEV+
         nuPw==
X-Forwarded-Encrypted: i=1; AJvYcCUDzfyfUlEADdpdgHyQpWLVhs8FXGGOFqC477VQBqUHlNMoVM8l4O2CqWiHZ/ysxmEYG66V62RaafM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0E+lguD8QRFVzSBRPaTwPCjpcRctc8mGnibjqpqPR0B0JLAa
	ox1WwgP0981/WeFZqDzRoc4vJv5j0aCO5HjCy71I+emm1Eo4P/fq5VVPk3pKYIlrm4w=
X-Gm-Gg: ASbGncsdA7QXhOAHMvc6CvViwWxuJmCUkALO9qy2nagYfG9sBrBEDAU/LcTlTQiRkAd
	o43Hnk2SSxWNW6k3zvr35QPXUgaFJKR62NebaavrOGyl3CBPKpbORQD669aDrNNE0Jxgi76LaQN
	X2vyKuwywALvi0Udrxv3wHT7pOW4e0aAFJQhGo+GM/h6Bt4grn7eF1wdQ0PIIx3HcHqiyTlp9PI
	v5Cy3laJNdI8G4VV27ZABfwAr9nqMdTCjKSWDOoa+nYpCTGemPuHqnrHDKz5tKflfIqUd2+BHkh
	r0AVkOP1b5NVa2CORCiyf8gyxP2TApS22SeRGbQym8Yi+mmhkoAuUcXdP2I+GQVPa2x5M3WBTJA
	gix6ywb1+TePuaKLgS+YOGD0TcizUtugcjQ==
X-Google-Smtp-Source: AGHT+IHns48R/scKvtWP4TWucE7E7d46yoyfHop4qHeB2gkDdo7J3ardp9aE3MsDoUiXrG5oxykknA==
X-Received: by 2002:a17:907:94ca:b0:af9:6580:c34f with SMTP id a640c23a62f3a-aff0f132f63mr196770666b.9.1756550167604;
        Sat, 30 Aug 2025 03:36:07 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm393749166b.69.2025.08.30.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:36:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410
Date: Sat, 30 Aug 2025 12:36:03 +0200
Message-ID: <20250830103601.82046-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OqkXFaVqOLu0Cm9orjJGa0kO4kQoIt5LQSmBFk9V1j8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostQS1uyd9N0GDHCqVVSX6oqHmmLX/xx4H0z2u
 /GjYzXDLzSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLUEgAKCRDBN2bmhouD
 16V/D/sExMdSumruUenHBTZ2LC2Ld6Eo687uWRhy8+EsSXGEw+Dh63Bx4DG07nh1xePobQdweO9
 pv8xLTdgMUOyZPgqm9P9Xeme2Ys6Th0tgbwLHebSTreUKfTNYkfUtP9590Ze/KKhgg41m0XOkUm
 KLZeP0Whkbckym3b3kPdGRneHwICnfX9x1p0Jwkd023pm80H6+ayu0QojNI9fjndMe02bngi+C1
 ugDXAUHrayw5+1X5jxZp5wWCwgIyV2Hm8OpZoI3P2zGKB8UFmoGe0uZ7VeR/BWkk5fx1/vF4HjO
 eOLallZ/wPrlhvb8hd7uAY3gyVQ2Br2vxDmE6CVCOoZbm6jNG+/FCLN5qWZ1TXMbmwUDC5KTQZ1
 aIfINltTdbou4e3SGKTg00OTDTVAMyRpfwgQV95O7xd4s3t8SghtJAbBRu1A1EdFtEnnEgH3U8x
 /5Ozor31W3+P7vYF9lkWSb/j3Y0VcmeDFsT6/MoH2drVnpMLPqiR42HG+ca4GfVZBlNr+eo0AbH
 idjDWTsJf1ZL5+KKsPQgd6LOSCf8GJ0Wi2Wpl9brqQ9Irhmerp7ec0YTyiVdeidrZQjPViUaWN1
 HhAlj7rAacD7aqgr+pxqQPLSdrYm1kwjXXAkqlGL6n86sww9YULj2uQXqUg4QjQKd31jyxuSINx +JucnGYbFIy5ZEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C2410 SoC was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index 6ba7d793504c..a2ddc6803617 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -13,7 +13,6 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - samsung,s3c2410-i2c
           - samsung,s3c2440-i2c
             # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
           - samsung,s3c2440-hdmiphy-i2c
@@ -93,7 +92,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,s3c2410-i2c
               - samsung,s3c2440-i2c
               - samsung,s3c2440-hdmiphy-i2c
     then:
-- 
2.48.1


