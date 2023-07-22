Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE75475DB93
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 11:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjGVJ5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 05:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjGVJ5Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 05:57:16 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836A5E74
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:57:15 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992af8b3b1bso438924366b.1
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690019834; x=1690624634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyKDRJkgNpqdQ6Lp+ez6Jz58IxlTBjt/lNLl3Cr0hHU=;
        b=C8xl8o0HfyCAiQQy6sXroqvzsUsViienqWCv2AcFrVv5AY1NcoPPAxw+7+N5C/pImo
         W90Ytyx+k/Vo+H0wt0kIRU3OQBFZejUG2uwTwSq6HjzPtP+sBdoLL0oR5DQYVtxLO9jB
         2EPeFj+KL187+y4RECG2MTuezhuQoTWLmlhyPjocjGHV3L0S62TEBAaEbfJ9RDg95zbC
         dySg9y+MdoROytCaZe+KJYhMyUHVnhFewjMuATJWPC6WjpO0TS7tk6dEpLxW5sx95O7O
         So3ILWLnRxDtE3MlL81UT9ccb9feADdUOVp2+eENGiOOBjYLGPNToNNUcma9C/Y2zkF5
         f7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690019834; x=1690624634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyKDRJkgNpqdQ6Lp+ez6Jz58IxlTBjt/lNLl3Cr0hHU=;
        b=Wtq0R65g5tFr6gwFsQBWMOeGTvotxiyMQkA73SWsO9a2wsQbYkAHyebtacqjPF21js
         t+edaXi7J8lY3oMb+GGzrrkDAAm5q2aDqS68IWQhzDk3i5vRYWxggzvRxatxeNiVz0Ce
         aUPtqTNrwvNnCtP8t9pmtmHz/NQ72wVG2Wa8bT3ofqJ9Nb4++TcXbNrLQsdmsAKholgK
         5qdHvakxfPHjBm8rWEYMrDqUXiw3Cwojymbvh2MwmCRKmb6t8w2ppE495USp9DXit+E2
         S0zTRE9/J65LmH2cU8AMc/tLKuTrA/RjXFQkhoajgR+n1pC3Lv3nVhdC4h758YLxeOGI
         wsng==
X-Gm-Message-State: ABy/qLaxyyc8sfTKmOpmMNtl/HXx+9p3Dv7UTeT1ASgmcGP8ZYT3Fi3l
        XchjrikzfixDjJcfV60jxtqFwA==
X-Google-Smtp-Source: APBJJlHoy+j8gBrdVp1q4DMm0RN6W5Prso7OXRda014campZdajHUv38DTwKwcyqTsoAVCfPySPxCw==
X-Received: by 2002:a17:906:74d6:b0:993:e695:b589 with SMTP id z22-20020a17090674d600b00993e695b589mr3747344ejl.20.1690019833926;
        Sat, 22 Jul 2023 02:57:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090648cc00b00992b7ff3993sm3281038ejt.126.2023.07.22.02.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 02:57:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT schema
Date:   Sat, 22 Jul 2023 11:57:09 +0200
Message-Id: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the bindings for NXP PCA9541 I2C bus master selector to DT
schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch (Doug)
---
 .../devicetree/bindings/i2c/nxp,pca9541.txt   | 29 ----------
 .../devicetree/bindings/i2c/nxp,pca9541.yaml  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
deleted file mode 100644
index 42bfc09c8918..000000000000
--- a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* NXP PCA9541 I2C bus master selector
-
-Required Properties:
-
-  - compatible: Must be "nxp,pca9541"
-
-  - reg: The I2C address of the device.
-
-  The following required properties are defined externally:
-
-  - I2C arbitration bus node. See i2c-arb.txt in this directory.
-
-
-Example:
-
-	i2c-arbitrator@74 {
-		compatible = "nxp,pca9541";
-		reg = <0x74>;
-
-		i2c-arb {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			eeprom@54 {
-				compatible = "atmel,24c08";
-				reg = <0x54>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml b/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
new file mode 100644
index 000000000000..b65c25c1a435
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nxp,pca9541.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA9541 I2C bus master selector
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+properties:
+  compatible:
+    const: nxp,pca9541
+
+  reg:
+    maxItems: 1
+
+  i2c-arb:
+    type: object
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description:
+      I2C arbitration bus node.
+
+required:
+  - compatible
+  - reg
+  - i2c-arb
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-arbitrator@74 {
+            compatible = "nxp,pca9541";
+            reg = <0x74>;
+
+            i2c-arb {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                eeprom@54 {
+                    compatible = "atmel,24c08";
+                    reg = <0x54>;
+                };
+            };
+        };
+    };
-- 
2.34.1

