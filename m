Return-Path: <linux-i2c+bounces-11340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C10AD39D7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 239913AD5BA
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B48C2C17AD;
	Tue, 10 Jun 2025 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knYX0yZN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A7A2C178E;
	Tue, 10 Jun 2025 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563175; cv=none; b=HF8J5DhIhzW8Wn3dhVvTyHVShFryPJwF1CGfYzTpINMsvfrggtjKsF3C3RW3BZun3B4KdnARgIe/NcHS/U9iG4cJ78Qh15zq2eKKUsUdYoxNUJcC1d2c+XHnpadfQZDkOeEPkEzU3hM3hjVvrRQ3txOO4SI/6+lJ7Xpnn/Hlxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563175; c=relaxed/simple;
	bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNhM8JWAgvMQ4Uxgr0r36i3nidxDdu4kkpFlQfNT9y3r15+NFKAo3uA9IXLCna4o2JV2BIdzM1zYHDCBCpk4BJA3bfAba9JkyQh4dmW5JuFtYlGJCW0fP/ixYI4GRebrmTnYjL3hW36PSRxCcWhu6jAVt54/L3lkx3juzL9vowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knYX0yZN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5033150a12.0;
        Tue, 10 Jun 2025 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563173; x=1750167973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=knYX0yZN2/Ku9tjFpy4XcXZn/JCgzcO2a6CT7+bHPHH4K/+C1/lRERJVwQuWFOLcr/
         AhpqXvuF6I4lT5OL6FzWvJWW7rBkjyl+NYw9EUrwdHW4aroCkA29Rfx3yEn6os5enc8a
         79WjqIBHrRgFFqR11Pomq1QN0FUa7N9s4M939K1QPVJKOTL94DfkLMR9vOd0GBkApZSj
         iU8/W0D5iCqOzws2Lik/9+jdopyb6SEI2gp4PKRg1sAcb0FaoN+8b8zzIbSxUIxVE/0X
         qMONlsVGjXuUZumB2JfsTY1wtiqvcU+ZtEz+d99AUa5UIhD9PjlY3jOZD4oUe0/8HF/T
         DQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563173; x=1750167973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=SA1ywecM0U4tscBUNwRbm5Vg3F1oUMrj5CtgyI/JFMHoqwP1CnSR+LAqGBDB4xpSsD
         yzEhS1E37AmbYgxCllH2kYmoRAU32RjwnEtITXk20wpAOJ7npY8g6+pjLrpcyBLTdbkE
         gV44RgOcbxATxm6Vof+JyQq378PTGVC/MoNgmldkbLTea+HPU5pUJzZ2cQxYk8AtYonZ
         yj6NQS9pKaLe+BRGDI37gCGPXBULyS6/m9LyeH1ak4FEqi6JUuFWpc5WjQngr1+LxmeF
         Y/3Wr4x2FAuUn6PiodgyR4LmK/w0B75A4pcBaxm2En3EDDDvpb/CfVPR8jcmFMz86g2y
         VUrg==
X-Forwarded-Encrypted: i=1; AJvYcCV3BqvygHrHWIz1xAsLTY5Tt3VjpUAf2l5EAg06ZmN5ce1X4wHcBfbl81WHwKMMoBUNGlF5Phj8MgtZk9U4@vger.kernel.org, AJvYcCXDbTbhQLfrnMh3xHMlzTpwCGP2oBrJrY0Q4k2nYBifugiXfysOofVsBYtLWeHNJvf7xkgHgGsiLecp@vger.kernel.org, AJvYcCXJ0NatEdeVz3RNVGTDOEv/Kquycw+pR7KpHyMJNEJIbtvjvVyVNCs1iYz/D9AnOpp7R6W9PnH/rQyh@vger.kernel.org
X-Gm-Message-State: AOJu0YytzwtbPec6qTpSLZxyPrQPo57JtjuwCIi2s7UNYfT6T2Q4NJKI
	+IOtXyAdY6DGYR8vi75CW3n+wpx5r5pAlK0I/vpbITsULBz52noI6FZr
X-Gm-Gg: ASbGncuM0nK5aL49HoY3rrdqTkVa+SOtoqc3u1VcToIIyvnZ9tKnqF951kXI3VVHwAm
	Oqx1Bh1KZ6P6Q+dD4BKwX4yqBDTg+gUA1+hCHxQrjBVn4C16djOlVvBIKfwHRUKJMU63slfmrGp
	z/awk8+WTTWNZdENT2c8SFSdGJgbRrsgS7Cwy8ItobqajfZOVkYiqDmSHynT+8Qu/wh/mr/MJS1
	bN7gnjzaF4ZDcgIWwOsrW2wGy0z9oBerX3Lq3712ahzOSy5WwBxgrQJ/PEf6BWBkCy1wael9HM7
	tLuIEnfZG9J3u7NmZBhzn9ZW4ZfCLxBY4mQVmbfYFuGa0hYHZvYA/277/lQLMqFF
X-Google-Smtp-Source: AGHT+IGWLnHsznkJ/Da/EQnD3kporOvoVzQzAShfY9FI0ZIFQMZIr+5VR8cBdQf/AsoVqaF8p64zzQ==
X-Received: by 2002:a17:90b:1646:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-313472eb280mr24147530a91.8.1749563173273;
        Tue, 10 Jun 2025 06:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:25 +0800
Subject: [PATCH v2 6/9] arm64: dts: apple: s8001: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-6-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMUl2/apVzAT/V/KkKkeb6CQjlyBAid7HYa
 M99AEPEte+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JGMrEACVFL6WIOESUBESHHupcLhxC37GYnackPUmK1c3JVn74JsDd4FZOTvqH9l/z/I15UWLS2G
 DXc6QT0Zhlh5Q127sMKncN3SgyYxoYEhtuBzr8DZNdTgUOu06rggIC/s/rrT7vBOLpFbf4WNN7G
 f61RjdR7OU2lYvyIp1h8NpoxmqMYhe9BCbIf7044KRaHWnGY/fJe5yNxbLi0UUbVPzi6AJmszcM
 0KCYyJkFWR5p2z/CJHMWJTYOc39SOk/I4zqLCYPjDU1y5beBohG4fbZqAKUq81SToOlqvbW082y
 iG13lNqMyRnLZLMukmZB8Ko8uvWKL/xzwxRQTyN54aPx03+qOQ6ccV2UHKj8SxNoNlhbHRelkJk
 Fb2N+g/Atl/U9wY4pC2bmD3jQtbrRY4Aed8Fr2Lq2BbGD23ZwHvpIKEiAMvKYd4YIyazQH4d1Ep
 RRC0CZOGCFGCt32VG3i+Jx8MCWNS6OzU9GRVRE+GbUcNxYwVX+/wWQVfJen1IWGijaFigdozcUc
 cGEiycJ742rkbUen+z3iQZrMcjMujFqDh95NK/Hq2kII4rBz45TowZDzIYZ1oMr+8hIJKvRWJB/
 J65N/tZq5Gd2Hnf0yymVCjwBwFPM+usFe+9r/kLSBTFjlz6WPh1B5iKemTEDR/1uJUygrtA63bZ
 zbMai8ah9rXRDJA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..b5b00dca6ffa4caa1d504860693da001a8ced80e 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -137,6 +137,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 234 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 235 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -173,6 +229,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(165, 1)>,
+					 <APPLE_PINMUX(164, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(178, 1)>,
+					 <APPLE_PINMUX(177, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(131, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


