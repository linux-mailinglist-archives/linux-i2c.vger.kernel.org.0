Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C0544C97C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 20:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhKJTxF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 14:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhKJTxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 14:53:04 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858BBC061764
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 11:50:16 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so5985884wrb.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 11:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=geLSRi4FCt+c/I7zdRe9IBFISJEgU+7yaWXyBuqJoC0=;
        b=AMC6DtiKrW4/kJuXCMqBXLO7d30/NDkVUgjoA3xt+8BDTPIkBASbs44NsB50hOfgdY
         wSrETvChMAyi7bBSePP6Vpzdu4PLQ7mpt4r67adfpEisJnhsFzn6xih+P9qzcgRzDSGS
         YhIg+UY8waGnEBKytlQxiRmTRkpq6hSYsiwNKBzp8t8VdhmNF4lIr9AZqOI2nlaua9BQ
         M9GQnrbHOtbkAcKehmnVtZ0fbBERNj2tCnWdgo/wbN3R2C4qqeA743+brPK8LOYm+2BU
         GwJcJneUJhJkC912U1neV887JwYzj4eB4kuYLxI9nTsYslD4IQMY/qN1qUWqb+Ak6oPx
         ifdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=geLSRi4FCt+c/I7zdRe9IBFISJEgU+7yaWXyBuqJoC0=;
        b=SKE8N5QP1ZtURac6mqYKLbQl2I/U53yylbRgxfO3M6/tGvASSbPkH+j7XTU2r64VAJ
         4foChj3paRGDzrnM4x3Ejp7dkNnQXvbz7AmcOm8Il2t6SX0iBd5EzcaHt9/l+9U38ZPh
         d7Ny2TRzEotWFTExK3HImb/ZYj3jyfp7I9/zUsPhrbINFtCGSyVbW3gat3WVqQS13hDy
         lG5Mb2Z/MywNIpephy7McL3ioRnQc2+zJcxu6ouh/F7gOoftJ5Dordyo4b6cbWMhf+8/
         idpJzcAzrG3QokkMHQ993h5wydRSDlL6b1n97YUW2GA4QoCixKGWV7e8Ob76z3JS+EHF
         8MSw==
X-Gm-Message-State: AOAM53197PoAAGGIVhn2443N1BvXMpUMZ2yS7aKAtXtuQrXwV/oxNUhB
        5wiZEXjkmBVPgZnBicFPu9LT1w==
X-Google-Smtp-Source: ABdhPJxhONkOR/1gFrmkF2ek8fxt5sSiYcS+5fvMHATAmxkVKqAjKFDEM6j4DBnNKFKTEfoZrwf5tQ==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr1926086wrh.220.1636573815138;
        Wed, 10 Nov 2021 11:50:15 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id k15sm750935wrx.53.2021.11.10.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:50:14 -0800 (PST)
From:   Fabien Parent <fparent@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml schema format
Date:   Wed, 10 Nov 2021 20:49:56 +0100
Message-Id: <20211110194959.20611-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the binding documentation for i2c-mt65xx driver to the
YAML schema format.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v3:
	* rebased: added new compatible since last revision + added vbus-supply
		description
	* added clock-div description

v2:
	* write compatibles in a more compact way
	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
		"^i2c[0-9]*@[0-9a-f]+"$

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  51 ---------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 106 ++++++++++++++++++
 2 files changed, 106 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
deleted file mode 100644
index 5ea216ae7084..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ /dev/null
@@ -1,51 +0,0 @@
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
-      "mediatek,mt8173-i2c": for MediaTek MT8173
-      "mediatek,mt8183-i2c": for MediaTek MT8183
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
index 000000000000..af0880fcc22b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek I2C Controller
+
+maintainers:
+  - Qii Wang <qii.wang@mediatek.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  $nodename:
+    pattern: "^i2c@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2712-i2c
+          - mediatek,mt6577-i2c
+          - mediatek,mt6589-i2c
+          - mediatek,mt7622-i2c
+          - mediatek,mt8173-i2c
+          - mediatek,mt8183-i2c
+          - mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt2701-i2c
+              - mediatek,mt6797-i2c
+              - mediatek,mt7623-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt7629-i2c
+              - mediatek,mt8516-i2c
+          - const: mediatek,mt2712-i2c
+      - items:
+          - enum:
+              - mediatek,mt8195-i2c
+          - const: mediatek,mt8192-i2c
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: Controller clock
+      - description: DMA clock
+      - description: ARB clock for multi-master when a bus has more than
+          one i2c controllers
+      - description: PMIC clock. Only when mediatek,have-pmic is set.
+
+  clock-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      - const: main
+      - const: dma
+      - const: arb
+      - const: pmic
+
+  mediatek,have-pmic:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Platform can control I2C from the PMIC
+
+  mediatek,use-push-pull:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: IO config use push-pull mode.
+
+  vbus-supply:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the regulator that provides power to SCL/SDA.
+
+  clock-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fixed frequency divider for I2C clock source.
+    minimum: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - clock-div
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c0: i2c@1100d000 {
+            compatible = "mediatek,mt6577-i2c";
+            reg = <0x1100d000 0x70>,
+                  <0x11000300 0x80>;
+            interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+            clock-frequency = <400000>;
+            mediatek,have-pmic;
+            clock-div = <16>;
+            clocks = <&i2c0_ck>, <&ap_dma_ck>;
+            clock-names = "main", "dma";
+    };
-- 
2.33.1

