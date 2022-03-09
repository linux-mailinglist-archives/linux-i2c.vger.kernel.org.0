Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6CB4D2EB8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Mar 2022 13:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiCIMI6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Mar 2022 07:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiCIMI5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Mar 2022 07:08:57 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6034B561D;
        Wed,  9 Mar 2022 04:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646827678; x=1678363678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Byu8P78w96N4rhS6oryyUAAOHS75SicuioSZJ5/sOU=;
  b=k+JBI5yCytnkpmixavPTmX81/UHpdOyi+PYfjiNFqH79aUh2Iod2wKnQ
   7vmFgceG33CABhCU9+Aw9y15M3GqpVjktJaNiiIMyO7LtX6Imm/SZEAZX
   HbRCXi/jJAL+KVSoeS0APkyNy/bd7Cucdykha4CtYqlsTAcdG88CLhRBf
   H0gmSkhLUp5VzCPylpyfX/vpR19NUQDISnWvWLv8bccoX6BSrcJiHqSG4
   vBGcGX8I6rYhyGdVdCyyaTlo7F3Jppk5n+AmjoeeFFTYzQnEIMbMr40+r
   MKO9rTCqW6VmzYqAkeBk05KCWsHHrNcNXjcRTcX7MIKFlrNqjfM5XvJ5b
   w==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; 
   d="scan'208";a="156252247"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2022 05:07:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 05:07:42 -0700
Received: from ROB-ULT-M68701.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 05:07:39 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH 2/3] dt-bindings: i2c: convert i2c-at91 to json-schema
Date:   Wed, 9 Mar 2022 14:07:13 +0200
Message-ID: <20220309120714.51393-3-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309120714.51393-1-sergiu.moga@microchip.com>
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert I2C binding for Atmel/Microchip SoCs to Device Tree Schema
format.

Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
---
 .../bindings/i2c/atmel,at91sam-i2c.yaml       | 144 ++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-at91.txt      |  82 ----------
 2 files changed, 144 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-at91.txt

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
new file mode 100644
index 000000000000..d4aadbbd1a11
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/atmel,at91sam-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C for Atmel/Microchip platforms
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: "i2c-controller.yaml"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - atmel,sama5d4-i2c
+              - atmel,sama5d2-i2c
+              - microchip,sam9x60-i2c
+    then:
+      properties:
+        i2c-sda-hold-time-ns:
+          description:
+            TWD hold time
+          maxItems: 1
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-i2c
+      - atmel,at91sam9261-i2c
+      - atmel,at91sam9260-i2c
+      - atmel,at91sam9g20-i2c
+      - atmel,at91sam9g10-i2c
+      - atmel,at91sam9x5-i2c
+      - atmel,sama5d4-i2c
+      - atmel,sama5d2-i2c
+      - microchip,sam9x60-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+  dmas:
+    items:
+      - description: TX DMA Channel Specifier
+      - description: RX DMA Channel Specifier
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  atmel,fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Maximum number of data the RX and TX FIFOs can store for
+      FIFO capable I2C controllers.
+
+  scl-gpios: true
+
+  sda-gpios: true
+
+  pinctrl:
+    description: |
+      Add extra pinctrl to configure i2c pins to gpio function for i2c
+      bus recovery, call it "gpio" state
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0: i2c@fff84000 {
+        compatible = "atmel,at91sam9g20-i2c";
+        reg = <0xfff84000 0x100>;
+        interrupts = <12 IRQ_TYPE_LEVEL_HIGH 6>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&twi0_clk>;
+        clock-frequency = <400000>;
+
+        eeprom@50 {
+            compatible = "atmel,24c512";
+            reg = <0x50>;
+            pagesize = <128>;
+        };
+    };
+
+    i2c1: i2c@f8034600 {
+        compatible = "atmel,sama5d2-i2c";
+        reg = <0xf8034600 0x100>;
+        interrupts = <19 IRQ_TYPE_LEVEL_HIGH 7>;
+        dmas = <&dma0
+            (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1))
+            AT91_XDMAC_DT_PERID(11)>,
+               <&dma0
+            (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1))
+            AT91_XDMAC_DT_PERID(12)>;
+        dma-names = "tx", "rx";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&flx0>;
+        atmel,fifo-size = <16>;
+        i2c-sda-hold-time-ns = <336>;
+        pinctrl-names = "default", "gpio";
+        pinctrl-0 = <&pinctrl_i2c0>;
+        pinctrl-1 = <&pinctrl_i2c0_gpio>;
+        sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
+        scl-gpios = <&pioA 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+        eeprom@1a {
+            compatible = "wm8731";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
deleted file mode 100644
index 2015f50aed0f..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-I2C for Atmel platforms
-
-Required properties :
-- compatible : Must be one of:
-	"atmel,at91rm9200-i2c",
-	"atmel,at91sam9261-i2c",
-	"atmel,at91sam9260-i2c",
-	"atmel,at91sam9g20-i2c",
-	"atmel,at91sam9g10-i2c",
-	"atmel,at91sam9x5-i2c",
-	"atmel,sama5d4-i2c",
-	"atmel,sama5d2-i2c",
-	"microchip,sam9x60-i2c".
-- reg: physical base address of the controller and length of memory mapped
-     region.
-- interrupts: interrupt number to the cpu.
-- #address-cells = <1>;
-- #size-cells = <0>;
-- clocks: phandles to input clocks.
-
-Optional properties:
-- clock-frequency: Desired I2C bus frequency in Hz, otherwise defaults to 100000
-- dmas: A list of two dma specifiers, one for each entry in dma-names.
-- dma-names: should contain "tx" and "rx".
-- atmel,fifo-size: maximum number of data the RX and TX FIFOs can store for FIFO
-  capable I2C controllers.
-- i2c-sda-hold-time-ns: TWD hold time, only available for:
-	"atmel,sama5d4-i2c",
-	"atmel,sama5d2-i2c",
-	"microchip,sam9x60-i2c".
-- scl-gpios: specify the gpio related to SCL pin
-- sda-gpios: specify the gpio related to SDA pin
-- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
-  bus recovery, call it "gpio" state
-- Child nodes conforming to i2c bus binding
-
-
-Examples :
-
-i2c0: i2c@fff84000 {
-	compatible = "atmel,at91sam9g20-i2c";
-	reg = <0xfff84000 0x100>;
-	interrupts = <12 4 6>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	clocks = <&twi0_clk>;
-	clock-frequency = <400000>;
-
-	24c512@50 {
-		compatible = "atmel,24c512";
-		reg = <0x50>;
-		pagesize = <128>;
-	}
-}
-
-i2c0: i2c@f8034600 {
-	compatible = "atmel,sama5d2-i2c";
-	reg = <0xf8034600 0x100>;
-	interrupts = <19 IRQ_TYPE_LEVEL_HIGH 7>;
-	dmas = <&dma0
-		(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1))
-		AT91_XDMAC_DT_PERID(11)>,
-	       <&dma0
-		(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1))
-		AT91_XDMAC_DT_PERID(12)>;
-	dma-names = "tx", "rx";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	clocks = <&flx0>;
-	atmel,fifo-size = <16>;
-	i2c-sda-hold-time-ns = <336>;
-	pinctrl-names = "default", "gpio";
-	pinctrl-0 = <&pinctrl_i2c0>;
-	pinctrl-1 = <&pinctrl_i2c0_gpio>;
-	sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
-	scl-gpios = <&pioA 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-
-	wm8731: wm8731@1a {
-		compatible = "wm8731";
-		reg = <0x1a>;
-	};
-};
-- 
2.25.1

