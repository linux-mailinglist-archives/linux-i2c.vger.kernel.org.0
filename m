Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CE453E8CA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240728AbiFFP0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 11:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240718AbiFFP0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 11:26:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADAA328ED0
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 08:26:15 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q15so12296018wrc.11
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2mKX+kU+0IXP/mFpleoQum6Bqhsq7l65uSh5/bTW4g=;
        b=HMwGyp6CzEvlRC14FS57rwtanxig4GLA0FRKh8Ap4Kl+5s5sAb7edQyqJx/6zxLgRl
         Ny1LZC+rCwH8uQsmSyoQ3zaSrJaoLCzV2pCnJ6htCk/SyrRL2RW+9oaO9wAE091+lhte
         VbdkoDYOgTzaeDP8W32qHJorSUSW22c6eS1fvuxUinvAJPezQO6/id98yPoeIrq3jZhM
         dgvvJQBpDsfl5OGNogPTcDByqCTGADB54X0LVtftiotrgVK0F4j2MbH8GOCwZienUlDm
         aAaAC8PlzTvymW3kNrRwXFqIMNZ1D45n7/zIonpOec/LbgD+0R+4irBKn+sw/+v21pdZ
         ohOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2mKX+kU+0IXP/mFpleoQum6Bqhsq7l65uSh5/bTW4g=;
        b=Zj2ufbeTJfU58dqNT8N8tJnM08V3hTxdSo4R+QpqLz5EBszk2RTFqgJ9+hERkhF0PN
         FQOEa2TL7Y3MPAkdNd+TXM7rAU47xuyapDYIk9ThzxEjFsumsA5ZKdlD9iYxYWRZkRhw
         1zzpcIGEiLOpka3tPrrpF+XAwLsG7fSzJ2gOumSM5VDk+PAlFqSxvijSxbUHUEI9WoLO
         Js86MGpnTCvrzfJ8WxJY1VY4dsIGo0Lllc+uNdM0arctC1Pw1b5hfMA5JBeojQinn521
         X8h+hr/13M2mXsDFrCJ8ienkA+oTxBRreJ6j/gIhVSwQDqZcKPE+IY96bn2qLJmxthKM
         jsUw==
X-Gm-Message-State: AOAM531UiuRsRTOnZJOPOyS6YxT4HQoDS9C4oYmsZ/Phbm6kqPMs3LsV
        iFtRmIylYXcYKGytVIULgkk2rQ==
X-Google-Smtp-Source: ABdhPJwxneQK3qa97OwL1W+PfqxqssVm1NE2jPe1s3DSYbSYAVD7FYprnFkal9IGgv+FhvsBTVndUw==
X-Received: by 2002:a5d:458e:0:b0:216:9e07:ceb1 with SMTP id p14-20020a5d458e000000b002169e07ceb1mr11170467wrq.21.1654529173436;
        Mon, 06 Jun 2022 08:26:13 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:12 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v2 3/4] dt-bindings: mfd: convert da9063 to yaml
Date:   Mon,  6 Jun 2022 16:25:57 +0100
Message-Id: <20220606152557.438771-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606152557.438771-1-mail@conchuod.ie>
References: <20220606152557.438771-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Convert the dt binding for the da9063/da9063l to yaml.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mfd/da9063.txt        | 114 ---------------
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 132 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 MAINTAINERS                                   |   1 +
 4 files changed, 133 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9063.yaml

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
deleted file mode 100644
index aa8b800cc4ad..000000000000
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-* Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
-
-DA9063 consists of a large and varied group of sub-devices (I2C Only):
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9063-regulator        :               : LDOs & BUCKs
-da9063-onkey            :               : On Key
-da9063-rtc              :               : Real-Time Clock (DA9063 only)
-da9063-watchdog         :               : Watchdog
-
-======
-
-Required properties:
-
-- compatible : Should be "dlg,da9063" or "dlg,da9063l"
-- reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
-  modified to match the chip's OTP settings).
-- interrupts : IRQ line information.
-- interrupt-controller
-
-Sub-nodes:
-
-- regulators : This node defines the settings for the LDOs and BUCKs.
-  The DA9063(L) regulators are bound using their names listed below:
-
-    bcore1    : BUCK CORE1
-    bcore2    : BUCK CORE2
-    bpro      : BUCK PRO
-    bmem      : BUCK MEM
-    bio       : BUCK IO
-    bperi     : BUCK PERI
-    ldo1      : LDO_1	(DA9063 only)
-    ldo2      : LDO_2	(DA9063 only)
-    ldo3      : LDO_3
-    ldo4      : LDO_4	(DA9063 only)
-    ldo5      : LDO_5	(DA9063 only)
-    ldo6      : LDO_6	(DA9063 only)
-    ldo7      : LDO_7
-    ldo8      : LDO_8
-    ldo9      : LDO_9
-    ldo10     : LDO_10	(DA9063 only)
-    ldo11     : LDO_11
-
-  The component follows the standard regulator framework and the bindings
-  details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-- rtc : This node defines settings for the Real-Time Clock associated with
-  the DA9063 only. The RTC is not present in DA9063L. There are currently
-  no entries in this binding, however compatible = "dlg,da9063-rtc" should
-  be added if a node is created.
-
-- onkey : This node defines the OnKey settings for controlling the key
-  functionality of the device. The node should contain the compatible property
-  with the value "dlg,da9063-onkey".
-
-  Optional onkey properties:
-
-  - dlg,disable-key-power : Disable power-down using a long key-press. If this
-    entry exists the OnKey driver will remove support for the KEY_POWER key
-    press. If this entry does not exist then by default the key-press
-    triggered power down is enabled and the OnKey will support both KEY_POWER
-    and KEY_SLEEP.
-
-- watchdog : This node defines settings for the Watchdog timer associated
-  with the DA9063 and DA9063L. The node should contain the compatible property
-  with the value "dlg,da9063-watchdog".
-
-  Optional watchdog properties:
-  - dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
-  Only use this option if you can't use the watchdog automatic suspend
-  function during a suspend (see register CONTROL_B).
-
-Example:
-
-	pmic0: da9063@58 {
-		compatible = "dlg,da9063"
-		reg = <0x58>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-
-		rtc {
-			compatible = "dlg,da9063-rtc";
-		};
-
-		wdt {
-			compatible = "dlg,da9063-watchdog";
-		};
-
-		onkey {
-			compatible = "dlg,da9063-onkey";
-			dlg,disable-key-power;
-		};
-
-		regulators {
-			DA9063_BCORE1: bcore1 {
-				regulator-name = "BCORE1";
-				regulator-min-microvolt = <300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp = <500000>;
-				regulator-max-microamp = <2000000>;
-				regulator-boot-on;
-			};
-			DA9063_LDO11: ldo11 {
-				regulator-name = "LDO_11";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <3600000>;
-				regulator-boot-on;
-			};
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
new file mode 100644
index 000000000000..d71933460e90
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Steve Twiss <stwiss.opensource@diasemi.com>
+
+description: |
+  For device-tree bindings of other sub-modules refer to the binding documents
+  under the respective sub-system directories.
+
+properties:
+  compatible:
+    enum:
+      - dlg,da9063
+      - dlg,da9063l
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  dlg,use-sw-pm:
+    type: boolean
+    description:
+      Disable the watchdog during suspend.
+      Only use this option if you can't use the watchdog automatic suspend
+      function during a suspend (see register CONTROL_B).
+
+  watchdog:
+    type: object
+    $ref: /schemas/watchdog/watchdog.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9063-watchdog
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9063-rtc
+
+  onkey:
+    type: object
+    $ref: /schemas/input/input.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9063-onkey
+
+      dlg,disable-key-power:
+        type: boolean
+        description: |
+          Disable power-down using a long key-press.
+          If this entry does not exist then by default the key-press triggered
+          power down is enabled and the OnKey will support both KEY_POWER and
+          KEY_SLEEP.
+
+  regulators:
+    type: object
+    patternProperties:
+      "^(ldo[1-11]|bcore[1-2]|bpro|bmem|bio|bperi)$":
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@58 {
+        compatible = "dlg,da9063";
+        reg = <0x58>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+
+        rtc {
+          compatible = "dlg,da9063-rtc";
+        };
+
+        watchdog {
+          compatible = "dlg,da9063-watchdog";
+        };
+
+        onkey {
+          compatible = "dlg,da9063-onkey";
+          dlg,disable-key-power;
+        };
+
+        regulators {
+          regulator-bcore1 {
+            regulator-name = "BCORE1";
+            regulator-min-microvolt = <300000>;
+            regulator-max-microvolt = <1570000>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <2000000>;
+            regulator-boot-on;
+          };
+          regulator-ldo11 {
+            regulator-name = "LDO_11";
+            regulator-min-microvolt = <900000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-boot-on;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6aafa71806a3..00acb9078cc0 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -93,8 +93,6 @@ properties:
           - dh,dhcom-board
             # DA9053: flexible system level PMIC with multicore support
           - dlg,da9053
-            # DA9063: system PMIC for quad-core application processors
-          - dlg,da9063
             # DMARD05: 3-axis I2C Accelerometer
           - domintech,dmard05
             # DMARD06: 3-axis I2C Accelerometer
diff --git a/MAINTAINERS b/MAINTAINERS
index cfaf02fc9191..777b453593ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5831,6 +5831,7 @@ W:	http://www.dialog-semiconductor.com/products
 F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
 F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
+F:	Documentation/devicetree/bindings/mfd/da90*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/slg51000.txt
-- 
2.36.1

