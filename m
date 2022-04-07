Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D1E4F7C26
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 11:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244007AbiDGJuD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Apr 2022 05:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244023AbiDGJuC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 05:50:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AD61E3E2F;
        Thu,  7 Apr 2022 02:48:02 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id B32251F45DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649324881;
        bh=XSzyXGkALxerACJYYB2yjt0W7j5ycyiFDYbsQJ735ew=;
        h=From:To:Cc:Subject:Date:From;
        b=mE8LT3p4imnNh/A8NJ5o64WyIINExF1JPvlxYOpJ1kwAn2eTsr/hpeyuXb3wRs8Bp
         sAyDwEJGmP2db306Xp5XBCwEWFuwN29C6KeufSF8szvj4PfuRfxq7PFFVnihCumM71
         DiY3hk3yI4POZaW9durBSoMacUaAIIy7qkefrVcjWtP5fMyKfv/jKLDOFg7SySsi1p
         20DaP2vuSs7zYbkHHMnT7d0GR7fCnDb3EpXfJ7Rj0MOowWggM13qpiflNsI3edKQkA
         VQ2JT8LOAJPk3AtnmJ6qqbUJvJw5dtDVdW2U+B5Mr4E83RVQLlm4l8ClIdTqtu16JV
         8CJOTKjDEQf2w==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     robh+dt@kernel.org
Cc:     krzk+dt@kernel.org, matthias.bgg@gmail.com, qii.wang@mediatek.com,
        wsa@kernel.org, kewei.xu@mediatek.com,
        angelogioacchino.delregno@collabora.com, hsinyi@chromium.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        miles.chen@mediatek.com
Subject: [PATCH v2] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Date:   Thu,  7 Apr 2022 11:47:53 +0200
Message-Id: <20220407094753.13282-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert I2C binding for MediaTek SoCs to Devicetree schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v2: Changed minItems for clocks, clock-names to 2 (main, dma clks are mandatory)

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 119 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
deleted file mode 100644
index 026985b8f61a..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* MediaTek's I2C controller
-
-The MediaTek's I2C controller is used to interface with I2C devices.
-
-Required properties:
-  - compatible: value should be either of the following.
-      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
-      "mediatek,mt2712-i2c": for MediaTek MT2712
-      "mediatek,mt6577-i2c": for MediaTek MT6577
-      "mediatek,mt6589-i2c": for MediaTek MT6589
-      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
-      "mediatek,mt7622-i2c": for MediaTek MT7622
-      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
-      "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
-      "mediatek,mt8168-i2c": for MediaTek MT8168
-      "mediatek,mt8173-i2c": for MediaTek MT8173
-      "mediatek,mt8183-i2c": for MediaTek MT8183
-      "mediatek,mt8186-i2c": for MediaTek MT8186
-      "mediatek,mt8192-i2c": for MediaTek MT8192
-      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
-      "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
-  - reg: physical base address of the controller and dma base, length of memory
-    mapped region.
-  - interrupts: interrupt number to the cpu.
-  - clock-div: the fixed value for frequency divider of clock source in i2c
-    module. Each IC may be different.
-  - clocks: clock name from clock manager
-  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
-    one bus has more than two i2c controllers, if enable have-pmic need include
-    "pmic" extra.
-
-Optional properties:
-  - clock-frequency: Frequency in Hz of the bus when transfer, the default value
-    is 100000.
-  - mediatek,have-pmic: platform can control i2c form special pmic side.
-    Only mt6589 and mt8135 support this feature.
-  - mediatek,use-push-pull: IO config use push-pull mode.
-  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
-
-Example:
-
-	i2c0: i2c@1100d000 {
-			compatible = "mediatek,mt6577-i2c";
-			reg = <0x1100d000 0x70>,
-			      <0x11000300 0x80>;
-			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
-			clock-frequency = <400000>;
-			mediatek,have-pmic;
-			clock-div = <16>;
-			clocks = <&i2c0_ck>, <&ap_dma_ck>;
-			clock-names = "main", "dma";
-	};
-
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
new file mode 100644
index 000000000000..16a1a3118204
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek I2C controller
+
+description:
+  This driver interfaces with the native I2C controller present in
+  various MediaTek SoCs.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+maintainers:
+  - Qii Wang <qii.wang@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt2712-i2c
+      - const: mediatek,mt6577-i2c
+      - const: mediatek,mt6589-i2c
+      - const: mediatek,mt7622-i2c
+      - const: mediatek,mt8168-i2c
+      - const: mediatek,mt8173-i2c
+      - const: mediatek,mt8183-i2c
+      - const: mediatek,mt8186-i2c
+      - const: mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt7629-i2c
+              - mediatek,mt8516-i2c
+          - const: mediatek,mt2712-i2c
+      - items:
+          - enum:
+              - mediatek,mt2701-i2c
+              - mediatek,mt6797-i2c
+              - mediatek,mt7623-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt8195-i2c
+          - const: mediatek,mt8192-i2c
+
+  reg:
+    items:
+      - description: Physical base address
+      - description: DMA base address
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: Main clock for I2C bus
+      - description: Clock for I2C via DMA
+      - description: Bus arbitrator clock
+      - description: Clock for I2C from PMIC
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: main
+      - const: dma
+      - const: arb
+      - const: pmic
+
+  clock-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Frequency divider of clock source in I2C module
+
+  clock-frequency:
+    default: 100000
+    description:
+      SCL frequency to use (in Hz). If omitted, 100kHz is used.
+
+  mediatek,have-pmic:
+    description: Platform controls I2C from PMIC side
+    type: boolean
+
+  mediatek,use-push-pull:
+    description: Use push-pull mode I/O config
+    type: boolean
+
+  vbus-supply:
+    description: Phandle to the regulator providing power to SCL/SDA
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-div
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c0: i2c@1100d000 {
+      compatible = "mediatek,mt6577-i2c";
+      reg = <0x1100d000 0x70>, <0x11000300 0x80>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&i2c0_ck>, <&ap_dma_ck>;
+      clock-names = "main", "dma";
+      clock-div = <16>;
+      clock-frequency = <400000>;
+      mediatek,have-pmic;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ee0b5a70aff1..28a17d4c8d12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12361,7 +12361,7 @@ MEDIATEK I2C CONTROLLER DRIVER
 M:	Qii Wang <qii.wang@mediatek.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
 F:	drivers/i2c/busses/i2c-mt65xx.c
 
 MEDIATEK IOMMU DRIVER
-- 
2.35.1

