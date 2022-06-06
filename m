Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D868453EABB
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240746AbiFFP0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 11:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240722AbiFFP0S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 11:26:18 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56B0328EE6
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 08:26:13 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t13so20332755wrg.9
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x/f1FaPzTGDLsr/DiTII6oEYQHceD1qu+Bo5bSZju/M=;
        b=e9T05yHPz6TascNJEXfj2bG3nUrDj112EH4rcBcG6wiVBOtMHFuPNpmmyGyldu3Lih
         VSK3wAqAL996cyT61h1McpAqnhkkKKLcwmTigut8hUrtDBY0re/ynVtd/Yni8ASpqdef
         VhNoG5I5yEb6PU3D9swh2278LAvqE2WasoDPCuc9C4s7KJnQQNEtne6ha809RF5UV1Hi
         yNeUH/epC/fuMj3krROewpoFobsCi/WlZQHwExzGZIZhKccmVumCjNVBrVWon4m1XvHS
         gUxQIlQ5EGVWw+j0i06DVVwXkh2QrPCm7eePNhbtAbdgpntwaSKSkthK/KOLai7yZMfA
         xATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/f1FaPzTGDLsr/DiTII6oEYQHceD1qu+Bo5bSZju/M=;
        b=7tH4S82PQAVjtSZpx6mEXbdDRPuwE95A8ECPjt03zQT24a0k3SUL8zci03Jp80ayjL
         JFzsZrKCsBPhzQ8kEc7aCkwYGIZGH79gq10L01MOv8WAE+ZtAqkii77sNDja9CDaqnbm
         oFFH9AY50iZyz07csc/Yw9kCSPXV0ebTA07XRbCwDxLsImYbP+ehAE5AJLP69Ko2yVFq
         aqS381an5RIdU4I9QISZ8eBUODk+AoUiwci59JMYYpRElCD+GvXYHFZT9Bjneub3M/r1
         +CsX7ye9TLTnj5LPNwhiZptf34luyxhcQw6gv8TYHeaq+GhulKfXeFtHzWHqJYPySRUw
         q10g==
X-Gm-Message-State: AOAM533ah0hWYn4LP4vOBtjrotfgk2TOy2N1o8zmSfOgP7FimGbYyMj7
        uUG1IuWTy1kUzea5MkG/t57R0w==
X-Google-Smtp-Source: ABdhPJzVN2kv17X6adk/UC8LHcWJ90WyNDYqXo34cL9iDJALH5HczjnpDFV2nYexah8I+mkleqkqmw==
X-Received: by 2002:a5d:4290:0:b0:213:badd:abc5 with SMTP id k16-20020a5d4290000000b00213baddabc5mr17323489wrq.54.1654529171903;
        Mon, 06 Jun 2022 08:26:11 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:11 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: i2c: convert ocores binding to yaml
Date:   Mon,  6 Jun 2022 16:25:56 +0100
Message-Id: <20220606152557.438771-3-mail@conchuod.ie>
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

Convert the open cores i2c controller binding from text to yaml.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
 .../bindings/i2c/opencores,i2c-ocores.yaml    | 123 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 124 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
deleted file mode 100644
index a37c9455b244..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Device tree configuration for i2c-ocores
-
-Required properties:
-- compatible      : "opencores,i2c-ocores"
-                    "aeroflexgaisler,i2cmst"
-                    "sifive,fu540-c000-i2c", "sifive,i2c0"
-                    For Opencore based I2C IP block reimplemented in
-                    FU540-C000 SoC.
-                    "sifive,fu740-c000-i2c", "sifive,i2c0"
-                    For Opencore based I2C IP block reimplemented in
-                    FU740-C000 SoC.
-                    Please refer to sifive-blocks-ip-versioning.txt for
-                    additional details.
-- reg             : bus address start and address range size of device
-- clocks          : handle to the controller clock; see the note below.
-                    Mutually exclusive with opencores,ip-clock-frequency
-- opencores,ip-clock-frequency: frequency of the controller clock in Hz;
-                    see the note below. Mutually exclusive with clocks
-- #address-cells  : should be <1>
-- #size-cells     : should be <0>
-
-Optional properties:
-- interrupts      : interrupt number.
-- clock-frequency : frequency of bus clock in Hz; see the note below.
-                    Defaults to 100 KHz when the property is not specified
-- reg-shift       : device register offsets are shifted by this value
-- reg-io-width    : io register width in bytes (1, 2 or 4)
-- regstep         : deprecated, use reg-shift above
-
-Note
-clock-frequency property is meant to control the bus frequency for i2c bus
-drivers, but it was incorrectly used to specify i2c controller input clock
-frequency. So the following rules are set to fix this situation:
-- if clock-frequency is present and neither opencores,ip-clock-frequency nor
-  clocks are, then clock-frequency specifies i2c controller clock frequency.
-  This is to keep backwards compatibility with setups using old DTB. i2c bus
-  frequency is fixed at 100 KHz.
-- if clocks is present it specifies i2c controller clock. clock-frequency
-  property specifies i2c bus frequency.
-- if opencores,ip-clock-frequency is present it specifies i2c controller
-  clock frequency. clock-frequency property specifies i2c bus frequency.
-
-Examples:
-
-	i2c0: ocores@a0000000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "opencores,i2c-ocores";
-		reg = <0xa0000000 0x8>;
-		interrupts = <10>;
-		opencores,ip-clock-frequency = <20000000>;
-
-		reg-shift = <0>;	/* 8 bit registers */
-		reg-io-width = <1>;	/* 8 bit read/write */
-
-		dummy@60 {
-			compatible = "dummy";
-			reg = <0x60>;
-		};
-	};
-or
-	i2c0: ocores@a0000000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "opencores,i2c-ocores";
-		reg = <0xa0000000 0x8>;
-		interrupts = <10>;
-		clocks = <&osc>;
-		clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
-
-		reg-shift = <0>;	/* 8 bit registers */
-		reg-io-width = <1>;	/* 8 bit read/write */
-
-		dummy@60 {
-			compatible = "dummy";
-			reg = <0x60>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
new file mode 100644
index 000000000000..7074f019d94f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenCores I2C controller
+
+maintainers:
+  - Peter Korsgaard <peter@korsgaard.com>
+  - Andrew Lunn <andrew@lunn.ch>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu740-c000-i2c # Opencore based IP block FU740-C000 SoC
+              - sifive,fu540-c000-i2c # Opencore based IP block FU540-C000 SoC
+          - const: sifive,i2c0
+      - enum:
+          - opencores,i2c-ocores
+          - aeroflexgaisler,i2cmst
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. As only Standard and Fast
+      modes are supported, possible values are 100000 and 400000.
+      Note:
+      clock-frequency property is meant to control the bus frequency for i2c bus
+      drivers, but it was incorrectly used to specify i2c controller input clock
+      frequency. So the following rules are set to fix this situation:
+      - if clock-frequency is present and neither opencores,ip-clock-frequency nor
+        clocks are, then clock-frequency specifies i2c controller clock frequency.
+        This is to keep backwards compatibility with setups using old DTB. i2c bus
+        frequency is fixed at 100 KHz.
+      - if clocks is present it specifies i2c controller clock. clock-frequency
+        property specifies i2c bus frequency.
+      - if opencores,ip-clock-frequency is present it specifies i2c controller
+        clock frequency. clock-frequency property specifies i2c bus frequency.
+    enum: [100000, 400000]
+    default: 100000
+
+  reg-io-width:
+    description: |
+      io register width in bytes
+    enum: [1, 2, 4]
+
+  reg-shift:
+    description: |
+      device register offsets are shifted by this value
+    default: 0
+
+  regstep:
+    description: |
+      deprecated, use reg-shift above
+    deprecated: true
+
+  opencores,ip-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Frequency of the controller clock in Hz. Mutually exclusive with clocks.
+      See the note above.
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+oneOf:
+  - required:
+      - opencores,ip-clock-frequency
+  - required:
+      - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@a0000000 {
+      compatible = "opencores,i2c-ocores";
+      reg = <0xa0000000 0x8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <10>;
+      opencores,ip-clock-frequency = <20000000>;
+
+      reg-shift = <0>;	/* 8 bit registers */
+      reg-io-width = <1>;	/* 8 bit read/write */
+    };
+
+    i2c@b0000000 {
+      compatible = "opencores,i2c-ocores";
+      reg = <0xa0000000 0x8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <10>;
+      clocks = <&osc>;
+      clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
+
+      reg-shift = <0>;	/* 8 bit registers */
+      reg-io-width = <1>;	/* 8 bit read/write */
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..cfaf02fc9191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14869,7 +14869,7 @@ M:	Peter Korsgaard <peter@korsgaard.com>
 M:	Andrew Lunn <andrew@lunn.ch>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
 F:	Documentation/i2c/busses/i2c-ocores.rst
 F:	drivers/i2c/busses/i2c-ocores.c
 F:	include/linux/platform_data/i2c-ocores.h
-- 
2.36.1

