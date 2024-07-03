Return-Path: <linux-i2c+bounces-4598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776D9255CF
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 10:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2F02850B6
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 08:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6941613CF98;
	Wed,  3 Jul 2024 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Tc2hTaPV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7613C3DD;
	Wed,  3 Jul 2024 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996520; cv=none; b=EL5wOXZo1cqKUXwdUFeC2yvsl5tMpOQ7EcPRj5PJM3YcMKV/r5DD8gkVNLQk3auiXBuacuWdOC6IzkO2s9hfuakFlIqTSF0ER1Wh3WEnOu4iYpW8Cn/dtztwkpOW1RAL2md0I+ujWk5SHdiwb+zdx5ib1DP+PpQnRiFFkk602rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996520; c=relaxed/simple;
	bh=yJKh9MN0G/jN/6D64ek5o6PiA/bzUrBrFHRw4k29LUw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HaFbj5YnZVC1oATHlZ+XqzxGBBafGTmXoR0GfdeBm+myI23RFhEVMoVIaGOkdDbnQ8Jxw1J8DMLmfhJ+zm3cpapriJ8B/jNhx9lW0RpW3yZVwEuUmjS59sboT1ps7VxKsIsFXO4Ef3Bo1OjHh6gzOxuOh9QMqAIKvQgN8VMVk0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=fail smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Tc2hTaPV; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719996518; x=1751532518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yJKh9MN0G/jN/6D64ek5o6PiA/bzUrBrFHRw4k29LUw=;
  b=Tc2hTaPVF4uLXsUeHkOa3b4vlrFaDIemgj7LyxxH8JyfBwSbxAuumuMd
   H2rnvUlbKTQSkbc9kpIiXYyT8enti3iMbtp20ZLcafF6RRUcEFsiGbdkP
   5ebs+YWnI4Ll45GUdCbCTMBKRlePVGoOKnh/EQyer4VQKk9VTRO+bFqc1
   0Ijye+yEeFWuuCJ1aGAZCbSeX3lQCTYiCaxpxz+xNBrSG0e+WSy3Dlh+D
   NXdDW6HvL5/2OZ5KZx4sWJUks7ibO0IewEaXoXDvMPILr9vvj9l69vWRm
   xgs9rltZ9g2AoYS+Ox2Ef+SvsqTIVAaHhKOYJUugE1g4d7DxKt9+HbOzc
   w==;
X-CSE-ConnectionGUID: s71X572eQVinIeDMsyDqRg==
X-CSE-MsgGUID: /kdSH4kKTWGcJZtboUz+cA==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="196193659"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 01:48:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 01:48:05 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jul 2024 01:48:02 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v4 2/3] ARM: dts: microchip: at91-sama7g5ek: add EEPROMs
Date: Wed, 3 Jul 2024 11:47:03 +0300
Message-ID: <20240703084704.197697-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703084704.197697-1-andrei.simion@microchip.com>
References: <20240703084704.197697-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Our main boot sequence is
(1) ROM BOOT -> AT91Bootstrap -> U-Boot -> Linux Kernel.
U-Boot is the stage where we set up the MAC address.
Also we can skip U-Boot and use the following boot sequence :
(2) ROM BOOT -> AT91Boostrap -> Linux Kernel.
Add EEPROMs and nvmem-layout to describe eui48 MAC address region
to be used for case (2).

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
[andrei.simion@microchip.com: Add nvmem-layout to describe eui48 mac region.
Align compatible name with datasheet. Reword commit message.]
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v3 -> v4:
- reword commit message
- change commit title

v2 -> v3:
- change from atmel,24mac02e4 to microchip,24aa025e48 to align with datasheet
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


