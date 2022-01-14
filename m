Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE8C48ECE1
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbiANPSW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:18:22 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:60875 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242888AbiANPSF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173484; x=1673709484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pD2aY7DqfNmFRox5FSceK6PpE1ZFD5MRqAvK8t412Tw=;
  b=aN8MPBYZstjl4cwlNR57djM6J4NkL5wbbTUvJwulV6S7yuQBV10SPtd/
   jkcZ+EeDxPH5yiX/wPvSYRu+YoZn78+2WSJXsRbymX5fJIRrKEm+hfU5x
   gYcyDR7VTo+1BVVqzf5xF9uOOzXdiQtt6PiDnuql2AXb0H+0WJ0m4pGjb
   2LJ+HdaxLck95WSmwMg/3ZEhSTfcKQjOGALcRDh8V84rcpuzt8H2Y0vGt
   Hd/yE2oHVDFeKz+LiRzBsPDVwwsh6JPCQb223eOqlxHrTf/kcvoTfCrrJ
   h5MckWVGjPDMVAcNyP2DOG8xq4L0YTyF9Tbv+xmmusXyQzAmtSlt25MFs
   Q==;
IronPort-SDR: rC298L9FW6hcjuvzc1Vp3KLfow1Ns0Qq2jn3XKoPo/9lQkUxaJnze22PCrpW0TFIu/z1EI56sA
 pfEKBIUoWCxqR0VWDqYIiFsMD1RLJlFXl64/p0viXZMYwTLJDqM2U7WY9FxnB5AfxVtqrQVdu2
 vA25QDoH3q7P94wqrmbF/cO4bmjVdyryVXplwiUXgWkbGtE+KHOYCWsZIZZEWWdwSefF2wV1/2
 Mf/AhleA3IH2yFxLZzmretz+ZUXCJUotG7KFHvqH0xA3XcSkhKhisvJ4ek8ei6hmIO3b13IGLT
 EU6YyPefV7Pn37jl41sBMlrY
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="158697964"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:18:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:17:58 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:17:52 -0700
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
        <atishp@rivosinc.com>
Subject: [PATCH v3 13/15] riscv: dts: microchip: update peripherals in icicle kit device tree
Date:   Fri, 14 Jan 2022 15:17:25 +0000
Message-ID: <20220114151727.2319915-14-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Assorted minor changes to the MPFS/Icicle kit device tree:

- enable mmuart4 instead of mmuart0
- remove sifive pdma
- split memory node to match updated fpga design
- move stdout path to serial1 to avoid collision with
        bootloader running on the e51

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 23 +++++++++++++------
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 23 +++++++++++--------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index c51bd7cf500f..dc5f351b10c4 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -18,20 +18,29 @@ aliases {
 		serial1 = &mmuart1;
 		serial2 = &mmuart2;
 		serial3 = &mmuart3;
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
 
@@ -39,10 +48,6 @@ &refclk {
 	clock-frequency = <600000000>;
 };
 
-&mmuart0 {
-	status = "okay";
-};
-
 &mmuart1 {
 	status = "okay";
 };
@@ -55,6 +60,10 @@ &mmuart3 {
 	status = "okay";
 };
 
+&mmuart4 {
+	status = "okay";
+};
+
 &mmc {
 	status = "okay";
 
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 62bd00092bcc..5e7aaaf42cde 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -174,15 +174,6 @@ clint: clint@2000000 {
 					      <&cpu4_intc 3>, <&cpu4_intc 7>;
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
 		plic: interrupt-controller@c000000 {
 			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
@@ -213,7 +204,7 @@ mmuart0: serial@20000000 {
 			interrupts = <90>;
 			current-speed = <115200>;
 			clocks = <&clkcfg CLK_MMUART0>;
-			status = "disabled";
+			status = "disabled"; /* Reserved for the HSS */
 		};
 
 		mmuart1: serial@20100000 {
@@ -252,6 +243,18 @@ mmuart3: serial@20104000 {
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
-- 
2.32.0

