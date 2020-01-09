Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732471351D2
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 04:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgAIDSA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 22:18:00 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:56410 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgAIDSA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 22:18:00 -0500
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 9 Jan 2020
 11:18:24 +0800
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
Subject: [PATCH v4] arm64: dts: meson-a1: add I2C nodes
Date:   Thu, 9 Jan 2020 11:17:56 +0800
Message-ID: <20200109031756.176547-1-jian.hu@amlogic.com>
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
Share the same comptible with AXG. Compared to AXG,
Drive strength feature is newly added in A1.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>

---
This patch depends on A1 clock patchset at [0][3]

Changes since v3 at [4]:
-put the i2c pins under periphs_pinctrl
-replace bias-pull-up as bias-disable
-add missing space in i2c pins node

Changes since v2 at [2]:
-remove the dependence the commit description
-remove i2c alias in dtsi
-reorder the i2c nodes
-reorder the i2c pins

Changes since v1 at [1]:
-change reg length to 0x20
-assign i2c bus alias in dts file
-add new feature note compared to AXG in changelog

[0] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
[1] https://lkml.kernel.org/r/20191202111253.94872-1-jian.hu@amlogic.com
[2] https://lkml.kernel.org/r/20191211032802.83309-1-jian.hu@amlogic.com
[3] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
[4] https://lkml.kernel.org/r/20191220091611.36319-1-jian.hu@amlogic.com
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 140 ++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index eab2ecd36aa8..009c8c496b58 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -115,6 +115,116 @@
 				       #gpio-cells = <2>;
 				       gpio-ranges = <&periphs_pinctrl 0 0 62>;
 				};
+
+				i2c0_f9_pins: i2c0-f9 {
+					mux {
+						groups = "i2c0_sck_f9",
+							"i2c0_sda_f10";
+						function = "i2c0";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c0_f11_pins: i2c0-f11 {
+					mux {
+						groups = "i2c0_sck_f11",
+							"i2c0_sda_f12";
+						function = "i2c0";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c1_a_pins: i2c1-a {
+					mux {
+						groups = "i2c1_sck_a",
+							"i2c1_sda_a";
+						function = "i2c1";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c1_x_pins: i2c1-x {
+					mux {
+						groups = "i2c1_sck_x",
+							"i2c1_sda_x";
+						function = "i2c1";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_a4_pins: i2c2-a4 {
+					mux {
+						groups = "i2c2_sck_a4",
+							"i2c2_sda_a5";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_a8_pins: i2c2-a8 {
+					mux {
+						groups = "i2c2_sck_a8",
+							"i2c2_sda_a9";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_x0_pins: i2c2-x0 {
+					mux {
+						groups = "i2c2_sck_x0",
+							"i2c2_sda_x1";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_x15_pins: i2c2-x15 {
+					mux {
+						groups = "i2c2_sck_x15",
+							"i2c2_sda_x16";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c3_f_pins: i2c3-f {
+					mux {
+						groups = "i2c3_sck_f",
+							"i2c3_sda_f";
+						function = "i2c3";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c3_x_pins: i2c3-x {
+					mux {
+						groups = "i2c3_sck_x",
+							"i2c3_sda_x";
+						function = "i2c3";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+			};
+
+			i2c0: i2c@1400 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1400 0x0 0x20>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_A>;
+				status = "disabled";
 			};
 
 			uart_AO: serial@1c00 {
@@ -136,6 +246,36 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			i2c1: i2c@5c00 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x5c00 0x0 0x20>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_B>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@6800 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x6800 0x0 0x20>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_C>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@6c00 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x6c00 0x0 0x20>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_D>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
-- 
2.24.0

