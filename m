Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B61478795
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhLQJdr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:33:47 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:56724 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhLQJdl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733622; x=1671269622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Syay7nVJzS7YFXqFo8/vNemWnrn/aoxo86Y2hb6xIE=;
  b=ouuyqw3u1uaeCFwB22kU68GjAUaP8LDnwJ4aXI1+ZINQoRc4SImXwnA3
   +TdhoTlB40gEChUoocYTqNdbCZ66ezpiNJvFMmZNRF+rKD9OatCLg5+NI
   m2V8xESXCnzwqOxd3EgU5xDTSyky8iQQKGw9AK67I0/0g4D4P0ENIN4r1
   xcsSYSRtfvSXvjixkY/IP0mjQxZlpEKh42UgdQfNmEJLog/d4OBJT+ZX5
   Yma3h4q37ULqLfFJXFm5x6mFW7YlG7Ee0qMPuY8f5MdP55CrSsuQZiA9D
   olPDCpkeSdcEuLf9fD+VoYd3ol1xWedahDId7tdVEQ5fsOPoe8uKi0Uuw
   Q==;
IronPort-SDR: qdJM7Qohp+HYWRLBXNZ14SZdj52Q//VI6ThUpsgbYflggAcOfGY++z55HOmd8FK1cdFmH6UF0d
 xo2urusGP8pnMJChMX3eawG2pdPqD31QehCoPYkm60DQJdXgsigebP02J+4KBbXKoZ3UYYGzoW
 OjxFA9Mhld8YK7dfnIfMON1XogtFKC8hrylT1LKU7ZGFvfX+pUNsNZiVqLUcJtTNtmcWbh1iqc
 4m0UC8iQK7YxSsY15m8/RyfTJrGhpNozD+MAqXnxZ36aVZcgjBmNBO/vJNqYQ5tGE0JnOH/Fyj
 wcSAI51WRb+5d9wDSWBq8USA
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147002753"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:33:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:28 -0700
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
Subject: [PATCH v2 13/17] riscv: dts: microchip: use hart and clk defines for icicle kit
Date:   Fri, 17 Dec 2021 09:33:21 +0000
Message-ID: <20211217093325.30612-14-conor.dooley@microchip.com>
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

Update the Microchip Icicle kit device tree by replacing interrupt and
clock related magic numbers with their defined counterparts.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   |  2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 55 +++++++++++--------
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 0c748ae1b006..6d19ba196f12 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -31,7 +31,7 @@ cpus {
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x40000000>;
-		clocks = <&clkcfg 26>;
+		clocks = <&clkcfg CLK_DDRC>;
 	};
 };
 
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 869aaf0d5c06..ce9151edd1b6 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -2,6 +2,8 @@
 /* Copyright (c) 2020 Microchip Technology Inc */
 
 /dts-v1/;
+#include "dt-bindings/clock/microchip,mpfs-clock.h"
+#include "dt-bindings/interrupt-controller/riscv-hart.h"
 
 / {
 	#address-cells = <2>;
@@ -14,7 +16,6 @@ cpus {
 		#size-cells = <0>;
 
 		cpu@0 {
-			clock-frequency = <0>;
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -22,6 +23,7 @@ cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			clocks = <&clkcfg CLK_CPU>;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -32,7 +34,6 @@ cpu0_intc: interrupt-controller {
 		};
 
 		cpu@1 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -48,6 +49,7 @@ cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -59,7 +61,6 @@ cpu1_intc: interrupt-controller {
 		};
 
 		cpu@2 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -75,6 +76,7 @@ cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -86,7 +88,6 @@ cpu2_intc: interrupt-controller {
 		};
 
 		cpu@3 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -102,6 +103,7 @@ cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 
@@ -113,7 +115,6 @@ cpu3_intc: interrupt-controller {
 		};
 
 		cpu@4 {
-			clock-frequency = <0>;
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -129,6 +130,7 @@ cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			status = "okay";
 			cpu4_intc: interrupt-controller {
@@ -165,11 +167,16 @@ cache-controller@2010000 {
 		clint@2000000 {
 			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
-					      <&cpu1_intc 3>, <&cpu1_intc 7>,
-					      <&cpu2_intc 3>, <&cpu2_intc 7>,
-					      <&cpu3_intc 3>, <&cpu3_intc 7>,
-					      <&cpu4_intc 3>, <&cpu4_intc 7>;
+			interrupts-extended = <&cpu0_intc HART_INT_M_SOFT>,
+					      <&cpu0_intc HART_INT_M_TIMER>,
+					      <&cpu1_intc HART_INT_M_SOFT>,
+					      <&cpu1_intc HART_INT_M_TIMER>,
+					      <&cpu2_intc HART_INT_M_SOFT>,
+					      <&cpu2_intc HART_INT_M_TIMER>,
+					      <&cpu3_intc HART_INT_M_SOFT>,
+					      <&cpu3_intc HART_INT_M_TIMER>,
+					      <&cpu4_intc HART_INT_M_SOFT>,
+					      <&cpu4_intc HART_INT_M_TIMER>;
 		};
 
 		plic: interrupt-controller@c000000 {
@@ -178,11 +185,15 @@ plic: interrupt-controller@c000000 {
 			#address-cells = <0>;
 			#interrupt-cells = <1>;
 			interrupt-controller;
-			interrupts-extended = <&cpu0_intc 11>,
-					      <&cpu1_intc 11>, <&cpu1_intc 9>,
-					      <&cpu2_intc 11>, <&cpu2_intc 9>,
-					      <&cpu3_intc 11>, <&cpu3_intc 9>,
-					      <&cpu4_intc 11>, <&cpu4_intc 9>;
+			interrupts-extended = <&cpu0_intc HART_INT_M_EXT>,
+					      <&cpu1_intc HART_INT_M_EXT>,
+					      <&cpu1_intc HART_INT_S_EXT>,
+					      <&cpu2_intc HART_INT_M_EXT>,
+					      <&cpu2_intc HART_INT_S_EXT>,
+					      <&cpu3_intc HART_INT_M_EXT>,
+					      <&cpu3_intc HART_INT_S_EXT>,
+					      <&cpu4_intc HART_INT_M_EXT>,
+					      <&cpu4_intc HART_INT_S_EXT>;
 			riscv,ndev = <186>;
 		};
 
@@ -210,7 +221,7 @@ serial0: serial@20000000 {
 			interrupt-parent = <&plic>;
 			interrupts = <90>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 8>;
+			clocks = <&clkcfg CLK_MMUART0>;
 			status = "disabled";
 		};
 
@@ -222,7 +233,7 @@ serial1: serial@20100000 {
 			interrupt-parent = <&plic>;
 			interrupts = <91>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 9>;
+			clocks = <&clkcfg CLK_MMUART1>;
 			status = "disabled";
 		};
 
@@ -234,7 +245,7 @@ serial2: serial@20102000 {
 			interrupt-parent = <&plic>;
 			interrupts = <92>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 10>;
+			clocks = <&clkcfg CLK_MMUART2>;
 			status = "disabled";
 		};
 
@@ -246,7 +257,7 @@ serial3: serial@20104000 {
 			interrupt-parent = <&plic>;
 			interrupts = <93>;
 			current-speed = <115200>;
-			clocks = <&clkcfg 11>;
+			clocks = <&clkcfg CLK_MMUART3>;
 			status = "disabled";
 		};
 
@@ -256,7 +267,7 @@ mmc: mmc@20008000 {
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>, <89>;
-			clocks = <&clkcfg 6>;
+			clocks = <&clkcfg CLK_MMC>;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
@@ -267,7 +278,7 @@ emac0: ethernet@20110000 {
 			interrupt-parent = <&plic>;
 			interrupts = <64>, <65>, <66>, <67>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg 4>, <&clkcfg 2>;
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 			#address-cells = <1>;
@@ -280,7 +291,7 @@ emac1: ethernet@20112000 {
 			interrupt-parent = <&plic>;
 			interrupts = <70>, <71>, <72>, <73>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg 5>, <&clkcfg 2>;
+			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			status = "disabled";
 			clock-names = "pclk", "hclk";
 			#address-cells = <1>;
-- 
2.33.1

