Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8040310E95E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2019 12:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfLBLNC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Dec 2019 06:13:02 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:34073 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfLBLNB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Dec 2019 06:13:01 -0500
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 2 Dec 2019
 19:13:26 +0800
From:   Jian Hu <jian.hu@amlogic.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH] arm64: dts: meson-a1: add I2C nodes
Date:   Mon, 2 Dec 2019 19:12:52 +0800
Message-ID: <20191202111253.94872-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.8.25]
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are four I2C controllers in A1 series,
Share the same comptible with AXG.The I2C nodes
depend on pinmux and clock controller.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index eab2ecd36aa8..d0a73d953f5e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -16,6 +16,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -117,6 +124,46 @@
 				};
 			};
 
+			i2c0: i2c@1400 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1400 0x0 0x24>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_A>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@5c00 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x5c00 0x0 0x24>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_B>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@6800 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x6800 0x0 0x24>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_C>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@6c00 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x6c00 0x0 0x24>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_D>;
+				status = "disabled";
+			};
+
 			uart_AO: serial@1c00 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
@@ -171,3 +218,105 @@
 		#clock-cells = <0>;
 	};
 };
+
+&periphs_pinctrl {
+	i2c0_f11_pins:i2c0-f11 {
+		mux {
+			groups = "i2c0_sck_f11",
+				"i2c0_sda_f12";
+			function = "i2c0";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c0_f9_pins:i2c0-f9 {
+		mux {
+			groups = "i2c0_sck_f9",
+				"i2c0_sda_f10";
+			function = "i2c0";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c1_x_pins:i2c1-x {
+		mux {
+			groups = "i2c1_sck_x",
+				"i2c1_sda_x";
+			function = "i2c1";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c1_a_pins:i2c1-a {
+		mux {
+			groups = "i2c1_sck_a",
+				"i2c1_sda_a";
+			function = "i2c1";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c2_x0_pins:i2c2-x0 {
+		mux {
+			groups = "i2c2_sck_x0",
+				"i2c2_sda_x1";
+			function = "i2c2";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c2_x15_pins:i2c2-x15 {
+		mux {
+			groups = "i2c2_sck_x15",
+				"i2c2_sda_x16";
+			function = "i2c2";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c2_a4_pins:i2c2-a4 {
+		mux {
+			groups = "i2c2_sck_a4",
+				"i2c2_sda_a5";
+			function = "i2c2";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c2_a8_pins:i2c2-a8 {
+		mux {
+			groups = "i2c2_sck_a8",
+				"i2c2_sda_a9";
+			function = "i2c2";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c3_x_pins:i2c3-x {
+		mux {
+			groups = "i2c3_sck_x",
+				"i2c3_sda_x";
+			function = "i2c3";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+
+	i2c3_f_pins:i2c3-f {
+		mux {
+			groups = "i2c3_sck_f",
+				"i2c3_sda_f";
+			function = "i2c3";
+			bias-pull-up;
+			drive-strength-microamp = <3000>;
+		};
+	};
+};
-- 
2.24.0

