Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 874908FB8D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 08:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfHPGzi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 02:55:38 -0400
Received: from letterbox.kde.org ([46.43.1.242]:53668 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfHPGz2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 02:55:28 -0400
X-Greylist: delayed 466 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 02:55:26 EDT
Received: from archbox.localdomain (unknown [123.201.155.129])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id C95EB28ACD4;
        Fri, 16 Aug 2019 07:47:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1565938064; bh=py1ztBn1XdaocFAZ/o0HlkGN6xIaCjB2FLD7M888Jkk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JaQk3ITDsZkYq2OpOByS+hSpWW9YsIUsCPTu4TYHzjHOhWoEEOJROZ5IK1qRXqon2
         6B9Ry20VIHjpEiVvf+X06/0NulBmv++Ff+Rw3hL/qZXXbdmDf048smKlpi4yxmT/KL
         /qOGkGFgiHkZVgHRysRt0UwC20jMTxgjgw5XAXwCjxTCI7axv3Xrza9HzLqpaShVv8
         pNgUENFIlRb1bTmLOXfreflwxDh9L1XJSEIq1wn2AYkA5g+F7zgWe6Q3UFoUVe21aE
         gTSgu/CcHgAILH+2LW6a7f0WZo/+NggvPjgkQ7KwX/Sacp7RMDg8I4AFyY1OjAlf6W
         RABa+edqPLCTg==
From:   Bhushan Shah <bshah@kde.org>
To:     Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Wolfram Sang <wsa@the-dreams.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Bhushan Shah <bshah@kde.org>
Subject: [PATCH v2 2/3] arm64: allwinner: h6: add I2C nodes
Date:   Fri, 16 Aug 2019 12:17:09 +0530
Message-Id: <20190816064710.18280-3-bshah@kde.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816064710.18280-1-bshah@kde.org>
References: <20190811090503.32396-1-bshah@kde.org>
 <20190816064710.18280-1-bshah@kde.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device-tree nodes for i2c0 to i2c2, and also add relevant pinctrl
nodes.

Suggested-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Bhushan Shah <bshah@kde.org>
---
Changes in v2:
  - Add the SoC specific compatible string instead of re-using a31 one.

 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 56 +++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index bcecca17d61d..a1a329926540 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -329,6 +329,21 @@
 				function = "hdmi";
 			};
 
+			i2c0_pins: i2c0-pins {
+				pins = "PD25", "PD26";
+				function = "i2c0";
+			};
+
+			i2c1_pins: i2c1-pins {
+				pins = "PH5", "PH6";
+				function = "i2c1";
+			};
+
+			i2c2_pins: i2c2-pins {
+				pins = "PD23", "PD24";
+				function = "i2c2";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -464,6 +479,45 @@
 			status = "disabled";
 		};
 
+		i2c0: i2c@5002000 {
+			compatible = "allwinner,sun50i-h6-i2c";
+			reg = <0x05002000 0x400>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@5002400 {
+			compatible = "allwinner,sun50i-h6-i2c";
+			reg = <0x05002400 0x400>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@5002800 {
+			compatible = "allwinner,sun50i-h6-i2c";
+			reg = <0x05002800 0x400>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		emac: ethernet@5020000 {
 			compatible = "allwinner,sun50i-h6-emac",
 				     "allwinner,sun50i-a64-emac";
@@ -795,7 +849,7 @@
 		};
 
 		r_i2c: i2c@7081400 {
-			compatible = "allwinner,sun6i-a31-i2c";
+			compatible = "allwinner,sun50i-h6-i2c";
 			reg = <0x07081400 0x400>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&r_ccu CLK_R_APB2_I2C>;
-- 
2.17.1

