Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47DA554D350
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 23:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347806AbiFOVH5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 17:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345108AbiFOVH5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 17:07:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4D011154;
        Wed, 15 Jun 2022 14:07:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6B96B82186;
        Wed, 15 Jun 2022 21:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79088C3411E;
        Wed, 15 Jun 2022 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655327273;
        bh=afcLwBL4IqyBLp17UkuvL96DCi1aq3MSXhliCFj/RJw=;
        h=From:To:Cc:Subject:Date:From;
        b=Xt2ChoaFaXUxOv/BkARH9jsEPnjGXn8sRjjjeerEn5jW5JIzUUEPDt3iwjog6LGrM
         mGE3MS/2SIcp34Op8JlAAYWN7HZ/wd0M6/e2/PtCMQjpnc3AMurKG6jC8yKeWfd/PG
         LCc+OF2E9L608Szq78edATbDy0a0lskwavXppglsN4iSOcYdv3OUNLrpbzsoKtv3ep
         aEWOYOJgaP+p5gK9fLThsvgNQZBplObbHqQqmoy1UTrIXvrurF9GYxEqAa5zhQlNti
         3qa0M3rWonCdENbKXAE8/PeQvU9tgZiP6tlrLzVVBbm1nuJ4rWXeTxln2Yc2hiO4/k
         fw3vvcL1QoE3w==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-doc@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH] dt-bindings: efm32: remove bindings for deleted platform
Date:   Wed, 15 Jun 2022 23:07:19 +0200
Message-Id: <20220615210720.6363-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit cc6111375cec ("ARM: drop efm32 platform") removed the platform,
so no need to still carry the bindings.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 .../devicetree/bindings/clock/efm32-clock.txt | 11 -----
 .../devicetree/bindings/i2c/i2c-efm32.txt     | 33 --------------
 .../devicetree/bindings/serial/efm32-uart.txt | 20 ---------
 .../devicetree/bindings/spi/efm32-spi.txt     | 39 -----------------
 include/dt-bindings/clock/efm32-cmu.h         | 43 -------------------
 5 files changed, 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/efm32-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-efm32.txt
 delete mode 100644 Documentation/devicetree/bindings/serial/efm32-uart.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/efm32-spi.txt
 delete mode 100644 include/dt-bindings/clock/efm32-cmu.h

diff --git a/Documentation/devicetree/bindings/clock/efm32-clock.txt b/Documentation/devicetree/bindings/clock/efm32-clock.txt
deleted file mode 100644
index 263d293f6a10..000000000000
--- a/Documentation/devicetree/bindings/clock/efm32-clock.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-* Clock bindings for Energy Micro efm32 Giant Gecko's Clock Management Unit
-
-Required properties:
-- compatible: Should be "efm32gg,cmu"
-- reg: Base address and length of the register set
-- interrupts: Interrupt used by the CMU
-- #clock-cells: Should be <1>
-
-The clock consumer should specify the desired clock by having the clock ID in
-its "clocks" phandle cell. The header efm32-clk.h contains a list of available
-IDs.
diff --git a/Documentation/devicetree/bindings/i2c/i2c-efm32.txt b/Documentation/devicetree/bindings/i2c/i2c-efm32.txt
deleted file mode 100644
index 3b30e54ae3c7..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-efm32.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Energymicro efm32 i2c controller
-
-Required properties :
-
- - reg : Offset and length of the register set for the device
- - compatible : should be "energymicro,efm32-i2c"
- - interrupts : the interrupt number
- - clocks : reference to the module clock
-
-Recommended properties :
-
- - clock-frequency : maximal I2C bus clock frequency in Hz.
- - energymicro,location : Decides the location of the USART I/O pins.
-   Allowed range : [0 .. 6]
-
-Example:
-	i2c0: i2c@4000a000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "energymicro,efm32-i2c";
-		reg = <0x4000a000 0x400>;
-		interrupts = <9>;
-		clocks = <&cmu clk_HFPERCLKI2C0>;
-		clock-frequency = <100000>;
-		energymicro,location = <3>;
-
-		eeprom@50 {
-			compatible = "microchip,24c02";
-			reg = <0x50>;
-			pagesize = <16>;
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/serial/efm32-uart.txt b/Documentation/devicetree/bindings/serial/efm32-uart.txt
deleted file mode 100644
index 4f8d8fde0c1c..000000000000
--- a/Documentation/devicetree/bindings/serial/efm32-uart.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Energymicro efm32 UART
-
-Required properties:
-- compatible : Should be "energymicro,efm32-uart"
-- reg : Address and length of the register set
-- interrupts : Should contain uart interrupt
-
-Optional properties:
-- energymicro,location : Decides the location of the USART I/O pins.
-  Allowed range : [0 .. 5]
-  Default: 0
-
-Example:
-
-uart@4000c400 {
-	compatible = "energymicro,efm32-uart";
-	reg = <0x4000c400 0x400>;
-	interrupts = <15>;
-	energymicro,location = <0>;
-};
diff --git a/Documentation/devicetree/bindings/spi/efm32-spi.txt b/Documentation/devicetree/bindings/spi/efm32-spi.txt
deleted file mode 100644
index e0fa61a1be0c..000000000000
--- a/Documentation/devicetree/bindings/spi/efm32-spi.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-* Energy Micro EFM32 SPI
-
-Required properties:
-- #address-cells: see spi-bus.txt
-- #size-cells: see spi-bus.txt
-- compatible: should be "energymicro,efm32-spi"
-- reg: Offset and length of the register set for the controller
-- interrupts: pair specifying rx and tx irq
-- clocks: phandle to the spi clock
-- cs-gpios: see spi-bus.txt
-
-Recommended properties :
-- energymicro,location: Value to write to the ROUTE register's LOCATION
-                        bitfield to configure the pinmux for the device, see
-                        datasheet for values.
-                        If this property is not provided, keeping what is
-                        already configured in the hardware, so its either the
-                        reset default 0 or whatever the bootloader did.
-
-Example:
-
-spi1: spi@4000c400 { /* USART1 */
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "energymicro,efm32-spi";
-	reg = <0x4000c400 0x400>;
-	interrupts = <15 16>;
-	clocks = <&cmu 20>;
-	cs-gpios = <&gpio 51 1>; // D3
-	energymicro,location = <1>;
-
-	ks8851@0 {
-		compatible = "ks8851";
-		spi-max-frequency = <6000000>;
-		reg = <0>;
-		interrupt-parent = <&boardfpga>;
-		interrupts = <4>;
-	};
-};
diff --git a/include/dt-bindings/clock/efm32-cmu.h b/include/dt-bindings/clock/efm32-cmu.h
deleted file mode 100644
index 4b48d15fe194..000000000000
--- a/include/dt-bindings/clock/efm32-cmu.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_CLOCK_EFM32_CMU_H
-#define __DT_BINDINGS_CLOCK_EFM32_CMU_H
-
-#define clk_HFXO		0
-#define clk_HFRCO		1
-#define clk_LFXO		2
-#define clk_LFRCO		3
-#define clk_ULFRCO		4
-#define clk_AUXHFRCO		5
-#define clk_HFCLKNODIV		6
-#define clk_HFCLK		7
-#define clk_HFPERCLK		8
-#define clk_HFCORECLK		9
-#define clk_LFACLK		10
-#define clk_LFBCLK		11
-#define clk_WDOGCLK		12
-#define clk_HFCORECLKDMA	13
-#define clk_HFCORECLKAES	14
-#define clk_HFCORECLKUSBC	15
-#define clk_HFCORECLKUSB	16
-#define clk_HFCORECLKLE		17
-#define clk_HFCORECLKEBI	18
-#define clk_HFPERCLKUSART0	19
-#define clk_HFPERCLKUSART1	20
-#define clk_HFPERCLKUSART2	21
-#define clk_HFPERCLKUART0	22
-#define clk_HFPERCLKUART1	23
-#define clk_HFPERCLKTIMER0	24
-#define clk_HFPERCLKTIMER1	25
-#define clk_HFPERCLKTIMER2	26
-#define clk_HFPERCLKTIMER3	27
-#define clk_HFPERCLKACMP0	28
-#define clk_HFPERCLKACMP1	29
-#define clk_HFPERCLKI2C0	30
-#define clk_HFPERCLKI2C1	31
-#define clk_HFPERCLKGPIO	32
-#define clk_HFPERCLKVCMP	33
-#define clk_HFPERCLKPRS		34
-#define clk_HFPERCLKADC0	35
-#define clk_HFPERCLKDAC0	36
-
-#endif /* __DT_BINDINGS_CLOCK_EFM32_CMU_H */
-- 
2.35.1

