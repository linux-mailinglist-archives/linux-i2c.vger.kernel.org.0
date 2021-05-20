Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A786438AE1C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 14:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhETMZV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 08:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhETMZQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 08:25:16 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8908AC0438C6
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:21:10 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b7so8351314wmh.5
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkbd3ZNvjGsOfD3AtfBISF0Ql1q34vUavLh2tmeeXiY=;
        b=AbuR8D31D0aEydN9/qBTqKVe762diEtY52hlBCNUqPOBMR1/4MruCFDWdmypmSvYlx
         mjXBc56vIghamZhnPYqYkTblnJmeGyYXEk5+zM013Cniioh2svZjE2a2Yg+gdNhJ2Gkw
         AFueyd3oABPgMAPqKW/B2RRrPWpi2h8J3fG56vYLjllgEPoi+2Su3aO5I8pAjTvHHXUn
         h/b9OQXH4XgRx3C0+rHXKlB4hIKGzl9i8K5VYNVoovqKM9eLUAabQaSuzmmXg5g8JIRT
         orAeQgRTIg6ATo/vZX4mwx9kHLmUs6yx2R1qkzKvs3uy3NR3B6oFy5p0dhR1BVxTHxNc
         1HhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkbd3ZNvjGsOfD3AtfBISF0Ql1q34vUavLh2tmeeXiY=;
        b=c5Qwe+wvEnCO9FqctKsbAO2jV16X4nlHqteEKenzloUrkqEUSaI11J/NTGQTpnruhB
         uZhSY1clxkgJrYTxlGYpDnHIKyW4Nm58/S9QLemPUrFPIe34pMx8FHgEW0HgRcIVI3U4
         iImNiMy0XRESlcBlBC0i726UED/9NqggyxySgCFbaUh+wqqH76cY6YC08cAUjBzNUqDu
         fLSMerHb27awEvT83Yibn2Rgo/h+kW4baL18peBEgzxI4N5XWiUgmBpG0PbWml+731m3
         MpUTKX2KjZLnn2MbGnsQAXtLJdFsaItrR6WdpP9+qF0E6thKD7fQrt9vtec7gMqlZ34r
         cgQA==
X-Gm-Message-State: AOAM530FSSSm9AIJXNIr33yx8wcmIu9Ay8fEG8fi8lni3PmDHHN7Wp2v
        wL3GIGM1gWlmNDOeUjLuM8tpMw==
X-Google-Smtp-Source: ABdhPJy+OPM9ZufNRM9UA5H8yhwkRCjRB2XrMMPH+JnjStcV7z59I2irWFSKsO0DLI6rCBvVPUaCSw==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr3511825wmj.157.1621509669146;
        Thu, 20 May 2021 04:21:09 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 04:21:08 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml schema format
Date:   Thu, 20 May 2021 13:21:02 +0200
Message-Id: <20210520112106.77190-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the binding documentation for i2c-mt65xx driver to the
YAML schema format.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2:
	* write compatibles in a more compact way
	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
		"^i2c[0-9]*@[0-9a-f]+"$

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
deleted file mode 100644
index 7f0194fdd0cc..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ /dev/null
@@ -1,49 +0,0 @@
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
index 000000000000..41cedb4930de
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,93 @@
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
2.31.1

