Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDB91EC724
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 04:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgFCCJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 22:09:29 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40234 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbgFCCJ3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Jun 2020 22:09:29 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E693B1A0079;
        Wed,  3 Jun 2020 04:09:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 42EEE1A0EEA;
        Wed,  3 Jun 2020 04:09:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0FBA040299;
        Wed,  3 Jun 2020 10:09:13 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux@rempel-privat.de, pandy.gao@nxp.com, wolfram@the-dreams.de,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/3] dt-bindings: i2c: Convert imx lpi2c to json-schema
Date:   Wed,  3 Jun 2020 09:58:53 +0800
Message-Id: <1591149535-342-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591149535-342-1-git-send-email-Anson.Huang@nxp.com>
References: <1591149535-342-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the i.MX LPI2C binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.txt      | 20 ----------
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     | 45 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
deleted file mode 100644
index f0c072f..0000000
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Freescale Low Power Inter IC (LPI2C) for i.MX
-
-Required properties:
-- compatible :
-  - "fsl,imx7ulp-lpi2c" for LPI2C compatible with the one integrated on i.MX7ULP soc
-  - "fsl,imx8qxp-lpi2c" for LPI2C compatible with the one integrated on i.MX8QXP soc
-  - "fsl,imx8qm-lpi2c" for LPI2C compatible with the one integrated on i.MX8QM soc
-- reg : address and length of the lpi2c master registers
-- interrupts : lpi2c interrupt
-- clocks : lpi2c clock specifier
-
-Examples:
-
-lpi2c7: lpi2c7@40a50000 {
-	compatible = "fsl,imx7ulp-lpi2c";
-	reg = <0x40A50000 0x10000>;
-	interrupt-parent = <&intc>;
-	interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&clks IMX7ULP_CLK_LPI2C7>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
new file mode 100644
index 0000000..3c0be0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-imx-lpi2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Low Power Inter IC (LPI2C) for i.MX
+
+maintainers:
+  - Anson Huang <Anson.Huang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7ulp-lpi2c
+      - fsl,imx8qxp-lpi2c
+      - fsl,imx8qm-lpi2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx7ulp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    lpi2c7@40a50000 {
+        compatible = "fsl,imx7ulp-lpi2c";
+        reg = <0x40A50000 0x10000>;
+        interrupt-parent = <&intc>;
+        interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX7ULP_CLK_LPI2C7>;
+    };
-- 
2.7.4

