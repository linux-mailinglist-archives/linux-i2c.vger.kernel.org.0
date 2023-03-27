Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5046C9F4E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 11:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjC0JZl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 05:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjC0JZl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 05:25:41 -0400
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B0F40D2
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 02:25:38 -0700 (PDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 32R9AVru029694;
        Mon, 27 Mar 2023 17:10:31 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 27 Mar
 2023 17:25:29 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     <jk@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, ryan_chen <ryan_chen@aspeedtech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v7 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
Date:   Mon, 27 Mar 2023 17:25:23 +0800
Message-ID: <20230327092524.3916389-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327092524.3916389-1-ryan_chen@aspeedtech.com>
References: <20230327092524.3916389-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 32R9AVru029694
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update ASPEED I2C maintainers email.
Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
and description for ast2600-i2cv2.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index f597f73ccd87..00b92c97f432 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -7,10 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
 
 maintainers:
-  - Rayn Chen <rayn_chen@aspeedtech.com>
-
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - Ryan Chen <ryan_chen@aspeedtech.com>
 
 properties:
   compatible:
@@ -49,6 +46,25 @@ properties:
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
@@ -57,6 +73,26 @@ required:
 
 unevaluatedProperties: false
 
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
+
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
@@ -71,3 +107,15 @@ examples:
       interrupts = <0>;
       interrupt-parent = <&i2c_ic>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c1: i2c@80 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "aspeed,ast2600-i2cv2";
+      reg = <0x80 0x80>, <0xc00 0x20>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,global-regs = <&i2c_global>;
+      clocks = <&syscon ASPEED_CLK_APB>;
+      resets = <&syscon ASPEED_RESET_I2C>;
+    };
-- 
2.34.1

