Return-Path: <linux-i2c+bounces-4443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7791B944
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ADEA1F23EDB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53971147C60;
	Fri, 28 Jun 2024 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="q3ZtBSeM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C2146580;
	Fri, 28 Jun 2024 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561745; cv=none; b=OkEfToitmqqIUsUJ+8yQ4UEA1L/XEj2KwcZMT1SXVxy3TMKT0d3VLstuI1NSXhrjlTGc/W6C5XKiyMmkse+VS0IjbFc2cfSj1mo+yFEPl8OCV+6ZlvjqvSdrcVjLiyD3uGgYzkKlQVZemBjHER4uAByz5RLchEa7fqO6u0kA6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561745; c=relaxed/simple;
	bh=ZC5GcFCvoF9+YP4CsOoHkV5xsw2QFzOG1jhwWHB4+zw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DtPmgljQkfLUV3tv5Fjt/31SiwONdpwnv40ZX2Yu875AqxnlQlmrTL1VEnkASZpEk418CyWULbEZFje/XCFy2yXwwXndwab9xnBjHYnn7iyao0bvpmr9y1M9ebnuM2bv4w0tJD8xZLJltdrZnAk87ki05rmewh3+NCyqP+5ShYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=q3ZtBSeM; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719561744; x=1751097744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZC5GcFCvoF9+YP4CsOoHkV5xsw2QFzOG1jhwWHB4+zw=;
  b=q3ZtBSeMvEV2azJHvNowgN1BFSvprAkfzYltBL/5anH1iccAdxoiUiPs
   UErilpGyi7F8SngrMq0C7S8MXRMxHgsTqIn1VP2SsVq+D8CKOEpspAh4X
   BRU/cQJ3NRCOHzfHpkZFKPycAA2m9dCaoBOKNtvHcD4jzHdUGJPiBoCmg
   E1s+VLEJgJHdjWRKjYmtD2sIvL9rUNrRTY91WXb49shRIy0EMjU4FD/qG
   LJFXaRVq9hNt8NbLtK3K97jGM++XFOKZtd5j4HXtlhnjEXNlAevSBAJv7
   4AJoWNGz06mV5jaRZj2YgZ0N8ZAPR3P86HrdM53PriXNjo8yPUcRPSNST
   A==;
X-CSE-ConnectionGUID: yumzE5LRQZWNGcwzrru4aA==
X-CSE-MsgGUID: fZ26NDPwRgWx82z9wG7gcA==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="28620942"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 01:02:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 01:02:09 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 01:02:05 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v3 2/3] ARM: dts: at91: at91-sama7g5ek: add EEPROMs
Date: Fri, 28 Jun 2024 11:01:45 +0300
Message-ID: <20240628080146.49545-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628080146.49545-1-andrei.simion@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
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
[andrei.simion@microchip.com: add nvmem-layout to describe eui48 mac region
align compatible name with datasheet]
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v2 -> v3:
- change from atmel,24mac02e4 to microchip,24aa025e48 to align with the datasheet
- drop co-developed-by to maintain the chronological order of the changes

v1 -> v2:
- remove unnecessary #address-cells #size-cells
---
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 20b2497657ae..40f4480e298b 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -403,6 +403,42 @@ i2c8: i2c@600 {
 		i2c-digital-filter;
 		i2c-digital-filter-width-ns = <35>;
 		status = "okay";
+
+		eeprom0: eeprom@52 {
+			compatible = "microchip,24aa025e48";
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
+			compatible = "microchip,24aa025e48";
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


