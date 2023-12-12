Return-Path: <linux-i2c+bounces-757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3E80F106
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 16:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E32D1F2142D
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 15:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1DF7D8AF;
	Tue, 12 Dec 2023 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="20pxvA8G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0C1D46;
	Tue, 12 Dec 2023 07:28:33 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCCPJDL023809;
	Tue, 12 Dec 2023 16:27:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=ko4qpE/Mk3hmz/BxgAiagTIp0+Y1bHmXJV9GiMuQWlQ=; b=20
	pxvA8GpmPSdn3+NvdgP3rOaL3IqPHgdKApzognqhCvXecSiarl+OWOaAX62e5eG6
	RBxCpaWlfaKapRIL383srcqe2Su1hKBwO/Si97xp1ICuvL+UzOLuB4GHURhe5irp
	6PcpRNEQUs2aT1X6+hnAiaXUn/3EFBg6wNw6EqdF8xu3aZA2RN+4si+r/RimeXdE
	Eb044zG3+fjX7SOGzUHhEJmuMQfxPDvIejOkj/5tEzYYlv6kDb5Nk0ZZDZHbbyyu
	l3uSUQbIgnQubvCm6F6wLE4Oh8rTjql/geVKfnS3SZ7tEqsBwNwuAbmapXkW9D/w
	AXTNpVHdVpTEQmGrmWsQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uve88uyxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:27:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FDD710005A;
	Tue, 12 Dec 2023 16:27:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51DB622F7C8;
	Tue, 12 Dec 2023 16:27:44 +0100 (CET)
Received: from localhost (10.252.7.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 16:27:43 +0100
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
Subject: [PATCH v8 12/13] ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards
Date: Tue, 12 Dec 2023 16:23:55 +0100
Message-ID: <20231212152356.345703-13-gatien.chevallier@foss.st.com>
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

ETZPC is a firewall controller. Put all peripherals filtered by the
ETZPC as ETZPC subnodes and keep the "simple-bus" compatible for
backward compatibility.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V7:
    	- Keep simple-bus compatible
    	- Remove access-controllers reference in this patch

Changes in V6:
    	- Renamed access-controller to access-controllers
    	- Removal of access-control-provider property

Changes in V5:
    	- Renamed feature-domain* to access-control*

 arch/arm/boot/dts/st/stm32mp131.dtsi  | 1037 +++++++++++++------------
 arch/arm/boot/dts/st/stm32mp133.dtsi  |   50 +-
 arch/arm/boot/dts/st/stm32mp13xc.dtsi |   18 +-
 arch/arm/boot/dts/st/stm32mp13xf.dtsi |   18 +-
 4 files changed, 564 insertions(+), 559 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b04d24c939c3..6ba8e3fd43b0 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -745,340 +745,6 @@ dmamux1: dma-router@48002000 {
 			dma-channels = <16>;
 		};
 
-		adc_2: adc@48004000 {
-			compatible = "st,stm32mp13-adc-core";
-			reg = <0x48004000 0x400>;
-			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc ADC2>, <&rcc ADC2_K>;
-			clock-names = "bus", "adc";
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			adc2: adc@0 {
-				compatible = "st,stm32mp13-adc";
-				#io-channel-cells = <1>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0x0>;
-				interrupt-parent = <&adc_2>;
-				interrupts = <0>;
-				dmas = <&dmamux1 10 0x400 0x80000001>;
-				dma-names = "rx";
-				status = "disabled";
-
-				channel@13 {
-					reg = <13>;
-					label = "vrefint";
-				};
-				channel@14 {
-					reg = <14>;
-					label = "vddcore";
-				};
-				channel@16 {
-					reg = <16>;
-					label = "vddcpu";
-				};
-				channel@17 {
-					reg = <17>;
-					label = "vddq_ddr";
-				};
-			};
-		};
-
-		usbotg_hs: usb@49000000 {
-			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
-			reg = <0x49000000 0x40000>;
-			clocks = <&rcc USBO_K>;
-			clock-names = "otg";
-			resets = <&rcc USBO_R>;
-			reset-names = "dwc2";
-			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			g-rx-fifo-size = <512>;
-			g-np-tx-fifo-size = <32>;
-			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
-			dr_mode = "otg";
-			otg-rev = <0x200>;
-			usb33d-supply = <&scmi_usb33>;
-			status = "disabled";
-		};
-
-		usart1: serial@4c000000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x4c000000 0x400>;
-			interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc USART1_K>;
-			resets = <&rcc USART1_R>;
-			wakeup-source;
-			dmas = <&dmamux1 41 0x400 0x5>,
-			       <&dmamux1 42 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		usart2: serial@4c001000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x4c001000 0x400>;
-			interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc USART2_K>;
-			resets = <&rcc USART2_R>;
-			wakeup-source;
-			dmas = <&dmamux1 43 0x400 0x5>,
-			       <&dmamux1 44 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		i2s4: audio-controller@4c002000 {
-			compatible = "st,stm32h7-i2s";
-			reg = <0x4c002000 0x400>;
-			#sound-dai-cells = <0>;
-			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 83 0x400 0x01>,
-			       <&dmamux1 84 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi4: spi@4c002000 {
-			compatible = "st,stm32h7-spi";
-			reg = <0x4c002000 0x400>;
-			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI4_K>;
-			resets = <&rcc SPI4_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 83 0x400 0x01>,
-			       <&dmamux1 84 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi5: spi@4c003000 {
-			compatible = "st,stm32h7-spi";
-			reg = <0x4c003000 0x400>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI5_K>;
-			resets = <&rcc SPI5_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 85 0x400 0x01>,
-			       <&dmamux1 86 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		i2c3: i2c@4c004000 {
-			compatible = "st,stm32mp13-i2c";
-			reg = <0x4c004000 0x400>;
-			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc I2C3_K>;
-			resets = <&rcc I2C3_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 73 0x400 0x1>,
-			       <&dmamux1 74 0x400 0x1>;
-			dma-names = "rx", "tx";
-			st,syscfg-fmp = <&syscfg 0x4 0x4>;
-			i2c-analog-filter;
-			status = "disabled";
-		};
-
-		i2c4: i2c@4c005000 {
-			compatible = "st,stm32mp13-i2c";
-			reg = <0x4c005000 0x400>;
-			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc I2C4_K>;
-			resets = <&rcc I2C4_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 75 0x400 0x1>,
-			       <&dmamux1 76 0x400 0x1>;
-			dma-names = "rx", "tx";
-			st,syscfg-fmp = <&syscfg 0x4 0x8>;
-			i2c-analog-filter;
-			status = "disabled";
-		};
-
-		i2c5: i2c@4c006000 {
-			compatible = "st,stm32mp13-i2c";
-			reg = <0x4c006000 0x400>;
-			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc I2C5_K>;
-			resets = <&rcc I2C5_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 115 0x400 0x1>,
-			       <&dmamux1 116 0x400 0x1>;
-			dma-names = "rx", "tx";
-			st,syscfg-fmp = <&syscfg 0x4 0x10>;
-			i2c-analog-filter;
-			status = "disabled";
-		};
-
-		timers12: timer@4c007000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x4c007000 0x400>;
-			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global";
-			clocks = <&rcc TIM12_K>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@11 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <11>;
-				status = "disabled";
-			};
-		};
-
-		timers13: timer@4c008000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x4c008000 0x400>;
-			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global";
-			clocks = <&rcc TIM13_K>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@12 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <12>;
-				status = "disabled";
-			};
-		};
-
-		timers14: timer@4c009000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x4c009000 0x400>;
-			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global";
-			clocks = <&rcc TIM14_K>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@13 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <13>;
-				status = "disabled";
-			};
-		};
-
-		timers15: timer@4c00a000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x4c00a000 0x400>;
-			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global";
-			clocks = <&rcc TIM15_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 105 0x400 0x1>,
-			       <&dmamux1 106 0x400 0x1>,
-			       <&dmamux1 107 0x400 0x1>,
-			       <&dmamux1 108 0x400 0x1>;
-			dma-names = "ch1", "up", "trig", "com";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@14 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <14>;
-				status = "disabled";
-			};
-		};
-
-		timers16: timer@4c00b000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x4c00b000 0x400>;
-			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global";
-			clocks = <&rcc TIM16_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 109 0x400 0x1>,
-			       <&dmamux1 110 0x400 0x1>;
-			dma-names = "ch1", "up";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@15 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <15>;
-				status = "disabled";
-			};
-		};
-
-		timers17: timer@4c00c000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x4c00c000 0x400>;
-			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global";
-			clocks = <&rcc TIM17_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 111 0x400 0x1>,
-			       <&dmamux1 112 0x400 0x1>;
-			dma-names = "ch1", "up";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@16 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <16>;
-				status = "disabled";
-			};
-		};
-
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp13-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
@@ -1105,69 +771,6 @@ syscfg: syscon@50020000 {
 			clocks = <&rcc SYSCFG>;
 		};
 
-		lptimer2: timer@50021000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x50021000 0x400>;
-			interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc LPTIM2_K>;
-			clock-names = "mux";
-			wakeup-source;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@1 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <1>;
-				status = "disabled";
-			};
-
-			counter {
-				compatible = "st,stm32-lptimer-counter";
-				status = "disabled";
-			};
-
-			timer {
-				compatible = "st,stm32-lptimer-timer";
-				status = "disabled";
-			};
-		};
-
-		lptimer3: timer@50022000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x50022000 0x400>;
-			interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc LPTIM3_K>;
-			clock-names = "mux";
-			wakeup-source;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@2 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <2>;
-				status = "disabled";
-			};
-
-			timer {
-				compatible = "st,stm32-lptimer-timer";
-				status = "disabled";
-			};
-		};
-
 		lptimer4: timer@50023000 {
 			compatible = "st,stm32-lptimer";
 			reg = <0x50023000 0x400>;
@@ -1210,25 +813,6 @@ timer {
 			};
 		};
 
-		hash: hash@54003000 {
-			compatible = "st,stm32mp13-hash";
-			reg = <0x54003000 0x400>;
-			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc HASH1>;
-			resets = <&rcc HASH1_R>;
-			dmas = <&mdma 30 0x2 0x1000a02 0x0 0x0>;
-			dma-names = "in";
-			status = "disabled";
-		};
-
-		rng: rng@54004000 {
-			compatible = "st,stm32mp13-rng";
-			reg = <0x54004000 0x400>;
-			clocks = <&rcc RNG1_K>;
-			resets = <&rcc RNG1_R>;
-			status = "disabled";
-		};
-
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
@@ -1239,82 +823,6 @@ mdma: dma-controller@58000000 {
 			dma-requests = <48>;
 		};
 
-		fmc: memory-controller@58002000 {
-			compatible = "st,stm32mp1-fmc2-ebi";
-			reg = <0x58002000 0x1000>;
-			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
-				 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
-				 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
-				 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
-				 <4 0 0x80000000 0x10000000>; /* NAND */
-			#address-cells = <2>;
-			#size-cells = <1>;
-			clocks = <&rcc FMC_K>;
-			resets = <&rcc FMC_R>;
-			status = "disabled";
-
-			nand-controller@4,0 {
-				compatible = "st,stm32mp1-fmc2-nfc";
-				reg = <4 0x00000000 0x1000>,
-				      <4 0x08010000 0x1000>,
-				      <4 0x08020000 0x1000>,
-				      <4 0x01000000 0x1000>,
-				      <4 0x09010000 0x1000>,
-				      <4 0x09020000 0x1000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&mdma 24 0x2 0x12000a02 0x0 0x0>,
-				       <&mdma 24 0x2 0x12000a08 0x0 0x0>,
-				       <&mdma 25 0x2 0x12000a0a 0x0 0x0>;
-				dma-names = "tx", "rx", "ecc";
-				status = "disabled";
-			};
-		};
-
-		qspi: spi@58003000 {
-			compatible = "st,stm32f469-qspi";
-			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
-			reg-names = "qspi", "qspi_mm";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma 26 0x2 0x10100002 0x0 0x0>,
-			       <&mdma 26 0x2 0x10100008 0x0 0x0>;
-			dma-names = "tx", "rx";
-			clocks = <&rcc QSPI_K>;
-			resets = <&rcc QSPI_R>;
-			status = "disabled";
-		};
-
-		sdmmc1: mmc@58005000 {
-			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x20253180>;
-			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
-			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SDMMC1_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC1_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <130000000>;
-			status = "disabled";
-		};
-
-		sdmmc2: mmc@58007000 {
-			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x20253180>;
-			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SDMMC2_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC2_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <130000000>;
-			status = "disabled";
-		};
-
 		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
@@ -1342,29 +850,6 @@ iwdg2: watchdog@5a002000 {
 			status = "disabled";
 		};
 
-		usbphyc: usbphyc@5a006000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			#clock-cells = <0>;
-			compatible = "st,stm32mp1-usbphyc";
-			reg = <0x5a006000 0x1000>;
-			clocks = <&rcc USBPHY_K>;
-			resets = <&rcc USBPHY_R>;
-			vdda1v1-supply = <&scmi_reg11>;
-			vdda1v8-supply = <&scmi_reg18>;
-			status = "disabled";
-
-			usbphyc_port0: usb-phy@0 {
-				#phy-cells = <0>;
-				reg = <0>;
-			};
-
-			usbphyc_port1: usb-phy@1 {
-				#phy-cells = <1>;
-				reg = <1>;
-			};
-		};
-
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;
@@ -1393,6 +878,527 @@ ts_cal2: calib@5e {
 			};
 		};
 
+		etzpc: bus@5c007000 {
+			compatible = "st,stm32-etzpc", "simple-bus";
+			reg = <0x5c007000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			adc_2: adc@48004000 {
+				compatible = "st,stm32mp13-adc-core";
+				reg = <0x48004000 0x400>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc ADC2>, <&rcc ADC2_K>;
+				clock-names = "bus", "adc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				adc2: adc@0 {
+					compatible = "st,stm32mp13-adc";
+					#io-channel-cells = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+					interrupt-parent = <&adc_2>;
+					interrupts = <0>;
+					dmas = <&dmamux1 10 0x400 0x80000001>;
+					dma-names = "rx";
+					status = "disabled";
+
+					channel@13 {
+						reg = <13>;
+						label = "vrefint";
+					};
+					channel@14 {
+						reg = <14>;
+						label = "vddcore";
+					};
+					channel@16 {
+						reg = <16>;
+						label = "vddcpu";
+					};
+					channel@17 {
+						reg = <17>;
+						label = "vddq_ddr";
+					};
+				};
+			};
+
+			usbotg_hs: usb@49000000 {
+				compatible = "st,stm32mp15-hsotg", "snps,dwc2";
+				reg = <0x49000000 0x40000>;
+				clocks = <&rcc USBO_K>;
+				clock-names = "otg";
+				resets = <&rcc USBO_R>;
+				reset-names = "dwc2";
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				g-rx-fifo-size = <512>;
+				g-np-tx-fifo-size = <32>;
+				g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
+				dr_mode = "otg";
+				otg-rev = <0x200>;
+				usb33d-supply = <&scmi_usb33>;
+				status = "disabled";
+			};
+
+			usart1: serial@4c000000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x4c000000 0x400>;
+				interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc USART1_K>;
+				resets = <&rcc USART1_R>;
+				wakeup-source;
+				dmas = <&dmamux1 41 0x400 0x5>,
+				<&dmamux1 42 0x400 0x1>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			usart2: serial@4c001000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x4c001000 0x400>;
+				interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc USART2_K>;
+				resets = <&rcc USART2_R>;
+				wakeup-source;
+				dmas = <&dmamux1 43 0x400 0x5>,
+				<&dmamux1 44 0x400 0x1>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			i2s4: audio-controller@4c002000 {
+				compatible = "st,stm32h7-i2s";
+				reg = <0x4c002000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 83 0x400 0x01>,
+				<&dmamux1 84 0x400 0x01>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			spi4: spi@4c002000 {
+				compatible = "st,stm32h7-spi";
+				reg = <0x4c002000 0x400>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc SPI4_K>;
+				resets = <&rcc SPI4_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 83 0x400 0x01>,
+				       <&dmamux1 84 0x400 0x01>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			spi5: spi@4c003000 {
+				compatible = "st,stm32h7-spi";
+				reg = <0x4c003000 0x400>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc SPI5_K>;
+				resets = <&rcc SPI5_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 85 0x400 0x01>,
+				       <&dmamux1 86 0x400 0x01>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			i2c3: i2c@4c004000 {
+				compatible = "st,stm32mp13-i2c";
+				reg = <0x4c004000 0x400>;
+				interrupt-names = "event", "error";
+				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc I2C3_K>;
+				resets = <&rcc I2C3_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 73 0x400 0x1>,
+				       <&dmamux1 74 0x400 0x1>;
+				dma-names = "rx", "tx";
+				st,syscfg-fmp = <&syscfg 0x4 0x4>;
+				i2c-analog-filter;
+				status = "disabled";
+			};
+
+			i2c4: i2c@4c005000 {
+				compatible = "st,stm32mp13-i2c";
+				reg = <0x4c005000 0x400>;
+				interrupt-names = "event", "error";
+				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc I2C4_K>;
+				resets = <&rcc I2C4_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 75 0x400 0x1>,
+				       <&dmamux1 76 0x400 0x1>;
+				dma-names = "rx", "tx";
+				st,syscfg-fmp = <&syscfg 0x4 0x8>;
+				i2c-analog-filter;
+				status = "disabled";
+			};
+
+			i2c5: i2c@4c006000 {
+				compatible = "st,stm32mp13-i2c";
+				reg = <0x4c006000 0x400>;
+				interrupt-names = "event", "error";
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc I2C5_K>;
+				resets = <&rcc I2C5_R>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dmas = <&dmamux1 115 0x400 0x1>,
+				       <&dmamux1 116 0x400 0x1>;
+				dma-names = "rx", "tx";
+				st,syscfg-fmp = <&syscfg 0x4 0x10>;
+				i2c-analog-filter;
+				status = "disabled";
+			};
+
+			timers12: timer@4c007000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-timers";
+				reg = <0x4c007000 0x400>;
+				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc TIM12_K>;
+				clock-names = "int";
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@11 {
+					compatible = "st,stm32h7-timer-trigger";
+					reg = <11>;
+					status = "disabled";
+				};
+			};
+
+			timers13: timer@4c008000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-timers";
+				reg = <0x4c008000 0x400>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc TIM13_K>;
+				clock-names = "int";
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@12 {
+					compatible = "st,stm32h7-timer-trigger";
+					reg = <12>;
+					status = "disabled";
+				};
+			};
+
+			timers14: timer@4c009000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-timers";
+				reg = <0x4c009000 0x400>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc TIM14_K>;
+				clock-names = "int";
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@13 {
+					compatible = "st,stm32h7-timer-trigger";
+					reg = <13>;
+					status = "disabled";
+				};
+			};
+
+			timers15: timer@4c00a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-timers";
+				reg = <0x4c00a000 0x400>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc TIM15_K>;
+				clock-names = "int";
+				dmas = <&dmamux1 105 0x400 0x1>,
+				<&dmamux1 106 0x400 0x1>,
+				<&dmamux1 107 0x400 0x1>,
+				<&dmamux1 108 0x400 0x1>;
+				dma-names = "ch1", "up", "trig", "com";
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@14 {
+					compatible = "st,stm32h7-timer-trigger";
+					reg = <14>;
+					status = "disabled";
+				};
+			};
+
+			timers16: timer@4c00b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-timers";
+				reg = <0x4c00b000 0x400>;
+				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc TIM16_K>;
+				clock-names = "int";
+				dmas = <&dmamux1 109 0x400 0x1>,
+				<&dmamux1 110 0x400 0x1>;
+				dma-names = "ch1", "up";
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@15 {
+					compatible = "st,stm32h7-timer-trigger";
+					reg = <15>;
+					status = "disabled";
+				};
+			};
+
+			timers17: timer@4c00c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-timers";
+				reg = <0x4c00c000 0x400>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc TIM17_K>;
+				clock-names = "int";
+				dmas = <&dmamux1 111 0x400 0x1>,
+				       <&dmamux1 112 0x400 0x1>;
+				dma-names = "ch1", "up";
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@16 {
+					compatible = "st,stm32h7-timer-trigger";
+					reg = <16>;
+					status = "disabled";
+				};
+			};
+
+			lptimer2: timer@50021000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-lptimer";
+				reg = <0x50021000 0x400>;
+				interrupts-extended = <&exti 48 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc LPTIM2_K>;
+				clock-names = "mux";
+				wakeup-source;
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				trigger@1 {
+					compatible = "st,stm32-lptimer-trigger";
+					reg = <1>;
+					status = "disabled";
+				};
+
+				counter {
+					compatible = "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+			};
+
+			lptimer3: timer@50022000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32-lptimer";
+				reg = <0x50022000 0x400>;
+				interrupts-extended = <&exti 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc LPTIM3_K>;
+				clock-names = "mux";
+				wakeup-source;
+				status = "disabled";
+
+				pwm {
+					compatible = "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				trigger@2 {
+					compatible = "st,stm32-lptimer-trigger";
+					reg = <2>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+			};
+
+			hash: hash@54003000 {
+				compatible = "st,stm32mp13-hash";
+				reg = <0x54003000 0x400>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc HASH1>;
+				resets = <&rcc HASH1_R>;
+				dmas = <&mdma 30 0x2 0x1000a02 0x0 0x0>;
+				dma-names = "in";
+			};
+
+			rng: rng@54004000 {
+				compatible = "st,stm32mp13-rng";
+				reg = <0x54004000 0x400>;
+				clocks = <&rcc RNG1_K>;
+				resets = <&rcc RNG1_R>;
+			};
+
+			fmc: memory-controller@58002000 {
+				compatible = "st,stm32mp1-fmc2-ebi";
+				reg = <0x58002000 0x1000>;
+				ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
+					 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
+					 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
+					 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
+					 <4 0 0x80000000 0x10000000>; /* NAND */
+				#address-cells = <2>;
+				#size-cells = <1>;
+				clocks = <&rcc FMC_K>;
+				resets = <&rcc FMC_R>;
+				status = "disabled";
+
+				nand-controller@4,0 {
+					compatible = "st,stm32mp1-fmc2-nfc";
+					reg = <4 0x00000000 0x1000>,
+					      <4 0x08010000 0x1000>,
+					      <4 0x08020000 0x1000>,
+					      <4 0x01000000 0x1000>,
+					      <4 0x09010000 0x1000>,
+					      <4 0x09020000 0x1000>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&mdma 24 0x2 0x12000a02 0x0 0x0>,
+					       <&mdma 24 0x2 0x12000a08 0x0 0x0>,
+					       <&mdma 25 0x2 0x12000a0a 0x0 0x0>;
+					dma-names = "tx", "rx", "ecc";
+					status = "disabled";
+				};
+			};
+
+			qspi: spi@58003000 {
+				compatible = "st,stm32f469-qspi";
+				reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
+				reg-names = "qspi", "qspi_mm";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&mdma 26 0x2 0x10100002 0x0 0x0>,
+				       <&mdma 26 0x2 0x10100008 0x0 0x0>;
+				dma-names = "tx", "rx";
+				clocks = <&rcc QSPI_K>;
+				resets = <&rcc QSPI_R>;
+				status = "disabled";
+			};
+
+			sdmmc1: mmc@58005000 {
+				compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x20253180>;
+				reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc SDMMC1_K>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC1_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <130000000>;
+				status = "disabled";
+			};
+
+			sdmmc2: mmc@58007000 {
+				compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x20253180>;
+				reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
+				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc SDMMC2_K>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <130000000>;
+				status = "disabled";
+			};
+
+			usbphyc: usbphyc@5a006000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#clock-cells = <0>;
+				compatible = "st,stm32mp1-usbphyc";
+				reg = <0x5a006000 0x1000>;
+				clocks = <&rcc USBPHY_K>;
+				resets = <&rcc USBPHY_R>;
+				vdda1v1-supply = <&scmi_reg11>;
+				vdda1v8-supply = <&scmi_reg18>;
+				status = "disabled";
+
+				usbphyc_port0: usb-phy@0 {
+					#phy-cells = <0>;
+					reg = <0>;
+				};
+
+				usbphyc_port1: usb-phy@1 {
+					#phy-cells = <1>;
+					reg = <1>;
+				};
+			};
+		};
+
 		/*
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
@@ -1404,6 +1410,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index df451c3c2a26..c4d3a520c14b 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -33,35 +33,37 @@ m_can2: can@4400f000 {
 			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
 			status = "disabled";
 		};
+	};
+};
 
-		adc_1: adc@48003000 {
-			compatible = "st,stm32mp13-adc-core";
-			reg = <0x48003000 0x400>;
-			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc ADC1>, <&rcc ADC1_K>;
-			clock-names = "bus", "adc";
-			interrupt-controller;
-			#interrupt-cells = <1>;
+&etzpc {
+	adc_1: adc@48003000 {
+		compatible = "st,stm32mp13-adc-core";
+		reg = <0x48003000 0x400>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rcc ADC1>, <&rcc ADC1_K>;
+		clock-names = "bus", "adc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		adc1: adc@0 {
+			compatible = "st,stm32mp13-adc";
+			#io-channel-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			reg = <0x0>;
+			interrupt-parent = <&adc_1>;
+			interrupts = <0>;
+			dmas = <&dmamux1 9 0x400 0x80000001>;
+			dma-names = "rx";
 			status = "disabled";
 
-			adc1: adc@0 {
-				compatible = "st,stm32mp13-adc";
-				#io-channel-cells = <1>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0x0>;
-				interrupt-parent = <&adc_1>;
-				interrupts = <0>;
-				dmas = <&dmamux1 9 0x400 0x80000001>;
-				dma-names = "rx";
-				status = "disabled";
-
-				channel@18 {
-					reg = <18>;
-					label = "vrefint";
-				};
+			channel@18 {
+				reg = <18>;
+				label = "vrefint";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp13xc.dtsi b/arch/arm/boot/dts/st/stm32mp13xc.dtsi
index 4d00e7592882..b9fb071a1471 100644
--- a/arch/arm/boot/dts/st/stm32mp13xc.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xc.dtsi
@@ -4,15 +4,13 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 
-/ {
-	soc {
-		cryp: crypto@54002000 {
-			compatible = "st,stm32mp1-cryp";
-			reg = <0x54002000 0x400>;
-			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CRYP1>;
-			resets = <&rcc CRYP1_R>;
-			status = "disabled";
-		};
+&etzpc {
+	cryp: crypto@54002000 {
+		compatible = "st,stm32mp1-cryp";
+		reg = <0x54002000 0x400>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rcc CRYP1>;
+		resets = <&rcc CRYP1_R>;
+		status = "disabled";
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp13xf.dtsi b/arch/arm/boot/dts/st/stm32mp13xf.dtsi
index 4d00e7592882..b9fb071a1471 100644
--- a/arch/arm/boot/dts/st/stm32mp13xf.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xf.dtsi
@@ -4,15 +4,13 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 
-/ {
-	soc {
-		cryp: crypto@54002000 {
-			compatible = "st,stm32mp1-cryp";
-			reg = <0x54002000 0x400>;
-			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CRYP1>;
-			resets = <&rcc CRYP1_R>;
-			status = "disabled";
-		};
+&etzpc {
+	cryp: crypto@54002000 {
+		compatible = "st,stm32mp1-cryp";
+		reg = <0x54002000 0x400>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rcc CRYP1>;
+		resets = <&rcc CRYP1_R>;
+		status = "disabled";
 	};
 };
-- 
2.25.1


