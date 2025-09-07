Return-Path: <linux-i2c+bounces-12738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D396CB480D9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 00:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB69F1B20E72
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8362D2BE036;
	Sun,  7 Sep 2025 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iErW92qu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8123429C325;
	Sun,  7 Sep 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757283220; cv=none; b=urk4gps5OA3Caf8ZMqnyvlFZ/R/o8Czq6SUIIRWjwxF6yPcvuVDIYEQvxJFsCP/2EH1fsuUigVgb9A7wbOugSISiTU9dgE1Iin9vRNg9fzbpfyKt4NojhTH9j4JwaB6SXJV14MQ0vB6aORYwuAiB7bGMv/nbinWAaP63eGV1JlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757283220; c=relaxed/simple;
	bh=dpzH3ZgZfhAHeookD5eV+FtY/q5RImJCHodew0fPSVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ApauZ/K7tp8LP4MfLP+/n+yaLZSdcsRzyr1NVA4xh3D8EwxLMiNkra/CysWdf5d0Z0wYfNTyz4WZdyiaFV0sf21GjcoCBPkieBA+w8kBAUnKKq/uux8tgSqESgYO4xup60Sn/7mVcbx5AOJ27jgDR3x+p8nSox4HCTfHdwlFhG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iErW92qu; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-80e3612e1a7so480464385a.0;
        Sun, 07 Sep 2025 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283217; x=1757888017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rScmOcK/Kz2XNUOFOt6dJ286EcKY4tMZMYUqUQHpaYg=;
        b=iErW92quOHjFbPr0HWJCT2WSh/VvxxPWo4iFMcaQYUsOiX0CGWmMcQLWag2Db6kY+1
         1UaQNPw/dY0dcvN5fLZAfGEl2/GAJtc3rvcPwLMsfbYwK9rFD8c3mO7jjvUmPAsiQzNN
         M7JfyoaChgEuQNYMtKkBh/rEP9xyiW4PilkcESBebog7smMiEhz/Xx7XF2FWpZdpa2Un
         UIHeE7rCCOVTnxo6fZ1itQW/jKA1LmDD1Gqh+s9xp8P6dSIFAMWfDrcZgJinEMYL+LrD
         1Pd5XVguC13EgjyWw2qsoYbumriIQ2AWyb0cH81LF9E3lciCPKzDThXhHhgrkYEREmN7
         G+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283217; x=1757888017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rScmOcK/Kz2XNUOFOt6dJ286EcKY4tMZMYUqUQHpaYg=;
        b=KJfOTURWW+9lUttnKKHFrYET1iPJFYk8ikWYblgtpYbBQMz7ZcwX7QBymTgv9QfDlz
         9EMw2/xMBbcOKpOB+R3cVsswkGnQjlfDm4Hu9g5ytlnDhePX8uWB8bMmcSbAPxRIIi12
         wHVvqs6VvRpgLJd7Pl0KPajRW0Oy4K71vuHuyUaud9Vnur8q0YEsZzVgc+V6owroehwK
         C1MJMPEPBvLIrPh83eV/cSySKnufk0q73jVUZEVRcm6iNx485mud88P35x+mCgNBgY5M
         dY5v0/pZR93NkHWWJG/TqTb7dl7kDmzZeYOGrMXcQr2EfHZh2y3V6gSGu01Wbi5GOC3T
         aXHw==
X-Forwarded-Encrypted: i=1; AJvYcCUn3n6TBf9MXv9JTFi2PtAkCGplkVq07PHYrWQH/uOjP0PYf4EVxKNFMBOJkdKeYkA7rIYyGEBdSmg=@vger.kernel.org, AJvYcCUzOiEeoJyPQlZjKZdWhhHtBnvDT+JMRTnbFOCivJls/63lvXOW4/0nfLH83KhrUCmai9YKUqWRLA4XD/MD@vger.kernel.org, AJvYcCVmI2C/jFPl4HYI/K+2jop3lxArmwDHikF/6mtakrapvW3QB4lxzqXqVjheCvpGJ41axLHS+Xfksi06Y0XHi9zCNbw=@vger.kernel.org, AJvYcCWZd1DMvBpRihJvHBN6E6+NtYD4DyPiOW8WQV0AuUWwH53i6o74qN7ITog5WyTrawFE7nTo8bizWtR49dfu@vger.kernel.org
X-Gm-Message-State: AOJu0YyeeLxC90E+JwgUjD52Cy/wBnivKlwx6Zc5mcU2FGJhUHu5uAIX
	Fj/xejEROpuWase5Raij2IQHeT0jtFT3rR7cifCmpSZzCPmQz0nNjqSp
X-Gm-Gg: ASbGncupAQCra5Ijx/4UTBidLCDExo1oIjN558fp06kuSCXFJmiqGKerNdHcliFgCVI
	WMfSJHbIwS5osXdxeihVDs5+/21z4x2ydkfhf0ifGt/9+ce5T3VonZ5+yHHI2wCz6kIMvSe7wBg
	0t1qplSVyPvJsXcdrIhR3LWnh7ec+O6jRtTEPdzGSZnhhVjleJE+JJtJcYo9nDVy8fDCqdHcLrP
	n3jZYc8/3Psw1u+xweP4B2f1N0vbfEF2eqheGsypS8ytppUCW9b0QeoqfVxp4Dlj8kDY0hFZNek
	ohX4l6UvjJaMDF0JhfRydrF/XWYeTWrBQT7f4qBeE0dwSPoclhWPzLzSP4VSAbcwqmXUkbblhDu
	sjrsfoZ2iwE7T8PthPGrH/2chkJ9szTo=
X-Google-Smtp-Source: AGHT+IEvwS5MhYiZkPDzWQu3ZFWF9GbplCMGcO4Q+CLnaEMOmMnuS9i2EN26iGaSbQjGmmlOlkKsyw==
X-Received: by 2002:a05:620a:7107:b0:805:ef70:2a4c with SMTP id af79cd13be357-813c1ca5039mr493864785a.53.1757283217156;
        Sun, 07 Sep 2025 15:13:37 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:36 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:35 +0000
Subject: [PATCH v2 4/8] arm64: dts: exynos990: Add USI nodes for PERIC0 and
 PERIC1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-4-58f41796d2d3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=9012;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=dpzH3ZgZfhAHeookD5eV+FtY/q5RImJCHodew0fPSVw=;
 b=hRLm3eCKKqUA1QfSZWa+VjEs0GR8SImu0XHNqtOXHmvKysFZwg32DHyF7kSqt/w6KS5hSoN/A
 aNbDcIkGgyeDD1i4/cFVWvhTre1alGtQShTrQX9v/4ubas0ctUI/QJQ
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


