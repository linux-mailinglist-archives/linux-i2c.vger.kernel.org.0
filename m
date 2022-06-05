Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 135B953DB97
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 15:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245684AbiFENd0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 09:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245285AbiFENdY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 09:33:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B33C39173
        for <linux-i2c@vger.kernel.org>; Sun,  5 Jun 2022 06:33:22 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h5so16445061wrb.0
        for <linux-i2c@vger.kernel.org>; Sun, 05 Jun 2022 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MyzpsFTpfWVf4jrzrptLmik9brUBiyW2F84GuqNqSo=;
        b=Q2t9n2ifoHSgWYG9ro4F7xjb4uczkrQxDKgIjiY8/SNscngUCoNmYPobSFoNtyXzEq
         0fgbBQKMrA35Z4q8GkY/YiXYvFXlPL/RBYXfJArTCtNaFo2b5nhEZEBL+BMXX6NDhaCt
         HNQ/sc0g5B82ut993kwkWQKkVwI5D7/AF3TjzcAmAz7KlIVG8ChDSqG1ysLKQ5T+ZXZ8
         nRwg8F7vLmAQl0dWK3vbVc+mLxco+tJp/cN8SFnxhoqJySioGwbUoUEXo/h+szcZaiKA
         KIeQ/LcY0RQ3xA8qsXXLutCaJJWUt2xwUIywyUgCfNNqglp05hJO74G14uCpSgXx3EaO
         dfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MyzpsFTpfWVf4jrzrptLmik9brUBiyW2F84GuqNqSo=;
        b=5fOheh/22R+C4iMxzou68TiYpWMAYsXFtqN2iKKzPW7IgaqP1ZaF5BwkZllVBjVcgL
         TCNRDuWZJA4lp7pij6Q1EQZoEqph0RWgCfI5pOJaDs1iIf8h343EBqLKQJiC+kVaAeVW
         3flocNxXHr45D/HWTq+BTEA28JB0A0e0iAQs8SoQ6+FcQyAR8GkBOVpV4QDOK4tiyvTK
         W8VQ47jkDAyJuwcQeOYKTILLUeW74AolMas0bKYeoRk8OVMcdXyBsZgIXQ450wohVe5P
         dweHxgrJ/g/jV2jGzq1Do3lIDNE7j38y0DbQPO+4OrOuikXHjqmNzROvfyMaBDQpkrKP
         Ja1A==
X-Gm-Message-State: AOAM532Nz3y5xTzpoVuby4R+k0szDLgZQwF1ddroDaUp0YEVu1MOpe0S
        2nWMHiAoCDMGa6LXmkH+8IZVKQ==
X-Google-Smtp-Source: ABdhPJyevo8PLglhVn4Uhe9tn6b8M1MTJYIq62hMjrrmCV1eXVQvUp2WYRXZjMkLleMTMX+qK11MJQ==
X-Received: by 2002:a5d:638b:0:b0:20f:c623:2597 with SMTP id p11-20020a5d638b000000b0020fc6232597mr16439572wru.271.1654436000512;
        Sun, 05 Jun 2022 06:33:20 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:20 -0700 (PDT)
From:   mail@conchuod.ie
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
Subject: [PATCH v1 4/6] dt-bindings: mfd: convert da9063 to yaml
Date:   Sun,  5 Jun 2022 14:32:59 +0100
Message-Id: <20220605133300.376161-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
 .../devicetree/bindings/mfd/da9063.txt        | 111 ----------------
 .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 3 files changed, 123 insertions(+), 113 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
deleted file mode 100644
index 91b79a21d403..000000000000
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ /dev/null
@@ -1,111 +0,0 @@
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
-  with the DA9063 and DA9063L. There are currently no entries in this
-  binding, however compatible = "dlg,da9063-watchdog" should be added
-  if a node is created.
-
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
diff --git a/Documentation/devicetree/bindings/mfd/da9063.yaml b/Documentation/devicetree/bindings/mfd/da9063.yaml
new file mode 100644
index 000000000000..376880061f42
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/da9063.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/da9063.yaml#
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
+    description:
+      I2C device address.
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
+  watchdog:
+    type: object
+    $ref: ../watchdog/watchdog.yaml#
+    properties:
+      compatible:
+        const: dlg,da9063-watchdog
+
+  rtc:
+    type: object
+    $ref: ../rtc/rtc.yaml#
+    properties:
+      compatible:
+        const: dlg,da9063-rtc
+
+  onkey:
+    type: object
+    $ref: ../input/input.yaml#
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
+        $ref: ../regulator/regulator.yaml
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
-- 
2.36.1

