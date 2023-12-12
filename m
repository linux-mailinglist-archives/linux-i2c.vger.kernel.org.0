Return-Path: <linux-i2c+bounces-753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F480F0BD
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 16:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D93C81C20845
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 15:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297FA77F2D;
	Tue, 12 Dec 2023 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="53J+V21A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C794AA;
	Tue, 12 Dec 2023 07:27:16 -0800 (PST)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BCCtSh9012700;
	Tue, 12 Dec 2023 16:26:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=R7JEQ6VWJGvCjK5gObxrx2z22EBeIy5NZXEMT+hNouo=; b=53
	J+V21A5x3/q1qEGeBLyvwZsud0pxV/96AmXJF2EsWQGS/6tn0+eHUEQAMTFnaJkH
	AJUkQbZzaUM56TrFcvztVmMLv+gjwMwrXN9V0cBxvyqA50hV+sruzoZBLBJauCd3
	dbMnqqHUlzkti9rZyjQPIEm++d/OIZMGSK4Pzqt5njRwBsOrmnDxcJhxDiUe3C56
	yneUCfi18EEqISrTFRNUP0Y10b/5omMptYLZ6a7kpBr6Tn+NQsLCBMD8J1pG8Lyt
	HkZM/CVtf/7DXltFUcaPn8wo/KxEjxFSh031jvyxYbX6LJV4ugjPT36jnDgwWsnG
	P7F1vdl9pKO64pVrMN8g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uw42nht0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:26:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A03F510005A;
	Tue, 12 Dec 2023 16:26:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 908C922F7BA;
	Tue, 12 Dec 2023 16:26:31 +0100 (CET)
Received: from localhost (10.252.7.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 16:26:31 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v8 08/13] arm64: dts: st: add RIFSC as an access controller for STM32MP25x boards
Date: Tue, 12 Dec 2023 16:23:51 +0100
Message-ID: <20231212152356.345703-9-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_09,2023-12-12_01,2023-05-22_02

RIFSC is a firewall controller. Add "st,stm32mp25-rifsc" compatible and
reference RIFSC as an access-control-provider. Keep "simple-bus"
compatible backward compatibility.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V8:
    	- Keep "simple-bus" compatible

Changes in V6:
    	- Renamed access-controller to access-controllers
    	- Removal of access-control-provider property

Changes in V5:
    	- Renamed feature-domain* to access-control*

Changes in V2:
	- Fix rifsc node name
	- Move the "ranges" property under the
	  "feature-domains" one

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 124403f5f1f4..3b0d6dced81f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -111,11 +111,12 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
 
-		rifsc: rifsc-bus@42080000 {
-			compatible = "simple-bus";
+		rifsc: bus@42080000 {
+			compatible = "st,stm32mp25-rifsc", "simple-bus";
 			reg = <0x42080000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <1>;
 			ranges;
 
 			usart2: serial@400e0000 {
@@ -123,6 +124,7 @@ usart2: serial@400e0000 {
 				reg = <0x400e0000 0x400>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&ck_flexgen_08>;
+				access-controllers = <&rifsc 32>;
 				status = "disabled";
 			};
 
@@ -136,6 +138,7 @@ sdmmc1: mmc@48220000 {
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
+				access-controllers = <&rifsc 92>;
 				status = "disabled";
 			};
 		};
-- 
2.25.1


