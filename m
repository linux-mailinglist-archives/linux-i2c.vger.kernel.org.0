Return-Path: <linux-i2c+bounces-11298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA3AD2193
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC063AEE95
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 14:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38AF20CCD0;
	Mon,  9 Jun 2025 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx0Ug/ex"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACFD20F093;
	Mon,  9 Jun 2025 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481126; cv=none; b=U5ti4eZK/+rTW+WKYrvlnH8qoiiRACFiZuaOe/f6t3hvp5n2oKDRaHlsh7DTO6jeNV1/cbKcYDBXUvMQ9O5GTxCDsKKPwCJp/EtZSbuMZQINXDkob9HIHKwGY7CqpLfn6YtEindrksqEpzd9LZn14AMmBIPF3jyw+jNhHrfHj8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481126; c=relaxed/simple;
	bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3hlzonG5pFJuSShiCMabMCxcjF+eKSMunWREv1plxdWxdgqw3VFj5+Kkmw9qFpwGYz1TeQ4Uwvg4Ot2vc5Bh1j2JCU5b4bTfkWXzpIcNirg/5nHkNkufCqBU3EhWoYsopHvq3YOkZOExArEduGH8MON+G6iTIvWsiRnssCw4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx0Ug/ex; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747fc7506d4so4197006b3a.0;
        Mon, 09 Jun 2025 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481123; x=1750085923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=Nx0Ug/ex4N7kBiVnYGn5DIBEYa12UZCQSWWEUdXGIcOiZDWqU2DObX7VYe5lNmG9Pl
         ZJ5jY4Lr10sSbMcxVux2VlhD4cf+Y7ZUkmQTSyyEvB7sI9ddSRz6G/CCoEfSNOt3FOvG
         R4x4t6SWEPO8+WrhvU4mUleQjsSySm5xg9gzbINPQkFrxeJrrkNFjPenk2vMaRhwq17J
         JBe+HhAkItQJTwiaR1ZLeWq8cLao5PrV778Gm0bvTypsw8a51sFx21h3lW1t58NMhLfp
         SYX2jqX6AkaPksTE8RPBoMrnpo2tQJ1QSDy1Cg1coaeL1s6nCl0oW07NHCz9DGrwxA+x
         v5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481123; x=1750085923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=jqGebUkABiLpp+BjoNagMAlYb7EjLBP3EyhJrWPdIUxlIYjUs//kOzrJDNRBoRibKm
         GwHFPKaCodBxFcxCAZ+J+N41khpjpHKYvkg5Zuvnak1zrQ6nu/7v8sk2xV7ElTzt0a/V
         ENK2m1Sn5ADVQg+LsX4ZsTkUXJ15B3V3UUKMe7AlBkFHJoPajH9fKbEzM21NLrnKAiit
         aOV5hQX/mjNf8a5EpL2ArFhxjp/BY4rR86dAW0xH/VdryDeXERNkFHXy7/+9dQ9vkF2R
         WzyTQephl73eHv0HONjkyd7GgkYQelmh0mebWigIr/vUXSq6htcXsGY5SwIBjevUmCmn
         ewUw==
X-Forwarded-Encrypted: i=1; AJvYcCU83kCHeqxo3FPNyIkE32vw6Qlju2aclHtWKXZnhNQnzwtbDJybnqSckXbZo75giKg9IhSsdOa1IXDUNNXG@vger.kernel.org, AJvYcCXpwURb9QkCEc/OtEySh+JltIS1ZSsBIuzuLb8s1/VXHjXviEI3wkS74hA/9ZjcfESgKz0Bs+ZvOixU@vger.kernel.org, AJvYcCXzbS6nevJj3Tf6QrO1z6ef2cfQpv3muUStz/nN9oaA2lgQMUwsSAgO9YWxr+8nSDlL5vo1Rx5H19dm@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTGVz9O2x/Z56aP2pN4Pfd9Mv41F5Q/QIAk5DioC69E9qIwlQ
	PVWjNfsjzd7IgDCHU6oChhkTUTk0YESAzGSanY+uHei3d8mPZJnefnJl
X-Gm-Gg: ASbGncuPcNQUpnILWWqqgyOq2Q2clj+UDFkpaGpXlhHWJPDeliVoOuf5hXKwXXYRjs3
	PxlJ/WhBU7vp/69lPWJ/zsBmqwxhWwEdY+VgYDyoTPaKehahbVuDLoa/RXj5lhYEni/lXuM8aJs
	sn7u0oSiL+G107GssAPWUVdRFqnc9v0MUcaf9+EOXqTF9WkZm1aVmmv2QRnhwkcMEqTq3kOYCEs
	AJGrYZFR5qo29UURvTaLEs7LR+bAl97nK3tC+eHi/s9IetFW04Hlz9L4p5StB1LGUQaxlf0oSPX
	Pflh8ZLK6i9fljTiHzJUP2gzRgF9Z22Q7kEMEPKcx3shRuLryszRcw==
X-Google-Smtp-Source: AGHT+IF9V5FoejTbOfgTUjSh5U20o43Ptpx1VS9a00C7Lf/+wYzzpDCkG5fAahS0c0GV/Yg0u8lHAg==
X-Received: by 2002:a05:6a21:101:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-21ee2547255mr20009310637.24.1749481123353;
        Mon, 09 Jun 2025 07:58:43 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:42 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:23 +0800
Subject: [PATCH 6/8] arm64: dts: apple: t8010: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-6-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNS/y4iX29gS3aAIlLuS58cEiUPGQP/jsex
 Np4+5wNe8mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JPk5EACXhE3ns6xwOWxDALCCu/HydSPQI+SziopTrLwhkoVky5weah2oRrnhihfhVziC3xdrI+z
 IJa9shSE5S7AfojRmc9fe8s26gbaScIHHSl6ZqbhBr/kbVSv4fmJweUfCukJEka0iKqN04zTZYD
 iDcoeGgS4Ctjj7iNEmvQQGoMuPPCaUR87OsIthu+17z42Gl5pZZQqsvZWLrw7tNAbMuRHmsgb5D
 FxM56no1fDTBY2DIE7ht5pqtRbOUtDWUfgOWFRNZRATQciuh369b+CDmh7r5OeeC/77qtP4PzBD
 +SzeU4xpi4Qpxq7Gdx1CCETXYNImqBGvp0FZ1ljmPDTCdc/fxW0dPZIoz6ue8sgI3sWYd6TmbJz
 9hN88ksYTIOd+g9u8IkrPT3euuVJScc7Ewj0YYMy97dDt78TJDchZEb+vPok4pnGdjlRhDeSGaC
 Ad930c9tauNNaRoOgQZc8Zz5E5Myt8t7Eut7xJKXxzUx8M44nvl/LHScUyZ3mU+aNKqknYrtrRo
 b4nerPh+OnZbncrFhuPSaOdkqDtPCbIojtsyqWbPHkliRdfcWee/wWcP29+YdL2xmTgQbbZORt2
 spOZs9LzNyDnRqwjbXF8I8O8QdM6Fz9q3jG7gZtMVpi/39xN+ZqUmmDC7sauCcctLjqkHBt6ZFQ
 KvfxcS+KuzlpZAA==
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


