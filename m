Return-Path: <linux-i2c+bounces-4104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599D90E46B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 09:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2D1286B83
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 07:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466FB13C3CA;
	Wed, 19 Jun 2024 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aWPwRhzo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6918249B;
	Wed, 19 Jun 2024 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781813; cv=none; b=NF4brKMm1RFQCCyhxDpV9oNJl9Fulpjzs3drQoA8T79lghCIiuTMjIDtAd/jRz3Q12C+vxfQFERIZAWvSqIa5yUWxzBu3A5TpSDbOR8D89d7jeqtr/n4UiQewIZSLAXlIdWocBjMKAgWhmYupu7fR9Mr/CmPumV/4XtrGXf8Idw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781813; c=relaxed/simple;
	bh=5MpWaJAI0rtIb4sA3J2QYApRt6QQBb2cDKxrZCU19SQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTDk4o9yzz8W7EQAPlDuWcb4i3yOAYSgzYA3l9CmWeIJ7SkHQMf2oQCkkTaOXFPMk+3tIHr2upK0l7RfQpU86TbiUPSRmbyVc0so/L6BheVE1F7fa3GJEhNjMRi25PIeGR+kuexX4gcl01v1j9FHAO8yIv20gcc3gQilwrq7Odg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=aWPwRhzo; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718781810; x=1750317810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5MpWaJAI0rtIb4sA3J2QYApRt6QQBb2cDKxrZCU19SQ=;
  b=aWPwRhzoGbVg0Rak57u0S8omIusTQHDtWjnrFExTotLyinwR8dqCrSxK
   PXFCfZb5Q8WGojrR5kTDb12JSdh+T68n0q0yPVAprmAUcX93m8IeIFofb
   OfTAiJG5eiECDLKJ4CbBtu6kZ16H7X1KqFg3B1amrhzEZOtftcIeprUen
   JrGsppHTmzexRRJ0QLGEQiwwL3GaQD6a1Szhu2eBVRERr94ySZtf+Tb66
   ZNFkWV2zFdTV4ISivK76YGBmcP02rqq74YrQDyra1JmerBwhn6qOk+gKN
   VFMKzMBm7BTPyPb57VfZpYg0yuysUkAZPnIXKXlcZKadbGqzuu6r0O7VX
   w==;
X-CSE-ConnectionGUID: HPQiKEpwSfeQRjMG7YWokQ==
X-CSE-MsgGUID: csf1+pZ1Q8i6yOGT+zZgew==
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="30691772"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2024 00:23:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 19 Jun 2024 00:23:05 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 19 Jun 2024 00:23:02 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 2/3] ARM: dts: at91: at91-sama7g5ek: add EEPROMs
Date: Wed, 19 Jun 2024 10:22:30 +0300
Message-ID: <20240619072231.6876-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619072231.6876-1-andrei.simion@microchip.com>
References: <20240619072231.6876-1-andrei.simion@microchip.com>
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
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 20b2497657ae..66e8c8258684 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -403,6 +403,46 @@ i2c8: i2c@600 {
 		i2c-digital-filter;
 		i2c-digital-filter-width-ns = <35>;
 		status = "okay";
+
+		eeprom0: eeprom@52 {
+			compatible = "atmel,24mac02e4";
+			reg = <0x52>;
+			#address-cells = <1>;
+			#size-cells = <1>;
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
+			#address-cells = <1>;
+			#size-cells = <1>;
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
 
@@ -440,6 +480,8 @@ &pinctrl_gmac0_mdio_default
 		     &pinctrl_gmac0_txck_default
 		     &pinctrl_gmac0_phy_irq>;
 	phy-mode = "rgmii-id";
+	nvmem-cells = <&eeprom0_eui48>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 
 	ethernet-phy@7 {
@@ -457,6 +499,8 @@ &gmac1 {
 		     &pinctrl_gmac1_mdio_default
 		     &pinctrl_gmac1_phy_irq>;
 	phy-mode = "rmii";
+	nvmem-cells = <&eeprom1_eui48>;
+	nvmem-cell-names = "mac-address";
 	status = "okay"; /* Conflict with pdmc0. */
 
 	ethernet-phy@0 {
-- 
2.34.1


