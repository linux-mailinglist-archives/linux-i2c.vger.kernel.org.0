Return-Path: <linux-i2c+bounces-13036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC9B81E1C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 23:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9AC1C8121E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 21:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656582FE05C;
	Wed, 17 Sep 2025 21:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cf5YG4iv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB542F549C
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143074; cv=none; b=V0kmkahEXKqZS2CQhhoXH+BwbWAPVra9mG4PaoUq0XR64t6LDMyto9E9x4uFoA+eoxsIOm/PmooJpT/JnFKNr1ex7r9fmoVle/eLZcvtpOsv5ZfCU+xUgJWg3j4BbYbZz242lqMc39wduCHPAeGc+p+ATRvpf628w1kfMi6v41o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143074; c=relaxed/simple;
	bh=DBBt0vuoZHxkg10PT7Lp8HKgoYQtduGWj6/5hVjFlpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5L+OIVj+aegZtQBTYznkBaWFx5d3PybTGObvVBib+uE4Ez1BlI34g8iCfGPUJjWR+AfS+AmCWewZmUEat9fbUhJiXPdQtern183nItXEwkrUkhyyt19QoXVJ5+RFkZCXjHtZQgiK6EI5euGcWeufRsFleDuDDxCrjv9PStTP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cf5YG4iv; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-791875a9071so2650836d6.1
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143068; x=1758747868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQX0UUcIOK9k+xemWkc1SzufitgRGlOwmabivWC9y8g=;
        b=cf5YG4iv4YMas9Ro3TzF+Azqgthnt03u8YPSM9QP7dnL9gL2jY/HMxNwmZUR9Cbl7u
         mWLGI5VpwgNVKREfoOH1cafmtHWqOpH1QDmABU28o+7fYpnpj/HqtxYRjFdhf7sDwQGo
         ek7FXEWELgoTEBcOwZgc6jt9phFzJ7oDDvozSBhAAZmInHLwxFEsBXqFn6ke9uh3WbPe
         ucKkuIfF9P5L+1dj0le5DtPnTbBpWv1hVfbCNMJaY0ktH3JtH1IvH3+nBgGlqjXFhHyP
         iomQ2rb5GlMjj4nZpM9P8Uj1mR3UACvjp9XbyBU6Sn0kn9lbPgSznhGfb78vUB+94HwC
         jgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143068; x=1758747868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQX0UUcIOK9k+xemWkc1SzufitgRGlOwmabivWC9y8g=;
        b=chtSRtnBEsqvQG3QRWZMgGjznhacJsPIsjdZR3B+JaoYSfUf8FQ4W8Oyybv+fldCJC
         nzJ69gbVWLRU4pr6bMHYXXifL1abWayVkyyBx6hUo47g0utxvhZUZZkJb1Gcca9bFbym
         Ktm/y/M5uD3EAXN4lhjgy+sF/TuD1hNerqLuFBJplSfnGxMM2wU2HKB56BanrA4dpFaN
         iT4gMM1shex6TUXPwfGfFDV5iID81ZdaJnWOCIA/u8xzJMJ84QbZcoM/PxG5RlEhA9Ni
         QaYVUy4eHfdWCA/xsLqRYw2fD3EPBnSqYLgkqJXFue/dc/zHLT80QYjv4Soyzo6JEDUC
         kNdA==
X-Forwarded-Encrypted: i=1; AJvYcCULgZC3K2gTzN0IzaMMnwuH0IfVvczrrKUe2py40cwnqgkghxg635cUXc6fZXBsF11nW+w6DKDQuV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEmIm/aMm24YQMO9GZ06hXcIC1kcKCNbodcjrKbC74Uxj8nzH+
	ePTL4nASmXV4QI0i7kLglAC0PgmKHh0tZ8O3J3u5bcBYY+TSDFge2DqgGV9p7g==
X-Gm-Gg: ASbGncsd0WgnrqzvDINEvH6PIQXEyGdwBOp56IU/cuqbVenHqTuJpPlwoWEucqnRTMM
	LICpgHYuqti5ivC84TTCY7jV0tDhBJ5eScGnfYzDIINEpBG0d5Mu5p9sRotZ8BP+zX7mvXnuGXO
	JhC9SeCTOa3Sf9CmUv0cTYg6++mPNUZNCxPVLU2Bg8tNeP5PeuFY3ZDOrKmfR27kMUK0NJKlcxC
	IZ88yajo8s6D5hQE6eeLJfWPIhS7pDKn6nGRyeH6zURZW2y7hEElUSST0vLVrpZ8/4yKEc/B40T
	d/15ygpeAruUe2ZwYSSS91Z7k0FrmzZ4eIQBtOt1oYQdwD3UwYsMdLCUr8Fk7327mTDIwuEGJ7W
	VUcAtHSmXgZrQZU/BQZSsvtaOBeb/i3j7dcQ9OMicbaCG
X-Google-Smtp-Source: AGHT+IEhC3q7xzmfM343xmFRP2fZFJRRIgfQfV5o0GOJZ+TSx3CU8W02tPfv0/0RaECBSnyDYt3/ng==
X-Received: by 2002:ad4:4ee2:0:b0:783:aeed:f58f with SMTP id 6a1803df08f44-78ecc62904emr40760056d6.12.1758143068390;
        Wed, 17 Sep 2025 14:04:28 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:26 +0000
Subject: [PATCH v3 6/7] arm64: dts: exynos990: Add UART nodes for PERIC0/1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-6-a3629e4666ef@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=16400;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=DBBt0vuoZHxkg10PT7Lp8HKgoYQtduGWj6/5hVjFlpA=;
 b=mdduh2kK9o0j59gybqrKdSRfW24iRU1IakD37/4RbOpUCXCU/QSpUd78VSL8IwyYoZXt9eJMT
 iTDSzzVZ/n3ACHbvMbdi6bwXygh8kUHzUmJFylvJ32mqyLbx7iIrmAh
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add UART serial nodes for the PERIC0 and PERIC1 blocks.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 323 ++++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 1e09f3efe685748789ffd346cd914f9a8ba68f8b..8ed534d738ec58873dfba9d5cc46c358c4f6e647 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,exynos-usi.h>
 
 / {
 	compatible = "samsung,exynos990";
@@ -272,6 +273,34 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi_uart: usi@105400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1000>;
+			samsung,mode = <USI_MODE_UART>;
+			status = "disabled";
+
+			serial_0: serial@10540000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10540000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart0_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
 		usi0: usi@105500c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105500c0 0x20>;
@@ -283,6 +312,20 @@ usi0: usi@105500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1004>;
 			status = "disabled";
+
+			serial_2: serial@10550000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10550000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart2_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi1: usi@105700c0 {
@@ -296,6 +339,20 @@ usi1: usi@105700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x100c>;
 			status = "disabled";
+
+			serial_3: serial@10570000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10570000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart3_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi2: usi@105900c0 {
@@ -309,6 +366,20 @@ usi2: usi@105900c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1014>;
 			status = "disabled";
+
+			serial_4: serial@10590000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10590000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart4_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi3: usi@105b00c0 {
@@ -322,6 +393,20 @@ usi3: usi@105b00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
 			status = "disabled";
+
+			serial_5: serial@105b0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105b0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart5_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi4: usi@105d00c0 {
@@ -335,6 +420,20 @@ usi4: usi@105d00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1024>;
 			status = "disabled";
+
+			serial_6: serial@105d0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105d0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart6_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi5: usi@105f00c0 {
@@ -348,6 +447,20 @@ usi5: usi@105f00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x102c>;
 			status = "disabled";
+
+			serial_7: serial@105f0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105f0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart7_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi13: usi@106300c0 {
@@ -361,6 +474,20 @@ usi13: usi@106300c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x103c>;
 			status = "disabled";
+
+			serial_15: serial@10630000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10630000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart15_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi14: usi@106500c0 {
@@ -374,6 +501,20 @@ usi14: usi@106500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1044>;
 			status = "disabled";
+
+			serial_16: serial@10650000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10650000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart16_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi15: usi@106700c0 {
@@ -387,6 +528,20 @@ usi15: usi@106700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x104c>;
 			status = "disabled";
+
+			serial_17: serial@10670000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10670000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart17_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		cmu_peric1: clock-controller@10700000 {
@@ -412,6 +567,34 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi_bt_uart: usi@108400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1000>;
+			samsung,mode = <USI_MODE_UART>;
+			status = "disabled";
+
+			serial_1: serial@10840000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10840000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart1_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
 		usi6: usi@108a00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x108a00c0 0x20>;
@@ -423,6 +606,20 @@ usi6: usi@108a00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1018>;
 			status = "disabled";
+
+			serial_8: serial@108a0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108a0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart8_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi7: usi@108c00c0 {
@@ -436,6 +633,20 @@ usi7: usi@108c00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1020>;
 			status = "disabled";
+
+			serial_9: serial@108c0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108c0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart9_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi8: usi@108e00c0 {
@@ -449,6 +660,20 @@ usi8: usi@108e00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1028>;
 			status = "disabled";
+
+			serial_10: serial@108e0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108e0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart10_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi9: usi@109000c0 {
@@ -462,6 +687,20 @@ usi9: usi@109000c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1030>;
 			status = "disabled";
+
+			serial_11: serial@10900000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10900000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart11_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi10: usi@109200c0 {
@@ -475,6 +714,20 @@ usi10: usi@109200c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1038>;
 			status = "disabled";
+
+			serial_12: serial@10920000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10920000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart12_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi11: usi@109400c0 {
@@ -488,6 +741,20 @@ usi11: usi@109400c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1040>;
 			status = "disabled";
+
+			serial_13: serial@10940000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10940000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart13_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi12: usi@109c00c0 {
@@ -501,6 +768,20 @@ usi12: usi@109c00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x2000>;
 			status = "disabled";
+
+			serial_14: serial@109c0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x109c0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart14_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi16: usi@109600c0 {
@@ -514,6 +795,20 @@ usi16: usi@109600c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1048>;
 			status = "disabled";
+
+			serial_18: serial@10960000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10960000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart18_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi17: usi@109900c0 {
@@ -527,6 +822,20 @@ usi17: usi@109900c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1050>;
 			status = "disabled";
+
+			serial_19: serial@10990000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10990000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart19_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi18: usi@109e00c0 {
@@ -540,6 +849,20 @@ usi18: usi@109e00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x2008>;
 			status = "disabled";
+
+			serial_20: serial@109e0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x109e0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart20_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {

-- 
2.50.1


