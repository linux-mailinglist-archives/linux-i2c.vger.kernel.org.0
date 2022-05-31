Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B82A539276
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344812AbiEaNwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241180AbiEaNv6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:51:58 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2D39A982
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:51:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u3so18782487wrg.3
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lS6mPjcp3pJcGZKSKOrBRDQ5D/bjAdtV0DGXyq7R5yA=;
        b=jWZkTEvodPuiB96Qs6mXattako2shiUcmHOK5JCPnAa/+dANk3kCQEaU2j85maInOS
         7wccapwJAXJMVZSv5+22WnUBpFJo9r7NT/6S0QVmHHcnH5qh8r4urIOxZVxgFcsi0Gb/
         QG42jxpY2LIJZvOqzPN9R1RWaMUTe81vHnQNMi9Q5WKx/Zbaomv4SJJAsmekVgErWqtf
         89s8Cpd8ZdPXDgHVg7CM8bMLUKHuOm0mcoOg34P2RLVV1QQdIHx7UkLLvk1SGeQfCGoF
         9VmuXQD2zv3Xea/wA2mZUbXLA11NotIMmfx/FonKioSuGfAmLTCIcYFQW6OmwGnj17+K
         f18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lS6mPjcp3pJcGZKSKOrBRDQ5D/bjAdtV0DGXyq7R5yA=;
        b=uuk4bDAHKVmzWc7MfqjwvS3MjW3pRVu93k03cwNWLnK7S5rdUV1MhXnkHfFtZNLq7X
         WlKk2i94Ndw/wBNhehe4iPca/4csHRzB9zhOR+9bslfvW4Tj4gOyB+1ASG9OHUHPOYMv
         jgPMBceG7bIc2GXJXGLn1ySblZUplcp7LECifaFUFCsGSczQPk4DcjgdL0TZAloeWj6b
         cmWHgM8QVao7KKaVyuDLg7MmgfF9RIyw+WPotk6FUi80JItBO7i4mByoAZKujLPwSGK1
         9QPj35t7agSb+srJN6VTTKapaDy9ovnuKZfWXkS2oC8f4mqlT92WFT0CRmmYirVDudyO
         C0eg==
X-Gm-Message-State: AOAM532dG6LZd4L88eBKO8gpI7Zjo4m119GRgt0fpklgK9jW67j787KA
        3/N69XSTkhHDntJA9GKa/dESTQ==
X-Google-Smtp-Source: ABdhPJyxUqp7A5lKp0lBRLaWN+7I+dgn6zxQIsw6ockQUNU2QQ+BWz60+i5V4pEHknJmf3zXNnmz2Q==
X-Received: by 2002:adf:f905:0:b0:20f:ca3e:387f with SMTP id b5-20020adff905000000b0020fca3e387fmr42257311wrr.362.1654005069500;
        Tue, 31 May 2022 06:51:09 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:51:08 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 16/17] arm64: dts: mediatek: add mt8365 device-tree
Date:   Tue, 31 May 2022 15:50:25 +0200
Message-Id: <20220531135026.238475-17-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device-tree for the MT8365 SoC. More information can be found
about that SoC at the following address:
https://www.mediatek.com/products/aiot/i350-mt8365

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 1047 ++++++++++++++++++++++
 1 file changed, 1047 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
new file mode 100644
index 000000000000..e22b1d259418
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -0,0 +1,1047 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#include <dt-bindings/clock/mediatek,mt8365-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/mt8365-power.h>
+#include <dt-bindings/memory/mt8365-larb-port.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	compatible = "mediatek,mt8365";
+	interrupt-parent = <&sysirq>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		ovl0 = &ovl0;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		color0 = &color0;
+		ccorr0 = &ccorr0;
+		aal0 = &aal0;
+		gamma0 = &gamma0;
+		dither0 = &dither0;
+		dsi0 = &dsi0;
+		dpi0 = &dpi0;
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0: cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			clock-frequency = <1600000000>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			clock-frequency = <1600000000>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clock-frequency = <1600000000>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clock-frequency = <1600000000>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+	};
+
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt = <668750>;
+		};
+		opp-987000000 {
+			opp-hz = /bits/ 64 <987000000>;
+			opp-microvolt = <687500>;
+		};
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <706250>;
+		};
+		opp-1125000000 {
+			opp-hz = /bits/ 64 <1125000000>;
+			opp-microvolt = <725000>;
+		};
+		opp-1216000000 {
+			opp-hz = /bits/ 64 <1216000000>;
+			opp-microvolt = <750000>;
+		};
+		opp-1308000000 {
+			opp-hz = /bits/ 64 <1308000000>;
+			opp-microvolt = <775000>;
+		};
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <800000>;
+		};
+		opp-1466000000 {
+			opp-hz = /bits/ 64 <1466000000>;
+			opp-microvolt = <825000>;
+		};
+		opp-1533000000 {
+			opp-hz = /bits/ 64 <1533000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-1633000000 {
+			opp-hz = /bits/ 64 <1633000000>;
+			opp-microvolt = <887500>;
+		};
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <912500>;
+		};
+		opp-1767000000 {
+			opp-hz = /bits/ 64 <1767000000>;
+			opp-microvolt = <937500>;
+		};
+		opp-1834000000 {
+			opp-hz = /bits/ 64 <1834000000>;
+			opp-microvolt = <962500>;
+		};
+		opp-1917000000 {
+			opp-hz = /bits/ 64 <1917000000>;
+			opp-microvolt = <993750>;
+		};
+		opp-2001000000 {
+			opp-hz = /bits/ 64 <2001000000>;
+			opp-microvolt = <1025000>;
+		};
+	};
+
+	clk26m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
+		bl31_secmon_reserved: secmon@43000000 {
+			no-map;
+			reg = <0 0x43000000 0 0x20000>;
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <4>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x0c000000 0 0x80000>,
+			      <0 0x0c080000 0 0x80000>;
+
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt8365-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt8365-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pericfg: syscon@10003000 {
+			compatible = "mediatek,mt8365-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		syscfg_pctl: syscfg-pctl@10005000 {
+			compatible = "syscon";
+			reg = <0 0x10005000 0 0x1000>;
+		};
+
+		scpsys: syscon@10006000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			/* System Power Manager */
+			spm: power-controller {
+				compatible = "mediatek,mt8365-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domains of the SoC */
+				power-domain@MT8365_POWER_DOMAIN_MM {
+					reg = <MT8365_POWER_DOMAIN_MM>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>,
+						 <&mmsys CLK_MM_MM_SMI_COMMON>,
+						 <&mmsys CLK_MM_MM_SMI_COMM0>,
+						 <&mmsys CLK_MM_MM_SMI_COMM1>,
+						 <&mmsys CLK_MM_MM_SMI_LARB0>;
+					clock-names = "mm", "mm-0", "mm-1",
+						      "mm-2", "mm-3";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+					mediatek,infracfg_nao = <&infracfg_nao>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					power-domain@MT8365_POWER_DOMAIN_CAM {
+						reg = <MT8365_POWER_DOMAIN_CAM>;
+						clocks = <&camsys CLK_CAM_LARB2>,
+							 <&camsys CLK_CAM_SENIF>,
+							 <&camsys CLK_CAMSV0>,
+							 <&camsys CLK_CAMSV1>,
+							 <&camsys CLK_CAM_FDVT>,
+							 <&camsys CLK_CAM_WPE>;
+						clock-names = "cam-0", "cam-1",
+							      "cam-2", "cam-3",
+							      "cam-4", "cam-5";
+						#power-domain-cells = <0>;
+						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
+					};
+
+					power-domain@MT8365_POWER_DOMAIN_VDEC {
+						reg = <MT8365_POWER_DOMAIN_VDEC>;
+						#power-domain-cells = <0>;
+						mediatek,smi = <&smi_common>;
+					};
+
+					power-domain@MT8365_POWER_DOMAIN_VENC {
+						reg = <MT8365_POWER_DOMAIN_VENC>;
+						#power-domain-cells = <0>;
+						mediatek,smi = <&smi_common>;
+					};
+
+					power-domain@MT8365_POWER_DOMAIN_APU {
+						reg = <MT8365_POWER_DOMAIN_APU>;
+						clocks = <&infracfg CLK_IFR_APU_AXI>,
+							 <&apu CLK_APU_IPU_CK>,
+							 <&apu CLK_APU_AXI>,
+							 <&apu CLK_APU_JTAG>,
+							 <&apu CLK_APU_IF_CK>,
+							 <&apu CLK_APU_EDMA>,
+							 <&apu CLK_APU_AHB>;
+						clock-names = "apu", "apu-0",
+							      "apu-1", "apu-2",
+							      "apu-3", "apu-4",
+							      "apu-5";
+						#power-domain-cells = <0>;
+						mediatek,infracfg = <&infracfg>;
+						mediatek,smi = <&smi_common>;
+					};
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_CONN {
+					reg = <MT8365_POWER_DOMAIN_CONN>;
+					clocks = <&topckgen CLK_TOP_CONN_32K>,
+						 <&topckgen CLK_TOP_CONN_26M>;
+					clock-names = "conn", "conn1";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_MFG {
+					reg = <MT8365_POWER_DOMAIN_MFG>;
+					clocks = <&topckgen CLK_TOP_MFG_SEL>;
+					clock-names = "mfg";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_AUDIO {
+					reg = <MT8365_POWER_DOMAIN_AUDIO>;
+					clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+						 <&infracfg CLK_IFR_AUDIO>,
+						 <&infracfg CLK_IFR_AUD_26M_BK>;
+					clock-names = "audio", "audio1", "audio2";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_DSP {
+					reg = <MT8365_POWER_DOMAIN_DSP>;
+					clocks = <&topckgen CLK_TOP_DSP_SEL>,
+						 <&topckgen CLK_TOP_DSP_26M>;
+					clock-names = "dsp", "dsp1";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+			};
+		};
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
+		gpt: apxgpt@10008000 {
+			compatible = "mediatek,mt8365-timer",
+				     "mediatek,mt6577-timer";
+			reg = <0 0x10008000 0 0x1000>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_SYS_26M_D2>;
+			clock-names = "clk13m";
+		};
+
+		pio: pinctrl@1000b000 {
+			compatible = "mediatek,mt8365-pinctrl";
+			reg = <0 0x1000b000 0 0x1000>;
+			mediatek,pctl-regmap = <&syscfg_pctl>;
+			pins-are-numbered;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		apmixedsys: syscon@1000c000 {
+			compatible = "mediatek,mt8365-apmixedsys", "syscon";
+			reg = <0 0x1000c000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt8365-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
+				 <&infracfg CLK_IFR_PMIC_AP>,
+				 <&infracfg CLK_IFR_PWRAP_SYS>,
+				 <&infracfg CLK_IFR_PWRAP_TMR>;
+			clock-names = "spi", "wrap", "sys", "tmr";
+		};
+
+		keypad: kp@10010000 {
+			compatible = "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			wakeup-source;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
+		mcucfg: syscon@10200000 {
+			compatible = "mediatek,mt8365-mcucfg", "syscon";
+			reg = <0 0x10200000 0 0x2000>;
+			#clock-cells = <1>;
+		};
+
+		sysirq: intpol-controller@10200a80 {
+			compatible = "mediatek,mt8365-sysirq",
+				     "mediatek,mt6577-sysirq";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0 0x10200a80 0 0x20>;
+		};
+
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8365-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>;
+			#iommu-cells = <1>;
+		};
+
+		infracfg_nao: infracfg-nao@1020e000 {
+			compatible = "syscon";
+			reg = <0 0x1020e000 0 0x1000>;
+		};
+
+		rng: rng@1020f000 {
+			compatible = "mediatek,mt8365-rng",
+				     "mediatek,mt7623-rng";
+			reg = <0 0x1020f000 0 0x100>;
+			clocks = <&infracfg CLK_IFR_TRNG>;
+			clock-names = "rng";
+		};
+
+		apdma: dma-controller@11000280 {
+			compatible = "mediatek,mt8365-uart-dma",
+				     "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000280 0 0x80>,
+			      <0 0x11000300 0 0x80>,
+			      <0 0x11000380 0 0x80>,
+			      <0 0x11000400 0 0x80>,
+			      <0 0x11000580 0 0x80>,
+			      <0 0x11000600 0 0x80>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 47 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 48 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
+			dma-requests = <6>;
+			clocks = <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "apdma";
+			#dma-cells = <1>;
+		};
+
+		auxadc: adc@11001000 {
+			compatible = "mediatek,mt8365-auxadc",
+				     "mediatek,mt8173-auxadc";
+			reg = <0 0x11001000 0 0x1000>;
+			clocks = <&infracfg CLK_IFR_AUXADC>;
+			clock-names = "main";
+			#io-channel-cells = <1>;
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt8365-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&infracfg CLK_IFR_UART0>;
+			clock-names = "baud", "bus";
+			dmas = <&apdma 0
+				&apdma 1>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt8365-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&infracfg CLK_IFR_UART1>;
+			clock-names = "baud", "bus";
+			dmas = <&apdma 2
+				&apdma 3>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt8365-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x1000>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&infracfg CLK_IFR_UART2>;
+			clock-names = "baud", "bus";
+			dmas = <&apdma 4
+				&apdma 5>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		pwm: pwm@11006000 {
+			compatible = "mediatek,mt8365-pwm";
+			reg = <0 0x11006000 0 0x1000>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_IFR_PWM_HCLK>,
+				 <&infracfg CLK_IFR_PWM>,
+				 <&infracfg CLK_IFR_PWM1>,
+				 <&infracfg CLK_IFR_PWM2>,
+				 <&infracfg CLK_IFR_PWM3>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
+		};
+
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>,
+			      <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C0_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>,
+			      <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C1_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>,
+			      <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C2_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi: spi@1100a000 {
+			compatible = "mediatek,mt8365-spi",
+				     "mediatek,mt7622-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1100a000 0 0x100>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL2_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_IFR_SPI0>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		thermal: thermal@1100b000 {
+			compatible = "mediatek,mt8365-thermal";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_IFR_THERM>,
+				 <&infracfg CLK_IFR_AUXADC>;
+			clock-names = "therm", "auxadc";
+			mediatek,auxadc = <&auxadc>;
+			mediatek,apmixedsys = <&apmixedsys>;
+			nvmem-cells = <&thermal_calibration>;
+			nvmem-cell-names = "calibration-data";
+			#thermal-sensor-cells = <1>;
+		};
+
+		disp_pwm: disp-pwm@1100e000 {
+			compatible = "mediatek,mt8365-disp-pwm",
+				     "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
+				 <&infracfg CLK_IFR_DISP_PWM>;
+			clock-names = "main", "mm";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>,
+			      <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C3_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ssusb: usb@11201000 {
+			compatible = "mediatek,mt8365-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2e00>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u2port1 PHY_TYPE_USB2>;
+			clocks = <&topckgen CLK_TOP_SSUSB_TOP_CK_EN>,
+				 <&infracfg CLK_IFR_SSUSB_REF>,
+				 <&infracfg CLK_IFR_SSUSB_SYS>,
+				 <&infracfg CLK_IFR_ICUSB>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck",
+				      "dma_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host: usb@11200000 {
+				compatible = "mediatek,mt8365-xhci",
+					     "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_LOW>;
+				clocks = <&topckgen CLK_TOP_SSUSB_TOP_CK_EN>,
+					 <&infracfg CLK_IFR_SSUSB_REF>,
+					 <&infracfg CLK_IFR_SSUSB_SYS>,
+					 <&infracfg CLK_IFR_ICUSB>,
+					 <&infracfg CLK_IFR_SSUSB_XHCI>;
+				clock-names = "sys_ck", "ref_ck", "mcu_ck",
+					      "dma_ck", "xhci_ck";
+				status = "disabled";
+			};
+		};
+
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11230000 0 0x1000>,
+			      <0 0x11cd0000 0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
+				 <&infracfg CLK_IFR_MSDC0_HCLK>,
+				 <&infracfg CLK_IFR_MSDC0_SRC>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11240000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11240000 0 0x1000>,
+			      <0 0x11c90000 0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
+				 <&infracfg CLK_IFR_MSDC1_HCLK>,
+				 <&infracfg CLK_IFR_MSDC1_SRC>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		ethernet: ethernet@112a0000 {
+			compatible = "mediatek,mt8365-eth";
+			reg = <0 0x112a0000 0 0x1000>;
+			mediatek,pericfg = <&infracfg>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_ETH_SEL>,
+				 <&infracfg CLK_IFR_NIC_AXI>,
+				 <&infracfg CLK_IFR_NIC_SLV_AXI>;
+			clock-names = "core", "reg", "trans";
+			status = "disabled";
+		};
+
+		mipi_tx0: dsi-phy@11c00000 {
+			compatible = "mediatek,mt8365-mipi-tx",
+				     "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c00000 0 0x800>;
+			clocks = <&clk26m>;
+			clock-names = "ref_clk";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			clock-output-names = "mipi_tx0_pll";
+		};
+
+		efuse: efuse@11c50000 {
+			compatible = "mediatek,mt8365-efuse", "mediatek,efuse";
+			reg = <0 0x11c50000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			thermal_calibration: calib@180 {
+				reg = <0x180 0xc>;
+			};
+		};
+
+		u3phy: t-phy@11cc0000 {
+			compatible = "mediatek,mt8365-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <2>;
+			#phy-cells = <1>;
+			#size-cells = <2>;
+			ranges;
+			status = "okay";
+
+			u2port0: usb-phy@11cc0000 {
+				reg = <0 0x11cc0000 0 0x400>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_CK_EN>,
+					 <&topckgen CLK_TOP_USB20_48M_EN>;
+				clock-names = "ref", "da_ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+
+			u2port1: usb-phy@11cc1000 {
+				reg = <0 0x11cc1000 0 0x400>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_CK_EN>,
+					 <&topckgen CLK_TOP_USB20_48M_EN>;
+				clock-names = "ref", "da_ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+		};
+
+		mfgcfg: syscon@13000000 {
+			compatible = "mediatek,mt8365-mfgcfg", "syscon";
+			reg = <0 0x13000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mutex: mutex@14001000 {
+			compatible =  "mediatek,mt8365-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt8365-smi-common",
+				     "mediatek,mt8186-smi-common";
+			reg = <0 0x14002000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_MM_SMI_COMM0>,
+				 <&mmsys CLK_MM_MM_SMI_COMM1>;
+			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		larb0: larb@14003000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			mediatek,larb-id = <0>;
+		};
+
+		ovl0: ovl@1400b000 {
+			compatible = "mediatek,mt8365-disp-ovl",
+				     "mediatek,mt8192-disp-ovl";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+		};
+
+		rdma0: rdma@1400d000 {
+			compatible = "mediatek,mt8365-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_RDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,rdma-fifo-size = <5120>;
+		};
+
+		color0: color@1400f000 {
+			compatible = "mediatek,mt8365-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_COLOR0>;
+		};
+
+		ccorr0: ccorr@14010000 {
+			compatible = "mediatek,mt8365-disp-ccorr",
+				     "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_CCORR0>;
+		};
+
+		aal0: aal@14011000 {
+			compatible = "mediatek,mt8365-disp-aal",
+				     "mediatek,mt8183-disp-aal";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_AAL0>;
+		};
+
+		gamma0: gamma@14012000 {
+			compatible = "mediatek,mt8365-disp-gamma",
+				     "mediatek,mt8183-disp-gamma";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_GAMMA0>;
+		};
+
+		dither0: dither@14013000 {
+			compatible = "mediatek,mt8365-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x14013000 0 0x1000>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_DITHER0>;
+		};
+
+		dsi0: dsi@14014000 {
+			compatible = "mediatek,mt8365-dsi",
+				     "mediatek,mt8183-dsi";
+			reg = <0 0x14014000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DSI0>,
+				 <&mmsys CLK_MM_DSI0_DIG_DSI>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		rdma1: rdma@14016000 {
+			compatible = "mediatek,mt8365-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MM_DISP_RDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,rdma-fifo-size = <2048>;
+		};
+
+		dpi0: dpi@14018000 {
+			compatible = "mediatek,mt8365-dpi",
+				     "mediatek,mt8192-dpi";
+			reg = <0 0x14018000 0 0x1000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			clocks = <&topckgen CLK_TOP_DPI0_SEL>,
+				 <&mmsys CLK_MM_MM_DPI0>,
+				 <&apmixedsys CLK_APMIXED_LVDSPLL>,
+				 <&mmsys CLK_MM_DPI0_DPI0>;
+			clock-names = "pixel", "engine", "pll", "dpi";
+			status = "disabled";
+		};
+
+		camsys: syscon@15000000 {
+			compatible = "mediatek,mt8365-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb2: larb@15001000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_IMG>,
+				 <&camsys CLK_CAM_LARB2>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			mediatek,larb-id = <2>;
+		};
+
+		vdecsys: syscon@16000000 {
+			compatible = "mediatek,mt8365-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb3: larb@16010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_LARB1>,
+				 <&vdecsys CLK_VDEC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VDEC>;
+			mediatek,larb-id = <3>;
+		};
+
+		vencsys: syscon@17000000 {
+			compatible = "mediatek,mt8365-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb1: larb@17010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC>, <&vencsys CLK_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VENC>;
+			mediatek,larb-id = <1>;
+		};
+
+		apu: syscon@19020000 {
+			compatible = "mediatek,mt8365-apu", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <1000>; /* milliseconds */
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				threshold: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit: cpu_crit0 {
+					temperature = <117000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device =
+						<&cpu0
+						 THERMAL_NO_LIMIT
+						 THERMAL_NO_LIMIT>,
+						<&cpu1
+						 THERMAL_NO_LIMIT
+						 THERMAL_NO_LIMIT>,
+						<&cpu2
+						 THERMAL_NO_LIMIT
+						 THERMAL_NO_LIMIT>,
+						<&cpu3
+						 THERMAL_NO_LIMIT
+						 THERMAL_NO_LIMIT>;
+					contribution = <100>;
+				};
+			};
+		};
+
+		tzts1: tzts1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 1>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts2: tzts2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 2>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts3: tzts3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 3>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts4: tzts4-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 4>;
+			trips {};
+			cooling-maps {};
+		};
+	};
+
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};
-- 
2.36.1

