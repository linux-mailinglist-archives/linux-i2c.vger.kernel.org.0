Return-Path: <linux-i2c+bounces-691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D680A9B5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 17:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7EAE1C20A1C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 16:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7D83064B;
	Fri,  8 Dec 2023 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NS+86piZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0DDBA;
	Fri,  8 Dec 2023 08:49:38 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B88p6St017928;
	Fri, 8 Dec 2023 17:49:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=66arlrdg5VeLp13kNsaelyuh0Xv6Hhf7qFrk2RuChIo=; b=NS
	+86piZ8OKZmDzSaHF+gjtZb38YMZQClZcfvPBig9XPLasE8jjIy1HejKryh7UaXR
	LSOO58oHnDbEaE9uG3lm4tzVVf/CLNEX5sqVPb/uAU758serIIBwN8FSK+FUroJL
	Isaa2/00VP0p3qH1L1hSJmQHGD95AKgx+wgUh1sl8WszJvAYGYGcZ6b66JcJe/Tz
	cjQTxkAKz3/ScCHGvYeNbxYTMDVyAlg12cQvPh8ICos+dRrgsNQmdYl6zQ20SO/c
	C2ZFb/4D/uQ40kOfJuao5pUZatzjSkmd8IKZw5x+PbsdQFiaJQgNiyIs6z5B1l5+
	1Sa6uANIGCzmhXzb41fg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2jn93t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 17:49:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5BDC100056;
	Fri,  8 Dec 2023 17:49:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DC6D236939;
	Fri,  8 Dec 2023 17:49:23 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 17:49:23 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/7] arm64: dts: st: add all 8 i2c nodes on stm32mp251
Date: Fri, 8 Dec 2023 17:47:14 +0100
Message-ID: <20231208164719.3584028-6-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208164719.3584028-1-alain.volmat@foss.st.com>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02

Add the 8 nodes for all i2c instances available on the stm32mp251.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 96 ++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dfbdb3a773e4..93bc8a8908ce 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -116,6 +116,102 @@ usart2: serial@400e0000 {
 				status = "disabled";
 			};
 
+			i2c1: i2c@40120000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40120000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C1>;
+				resets = <&rcc I2C1_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@40130000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40130000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C2>;
+				resets = <&rcc I2C2_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@40140000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40140000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C3>;
+				resets = <&rcc I2C3_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@40150000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40150000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C4>;
+				resets = <&rcc I2C4_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@40160000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40160000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C5>;
+				resets = <&rcc I2C5_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@40170000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40170000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C6>;
+				resets = <&rcc I2C6_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@40180000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x40180000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C7>;
+				resets = <&rcc I2C7_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@46040000 {
+				compatible = "st,stm32mp25-i2c";
+				reg = <0x46040000 0x400>;
+				interrupt-names = "event";
+				interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_I2C8>;
+				resets = <&rcc I2C8_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00353180>;
-- 
2.25.1


