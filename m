Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4389B3AB00B
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 11:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhFQJrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 05:47:16 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:42725 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbhFQJrQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Jun 2021 05:47:16 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15H9Ug1G024610;
        Thu, 17 Jun 2021 17:30:42 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 17:45:05 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <chiawei_wang@aspeedtech.com>, <troy_lee@aspeedtech.com>,
        <steven_lee@aspeedtech.com>
Subject: [PATCH 1/3] dts: aspeed: Add node for AST2600 I2C and I2CS
Date:   Thu, 17 Jun 2021 17:43:38 +0800
Message-ID: <20210617094424.27123-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15H9Ug1G024610
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support byte-mode, dma-mode and buffer-mode for
data transfer of I2C. Add i2c-global-regs node
to support the new register set Add node to
support I2CS.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 150 ++++++++++++++++++++++++-------
 1 file changed, 118 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index f96607b7b4e2..e83df01123fe 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -667,6 +667,13 @@
 				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
 				status = "disabled";
 			};
+
+			i2csec: bus@1e7a8000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e7a8000 0x1000>;
+			};
 		};
 	};
 };
@@ -674,12 +681,20 @@
 #include "aspeed-g6-pinctrl.dtsi"
 
 &i2c {
+
+	i2c_gr: i2c-global-regs@0 {
+		compatible = "aspeed,ast2600-i2c-global", "syscon";
+		reg = <0x0 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		resets = <&syscon ASPEED_RESET_I2C>;
+	};
+
 	i2c0: i2c-bus@80 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x80 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x80 0x80>, <0xC00 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -690,11 +705,11 @@
 	};
 
 	i2c1: i2c-bus@100 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x100 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x100 0x80>, <0xC20 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
@@ -705,11 +720,11 @@
 	};
 
 	i2c2: i2c-bus@180 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x180 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x180 0x80>, <0xC40 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
@@ -720,11 +735,11 @@
 	};
 
 	i2c3: i2c-bus@200 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x200 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x200 0x80>, <0xC60 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
@@ -735,11 +750,11 @@
 	};
 
 	i2c4: i2c-bus@280 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x280 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x280 0x80>, <0xC80 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -750,11 +765,11 @@
 	};
 
 	i2c5: i2c-bus@300 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x300 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x300 0x80>, <0xCA0 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
@@ -765,11 +780,11 @@
 	};
 
 	i2c6: i2c-bus@380 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x380 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x380 0x80>, <0xCC0 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
@@ -780,11 +795,11 @@
 	};
 
 	i2c7: i2c-bus@400 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x400 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x400 0x80>, <0xCE0 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
@@ -795,11 +810,11 @@
 	};
 
 	i2c8: i2c-bus@480 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x480 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x480 0x80>, <0xD00 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -810,11 +825,11 @@
 	};
 
 	i2c9: i2c-bus@500 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x500 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x500 0x80>, <0xD20 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
@@ -825,11 +840,11 @@
 	};
 
 	i2c10: i2c-bus@580 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x580 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x580 0x80>, <0xD40 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
@@ -840,11 +855,11 @@
 	};
 
 	i2c11: i2c-bus@600 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x600 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x600 0x80>, <0xD60 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
@@ -855,11 +870,11 @@
 	};
 
 	i2c12: i2c-bus@680 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x680 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x680 0x80>, <0xD80 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
@@ -870,11 +885,11 @@
 	};
 
 	i2c13: i2c-bus@700 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x700 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x700 0x80>, <0xDA0 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
@@ -885,11 +900,11 @@
 	};
 
 	i2c14: i2c-bus@780 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x780 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x780 0x80>, <0xDC0 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -900,11 +915,11 @@
 	};
 
 	i2c15: i2c-bus@800 {
+		compatible = "aspeed,ast2600-i2c-bus";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x800 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
+		reg = <0x800 0x80>, <0xDE0 0x20>;
 		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
@@ -914,3 +929,74 @@
 		status = "disabled";
 	};
 };
+
+&i2csec {
+
+	i2c_gr0: i2c-global-regs@0 {
+		compatible = "aspeed,ast2600-i2c-global", "syscon";
+		reg = <0x0 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		status = "disabled";
+	};
+
+	i2c16: i2c-bus@80 {
+		compatible = "aspeed,ast2600-i2c-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x80 0x80>, <0xC00 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+		bus-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c1_default>;
+		buff-mode;
+		status = "disabled";
+	};
+
+	i2c17: i2c-bus@100 {
+		compatible = "aspeed,ast2600-i2c-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x100 0x80>, <0xC20 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+		bus-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c2_default>;
+		buff-mode;
+		status = "disabled";
+	};
+
+	i2c18: i2c-bus@180 {
+		compatible = "aspeed,ast2600-i2c-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x180 0x80>, <0xC40 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		bus-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c3_default>;
+		buff-mode;
+		status = "disabled";
+	};
+
+	i2c19: i2c-bus@200 {
+		compatible = "aspeed,ast2600-i2c-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x200 0x80>, <0xC60 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		bus-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_default>;
+		buff-mode;
+		status = "disabled";
+	};
+
+};
-- 
2.17.1

