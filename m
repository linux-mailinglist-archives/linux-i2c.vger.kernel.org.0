Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495783456D6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 05:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhCWEe2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 00:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCWEdy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 00:33:54 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA19C061574
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 21:33:53 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 32225891AF;
        Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616474028;
        bh=ofwmam07g4vU+wSIrGHnrwuKPgIIlDUs4BnvCAVNNKs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=k5k9uuV9uvI+KQL8nStl2IvmNntIC7FuA4eWSATve0hOTzXbHxVPNj9tuKrFlGKkD
         pKEW23LyALmzHoPs7f1htWDiP7Jpv3piZ43OTnIKL5t5RLc4vwqXo4G9GuwEOyuNop
         HkP4BgkNppjQzV5tg8cuP5FZTkqNBlU7mQvsaiuTygUYn5t9NolhZNlvYK+kcu0Rz5
         5s23nyVfGAAdemC366QHJw0NwErPHLyr1KYpPk942iBfir3mPgTgUhPRq4kvwSaLHD
         Aohw+aSrM5PThdyHCB+9hKbVZ1CC0GztxU2bKwmTfVptkXduug9+p56X7aY5e8SEdU
         QdAMFubZCuLHw==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60596fab0002>; Tue, 23 Mar 2021 17:33:47 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 785BC13EED4;
        Tue, 23 Mar 2021 17:34:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id EB59628409A; Tue, 23 Mar 2021 17:33:47 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Date:   Tue, 23 Mar 2021 17:33:27 +1300
Message-Id: <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=gEfo2CItAAAA:8 a=Enga5HRRDKvgB7_1_YsA:9 a=ezc__IB3qI4VJWUD:21 a=iBSJKkvYTiTODKpV:21 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert i2c-mpc to YAML.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/i2c/i2c-mpc.txt       | 62 ------------
 .../devicetree/bindings/i2c/i2c-mpc.yaml      | 99 +++++++++++++++++++
 2 files changed, 99 insertions(+), 62 deletions(-)
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
index 000000000000..97cea8a817ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -0,0 +1,99 @@
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
+    anyOf:
+      - items:
+        - enum:
+          - mpc5200-i2c
+          - fsl,mpc5200b-i2c
+          - fsl,mpc5200-i2c
+          - fsl,mpc5121-i2c
+          - fsl,mpc8313-i2c
+          - fsl,mpc8543-i2c
+          - fsl,mpc8544-i2c
+
+        - const: fsl-i2c
+
+      - contains:
+          const: fsl-i2c
+        minItems: 1
+        maxItems: 4
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
+    i2ccontrol@1760 {
+        compatible =3D "fsl,mpc5121-i2c-ctrl";
+        reg =3D <0x1760 0x8>;
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
2.30.2

