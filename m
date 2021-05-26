Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB63639145C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 12:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233759AbhEZKGT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 06:06:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35040 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbhEZKGM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 06:06:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QA4WlC081908;
        Wed, 26 May 2021 05:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622023472;
        bh=0qWRyKEw5KOaf8+qsThgPulM36ude4I2UL9wtlv3SpA=;
        h=From:To:CC:Subject:Date;
        b=pJGF1M3hIpzsSGO5xtovVhKA2LU1qzXoipUsnm3QFy2refYGJJLAZHno/nqYOkP8h
         oSTX9M4Mon1PGhgJlvVYqkv74wSIBgKisNGq7ObmLJkdKfTpKutU+dGmbeopyCd4dd
         +H8C8tsbgYk9ENvUVU6unKL0C6/Q4/0nJEe1uU9s=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QA4Wqv068671
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 05:04:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 05:04:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 05:04:31 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QA4QL1009048;
        Wed, 26 May 2021 05:04:27 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Date:   Wed, 26 May 2021 15:34:12 +0530
Message-ID: <20210526100412.484-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert i2c-omap.txt to YAML schema for better checks and documentation.

Following properties were used in DT but were not documented in txt
bindings and has been included in YAML schema:
1. Include ti,am4372-i2c compatible
2. Document clocks property

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---

Note that am335x-myirtech*.dtsi needs fixing to drop scl/sda-gpios
which are not supported by i2c-omap driver.
omap2/3 dmas property is being dropped by:
https://lore.kernel.org/20210526094424.27234-1-vigneshr@ti.com

v3:
Add conditions around ti,hwmods usage
drop dmas property as it was never used/supported
set additionalProperties: False
Address Rob H comments

v2:
Fix issues with make dt_bindings_check
Add description on usage of ti,hwmods

v2: https://lore.kernel.org/r/20210506140026.31254-1-vigneshr@ti.com
v1: https://lore.kernel.org/r/20210505065511.918-1-vigneshr@ti.com

 .../devicetree/bindings/i2c/i2c-omap.txt      |  37 -------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 102 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 103 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-omap.txt b/Documentation/devicetree/bindings/i2c/i2c-omap.txt
deleted file mode 100644
index a425b91af48f..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-omap.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-I2C for OMAP platforms
-
-Required properties :
-- compatible : Must be
-	"ti,omap2420-i2c" for OMAP2420 SoCs
-	"ti,omap2430-i2c" for OMAP2430 SoCs
-	"ti,omap3-i2c" for OMAP3 SoCs
-	"ti,omap4-i2c" for OMAP4+ SoCs
-	"ti,am654-i2c", "ti,omap4-i2c" for AM654 SoCs
-	"ti,j721e-i2c", "ti,omap4-i2c" for J721E SoCs
-	"ti,am64-i2c", "ti,omap4-i2c" for AM64 SoCs
-- ti,hwmods : Must be "i2c<n>", n being the instance number (1-based)
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Recommended properties :
-- clock-frequency : Desired I2C bus clock frequency in Hz. Otherwise
-  the default 100 kHz frequency will be used.
-
-Optional properties:
-- Child nodes conforming to i2c bus binding
-
-Note: Current implementation will fetch base address, irq and dma
-from omap hwmod data base during device registration.
-Future plan is to migrate hwmod data base contents into device tree
-blob so that, all the required data will be used from device tree dts
-file.
-
-Examples :
-
-i2c1: i2c@0 {
-    compatible = "ti,omap3-i2c";
-    #address-cells = <1>;
-    #size-cells = <0>;
-    ti,hwmods = "i2c1";
-    clock-frequency = <400000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
new file mode 100644
index 000000000000..ff165ad1bee8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,omap4-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for I2C controllers on TI's OMAP and K3 SoCs
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,omap2420-i2c
+          - ti,omap2430-i2c
+          - ti,omap3-i2c
+          - ti,omap4-i2c
+      - items:
+          - enum:
+              - ti,am4372-i2c
+              - ti,am64-i2c
+              - ti,am654-i2c
+              - ti,j721e-i2c
+          - const: ti,omap4-i2c
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
+  clock-names:
+    const: fck
+
+  clock-frequency: true
+
+  power-domains: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  ti,hwmods:
+    description:
+      Must be "i2c<n>", n being the instance number (1-based).
+      This property is applicable only on legacy platforms mainly omap2/3
+      and ti81xx and should not be used on other platforms.
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+# subnode's properties
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+    description:
+      Flash device uses the below defined properties in the subnode.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      oneOf:
+        - const: ti,omap2420-i2c
+        - const: ti,omap2430-i2c
+        - const: ti,omap3-i2c
+        - const: ti,omap4-i2c
+
+then:
+  properties:
+    ti,hwmods:
+      items:
+        - pattern: "^i2c([1-9])$"
+
+else:
+  properties:
+    ti,hwmods: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    main_i2c0: i2c@2000000 {
+            compatible = "ti,j721e-i2c", "ti,omap4-i2c";
+            reg = <0x2000000 0x100>;
+            interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+         };
diff --git a/MAINTAINERS b/MAINTAINERS
index 710203d794d7..33625bb83b21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13424,7 +13424,7 @@ M:	Vignesh R <vigneshr@ti.com>
 L:	linux-omap@vger.kernel.org
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-omap.txt
+F:	Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
 F:	drivers/i2c/busses/i2c-omap.c
 
 OMAP IMAGING SUBSYSTEM (OMAP3 ISP and OMAP4 ISS)
-- 
2.31.1

