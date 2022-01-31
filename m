Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46B64A4D33
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 18:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380951AbiAaR15 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 12:27:57 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35046
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380241AbiAaR14 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 12:27:56 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9DC613F328
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jan 2022 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643650075;
        bh=LMogPhxfL2VV23EwnIvho4hqsJaI2tQRJB5PamGe9m8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=B96KtbTbs2eoQa5szNBLtfYXBQBhO+36JBhD9rA0gUWuwLtGMIWK08hoKq6NPTetY
         RSqKDncgTpR5eeL8Sg4ClkodOhLkhlmHE2nZlpwp9N8gZvi+GrohmCTvIA12LM2zMf
         0xm4iJuqB9mgAdJLPoD9FCmWFXm16qRX2opkGECsmdm2biLSiAfr4pecZg6WLCPRVG
         4hyvHEtM8x20ydP7id3C7vQotptyjQbpB+MadKkZ0yDsuA26DFVFs2KoBZqiljYA4M
         5W9dBSKgwlk9z5+WVO6DjEYMpiBHzNzoejAytwKHGB8rHMOD63BBG28wJSKYxbTiOR
         cOu2hxlGL2VKA==
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso7282561edt.20
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jan 2022 09:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMogPhxfL2VV23EwnIvho4hqsJaI2tQRJB5PamGe9m8=;
        b=ZNMrXESBr/67sPru0LcGOTYxnbd6X5fH6FuY+O4/B1p+fzWHF0fMhrgbpOEI/aky+N
         IksznZ8W6Dvhs6YZH/i4n33KP4sK9brzITRY9UlbSmZ+9O44teuSbzf33ENXuj3oEhmg
         jtdicl8RcabKqBrV6BbRklqmotZPoqLGgtKGBJSCKkhviwTTpi0RwxpLpLjtQ2U+X0Ca
         0R/jC6C16SdNbzUZZXKSgnKZtQvOfvjBoTW9Si8cdL/tyCtkw76qLin/nUZ0z+rucZdO
         LyLEJROuBn0bv9gZrJk7fCIu+1TDLUxIqWxLpyFGIky+Ugq64w4hVwZFyNNknIB7Aat/
         GNdg==
X-Gm-Message-State: AOAM533pIeVjAV+XKatnnZwhBlsm+g4/SyMYtslQx2KCM+L/TlFN4Hmn
        K2RnxwU+KdXn7NYYVCmn1xgGVUN2xpIl2tXDcCKUHeESKkN/+XsRsl1Qy1kcK6/v8ADRDamdKLX
        IbYdysyFr6p4DHOag/oTh2sUlvYSkupeXuFzgbg==
X-Received: by 2002:a17:907:6d99:: with SMTP id sb25mr17612453ejc.10.1643650075151;
        Mon, 31 Jan 2022 09:27:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznSv93p9sJfV0aRi56Nu2+poMrKt0bMKxjCqtn9Gconec/5E965GpUkgcfZUbs0BlToDogDg==
X-Received: by 2002:a17:907:6d99:: with SMTP id sb25mr17612442ejc.10.1643650074923;
        Mon, 31 Jan 2022 09:27:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id u14sm18119855eds.1.2022.01.31.09.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 09:27:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] dt-bindings: i2c: samsung,s3c2410-i2c: convert to dtschema
Date:   Mon, 31 Jan 2022 18:27:13 +0100
Message-Id: <20220131172713.208976-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Samsung S3C24xx/S3C64xx/S5PV210/Exynos SoC I2C Controller
bindings to DT schema format.

The conversion includes also changes/fixes to the bindings, matching the
real hardware and existing Linux driver:
1. Do not require interrupts on samsung,exynos5-sata-phy-i2c, because
   there is no such.
2. Do not allow gpios on samsung,exynos5-sata-phy-i2c, because they are
   hard-wired just like for HDMI phy.
3. Do not require samsung,i2c-sda-delay and use default of 0.
4. Require clock, which was always required but missing in bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/i2c/i2c-s3c2410.txt   |  58 -------
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 164 ++++++++++++++++++
 2 files changed, 164 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt b/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
deleted file mode 100644
index 66ae46d3bc2f..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Samsung's I2C controller
-
-The Samsung's I2C controller is used to interface with I2C devices.
-
-Required properties:
-  - compatible: value should be either of the following.
-      (a) "samsung, s3c2410-i2c", for i2c compatible with s3c2410 i2c.
-      (b) "samsung, s3c2440-i2c", for i2c compatible with s3c2440 i2c.
-      (c) "samsung, s3c2440-hdmiphy-i2c", for s3c2440-like i2c used
-          inside HDMIPHY block found on several samsung SoCs
-      (d) "samsung, exynos5-sata-phy-i2c", for s3c2440-like i2c used as
-	   a host to SATA PHY controller on an internal bus.
-  - reg: physical base address of the controller and length of memory mapped
-    region.
-  - interrupts: interrupt number to the cpu.
-  - samsung,i2c-sda-delay: Delay (in ns) applied to data line (SDA) edges.
-
-Required for all cases except "samsung,s3c2440-hdmiphy-i2c":
-  - Samsung GPIO variant (deprecated):
-    - gpios: The order of the gpios should be the following: <SDA, SCL>.
-      The gpio specifier depends on the gpio controller. Required in all
-      cases except for "samsung,s3c2440-hdmiphy-i2c" whose input/output
-      lines are permanently wired to the respective clienta
-  - Pinctrl variant (preferred, if available):
-    - pinctrl-0: Pin control group to be used for this controller.
-    - pinctrl-names: Should contain only one value - "default".
-
-Optional properties:
-  - samsung,i2c-slave-addr: Slave address in multi-master environment. If not
-    specified, default value is 0.
-  - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. If not
-    specified, the default value in Hz is 100000.
-  - samsung,sysreg-phandle - handle to syscon used to control the system registers
-
-Example:
-
-	i2c@13870000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x13870000 0x100>;
-		interrupts = <345>;
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <100000>;
-		/* Samsung GPIO variant begins here */
-		gpios = <&gpd1 2 0 /* SDA */
-			 &gpd1 3 0 /* SCL */>;
-		/* Samsung GPIO variant ends here */
-		/* Pinctrl variant begins here */
-		pinctrl-0 = <&i2c3_bus>;
-		pinctrl-names = "default";
-		/* Pinctrl variant ends here */
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		wm8994@1a {
-			compatible = "wlf,wm8994";
-			reg = <0x1a>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
new file mode 100644
index 000000000000..84051b0129c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/samsung,s3c2410-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3C/S5P/Exynos SoC I2C Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,s3c2410-i2c
+      - samsung,s3c2440-i2c
+        # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
+      - samsung,s3c2440-hdmiphy-i2c
+        # For s3c2440-like I2C used as a host to SATA PHY controller on an
+        # internal bus:
+      - samsung,exynos5-sata-phy-i2c
+
+  '#address-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: i2c
+
+  gpios:
+    description: |
+      The order of the GPIOs should be the following:: <SDA, SCL>.  The GPIO
+      specifier depends on the gpio controller. Required in all cases except
+      for "samsung,s3c2440-hdmiphy-i2c" whose input/output lines are
+      permanently wired to the respective client.
+      This property is deprecated. Use "pinctrl-0" and "pinctrl-names" instead.
+    deprecated: yes
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  samsung,i2c-max-bus-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Desired frequency in Hz of the bus.
+    default: 100000
+
+  samsung,i2c-sda-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay (in ns) applied to data line (SDA) edges.
+    default: 0
+
+  samsung,i2c-slave-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Slave address in multi-master environment.
+    default: 0
+
+  samsung,sysreg-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Pandle to syscon used to control the system registers.
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s3c2440-hdmiphy-i2c
+              - samsung,exynos5-sata-phy-i2c
+    then:
+      properties:
+        gpios: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s3c2410-i2c
+              - samsung,s3c2440-i2c
+              - samsung,s3c2440-hdmiphy-i2c
+    then:
+      required:
+        - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@12c60000 {
+        compatible = "samsung,s3c2440-i2c";
+        reg = <0x12C60000 0x100>;
+        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clock CLK_I2C0>;
+        clock-names = "i2c";
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2c0_bus>;
+
+        samsung,sysreg-phandle = <&sysreg_system_controller>;
+        samsung,i2c-sda-delay = <100>;
+        samsung,i2c-max-bus-freq = <20000>;
+        samsung,i2c-slave-addr = <0x66>;
+
+        eeprom@50 {
+            compatible = "samsung,s524ad0xd1";
+            reg = <0x50>;
+        };
+    };
+
+    i2c@12ce0000 {
+        compatible = "samsung,s3c2440-hdmiphy-i2c";
+        reg = <0x12CE0000 0x1000>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clock CLK_I2C_HDMI>;
+        clock-names = "i2c";
+
+        samsung,i2c-sda-delay = <100>;
+        samsung,i2c-max-bus-freq = <66000>;
+
+        phy-i2c@38 {
+            compatible = "samsung,exynos4212-hdmiphy";
+            reg = <0x38>;
+        };
+    };
+
+    i2c@121d0000 {
+        compatible = "samsung,exynos5-sata-phy-i2c";
+        reg = <0x121D0000 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clock CLK_SATA_PHYI2C>;
+        clock-names = "i2c";
+
+        samsung,i2c-sda-delay = <100>;
+        samsung,i2c-max-bus-freq = <40000>;
+
+        phy-i2c@38 {
+            compatible = "samsung,exynos-sataphy-i2c";
+            reg = <0x38>;
+        };
+    };
-- 
2.32.0

