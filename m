Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D32D648794
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 18:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiLIRRh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 12:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiLIRRS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 12:17:18 -0500
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BC045A1D;
        Fri,  9 Dec 2022 09:17:17 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id k189so5096792oif.7;
        Fri, 09 Dec 2022 09:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMBuVhBHS0jHtLV+aR0IQuxXasCsPmFMNayhRP4j9C8=;
        b=KKulut4lQ3RoXnxR2xdjKmJ0SYQQzMCbkNg85JSnc94HD1SI+KHmlSoFT/gCgIFw0P
         mIPVToyn/e+P/REChOxYPbiz4OrhfA4xbTULOxmNljQvZP00I37+Y8oo2kfkb5iOQI1Z
         F8ger2wRRd4XfyLqHBDXQ0TW6Na8IxK27UtDolk9oL6MrWYdlGkSuK3u6oF1eOTtwS+X
         4FXAAsHQ6ymc3nb4lOozeez2rXBCkGk71yoZiyk5C8CqERH2yJnyZw2myHxNbuZKnlCu
         EXJCBXWHPykNhtMh6FOxux+GlRSw/kjMtNwDjReKvLYNFZTjXzz9ajwZaBnzdfK69MrC
         7KQQ==
X-Gm-Message-State: ANoB5pnrzboLQffvZxJkJH+hwX5n2s9lriTcyfZjnaqQwyKi/J0GB5L1
        cOID458B+WpJcj7GlUoHFChVCYrQNw==
X-Google-Smtp-Source: AA0mqf5sonxarP8TI3UHM2uogivCAG62YPejwhf6QL1TqmMGofoDu6YDghcK6yD9Yz3MbM8BmjtGWQ==
X-Received: by 2002:a05:6808:48a:b0:35b:efb4:add5 with SMTP id z10-20020a056808048a00b0035befb4add5mr3144370oid.50.1670606236324;
        Fri, 09 Dec 2022 09:17:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s11-20020a056808208b00b0035bd65b776bsm722456oiw.2.2022.12.09.09.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 09:17:16 -0800 (PST)
Received: (nullmailer pid 3352527 invoked by uid 1000);
        Fri, 09 Dec 2022 17:17:15 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: Convert Synquacer I2C to DT schema
Date:   Fri,  9 Dec 2022 11:16:57 -0600
Message-Id: <20221209171658.3352119-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Socionext Synquacer I2C binding to DT schema format.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-synquacer.txt | 29 ----------
 .../bindings/i2c/socionext,synquacer-i2c.yaml | 58 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-synquacer.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/socionext,synquacer-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-synquacer.txt b/Documentation/devicetree/bindings/i2c/i2c-synquacer.txt
deleted file mode 100644
index 72f4a2f0fedc..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-synquacer.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Socionext SynQuacer I2C
-
-Required properties:
-- compatible      : Must be "socionext,synquacer-i2c"
-- reg             : Offset and length of the register set for the device
-- interrupts      : A single interrupt specifier
-- #address-cells  : Must be <1>;
-- #size-cells     : Must be <0>;
-- clock-names     : Must contain "pclk".
-- clocks          : Must contain an entry for each name in clock-names.
-                    (See the common clock bindings.)
-
-Optional properties:
-- clock-frequency : Desired I2C bus clock frequency in Hz. As only Normal and
-                    Fast modes are supported, possible values are 100000 and
-                    400000.
-
-Example :
-
-    i2c@51210000 {
-        compatible = "socionext,synquacer-i2c";
-        reg = <0x51210000 0x1000>;
-        interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-        clock-names = "pclk";
-        clocks = <&clk_i2c>;
-        clock-frequency = <400000>;
-    };
diff --git a/Documentation/devicetree/bindings/i2c/socionext,synquacer-i2c.yaml b/Documentation/devicetree/bindings/i2c/socionext,synquacer-i2c.yaml
new file mode 100644
index 000000000000..f9d6e2038bb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/socionext,synquacer-i2c.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/socionext,synquacer-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Socionext SynQuacer I2C Controller
+
+maintainers:
+  - Ard Biesheuvel <ardb@kernel.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: socionext,synquacer-i2c
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk
+
+  clock-frequency:
+    minimum: 100000
+    maximum: 400000
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@51210000 {
+        compatible = "socionext,synquacer-i2c";
+        reg = <0x51210000 0x1000>;
+        interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clock-names = "pclk";
+        clocks = <&clk_i2c>;
+        clock-frequency = <400000>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..cf5a58bac7f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19044,7 +19044,7 @@ SOCIONEXT SYNQUACER I2C DRIVER
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-synquacer.txt
+F:	Documentation/devicetree/bindings/i2c/socionext,synquacer-i2c.yaml
 F:	drivers/i2c/busses/i2c-synquacer.c
 
 SOCIONEXT UNIPHIER SOUND DRIVER
-- 
2.35.1

