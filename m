Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21EB8BBABC
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2019 19:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440229AbfIWRwU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Sep 2019 13:52:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37110 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440205AbfIWRwS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Sep 2019 13:52:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so14988233wro.4
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2019 10:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5xWe+jm90yt27MDgJHfM/0OsrYeneBcV2U5/FBqZXM=;
        b=RJCdD2UcBy5rSmxCKyA+IWUMExwyNYv/iysMIENg6WzHFqVLy6AzmiJD+jBlR3odIB
         0Fixe3R3YCaRnAwEyAKUMiCXntnLqowbE/VMbRoJv4R1/SOc4nzvbMix0DWpxywdAoGV
         S12HJ0aenUoFNdXKrLWXL9F9HJBLyRR2DRps5G8C1O7roRcmalgSbUK9hM3hQlNuyAF1
         StEeSjzaskarExHCd6Gor48puZkPCgpXI/aRiQRil5MGtKT1X8eRu4tEr3TSpiFXov+O
         NAMSIqh4RJSiPJ7OZoefwBERXNMosNWRWA5Q72Aob8WdOOc2IbFxIva+oYo0kmv7wJu8
         5qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5xWe+jm90yt27MDgJHfM/0OsrYeneBcV2U5/FBqZXM=;
        b=fvHJZ8JgOOvlpQ0Wd3ovLDN3JJnYBNeEP1Bt8XbR+Sto1C4RsepYy8oBVrJ/iGb3yP
         A0FQu+PJTCl4wHSop1KDrQKKlp69Q3P5NU+9To94mLUhsUd3Dn5pv2S829MkkX18FBvb
         HtALVkvm/qqcib958diaRtZw78zLFY6DJTEWd0jXw7YNyt7BCmPxoCzEEdFv7NO3Rwqu
         3Z/7KaUEo1ThIXrJ3tY7nEjZe5X5frjifTz8KKEKjdF3jyR4t9KWfEH07AvAzLe5v44Y
         MV359D0kv0YSLlQnMya0dENe4h1fsNnn0j5CWOhKfkIPA3ycVIP0ob2K+KFT2SVl9XbU
         ovNA==
X-Gm-Message-State: APjAAAUDM/JIo8z+A1xURez9RfdKUOEsHEQ8iA7+ZTFHgiU9jbO7tz3D
        etx2Wv06l4p6R87cW0UcNlDofQ==
X-Google-Smtp-Source: APXvYqxDdCcLRh2RCGXD0+IJbaDL+1u4PDEk1tZ/jVW8T9vyfpsBW4LNr8WoGnyaQ2FDrGDaVXBsEg==
X-Received: by 2002:adf:f949:: with SMTP id q9mr511487wrr.382.1569261134086;
        Mon, 23 Sep 2019 10:52:14 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a192sm13606962wma.1.2019.09.23.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 10:52:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] dt-bindings: at24: convert the binding document to yaml
Date:   Mon, 23 Sep 2019 19:52:11 +0200
Message-Id: <20190923175211.2060-1-brgl@bgdev.pl>
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
 .../devicetree/bindings/eeprom/at24.txt       |  90 +--------------
 .../devicetree/bindings/eeprom/at24.yaml      | 107 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 109 insertions(+), 90 deletions(-)
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
index 000000000000..28c8b068c8a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -0,0 +1,107 @@
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
+    additionalItems: true
+    maxItems: 2
+    pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24(c|cs|mac)[0-9]+$"
+    oneOf:
+      - const: nxp,se97b
+      - const: renesas,r1ex24002
+      - const: renesas,r1ex24016
+      - const: renesas,r1ex24128
+      - const: rohm,br24t01
+    contains:
+      enum:
+        - atmel,24c00
+        - atmel,24c01
+        - atmel,24cs01
+        - atmel,24c02
+        - atmel,24cs02
+        - atmel,24mac402
+        - atmel,24mac602
+        - atmel,spd
+        - atmel,24c04
+        - atmel,24cs04
+        - atmel,24c08
+        - atmel,24cs08
+        - atmel,24c16
+        - atmel,24cs16
+        - atmel,24c32
+        - atmel,24cs32
+        - atmel,24c64
+        - atmel,24cs64
+        - atmel,24c128
+        - atmel,24c256
+        - atmel,24c512
+        - atmel,24c1024
+        - atmel,24c2048
+
+  reg:
+    description:
+      The I2C slave address of the EEPROM.
+    maxItems: 1
+
+  pagesize:
+    description:
+      The length of the pagesize for writing. Please consult the
+      manual of your device, that value varies a lot. A wrong value
+      may result in data loss! If not specified, a safety value of
+      '1' is used which will be very slow.
+    type: integer
+
+  read-only:
+    description:
+      This parameterless property disables writes to the eeprom.
+    type: boolean
+
+  size:
+    description:
+      Total eeprom size in bytes.
+    type: integer
+
+  no-read-rollover:
+    description:
+      This parameterless property indicates that the multi-address
+      eeprom does not automatically roll over reads to the next slave
+      address. Please consult the manual of your device.
+    type: boolean
+
+  wp-gpios:
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+    maxItems: 1
+
+  address-width:
+    description:
+      Number of address bits (one of 8, 16).
+    type: integer
+
+  num-addresses:
+    description:
+      Total number of i2c slave addresses this device takes.
+    type: integer
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

