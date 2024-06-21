Return-Path: <linux-i2c+bounces-4198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DFC9124E9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BCCE286BA0
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A17A152175;
	Fri, 21 Jun 2024 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pSaEW7v9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B622114F9DD;
	Fri, 21 Jun 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972189; cv=none; b=mpI/W65omMUm1/EZ07uoOqEZUEMArLZKByXf3IO+ofkMjjAzlQWOM3KJS9IK66cwgcVt4ogcpl+QPsVvIjrOnxDSW8377Ss09usC3vTUuULUzE5piRt2JBtKvo+T1zFXjsNNX7ECTEWki7K1KnrzSVGcbN26FwYTgahP8XN5zfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972189; c=relaxed/simple;
	bh=7vszX0GPIg2siXu/OlMY9o6mYTO9k20jy+KhfXa1y+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EmJ7zxihspuGlgAPJmcTdcuMgfgP0NQWJX+Zxg4TFCXGpwIkU4wJuVGAFEt0o2Qg21W35ZeqIr2Cw1nazytsb4K4d++wZYES01/TNPYk9pcKkjDXrPTwuc8pQOh0BLtX6dAC0PJHYHZqmIMhkxGo8XDDmk/qjV2VSxYfcB6+ejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pSaEW7v9; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718972188; x=1750508188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7vszX0GPIg2siXu/OlMY9o6mYTO9k20jy+KhfXa1y+g=;
  b=pSaEW7v9R0y5zp9QK/iv/X/WlRI6iRmRFYM+HCk9EJDl71xyexo9bDo2
   gRFTweXVFKmTzyVp7lKsxaYjo60bGi6q3kE96/ZJ1Evw5HjCUEz93XA4Q
   EMGTBPNvgvdxXFDJMrO/H44QUcv5ZdBiGmudQ/wFB9dshXi3m6QPCN4QY
   60k9ox4bsde0zbR1lapfin2eYLVkmNY/I4fftXmCm3ZWNc7dW1461sb+k
   kBN8JFO7MfI0Qi+TxUKM4sBOlSbNPiUkFugWzF8kWmVCoF8MDL56PsR/G
   8O5MfH3AVadKcOfyAr+iIVo+VUI4kUkgu6F+xZQlFKavflk5e3QRPbv2I
   w==;
X-CSE-ConnectionGUID: gjF6r6nLSZ2qzzloD0+0Lw==
X-CSE-MsgGUID: ZkfncO4qRSK8Vja8P2LEkw==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="28341532"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 05:16:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 05:16:09 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 21 Jun 2024 05:16:06 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v2 2/3] ARM: dts: at91: at91-sama7g5ek: add EEPROMs
Date: Fri, 21 Jun 2024 15:13:39 +0300
Message-ID: <20240621121340.114486-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621121340.114486-1-andrei.simion@microchip.com>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add EEPROMs and nvmem-layout to describe eui48 mac address region.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v1 -> v2:
- remove unnecessary #address-cells #size-cells
---
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 20b2497657ae..266ca71f48c3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -403,6 +403,42 @@ i2c8: i2c@600 {
 		i2c-digital-filter;
 		i2c-digital-filter-width-ns = <35>;
 		status = "okay";
+
+		eeprom0: eeprom@52 {
+			compatible = "atmel,24mac02e4";
+			reg = <0x52>;
+			size = <256>;
+			pagesize = <16>;
+			vcc-supply = <&vdd_3v3>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				eeprom0_eui48: eui48@fa {
+					reg = <0xfa 0x6>;
+				};
+			};
+		};
+
+		eeprom1: eeprom@53 {
+			compatible = "atmel,24mac02e4";
+			reg = <0x53>;
+			size = <256>;
+			pagesize = <16>;
+			vcc-supply = <&vdd_3v3>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				eeprom1_eui48: eui48@fa {
+					reg = <0xfa 0x6>;
+				};
+			};
+		};
 	};
 };
 
@@ -440,6 +476,8 @@ &pinctrl_gmac0_mdio_default
 		     &pinctrl_gmac0_txck_default
 		     &pinctrl_gmac0_phy_irq>;
 	phy-mode = "rgmii-id";
+	nvmem-cells = <&eeprom0_eui48>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 
 	ethernet-phy@7 {
@@ -457,6 +495,8 @@ &gmac1 {
 		     &pinctrl_gmac1_mdio_default
 		     &pinctrl_gmac1_phy_irq>;
 	phy-mode = "rmii";
+	nvmem-cells = <&eeprom1_eui48>;
+	nvmem-cell-names = "mac-address";
 	status = "okay"; /* Conflict with pdmc0. */
 
 	ethernet-phy@0 {
-- 
2.34.1


