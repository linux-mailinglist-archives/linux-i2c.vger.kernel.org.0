Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEB2187C5B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgCQJkE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:40:04 -0400
Received: from v6.sk ([167.172.42.174]:50162 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgCQJkE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:40:04 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 538ED60FF8;
        Tue, 17 Mar 2020 09:40:01 +0000 (UTC)
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
Subject: [PATCH 07/28] ARM: dts: pxa*: Fix up encoding of the /rtc interrupts property
Date:   Tue, 17 Mar 2020 10:39:01 +0100
Message-Id: <20200317093922.20785-8-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This way the device tree validator learns that each cell of the property
constitutes a separate item. Otherwise it gets unnecessairly upset:

  pxa168-aspenite.dt.yaml: rtc@d4010000: interrupts: [[5, 6]] is too short
  pxa910-dkb.dt.yaml: rtc@d4010000: interrupts: [[5, 6]] is too short

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/pxa168.dtsi | 2 +-
 arch/arm/boot/dts/pxa910.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/pxa168.dtsi b/arch/arm/boot/dts/pxa168.dtsi
index c6ac85e362d8a..ae2221a3f825f 100644
--- a/arch/arm/boot/dts/pxa168.dtsi
+++ b/arch/arm/boot/dts/pxa168.dtsi
@@ -140,7 +140,7 @@ twsi2: i2c@d4025000 {
 			rtc: rtc@d4010000 {
 				compatible = "mrvl,mmp-rtc";
 				reg = <0xd4010000 0x1000>;
-				interrupts = <5 6>;
+				interrupts = <5>, <6>;
 				interrupt-names = "rtc 1Hz", "rtc alarm";
 				clocks = <&soc_clocks PXA168_CLK_RTC>;
 				resets = <&soc_clocks PXA168_CLK_RTC>;
diff --git a/arch/arm/boot/dts/pxa910.dtsi b/arch/arm/boot/dts/pxa910.dtsi
index 5f8e208916b31..774e8e9730924 100644
--- a/arch/arm/boot/dts/pxa910.dtsi
+++ b/arch/arm/boot/dts/pxa910.dtsi
@@ -152,7 +152,7 @@ twsi2: i2c@d4037000 {
 			rtc: rtc@d4010000 {
 				compatible = "mrvl,mmp-rtc";
 				reg = <0xd4010000 0x1000>;
-				interrupts = <5 6>;
+				interrupts = <5>, <6>;
 				interrupt-names = "rtc 1Hz", "rtc alarm";
 				clocks = <&soc_clocks PXA910_CLK_RTC>;
 				resets = <&soc_clocks PXA910_CLK_RTC>;
-- 
2.25.1

