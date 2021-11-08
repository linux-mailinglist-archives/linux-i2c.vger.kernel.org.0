Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC134497D2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240853AbhKHPLp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:11:45 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:23970 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240847AbhKHPKb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384067; x=1667920067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4/7M3z76kv/YIpEtNq9m5VDAc2/s3Mft4/JhKERxudg=;
  b=dGs1vT+8yzApQa0WeOnLOB143QK4lo8Cj569DCNQr/e1ADcoemCgHuLf
   TtBKjVoctVwWWTNRJzFlBXxWG3WRjajVm80Atw3YHXjXerVpfCUBXOh5b
   fo4DjdFxU1LgAOT4BFO905Ul4Ljhy+hwuMgtUwv1N0tt92qHcBGvt3qxA
   0t5/NIXsKgKecbfYAiIL6kbIfdbgCl8hvMUVw20nMXeHlzpRhMmX77FHs
   OZOAZBQJgee6vrz8mcLT9b1SqdtLOogoxaBY3DiZmjitWbIZdejYmI3lH
   BO+dqUHHY5EOtlnk2C+mGWO2DNnINbj7l7SXG6nAAQZCY3pwiZRZrklvf
   g==;
IronPort-SDR: YN2AR1VoMRvQBh188H0EcEz8m9Hn1Wq0xii8FddSzHY7Ls1iEjaqT+4ASvsR9qp40rF+ZyJKMi
 P4KouHnUqGS3tb9eIy6A70VhdZoweMmPeleigmq7+4UQVh16gaVdzuBeVx8V7y4rcT3oGfqhmo
 flMCuR1OMs1L9B5uKvg8gJUanhKz+mFmbuxn5PXcRjbTjrujOWuS78H631V6KimfaLQ9QkCt1p
 Ns8R3TIWHuXElVSNs2J0b03e5JqOzBaaFR32jx6Fyzb4LYpOmwNj3+N39cAeT+thVilF3e/zLS
 O9eqEO9BK+6J+wcETh0PEbvh
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="138382851"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:43 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:39 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit device tree
Date:   Mon, 8 Nov 2021 15:05:53 +0000
Message-ID: <20211108150554.4457-13-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Update the device tree for the icicle kit by splitting it into a third part,
which contains peripherals in the fpga fabric, add new peripherals
(spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
map which have been changed.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  21 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 159 +++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 333 ++++++++++++++----
 3 files changed, 428 insertions(+), 85 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
new file mode 100644
index 000000000000..8fa3356494f1
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
+
+/ {
+	fpgadma: fpgadma@60020000 {
+		compatible = "microchip,mpfs-fpga-dma-uio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0x60020000 0x0 0x1000>;
+		interrupt-parent = <&plic>;
+		interrupts = <PLIC_INT_FABRIC_F2H_2>;
+		status = "okay";
+	};
+
+	fpgalsram: fpga_lsram@61000000 {
+		compatible = "generic-uio";
+		reg = <0x0 0x61000000 0x0 0x0001000
+			0x14 0x00000000 0x0 0x00010000>;
+		status = "okay";
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index fc1e5869df1b..4212129fcdf1 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 
@@ -13,72 +13,187 @@ / {
 	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	aliases {
-		ethernet0 = &emac1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		serial2 = &serial2;
-		serial3 = &serial3;
+		mmuart0 = &mmuart0;
+		mmuart1 = &mmuart1;
+		mmuart2 = &mmuart2;
+		mmuart3 = &mmuart3;
+		mmuart4 = &mmuart4;
 	};
 
 	chosen {
-		stdout-path = "serial0:115200n8";
+		stdout-path = "mmuart1:115200n8";
 	};
 
 	cpus {
 		timebase-frequency = <RTCCLK_FREQ>;
 	};
 
-	memory@80000000 {
+	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x40000000>;
-		clocks = <&clkcfg 26>;
+		reg = <0x0 0x80000000 0x0 0x2e000000>;
+		clocks = <&clkcfg CLK_DDRC>;
+		status = "okay";
+	};
+
+	ddrc_cache_hi: memory@1000000000 {
+		device_type = "memory";
+		reg = <0x10 0x0 0x0 0x40000000>;
+		clocks = <&clkcfg CLK_DDRC>;
+		status = "okay";
 	};
 };
 
-&serial0 {
+&mmuart1 {
 	status = "okay";
 };
 
-&serial1 {
+&mmuart2 {
 	status = "okay";
 };
 
-&serial2 {
+&mmuart3 {
 	status = "okay";
 };
 
-&serial3 {
+&mmuart4 {
 	status = "okay";
 };
 
 &mmc {
 	status = "okay";
-
 	bus-width = <4>;
 	disable-wp;
 	cap-sd-highspeed;
+	cap-mmc-highspeed;
 	card-detect-delay = <200>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
 	sd-uhs-sdr12;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 };
 
-&emac0 {
+&spi0 {
+	status = "okay";
+	spidev@0 {
+		compatible = "spidev";
+		reg = <0>; /* CS 0 */
+		spi-max-frequency = <10000000>;
+		status = "okay";
+	};
+};
+
+&spi1 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	pac193x: pac193x@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+		samp-rate = <64>;
+		status = "okay";
+		ch0: channel0 {
+			uohms-shunt-res = <10000>;
+			rail-name = "VDDREG";
+			channel_enabled;
+		};
+		ch1: channel1 {
+			uohms-shunt-res = <10000>;
+			rail-name = "VDDA25";
+			channel_enabled;
+		};
+		ch2: channel2 {
+			uohms-shunt-res = <10000>;
+			rail-name = "VDD25";
+			channel_enabled;
+		};
+		ch3: channel3 {
+			uohms-shunt-res = <10000>;
+			rail-name = "VDDA_REG";
+			channel_enabled;
+		};
+	};
+};
+
+&mac0 {
+	status = "okay";
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
-	phy0: ethernet-phy@8 {
-		reg = <8>;
-		ti,fifo-depth = <0x01>;
-	};
 };
 
-&emac1 {
+&mac1 {
 	status = "okay";
 	phy-mode = "sgmii";
 	phy-handle = <&phy1>;
 	phy1: ethernet-phy@9 {
 		reg = <9>;
-		ti,fifo-depth = <0x01>;
+		ti,fifo-depth = <0x1>;
+	};
+	phy0: ethernet-phy@8 {
+		reg = <8>;
+		ti,fifo-depth = <0x1>;
 	};
 };
+
+&gpio2 {
+	interrupts = <PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT
+		PLIC_INT_GPIO2_NON_DIRECT>;
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&mbox {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c9f6d205d2ba..805e07f0169e 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
-/dts-v1/;
+#include "dt-bindings/clock/microchip,mpfs-clock.h"
+#include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
+#include "dt-bindings/interrupt-controller/riscv-hart.h"
+#include "microchip-mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
@@ -16,8 +19,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
-			clock-frequency = <0>;
+		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -25,6 +27,7 @@ cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			clocks = <&clkcfg CLK_CPU>;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -34,8 +37,7 @@ cpu0_intc: interrupt-controller {
 			};
 		};
 
-		cpu@1 {
-			clock-frequency = <0>;
+		cpu1: cpu@1 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -51,6 +53,7 @@ cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -61,8 +64,7 @@ cpu1_intc: interrupt-controller {
 			};
 		};
 
-		cpu@2 {
-			clock-frequency = <0>;
+		cpu2: cpu@2 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -78,6 +80,7 @@ cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -88,8 +91,7 @@ cpu2_intc: interrupt-controller {
 			};
 		};
 
-		cpu@3 {
-			clock-frequency = <0>;
+		cpu3: cpu@3 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -105,6 +107,7 @@ cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -115,8 +118,7 @@ cpu3_intc: interrupt-controller {
 			};
 		};
 
-		cpu@4 {
-			clock-frequency = <0>;
+		cpu4: cpu@4 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -132,8 +134,10 @@ cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
+
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				compatible = "riscv,cpu-intc";
@@ -145,49 +149,55 @@ cpu4_intc: interrupt-controller {
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
-		compatible = "simple-bus";
+		compatible = "microchip,mpfs-soc", "simple-bus";
 		ranges;
 
-		cache-controller@2010000 {
+		cctrllr: cache-controller@2010000 {
 			compatible = "sifive,fu540-c000-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_L2_METADATA_CORR
+				PLIC_INT_L2_METADAT_UNCORR
+				PLIC_INT_L2_DATA_CORR>;
 			cache-block-size = <64>;
 			cache-level = <2>;
 			cache-sets = <1024>;
 			cache-size = <2097152>;
 			cache-unified;
-			interrupt-parent = <&plic>;
-			interrupts = <1 2 3>;
-			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 
-		clint@2000000 {
+		clint: clint@2000000 {
 			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
-			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
-						&cpu1_intc 3 &cpu1_intc 7
-						&cpu2_intc 3 &cpu2_intc 7
-						&cpu3_intc 3 &cpu3_intc 7
-						&cpu4_intc 3 &cpu4_intc 7>;
+			interrupts-extended =
+					<&cpu0_intc HART_INT_M_SOFT &cpu0_intc HART_INT_M_TIMER
+					 &cpu1_intc HART_INT_M_SOFT &cpu1_intc HART_INT_M_TIMER
+					 &cpu2_intc HART_INT_M_SOFT &cpu2_intc HART_INT_M_TIMER
+					 &cpu3_intc HART_INT_M_SOFT &cpu3_intc HART_INT_M_TIMER
+					 &cpu4_intc HART_INT_M_SOFT &cpu4_intc HART_INT_M_TIMER>;
 		};
 
 		plic: interrupt-controller@c000000 {
-			#interrupt-cells = <1>;
-			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
+			compatible = "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
+			#interrupt-cells = <1>;
 			riscv,ndev = <186>;
 			interrupt-controller;
-			interrupts-extended = <&cpu0_intc 11
-					&cpu1_intc 11 &cpu1_intc 9
-					&cpu2_intc 11 &cpu2_intc 9
-					&cpu3_intc 11 &cpu3_intc 9
-					&cpu4_intc 11 &cpu4_intc 9>;
+			interrupts-extended = <&cpu0_intc HART_INT_M_EXT
+					&cpu1_intc HART_INT_M_EXT &cpu1_intc HART_INT_S_EXT
+					&cpu2_intc HART_INT_M_EXT &cpu2_intc HART_INT_S_EXT
+					&cpu3_intc HART_INT_M_EXT &cpu3_intc HART_INT_S_EXT
+					&cpu4_intc HART_INT_M_EXT &cpu4_intc HART_INT_S_EXT>;
 		};
 
-		dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
+		pdma: pdma@3000000 {
+			compatible = "microchip,mpfs-pdma-uio";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
-			interrupts = <23 24 25 26 27 28 29 30>;
+			interrupts = <PLIC_INT_DMA_CH0_DONE PLIC_INT_DMA_CH0_ERR
+				PLIC_INT_DMA_CH1_DONE PLIC_INT_DMA_CH1_ERR
+				PLIC_INT_DMA_CH2_DONE PLIC_INT_DMA_CH2_ERR
+				PLIC_INT_DMA_CH3_DONE PLIC_INT_DMA_CH3_ERR>;
 			#dma-cells = <1>;
 		};
 
@@ -205,7 +215,7 @@ clkcfg: clkcfg@20002000 {
 			clocks = <&refclk>;
 			#clock-cells = <1>;
 			clock-output-names = "cpu", "axi", "ahb", "envm",	/* 0-3   */
-				 "mac0", "mac1", "mmc", "timer",		/* 4-7   */
+				"mac0", "mac1", "mmc", "timer",			/* 4-7   */
 				"mmuart0", "mmuart1", "mmuart2", "mmuart3",	/* 8-11  */
 				"mmuart4", "spi0", "spi1", "i2c0",		/* 12-15 */
 				"i2c1", "can0", "can1", "usb",			/* 16-19 */
@@ -214,90 +224,287 @@ clkcfg: clkcfg@20002000 {
 				"fic1", "fic2", "fic3", "athena", "cfm";	/* 28-32 */
 		};
 
-		serial0: serial@20000000 {
+		mmuart0: serial@20000000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20000000 0x0 0x400>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			clocks = <&clkcfg CLK_MMUART0>;
 			interrupt-parent = <&plic>;
-			interrupts = <90>;
+			interrupts = <PLIC_INT_MMUART0>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 8>;
-			status = "disabled";
+			status = "disabled"; /* Reserved for the HSS */
 		};
 
-		serial1: serial@20100000 {
+		mmuart1: serial@20100000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20100000 0x0 0x400>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			clocks = <&clkcfg CLK_MMUART1>;
 			interrupt-parent = <&plic>;
-			interrupts = <91>;
+			interrupts = <PLIC_INT_MMUART1>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 9>;
 			status = "disabled";
 		};
 
-		serial2: serial@20102000 {
+		mmuart2: serial@20102000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20102000 0x0 0x400>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			clocks = <&clkcfg CLK_MMUART2>;
 			interrupt-parent = <&plic>;
-			interrupts = <92>;
+			interrupts = <PLIC_INT_MMUART2>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 10>;
 			status = "disabled";
 		};
 
-		serial3: serial@20104000 {
+		mmuart3: serial@20104000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20104000 0x0 0x400>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			clocks = <&clkcfg CLK_MMUART3>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_MMUART3>;
+			current-speed = <115200>;
+			status = "disabled";
+		};
+
+		mmuart4: serial@20106000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20106000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			clocks = <&clkcfg CLK_MMUART4>;
 			interrupt-parent = <&plic>;
-			interrupts = <93>;
+			interrupts = <PLIC_INT_MMUART4>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 11>;
 			status = "disabled";
 		};
 
-		/* Common node entry for emmc/sd */
-		mmc: mmc@20008000 {
+		mmc: mmc@20008000 { /* Common node entry for emmc/sd */
 			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_MMC>;
 			interrupt-parent = <&plic>;
-			interrupts = <88 89>;
-			clocks = <&clkcfg 6>;
+			interrupts = <PLIC_INT_MMC_MAIN PLIC_INT_MMC_WAKEUP>;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
 
-		emac0: ethernet@20110000 {
-			compatible = "cdns,macb";
-			reg = <0x0 0x20110000 0x0 0x2000>;
+		spi0: spi@20108000 {
+			compatible = "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20108000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_SPI0>;
 			interrupt-parent = <&plic>;
-			interrupts = <64 65 66 67>;
-			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg 4>, <&clkcfg 2>;
-			clock-names = "pclk", "hclk";
+			interrupts = <PLIC_INT_SPI0>;
+			spi-max-frequency = <25000000>;
+			num-cs = <8>;
+			status = "disabled";
+		};
+
+		spi1: spi@20109000 {
+			compatible = "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20109000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_SPI1>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_SPI1>;
+			spi-max-frequency = <25000000>;
+			num-cs = <8>;
+			status = "disabled";
+		};
+
+		qspi: qspi@21000000 {
+			compatible = "microchip,mpfs-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x21000000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_QSPI>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_QSPI>;
+			spi-max-frequency = <25000000>;
+			num-cs = <8>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2010a000 {
+			compatible = "microchip,mpfs-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x2010a000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_I2C0>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_I2C0_MAIN>;
+			clock-frequency = <100000>;
 			status = "disabled";
+		};
+
+		i2c1: i2c@2010b000 {
+			compatible = "microchip,mpfs-i2c";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			reg = <0x0 0x2010b000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_I2C1>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_I2C1_MAIN>;
+			clock-frequency = <100000>;
+			status = "disabled";
 		};
 
-		emac1: ethernet@20112000 {
+		mac0: ethernet@20110000 {
 			compatible = "cdns,macb";
-			reg = <0x0 0x20112000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20110000 0x0 0x2000>;
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
+			clock-names = "pclk", "hclk";
 			interrupt-parent = <&plic>;
-			interrupts = <70 71 72 73>;
-			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg 5>, <&clkcfg 2>;
+			interrupts = <PLIC_INT_MAC0_INT
+				PLIC_INT_MAC0_QUEUE1
+				PLIC_INT_MAC0_QUEUE2
+				PLIC_INT_MAC0_QUEUE3
+				PLIC_INT_MAC0_EMAC
+				PLIC_INT_MAC0_MMSL>;
+			mac-address = [56 34 12 00 FC 01];
 			status = "disabled";
+		};
+
+		mac1: ethernet@20112000 {
+			compatible = "cdns,macb";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20112000 0x0 0x2000>;
+			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_MAC1_INT
+				PLIC_INT_MAC1_QUEUE1
+				PLIC_INT_MAC1_QUEUE2
+				PLIC_INT_MAC1_QUEUE3
+				PLIC_INT_MAC1_EMAC
+				PLIC_INT_MAC1_MMSL>;
+			mac-address = [56 34 12 00 FC 02];
+			status = "disabled";
+		};
+
+		gpio0: gpio@20120000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20120000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_GPIO0>;
+			interrupt-parent = <&plic>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@20121000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <000 0x20121000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_GPIO1>;
+			interrupt-parent = <&plic>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio@20122000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20122000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_GPIO2>;
+			interrupt-parent = <&plic>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rtc: rtc@20124000 {
+			compatible = "microchip,mpfs-rtc";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			reg = <0x0 0x20124000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_RTC>;
+			clock-names = "rtc";
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_RTC_WAKEUP PLIC_INT_RTC_MATCH>;
+			status = "disabled";
 		};
 
+		usb: usb@20201000 {
+			compatible = "microchip,mpfs-usb-host";
+			reg = <0x0 0x20201000 0x0 0x1000>;
+			reg-names = "mc","control";
+			clocks = <&clkcfg CLK_USB>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;
+			interrupt-names = "dma","mc";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		mbox: mailbox@37020000 {
+			compatible = "microchip,mpfs-mailbox";
+			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_G5C_MESSAGE>;
+			#mbox-cells = <1>;
+			status = "disabled";
+		};
+
+		pcie: pcie@2000000000 {
+			compatible = "microchip,pcie-host-1.0";
+			#address-cells = <0x3>;
+			#interrupt-cells = <0x1>;
+			#size-cells = <0x2>;
+			device_type = "pci";
+			reg = <0x20 0x0 0x0 0x8000000 0x0 0x43000000 0x0 0x10000>;
+			reg-names = "cfg", "apb";
+			clocks = <&clkcfg CLK_FIC0>, <&clkcfg CLK_FIC1>, <&clkcfg CLK_FIC3>;
+			clock-names = "fic0", "fic1", "fic3";
+			bus-range = <0x0 0x7f>;
+			interrupt-parent = <&plic>;
+			interrupts = <PLIC_INT_FABRIC_F2H_1>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			interrupt-map-mask = <0 0 0 7>;
+			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
+			msi-parent = <&pcie>;
+			msi-controller;
+			mchp,axi-m-atr0 = <0x10 0x0>;
+			status = "disabled";
+			pcie_intc: legacy-interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		syscontroller: syscontroller {
+			compatible = "microchip,mpfs-sys-controller";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			mboxes = <&mbox 0>;
+		};
+
+		hwrandom: hwrandom {
+			compatible = "microchip,mpfs-rng";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			syscontroller = <&syscontroller>;
+		};
+
+		sysserv: sysserv {
+			compatible = "microchip,mpfs-generic-service";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			syscontroller = <&syscontroller>;
+		};
 	};
 };
-- 
2.33.1

