Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA82F7DC7F0
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 09:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbjJaILk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 04:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjJaILj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 04:11:39 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70AEDB
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 01:11:34 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 39V8BQ6C062104;
        Tue, 31 Oct 2023 16:11:26 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SKN5N3bqfz2LVtP5;
        Tue, 31 Oct 2023 16:06:48 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 31 Oct
 2023 16:11:25 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH] dt-bindings: i2c: Add yaml for Spreadtrum I2C controller
Date:   Tue, 31 Oct 2023 16:08:20 +0800
Message-ID: <20231031080820.5588-1-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 39V8BQ6C062104
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add yaml file to replace txt file, and added description and
example of reset attribute for Spreadtrum I2C controller.

Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
---
 .../devicetree/bindings/i2c/i2c-sprd.txt      | 31 --------
 .../devicetree/bindings/i2c/i2c-sprd.yaml     | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sprd.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sprd.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sprd.txt b/Documentation/devicetree/bindings/i2c/i2c-sprd.txt
deleted file mode 100644
index 7b6b3b8d0d11..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-sprd.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-I2C for Spreadtrum platforms
-
-Required properties:
-- compatible: Should be "sprd,sc9860-i2c".
-- reg: Specify the physical base address of the controller and length
-  of memory mapped region.
-- interrupts: Should contain I2C interrupt.
-- clock-names: Should contain following entries:
-  "i2c" for I2C clock,
-  "source" for I2C source (parent) clock,
-  "enable" for I2C module enable clock.
-- clocks: Should contain a clock specifier for each entry in clock-names.
-- clock-frequency: Contains desired I2C bus clock frequency in Hz.
-- #address-cells: Should be 1 to describe address cells for I2C device address.
-- #size-cells: Should be 0 means no size cell for I2C device address.
-
-Optional properties:
-- Child nodes conforming to I2C bus binding
-
-Examples:
-i2c0: i2c@70500000 {
-	compatible = "sprd,sc9860-i2c";
-	reg = <0 0x70500000 0 0x1000>;
-	interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-	clock-names = "i2c", "source", "enable";
-	clocks = <&clk_i2c3>, <&ext_26m>, <&clk_ap_apb_gates 11>;
-	clock-frequency = <400000>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-};
-
diff --git a/Documentation/devicetree/bindings/i2c/i2c-sprd.yaml b/Documentation/devicetree/bindings/i2c/i2c-sprd.yaml
new file mode 100644
index 000000000000..54378afe8419
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-sprd.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2020 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-sprd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc I2C Controller Device
+
+maintainers:
+  - Huangzheng Lai <laihuangzheng@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: sprd,sc9860-i2c
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: i2c
+      - const: source
+      - const: enable
+
+  clocks:
+    items:
+      - description: Clock specifier for "i2c" in clock-names
+      - description: Clock specifier for "source" in clock-names
+      - description: Clock specifier for "enable" in clock-names
+
+  clock-frequency:
+    description: Constains desired I2C bus clock frequency in Hz
+
+  "#address-cells":
+    const: 1
+    description: Address cells for I2C device address
+
+  "#size-cells":
+    const: 0
+    description: Size cell for I2C device address
+
+  reset-names:
+    const: i2c_rst
+
+  resets:
+    maxItems: 1
+    description: Phandle to the reset controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0: i2c@2240000 {
+      compatible = "sprd,sc9860-i2c";
+      reg = <0 0x2240000 0 0x1000>;
+      interrupts = <11>;
+      clock-names = "i2c", "source", "enable";
+      clocks = <&clk_i2c3>, <&ext_26m>, <&clk_ap_apb_gates 11>;
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reset-names = "i2c_rst";
+      resets = <&apahb_gate 3>;
+    };
+
-- 
2.17.1

