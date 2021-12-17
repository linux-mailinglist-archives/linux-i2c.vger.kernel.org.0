Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A232C4787A7
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbhLQJeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:34:02 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:56762 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbhLQJd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733637; x=1671269637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V0ZJL8D6Q+4mRdoaB2x0g1ZNQFGEK854A726+GEtKHw=;
  b=ZP1mls2TWUleMft8gklAApaxTVRTZwsG8IdBk0518uMZdN0a5wvTUTPO
   OWPom29ChgEgn4NBDL8EiSHEyefMJeVXtZEgwJK+7+GHdgUIglq+E3V0t
   S1NmDouIWVO7xWApwycD4qb810BTnEQ5KC07hvV/v24Jkz6sAxIdNz2HK
   FAERDOQ8xUWtfXpxWhXlCNXFfxqSYG412c0ALlBbWus8bNlguCJ+AMOBY
   GKAvsUcrGknyM0of+gjyxInuuHfLgw61ycuDcLndvdmheDUtu+dUmERYn
   XEQDoEh8EHm+wZTVzco9nZvdE/kK+Ep4GgssWDnRCZJzLXlIq7iU6IaS0
   Q==;
IronPort-SDR: 7Kw5bP+EclTbeLT+LuDKHPnj86Ym8w8CEEHXHLa81TV3eopXkMJUWrAGNyuOv5lyV1B4jUorIG
 t3qkOW6lAvLBHSflkXcWf5HxnhX6uUXMxXvrai/aw8H6cU24ia550MdSt25pn+Ymssuvsbu3mL
 QrBo4q9vpeha8eEEbjorNMy7lKJhSPbARe9RkQDk2D3zz+Pw0WzUh5Qi2fPQCdJrAtzp+rl/Q/
 sf7BqgU6SdKZqOWZ41KX3Fjozrj++NTI3xDQUOMnPa2hNr1sknnM0hFp41jnuc4TUfSW+D69An
 bm3x78dfr1vsHvh7CTjxl2uM
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147002782"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:41 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: [PATCH v2 15/17] riscv: dts: microchip: refactor icicle kit device tree
Date:   Fri, 17 Dec 2021 09:33:23 +0000
Message-ID: <20211217093325.30612-16-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Assorted minor changes to the MPFS/Icicle kit device tree:

- rename serial to mmuart to match microchip documentation
- enable mmuart4 instead of mmuart0
- move stdout path to serial1 to avoid collision with
	bootloader running on the e51
- split memory node to match updated fpga design
- move phy0 inside mac1 node to match phy configuration
- add labels where missing (cpus, cache controller)
- add missing address cells & interrupts to MACs

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 52 ++++++++------
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 70 ++++++++++---------
 2 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 174f977c164b..f6542ef76046 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 
@@ -13,25 +13,34 @@ / {
 	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	aliases {
-		ethernet0 = &emac1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		serial2 = &serial2;
-		serial3 = &serial3;
+		ethernet0 = &mac1;
+		serial0 = &mmuart0;
+		serial1 = &mmuart1;
+		serial2 = &mmuart2;
+		serial3 = &mmuart3;
+		serial4 = &mmuart4;
 	};
 
 	chosen {
-		stdout-path = "serial0:115200n8";
+		stdout-path = "serial1:115200n8";
 	};
 
 	cpus {
 		timebase-frequency = <RTCCLK_FREQ>;
 	};
 
-	memory@80000000 {
+	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x40000000>;
+		reg = <0x0 0x80000000 0x0 0x2e000000>;
 		clocks = <&clkcfg CLK_DDRC>;
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
 
@@ -39,19 +48,19 @@ &refclk {
 	clock-frequency = <600000000>;
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
 
@@ -61,29 +70,32 @@ &mmc {
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
+&mac0 {
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
 
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 808500be26c3..d311c5ea27c9 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
@@ -16,7 +16,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -34,7 +34,7 @@ cpu0_intc: interrupt-controller {
 			};
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -61,7 +61,7 @@ cpu1_intc: interrupt-controller {
 			};
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -88,7 +88,7 @@ cpu2_intc: interrupt-controller {
 			};
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -115,7 +115,7 @@ cpu3_intc: interrupt-controller {
 			};
 		};
 
-		cpu@4 {
+		cpu4: cpu@4 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -153,8 +153,9 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
-		cache-controller@2010000 {
+		cctrllr: cache-controller@2010000 {
 			compatible = "sifive,fu540-c000-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>;
 			cache-block-size = <64>;
 			cache-level = <2>;
 			cache-sets = <1024>;
@@ -162,10 +163,9 @@ cache-controller@2010000 {
 			cache-unified;
 			interrupt-parent = <&plic>;
 			interrupts = <1>, <2>, <3>;
-			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 
-		clint@2000000 {
+		clint: clint@2000000 {
 			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
 			interrupts-extended = <&cpu0_intc HART_INT_M_SOFT>,
@@ -198,15 +198,6 @@ plic: interrupt-controller@c000000 {
 			riscv,ndev = <186>;
 		};
 
-		dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
-			reg = <0x0 0x3000000 0x0 0x8000>;
-			interrupt-parent = <&plic>;
-			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
-				     <30>;
-			#dma-cells = <1>;
-		};
-
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>;
@@ -214,7 +205,7 @@ clkcfg: clkcfg@20002000 {
 			#clock-cells = <1>;
 		};
 
-		serial0: serial@20000000 {
+		mmuart0: serial@20000000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20000000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -223,10 +214,10 @@ serial0: serial@20000000 {
 			interrupts = <90>;
 			current-speed = <115200>;
 			clocks = <&clkcfg CLK_MMUART0>;
-			status = "disabled";
+			status = "disabled"; /* Reserved for the HSS */
 		};
 
-		serial1: serial@20100000 {
+		mmuart1: serial@20100000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20100000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -238,7 +229,7 @@ serial1: serial@20100000 {
 			status = "disabled";
 		};
 
-		serial2: serial@20102000 {
+		mmuart2: serial@20102000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20102000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -250,7 +241,7 @@ serial2: serial@20102000 {
 			status = "disabled";
 		};
 
-		serial3: serial@20104000 {
+		mmuart3: serial@20104000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20104000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -262,42 +253,53 @@ serial3: serial@20104000 {
 			status = "disabled";
 		};
 
+		mmuart4: serial@20106000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20106000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <94>;
+			clocks = <&clkcfg CLK_MMUART4>;
+			current-speed = <115200>;
+			status = "disabled";
+		};
+
 		/* Common node entry for emmc/sd */
 		mmc: mmc@20008000 {
 			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
-			interrupts = <88>, <89>;
+			interrupts = <88>;
 			clocks = <&clkcfg CLK_MMC>;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
 
-		emac0: ethernet@20110000 {
+		mac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupt-parent = <&plic>;
-			interrupts = <64>, <65>, <66>, <67>;
+			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <0>;
 		};
 
-		emac1: ethernet@20112000 {
+		mac1: ethernet@20112000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupt-parent = <&plic>;
-			interrupts = <70>, <71>, <72>, <73>;
+			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
-			status = "disabled";
 			clock-names = "pclk", "hclk";
-			#address-cells = <1>;
-			#size-cells = <0>;
+			status = "disabled";
 		};
-
 	};
 };
-- 
2.33.1

