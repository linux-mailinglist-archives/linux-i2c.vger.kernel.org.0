Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578AF6E2E3F
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Apr 2023 03:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjDOBbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 21:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjDOBbt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 21:31:49 -0400
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EFD6EBB;
        Fri, 14 Apr 2023 18:31:48 -0700 (PDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 33F1CmhU037682;
        Sat, 15 Apr 2023 09:12:48 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 15 Apr
 2023 09:28:51 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     <jk@codeconstruct.com.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        "Phil Edworthy" <phil.edworthy@renesas.com>,
        <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
Date:   Sat, 15 Apr 2023 09:28:47 +0800
Message-ID: <20230415012848.1777768-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33F1CmhU037682
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
and description for ast2600-i2cv2.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 51 +++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index f597f73ccd87..55d20eee06b1 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -9,9 +9,6 @@ title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
 maintainers:
   - Rayn Chen <rayn_chen@aspeedtech.com>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
     enum:
@@ -49,12 +46,50 @@ properties:
     description:
       states that there is another master active on this bus
 
+  aspeed,enable-dma:
+    type: boolean
+    description: |
+      I2C bus enable dma mode transfer.
+
+      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
+      single DMA engine. DTS files can specify the data transfer mode to/from
+      the device, either DMA or programmed I/O. However, hardware limitations
+      may require a DTS to manually allocate which controller can use DMA mode.
+      The "aspeed,enable-dma" property allows control of this.
+
+      In cases where one the hardware design results in a specific
+      controller handling a larger amount of data, a DTS would likely
+      enable DMA mode for that one controller.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of i2c global register node.
+
 required:
   - reg
   - compatible
   - clocks
   - resets
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-i2cv2
+
+    then:
+      properties:
+        reg:
+          minItems: 2
+      required:
+        - aspeed,global-regs
+    else:
+      properties:
+        aspeed,global-regs: false
+        aspeed,enable-dma: false
+
 unevaluatedProperties: false
 
 examples:
@@ -71,3 +106,13 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      compatible = "aspeed,ast2600-i2cv2";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

