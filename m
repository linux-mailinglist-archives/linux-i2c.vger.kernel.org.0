Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB9BC068E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2019 15:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfI0NmX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Sep 2019 09:42:23 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37931 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfI0NmX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Sep 2019 09:42:23 -0400
Received: by mail-oi1-f193.google.com with SMTP id m16so5232263oic.5;
        Fri, 27 Sep 2019 06:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6A8+XK4hH5QQ+56YfWFGj8rbwtwJGUbVuhTbqELL8Ac=;
        b=mDErom3TzVVFHGHjHsbVJYbYPffVXUHK+e63H5SsWqYeMv/Szo+725EyiP8rJD3A2m
         Hx5S77vMsuUut02z1GObiOQA6fXrVnn4/C5fzg8tLt11UE2WHXxT03s+G5dBMC0zeZyW
         2nSU+Dy+yRVGk9etOAjOgIcQPDuwzb0bfjTKTLEbXw8GNKBIFCnL+ir7otM5wAakbqZc
         RlA13qTZVVb0Ti+9yU9HN1EacMCnnz+LdmrufvCugeyF7xmJqoLmUVfjUUMS5fPhup76
         RRge/vF49Up2P576ecMGifqZf7Pv3IDyPvu2obatHvvoRW+kSpbs075COmkXfFfbjtA8
         I03A==
X-Gm-Message-State: APjAAAWSDMB4ROgNiqC10VIf7eSXtfldLuuKdVTRzOeGCM+k8+RWKXWV
        RXOTvSls96heFezqcrguHOr0YAw=
X-Google-Smtp-Source: APXvYqy/DmKJirBgPut/1N5QoQ0+HlN+0IYb/OAJrg6t1IOktijl5IneIPBHcaF+u2k6jCtYAEAEUA==
X-Received: by 2002:a05:6808:7cd:: with SMTP id f13mr7224509oij.6.1569591741778;
        Fri, 27 Sep 2019 06:42:21 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id 38sm970941otw.28.2019.09.27.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 06:42:21 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Rosin <peda@axentia.se>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v4] dt-bindings: at24: convert the binding document to yaml
Date:   Fri, 27 Sep 2019 08:42:20 -0500
Message-Id: <20190927134220.8734-1-robh@kernel.org>
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
v4:
- Add a $nodename definition

- Turns out the compatible schema is too complex for generating a 'select'
schema and only a small subset where getting validated. So we need a
custom 'select' schema. This in turn fixes the issue with the nxp,se97b
binding.

Now we get a different set of errors checking Arm dts files (omitting
a bunch of node name ones):

arch/arm/boot/dts/at91-dvk_som60.dt.yaml: eeprom@57: compatible: ['giantec,gt24c32a', 'atmel,24c32'] is not valid under any of the given schemas
arch/arm/boot/dts/am3874-iceboard.dt.yaml: at24cs01@5f: compatible: ['atmel,24cs01'] is not valid under any of the given schemas
arch/arm/boot/dts/am3874-iceboard.dt.yaml: at24cs08@5c: compatible: ['atmel,24cs08'] is not valid under any of the given schemas

These all look to be real.
---
 .../devicetree/bindings/eeprom/at24.txt       |  90 +---------
 .../devicetree/bindings/eeprom/at24.yaml      | 164 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 166 insertions(+), 90 deletions(-)
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
index 000000000000..036068335a4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -0,0 +1,164 @@
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
+select:
+  properties:
+    compatible:
+      contains:
+        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^eeprom@[0-9a-f]{1,2}$"
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

