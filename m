Return-Path: <linux-i2c+bounces-9366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF8A31AC4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 01:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6111888D5C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 00:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA56735956;
	Wed, 12 Feb 2025 00:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2scBwfn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94D2C187;
	Wed, 12 Feb 2025 00:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321339; cv=none; b=KhKO3Sri5i/thyUlvFytgms96H/7hoibJqh6EHGQzdoI3HXYA0bUibHlC3yLwHfod3eUIHjHjWDw9tai++mEpQOyupKSvY603AzO62pOVfuSnv/Ip5w0dIPAzXHiyfPHOLrCOLsmvrFcURyfCxB1U94+gs5aMoqCH+DJBJqXVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321339; c=relaxed/simple;
	bh=FYcCyiq0VGmChKGKi5dUBIjif4f1EpVl1ijGUj+lGec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fd+C1hkWuclkVSMmwk2YmrIZFECx7HzuQDeKZPdqc98sRRcb95QehEND/Sj+CwqC8ofPQVREC5pGZpwZ3j1y8eeeUuYBPI1N9wCaL63Bdb1gjnzZDaSaiK63Jvk6RQRBBVWbUc+3THRy/Lw0IK24gevRGZVMuKpnL4jfRt5rcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2scBwfn; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbe0d2189aso522281137.2;
        Tue, 11 Feb 2025 16:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321337; x=1739926137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnO9e/u0soM6zfm7iXTquiJqIoHFdkct1rIsAUq8Ilw=;
        b=R2scBwfnah5EZIgzDiBLMF85BBCFGqyzVk6whvxKlk+AMkg4ovV4DyfbJsoQIH7JBq
         kZnNEPvZ5Ez2fD4gWiiMqf/Ygy9NJoeCBmBHg1h+kqRo7cfUstPZRmVSfq0N+pxBF1kX
         lup5Su3KjOetnx2X/578govWomJc/QmW0MaKldAU/9kyCGUoglEFna5gr/QImLmUdQi5
         +P62HK2eInE/R62tNgxDkjw0aK17VZzU2YPfiruJDZJQHLwpHl1f4Ua9d8r2Wz5HcAPv
         5Kf7gto9+QIZIvHWBBFEdGzlpzapeDDheofDSgmoykORSoU0zZAH7LpTkNnaFQuoPs8g
         CXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321337; x=1739926137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnO9e/u0soM6zfm7iXTquiJqIoHFdkct1rIsAUq8Ilw=;
        b=lnXpsb/Niu6ugf7e2hKmviYVSVqlsY7euJn/JiU4n8UZNnpOwVoy69PawSB48UzpMi
         Iyx6dTrLMpu5+lBwLb94vn1DyiE+cmhiKcmBd2nZTQzLpoBGmG6r9VUIx0oprppCeozO
         Jk1TozhPKIEkDrl2HgtflkusClPeeWX710DZJ0H7CEjv2Gjb2LI+jrW9Mg1NHyTNSKJ2
         uMYAiz+LIZPuGastkICGlmru8GwI5k8q67kClWRfuntkB3VBn6D+6iu0fpYRxMGBH4SG
         LkhyAPHd1KwNujZmCiMsYHDcHnEFYrZb7bARlpvgfTcGdyfs/PzS0ItQNZVg+IRG45Zt
         4NdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0PX13KkauAKmR1pmPCOO6nc/Qg60VZAYI6pMktDFiRGzDjfACHlR0Yy4C/ITRL53yGRmp/K0cRPNz@vger.kernel.org, AJvYcCX78xc1e2tibYoGxsqHir1Am4rGiuySzz4gZR/aqD6W9lm9yYHNl2ZRKKavc1GtElbpVGNd7tXXYYzlOgqOoAcJfKo=@vger.kernel.org, AJvYcCXF0NPxKDR7NGzksLFdxLs65tXC81BLDF9b4brroppuQVOPVBey3NcuAfbhwFyWHFGlT05j0qYc5G77@vger.kernel.org, AJvYcCXJE3YwqC6qqNPCEarOR1HmWomBIozhhpRe2nEk8klWo4Y+2DIDolPDTydr21iKQHvCF1LR4Uiv9S5c@vger.kernel.org, AJvYcCXWCTzk0F9MKy29b6//1ivgINZkHLb5QxXMw11PZFWJo9TuLw18JHXS6pOywQb1IN14ConE72Si5mwbzpj1@vger.kernel.org
X-Gm-Message-State: AOJu0YwOE28i7vFmJBRDTWGm7/LtW4zub6rWre31ObL399tLiCsojz/i
	t93xj+QcRjJxWkOjBtr8H1Bm9kZUsg1TD2JI5WtOFJHA12kzm3AkRW45pu/1Drc=
X-Gm-Gg: ASbGncuN4nOr7Kj2jXJA+1NZUO4aoIYUMCUspfaM6XhfTe9uuCTSDSqdiQMo6UefOnm
	hsQQmMv9UApCohV4w+Xb1x3hTCrYBy+7WAUeeQihvqqGslXobGSNsc759MdoCxMiEuGN4LvlCpq
	Jz8KToDgnc1mmFocv93xTH7enWElHQoWEy4SkEncrI/eEK7IofdGlffWJi9QJPLS2eWhh2/Jlx5
	R8zFuuVhZfZ4Z1BgKfqE/b/KF9+8swNf5UU1lWISRCXoAO279xurKndCd6vDQ2iinccRSAT8Wqa
	45YenR3svwgHSyRwtCfuW5r1bgCar53LMeoDbNSRPz4L5W+LfEXk58/TeagyIw0ii2WdvHvYTIi
	WRA==
X-Google-Smtp-Source: AGHT+IFrSRvTw7mvQhgJfawsqBloDC+lGaYWgkWYTPrS+C60KihHhrrLCY+PMmPP9OPsJfxtuui3Vw==
X-Received: by 2002:a05:6102:3751:b0:4bb:e14a:944b with SMTP id ada2fe7eead31-4bbf22dbd9cmr1369181137.20.1739321336924;
        Tue, 11 Feb 2025 16:48:56 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:48:56 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
Date: Wed, 12 Feb 2025 00:48:22 +0000
Message-Id: <20250212004824.1011-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos990-hsi2c dedicated compatible
for representing I2C of Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 70cc2ee9e..b05d1e9e2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.48.1


