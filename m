Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B3D13BEFC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 12:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbgAOLzC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 06:55:02 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:17829 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730297AbgAOLzB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 06:55:01 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: yLzAlM8/Q0rumPtMnTZ3kEUzMINh4dLf9J+r8Ub30JwQEouZwgKpdgtdQZHZnmSbabaMthe8r6
 A5G3l4uQ1N3qWJk6G9h1qb7Jli3NbFIrV1YXjgHhKk/NlryzwqsuujA5xCMsA2h/xfwHtBLRHP
 WbVYqibSnqPywPWWudNK5dvmuRgkWx68nof+0kNvO4DBGUODFxZMbO8l1P9y84F4ti5tYxwk4q
 xIe12b/DF8mdxWgyt/YL4y1vGcagsKS90kaX0+8V5j+KjBnvMkpisklBoFFIHafptesgPEynWL
 EVE=
X-IronPort-AV: E=Sophos;i="5.70,322,1574146800"; 
   d="scan'208";a="64802524"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jan 2020 04:55:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Jan 2020 04:54:59 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 15 Jan 2020 04:54:56 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v3 6/6] ARM: at91/dt: sama5d2: add i2c gpio pinctrl
Date:   Wed, 15 Jan 2020 13:54:22 +0200
Message-ID: <20200115115422.17097-7-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Add the i2c gpio pinctrls to support the i2c bus recovery

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[codrin.ciubotariu@microchip.com: removed gpio pull-ups]
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v3:
 - removed gpio pull-ups;

Changes in v2:
 - new patch;

 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts   | 33 +++++++++++++++++++--
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 33 +++++++++++++++++++--
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
index ba7f3e646c26..1c24ac8019ba 100644
--- a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
@@ -180,8 +180,11 @@
 
 			i2c0: i2c@f8028000 {
 				dmas = <0>, <0>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c0_default>;
+				pinctrl-1 = <&pinctrl_i2c0_gpio>;
+				sda-gpios = <&pioA PIN_PD21 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioA PIN_PD22 GPIO_ACTIVE_HIGH>;
 				status = "okay";
 			};
 
@@ -198,8 +201,11 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
-					pinctrl-names = "default";
+					pinctrl-names = "default", "gpio";
 					pinctrl-0 = <&pinctrl_flx0_default>;
+					pinctrl-1 = <&pinctrl_flx0_gpio>;
+					sda-gpios = <&pioA PIN_PB28 GPIO_ACTIVE_HIGH>;
+					scl-gpios = <&pioA PIN_PB29 GPIO_ACTIVE_HIGH>;
 					atmel,fifo-size = <16>;
 					status = "okay";
 				};
@@ -226,8 +232,11 @@
 
 			i2c1: i2c@fc028000 {
 				dmas = <0>, <0>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c1_default>;
+				pinctrl-1 = <&pinctrl_i2c1_gpio>;
+				sda-gpios = <&pioA PIN_PC6 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioA PIN_PC7 GPIO_ACTIVE_HIGH>;
 				status = "okay";
 
 				at24@50 {
@@ -244,18 +253,36 @@
 					bias-disable;
 				};
 
+				pinctrl_flx0_gpio: flx0_gpio {
+					pinmux = <PIN_PB28__GPIO>,
+						 <PIN_PB29__GPIO>;
+					bias-disable;
+				};
+
 				pinctrl_i2c0_default: i2c0_default {
 					pinmux = <PIN_PD21__TWD0>,
 						 <PIN_PD22__TWCK0>;
 					bias-disable;
 				};
 
+				pinctrl_i2c0_gpio: i2c0_gpio {
+					pinmux = <PIN_PD21__GPIO>,
+						 <PIN_PD22__GPIO>;
+					bias-disable;
+				};
+
 				pinctrl_i2c1_default: i2c1_default {
 					pinmux = <PIN_PC6__TWD1>,
 						 <PIN_PC7__TWCK1>;
 					bias-disable;
 				};
 
+				pinctrl_i2c1_gpio: i2c1_gpio {
+					pinmux = <PIN_PC6__GPIO>,
+						 <PIN_PC7__GPIO>;
+					bias-disable;
+				};
+
 				pinctrl_key_gpio_default: key_gpio_default {
 					pinmux = <PIN_PA10__GPIO>;
 					bias-pull-up;
diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index 9d0a7fbea725..055ee53e4773 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -129,8 +129,11 @@
 
 			i2c0: i2c@f8028000 {
 				dmas = <0>, <0>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c0_default>;
+				pinctrl-1 = <&pinctrl_i2c0_gpio>;
+				sda-gpios = <&pioA PIN_PD21 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioA PIN_PD22 GPIO_ACTIVE_HIGH>;
 				i2c-sda-hold-time-ns = <350>;
 				status = "okay";
 
@@ -331,8 +334,11 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 23>;
-					pinctrl-names = "default";
+					pinctrl-names = "default", "gpio";
 					pinctrl-0 = <&pinctrl_flx4_default>;
+					pinctrl-1 = <&pinctrl_flx4_gpio>;
+					sda-gpios = <&pioA PIN_PD12 GPIO_ACTIVE_HIGH>;
+					scl-gpios = <&pioA PIN_PD13 GPIO_ACTIVE_HIGH>;
 					atmel,fifo-size = <16>;
 					i2c-analog-filter;
 					i2c-digital-filter;
@@ -343,11 +349,14 @@
 
 			i2c1: i2c@fc028000 {
 				dmas = <0>, <0>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c1_default>;
 				i2c-analog-filter;
 				i2c-digital-filter;
 				i2c-digital-filter-width-ns = <35>;
+				pinctrl-1 = <&pinctrl_i2c1_gpio>;
+				sda-gpios = <&pioA PIN_PD4 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioA PIN_PD5 GPIO_ACTIVE_HIGH>;
 				status = "okay";
 
 				at24@54 {
@@ -441,18 +450,36 @@
 					bias-disable;
 				};
 
+				pinctrl_flx4_gpio: flx4_gpio {
+					pinmux = <PIN_PD12__GPIO>,
+						 <PIN_PD13__GPIO>;
+					bias-disable;
+				};
+
 				pinctrl_i2c0_default: i2c0_default {
 					pinmux = <PIN_PD21__TWD0>,
 						 <PIN_PD22__TWCK0>;
 					bias-disable;
 				};
 
+				pinctrl_i2c0_gpio: i2c0_gpio {
+					pinmux = <PIN_PD21__GPIO>,
+						 <PIN_PD22__GPIO>;
+					bias-disable;
+				};
+
 				pinctrl_i2c1_default: i2c1_default {
 					pinmux = <PIN_PD4__TWD1>,
 						 <PIN_PD5__TWCK1>;
 					bias-disable;
 				};
 
+				pinctrl_i2c1_gpio: i2c1_gpio {
+					pinmux = <PIN_PD4__GPIO>,
+						 <PIN_PD5__GPIO>;
+					bias-disable;
+				};
+
 				pinctrl_i2s0_default: i2s0_default {
 					pinmux = <PIN_PC1__I2SC0_CK>,
 						 <PIN_PC2__I2SC0_MCK>,
-- 
2.20.1

