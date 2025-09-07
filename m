Return-Path: <linux-i2c+bounces-12733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E6B4806C
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC9AF17C06A
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DBC2C0290;
	Sun,  7 Sep 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6RIereq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFB2BD02A;
	Sun,  7 Sep 2025 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280861; cv=none; b=mNUqGNkrAdHx1x/WIiPMe0rQtH1KwbWrFg9jQWO8VK8kw9JvnYL+/61/x9EF2WHFh1hqzeZnxHNUUWZKjRuDODrTdYYGoXDFRk/Zea5BmYWAvYSIxtYtJ99aIV1fYHEgE9l2oau19D0s2rfs9a1vRaI6d3Wla45U7VlCTaV3OYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280861; c=relaxed/simple;
	bh=/xk836TKo82M+uaLww9YyZPkSWoBnI44yqkkkg/l5FY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5S8mW7pejJwkINQmKyndc2U1S3n5vthapTApRpBAsD9i2AJ+T+pmitaiYReJ8vezbp1aXLC+RfW6OBv/t61VGzBRvZKWXuSvngtU/svTHrkXsRW3yTZ5xcqCQBal+uF4WsIYH2bvZbdUnCtRNYlrwsWu/I2+wLAzrnjcSapYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6RIereq; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7211b09f639so43611026d6.3;
        Sun, 07 Sep 2025 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280857; x=1757885657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emJzwUWFOEkIAEWA3TmeRMr6fZnDpJ0DqNRRUp7CwXE=;
        b=H6RIereqaFm1ukszeiEt3n1IiwuubQMO2fxX+oHqbau2MlLwTE01d+VN4PLktbEzO1
         zOGtReA2Roq/qvVkI3tnKzeZCSgPVw/1Qd3DmyqVeZvZZA8ji8izjZGY1mibYA8YuuJl
         r+qwcnpUotxSzZUEHjpqjrCoMrGCskzfWZqBzeFVPC/m+YibzYsGDJJ201h82x8FgSkZ
         RuSvpvVTY9zeJzWPIdRC40U6XJrmKYIFS4ySK2KIXwknQ8DAUMDcd39R1Ie6nktE9nlV
         bjjMlprqx2DlPdi07lLcF2KFBpE635tswIsoY84EfIOyXMQHJQvIREqFTHwL6b3PeF5a
         kOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280857; x=1757885657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emJzwUWFOEkIAEWA3TmeRMr6fZnDpJ0DqNRRUp7CwXE=;
        b=WOd6LdEid8IZegOghA28VdypPH4ettLNQt81YeaMyR7NWrfbobICRccJGHu8b98i91
         D8SeKJj95Zte3Jn/3AkWno0YS5rRc/X+WeA/d6rrpXH0OLlwIZHmEidpYDdVtPj/gDwp
         OXaagEmqiuL9V0I8cI6HtrfHqa9WpxINhw2UCEZjnuXWf8cMXhEyMlkHLD0isnbNTk57
         P1baKvWUTYlK9AnqbW6RCMMkWkFhJog8oATn21eFkVLg7QJf1yrd6ogXJgpQtyPTYTDp
         RagjBE/2+rOF7G86CuJ3r/OP5J2jVh91lO5wE/rHK/woEkCLhmLRvz7UssfP+9iiU0Jb
         8LNg==
X-Forwarded-Encrypted: i=1; AJvYcCV46Kw2qUfESvSQDzM84aNXQjYIESU6Q/p9B3bJUfhlEAHFSUpEA0EBlf2DeWIAgXoqCWDB4X2UUSM=@vger.kernel.org, AJvYcCV6NtrAVusmRXdiu4NCHSYtsdd893yUuWKvDssQVdBRuBGPEiUKU7wfCmQ8o2j2sV21XQbyhz0N0GxhNvIC@vger.kernel.org, AJvYcCVyHQR9PVh9hTYFkQyrpHuzCcAHVgLZ1VtI20yw+EJH6s9HsVuh9YPgsgxmPg0vZaO3qJLzWrSUYwuIWQ5GjETCY6Y=@vger.kernel.org, AJvYcCXo+nhuU/oOT9ekK4s2YjuI4wxuAFcH5W8Zfz3SDaUNpcs1WJUvAYt0sdMIGxd4GwQsa3hP4wEpMQQ4o5tQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAb2wYV7XYKEV+A3B2IK6tNBlHlFmBd1yjkbjSK7IdxQbMBjbj
	/fd+7eMv6jXkDyqqNHQbAEa3aXkooVhmfbgwcU8lXQ10gMSE3AQiXla9Brtx0EVg
X-Gm-Gg: ASbGnctxT7jwnBvHHcQRdcLlrM0X03AG25TVG00LZJPBZ2u5WFLlByHh6bxA7qThLsY
	GvX8KEcVj5x3dEDt3Ug8JggHnVu8J+vB4vtjNCYzArDWpCs7UPKdWIWmwtx3GwJBbIo9lIVg/rz
	UuhAO63JUyX3JzEmw6h72/vaC3DI/KjIwfJMn9eKbpvWHMevWFEaAE9ciiZySyk48zUdFxnKWGs
	NUwxMKniq0xvrHYLQ6tMZe11lmEEP+vhjaJ4za+pdlOzwakgIzbXGgFTXKO85OvMsdOnFCKhZij
	at5rE7KCQ4CHj6Ge1VDJcA+jJxRcFgMzdKtayr8bgPyW83uszCNDc44JL9szylPcSVhAD2bncbk
	sYVtDYM77EM/UUmz5wmO+dfwQDxUu6bwIOhQd6iYA1Q==
X-Google-Smtp-Source: AGHT+IFD8lZZwUgW8qliMSNGGRLmxyaonS06yhnoyGWdkn7V9M7Cihagbs4W3TkAAZ7PyGHFfihE5w==
X-Received: by 2002:a05:6214:e8c:b0:72c:cc04:aab5 with SMTP id 6a1803df08f44-74180919baamr49765146d6.43.1757280857256;
        Sun, 07 Sep 2025 14:34:17 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:04 +0000
Subject: [PATCH 8/8] arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-8-ae7600491a7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=36986;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=/xk836TKo82M+uaLww9YyZPkSWoBnI44yqkkkg/l5FY=;
 b=VWhF69z/JT1U7NX9iN7MC6qbiOzNO42BSgd+TZoJCJfyazkK6PIsDHbkg2KQ7s9/2R7gqLawn
 4LdFstYI6deBq6ZibuLWAKoHfqyF+nQ08HCQ2W4JAC33YvuPB2+mmf1
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add HSI2C controller nodes to the existing USI nodes for PERIC0 and
PERIC1 blocks.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 841 ++++++++++++++++++++++++++++++
 1 file changed, 841 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index de9cf9b2d1b28a62519d95549d04458c6e4fe16d..268d8e25dbe8a4d7758c233e429d19cf688d7636 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -313,6 +313,21 @@ usi0: usi@105500c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1004>;
 			status = "disabled";
 
+			hsi2c_0: i2c@10550000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10550000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c0_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_2: serial@10550000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -328,6 +343,36 @@ serial_2: serial@10550000 {
 			};
 		};
 
+
+		usi_i2c_0: usi@105600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1008>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_1: i2c@10560000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10560000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c1_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi1: usi@105700c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105700c0 0x20>;
@@ -340,6 +385,22 @@ usi1: usi@105700c0 {
 			samsung,sysreg = <&sysreg_peric0 0x100c>;
 			status = "disabled";
 
+
+			hsi2c_2: i2c@10570000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10570000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c2_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_3: serial@10570000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -355,6 +416,35 @@ serial_3: serial@10570000 {
 			};
 		};
 
+		usi_i2c_1: usi@105800c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105800c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1010>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_3: i2c@10580000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10580000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c3_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi2: usi@105900c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105900c0 0x20>;
@@ -367,6 +457,21 @@ usi2: usi@105900c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1014>;
 			status = "disabled";
 
+			hsi2c_4: i2c@10590000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10590000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c4_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_4: serial@10590000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -382,6 +487,35 @@ serial_4: serial@10590000 {
 			};
 		};
 
+		usi_i2c_2: usi@105a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_10>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1018>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_5: i2c@105a0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105a0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_10>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c5_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi3: usi@105b00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105b00c0 0x20>;
@@ -394,6 +528,21 @@ usi3: usi@105b00c0 {
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
 			status = "disabled";
 
+			hsi2c_6: i2c@105b0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105b0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c6_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_5: serial@105b0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -409,6 +558,35 @@ serial_5: serial@105b0000 {
 			};
 		};
 
+		usi_i2c_3: usi@105c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_12>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1020>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_7: i2c@105c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_12>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c7_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi4: usi@105d00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105d00c0 0x20>;
@@ -421,6 +599,21 @@ usi4: usi@105d00c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1024>;
 			status = "disabled";
 
+			hsi2c_8: i2c@105d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_6: serial@105d0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -436,6 +629,36 @@ serial_6: serial@105d0000 {
 			};
 		};
 
+
+		usi_i2c_4: usi@105e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_14>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1028>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_9: i2c@105e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_14>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c9_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi5: usi@105f00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105f00c0 0x20>;
@@ -448,6 +671,21 @@ usi5: usi@105f00c0 {
 			samsung,sysreg = <&sysreg_peric0 0x102c>;
 			status = "disabled";
 
+			hsi2c_10: i2c@105f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x105f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c10_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_7: serial@105f0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -463,6 +701,35 @@ serial_7: serial@105f0000 {
 			};
 		};
 
+		usi_i2c_5: usi@106000c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106000c0 0x20>;
+			rsnges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1030>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_11: i2c@10600000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10600000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				pinctrl-0 = <&hsi2c11_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi13: usi@106300c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x106300c0 0x20>;
@@ -475,6 +742,21 @@ usi13: usi@106300c0 {
 			samsung,sysreg = <&sysreg_peric0 0x103c>;
 			status = "disabled";
 
+			hsi2c_26: i2c@10630000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10630000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c26_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_15: serial@10630000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -490,6 +772,35 @@ serial_15: serial@10630000 {
 			};
 		};
 
+		usi_i2c_13: usi@106400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1040>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_27: i2c@10640000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10640000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c27_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi14: usi@106500c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x106500c0 0x20>;
@@ -502,6 +813,21 @@ usi14: usi@106500c0 {
 			samsung,sysreg = <&sysreg_peric0 0x1044>;
 			status = "disabled";
 
+			hsi2c_28: i2c@10650000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10650000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c28_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_16: serial@10650000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -517,6 +843,35 @@ serial_16: serial@10650000 {
 			};
 		};
 
+		usi_i2c_14: usi@106600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1048>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_29: i2c@10660000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10660000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c29_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi15: usi@106700c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x106700c0 0x20>;
@@ -529,6 +884,21 @@ usi15: usi@106700c0 {
 			samsung,sysreg = <&sysreg_peric0 0x104c>;
 			status = "disabled";
 
+			hsi2c_30: i2c@10670000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10670000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c30_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_17: serial@10670000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -544,6 +914,35 @@ serial_17: serial@10670000 {
 			};
 		};
 
+		usi_i2c_15: usi@106800c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106800c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1050>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_31: i2c@10680000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10680000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c31_bus>;
+				inctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		cmu_peric1: clock-controller@10700000 {
 			compatible = "samsung,exynos990-cmu-peric1";
 			reg = <0x10700000 0x8000>;
@@ -607,6 +1006,22 @@ usi6: usi@108a00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1018>;
 			status = "disabled";
 
+
+			hsi2c_12: i2c@108a0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108a0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_8: serial@108a0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -622,6 +1037,36 @@ serial_8: serial@108a0000 {
 			};
 		};
 
+
+		usi_i2c_6: usi@108b00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108b00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_11>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x101c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_13: i2c@108b0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108b0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_11>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c13_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi7: usi@108c00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x108c00c0 0x20>;
@@ -634,6 +1079,21 @@ usi7: usi@108c00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1020>;
 			status = "disabled";
 
+			hsi2c_14: i2c@108c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c14_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_9: serial@108c0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -649,6 +1109,35 @@ serial_9: serial@108c0000 {
 			};
 		};
 
+		usi_i2c_7: usi@108d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_13>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1024>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_15: i2c@108d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_13>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c15_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi8: usi@108e00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x108e00c0 0x20>;
@@ -661,6 +1150,21 @@ usi8: usi@108e00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1028>;
 			status = "disabled";
 
+			hsi2c_16: i2c@108e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c16_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_10: serial@108e0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -676,6 +1180,35 @@ serial_10: serial@108e0000 {
 			};
 		};
 
+		usi_i2c_8: usi@108f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_15>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x102c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_17: i2c@108f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_15>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c17_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi9: usi@109000c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109000c0 0x20>;
@@ -688,6 +1221,21 @@ usi9: usi@109000c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1030>;
 			status = "disabled";
 
+			hsi2c_18: i2c@10900000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c18_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_11: serial@10900000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -703,6 +1251,35 @@ serial_11: serial@10900000 {
 			};
 		};
 
+		usi_i2c_9: usi@109100c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			rsnges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1034>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_19: i2c@10910000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c19_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi10: usi@109200c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109200c0 0x20>;
@@ -715,6 +1292,21 @@ usi10: usi@109200c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1038>;
 			status = "disabled";
 
+			hsi2c_20: i2c@10920000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c20_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_12: serial@10920000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -730,6 +1322,35 @@ serial_12: serial@10920000 {
 			};
 		};
 
+		usi_i2c_10: usi@109300c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			rsnges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x103c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_21: i2c@10930000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c21_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi11: usi@109400c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109400c0 0x20>;
@@ -742,6 +1363,21 @@ usi11: usi@109400c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1040>;
 			status = "disabled";
 
+			hsi2c_22: i2c@10940000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c22_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_13: serial@10940000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -757,6 +1393,35 @@ serial_13: serial@10940000 {
 			};
 		};
 
+		usi_i2c_11: usi@109500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1044>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_23: i2c@10950000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c23_bus>;
+				status = "disabled";
+			};
+		};
+
 		usi12: usi@109c00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109c00c0 0x20>;
@@ -769,6 +1434,21 @@ usi12: usi@109c00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x2000>;
 			status = "disabled";
 
+			hsi2c_24: i2c@109c0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109c0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c24_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_14: serial@109c0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -784,6 +1464,35 @@ serial_14: serial@109c0000 {
 			};
 		};
 
+		usi_i2c_12: usi@109d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_13>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2004>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_25: i2c@109d0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109d0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_13>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_13>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c25_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi16: usi@109600c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109600c0 0x20>;
@@ -796,6 +1505,21 @@ usi16: usi@109600c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1048>;
 			status = "disabled";
 
+			hsi2c_32: i2c@10960000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c32_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_18: serial@10960000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -811,6 +1535,35 @@ serial_18: serial@10960000 {
 			};
 		};
 
+		usi_i2c_16: usi@109700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			samsung,sysreg = <&sysreg_peric1 0x104c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_7>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_33: i2c@10970000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_7>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c33_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi17: usi@109900c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109900c0 0x20>;
@@ -823,6 +1576,21 @@ usi17: usi@109900c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1050>;
 			status = "disabled";
 
+			hsi2c_34: i2c@10990000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c34_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_19: serial@10990000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -838,6 +1606,35 @@ serial_19: serial@10990000 {
 			};
 		};
 
+		usi_i2c_17: usi@109a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1054>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_35: i2c@10990000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c35_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		usi18: usi@109e00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x109e00c0 0x20>;
@@ -850,6 +1647,21 @@ usi18: usi@109e00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x2008>;
 			status = "disabled";
 
+			hsi2c_36: i2c@109e0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109e0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c36_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
 			serial_20: serial@109e0000 {
 				compatible = "samsung,exynos990-uart",
 					     "samsung,exynos8895-uart";
@@ -865,6 +1677,35 @@ serial_20: serial@109e0000 {
 			};
 		};
 
+		usi_i2c_18: usi@109f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_15>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x200c>;
+			samsung,mode = <USI_MODE_I2C>;
+			status = "disabled";
+
+			hsi2c_37: i2c@109f0000 {
+				compatible = "samsung,exynos990-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x109f0000 0xc0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_15>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_15>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&hsi2c37_bus>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;

-- 
2.50.1


