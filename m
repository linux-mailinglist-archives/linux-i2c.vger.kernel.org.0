Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177AD187C61
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgCQJkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:40:19 -0400
Received: from v6.sk ([167.172.42.174]:50272 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbgCQJkP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:40:15 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 3A2E261008;
        Tue, 17 Mar 2020 09:40:13 +0000 (UTC)
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
Subject: [PATCH 10/28] ARM: dts: mmp3: fix USB & USB PHY node names
Date:   Tue, 17 Mar 2020 10:39:04 +0100
Message-Id: <20200317093922.20785-11-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are better generic ones and the validation is going to complain:

  mmp3-dell-ariel.dt.yaml: hsic@f0001000: $nodename:0: 'hsic@f0001000'
      does not match '^usb(@.*)?'
  mmp3-dell-ariel.dt.yaml: hsic@f0002000: $nodename:0: 'hsic@f0002000'
      does not match '^usb(@.*)?'
  ...

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
index eaff9b1bc1d9f..fc75f96106351 100644
--- a/arch/arm/boot/dts/mmp3.dtsi
+++ b/arch/arm/boot/dts/mmp3.dtsi
@@ -183,14 +183,14 @@ hsi0_mux: interrupt-controller@d42821d0 {
 				mrvl,intc-nr-irqs = <5>;
 			};
 
-			usb_otg_phy0: usb-otg-phy@d4207000 {
+			usb_otg_phy0: usb-phy@d4207000 {
 				compatible = "marvell,mmp3-usb-phy";
 				reg = <0xd4207000 0x40>;
 				#phy-cells = <0>;
 				status = "disabled";
 			};
 
-			usb_otg0: usb-otg@d4208000 {
+			usb_otg0: usb@d4208000 {
 				compatible = "marvell,pxau2o-ehci";
 				reg = <0xd4208000 0x200>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
@@ -201,7 +201,7 @@ usb_otg0: usb-otg@d4208000 {
 				status = "disabled";
 			};
 
-			hsic_phy0: hsic-phy@f0001800 {
+			hsic_phy0: usb-phy@f0001800 {
 				compatible = "marvell,mmp3-hsic-phy",
 					     "usb-nop-xceiv";
 				reg = <0xf0001800 0x40>;
@@ -209,7 +209,7 @@ hsic_phy0: hsic-phy@f0001800 {
 				status = "disabled";
 			};
 
-			hsic0: hsic@f0001000 {
+			hsic0: usb@f0001000 {
 				compatible = "marvell,pxau2o-ehci";
 				reg = <0xf0001000 0x200>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -223,7 +223,7 @@ hsic0: hsic@f0001000 {
 				status = "disabled";
 			};
 
-			hsic_phy1: hsic-phy@f0002800 {
+			hsic_phy1: usb-phy@f0002800 {
 				compatible = "marvell,mmp3-hsic-phy",
 					     "usb-nop-xceiv";
 				reg = <0xf0002800 0x40>;
@@ -231,7 +231,7 @@ hsic_phy1: hsic-phy@f0002800 {
 				status = "disabled";
 			};
 
-			hsic1: hsic@f0002000 {
+			hsic1: usb@f0002000 {
 				compatible = "marvell,pxau2o-ehci";
 				reg = <0xf0002000 0x200>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

