Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27F6BE1E7
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 18:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439821AbfIYQE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Sep 2019 12:04:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35922 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439800AbfIYQE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Sep 2019 12:04:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so7604404wrd.3
        for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2019 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ij6KjSR+lw1BQY7TXj2EigwOZMb+P0hFM5LFXgBiMgc=;
        b=GttsSrREeRUalnrJO1ptygwbrFti+NUmA+9jgc4ur0uQ9+X4LpZyPCAT7vCxbbiLw3
         kAyG89zLM9zJMPbTMuocLLp0dLRr5Am8Md+Tscbjk3MUvPfghJ8tVBswRVqgHNbH5Mon
         LGL92mP9pZcFezVxWmKlz5RqktX9M+gdfWtbgNs2iEikm8J+FeZEnqpUpn1Pu83NFuRl
         erCLkY8vVm4xFbzD6pTBg6VhvPlhyVwXiNLRzT77QipX0vKMph1feCwxrsPn6WWvTZsY
         hmk9OQCMSuCapLDOtFMh0M+fnnMxzshPsdmIICUtU5754gUiujJcJRiP1Dd50NYnNb/v
         C7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ij6KjSR+lw1BQY7TXj2EigwOZMb+P0hFM5LFXgBiMgc=;
        b=dvEtg/9mSYMScQJRtwU77cwiLh069E0nY580WIvnT6579/EurwdxZ+FX6vVQCdwT3W
         DL4XmnDXDHH/CWk+jCbLCSLKH/5bTAYqwmwQvnOigFzwnLXDPAljPgU54qztreMsCYqS
         7f7PD/SoaHAtBXJGQD68L174+b1ivDBOGKkfNutzZlpIc0W4LEIveqEs/XImEUt7aQHs
         0FsPMYrk0bVJ5s9FByjZsL/zzsq7aYbyvqU9HO4tscxG3uieaX0lwArJiOPtn4ZhB3rt
         M5gO2fVUiRPlKLBUa1j/z9MjUd9hpxkKRZNCRcRPMSIqpjsIfUoEO5/KbcsHsM0yMFQo
         rGjw==
X-Gm-Message-State: APjAAAUpahQQ2/VFoqkhTRu5heDsF9/b7xSq/Pc0gnabYniVh9/1OOyd
        YBWHw3I/GYuW4KcoP5Zx9vWQg8uyOLo=
X-Google-Smtp-Source: APXvYqwCfOwN9m3fxmaibVuR6yyr8B/+xl1IYzzE4PtAv/mPVljXgIGmruoyXXzsfwt4PaIMjAj8xA==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr9791832wro.127.1569427494026;
        Wed, 25 Sep 2019 09:04:54 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id a7sm5760321wra.43.2019.09.25.09.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 09:04:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Rosin <peda@axentia.se>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2] dt-bindings: at24: convert the binding document to yaml
Date:   Wed, 25 Sep 2019 18:04:51 +0200
Message-Id: <20190925160451.11116-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
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
---
v1 -> v2:
- modified the compatible property: we now list all possible combinations and
  non-standard types with appropriate fallbacks to be as strict as possible
- minor changes to other properties: added constraints, converted to enums
  where applicable and referenced the types from schema

Rob: please advise whether it's possible to somehow encapsulate the list
of vendors in some kind of variable to not repeat it everywhere. I didn't
find any such example.

The file passes a test with dt-doc-validate.

 .../devicetree/bindings/eeprom/at24.txt       |  90 +-------
 .../devicetree/bindings/eeprom/at24.yaml      | 214 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 216 insertions(+), 90 deletions(-)
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
index 000000000000..46a0abc9199a
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    minItems: 1
+    maxItems: 2
+    oneOf:
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c00$"
+        - const: atmel,24c00
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c01$"
+        - const: atmel,24c01
+      - items:
+        - const: rohm,br24t01
+        - const: atmel,24c01
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs01$"
+        - const: atmel,24cs01
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c02$"
+        - const: atmel,24c02
+      - items:
+        - const: nxp,se97b
+        - const: atmel,24c02
+      - items:
+        - const: renesas,r1ex24002
+        - const: atmel,24c02
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs02$"
+        - const: atmel,24cs02
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24mac402$"
+        - const: atmel,24mac402
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24mac602$"
+        - const: atmel,24mac602
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),spd$"
+        - const: atmel,spd
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c04$"
+        - const: atmel,24c04
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs04$"
+        - const: atmel,24cs04
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c08$"
+        - const: atmel,24c08
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs08$"
+        - const: atmel,24cs08
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c16$"
+        - const: atmel,24c16
+      - items:
+        - const: renesas,r1ex24016
+        - const: atmel,24c16
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs16$"
+        - const: atmel,24cs16
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c32$"
+        - const: atmel,24c32
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs32$"
+        - const: atmel,24cs32
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c64$"
+        - const: atmel,24c64
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24cs64$"
+        - const: atmel,24cs64
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c128$"
+        - const: atmel,24c128
+      - items:
+        - const: renesas,r1ex24128
+        - const: atmel,24c128
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c256$"
+        - const: atmel,24c256
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c512$"
+        - const: atmel,24c512
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c1024$"
+        - const: atmel,24c1024
+      - items:
+        - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c20148$"
+        - const: atmel,24c2048
+      - items:
+        - const: atmel,24c00
+      - items:
+        - const: atmel,24c01
+      - items:
+        - const: atmel,24cs01
+      - items:
+        - const: atmel,24c02
+      - items:
+        - const: atmel,24cs02
+      - items:
+        - const: atmel,24mac402
+      - items:
+        - const: atmel,24mac602
+      - items:
+        - const: atmel,spd
+      - items:
+        - const: atmel,24c04
+      - items:
+        - const: atmel,24cs04
+      - items:
+        - const: atmel,24c08
+      - items:
+        - const: atmel,24cs08
+      - items:
+        - const: atmel,24c16
+      - items:
+        - const: atmel,24cs16
+      - items:
+        - const: atmel,24c32
+      - items:
+        - const: atmel,24cs32
+      - items:
+        - const: atmel,24c64
+      - items:
+        - const: atmel,24cs64
+      - items:
+        - const: atmel,24c128
+      - items:
+        - const: atmel,24c256
+      - items:
+        - const: atmel,24c512
+      - items:
+        - const: atmel,24c1024
+      - items:
+        - const: atmel,24c2048
+
+  reg:
+    description:
+      I2C slave address of the EEPROM.
+    maxItems: 1
+
+  pagesize:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    description:
+      Total eeprom size in bytes.
+    type: integer
+
+  no-read-rollover:
+    $ref: /schemas/types.yaml#definitions/flag
+    description:
+      This parameterless property indicates that the multi-address
+      eeprom does not automatically roll over reads to the next slave
+      address. Please consult the manual of your device.
+
+  wp-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+    maxItems: 1
+
+  address-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of address bits (one of 8, 16).
+    default: 8
+    enum: [ 8, 16 ]
+
+  num-addresses:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    eeprom@52 {
+        compatible = "microchip,24c32", "atmel,24c32";
+        reg = <0x52>;
+        pagesize = <32>;
+        wp-gpios = <&gpio1 3 0>;
+        num-addresses = <8>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a400af0501c9..3c7ced686966 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2698,7 +2698,7 @@ M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
 L:	linux-i2c@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
 S:	Maintained
-F:	Documentation/devicetree/bindings/eeprom/at24.txt
+F:	Documentation/devicetree/bindings/eeprom/at24.yaml
 F:	drivers/misc/eeprom/at24.c
 
 ATA OVER ETHERNET (AOE) DRIVER
-- 
2.23.0

