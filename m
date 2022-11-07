Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594C261E808
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 01:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiKGA4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 19:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiKGA4K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 19:56:10 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79C39A18E;
        Sun,  6 Nov 2022 16:56:09 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 674FC1FB;
        Sun,  6 Nov 2022 16:56:15 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DF323F703;
        Sun,  6 Nov 2022 16:56:07 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 03/10] ARM: dts: suniv: f1c100s: add I2C DT nodes
Date:   Mon,  7 Nov 2022 00:54:26 +0000
Message-Id: <20221107005433.11079-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Allwinner F1C100s series of SoCs contain three I2C controllers
compatible to the ones used in other Allwinner SoCs.

Add the DT nodes describing the resources of the controllers.
I2C1 has only one possible pinmux, so add the pinctrl properties for
that already.
At least one board connects an on-board I2C chip to PD0/PD12 (I2C0), so
include those pins already, to simplify referencing them later.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 81749d5da12f..4f45168cea42 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -192,6 +192,12 @@ mmc0_pins: mmc0-pins {
 				drive-strength = <30>;
 			};
 
+			/omit-if-no-ref/
+			i2c0_pd_pins: i2c0-pd-pins {
+				pins = "PD0", "PD12";
+				function = "i2c0";
+			};
+
 			spi0_pc_pins: spi0-pc-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
@@ -203,6 +209,42 @@ uart0_pe_pins: uart0-pe-pins {
 			};
 		};
 
+		i2c0: i2c@1c27000 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27000 0x400>;
+			interrupts = <7>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@1c27400 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27400 0x400>;
+			interrupts = <8>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@1c27800 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27800 0x400>;
+			interrupts = <9>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer@1c20c00 {
 			compatible = "allwinner,suniv-f1c100s-timer";
 			reg = <0x01c20c00 0x90>;
-- 
2.35.5

