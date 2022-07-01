Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B9356381E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 18:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiGAQjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 12:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGAQjk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 12:39:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CF0D28E0A;
        Fri,  1 Jul 2022 09:39:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,237,1650898800"; 
   d="scan'208";a="124796655"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2022 01:39:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.33])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A8C74400967D;
        Sat,  2 Jul 2022 01:39:35 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Date:   Fri,  1 Jul 2022 17:39:15 +0100
Message-Id: <20220701163916.111435-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701163916.111435-1-phil.edworthy@renesas.com>
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3:
 - Fix example indentation
v2:
 - Use an enum and set the default for clock-frequency
 - Add resets property
---
 .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml

diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
new file mode 100644
index 000000000000..c46378efc123
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/renesas,rzv2m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2M I2C Bus Interface
+
+maintainers:
+  - Phil Edworthy <phil.edworthy@renesas.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,i2c-r9a09g011  # RZ/V2M
+      - const: renesas,rzv2m-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Data transmission/reception interrupt
+      - description: Status interrupt
+
+  interrupt-names:
+    items:
+      - const: tia
+      - const: tis
+
+  clock-frequency:
+    default: 100000
+    enum: [ 100000, 400000 ]
+    description:
+      Desired I2C bus clock frequency in Hz.
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - power-domains
+  - resets
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a09g011-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c0: i2c@a4030000 {
+        compatible = "renesas,i2c-r9a09g011", "renesas,rzv2m-i2c";
+        reg = <0xa4030000 0x80>;
+        interrupts = <GIC_SPI 232 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "tia", "tis";
+        clocks = <&cpg CPG_MOD R9A09G011_IIC_PCLK0>;
+        resets = <&cpg R9A09G011_IIC_GPA_PRESETN>;
+        power-domains = <&cpg>;
+        clock-frequency = <100000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.34.1

