Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B96BE68D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 22:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393197AbfIYUiL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Sep 2019 16:38:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43603 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbfIYUiL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Sep 2019 16:38:11 -0400
Received: by mail-ot1-f66.google.com with SMTP id o44so6071927ota.10;
        Wed, 25 Sep 2019 13:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zQInuGkMe3qovTinqfkdgEQXIzP462jilxqOggaZr10=;
        b=b293AGJ8oRlR8kbFobsZo8yR3NUASeNb/MeGTY65XpLmd9XQPGJz1fC1MlA7bnySgU
         rDki0niWeXj4h0w8HEo9LBRGh0ZVsZ4YXJPWT/cpjlwpp4ZyGW+jsv6G2g5BD0kBVs6J
         JyISq/qECvijQC+SwhuPTT1LHz2HTqLzT/KxVG5sqUjgnzpcC739tikyoMTcgqFPXE4b
         FT2YyJqtM1wedPufDbTnXd0KYgPOUylFmkTdu3JSirmEFossASJo4DvtnvoLQU0NwQNN
         qIg60kLEN12mrpAovSBWqgf9w6ookNPQ3I1HhiLpSIxLRH0DKfAj4AyWO8ztzTAZkwVw
         sFbA==
X-Gm-Message-State: APjAAAW+dYMCVZO2i/PO8AZ6Jg8QHIS78kzCtSjTNUtZSSOSDnsEVhby
        TqP8i/M9w7WOWJKmJHIhoA47t2g=
X-Google-Smtp-Source: APXvYqyk1Afya9jmf/Y/Fv6BHf9KAdKv807HPJpds+ch3rf9S/rNjs5pqgG0Dty4TVQXSEKpZ6hbTw==
X-Received: by 2002:a9d:68c6:: with SMTP id i6mr24397oto.350.1569443889889;
        Wed, 25 Sep 2019 13:38:09 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id l4sm1836352otj.64.2019.09.25.13.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 13:38:09 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Rosin <peda@axentia.se>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v3] dt-bindings: at24: convert the binding document to yaml
Date:   Wed, 25 Sep 2019 15:38:08 -0500
Message-Id: <20190925203808.14249-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the binding document for at24 EEPROMs from txt to yaml. The
compatible property uses a regex pattern to address all the possible
combinations of "vendor,model" strings.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
[robh: rework compatible schema, fix missing allOf for $ref, fix errors in example]
Signed-off-by: Rob Herring <robh@kernel.org>
---
Here's my reworking of compatible schema and all the other fixes I 
found. The inner 'oneOf' is probably a little excessive given the number 
of lines. All it does is ensure both compatible strings have the same 
part number.

Getting these errors checking Arm dts files:

arch/arm/boot/dts/at91-tse850-3.dt.yaml: jc42@18: compatible: ['nxp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the given schemas
arch/arm/boot/dts/at91-nattis-2-natte-2.dt.yaml: temp@18: compatible: ['nxp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the given schemas
arch/arm/boot/dts/imx7d-mba7.dt.yaml: temperature-sensor-eeprom@1e: compatible: ['nxp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the given schemas
arch/arm/boot/dts/imx7s-mba7.dt.yaml: temperature-sensor-eeprom@1e: compatible: ['nxp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the given schemas

 .../devicetree/bindings/eeprom/at24.txt       |  90 +---------
 .../devicetree/bindings/eeprom/at24.yaml      | 154 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 156 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/eeprom/at24.yaml

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index 22aead844d0f..c94acbb8cb0c 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -1,89 +1 @@
-EEPROMs (I2C)
-
-Required properties:
-
-  - compatible: Must be a "<manufacturer>,<model>" pair. The following <model>
-                values are supported (assuming "atmel" as manufacturer):
-
-                "atmel,24c00",
-                "atmel,24c01",
-                "atmel,24cs01",
-                "atmel,24c02",
-                "atmel,24cs02",
-                "atmel,24mac402",
-                "atmel,24mac602",
-                "atmel,spd",
-                "atmel,24c04",
-                "atmel,24cs04",
-                "atmel,24c08",
-                "atmel,24cs08",
-                "atmel,24c16",
-                "atmel,24cs16",
-                "atmel,24c32",
-                "atmel,24cs32",
-                "atmel,24c64",
-                "atmel,24cs64",
-                "atmel,24c128",
-                "atmel,24c256",
-                "atmel,24c512",
-                "atmel,24c1024",
-                "atmel,24c2048",
-
-                If <manufacturer> is not "atmel", then a fallback must be used
-                with the same <model> and "atmel" as manufacturer.
-
-                Example:
-                        compatible = "microchip,24c128", "atmel,24c128";
-
-                Supported manufacturers are:
-
-                "catalyst",
-                "microchip",
-                "nxp",
-                "ramtron",
-                "renesas",
-                "rohm",
-                "st",
-
-                Some vendors use different model names for chips which are just
-                variants of the above. Known such exceptions are listed below:
-
-                "nxp,se97b" - the fallback is "atmel,24c02",
-                "renesas,r1ex24002" - the fallback is "atmel,24c02"
-                "renesas,r1ex24016" - the fallback is "atmel,24c16"
-                "renesas,r1ex24128" - the fallback is "atmel,24c128"
-                "rohm,br24t01" - the fallback is "atmel,24c01"
-
-  - reg: The I2C address of the EEPROM.
-
-Optional properties:
-
-  - pagesize: The length of the pagesize for writing. Please consult the
-              manual of your device, that value varies a lot. A wrong value
-              may result in data loss! If not specified, a safety value of
-              '1' is used which will be very slow.
-
-  - read-only: This parameterless property disables writes to the eeprom.
-
-  - size: Total eeprom size in bytes.
-
-  - no-read-rollover: This parameterless property indicates that the
-                      multi-address eeprom does not automatically roll over
-                      reads to the next slave address. Please consult the
-                      manual of your device.
-
-  - wp-gpios: GPIO to which the write-protect pin of the chip is connected.
-
-  - address-width: number of address bits (one of 8, 16).
-
-  - num-addresses: total number of i2c slave addresses this device takes
-
-Example:
-
-eeprom@52 {
-	compatible = "atmel,24c32";
-	reg = <0x52>;
-	pagesize = <32>;
-	wp-gpios = <&gpio1 3 0>;
-	num-addresses = <8>;
-};
+This file has been moved to at24.yaml.
diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
new file mode 100644
index 000000000000..5faa03014cc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2019 BayLibre SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/eeprom/at24.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: I2C EEPROMs compatible with Atmel's AT24
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+properties:
+  compatible:
+    oneOf:
+      - allOf:
+          - minItems: 1
+            maxItems: 2
+            items:
+              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|mac)[0-9]+|spd)$"
+              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+          - oneOf:
+              - items:
+                  pattern: c00$
+              - items:
+                  pattern: c01$
+              - items:
+                  pattern: c02$
+              - items:
+                  pattern: c04$
+              - items:
+                  pattern: c08$
+              - items:
+                  pattern: c16$
+              - items:
+                  pattern: cs16$
+              - items:
+                  pattern: c32$
+              - items:
+                  pattern: cs32$
+              - items:
+                  pattern: c64$
+              - items:
+                  pattern: cs64$
+              - items:
+                  pattern: c128$
+              - items:
+                  pattern: cs128$
+              - items:
+                  pattern: c256$
+              - items:
+                  pattern: cs256$
+              - items:
+                  pattern: c512$
+              - items:
+                  pattern: cs512$
+              - items:
+                  pattern: c1024$
+              - items:
+                  pattern: cs1024$
+              - items:
+                  pattern: c2048$
+              - items:
+                  pattern: cs2048$
+              - items:
+                  pattern: spd$
+      - items:
+          - const: rohm,br24t01
+          - const: atmel,24c01
+      - items:
+          - const: nxp,se97b
+          - const: atmel,24c02
+      - items:
+          - const: renesas,r1ex24002
+          - const: atmel,24c02
+      - items:
+          - const: renesas,r1ex24016
+          - const: atmel,24c16
+      - items:
+          - const: renesas,r1ex24128
+          - const: atmel,24c128
+
+  reg:
+    maxItems: 1
+
+  pagesize:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The length of the pagesize for writing. Please consult the
+      manual of your device, that value varies a lot. A wrong value
+      may result in data loss! If not specified, a safety value of
+      '1' is used which will be very slow.
+    enum: [ 1, 8, 16, 32, 64, 128, 258 ]
+    default: 1
+
+  read-only:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      This parameterless property disables writes to the eeprom.
+
+  size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Total eeprom size in bytes.
+
+  no-read-rollover:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      This parameterless property indicates that the multi-address
+      eeprom does not automatically roll over reads to the next slave
+      address. Please consult the manual of your device.
+
+  wp-gpios:
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+    maxItems: 1
+
+  address-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of address bits (one of 8, 16).
+    default: 8
+    enum: [ 8, 16 ]
+
+  num-addresses:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Total number of i2c slave addresses this device takes.
+    default: 1
+    minimum: 1
+    maximum: 8
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      eeprom@52 {
+          compatible = "microchip,24c32", "atmel,24c32";
+          reg = <0x52>;
+          pagesize = <32>;
+          wp-gpios = <&gpio1 3 0>;
+          num-addresses = <8>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a50e97a63bc8..a65e6bcd957b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2687,7 +2687,7 @@ M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
 L:	linux-i2c@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
 S:	Maintained
-F:	Documentation/devicetree/bindings/eeprom/at24.txt
+F:	Documentation/devicetree/bindings/eeprom/at24.yaml
 F:	drivers/misc/eeprom/at24.c
 
 ATA OVER ETHERNET (AOE) DRIVER
-- 
2.20.1

