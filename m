Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E3C34C158
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 03:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhC2Bwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Mar 2021 21:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhC2BwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Mar 2021 21:52:14 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA18C0613B4
        for <linux-i2c@vger.kernel.org>; Sun, 28 Mar 2021 18:52:13 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7E260891AF;
        Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616982728;
        bh=/j4qzhseK4DsnJTTj532cjdEI4jC24D8jp6E92hNoEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WISBHVtV127hmpMzOA+nMvkn1H/ASOtTIeqz+XganXmAGWe1Riv+tsOq80s20tAfB
         uTiTfiuD+lIdvR1y36KlAlma+SJ2hwQhl09yQ3HzPtDFupvDvGRoN1XAM8R7MgfoTM
         ohVFCiRPenwFVmnvaIf+17GvnZkTS1ArRe3UdvOnQgXCKbe1ZsOTjH86T0SngoKotM
         Be6Txny4628hVfVUi0Vxr4gi94scEWOWlDyzbzV4RR8s/M1UITDSEpxU04Y5VsgTAU
         9vjRYGVyBs0Y4KNdYusWKnrcWYWM+yzwzeHNNeCsPyRH5XUwgLsUbPTXdYywHLGJwy
         d5XOtPi/PiSJg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B606132c70002>; Mon, 29 Mar 2021 14:52:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 9DD0B13EED4;
        Mon, 29 Mar 2021 14:52:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id C9790284081; Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Date:   Mon, 29 Mar 2021 14:52:02 +1300
Message-Id: <20210329015206.17437-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=gEfo2CItAAAA:8 a=Enga5HRRDKvgB7_1_YsA:9 a=YkzfBtoqaaTS1feh:21 a=Wtfbd1B5vS60F0Zr:21 a=sptkURWiP4Gy88Gu7hUp:22 a=RBBcRewTFc8P4JkPnay6:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert i2c-mpc to YAML.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Rework compatible validation
    - Remove irrelevant i2ccontrol from example

 .../devicetree/bindings/i2c/i2c-mpc.txt       | 62 -------------
 .../devicetree/bindings/i2c/i2c-mpc.yaml      | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.txt b/Document=
ation/devicetree/bindings/i2c/i2c-mpc.txt
deleted file mode 100644
index b15acb43d84d..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* I2C
-
-Required properties :
-
- - reg : Offset and length of the register set for the device
- - compatible : should be "fsl,CHIP-i2c" where CHIP is the name of a
-   compatible processor, e.g. mpc8313, mpc8543, mpc8544, mpc5121,
-   mpc5200 or mpc5200b. For the mpc5121, an additional node
-   "fsl,mpc5121-i2c-ctrl" is required as shown in the example below.
- - interrupts : <a b> where a is the interrupt number and b is a
-   field that represents an encoding of the sense and level
-   information for the interrupt.  This should be encoded based on
-   the information in section 2) depending on the type of interrupt
-   controller you have.
-
-Recommended properties :
-
- - fsl,preserve-clocking : boolean; if defined, the clock settings
-   from the bootloader are preserved (not touched).
- - clock-frequency : desired I2C bus clock frequency in Hz.
- - fsl,timeout : I2C bus timeout in microseconds.
-
-Examples :
-
-	/* MPC5121 based board */
-	i2c@1740 {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		compatible =3D "fsl,mpc5121-i2c", "fsl-i2c";
-		reg =3D <0x1740 0x20>;
-		interrupts =3D <11 0x8>;
-		interrupt-parent =3D <&ipic>;
-		clock-frequency =3D <100000>;
-	};
-
-	i2ccontrol@1760 {
-		compatible =3D "fsl,mpc5121-i2c-ctrl";
-		reg =3D <0x1760 0x8>;
-	};
-
-	/* MPC5200B based board */
-	i2c@3d00 {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		compatible =3D "fsl,mpc5200b-i2c","fsl,mpc5200-i2c","fsl-i2c";
-		reg =3D <0x3d00 0x40>;
-		interrupts =3D <2 15 0>;
-		interrupt-parent =3D <&mpc5200_pic>;
-		fsl,preserve-clocking;
-	};
-
-	/* MPC8544 base board */
-	i2c@3100 {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		compatible =3D "fsl,mpc8544-i2c", "fsl-i2c";
-		reg =3D <0x3100 0x100>;
-		interrupts =3D <43 2>;
-		interrupt-parent =3D <&mpic>;
-		clock-frequency =3D <400000>;
-		fsl,timeout =3D <10000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documen=
tation/devicetree/bindings/i2c/i2c-mpc.yaml
new file mode 100644
index 000000000000..7b553d559c83
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C-Bus adapter for MPC824x/83xx/85xx/86xx/512x/52xx SoCs
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mpc5200-i2c
+              - fsl,mpc5200-i2c
+              - fsl,mpc5121-i2c
+              - fsl,mpc8313-i2c
+              - fsl,mpc8543-i2c
+              - fsl,mpc8544-i2c
+          - const: fsl-i2c
+      - items:
+          - const: fsl,mpc5200b-i2c
+          - const: fsl,mpc5200-i2c
+          - const: fsl-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  fsl,preserve-clocking:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      if defined, the clock settings from the bootloader are
+      preserved (not touched)
+
+  fsl,timeout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      I2C bus timeout in microseconds
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* MPC5121 based board */
+    i2c@1740 {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        compatible =3D "fsl,mpc5121-i2c", "fsl-i2c";
+        reg =3D <0x1740 0x20>;
+        interrupts =3D <11 0x8>;
+        interrupt-parent =3D <&ipic>;
+        clock-frequency =3D <100000>;
+    };
+
+    /* MPC5200B based board */
+    i2c@3d00 {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        compatible =3D "fsl,mpc5200b-i2c", "fsl,mpc5200-i2c", "fsl-i2c";
+        reg =3D <0x3d00 0x40>;
+        interrupts =3D <2 15 0>;
+        interrupt-parent =3D <&mpc5200_pic>;
+        fsl,preserve-clocking;
+    };
+
+    /* MPC8544 base board */
+    i2c@3100 {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        compatible =3D "fsl,mpc8544-i2c", "fsl-i2c";
+        reg =3D <0x3100 0x100>;
+        interrupts =3D <43 2>;
+        interrupt-parent =3D <&mpic>;
+        clock-frequency =3D <400000>;
+        fsl,timeout =3D <10000>;
+    };
+...
--=20
2.31.0

