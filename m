Return-Path: <linux-i2c+bounces-13037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4DB81E13
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 23:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D9FD46873A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 21:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C673B2FF666;
	Wed, 17 Sep 2025 21:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAWJ6vlq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DA92F6567
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143074; cv=none; b=GKSla7nSIzOsUay7Nw3Tzxw4YihdeP77zY6AE8itqLBKpKE8SDNf37DJ0QtTKAC/mJw75TzqXYozcsjUaebiKGX1jrV8F4SD/mvAlXFWPJSsmnNnMfZE67n8pBjA1VKBOCo/WFt+cAXlxV0wL47+40/VxxVRS6Hor6d8GDROD9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143074; c=relaxed/simple;
	bh=CirypSJDTM6mdptHXHS2YxVIHLesIym3KAn4NpE1E9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anMum+qiz513JVO/RVACAeul+ybAgBU+VruM2Nkhrd+VZ7qhTD9P/3Wlh2Hcjnk50PErV44Ts6bETALqNrosgTeL703korBg4G5VL9qLEC2CEL0Bq6k7AAS9sdT+hXDN5CPe/40Q3ccXD42GZnvpuNbxtKg8rwJNWswqllSf6FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAWJ6vlq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-78defc1a2afso2963706d6.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143069; x=1758747869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/CDJt+nCWGMuSHgOmq5idoEzKJNHc64HXu3UCQHcsQ=;
        b=CAWJ6vlqKVxKp6r2CZJW+KZHtDklDkPW0hPRPAAoLwSNAwo1eObla0F5eUi6BVApHk
         WnzBeNKVLRyCobriE0EFbG8FD9nidRQ27iOWlw90uezKF0QmbkMq9xRfXsZ4BFT/gp+E
         weotwPgXcRnjKC7zQ9nQfoJc4xVfCQGmiQJJ3zxH/jkUtyZYe3D10c+A21bp7THXuWpX
         OAvnk+I10tA+gLskhJ/9Saw+7jkyLyMXJWWJzc+8uqhhPvkciJsLgGYwzHcsPJ5DdMBK
         sW/7KYIBr8t0pjkcbJRsBXcbAYv6hZOdCsbZnaR+HXYS5NuYzHlLheNcqL7cvLADREwD
         wnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143069; x=1758747869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/CDJt+nCWGMuSHgOmq5idoEzKJNHc64HXu3UCQHcsQ=;
        b=Jk8NAuutvLTNBNeaiiVE8+M6Gnj4pW+8MatLdzJzVCZomUc5s+ZhX1zmu0isGis8nE
         r20Y1s6xB6cxHwNb86UxbGitcD6W/EO4NWA4MT+CZoxA5/di21LFW6qnoug9YQTZzkbE
         c45cfLw5RxUGK9PGXOSRx3YoweAJs/dwAKdWTA2DU1NADj2bUMDAX5XGEanOfkpYsmFI
         J7oKplkBEf3xyjAxj//Yq9vn8HHYaG9mVqb/QKPP9setTTn6dF9RpFTXwggyZLVk+uMB
         BVAKMn1491/bkbyVE4bSYPYvJWRDAaTH+jsErsLaE9zscVJzKdvOqzTSED3PxIEMipqn
         uM9g==
X-Forwarded-Encrypted: i=1; AJvYcCVj15XBIIH580NMW3EcaN4bJzw4viSEdCklmFPMEp0dMj1J6hk45110SJYs5n0NDwl82qtCoFQnQ5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD5VnjqVruOAvwD49Jr+6dsvsP0EVxb1AMiYPGoFxXbkAC2js/
	TMaUTxkn//smnpnv+Vks0/ZthWYS3gt9CqcyP2Z6Qw6vc0AKdV9nXRxj
X-Gm-Gg: ASbGncuwjwoUYk5dbvzRnYP9QOxN/9BseqnGhMcz4EarLh9wYwWGfSDUThtEBOiQ7NO
	R2By7fP4VX3BSnY5brpwkGxtoTDbge2UatMl2+5Ww+LVyztcMXbqqMFY8jE/oZgUHPaVHiWVlKq
	ZoSwkOKAK/ptLZO10jNzLoqc4wOmyQWDlFQsu+8+I2D71XsEqMvZJsb2qErp2NLqco3BNJKbJHN
	vEsoV4Rsp/qVR6s1iPxPp1crgbuK9a2pFtMyCxVqH5PF93U0W6G0eeKC/uGkB/RIKleOnMhCh+P
	lx7b9C3ankVggNw1Q1sqdOOd46VX8I9UlMsHfnX7CEsAsuis7q1TPKnLAFpYEzFLgYzcnNx7rry
	O/TAOrFd0ntQ7op0n53r3WYrKHfGZfKmgFsFwFFkuvFWZ
X-Google-Smtp-Source: AGHT+IEDlmjv5vvnUT82W4lRVSpAqjOH5i8nHTVfsAXf7wYZ8yacXONoEMa8oovZb9QgiLbpq/2l/g==
X-Received: by 2002:a05:6214:27cf:b0:777:4a0:9b1 with SMTP id 6a1803df08f44-78eced25824mr45830636d6.55.1758143069262;
        Wed, 17 Sep 2025 14:04:29 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:28 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:27 +0000
Subject: [PATCH v3 7/7] arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-7-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=36974;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=CirypSJDTM6mdptHXHS2YxVIHLesIym3KAn4NpE1E9o=;
 b=syeBapHrkjapaBUFszxAcm0sWB6hnSUNP8Qjfl0MYgbZ6SUv1FuI6HjJd5WFAnFywI8cHkjvR
 Hn/lcNXzE7JBcRcIb9A6YrNwxskfigkewdv7NDf6K7F1xE12sfhwfN3
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add HSI2C controller nodes to the existing USI nodes for PERIC0 and
PERIC1 blocks.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 837 ++++++++++++++++++++++++++++++
 1 file changed, 837 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 8ed534d738ec58873dfba9d5cc46c358c4f6e647..387886bd973730bf8b86d8d5b48b8d4451a6f173 100644
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
@@ -328,6 +343,35 @@ serial_2: serial@10550000 {
 			};
 		};
 
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
@@ -340,6 +384,22 @@ usi1: usi@105700c0 {
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
@@ -355,6 +415,35 @@ serial_3: serial@10570000 {
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
@@ -367,6 +456,21 @@ usi2: usi@105900c0 {
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
@@ -382,6 +486,35 @@ serial_4: serial@10590000 {
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
@@ -394,6 +527,21 @@ usi3: usi@105b00c0 {
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
@@ -409,6 +557,35 @@ serial_5: serial@105b0000 {
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
@@ -421,6 +598,21 @@ usi4: usi@105d00c0 {
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
@@ -436,6 +628,35 @@ serial_6: serial@105d0000 {
 			};
 		};
 
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
@@ -448,6 +669,21 @@ usi5: usi@105f00c0 {
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
@@ -463,6 +699,35 @@ serial_7: serial@105f0000 {
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
@@ -475,6 +740,21 @@ usi13: usi@106300c0 {
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
@@ -490,6 +770,35 @@ serial_15: serial@10630000 {
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
@@ -502,6 +811,21 @@ usi14: usi@106500c0 {
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
@@ -517,6 +841,35 @@ serial_16: serial@10650000 {
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
@@ -529,6 +882,21 @@ usi15: usi@106700c0 {
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
@@ -544,6 +912,35 @@ serial_17: serial@10670000 {
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
@@ -607,6 +1004,21 @@ usi6: usi@108a00c0 {
 			samsung,sysreg = <&sysreg_peric1 0x1018>;
 			status = "disabled";
 
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
@@ -622,6 +1034,35 @@ serial_8: serial@108a0000 {
 			};
 		};
 
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
@@ -634,6 +1075,21 @@ usi7: usi@108c00c0 {
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
@@ -649,6 +1105,35 @@ serial_9: serial@108c0000 {
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
@@ -661,6 +1146,21 @@ usi8: usi@108e00c0 {
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
@@ -676,6 +1176,35 @@ serial_10: serial@108e0000 {
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
@@ -688,6 +1217,21 @@ usi9: usi@109000c0 {
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
@@ -703,6 +1247,35 @@ serial_11: serial@10900000 {
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
@@ -715,6 +1288,21 @@ usi10: usi@109200c0 {
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
@@ -730,6 +1318,35 @@ serial_12: serial@10920000 {
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
@@ -742,6 +1359,21 @@ usi11: usi@109400c0 {
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
@@ -757,6 +1389,35 @@ serial_13: serial@10940000 {
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
@@ -769,6 +1430,21 @@ usi12: usi@109c00c0 {
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
@@ -784,6 +1460,35 @@ serial_14: serial@109c0000 {
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
@@ -796,6 +1501,21 @@ usi16: usi@109600c0 {
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
@@ -811,6 +1531,35 @@ serial_18: serial@10960000 {
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
@@ -823,6 +1572,21 @@ usi17: usi@109900c0 {
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
@@ -838,6 +1602,35 @@ serial_19: serial@10990000 {
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
@@ -850,6 +1643,21 @@ usi18: usi@109e00c0 {
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
@@ -865,6 +1673,35 @@ serial_20: serial@109e0000 {
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


