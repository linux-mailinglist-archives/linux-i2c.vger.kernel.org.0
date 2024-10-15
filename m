Return-Path: <linux-i2c+bounces-7414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB03499FBF4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 01:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF391F25734
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 23:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37161FDFAB;
	Tue, 15 Oct 2024 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="v2l5xMAs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502141F8197
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033201; cv=none; b=dXhNyWeM9fSC4wKBvkTPT/hhMcH3IHRTKnO9K1lRxqqTp9oBZTac2xbrwHpnnPumFQGCYQx50/FpWSfJlFZIX9DEO44SrFXzECaQOPUSE8J09QhRv4NpTC474UJuNt2PgtMGJQAexz/ihfkuGAYSRd2sAmpGEmkJ/hiyQ9Hg9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033201; c=relaxed/simple;
	bh=9jfaSB93+tpRDSAlFxBPnxFfrMRPCrgjUlvnKyyBDLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otYVUkU/L8OSn/fR8VH3CQ7ENj76/CkYi1faNrcK9X4BdXQKGQ7P46+BD/5RRT1TggXnmoOYi7G75/PZBQndf6qUQROcWa1qYrG37TDRZCvN5wF5phKG8yHc2bdipJQmrpkE3/cM/T0QjUtfQPJUOvAs0A8pSr66o7BgkD6DUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=v2l5xMAs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EB1352C0707;
	Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729033192;
	bh=vsRx8UwuYlf7bHi/BNWoTwguiQHqUxiAlyQWXE6a9HE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v2l5xMAshVR5epvJWtWEiX9OpdeixJC7dqXwssTmqgZLE3TvyWVq7+sCoU3UaayuL
	 1fukqbmYSuw7O+if809ftuQjzvbxGtHW7IDZsLgHXLBXqmZDRQqrFUb8U6gLt1++d6
	 bBINwIsRDbbZ7MWXkX2kdzlUShgma4bI9mYsa5O9G1TDcQkCNRrZvRC1X49WVHZm6J
	 Z5bL4LwjDrfierftSdHjTyXQfpdC9uuriKeoA7WzfMssqZYLHv7sy2HpY+cAusE1Y1
	 RBpFk4gnXI7zcg2W/28lnZzQA4459US0hZIdWc/SfKrspWTbwem/LUOMyjQO8kUe4n
	 R24c5ROAhGwAA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670ef3e80003>; Wed, 16 Oct 2024 11:59:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4292E13EE9C;
	Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 410E72820D4; Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de,
	markus.stockhausen@gmx.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch peripherals
Date: Wed, 16 Oct 2024 11:59:45 +1300
Message-ID: <20241015225948.3971924-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
References: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670ef3e8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=gEfo2CItAAAA:8 a=hsYKwv2y1JF59hmexWQA:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device tree schema for the Realtek RTL9300 switches. The RTL9300
family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
have the same SoC differ in the Ethernet switch/SERDES arrangement.

Currently the only supported features are the syscon-reboot and i2c
controllers. The syscon-reboot is needed to be able to reboot the board.
The I2C controllers are slightly unusual because they each own an SCL
pin (GPIO8 for the first controller, GPIO 17 for the second) but have 8
common SDA pins which can be assigned to either controller (but not
both).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v6:
    - Drop wildcard compatible
    - Add specific compatibles for the 4 known SoC variants
    - For the i2c part of the binding accept realtek,rtl9301 as a fallbac=
k
      for the other compatibles
    - The overall switches will eventually differ because these will have
      different SERDES/port arrangements so they aren't getting the same
      fallback treatment
    Changes in v5:
      I've combined the two series I had in flight so this is the
      combination of adding the switch syscon, the reboot and i2c. It mak=
es
      the changelog a bit meaningless so I've dropped the earlier
      commentary.
   =20
      As requested I've put a more complete example in the main
      rtl9300-switch.yaml.
   =20
      I've kept rtl9300-i2c.yaml separate for now but link to it with a $=
ref
      from rtl9300-switch.yaml to reduce clutter. The example in
      rtl9300-i2c.yaml is technically duplicating part of the example fro=
m
      rtl9300-switch.yaml but I feel it's nice to be able to see the exam=
ple
      next to where the properties are defined.

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  99 +++++++++++++++
 .../bindings/mfd/realtek,rtl9301-switch.yaml  | 114 ++++++++++++++++++
 2 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9301=
-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9301=
-switch.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
new file mode 100644
index 000000000000..446503961e4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/realtek,rtl9301-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL I2C Controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line=
 (which
+  if not-used for SCL can be a GPIO). There are 8 common SDA lines that =
can be
+  assigned to either I2C controller.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - realtek,rtl9302b-i2c
+              - realtek,rtl9302c-i2c
+              - realtek,rtl9303-i2c
+          - const: realtek,rtl9301-i2c
+      - const: realtek,rtl9301-i2c
+
+  reg:
+    description: Register offset and size this I2C controller.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^i2c@[0-7]$':
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: The SDA pin associated with the I2C bus.
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@36c {
+      compatible =3D "realtek,rtl9301-i2c";
+      reg =3D <0x36c 0x14>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      i2c@0 {
+        reg =3D <0>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        gpio@20 {
+          compatible =3D "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells =3D <2>;
+          reg =3D <0x20>;
+        };
+      };
+
+      i2c@2 {
+        reg =3D <2>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        gpio@20 {
+          compatible =3D "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells =3D <2>;
+          reg =3D <0x20>;
+        };
+      };
+    };
+    i2c@388 {
+      compatible =3D "realtek,rtl9301-i2c";
+      reg =3D <0x388 0x14>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      i2c@7 {
+        reg =3D <7>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
new file mode 100644
index 000000000000..f053303ab1e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,rtl9301-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Switch with Internal CPU
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9300 is a series of is an Ethernet switches with an integrated =
CPU. A
+  number of different peripherals are accessed through a common register=
 block,
+  represented here as a syscon node.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - realtek,rtl9301-switch
+          - realtek,rtl9302b-switch
+          - realtek,rtl9302c-switch
+          - realtek,rtl9303-switch
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  'reboot@[0-9a-f]+$':
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+
+  'i2c@[0-9a-f]+$':
+    $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    ethernet-switch@1b000000 {
+      compatible =3D "realtek,rtl9301-switch", "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+      #address-cells =3D <1>;
+      #size-cells =3D <1>;
+
+      reboot@c {
+        compatible =3D "syscon-reboot";
+        reg =3D <0x0c 0x4>;
+        value =3D <0x01>;
+      };
+
+      i2c@36c {
+        compatible =3D "realtek,rtl9301-i2c";
+        reg =3D <0x36c 0x14>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        i2c@0 {
+          reg =3D <0>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+            compatible =3D "nxp,pca9555";
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            reg =3D <0x20>;
+          };
+        };
+
+        i2c@2 {
+          reg =3D <2>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+            compatible =3D "nxp,pca9555";
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            reg =3D <0x20>;
+          };
+        };
+      };
+
+      i2c@388 {
+        compatible =3D "realtek,rtl9301-i2c";
+        reg =3D <0x388 0x14>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        i2c@7 {
+          reg =3D <7>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+            compatible =3D "nxp,pca9555";
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            reg =3D <0x20>;
+          };
+        };
+      };
+    };
+
--=20
2.47.0


