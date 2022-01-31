Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058A24A45FB
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376302AbiAaLsq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:48:46 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:57187 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358918AbiAaLqW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629584; x=1675165584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZOthgSCd3Bm9s6LckIdFEp+aanvwn9CcaGDrPeNHPEM=;
  b=F9ZglwW8MGXxyy0x0lxmhV9fhQGn79v3tjikFn95B6bmj9vCrH5b2Cgj
   g1C+C5j7XmthF9yjMMemseYaKKbtaP9dYNr06Bnz3X1v53NPNb56O3AmP
   0yd6Jw+YYJJ9DmF/GMGKUWAYGQxmcMQ7j03/k1WgtDNJPDUQ2w4igRMFI
   1aispVofQKLnozJIDwP2nfyVUNKLNZcheGVoXOtXRoGVRsODat+5r7Ei2
   ZiLLXU0KuKv1hDaf2i9BxxhNpXD4LqiXJ8DLVQHAfBGy/0KgMbqrXMIuI
   RxLiExW5HDY5Tj6k34pbocXJQvlIOKZqp83xf2xcytFmGYC5MNonVOtm0
   w==;
IronPort-SDR: RaLrxkKUkPHCll75nLy5P2ok0i1QujZBqbOEaX8j+z37FR9cC9NvfVqxelSffWTa1PXA17l++2
 oRCOUSFW3f9ZOvpQlnZ9qTolZUdhnA7cu4OKvBbPqCfqlr8ctWAp68lQhhhNYFhAnRezdClFZp
 qxK/sx3MgjRBz9Bw1Sswv7aC3OI6sQVxdsETSFBYXdM8zRmSJB0lp5N2lVh0T44otUnRkBnt7j
 UFvS3g2EqeSm5HLQxGzt0AJ95lVqjp8s5aXEiycJR7eb4PhgxDeZ5LOiBUuaaWxFr9qXq6Zn1X
 Vhk/r1wJqjcrgY8feeW3+RjO
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="151438476"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:46:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:46:15 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v5 09/12] riscv: dts: microchip: refactor icicle kit device tree
Date:   Mon, 31 Jan 2022 11:47:24 +0000
Message-ID: <20220131114726.973690-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Assorted minor changes to the MPFS/Icicle kit device tree:

- rename serial to mmuart to match microchip documentation
- move phy0 inside mac1 node to match phy configuration
- add labels where missing (cpus, cache controller)
- add missing address cells & interrupts to MACs

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 37 ++++++-----
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 65 +++++++++----------
 2 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index ab803f71626a..c51bd7cf500f 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 
@@ -13,11 +13,11 @@ / {
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
 	};
 
 	chosen {
@@ -39,19 +39,19 @@ &refclk {
 	clock-frequency = <600000000>;
 };
 
-&serial0 {
+&mmuart0 {
 	status = "okay";
 };
 
-&serial1 {
+&mmuart1 {
 	status = "okay";
 };
 
-&serial2 {
+&mmuart2 {
 	status = "okay";
 };
 
-&serial3 {
+&mmuart3 {
 	status = "okay";
 };
 
@@ -61,7 +61,10 @@ &mmc {
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
@@ -72,22 +75,22 @@ &i2c2 {
 	status = "okay";
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
index c7d73756c9b8..62bd00092bcc 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/* Copyright (c) 2020 Microchip Technology Inc */
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
@@ -15,7 +15,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
 			device_type = "cpu";
 			i-cache-block-size = <64>;
@@ -33,7 +33,7 @@ cpu0_intc: interrupt-controller {
 			};
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -60,7 +60,7 @@ cpu1_intc: interrupt-controller {
 			};
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -87,7 +87,7 @@ cpu2_intc: interrupt-controller {
 			};
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -114,7 +114,7 @@ cpu3_intc: interrupt-controller {
 			};
 		};
 
-		cpu@4 {
+		cpu4: cpu@4 {
 			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
 			d-cache-block-size = <64>;
 			d-cache-sets = <64>;
@@ -152,8 +152,9 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
-		cache-controller@2010000 {
+		cctrllr: cache-controller@2010000 {
 			compatible = "sifive,fu540-c000-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>;
 			cache-block-size = <64>;
 			cache-level = <2>;
 			cache-sets = <1024>;
@@ -161,10 +162,9 @@ cache-controller@2010000 {
 			cache-unified;
 			interrupt-parent = <&plic>;
 			interrupts = <1>, <2>, <3>;
-			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 
-		clint@2000000 {
+		clint: clint@2000000 {
 			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
@@ -174,6 +174,15 @@ clint@2000000 {
 					      <&cpu4_intc 3>, <&cpu4_intc 7>;
 		};
 
+		dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>;
+			#dma-cells = <1>;
+		};
+
 		plic: interrupt-controller@c000000 {
 			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
@@ -188,15 +197,6 @@ plic: interrupt-controller@c000000 {
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
@@ -204,7 +204,7 @@ clkcfg: clkcfg@20002000 {
 			#clock-cells = <1>;
 		};
 
-		serial0: serial@20000000 {
+		mmuart0: serial@20000000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20000000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -216,7 +216,7 @@ serial0: serial@20000000 {
 			status = "disabled";
 		};
 
-		serial1: serial@20100000 {
+		mmuart1: serial@20100000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20100000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -228,7 +228,7 @@ serial1: serial@20100000 {
 			status = "disabled";
 		};
 
-		serial2: serial@20102000 {
+		mmuart2: serial@20102000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20102000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -240,7 +240,7 @@ serial2: serial@20102000 {
 			status = "disabled";
 		};
 
-		serial3: serial@20104000 {
+		mmuart3: serial@20104000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20104000 0x0 0x400>;
 			reg-io-width = <4>;
@@ -257,37 +257,36 @@ mmc: mmc@20008000 {
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
2.35.0

