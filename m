Return-Path: <linux-i2c+bounces-11295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A178AD2189
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1DB16B1BB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCC21F3BB0;
	Mon,  9 Jun 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkDKeudg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E019D093;
	Mon,  9 Jun 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481116; cv=none; b=UPFblt9hnzav33vVXipTvq4kPDudkYxN0tXLTjkTYmfcR/RHWpcZYe8Ojzd8YUNEz0NvqjLRjjt91jtZNwFfZR2B5uHr16wDUV9+wSyi8BM8stGQg6jA4RQIwkO5BAdmPeCCGUeJwvmIzyQzb5fGmn3mOrFubXGTL0AXwX2sn2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481116; c=relaxed/simple;
	bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clypSDLt6p+Hz7W8PdQn95rfyTF8YNEWrn8SSaudhCBQ+EGrZI/7d9r38GXgVmQ1oYT7MWzourR+gW6tAo+lHqx8Ek4duLoQj0deVNcBxXn0r3FklRzJ+05DhTVlSbm5vsEK3CI582mj6yllLP5Uc4g7tABqGvMDFiz+tGnZv4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkDKeudg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso3348495b3a.3;
        Mon, 09 Jun 2025 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481114; x=1750085914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=mkDKeudg62cr4mtE6DwnVJb2M//DuOYHBxOFM7NLV6V7hBh1aDz6DOcpuBoiOIKaSk
         JjehnoIbMs2eXW1cj9PSXRU+ceYbmzZAzaum6l6oTmqIt+UhEuzb/P1fDYME/64E1maS
         jEii248oTTNuq0kJ8gRa9IgS1EYTlD+qAaqFNGBkfaTizRHP/NWUj1HpOM5Du4jMTYj/
         tAbZyRXk7pcWrq1GDkrFMZ6F61XgKeG5NyZPpeLdNaJIHmCUIRfFRHlB4xEUJI5gr+tI
         H2KCW7FWcEwM1XKhQbMaW+NhizaJIp0xlgxeB1ZInFMQz9HnB57ukWGmm9TyTSvGoEOw
         y18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481114; x=1750085914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=RSmxvvBLk4htZ/rWeOTKChouYH1YCSFc3Y3JMbDxKdOtqS/5ARDZiVKE7hhp4+xjpR
         nbE6FjjxAPvzYXObG+4YxTDZWFhAC12/4BOB4k65hyqZ7SCGvdO58oma1FzQmapm4+Dt
         dEpJlABnF9CZ7eD9JP/pZYd44aH+iNBXeLCIE4kFKA4U7rG2OCYNPoNN7qQA2pjq+AEp
         ji4jUQobkWuVsKER1XSCNn2U2wSYiHJ/o3wNqmYTz6RUNmRt/lguui9X/h8y8pWUZmF8
         pgeYAWObplnd3g+JEGaLDQKzQeDxZBA6XS6cuwuTgYkMC5OA7IBmdXYqcuztAfo+x1ii
         kPRw==
X-Forwarded-Encrypted: i=1; AJvYcCVjhY3gDAJgMgzCpDtZVZElO2LMm6p9J3W+D4exyl1OLhZUrNa9WcpVplrFSgSPPaitcMB+CPAW/hFw@vger.kernel.org, AJvYcCXIBtRsDHFXo3hTYgHmvmgj/AedBIe7gekQkQEF8tRIY4ENHJrANXqFdglFaUqF9ttNo09qlrXGvdU0@vger.kernel.org, AJvYcCXcPfG0lIBb1vdzjIV1hWASzyUwLATlWxsm5IQBkoD3fXuDb/baDpovJucbTByLsehDYckh6TaxEMfQL+eE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyk7Ngz+5lTRtaSKVBVnI9fsWsTWp5/bP0Ppz3d1HwCy7BcZ5Y
	i9pf8blcDxHyWdQ0kMzQfq2ZGw+iNRunnXjONfeRVEVkKjzzAuOWfEWt
X-Gm-Gg: ASbGncsfaVn+8DaAk++CcIXuaB5ymPC2H3wPKzzu+CPUUMOfd5vYhssrqVMFdbLgHtV
	WjPTL0bgPE2Pbq4p8rXztVxJwrgJ9cdN4FPKb2TZsPAroQtqAhLpTJjqwAeYr7/ZwVFX3FZ9irD
	0Ke+7Sik95RnbQqVj/qukBtlI8QSFJqkUrIxZ0AN8wSkS9KgXAALADnP9v88WdWGL7P93v/kvn3
	u/OomgIfXTuRLyDijTrW4bqzJIWKaf7Gha6ZR5yP4cRN4JIC1zQrIuHbgKJeojiUEgN9H0tlOj5
	fEYh0cGkcZVPiatqvgIFN+LVsPw/PsLRpPXY9YkCDgv8BjgxD6xBsQ==
X-Google-Smtp-Source: AGHT+IE/bBsxb7SPwbV3RX+Q5/pzcK/F12ikZ+jKXpsOAEfLLD6uUBuxfP/CDuynUXh9qOEUNBQY9w==
X-Received: by 2002:a05:6a21:5006:b0:21f:508b:1a19 with SMTP id adf61e73a8af0-21f508b265bmr6728364637.14.1749481114166;
        Mon, 09 Jun 2025 07:58:34 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:20 +0800
Subject: [PATCH 3/8] arm64: dts: apple: t7001: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-3-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNrcrqpm0qmk6SFSpUNKyMHMKjxtl25i/nU
 wtZy/y6iE6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JAqGD/0TpzVdEq1RtU0+WgCAT4uKrnvpB31OMBsrOfdJgcJWX6PsBelC0wCB2F/UROMYKoEvVmQ
 9lShNr3OG/MBbCl4DI+1i8vk8+I9I68IhXGVODrzc4joX3IXB4f9zexc5V3vOlz/dTAQdssjl+U
 QmQvoDe3tNK/uyA4KfL+FACYIHOziC+EtAimW9ERtA5Syj6KLjDhLk1FdZ9eZ9s+5YiRnZ/DzhE
 OZfw2OEBxYk0XkYy150VWFhS82cZ2wv9+PQg35Qx+8kd9jp97umQWd/0KvPFAuVq6DkWCn9YAuE
 lWQlQ0TNsGujXuaF32PchZaeh+VpJcwoNGcdvT92kgIZwFiEP2MCeliPU1GhW0Pz9WCf8bH/GIK
 iLi7xJFV/UpzLIBoDvz2Q0cfzpND002EvcerNr8VK8ZpezEMu/PN3eZ/ydnCJXnpHB4ICM0diBT
 Qu4pdp0+i6eTF4fU7ClzifxtZg1mN59psOjzwB4ptlIspjItRdZul73hcSheM/lmjamDLnxaAMw
 f4xtDGsb8655LmcGvT28g1aUy6kGGiGSb6IdF8OVqKqfU5S+/1SZx/aI83iyjwYmBP+29D7tNl/
 6aTr/ht11oAdo9NUGBQ/2XlU7VUYx1Px/Wm4iB/X2vq0QkY+rEp0Z5QW8dDZBXyPr5VCezjEcjl
 rCmDiwKcxfxTGWg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..e1afb05423698223ebc15f2ae347e73fb46c7c24 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -144,6 +144,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 174 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 175 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 176 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 177 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -188,6 +244,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(38, 1)>,
+					 <APPLE_PINMUX(37, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(66, 1)>,
+					 <APPLE_PINMUX(65, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(133, 1)>,
+					 <APPLE_PINMUX(132, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(135, 1)>,
+					 <APPLE_PINMUX(134, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0


