Return-Path: <linux-i2c+bounces-9758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC7A58153
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 08:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8904B3ADABE
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 07:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC94717A316;
	Sun,  9 Mar 2025 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Y8mvca+A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA0D1581EE;
	Sun,  9 Mar 2025 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741504010; cv=none; b=HnqzD4Q4bjVXDYbAzNRxZKIpPx0vKIyTmHuF6NEzGslGlZZIllWV7hOiOwRlkBKG+JWITK+Q6CyEQJZA10SU0F95Yp9XmI2ntYP9qRC32i4s9GgpBGxIF3n7nTyRb9muGDErbEAmW5+O10o/yA4e/huBkkemB6uXhX286PuW40U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741504010; c=relaxed/simple;
	bh=xxPj1UzkWFvA7Kr54quT460aPH64SiOjiJkHqnKodz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+uz8gw+paoONU5W4jiNvPQQz1zVvTSLO//T3sZmuoUQfW7R86avL2kjKC8WSNtvjIpwloBj+LSRv4uNA2RQSiXnfJ+912tat09zoCpEESScO/CVP1a4UOLdLzI+evtWA9TUhW6pxtGZo1drcAwQ3iiIFDzb8dQ2iBQAx9SKTsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Y8mvca+A; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D216425A8D;
	Sun,  9 Mar 2025 08:06:47 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGKGTydjp2sh; Sun,  9 Mar 2025 08:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741504003; bh=xxPj1UzkWFvA7Kr54quT460aPH64SiOjiJkHqnKodz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y8mvca+AGJ9kv7i8vyPEk7FHn0+qXStgXYitie8w+dkrLY8W+6jbf5Nt7YsG/B4xN
	 H3HKA+QiGiQmKAzXcBkoJFd99kOq+UP+4pwMib8LgrWdR8Ntd9Ao/yuFvKM9qdDKPq
	 pxXT/Ss2lVhy6IYGMwuV907t7LF4lZLweQwurli1ML9T3cYuikIWIt7ngyNAtcKkDl
	 08so+Gad9N5DV7LiRIJv5sw/mtPNXQ9dCRAFFeU7d8wL/BpY7RibArskU9QzDWjiWw
	 4CofhhkkSiAbKhHwBDOH4uxDfp1PLUPtFjW7DviphP0uCHSmxbHeFRxErftS1t0k3p
	 6M240mUHm9odw==
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
Subject: [PATCH 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Sun,  9 Mar 2025 07:06:02 +0000
Message-ID: <20250309070603.35254-3-ziyao@disroot.org>
In-Reply-To: <20250309070603.35254-1-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe I2C controllers shipped by RK3528 in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 104 +++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 04ca2e2b3e9b..860b6057e5c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -19,6 +19,14 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -466,6 +474,102 @@ uart7: serial@ffa28000 {
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		saradc: adc@ffae0000 {
 			compatible = "rockchip,rk3528-saradc";
 			reg = <0x0 0xffae0000 0x0 0x10000>;
-- 
2.48.1


