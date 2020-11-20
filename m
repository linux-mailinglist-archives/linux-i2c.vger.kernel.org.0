Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0002BB9AC
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Nov 2020 00:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgKTXGK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Nov 2020 18:06:10 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12875 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgKTXGK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Nov 2020 18:06:10 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb84be60001>; Fri, 20 Nov 2020 15:06:14 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Nov
 2020 23:06:09 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Fri, 20 Nov
 2020 23:06:09 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        <robh+dt@kernel.org>
Subject: [PATCH i2c-next v4 1/1] dt-bindings: i2c: mellanox,i2c-mlxbf: convert txt to YAML schema
Date:   Fri, 20 Nov 2020 18:06:06 -0500
Message-ID: <897f036098a9bf2497857c328c344aa0de5cdfdb.1605913307.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605913574; bh=iF6ZpeZ4iA8A3lsK2EwJ85Har+h7QayTbbyvf4TJAKM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=hPxBI0jMcTnRv9nHWkOYB7HY4MgGT4m0pbMAyqERIhD8Lfa4FD6sJ/YyCciCi/mKc
         HGgYCIPTJvU88dQyZxOXc/RJObVQ3LjgElgIztyi9FFtQp9jtW59yJ7ljd25UnI8qE
         1c8oSb8f4mxoH07D7anFy3yyBVayfN2etJepg9Qja1GkZIMKitoE3eaH3xnNmLdZZX
         OK9TWUd6cPM16aXlkPLQD4Ig1XqHhyGUt+60H3d17fdfG/KGfQYI5BLVCpPLXHDWsx
         YhrR3TnAOyHQwCqgFWRmt0UrnNMSOv+f0Wron3EcF4gdJ4vAA7GKtN0b2+uFRJrMVK
         Sfl+fDApJUVrw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Write the devicetree binding text file associated with
the Mellanox BlueField I2C controller in schema file,
JSON compatible subset of YAML. Besides, add an entry
within MAINTAINERS file.

Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3->v4:
	- Add Reviewed-by tag. 
v2->v3:
	- Address dtschema/dt warning/errors by removing
	'additionalProperties: false' line.
v1->v2:
	- Address yamllint and dtschema/dt warning/errors.
	- Dual license the YAML schema by adding BSD-2-Clause.

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ------------
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml           | 78 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 79 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
deleted file mode 100644
index 566ea86..0000000
--- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
-
-Required Properties:
-
-- compatible : should be "mellanox,i2c-mlxbf1" or "mellanox,i2c-mlxbf2".
-
-- reg : address offset and length of the device registers. The
-	registers consist of the following set of resources:
-		1) Smbus block registers.
-		2) Cause master registers.
-		3) Cause slave registers.
-		4) Cause coalesce registers (if compatible isn't set
-		   to "mellanox,i2c-mlxbf1").
-
-- interrupts : interrupt number.
-
-Optional Properties:
-
-- clock-frequency : bus frequency used to configure timing registers;
-			allowed values are 100000, 400000 and 1000000;
-			those are expressed in Hz. Default is 100000.
-
-Example:
-
-i2c@2804000 {
-	compatible = "mellanox,i2c-mlxbf1";
-	reg =	<0x02804000 0x800>,
-		<0x02801200 0x020>,
-		<0x02801260 0x020>;
-	interrupts = <57>;
-	clock-frequency = <100000>;
-};
-
-i2c@2808800 {
-	compatible = "mellanox,i2c-mlxbf2";
-	reg =	<0x02808800 0x600>,
-	        <0x02808e00 0x020>,
-		<0x02808e20 0x020>,
-		<0x02808e40 0x010>;
-	interrupts = <57>;
-	clock-frequency = <400000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
new file mode 100644
index 0000000..d2b401d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/mellanox,i2c-mlxbf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mellanox I2C SMBus on BlueField SoCs
+
+maintainers:
+  - Khalil Blaiech <kblaiech@nvidia.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mellanox,i2c-mlxbf1
+      - mellanox,i2c-mlxbf2
+
+  reg:
+    minItems: 3
+    maxItems: 4
+    items:
+      - description: Smbus block registers
+      - description: Cause master registers
+      - description: Cause slave registers
+      - description: Cause coalesce registers
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [ 100000, 400000, 1000000 ]
+    description:
+      bus frequency used to configure timing registers;
+      The frequency is expressed in Hz. Default is 100000.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mellanox,i2c-mlxbf1
+
+then:
+  properties:
+    reg:
+      maxItems: 3
+
+examples:
+  - |
+    i2c@2804000 {
+        compatible = "mellanox,i2c-mlxbf1";
+        reg = <0x02804000 0x800>,
+              <0x02801200 0x020>,
+              <0x02801260 0x020>;
+        interrupts = <57>;
+        clock-frequency = <100000>;
+    };
+
+  - |
+    i2c@2808800 {
+        compatible = "mellanox,i2c-mlxbf2";
+        reg = <0x02808800 0x600>,
+              <0x02808e00 0x020>,
+              <0x02808e20 0x020>,
+              <0x02808e40 0x010>;
+        interrupts = <57>;
+        clock-frequency = <400000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a008b70..27bd55b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11151,6 +11151,7 @@ MELLANOX BLUEFIELD I2C DRIVER
 M:	Khalil Blaiech <kblaiech@nvidia.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
 F:	drivers/i2c/busses/i2c-mlxbf.c
 
 MELLANOX ETHERNET DRIVER (mlx4_en)
-- 
2.1.2

