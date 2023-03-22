Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370C36C5292
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 18:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCVRgC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 13:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCVRgB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 13:36:01 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04D15FEA4;
        Wed, 22 Mar 2023 10:35:46 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id x24-20020a4aca98000000b0053a9bbbe449so2047670ooq.9;
        Wed, 22 Mar 2023 10:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP1sW3nJE9MVZhrW5r4ts+qmYu6aKy1OmzkcJUxDVNQ=;
        b=oH8uORHQoFEUMzLNXzbPiA1a/i8Kx+ARu4VDrpakjR/aMFklDnjFE2+bESmm0KOhDi
         UvpwFyyI75KCiC/KbfjXm4urrf+9Qx4q7ylPPtOTvm++adyhGhP0TbNWZaTlytla8cl9
         Di5GDgrv69F6G9Kd/Kpj9bJ3/hoP3eEeZPId0vP/8jGtNqB4ukOZnwUcVWrBRwaKY/c1
         GCymUsUMbuT+dLpW9HRCTbVbrXlYQLArUeafDZgTon3lcU+mqaf2mO2rP9TQ2tAlVw9o
         xRhORVdGGoGT+dXCda4xmvE5VZkUq7bPuZZxF3SSVJqRRI+p7nngCUFdsTS1RIQzCNAf
         JXIg==
X-Gm-Message-State: AO0yUKVsFAsV93TRiiFBplbemaZ+G8PRFfvuUEgByslrg/T8CI6mhNgw
        HilEqE7Yzk/RQmL5SpF/xw==
X-Google-Smtp-Source: AK7set/jXbBcjuyv1m10lynYpyrfOghoXTVkbpUws5+s70kRjos9BtEeTkTxF9xl5t/gOkuwVLUEOw==
X-Received: by 2002:a4a:41ca:0:b0:53b:4b21:2345 with SMTP id x193-20020a4a41ca000000b0053b4b212345mr1650879ooa.2.1679506545888;
        Wed, 22 Mar 2023 10:35:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d18-20020a9d5e12000000b006994465665asm6524891oti.80.2023.03.22.10.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:35:45 -0700 (PDT)
Received: (nullmailer pid 3972017 invoked by uid 1000);
        Wed, 22 Mar 2023 17:35:44 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Date:   Wed, 22 Mar 2023 12:35:29 -0500
Message-Id: <20230322173530.3971676-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index 199a354ccb97..26bed558c6b8 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson I2C Controller
 
diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 4ac61fec90e2..243da7003cec 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Apple/PASemi I2C controller
 
diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index ea2303c0e143..6adedd3ec399 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -75,7 +75,7 @@ required:
   - clocks
 
 allOf:
-  - $ref: "i2c-controller.yaml"
+  - $ref: i2c-controller.yaml
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 2e95cda7262a..7a675aa08c44 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Cadence I2C controller
 
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
index 6e0a5686af04..f34cc7ad5a00 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
@@ -45,7 +45,7 @@ properties:
 
   i2c-parent:
     description: phandle of the I2C bus that this multiplexer's master-side port is connected to
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
 
   mux-gpios:
     description: list of GPIOs used to control the muxer
@@ -55,7 +55,7 @@ properties:
   idle-state:
     description: Value to set the muxer to when idle. When no value is given, it defaults to the
       last value used.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
 
 allOf:
   - $ref: i2c-mux.yaml
diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 0e88c85985b5..9f66a3bb1f80 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Geni based QUP I2C Controller
 
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index bf396e9466aa..94b75d9f66cd 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -90,7 +90,7 @@ properties:
   st,syscfg-fmp:
     description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
       Plus speed is selected by slave.
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: phandle to syscfg
diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 1b598638d457..658ae92fa86d 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Xilinx IIC controller
 
-- 
2.39.2

