Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B487D1EDAF6
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jun 2020 04:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFDB74 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 21:59:56 -0400
Received: from inva020.nxp.com ([92.121.34.13]:45348 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbgFDB74 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 21:59:56 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 750191A016E;
        Thu,  4 Jun 2020 03:59:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 370931A018E;
        Thu,  4 Jun 2020 03:59:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 75899402A5;
        Thu,  4 Jun 2020 09:59:41 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux@rempel-privat.de, wolfram@the-dreams.de,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 2/3] dt-bindings: i2c: Convert mxs i2c to json-schema
Date:   Thu,  4 Jun 2020 09:49:17 +0800
Message-Id: <1591235358-15516-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
References: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the MXS I2C binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- add "additionalProperties: false".
---
 Documentation/devicetree/bindings/i2c/i2c-mxs.txt  | 25 ----------
 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml | 55 ++++++++++++++++++++++
 2 files changed, 55 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mxs.txt b/Documentation/devicetree/bindings/i2c/i2c-mxs.txt
deleted file mode 100644
index 4e1c8ac..0000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mxs.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Freescale MXS Inter IC (I2C) Controller
-
-Required properties:
-- compatible: Should be "fsl,<chip>-i2c"
-- reg: Should contain registers location and length
-- interrupts: Should contain ERROR interrupt number
-- clock-frequency: Desired I2C bus clock frequency in Hz.
-                   Only 100000Hz and 400000Hz modes are supported.
-- dmas: DMA specifier, consisting of a phandle to DMA controller node
-  and I2C DMA channel ID.
-  Refer to dma.txt and fsl-mxs-dma.txt for details.
-- dma-names: Must be "rx-tx".
-
-Examples:
-
-i2c0: i2c@80058000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "fsl,imx28-i2c";
-	reg = <0x80058000 2000>;
-	interrupts = <111>;
-	clock-frequency = <100000>;
-	dmas = <&dma_apbx 6>;
-	dma-names = "rx-tx";
-};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
new file mode 100644
index 0000000..3bc14bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mxs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Inter IC (I2C) Controller
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx23-i2c
+      - fsl,imx28-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Desired I2C bus clock frequency in Hz, only 100000Hz and 400000Hz
+      modes are supported.
+    default: 100000
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx-tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c@80058000 {
+        compatible = "fsl,imx28-i2c";
+        reg = <0x80058000 2000>;
+        interrupts = <111>;
+        clock-frequency = <100000>;
+        dmas = <&dma_apbx 6>;
+        dma-names = "rx-tx";
+    };
-- 
2.7.4

