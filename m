Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F05719AD03
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 15:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732548AbgDANmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 09:42:42 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39655 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732396AbgDANmm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Apr 2020 09:42:42 -0400
Received: by mail-pl1-f194.google.com with SMTP id k18so4838380pll.6
        for <linux-i2c@vger.kernel.org>; Wed, 01 Apr 2020 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJRkuri+52/NYhR4P5oF7/5wtZs4I8toehnqIWt5fAw=;
        b=zKQiYJD43I58XZSGeOdLFmb066UAc9qa1JgNxJPsP9RoIqQVsFmHmId4uZqwtPh2jr
         jLUTOXuf2v/WGLTLgn/hx4i6rV7sDazrrx/x3rOJlXcdy/1cCRSQjHRdYad1NUKT4HEe
         ns2/XGeDQr+hXBUmixVdievZUsvm0oMdGVu/10OGeKnfOF7tAg/cFtqwAVgYjxXya+q1
         NvZZJ+w1vqQ8fU+QFckJ1rXxCHYqylPTEXBE5U66R3ERaK0zEVqCBex4o6xit70JScKF
         GuVUhND+iTDenLK6SzrfNdAFsUR2X2ZUsjOucAdjUbLk2MNnNDW17Rb85Kspne1ScnJz
         t1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJRkuri+52/NYhR4P5oF7/5wtZs4I8toehnqIWt5fAw=;
        b=NFDLmtB3x8W6RbpvVkNWcshjr0TIzp9YeDnoODiad6a4bSyMh4EtpYpmUFonjaBVXf
         XWl/haPD2uNAErur+maCRQ5VwofewMsjYiMuiDqFIlE7ozNrS9IfYycCMw9GgNsswHIH
         SBW1fD2RZXs9gzj/di14PvCRUzQZ/NqD8Dnyx72XritRuRLAcpqdxei2BF6pp+XhIvvn
         JnSGh6GtiLsvKnvjdM1d2uszpiCoCizDqioRsdQpcr+oFXCevoAI/BCWjKpPiNpQn2Wy
         idhcF0ePdSF2vj9TrJjYBnTe+gESfMurps210JPRTL1UT8QEGB7Vrorf/Gdje78wLN4x
         hDbQ==
X-Gm-Message-State: AGi0PubNF0wJEng775UJw1Htbgjtk3d5jNnh/jZppCfPv19uHJ+h5AtB
        QzGiSUFmmmhZafcEyOP2f2I3
X-Google-Smtp-Source: APiQypKPUCKj53e9OPViAg30mCZMfIwyCH5EpAb0FsfM18/PiV3fHoyFFllX8iterjb+8o+gHbzp/g==
X-Received: by 2002:a17:90a:94c8:: with SMTP id j8mr5035339pjw.155.1585748559475;
        Wed, 01 Apr 2020 06:42:39 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:bf52:1f8e:88d2:6ec])
        by smtp.gmail.com with ESMTPSA id lj14sm1710606pjb.25.2020.04.01.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 06:42:38 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     devicetree@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] dt-bindings: i2c: cadence: Migrate i2c-cadence documentation to YAML
Date:   Wed,  1 Apr 2020 22:42:22 +0900
Message-Id: <20200401134222.60317-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The document was migrated to YAML format and renamed cdns,i2c-r1p10.yaml

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../bindings/i2c/cdns,i2c-r1p10.yaml          | 58 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-cadence.txt   | 28 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cadence.txt

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
new file mode 100644
index 0000000000000..dc0952f3780fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence I2C controller Device Tree Bindings
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cdns,i2c-r1p10 # cadence i2c controller version 1.0
+      - cdns,i2c-r1p14 # cadence i2c controller version 1.4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    minimum: 1
+    maximum: 400000
+    description: |
+      Desired operating frequency, in Hz, of the bus.
+
+  clock-name:
+    const: pclk
+    description: |
+      Input clock name.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@e0004000 {
+        compatible = "cdns,i2c-r1p10";
+        clocks = <&clkc 38>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0xe0004000 0x1000>;
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-cadence.txt b/Documentation/devicetree/bindings/i2c/i2c-cadence.txt
deleted file mode 100644
index ebaa90c58c8e7..0000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-cadence.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Binding for the Cadence I2C controller
-
-Required properties:
-  - reg: Physical base address and size of the controller's register area.
-  - compatible: Should contain one of:
-		* "cdns,i2c-r1p10"
-		Note:	Use this when cadence i2c controller version 1.0 is used.
-		* "cdns,i2c-r1p14"
-		Note:	Use this when cadence i2c controller version 1.4 is used.
-  - clocks: Input clock specifier. Refer to common clock bindings.
-  - interrupts: Interrupt specifier. Refer to interrupt bindings.
-  - #address-cells: Should be 1.
-  - #size-cells: Should be 0.
-
-Optional properties:
-  - clock-frequency: Desired operating frequency, in Hz, of the bus.
-  - clock-names: Input clock name, should be 'pclk'.
-
-Example:
-	i2c@e0004000 {
-		compatible = "cdns,i2c-r1p10";
-		clocks = <&clkc 38>;
-		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-		reg = <0xe0004000 0x1000>;
-		clock-frequency = <400000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f2..1fb95a12eda48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2672,7 +2672,7 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/block/xsysace.c
 N:	zynq
 N:	xilinx
-F:	Documentation/devicetree/bindings/i2c/i2c-cadence.txt
+F:	Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-xiic.txt
 F:	drivers/clocksource/timer-cadence-ttc.c
 F:	drivers/i2c/busses/i2c-cadence.c
-- 
2.26.0

