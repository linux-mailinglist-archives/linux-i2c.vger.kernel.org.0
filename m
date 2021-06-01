Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F60397694
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhFAP1q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhFAP1o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:27:44 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E946C06138D
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 08:26:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by baptiste.telenet-ops.be with bizsmtp
        id BrRq2500135oben01rRqyd; Tue, 01 Jun 2021 17:25:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H7-00BuxP-Cp; Tue, 01 Jun 2021 17:25:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H6-000JYE-LL; Tue, 01 Jun 2021 17:25:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] ARM: dts: dra7x-evm: Drop "ti,pcf8575"
Date:   Tue,  1 Jun 2021 17:25:45 +0200
Message-Id: <f499a261e0b39daca2d761bd600fe362cddab653.1622560799.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622560799.git.geert+renesas@glider.be>
References: <cover.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The TI part is equivalent to the NXP part and its compatible value is
not documented in the DT bindings.  All other users of similar I2C GPIO
expanders just use the compatible values of the original NXP parts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm/boot/dts/dra7-evm.dts          | 6 +++---
 arch/arm/boot/dts/dra72-evm-common.dtsi | 4 ++--
 arch/arm/boot/dts/dra76-evm.dts         | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 3dcb6e1f49bcf1f0..87deb6a76eff3602 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -319,7 +319,7 @@ sysen2: sysen2 {
 	};
 
 	pcf_lcd: gpio@20 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -330,7 +330,7 @@ pcf_lcd: gpio@20 {
 	};
 
 	pcf_gpio_21: gpio@21 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x21>;
 		lines-initial-states = <0x1408>;
 		gpio-controller;
@@ -362,7 +362,7 @@ &i2c2 {
 	clock-frequency = <400000>;
 
 	pcf_hdmi: gpio@26 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x26>;
 		gpio-controller;
 		#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index f2384277d5dcdc5c..f12825268188e493 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -226,7 +226,7 @@ pcf_lcd: gpio@20 {
 	};
 
 	pcf_gpio_21: gpio@21 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x21>;
 		lines-initial-states = <0x1408>;
 		gpio-controller;
@@ -256,7 +256,7 @@ &i2c5 {
 	clock-frequency = <400000>;
 
 	pcf_hdmi: pcf8575@26 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x26>;
 		gpio-controller;
 		#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index df47ea59c9c404c2..90e036ac6ffb5197 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -355,7 +355,7 @@ buck23_reg: buck23 {
 	};
 
 	pcf_lcd: pcf8757@20 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -366,7 +366,7 @@ pcf_lcd: pcf8757@20 {
 	};
 
 	pcf_gpio_21: pcf8757@21 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -377,7 +377,7 @@ pcf_gpio_21: pcf8757@21 {
 	};
 
 	pcf_hdmi: pcf8575@26 {
-		compatible = "ti,pcf8575", "nxp,pcf8575";
+		compatible = "nxp,pcf8575";
 		reg = <0x26>;
 		gpio-controller;
 		#gpio-cells = <2>;
-- 
2.25.1

