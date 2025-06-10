Return-Path: <linux-i2c+bounces-11341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9ACAD39DF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18B27189C761
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35B42D027F;
	Tue, 10 Jun 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ4PXohp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319629B78E;
	Tue, 10 Jun 2025 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563178; cv=none; b=jfFD+hxyzdvWUDqjEZoJ+2JmNn3qOhyu7DNylYCS1CQDIByQwgyHOyb+i/mHSI9I3M6gytaZK1fZwy7yd1g4174tzIhZHde3CV3Hd7w3B22ex/736ma2L/u1P+cxsrOlhFqvreZtCeqWwB7lMDyNvaXkKaGVlvGeei1DfE3Snmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563178; c=relaxed/simple;
	bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYg5ZCMIuXyziX50keFXKlWb1ufv/X5R32v+XLVL5ny+T+6ii0XHaNNkTH3JVzIzH5WIhj2KeZhzHSl+3CsaeFTVrPGHku5zy6rLrHmVxK3dgkjGsm4e6GsSY9eIe5pQbpiMjYunSFqi/K1afdn3wks5w7W8bmWtPweN2oKH1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ4PXohp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4272067a91.0;
        Tue, 10 Jun 2025 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563176; x=1750167976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=NQ4PXohpKm6YKh4pHWt6VSAZ6/xFIli6lzoIAWTKUkVUUj0Uy73IVlTw9ZJU/Dmj3C
         y84tq8vUxhVUK/GMALoBlGypMQoxf1xuyPmDXCwUMiJdIwLRXCZOiva7srXV/F+NckXs
         iVDr6kkRRVtVwlN3sdRpJJTZuPga6ddx5tFennKmCicHvhHQGxSHdLQFhocQfxubPsw7
         lwD4gNAWXzY1gu8MrisYFWjRiQTXPT7gDEghqANLnAkISDUe37SzbLyO+baNC4opsxcx
         xhSf9n+K9BVy6b/yJfNEgnZV8X2HWgSIHfTHEb+qyCi6wOL11K/bBZIWyBtTQpR/bWDF
         8+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563176; x=1750167976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=iGRhXJzLK32S+yUsWUIYG7b0tXcRaBj6u2ZrsGdOhUZfcOa5Fd3haF86NNv866gujz
         qNX/4sS7VsksGjDpn/jAI1hX1AvVfEBCFgVV3Tok30daPVwQx1NWORkfdR45h6/wmhnr
         wE3Dy4B3JbPx60GQfXvpdF8HOeugJ1oFW9McGRJH5IZ4tyBoDxvAbLSS+uQsvtEYLogZ
         WvPoutXo3p2SGGAHpOxI05NuMikHH5BnBpaiUInRmHYhRdjhLgiQbxoqJw6PtxmlJAO7
         xXQDBrbxjJWpF8e46ywzzctH4XZ4XijuG4uKkvxF0YQN1DtCFWIRGryaevFqv+Hs+fOL
         leqg==
X-Forwarded-Encrypted: i=1; AJvYcCUt16G5JnswSM9sMmTg0enXbw0fmmb+m2lMNlWK1A9REHw0sNtX0x+xG/vv5fFWYtwtSeKGQ601cEqf@vger.kernel.org, AJvYcCV0Ksn4uW+vaRkzrpHUnPjlqfAgtswNdfIt3bmhtWZZL13WC1i8k6dE4GrcrYPphQZ3mOqKjrSMNSih@vger.kernel.org, AJvYcCW7oNfxoq+K7KUPPeYQ7y/bfluZBjTUuD3FphPYCjjHDiFcFym1FYG2eOLPEDXeD0h1Kudp+Uik7d/6fBMT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaro3oSzTR68iICmHDM00ZQfpb//D7sNzG745GepfRYgalp51+
	S4I2KoJuU2cpUcjE4+0O3fqYvidMS3q1LbMoaKArQSNQVTYUT5b2GPgW
X-Gm-Gg: ASbGnct2wKMZmeMxYM2n7M2BnC3zpdy5vPj40zDJ03hU8SYHDOg8F7wpLUZ7eiFp97u
	3yc4iFpmamQ/2nO6rfjaEoalEhxAbuSE/8FQPGA87gCfERah+KGNN3rdo9I+pgcNxg6X0JuVqDQ
	3d9xB/U9fIPYeyU2qy1NqWyP48U4iY8mWj6kmArm/lsXG+iqTQskoT0Q6ClmNhyAUByJ3FCzBq6
	fkbx3lYmgrQOP+dzpwQbG7IdN+Y4zrz8I5aSCWnNR1B1fes+AW3V6KF8QxaF7IB1Nyaq4Os/2Qt
	vs4h7/nU/eECd2QRs4MOageVR1pJGljWE256QenbBx+rbJC4OlU3Qc3J0LAjfQTw
X-Google-Smtp-Source: AGHT+IGKpN090KCfuM4mnhhtjjx4+d+Tq5NKBbKuG74j3lXwde35ZZB9mrUEoykhE/YnRjDMBlrFhA==
X-Received: by 2002:a17:90b:3a8b:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-3134740f5d7mr23396206a91.20.1749563176255;
        Tue, 10 Jun 2025 06:46:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:26 +0800
Subject: [PATCH v2 7/9] arm64: dts: apple: t8010: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-7-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMxLD7nGI22hDjQFxRWZzZu4ED+wy+20gi7
 nJY6d2bfzOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JKKMD/9l+BcRDkJlprO7jUu2w1Fwj8eZphRCaqzV3wsKr/1yirY4hNGGGR+eeO/YxQzVFUnqflQ
 i+23tkqqCBpqHg1tNuzu0Vgo8i0XDERjD7kXajgAjL1VsqJ6w77wdeNfhdRN3wFswvBA2OMu/T8
 SRbxydQHragP2ndPYLt7xhSizJ1h1CTxbALWvr3lPZoAgXOs/oPL4UqwzgpUZI87O5eRwKpDCZc
 WutOcvVMWnThfRDW4DkbkEA4qw5aOHsDkGnSwDsXCr3LwR+WwnjfVU44xigY4lravtsJXOdSLm+
 M4gD7OZhgEa2QpRDz5E/Wtwlj8bMOSlQfcLmeyB+arHes9WDKyB+QcFuEIStT7WpDZJCSG8wP39
 T8fjv/K4NEz68N8OylVP3BB4oOWru6+t79WdaK/GYSPAkp5iWk7MxUhg2bJp14zqPEQpX63RHcQ
 4ex7hzDgy8m89C74seoPbKqUtKVtk7+3mBDzoWKmk8qkL3s3jQgHSo3MXZyC3LMthIj/LVcKY4a
 039WbOeaQ2RiNEZebCdLhOZ5UcDF6mbbG9I0lRl2ExHyzIm3N54+Q6Gl9DVLtBiulPPfrK9pQlC
 FFaNvYZ+AxZgPABzpUwDJ8jwqeLj+ElYK2k2dcBbbmSFffc4pk3KFP2piuLohlDHG8RdMDKcKzt
 vMNdfj5xoWXtPjA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..522b3896aa87eb290dc831cbbf2cc8e593844097 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -164,6 +164,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -207,6 +263,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(197, 1)>,
+					 <APPLE_PINMUX(196, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(40, 1)>,
+					 <APPLE_PINMUX(39, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(133, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(41, 1)>,
+					 <APPLE_PINMUX(42, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


