Return-Path: <linux-i2c+bounces-735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3380D716
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 19:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5F628178C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC63B54FB5;
	Mon, 11 Dec 2023 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FqkMquXn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36928E3;
	Mon, 11 Dec 2023 10:34:40 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BBCDvQd030710;
	Mon, 11 Dec 2023 19:33:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=c26TH31/4e2LiuAI+Gz7srNwxMxulLxxevULaE0NoZE=; b=Fq
	kMquXnvCviz/Gs2CxW8UbbodYmSFqazemaEk4Yj8JqXmw/fNY2ybH/WgPmfwOgBe
	eimKnqqF0gsXDrDuK+o2qDSieR11uDyinHYDHGC4GNhfFceU9o5W7gWJ01Wv00Xd
	ReNnDuJm++n4+76rv+gNy6t5fwFBuWEPJ159A3mf1DK2nVkP4t2fvIyAD5d34iqK
	SwC8y6rjTA3AEB9DSIqwqggl1GpQZBy8fBJl4IcNhW6OrAS2YkHdH1ZRI5I7cs8k
	WrGmrdna8WhvK1PWb7skHHJi0mnq+PsghDjAra1Vb6uoxlGIY9/SZ+k14JplDyO5
	1tyFHEj+zdCki/PJvN9w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uve88r1ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 19:33:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E293C100060;
	Mon, 11 Dec 2023 19:33:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4146257AA8;
	Mon, 11 Dec 2023 19:33:56 +0100 (CET)
Received: from localhost (10.252.9.5) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Dec
 2023 19:33:56 +0100
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
Subject: [PATCH v7 11/13] ARM: dts: stm32: put ETZPC as an access controller for STM32MP15x boards
Date: Mon, 11 Dec 2023 19:30:42 +0100
Message-ID: <20231211183044.808204-12-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211183044.808204-1-gatien.chevallier@foss.st.com>
References: <20231211183044.808204-1-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-11_08,2023-12-07_01,2023-05-22_02

Reference ETZPC as an access-control-provider.

For more information on which peripheral is securable or supports MCU
isolation, please read the STM32MP13 reference manual

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Patch not present in V6

 arch/arm/boot/dts/st/stm32mp151.dtsi  | 64 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi  |  2 +
 arch/arm/boot/dts/st/stm32mp15xc.dtsi |  1 +
 3 files changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 78c0d6ccdb09..e66970cd8745 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -334,6 +334,7 @@ etzpc: bus@5c007000 {
 			reg = <0x5c007000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <1>;
 			ranges;
 
 			timers2: timer@40000000 {
@@ -351,6 +352,7 @@ timers2: timer@40000000 {
 				       <&dmamux1 21 0x400 0x1>,
 				       <&dmamux1 22 0x400 0x1>;
 				dma-names = "ch1", "ch2", "ch3", "ch4", "up";
+				access-controllers = <&etzpc 16>;
 				status = "disabled";
 
 				pwm {
@@ -387,6 +389,7 @@ timers3: timer@40001000 {
 				       <&dmamux1 27 0x400 0x1>,
 				       <&dmamux1 28 0x400 0x1>;
 				dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
+				access-controllers = <&etzpc 17>;
 				status = "disabled";
 
 				pwm {
@@ -421,6 +424,7 @@ timers4: timer@40002000 {
 				       <&dmamux1 31 0x400 0x1>,
 				       <&dmamux1 32 0x400 0x1>;
 				dma-names = "ch1", "ch2", "ch3", "ch4";
+				access-controllers = <&etzpc 18>;
 				status = "disabled";
 
 				pwm {
@@ -457,6 +461,7 @@ timers5: timer@40003000 {
 				       <&dmamux1 59 0x400 0x1>,
 				       <&dmamux1 60 0x400 0x1>;
 				dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
+				access-controllers = <&etzpc 19>;
 				status = "disabled";
 
 				pwm {
@@ -488,6 +493,7 @@ timers6: timer@40004000 {
 				clock-names = "int";
 				dmas = <&dmamux1 69 0x400 0x1>;
 				dma-names = "up";
+				access-controllers = <&etzpc 20>;
 				status = "disabled";
 
 				timer@5 {
@@ -508,6 +514,7 @@ timers7: timer@40005000 {
 				clock-names = "int";
 				dmas = <&dmamux1 70 0x400 0x1>;
 				dma-names = "up";
+				access-controllers = <&etzpc 21>;
 				status = "disabled";
 
 				timer@6 {
@@ -526,6 +533,7 @@ timers12: timer@40006000 {
 				interrupt-names = "global";
 				clocks = <&rcc TIM12_K>;
 				clock-names = "int";
+				access-controllers = <&etzpc 22>;
 				status = "disabled";
 
 				pwm {
@@ -550,6 +558,7 @@ timers13: timer@40007000 {
 				interrupt-names = "global";
 				clocks = <&rcc TIM13_K>;
 				clock-names = "int";
+				access-controllers = <&etzpc 23>;
 				status = "disabled";
 
 				pwm {
@@ -574,6 +583,7 @@ timers14: timer@40008000 {
 				interrupt-names = "global";
 				clocks = <&rcc TIM14_K>;
 				clock-names = "int";
+				access-controllers = <&etzpc 24>;
 				status = "disabled";
 
 				pwm {
@@ -598,6 +608,7 @@ lptimer1: timer@40009000 {
 				clocks = <&rcc LPTIM1_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 25>;
 				status = "disabled";
 
 				pwm {
@@ -626,6 +637,7 @@ i2s2: audio-controller@4000b000 {
 				dmas = <&dmamux1 39 0x400 0x01>,
 				       <&dmamux1 40 0x400 0x01>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 27>;
 				status = "disabled";
 			};
 
@@ -640,6 +652,7 @@ spi2: spi@4000b000 {
 				dmas = <&dmamux1 39 0x400 0x05>,
 				       <&dmamux1 40 0x400 0x05>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 27>;
 				status = "disabled";
 			};
 
@@ -651,6 +664,7 @@ i2s3: audio-controller@4000c000 {
 				dmas = <&dmamux1 61 0x400 0x01>,
 				       <&dmamux1 62 0x400 0x01>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 28>;
 				status = "disabled";
 			};
 
@@ -665,6 +679,7 @@ spi3: spi@4000c000 {
 				dmas = <&dmamux1 61 0x400 0x05>,
 				       <&dmamux1 62 0x400 0x05>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 28>;
 				status = "disabled";
 			};
 
@@ -678,6 +693,7 @@ spdifrx: audio-controller@4000d000 {
 				dmas = <&dmamux1 93 0x400 0x01>,
 				       <&dmamux1 94 0x400 0x01>;
 				dma-names = "rx", "rx-ctrl";
+				access-controllers = <&etzpc 29>;
 				status = "disabled";
 			};
 
@@ -690,6 +706,7 @@ usart2: serial@4000e000 {
 				dmas = <&dmamux1 43 0x400 0x15>,
 				       <&dmamux1 44 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 30>;
 				status = "disabled";
 			};
 
@@ -702,6 +719,7 @@ usart3: serial@4000f000 {
 				dmas = <&dmamux1 45 0x400 0x15>,
 				       <&dmamux1 46 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 31>;
 				status = "disabled";
 			};
 
@@ -714,6 +732,7 @@ uart4: serial@40010000 {
 				dmas = <&dmamux1 63 0x400 0x15>,
 				       <&dmamux1 64 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 32>;
 				status = "disabled";
 			};
 
@@ -726,6 +745,7 @@ uart5: serial@40011000 {
 				dmas = <&dmamux1 65 0x400 0x15>,
 				       <&dmamux1 66 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 33>;
 				status = "disabled";
 			};
 
@@ -742,6 +762,7 @@ i2c1: i2c@40012000 {
 				st,syscfg-fmp = <&syscfg 0x4 0x1>;
 				wakeup-source;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 34>;
 				status = "disabled";
 			};
 
@@ -758,6 +779,7 @@ i2c2: i2c@40013000 {
 				st,syscfg-fmp = <&syscfg 0x4 0x2>;
 				wakeup-source;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 35>;
 				status = "disabled";
 			};
 
@@ -774,6 +796,7 @@ i2c3: i2c@40014000 {
 				st,syscfg-fmp = <&syscfg 0x4 0x4>;
 				wakeup-source;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 36>;
 				status = "disabled";
 			};
 
@@ -790,6 +813,7 @@ i2c5: i2c@40015000 {
 				st,syscfg-fmp = <&syscfg 0x4 0x10>;
 				wakeup-source;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 37>;
 				status = "disabled";
 			};
 
@@ -799,6 +823,7 @@ cec: cec@40016000 {
 				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CEC_K>, <&rcc CEC>;
 				clock-names = "cec", "hdmi-cec";
+				access-controllers = <&etzpc 38>;
 				status = "disabled";
 			};
 
@@ -809,6 +834,7 @@ dac: dac@40017000 {
 				clock-names = "pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				access-controllers = <&etzpc 39>;
 				status = "disabled";
 
 				dac1: dac@1 {
@@ -835,6 +861,7 @@ uart7: serial@40018000 {
 				dmas = <&dmamux1 79 0x400 0x15>,
 				       <&dmamux1 80 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 40>;
 				status = "disabled";
 			};
 
@@ -847,6 +874,7 @@ uart8: serial@40019000 {
 				dmas = <&dmamux1 81 0x400 0x15>,
 				       <&dmamux1 82 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 41>;
 				status = "disabled";
 			};
 
@@ -871,6 +899,7 @@ timers1: timer@44000000 {
 				       <&dmamux1 17 0x400 0x1>;
 				dma-names = "ch1", "ch2", "ch3", "ch4",
 					    "up", "trig", "com";
+				access-controllers = <&etzpc 48>;
 				status = "disabled";
 
 				pwm {
@@ -912,6 +941,7 @@ timers8: timer@44001000 {
 				       <&dmamux1 53 0x400 0x1>;
 				dma-names = "ch1", "ch2", "ch3", "ch4",
 					    "up", "trig", "com";
+				access-controllers = <&etzpc 49>;
 				status = "disabled";
 
 				pwm {
@@ -941,6 +971,7 @@ usart6: serial@44003000 {
 				dmas = <&dmamux1 71 0x400 0x15>,
 				<&dmamux1 72 0x400 0x11>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 51>;
 				status = "disabled";
 			};
 
@@ -952,6 +983,7 @@ i2s1: audio-controller@44004000 {
 				dmas = <&dmamux1 37 0x400 0x01>,
 				<&dmamux1 38 0x400 0x01>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 52>;
 				status = "disabled";
 			};
 
@@ -966,6 +998,7 @@ spi1: spi@44004000 {
 				dmas = <&dmamux1 37 0x400 0x05>,
 				<&dmamux1 38 0x400 0x05>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 52>;
 				status = "disabled";
 			};
 
@@ -980,6 +1013,7 @@ spi4: spi@44005000 {
 				dmas = <&dmamux1 83 0x400 0x05>,
 				<&dmamux1 84 0x400 0x05>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 53>;
 				status = "disabled";
 			};
 
@@ -997,6 +1031,7 @@ timers15: timer@44006000 {
 				       <&dmamux1 107 0x400 0x1>,
 				       <&dmamux1 108 0x400 0x1>;
 				dma-names = "ch1", "up", "trig", "com";
+				access-controllers = <&etzpc 54>;
 				status = "disabled";
 
 				pwm {
@@ -1024,6 +1059,7 @@ timers16: timer@44007000 {
 				dmas = <&dmamux1 109 0x400 0x1>,
 				<&dmamux1 110 0x400 0x1>;
 				dma-names = "ch1", "up";
+				access-controllers = <&etzpc 55>;
 				status = "disabled";
 
 				pwm {
@@ -1050,6 +1086,7 @@ timers17: timer@44008000 {
 				dmas = <&dmamux1 111 0x400 0x1>,
 				<&dmamux1 112 0x400 0x1>;
 				dma-names = "ch1", "up";
+				access-controllers = <&etzpc 56>;
 				status = "disabled";
 
 				pwm {
@@ -1076,6 +1113,7 @@ spi5: spi@44009000 {
 				dmas = <&dmamux1 85 0x400 0x05>,
 				<&dmamux1 86 0x400 0x05>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 57>;
 				status = "disabled";
 			};
 
@@ -1087,6 +1125,7 @@ sai1: sai@4400a000 {
 				reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
 				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 				resets = <&rcc SAI1_R>;
+				access-controllers = <&etzpc 58>;
 				status = "disabled";
 
 				sai1a: audio-controller@4400a004 {
@@ -1119,6 +1158,7 @@ sai2: sai@4400b000 {
 				reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
 				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 				resets = <&rcc SAI2_R>;
+				access-controllers = <&etzpc 59>;
 				status = "disabled";
 
 				sai2a: audio-controller@4400b004 {
@@ -1150,6 +1190,7 @@ sai3: sai@4400c000 {
 				reg = <0x4400c000 0x4>, <0x4400c3f0 0x10>;
 				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 				resets = <&rcc SAI3_R>;
+				access-controllers = <&etzpc 60>;
 				status = "disabled";
 
 				sai3a: audio-controller@4400c004 {
@@ -1180,6 +1221,7 @@ dfsdm: dfsdm@4400d000 {
 				clock-names = "dfsdm";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				access-controllers = <&etzpc 61>;
 				status = "disabled";
 
 				dfsdm0: filter@0 {
@@ -1259,6 +1301,7 @@ dma1: dma-controller@48000000 {
 				#dma-cells = <4>;
 				st,mem2mem;
 				dma-requests = <8>;
+				access-controllers = <&etzpc 88>;
 			};
 
 			dma2: dma-controller@48001000 {
@@ -1277,6 +1320,7 @@ dma2: dma-controller@48001000 {
 				#dma-cells = <4>;
 				st,mem2mem;
 				dma-requests = <8>;
+				access-controllers = <&etzpc 89>;
 			};
 
 			dmamux1: dma-router@48002000 {
@@ -1288,6 +1332,7 @@ dmamux1: dma-router@48002000 {
 				dma-channels = <16>;
 				clocks = <&rcc DMAMUX>;
 				resets = <&rcc DMAMUX_R>;
+				access-controllers = <&etzpc 90>;
 			};
 
 			adc: adc@48003000 {
@@ -1302,6 +1347,7 @@ adc: adc@48003000 {
 				#interrupt-cells = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				access-controllers = <&etzpc 72>;
 				status = "disabled";
 
 				adc1: adc@0 {
@@ -1352,6 +1398,7 @@ sdmmc3: mmc@48004000 {
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
+				access-controllers = <&etzpc 86>;
 				status = "disabled";
 			};
 
@@ -1369,6 +1416,7 @@ usbotg_hs: usb-otg@49000000 {
 				dr_mode = "otg";
 				otg-rev = <0x200>;
 				usb33d-supply = <&usb33>;
+				access-controllers = <&etzpc 85>;
 				status = "disabled";
 			};
 
@@ -1381,6 +1429,7 @@ dcmi: dcmi@4c006000 {
 				clock-names = "mclk";
 				dmas = <&dmamux1 75 0x400 0x01>;
 				dma-names = "tx";
+				access-controllers = <&etzpc 70>;
 				status = "disabled";
 			};
 
@@ -1393,6 +1442,7 @@ lptimer2: timer@50021000 {
 				clocks = <&rcc LPTIM2_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 64>;
 				status = "disabled";
 
 				pwm {
@@ -1422,6 +1472,7 @@ lptimer3: timer@50022000 {
 				clocks = <&rcc LPTIM3_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 65>;
 				status = "disabled";
 
 				pwm {
@@ -1444,6 +1495,7 @@ lptimer4: timer@50023000 {
 				clocks = <&rcc LPTIM4_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 66>;
 				status = "disabled";
 
 				pwm {
@@ -1460,6 +1512,7 @@ lptimer5: timer@50024000 {
 				clocks = <&rcc LPTIM5_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 67>;
 				status = "disabled";
 
 				pwm {
@@ -1475,6 +1528,7 @@ vrefbuf: vrefbuf@50025000 {
 				regulator-min-microvolt = <1500000>;
 				regulator-max-microvolt = <2500000>;
 				clocks = <&rcc VREF>;
+				access-controllers = <&etzpc 69>;
 				status = "disabled";
 			};
 
@@ -1486,6 +1540,7 @@ sai4: sai@50027000 {
 				reg = <0x50027000 0x4>, <0x500273f0 0x10>;
 				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 				resets = <&rcc SAI4_R>;
+				access-controllers = <&etzpc 68>;
 				status = "disabled";
 
 				sai4a: audio-controller@50027004 {
@@ -1518,6 +1573,7 @@ hash1: hash@54002000 {
 				dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0>;
 				dma-names = "in";
 				dma-maxburst = <2>;
+				access-controllers = <&etzpc 8>;
 				status = "disabled";
 			};
 
@@ -1526,6 +1582,7 @@ rng1: rng@54003000 {
 				reg = <0x54003000 0x400>;
 				clocks = <&rcc RNG1_K>;
 				resets = <&rcc RNG1_R>;
+				access-controllers = <&etzpc 7>;
 				status = "okay";
 			};
 
@@ -1536,6 +1593,7 @@ fmc: memory-controller@58002000 {
 				reg = <0x58002000 0x1000>;
 				clocks = <&rcc FMC_K>;
 				resets = <&rcc FMC_R>;
+				access-controllers = <&etzpc 91>;
 				status = "disabled";
 
 				ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
@@ -1575,6 +1633,7 @@ qspi: spi@58003000 {
 				resets = <&rcc QSPI_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				access-controllers = <&etzpc 92>;
 				status = "disabled";
 			};
 
@@ -1602,6 +1661,7 @@ ethernet0: ethernet@5800a000 {
 				snps,en-tx-lpi-clockgating;
 				snps,axi-config = <&stmmac_axi_config_0>;
 				snps,tso;
+				access-controllers = <&etzpc 94>;
 				status = "disabled";
 
 				stmmac_axi_config_0: stmmac-axi-config {
@@ -1617,6 +1677,7 @@ usart1: serial@5c000000 {
 				interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc USART1_K>;
 				wakeup-source;
+				access-controllers = <&etzpc 3>;
 				status = "disabled";
 			};
 
@@ -1630,6 +1691,7 @@ spi6: spi@5c001000 {
 				resets = <&rcc SPI6_R>;
 				dmas = <&mdma1 34 0x0 0x40008 0x0 0x0>,
 				       <&mdma1 35 0x0 0x40002 0x0 0x0>;
+				access-controllers = <&etzpc 4>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
@@ -1647,6 +1709,7 @@ i2c4: i2c@5c002000 {
 				st,syscfg-fmp = <&syscfg 0x4 0x8>;
 				wakeup-source;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 5>;
 				status = "disabled";
 			};
 
@@ -1663,6 +1726,7 @@ i2c6: i2c@5c009000 {
 				st,syscfg-fmp = <&syscfg 0x4 0x20>;
 				wakeup-source;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 12>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 36e17ea0b179..4640dafb1598 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -41,6 +41,7 @@ m_can1: can@4400e000 {
 		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&etzpc 62>;
 		status = "disabled";
 	};
 
@@ -54,6 +55,7 @@ m_can2: can@4400f000 {
 		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
+		access-controllers = <&etzpc 62>;
 		status = "disabled";
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xc.dtsi b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
index d36c3457451a..97465717f932 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
@@ -11,6 +11,7 @@ cryp1: cryp@54001000 {
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&rcc CRYP1>;
 		resets = <&rcc CRYP1_R>;
+		access-controllers = <&etzpc 9>;
 		status = "disabled";
 	};
 };
-- 
2.35.3


