Return-Path: <linux-i2c+bounces-13477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9846BD8F5D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 13:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0F354ED57C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ED03090CD;
	Tue, 14 Oct 2025 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vf1ulNZ/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236E304968
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760440503; cv=none; b=ptNMaxZCkSeIhtufp0JXYTZu1kbm8iGXDREx2EGCCyUf+x744rvtP6XolH8wT1ukiUwWeL/n8YNpd0d3J6Cd+CBf9ifxFmiFRbmj2++Tkj4HF9GmrSeLSYrruhOkMBweisMiQL2SxVx17hy2e2H6/blQs0I8ZxdCZ+dAVM8BZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760440503; c=relaxed/simple;
	bh=YQm3XMHkJGFN48dp7DYEZmbecngvhE/+Pyb2Z2dzK9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=CtTXUtGiYF8xhVgqWvB/E5d+0DImBvFBQG7K4PnqgjnCCKG3UON2+dQA4kNnhv06hqA4tKvOx0cA3ft3FByYsGU7gmsrZTkqKWcDj4a5frRHd4Msdk0q/wjNnEXjZN0To0mtO06LjFtHrDlt+TESY5LnLckQCJwE9KCKj0KK620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vf1ulNZ/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251014111457epoutp022345a8d1c9cece7c2894cbf28ff07dca~uV04nPigi0871408714epoutp02O
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 11:14:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251014111457epoutp022345a8d1c9cece7c2894cbf28ff07dca~uV04nPigi0871408714epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760440497;
	bh=TqdPTGHuB9yxZoPY0kPprKvlFaca+22qJjCv3cPpu+E=;
	h=From:To:Cc:Subject:Date:References:From;
	b=vf1ulNZ/2nJNf9AEgqOhVtoxeqDNbGGF/YIwKrbUQnupWbmrUZ+yXQcKZ4drnoNsl
	 vF/SBWgLv5+mxTr5yDVFly1QtcspjAgxj2U5Avfg5ChpJmJd2lCDokFa0jTIMQjciq
	 laLTQiOhkKE6JF+3TZdEFCDH85sU8KNu0guWzb7Y=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251014111456epcas5p32a835ccf2832264621d87e4a1c6ce2c8~uV04DtOgX1208712087epcas5p38;
	Tue, 14 Oct 2025 11:14:56 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cmBSv65PZz6B9mB; Tue, 14 Oct
	2025 11:14:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251014111455epcas5p30731028365023e101dad3b9ba1f90bec~uV02k9gUB1204812048epcas5p37;
	Tue, 14 Oct 2025 11:14:55 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251014111452epsmtip2e002cf689630da7417e4def8c36275f5~uV0zllyet0788807888epsmtip2x;
	Tue, 14 Oct 2025 11:14:51 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	pritam.sutar@samsung.com, Faraz Ata <faraz.ata@samsung.com>
Subject: [PATCH v2] arm64: dts: exynosautov920: Add DT node for all I2C
 ports
Date: Tue, 14 Oct 2025 16:53:38 +0530
Message-Id: <20251014112338.2023223-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251014111455epcas5p30731028365023e101dad3b9ba1f90bec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014111455epcas5p30731028365023e101dad3b9ba1f90bec
References: <CGME20251014111455epcas5p30731028365023e101dad3b9ba1f90bec@epcas5p3.samsung.com>

Universal Serial Interface (USI) supports three serial protocol
like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
Add i2c nodes for all the instances.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Changes in v2:
- Added link to bindings in change-log as pointed out by Krzysztof[1] 
- Link to bindings : https://lore.kernel.org/linux-samsung-soc/20250904072844.358759-1-faraz.ata@samsung.com/
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250905092452.1782227-1-faraz.ata@samsung.com/
- Reference: [1] https://lore.kernel.org/linux-samsung-soc/4a03bec1-34e2-444e-acb8-cae72dcbe6c2@kernel.org/

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 845 ++++++++++++++++++
 1 file changed, 845 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..53cf3f04cee0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -26,6 +26,42 @@ aliases {
 		pinctrl5 = &pinctrl_hsi2ufs;
 		pinctrl6 = &pinctrl_peric0;
 		pinctrl7 = &pinctrl_peric1;
+		i2c0 = &hsi2c_0;
+		i2c1 = &hsi2c_1;
+		i2c2 = &hsi2c_2;
+		i2c3 = &hsi2c_3;
+		i2c4 = &hsi2c_4;
+		i2c5 = &hsi2c_5;
+		i2c6 = &hsi2c_6;
+		i2c7 = &hsi2c_7;
+		i2c8 = &hsi2c_8;
+		i2c9 = &hsi2c_9;
+		i2c10 = &hsi2c_10;
+		i2c11 = &hsi2c_11;
+		i2c12 = &hsi2c_12;
+		i2c13 = &hsi2c_13;
+		i2c14 = &hsi2c_14;
+		i2c15 = &hsi2c_15;
+		i2c16 = &hsi2c_16;
+		i2c17 = &hsi2c_17;
+		i2c18 = &hsi2c_18;
+		i2c19 = &hsi2c_19;
+		i2c20 = &hsi2c_20;
+		i2c21 = &hsi2c_21;
+		i2c22 = &hsi2c_22;
+		i2c23 = &hsi2c_23;
+		i2c24 = &hsi2c_24;
+		i2c25 = &hsi2c_25;
+		i2c26 = &hsi2c_26;
+		i2c27 = &hsi2c_27;
+		i2c28 = &hsi2c_28;
+		i2c29 = &hsi2c_29;
+		i2c30 = &hsi2c_30;
+		i2c31 = &hsi2c_31;
+		i2c32 = &hsi2c_32;
+		i2c33 = &hsi2c_33;
+		i2c34 = &hsi2c_34;
+		i2c35 = &hsi2c_35;
 	};
 
 	arm-pmu {
@@ -475,6 +511,51 @@ spi_0: spi@10880000 {
 				fifo-depth = <256>;
 				status = "disabled";
 			};
+
+			hsi2c_0: i2c@10880000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10880000 0xc0>;
+				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c0_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_0: usi@108900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108900c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1004>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_1: i2c@10890000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10890000 0xc0>;
+				interrupts = <GIC_SPI 763 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c1_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_1: usi@108a00c0 {
@@ -524,6 +605,51 @@ spi_1: spi@108a0000 {
 				fifo-depth = <256>;
 				status = "disabled";
 			};
+
+			hsi2c_2: i2c@108a0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108a0000 0xc0>;
+				interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c2_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_1: usi@108b00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108b00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x100c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_3: i2c@108b0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108b0000 0xc0>;
+				interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c3_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_2: usi@108c00c0 {
@@ -573,6 +699,51 @@ spi_2: spi@108c0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_4: i2c@108c0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108c0000 0xc0>;
+				interrupts = <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c4_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_2: usi@108d00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108d00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1004>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_5: i2c@108d0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108d0000 0xc0>;
+				interrupts = <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c5_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_3: usi@108e00c0 {
@@ -622,6 +793,51 @@ spi_3: spi@108e0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_6: i2c@108e0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108e0000 0xc0>;
+				interrupts = <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c6_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_3: usi@108f00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108f00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x101c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_7: i2c@108f0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x108f0000 0xc0>;
+				interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c7_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_4: usi@109000c0 {
@@ -671,6 +887,51 @@ spi_4: spi@10900000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_8: i2c@10900000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c8_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_4: usi@109100c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1024>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_9: i2c@10910000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c9_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_5: usi@109200c0 {
@@ -720,6 +981,51 @@ spi_5: spi@10920000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_10: i2c@10920000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c10_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_5: usi@109300c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x102c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_11: i2c@10930000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c11_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_6: usi@109400c0 {
@@ -769,6 +1075,51 @@ spi_6: spi@10940000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_12: i2c@10940000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c12_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_6: usi@109500c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1034>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_13: i2c@10950000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				interrupts = <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c13_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_7: usi@109600c0 {
@@ -818,6 +1169,51 @@ spi_7: spi@10960000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_14: i2c@10960000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				interrupts = <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c14_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_7: usi@109700c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x103c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_15: i2c@10970000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 777 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c15_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_8: usi@109800c0 {
@@ -868,6 +1264,50 @@ spi_8: spi@10980000 {
 				status = "disabled";
 			};
 
+			hsi2c_16: i2c@10980000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10980000 0xc0>;
+				interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c16_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_8: usi@109900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109900c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1044>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC0_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_17: i2c@10990000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				interrupts = <GIC_SPI 779 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c17_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		pwm: pwm@109b0000 {
@@ -953,6 +1393,51 @@ spi_9: spi@10c80000 {
 				fifo-depth = <256>;
 				status = "disabled";
 			};
+
+			hsi2c_18: i2c@10c80000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10c80000 0xc0>;
+				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c18_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_9: usi@10c900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10c900c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1004>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_19: i2c@10c90000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10c90000 0xc0>;
+				interrupts = <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c19_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_10: usi@10ca00c0 {
@@ -1002,6 +1487,51 @@ spi_10: spi@10ca0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_20: i2c@10ca0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10ca0000 0xc0>;
+				interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c20_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_10: usi@10cb00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cb00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x100c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_21: i2c@10cb0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cb0000 0xc0>;
+				interrupts = <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c21_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_11: usi@10cc00c0 {
@@ -1051,6 +1581,51 @@ spi_11: spi@10cc0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_22: i2c@10cc0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cc0000 0xc0>;
+				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c22_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_11: usi@10cd00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cd00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1014>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_23: i2c@10cd0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cd0000 0xc0>;
+				interrupts = <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c23_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_12: usi@10ce00c0 {
@@ -1100,6 +1675,51 @@ spi_12: spi@10ce0000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_24: i2c@10ce0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10ce0000 0xc0>;
+				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c24_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_12: usi@10cf00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cf00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x101c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_25: i2c@10cf0000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10cf0000 0xc0>;
+				interrupts = <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c25_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_13: usi@10d000c0 {
@@ -1149,6 +1769,51 @@ spi_13: spi@10d00000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_26: i2c@10d00000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d00000 0xc0>;
+				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c26_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_13: usi@10d100c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d100c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1024>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_27: i2c@10d10000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d10000 0xc0>;
+				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c27_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_14: usi@10d200c0 {
@@ -1198,6 +1863,51 @@ spi_14: spi@10d20000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_28: i2c@10d20000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d20000 0xc0>;
+				interrupts = <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c28_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_14: usi@10d300c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d300c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x102c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_29: i2c@10d30000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d30000 0xc0>;
+				interrupts = <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c29_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_15: usi@10d400c0 {
@@ -1247,6 +1957,51 @@ spi_15: spi@10d40000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_30: i2c@10d40000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d40000 0xc0>;
+				interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c30_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_15: usi@10d500c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d500c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1034>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_31: i2c@10d50000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d50000 0xc0>;
+				interrupts = <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c31_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_16: usi@10d600c0 {
@@ -1296,6 +2051,51 @@ spi_16: spi@10d60000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_32: i2c@10d60000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d60000 0xc0>;
+				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c32_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_16: usi@10d700c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d700c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x103c>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC1_USI_I2C>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_33: i2c@10d70000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d70000 0xc0>;
+				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c33_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_17: usi@10d800c0 {
@@ -1345,6 +2145,51 @@ spi_17: spi@10d80000 {
 				fifo-depth = <64>;
 				status = "disabled";
 			};
+
+			hsi2c_34: i2c@10d80000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d80000 0xc0>;
+				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c34_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC1_USI17_USI>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_17: usi@10d900c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d900c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1044>;
+			samsung,mode = <USI_MODE_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_35: i2c@10d90000 {
+				compatible = "samsung,exynosautov920-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10d90000 0xc0>;
+				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c35_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI_I2C>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		cmu_top: clock-controller@11000000 {
-- 
2.34.1


