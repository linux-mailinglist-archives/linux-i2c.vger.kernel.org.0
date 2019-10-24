Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2D5E3CD4
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 22:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfJXUNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 16:13:35 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:40639 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726665AbfJXUNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 16:13:34 -0400
Received: from localhost (unknown [78.193.40.249])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 46CCF200003;
        Thu, 24 Oct 2019 20:13:31 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 4/5] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Date:   Thu, 24 Oct 2019 22:13:01 +0200
Message-Id: <20191024201302.23376-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024201302.23376-1-kamel.bouhara@bootlin.com>
References: <20191024201302.23376-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the i2c gpio pinctrls to support the i2c bus recovery

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 arch/arm/boot/dts/sama5d3.dtsi | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index f770aace0efd..faf8907d8d7d 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -159,8 +159,11 @@
 				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(7)>,
 				       <&dma0 2 AT91_DMA_CFG_PER_ID(8)>;
 				dma-names = "tx", "rx";
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c0>;
+				pinctrl-1 = <&pinctrl_i2c0_gpio>;
+				sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&twi0_clk>;
@@ -174,8 +177,11 @@
 				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(9)>,
 				       <&dma0 2 AT91_DMA_CFG_PER_ID(10)>;
 				dma-names = "tx", "rx";
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c1>;
+				pinctrl-1 = <&pinctrl_i2c1_gpio>;
+				sda-gpios = <&pioC 26 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioC 27 GPIO_ACTIVE_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&twi1_clk>;
@@ -357,8 +363,11 @@
 				dmas = <&dma1 2 AT91_DMA_CFG_PER_ID(11)>,
 				       <&dma1 2 AT91_DMA_CFG_PER_ID(12)>;
 				dma-names = "tx", "rx";
-				pinctrl-names = "default";
+				pinctrl-names = "default", "gpio";
 				pinctrl-0 = <&pinctrl_i2c2>;
+				pinctrl-1 = <&pinctrl_i2c2_gpio>;
+				sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
+				scl-gpios = <&pioA 19 GPIO_ACTIVE_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&twi2_clk>;
@@ -639,6 +648,12 @@
 							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PA30 periph A TWD0 pin, conflicts with URXD1, ISI_VSYNC */
 							 AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA31 periph A TWCK0 pin, conflicts with UTXD1, ISI_HSYNC */
 					};
+
+					pinctrl_i2c0_gpio: i2c0-gpio {
+						atmel,pins =
+							<AT91_PIOA 30 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOA 31 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
 
 				i2c1 {
@@ -647,6 +662,12 @@
 							<AT91_PIOC 26 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC26 periph B TWD1 pin, conflicts with SPI1_NPCS1, ISI_D11 */
 							 AT91_PIOC 27 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PC27 periph B TWCK1 pin, conflicts with SPI1_NPCS2, ISI_D10 */
 					};
+
+					pinctrl_i2c1_gpio: i2c1-gpio {
+						atmel,pins =
+							<AT91_PIOC 26 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOC 27 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
 
 				i2c2 {
@@ -655,6 +676,12 @@
 							<AT91_PIOA 18 AT91_PERIPH_B AT91_PINCTRL_NONE	/* TWD2 pin, conflicts with LCDDAT18, ISI_D2 */
 							 AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_NONE>; /* TWCK2 pin, conflicts with LCDDAT19, ISI_D3 */
 					};
+
+					pinctrl_i2c2_gpio: i2c2-gpio {
+						atmel,pins =
+							<AT91_PIOA 18 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOA 19 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
 
 				isi {
-- 
2.23.0

