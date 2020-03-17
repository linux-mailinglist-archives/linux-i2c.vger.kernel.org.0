Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE975187D2E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgCQJm3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:42:29 -0400
Received: from v6.sk ([167.172.42.174]:50306 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbgCQJkU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:40:20 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 52C946108B;
        Tue, 17 Mar 2020 09:40:17 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 11/28] ARM: dts: berlin*: Fix up the SDHCI node names
Date:   Tue, 17 Mar 2020 10:39:05 +0100
Message-Id: <20200317093922.20785-12-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The node name preferred by mmc-controller.yaml binding spec is "mmc":

  berlin2-sony-nsz-gs7.dt.yaml: sdhci@ab0000: $nodename:0:
      'sdhci@ab0000' does not match '^mmc(@.*)?$'
  berlin2-sony-nsz-gs7.dt.yaml: sdhci@ab0800: $nodename:0:
      'sdhci@ab0800' does not match '^mmc(@.*)?$'
  berlin2-sony-nsz-gs7.dt.yaml: sdhci@ab1000: $nodename:0:
      'sdhci@ab1000' does not match '^mmc(@.*)?$'
  berlin2cd-google-chromecast.dt.yaml: sdhci@ab0000: $nodename:0:
      'sdhci@ab0000' does not match '^mmc(@.*)?$'
  berlin2cd-valve-steamlink.dt.yaml: sdhci@ab0000: $nodename:0:
      'sdhci@ab0000' does not match '^mmc(@.*)?$'
  berlin2q-marvell-dmp.dt.yaml: sdhci@ab0000: $nodename:0:
      'sdhci@ab0000' does not match '^mmc(@.*)?$'
  berlin2q-marvell-dmp.dt.yaml: sdhci@ab0800: $nodename:0:
      'sdhci@ab0800' does not match '^mmc(@.*)?$'
  berlin2q-marvell-dmp.dt.yaml: sdhci@ab1000: $nodename:0:
      'sdhci@ab1000' does not match '^mmc(@.*)?$'

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/berlin2.dtsi   | 6 +++---
 arch/arm/boot/dts/berlin2cd.dtsi | 2 +-
 arch/arm/boot/dts/berlin2q.dtsi  | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
index d2f7d984bba5c..3ab3cd250da70 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -77,7 +77,7 @@ soc@f7000000 {
 
 		ranges = <0 0xf7000000 0x1000000>;
 
-		sdhci0: sdhci@ab0000 {
+		sdhci0: mmc@ab0000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0000 0x200>;
 			clocks = <&chip_clk CLKID_SDIO0XIN>, <&chip_clk CLKID_SDIO0>;
@@ -86,7 +86,7 @@ sdhci0: sdhci@ab0000 {
 			status = "disabled";
 		};
 
-		sdhci1: sdhci@ab0800 {
+		sdhci1: mmc@ab0800 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0800 0x200>;
 			clocks = <&chip_clk CLKID_SDIO1XIN>, <&chip_clk CLKID_SDIO1>;
@@ -95,7 +95,7 @@ sdhci1: sdhci@ab0800 {
 			status = "disabled";
 		};
 
-		sdhci2: sdhci@ab1000 {
+		sdhci2: mmc@ab1000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab1000 0x200>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berlin2cd.dtsi
index e5c1f4213ff90..7cf3e6302d75c 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -62,7 +62,7 @@ soc@f7000000 {
 
 		ranges = <0 0xf7000000 0x1000000>;
 
-		sdhci0: sdhci@ab0000 {
+		sdhci0: mmc@ab0000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0000 0x200>;
 			clocks = <&chip_clk CLKID_SDIO0XIN>, <&chip_clk CLKID_SDIO0>;
diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 99d6872a6dfcc..c44a32e873f44 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -122,7 +122,7 @@ soc@f7000000 {
 		ranges = <0 0xf7000000 0x1000000>;
 		interrupt-parent = <&gic>;
 
-		sdhci0: sdhci@ab0000 {
+		sdhci0: mmc@ab0000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0000 0x200>;
 			clocks = <&chip_clk CLKID_SDIO1XIN>, <&chip_clk CLKID_SDIO>;
@@ -131,7 +131,7 @@ sdhci0: sdhci@ab0000 {
 			status = "disabled";
 		};
 
-		sdhci1: sdhci@ab0800 {
+		sdhci1: mmc@ab0800 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab0800 0x200>;
 			clocks = <&chip_clk CLKID_SDIO1XIN>, <&chip_clk CLKID_SDIO>;
@@ -140,7 +140,7 @@ sdhci1: sdhci@ab0800 {
 			status = "disabled";
 		};
 
-		sdhci2: sdhci@ab1000 {
+		sdhci2: mmc@ab1000 {
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab1000 0x200>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

