Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B051629D98E
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 23:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389843AbgJ1Wz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:55:59 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18239 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389789AbgJ1Wz6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:55:58 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f99f6e90000>; Wed, 28 Oct 2020 15:55:37 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 22:55:57 +0000
Received: from vdi.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 28 Oct 2020 22:55:56 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        Leon Romanovsky <leonro@nvidia.com>
Subject: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to YAML schema
Date:   Wed, 28 Oct 2020 18:55:54 -0400
Message-ID: <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1603925077.git.kblaiech@nvidia.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603925737; bh=zdGyU/tos+LL7nZ/nXxmn5OR1oT+vsgz2vaHUm1hz/E=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=H1jJVfTJXUxUn52LNZJRCrPMEqTW4XyrEFFgR6+oEDwQ0EHZUK/xirCKKXBIJnhmF
         qz/8oaiNF3gYgYJMoHh4V8mqFphWLtw54FMq3YmRuQ6vlcQS/fBFXi0y9IJPjjzO2L
         eiq1QQFhekvAJPchcldQqTclHgkPr4irM8bY5mhQ7nbQzLr4m31mziVknlt6HPBiV8
         0c0yCM5x/8iyJi1SaGAZAu9/dkPl5yvVooekz1l3UvQAsachMnZHeTJowBGhJUwlV0
         MqDIlTHMHfS0I1SszjFdcySGcAa1sgkn3wlk63SSai7fVqvZsQFtzzi4d5jJOrvGbQ
         h6aJwrXMRRTXw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Write the devicetree binding text file in schema file, JSON
compatible subset of YAML.
Besides, add an entry within MAINTAINERS file.

Fixes: d9becc53b3ade81e ("dt-bindings: i2c: I2C binding for Mellanox BlueFi=
eld SoC")
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 .../bindings/i2c/mellanox,i2c-mlxbf.txt       | 42 ----------
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 78 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 79 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.yaml

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b=
/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
deleted file mode 100644
index 566ea861aa00..000000000000
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
-	compatible =3D "mellanox,i2c-mlxbf1";
-	reg =3D	<0x02804000 0x800>,
-		<0x02801200 0x020>,
-		<0x02801260 0x020>;
-	interrupts =3D <57>;
-	clock-frequency =3D <100000>;
-};
-
-i2c@2808800 {
-	compatible =3D "mellanox,i2c-mlxbf2";
-	reg =3D	<0x02808800 0x600>,
-	        <0x02808e00 0x020>,
-		<0x02808e20 0x020>,
-		<0x02808e40 0x010>;
-	interrupts =3D <57>;
-	clock-frequency =3D <400000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml =
b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
new file mode 100644
index 000000000000..b9f6b07c503f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0
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
+      maxItems: 1
+
+  clock-frequency:
+      enum: [ 100000, 400000, 1000000 ]
+
+      description:
+        bus frequency used to configure timing registers;
+        The frequency is expressed in Hz. Default is 100000.
+
+additionalProperties: false
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
+        compatible =3D "mellanox,i2c-mlxbf1";
+        reg =3D <0x02804000 0x800>,
+              <0x02801200 0x020>,
+              <0x02801260 0x020>;
+        interrupts =3D <57>;
+        clock-frequency =3D <100000>;
+    };
+
+  - |
+    i2c@2808800 {
+        compatible =3D "mellanox,i2c-mlxbf2";
+        reg =3D <0x02808800 0x600>,
+              <0x02808e00 0x020>,
+              <0x02808e20 0x020>,
+              <0x02808e40 0x010>;
+        interrupts =3D <57>;
+        clock-frequency =3D <400000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9128200af1d0..8dba7ace4a40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11075,6 +11075,7 @@ MELLANOX BLUEFIELD I2C DRIVER
 M:	Khalil Blaiech <kblaiech@nvidia.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
 F:	drivers/i2c/busses/i2c-mlxbf.c
=20
 MELLANOX ETHERNET DRIVER (mlx4_en)
--=20
2.24.1

