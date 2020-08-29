Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397CA256744
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 13:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgH2LsU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 07:48:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727997AbgH2Lay (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 07:30:54 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 411B62076D;
        Sat, 29 Aug 2020 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598699888;
        bh=jTjsLAriGTsac5PZWo3rZlx2ocUPijGc78uBb8WH4Js=;
        h=From:To:Subject:Date:From;
        b=Y3udy7ZKxQMGczRMLliEYAQ/FeoWt4shYEJIb+tClmajZzNbd/gKsX83rhQkl7BUb
         OEaD6AfEZBLLhfTprA5rwJ6d6LHEX+7e/Kd7FDOIEKJ/siS0c/IVlj0Tap/cl4pBAZ
         hwVQk0M+mnmvvqtB45uL/uA2aHjQ0waiOpFoASBQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clock: imx8m: Integrate duplicated i.MX 8M schemas
Date:   Sat, 29 Aug 2020 13:17:54 +0200
Message-Id: <20200829111800.2786-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The clock controller schemas for i.MX 8M Mini, 8M Nano, 8M Plus and 8M
Quad are basically the same.  The only minor difference appears on 8M
Quad which needs one more clock.

There is no point to have four schemas for almost the same binding.  Any
fixes or changes would have to be duplicated four times.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/clock/imx8m-clock.yaml           | 125 ++++++++++++++++++
 .../bindings/clock/imx8mm-clock.yaml          |  68 ----------
 .../bindings/clock/imx8mn-clock.yaml          |  70 ----------
 .../bindings/clock/imx8mp-clock.yaml          |  70 ----------
 .../bindings/clock/imx8mq-clock.yaml          |  72 ----------
 5 files changed, 125 insertions(+), 280 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8m-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mp-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
new file mode 100644
index 000000000000..31e7cc9693c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8M Family Clock Control Module Binding
+
+maintainers:
+  - Anson Huang <Anson.Huang@nxp.com>
+
+description: |
+  NXP i.MX8M Mini/Nano/Plus/Quad clock control module is an integrated clock
+  controller, which generates and supplies to all modules.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mm-ccm
+      - fsl,imx8mn-ccm
+      - fsl,imx8mp-ccm
+      - fsl,imx8mq-ccm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 7
+
+  clock-names:
+    minItems: 6
+    maxItems: 7
+
+  '#clock-cells':
+    const: 1
+    description:
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
+      for the full list of i.MX8M clock IDs.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mq-ccm
+    then:
+      properties:
+        clocks:
+          minItems: 7
+          maxItems: 7
+          items:
+            - description: 32k osc
+            - description: 25m osc
+            - description: 27m osc
+            - description: ext1 clock input
+            - description: ext2 clock input
+            - description: ext3 clock input
+            - description: ext4 clock input
+        clock-names:
+          minItems: 7
+          maxItems: 7
+          items:
+            - const: ckil
+            - const: osc_25m
+            - const: osc_27m
+            - const: clk_ext1
+            - const: clk_ext2
+            - const: clk_ext3
+            - const: clk_ext4
+    else:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 24m osc
+            - description: ext1 clock input
+            - description: ext2 clock input
+            - description: ext3 clock input
+            - description: ext4 clock input
+
+        clock-names:
+          items:
+            - const: osc_32k
+            - const: osc_24m
+            - const: clk_ext1
+            - const: clk_ext2
+            - const: clk_ext3
+            - const: clk_ext4
+
+unevaluatedProperties: false
+
+examples:
+  # Clock Control Module node:
+  - |
+    clock-controller@30380000 {
+        compatible = "fsl,imx8mm-ccm";
+        reg = <0x30380000 0x10000>;
+        #clock-cells = <1>;
+        clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
+                 <&clk_ext3>, <&clk_ext4>;
+        clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
+                      "clk_ext3", "clk_ext4";
+    };
+
+  - |
+    clock-controller@30390000 {
+        compatible = "fsl,imx8mq-ccm";
+        reg = <0x30380000 0x10000>;
+        #clock-cells = <1>;
+        clocks = <&ckil>, <&osc_25m>, <&osc_27m>, <&clk_ext1>,
+                 <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
+        clock-names = "ckil", "osc_25m", "osc_27m", "clk_ext1",
+                      "clk_ext2", "clk_ext3", "clk_ext4";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
deleted file mode 100644
index ec830db1367b..000000000000
--- a/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
+++ /dev/null
@@ -1,68 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/imx8mm-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NXP i.MX8M Mini Clock Control Module Binding
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description: |
-  NXP i.MX8M Mini clock control module is an integrated clock controller, which
-  generates and supplies to all modules.
-
-properties:
-  compatible:
-    const: fsl,imx8mm-ccm
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: 32k osc
-      - description: 24m osc
-      - description: ext1 clock input
-      - description: ext2 clock input
-      - description: ext3 clock input
-      - description: ext4 clock input
-
-  clock-names:
-    items:
-      - const: osc_32k
-      - const: osc_24m
-      - const: clk_ext1
-      - const: clk_ext2
-      - const: clk_ext3
-      - const: clk_ext4
-
-  '#clock-cells':
-    const: 1
-    description:
-      The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mm-clock.h
-      for the full list of i.MX8M Mini clock IDs.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-
-examples:
-  # Clock Control Module node:
-  - |
-    clk: clock-controller@30380000 {
-        compatible = "fsl,imx8mm-ccm";
-        reg = <0x30380000 0x10000>;
-        #clock-cells = <1>;
-        clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
-        clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
deleted file mode 100644
index bdaa29616ab1..000000000000
--- a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
+++ /dev/null
@@ -1,70 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/imx8mn-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NXP i.MX8M Nano Clock Control Module Binding
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description: |
-  NXP i.MX8M Nano clock control module is an integrated clock controller, which
-  generates and supplies to all modules.
-
-properties:
-  compatible:
-    const: fsl,imx8mn-ccm
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: 32k osc
-      - description: 24m osc
-      - description: ext1 clock input
-      - description: ext2 clock input
-      - description: ext3 clock input
-      - description: ext4 clock input
-
-  clock-names:
-    items:
-      - const: osc_32k
-      - const: osc_24m
-      - const: clk_ext1
-      - const: clk_ext2
-      - const: clk_ext3
-      - const: clk_ext4
-
-  '#clock-cells':
-    const: 1
-    description:
-      The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mn-clock.h
-      for the full list of i.MX8M Nano clock IDs.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-
-additionalProperties: false
-
-examples:
-  # Clock Control Module node:
-  - |
-    clk: clock-controller@30380000 {
-        compatible = "fsl,imx8mn-ccm";
-        reg = <0x30380000 0x10000>;
-        #clock-cells = <1>;
-        clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>,
-                 <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
-        clock-names = "osc_32k", "osc_24m", "clk_ext1",
-                      "clk_ext2", "clk_ext3", "clk_ext4";
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/clock/imx8mp-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mp-clock.yaml
deleted file mode 100644
index 4351a1dbb4f7..000000000000
--- a/Documentation/devicetree/bindings/clock/imx8mp-clock.yaml
+++ /dev/null
@@ -1,70 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/imx8mp-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NXP i.MX8M Plus Clock Control Module Binding
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description:
-  NXP i.MX8M Plus clock control module is an integrated clock controller, which
-  generates and supplies to all modules.
-
-properties:
-  compatible:
-    const: fsl,imx8mp-ccm
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: 32k osc
-      - description: 24m osc
-      - description: ext1 clock input
-      - description: ext2 clock input
-      - description: ext3 clock input
-      - description: ext4 clock input
-
-  clock-names:
-    items:
-      - const: osc_32k
-      - const: osc_24m
-      - const: clk_ext1
-      - const: clk_ext2
-      - const: clk_ext3
-      - const: clk_ext4
-
-  '#clock-cells':
-    const: 1
-    description:
-      The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
-      for the full list of i.MX8M Plus clock IDs.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-
-additionalProperties: false
-
-examples:
-  # Clock Control Module node:
-  - |
-    clk: clock-controller@30380000 {
-        compatible = "fsl,imx8mp-ccm";
-        reg = <0x30380000 0x10000>;
-        #clock-cells = <1>;
-        clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>,
-                 <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
-        clock-names = "osc_32k", "osc_24m", "clk_ext1",
-                      "clk_ext2", "clk_ext3", "clk_ext4";
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
deleted file mode 100644
index 05d7d1471e0c..000000000000
--- a/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
+++ /dev/null
@@ -1,72 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/imx8mq-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: NXP i.MX8M Quad Clock Control Module Binding
-
-maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
-
-description: |
-  NXP i.MX8M Quad clock control module is an integrated clock controller, which
-  generates and supplies to all modules.
-
-properties:
-  compatible:
-    const: fsl,imx8mq-ccm
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: 32k osc
-      - description: 25m osc
-      - description: 27m osc
-      - description: ext1 clock input
-      - description: ext2 clock input
-      - description: ext3 clock input
-      - description: ext4 clock input
-
-  clock-names:
-    items:
-      - const: ckil
-      - const: osc_25m
-      - const: osc_27m
-      - const: clk_ext1
-      - const: clk_ext2
-      - const: clk_ext3
-      - const: clk_ext4
-
-  '#clock-cells':
-    const: 1
-    description:
-      The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mq-clock.h
-      for the full list of i.MX8M Quad clock IDs.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-
-examples:
-  # Clock Control Module node:
-  - |
-    clk: clock-controller@30380000 {
-        compatible = "fsl,imx8mq-ccm";
-        reg = <0x30380000 0x10000>;
-        #clock-cells = <1>;
-        clocks = <&ckil>, <&osc_25m>, <&osc_27m>,
-                 <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
-        clock-names = "ckil", "osc_25m", "osc_27m",
-                      "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
-    };
-
-...
-- 
2.17.1

