Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E41A4F05A5
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 20:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357150AbiDBSmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 14:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357100AbiDBSme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 14:42:34 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454604F469
        for <linux-i2c@vger.kernel.org>; Sat,  2 Apr 2022 11:40:27 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso3267426wmn.1
        for <linux-i2c@vger.kernel.org>; Sat, 02 Apr 2022 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ioo4qYHnBpK0bxlPRJXj59EcubEzOJoJqknqq3RnCBw=;
        b=xma+QvotMCwq4nd+T0G157q34QrtyX/iVRaUZgz9leMHEKtLfnGWtCQp1qauSyt8Oj
         xZty09uDqkupVvcrNaESq5Nik+Zoh0e8dZ3Dx8YlbNIgMIOF/nnxiwJTdUTgdxzzrute
         0fyVQVUC1+HecFIivTKLVoka9sQaTn8frreKf8BxLXcOGYe3fsol6PSCK7/sjycNRBka
         oZfeqyaNf796DBAyPBJf3SRBqJiqUumAUj6sXEK6D+7zuotYZmppvdETD5odmtIFWKnp
         /+MkcBXTotxDgZSFs0qfIsPJeTrlEg2kOLBHQAaGbG29ztAYkkyWjgMYRgu8zjVIKP20
         Jw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ioo4qYHnBpK0bxlPRJXj59EcubEzOJoJqknqq3RnCBw=;
        b=ApY8kbqsK/Zua2OCD0mBjlFcBENzrFJjF3sOuOrGjqzsi9dkA83gVlwI+hcFvnGPyZ
         0PxhdAEKfxH0HTkMpcstnyxmckY85JFyM8jlzQ72CNS8Qss7btM0wh5sCO8LsH3e3jbd
         XK05/tSwRTtNJFHRO4CWJjQFVxY+nNKVfYW/RIcSzQiV+zikXj+xznTKu3HkZvD99VAa
         10udTIJlo0VdOG/iGN5atzIw24uyZk1BQfezK0YtfZ0jvxamIn3B7Y57ZJyZ7ajVsIHA
         KoWsbFjLsGrYUKTk/mWMWNmDPsioq1ftRGJbIPoYKmeD1ySiW+TVz/p4M6VdubXvu9t4
         8+hw==
X-Gm-Message-State: AOAM531v1ihc56ZC4X06EycfVcjqjKKQ5XuQvgtbiLHZ44yhPEHzHe/I
        7CcKEqpiJG2tei+hKcOdYuO62g==
X-Google-Smtp-Source: ABdhPJzpCLjjgITs+9CV2ej1DV1wUHUNq1oeHEUvFhvgoGV8sGtKsUPTboSbrVztBQfDTSWpsae2Xg==
X-Received: by 2002:a05:600c:4f0f:b0:38c:c8f5:73e7 with SMTP id l15-20020a05600c4f0f00b0038cc8f573e7mr13045640wmq.201.1648924825831;
        Sat, 02 Apr 2022 11:40:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm6760502wmq.23.2022.04.02.11.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 11:40:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 8/9] dt-bindings: i2c: qcom,i2c-qup: convert to dtschema
Date:   Sat,  2 Apr 2022 20:40:10 +0200
Message-Id: <20220402184011.132465-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
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

Convert the Qualcomm Universal Peripheral (QUP) I2C controller to DT
Schema.

Add missing properties: dma and dma-names, pinctrl states (to indicate
support for sleep pinctrl).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
deleted file mode 100644
index dc71754a56af..000000000000
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Qualcomm Universal Peripheral (QUP) I2C controller
-
-Required properties:
- - compatible: Should be:
-   * "qcom,i2c-qup-v1.1.1" for 8660, 8960 and 8064.
-   * "qcom,i2c-qup-v2.1.1" for 8974 v1.
-   * "qcom,i2c-qup-v2.2.1" for 8974 v2 and later.
- - reg: Should contain QUP register address and length.
- - interrupts: Should contain I2C interrupt.
-
- - clocks: A list of phandles + clock-specifiers, one for each entry in
-   clock-names.
- - clock-names: Should contain:
-   * "core" for the core clock
-   * "iface" for the AHB clock
-
- - #address-cells: Should be <1> Address cells for i2c device address
- - #size-cells: Should be <0> as i2c addresses have no size component
-
-Optional properties:
- - clock-frequency: Should specify the desired i2c bus clock frequency in Hz,
-                    defaults to 100kHz if omitted.
-
-Child nodes should conform to i2c bus binding.
-
-Example:
-
- i2c@f9924000 {
- 	compatible = "qcom,i2c-qup-v2.2.1";
- 	reg = <0xf9924000 0x1000>;
- 	interrupts = <0 96 0>;
-
- 	clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
- 	clock-names = "core", "iface";
-
- 	clock-frequency = <355000>;
-
- 	#address-cells = <1>;
- 	#size-cells = <0>;
- };
diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
new file mode 100644
index 000000000000..f43947514d48
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-qup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Peripheral (QUP) I2C controller
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,i2c-qup-v1.1.1     # for 8660, 8960 and 8064
+      - qcom,i2c-qup-v2.1.1     # for 8974 v1
+      - qcom,i2c-qup-v2.2.1     # for 8974 v2 and later
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  clock-frequency:
+    default: 100000
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clock-names
+  - clocks
+  - interrupts
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@c175000 {
+        compatible = "qcom,i2c-qup-v2.2.1";
+        reg = <0x0c175000 0x600>;
+        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+                 <&gcc GCC_BLSP1_AHB_CLK>;
+        clock-names = "core", "iface";
+        dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
+        dma-names = "tx", "rx";
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&blsp1_i2c1_default>;
+        pinctrl-1 = <&blsp1_i2c1_sleep>;
+        clock-frequency = <400000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.32.0

