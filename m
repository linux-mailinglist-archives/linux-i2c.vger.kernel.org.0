Return-Path: <linux-i2c+bounces-12728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA25B48053
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D27C3C0346
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8504129C325;
	Sun,  7 Sep 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3yumtLr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EAC263889;
	Sun,  7 Sep 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280857; cv=none; b=dqr63So15jICM5KWIx4tixcIFbdqXJ0B3VDv4TomLc5nE5sG0Mts69r/TbXDjV2kZg1xQHpgGna5BZegwinZirW/Wa4aNwyvVgJKyXJK2gF1R+Zr69BgW53gqH5ymlSb8lmvMnrfl60rU2FJ3P9u2h06n0sRB/aMFe8yylf6//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280857; c=relaxed/simple;
	bh=dpzH3ZgZfhAHeookD5eV+FtY/q5RImJCHodew0fPSVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Inoff+pWvJocFKeuvlOoPIfsgO0tgGATF4lLa15nuFjw9a9dLGcBHM5ZIrP/Ol5cPXUz5j47bJq+NW4wJfw4CGiUjfXolC29WqPKVbwqLqXNwkH9KbTiQglHc+wPM8oW0eiSgASdgOjHn91l44fPM1jCgwHUF44fjgDisZJ0JpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3yumtLr; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-72374d6a6caso43263326d6.0;
        Sun, 07 Sep 2025 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280854; x=1757885654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rScmOcK/Kz2XNUOFOt6dJ286EcKY4tMZMYUqUQHpaYg=;
        b=C3yumtLrVobyP2S4N80UEYcMbkAUb1HTu/Rg8VP8CU7/5qxxtzbqp1aVzWV53JFtRz
         hDot+TQRIkJx45D7Z5+GMVUr7OZUVAFxIBqez5BcR6xLJ6SIb9es+rHd+t3dPEJxeYHW
         x41wmSnCfajIvLbiUzOUSljOCoNwYQfaJAyG+X7RCfoOCFlxPS3Au6u3K88Pc5nXRwQa
         SqdFnxfbypaGd5mshnSflvosWccQtfRU+HCI4RjhRNS8YWu67z9GJR0tS8wWCkBIgdHX
         OgJN9SVzW8h+uAjlloRmCIFDQEZsJzjzkVRep7aX0BMrViC6EUZZ0fhPy1bYws2FZtR8
         wnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280854; x=1757885654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rScmOcK/Kz2XNUOFOt6dJ286EcKY4tMZMYUqUQHpaYg=;
        b=cF1a7RbkvCWcd2foBFdaJZXf8rRnLvVGizQIa9qI4H9TsRDAXuF0JI+UBe1AImFR7s
         zonJ3aGF5Xd78DeezfePgeN/gEMHRFDIl6ghy6mfQJv8lon+RUkA/hmogVGUZPX7AMNG
         2ZaYyRWUdUC6AOffXWMRvgI1oixi3lYbrAacG2dkPQzkXeHZyNPADpzNfFmZylkxt/tF
         /StuNI/m483jHmUYxd5wTq7Ft7u1Xd35SQZ4pduEU/p1Qstg1nF9n2yDaDpkSiQwbeKt
         7ol1eHhvhW3Ao+Ii2ynyNORWW4xLRhrQzrCj13a7HvpS25wPWv4Wi+VWjKAecQsZ+t3o
         hr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe9uT/qfPKyHz/cLCH0+TUBBMQ/cdS1TXBVxfDlV+Um0pun4zWWKvWtHETQCd7opZKasj7xWXHzJc=@vger.kernel.org, AJvYcCUoZcm8Va1WbWR5dRg6TYtBQYeJLor5sdXgPCuX4YILa6GZXkMgstw3uML6zO3l9+LhXbDLiOLd7cDBaG8jO6wvikM=@vger.kernel.org, AJvYcCVszvPkz5otCMl6ALI5hniI98vjJ7giJecQYamzjrtNyi+e2jkgisq3imbbTpxZXwH27mUVHj729P17niM9@vger.kernel.org, AJvYcCWHidNo0j1pivsezyJBzEmW6ljzLgKB41F7OpDY19y4YAzidtrJYuIuHfjix/TxfWN7HaSoWOMBoVZ6ugwc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdn3wUyC3mRUEB6E1YO3rVfM4RTvLW0gway/r09oN98Kbl2oeT
	3UncXwUjF+zGyhIrjDYKh5Z+k7jPJplvaB3X9GXdv6EJX3ClW2wKHV9VITmRXI8m
X-Gm-Gg: ASbGncu03Fq7ziRo5ibT3xd2M3GpXhz9hlQ1qqxOevRaChysxWt2nfh47/G0BCpVa3f
	Vi5JGTmevKvbVp3ft056CRuGcqHv59yIdcAKMFov0uwSfX0Q/xUAbVoYcM5OFreQLGYRYQlzDNk
	+TIRu6od8gPQD9nidfYwmlRaSoE/p+g6IvHCANQaps88SIP4Hl2dJY2ugtbhXC1keW8mfCuLx/c
	Ck809A7B+Gzuggk9sbEUTRVmhDf1ibXd8xJAax4/UvkW1SdCY7W0PMjFxEuBVV6bJsj0q1irr5C
	1IHXGSHzLeesOm2oEjX4YIncLoLwVP09jvs9Q88bwfyys5s4CXu87LKDm+jG5yNxRiraSa/aQhW
	WlJUp+xOeadQMYyhzdt4YnmXH0SRN6Ng=
X-Google-Smtp-Source: AGHT+IGnc54+iFOEGUFplzfAc6vA/uz+TARDseZqyuxj3LIF3femf+h7JPp34RxIVWnILK9xEVDOZw==
X-Received: by 2002:a05:6214:20a9:b0:725:d0c6:8980 with SMTP id 6a1803df08f44-739435c5c68mr57077646d6.64.1757280854208;
        Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:00 +0000
Subject: [PATCH 4/8] arm64: dts: exynos990: Add USI nodes for PERIC0 and
 PERIC1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-4-ae7600491a7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=9012;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=dpzH3ZgZfhAHeookD5eV+FtY/q5RImJCHodew0fPSVw=;
 b=THKOSDnAnkZdtqUjvprO+4C+qfcD3g1k7BnnmyLn+tht5VMTb6eFN7yJAegG+Dh9GEH97du4S
 4WcWWrTsEWUACR46prBdYMbKSlCqjkjOY7eizcxezDLZVRErnEh8ACJ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add USI nodes for PERIC0 and PERIC1 blocks.
These nodes provide the base for serial communication controllers like
I2C, SPI and UART.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 247 ++++++++++++++++++++++++++++++
 1 file changed, 247 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index f8e2a31b4b7519b83aa31deefbc40e5edbb8186a..1e09f3efe685748789ffd346cd914f9a8ba68f8b 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -272,6 +272,123 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi0: usi@105500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1004>;
+			status = "disabled";
+		};
+
+		usi1: usi@105700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x100c>;
+			status = "disabled";
+		};
+
+		usi2: usi@105900c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105900c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1014>;
+			status = "disabled";
+		};
+
+		usi3: usi@105b00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105b00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			status = "disabled";
+		};
+
+		usi4: usi@105d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1024>;
+			status = "disabled";
+		};
+
+		usi5: usi@105f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x102c>;
+			status = "disabled";
+		};
+
+		usi13: usi@106300c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106300c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x103c>;
+			status = "disabled";
+		};
+
+		usi14: usi@106500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1044>;
+			status = "disabled";
+		};
+
+		usi15: usi@106700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x104c>;
+			status = "disabled";
+		};
+
 		cmu_peric1: clock-controller@10700000 {
 			compatible = "samsung,exynos990-cmu-peric1";
 			reg = <0x10700000 0x8000>;
@@ -295,6 +412,136 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi6: usi@108a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1018>;
+			status = "disabled";
+		};
+
+		usi7: usi@108c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1020>;
+			status = "disabled";
+		};
+
+		usi8: usi@108e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1028>;
+			status = "disabled";
+		};
+
+		usi9: usi@109000c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109000c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1030>;
+			status = "disabled";
+		};
+
+		usi10: usi@109200c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109200c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1038>;
+			status = "disabled";
+		};
+
+		usi11: usi@109400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1040>;
+			status = "disabled";
+		};
+
+		usi12: usi@109c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2000>;
+			status = "disabled";
+		};
+
+		usi16: usi@109600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1048>;
+			status = "disabled";
+		};
+
+		usi17: usi@109900c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109900c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1050>;
+			status = "disabled";
+		};
+
+		usi18: usi@109e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2008>;
+			status = "disabled";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;

-- 
2.50.1


