Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1DF06A2D34
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 04:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjBZDNl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Feb 2023 22:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjBZDNk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Feb 2023 22:13:40 -0500
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE35AD1D
        for <linux-i2c@vger.kernel.org>; Sat, 25 Feb 2023 19:13:38 -0800 (PST)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 31Q30CKT025216;
        Sun, 26 Feb 2023 11:00:12 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 26 Feb
 2023 11:13:25 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
Date:   Sun, 26 Feb 2023 11:13:20 +0800
Message-ID: <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31Q30CKT025216
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,timeout
aspeed,xfer-mode description for ast2600-i2cv2.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index f597f73ccd87..75de3ce41cf5 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -49,6 +49,25 @@ properties:
     description:
       states that there is another master active on this bus
 
+  aspeed,timeout:
+    type: boolean
+    description: I2C bus timeout enable for master/slave mode
+
+  aspeed,xfer-mode:
+    description: |
+      I2C bus transfer mode selection.
+      - "byte": I2C bus byte transfer mode.
+      - "buffered": I2C bus buffer register transfer mode.
+      - "dma": I2C bus dma transfer mode (default)
+    items:
+      enum: [byte, buffered, dma]
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of i2c global register node.
+
 required:
   - reg
   - compatible
@@ -57,6 +76,19 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2600-i2cv2
+
+then:
+  properties:
+    reg:
+      minItems: 2
+  required:
+    - aspeed,global-regs
+
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
@@ -71,3 +103,15 @@ examples:
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

