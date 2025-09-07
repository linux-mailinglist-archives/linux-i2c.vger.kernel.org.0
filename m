Return-Path: <linux-i2c+bounces-12736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454DAB480CF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F9E178AAC
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740A329BDB6;
	Sun,  7 Sep 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQoM5Vfe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D527B337;
	Sun,  7 Sep 2025 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283218; cv=none; b=JUzj2wXTm/gE0wYH7SgfaJ3xHo/4whmga/WABWHBO4wL0IRgKd7qqeaw9F/39g0wN/0J5Jz9z3oJfghmUnC7bTjo9+RxGGyyY5/wdeow1roUxhRIxosNmrakPjaqnj0bliThWbJ4+UdHijpBa6/l/5L1UW9N5rRJvWGrgs03WKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283218; c=relaxed/simple;
	bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIZEWrzYCKwLYOHRUgrOhlOaszi0uEy9ifM2vnyB5rSJeKliFPLMakf/X4OI+mnP3niL69P/ecVXY04duVnDjxjHc4wp5xVImCtBPbEaKFAJHWobTFtbxr08dkRqhYF82iXVPQaDQUhw/JROQANGV5VOR47sIAcFRkdfI1+IbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQoM5Vfe; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-80e4cb9d7ceso526297685a.1;
        Sun, 07 Sep 2025 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283215; x=1757888015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=lQoM5VfeVFJf2iYvxlUwF7T18LrKy/W7mDXT+pSOsBbOkdNXD4oqePs1BvBl8VECaN
         BNLZUSiSRAdk/qqlm5sVEjs4+NWPhl7eb6GKA3ySv96/LFThgner97g+U5/5/kFTJ7/q
         mjSEBKU60Ub7bur2mawyCHF1s83cnBe8yFBy2C1gMopOE1C6d+JkPJS81/nSW2aLC2+i
         f+AhiawyEuZCTKjQBg3mTGSWgGhYkdutg4nseApe/13/A2UKoQhrO/iJ18MIK9DCGSoF
         kzpiosC3fuVZkT9vV8v2QCz1Q0+lZ81XYF14VweKZJkNSzeWpj/870wxJWK7beDUIslX
         Fdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283215; x=1757888015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=FQSz3FHNEFqCdJJOATLeUy2ZbNL04JklhXfrOK3EMjbkozPZqgnFIaH8IZy2i/U/fw
         lAnjHiMowkyunxy2J4oDCYhKB9KIKB4xDXPaksFQV8wSGsQ+pVsUYbZSSFNXklLhJm/l
         wrVtU+FQ26dvO8mgIKuiP6OxCYnqeGWd1CoQ2r3PpLCQMhPmbcC/vJorYQrEoEEjKWaZ
         CJO/o88JPi1YOETM86QTzdoWBXN8f+/XWG9fYxu49znNgjyMmGKRmHiV2q4TkX3uxaw4
         VUszV5tX5g2IlXBGSFFJdwhY+PukBssUYsLkSdE9LdACcmdryy7Rj9gU63sKVR/qRxYX
         8GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyiscwD8FefR0HcctYJUeywxv/cEZWUgLJRTXdAMoHsCmVVyHGlDp5TCrSvJkp/36NAJepcSmmPQPf3SxU@vger.kernel.org, AJvYcCVgACCN4yPv3wE72whE7B1Nkw4QIVYYizgoSvZFd4U+y9F3oHgYLQF7chV87c4lKyl2aSMFyNHDwW0m5pudoMo9seM=@vger.kernel.org, AJvYcCWitJszUUEY9sf0MFfduDdy5xJty+qDoyf+TBFUnS6mVzYTLKzkLxjkeAQ7+B4KvqXIfBJur0P505lpCufP@vger.kernel.org, AJvYcCXqc+FqwReCGJgcc1AFccBrnfZssEb5Ra325KB74T95aNRjURDGc/9nzSsm3f5xUVgtxx6+ofg60aM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cXTASNaYkXsCXLZvPfc2x4L+Ma76YlcscCZIhj23eYPwXwES
	S3A9lLTYJgtfyP4JvYxaxbxwavxuyyKMWozxNb3U6BdTot5TG91is1aEzGrm2nEj
X-Gm-Gg: ASbGncvkuNZORd1YFks7wMJmD9OJcWaJuVFoxJD4ppI6PVaEwEJd3u6bUPUOl5c/i8N
	n+FdbsPkGqFefmytLcrh4SY/cTfNaiKH2edOYVyzFwftI7jEgzXUu9rB9bnMYDNPIhf2jXw/rWZ
	f6nFwPnTn9+8IjG+MVUlIFiCsEi8qCijYdKo5I6wx4gEg76YtXp/BE0BcBaY0FyA3+xBR7/bmDt
	XoXSr6icm98o0D160zZUgCVq3uxPIhDgTmr0/vYiV9YOqnbESTaK0Hn1uVNTBhmCv9f06JgnKvy
	fWkzGLP9TnI+fN64c43UGbLrSkz6p7yWgk5EgmqzqXMj+RJeMSl9gpSMzT70EDv533uTKxzgE8c
	UXdJDPLGfCxve8rsqIr2c2DS+JT3F0d4=
X-Google-Smtp-Source: AGHT+IF4WBT367rc7xTWhxL5wmyvAoo/NmdxchMxfKtTg1zpZI4rxCABsxVs4Lm5bqd0ggvtwpcodQ==
X-Received: by 2002:a05:620a:298f:b0:813:5df7:1249 with SMTP id af79cd13be357-813c235fa79mr562041385a.41.1757283215386;
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:33 +0000
Subject: [PATCH v2 2/8] arm64: dts: exynos990: Add sysreg nodes for PERIC0
 and PERIC1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-2-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1456;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
 b=odWB+qRjOJZoSfICr4ZcPLazr1kCkaC2Ot/yiQ8Lh0jucaF4J05DqG+NxYBGF9wlX31kGkJ5f
 vgIqMXjg7akDXA8JrtgPjUQW/+pEvX7A/75gjPI2MdTltHutRKxzktf
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add syscon nodes for PERIC0 and PERIC1 blocks.
These are required for configuring the USI, SPI and I2C controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 7179109c49d0b0984c8d8eb2d24c0be1c6e015c3..f8e2a31b4b7519b83aa31deefbc40e5edbb8186a 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -260,6 +260,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
@@ -277,6 +283,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1


