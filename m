Return-Path: <linux-i2c+bounces-10456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C99A91B79
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82BEC3B5DD2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 12:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03B3247DF0;
	Thu, 17 Apr 2025 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HNN6S2PM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD5A248871;
	Thu, 17 Apr 2025 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891330; cv=none; b=PJPCxUtpbhjTftujoEdxCmLyM7aYjZTFrJz7AoWSwQE+iWDWE3fSMC/MP4MmDC15HwB3DWYFLUzHEuwQNR0/j1X076b5zdmKUhf7KHmqlCoFMpNIfoJIwH+3Vhs5Am4peEbTXWOUWs5btSa4q5Ppu31mNnCzt9ZtxpP0lRmRsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891330; c=relaxed/simple;
	bh=WVUl5TJqOF4iM4ohSNDgaQTgAIPG8NeRelFthy8N2R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyCMjriYzEwfiHD3jMvP71ovb+/wGp+Dc6Q+vZos93d3262NcRJZZqGGDFC55hQIUrIL9fvov1K4iVcinssMDYk0ya6c3H+hrpYNsTYQltTn3d1uzBjcBM/RvSCFFNIEzqJvaybvy+T0HQ/xeKcWGiQf16r9QSom7ZaaUqthVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HNN6S2PM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DAD825DB0;
	Thu, 17 Apr 2025 14:02:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al1Luu8f9c42; Thu, 17 Apr 2025 14:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891326; bh=WVUl5TJqOF4iM4ohSNDgaQTgAIPG8NeRelFthy8N2R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HNN6S2PMTA66w5dH7hKgrlnTk55qDret6b0aa3NHUxFwOsoilX0nrqt5SHa2We4+N
	 NTcT/n9xXlHbX6runkpD3Ztm9g01YWb1tZTyj1SzmnydvLePX9l1y8ycBEb07GeuWX
	 tr4ub0qRn+9ElRpOZRi/qy35vrT/vmCr9PGcuM6ELkm81nuW1X5yePOYkeKUWz1aoR
	 pT/p8X+VcdhFglCuD4XxFXbwtQq7pneQ0a3sZcgwnR8RbutJUN2Gnn85FVN74F1SBf
	 cU3SXo8vosrmOFvyEaEZUys8aT1Z/0jTIp/sLtO/UQihcD1VmDnTNG6nZ4xASmy3x4
	 8xgRUk09Z41LQ==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Thu, 17 Apr 2025 12:01:18 +0000
Message-ID: <20250417120118.17610-5-ziyao@disroot.org>
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
I2C-4 and I2C-7 which come with only a set of possible pins, a default
pin configuration is included.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 826f9be0be19..2c9780069af9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -24,6 +24,14 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -465,6 +473,108 @@ uart7: serial@ffa28000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@ffa50000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa50000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffa58000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa58000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@ffa60000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa60000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2m1_xfer>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@ffa68000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa68000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ffa70000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa70000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_xfer>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@ffa78000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa78000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@ffa80000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa80000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@ffa88000 {
+			compatible = "rockchip,rk3528-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0x0 0xffa88000 0x0 0x1000>;
+			clocks = <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_xfer>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		saradc: adc@ffae0000 {
 			compatible = "rockchip,rk3528-saradc";
 			reg = <0x0 0xffae0000 0x0 0x10000>;
-- 
2.49.0


