Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C8C64BC05
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 19:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbiLMSdP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 13:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236227AbiLMSdN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 13:33:13 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC44E22520
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 10:33:11 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bp15so6318211lfb.13
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ5jI0G4hX1A08XO49d5+/bf9foafrkt0On/sCJEiuI=;
        b=NfSwsj6XvoFxdC/s4diqxFkK2YNi3BX95XD5jRwysWJvH3h/5IIZ84QEa4LZH6Mqbr
         6JIw81N3A94mZD4zT2VhIjKbm1ieNnS+klB525lr7jc5yT4BpboI+nUCAkbaUdS2OpeK
         1igp3rHVAzAbwCcL8bZTu3Q07hvB5odntYLjjMZF4Zx0S1b3IjDxqaQake8666uyoDdP
         TXwoUrZklmyxluTZ9z4gOcWGLDhQgvOFenPo4A3GaT2hwM1keV4mDZM80FoHYG28Ebj6
         GU71MghU2XMUGgjGg4qQ+SZkcs6iPwlfuiKUVdLCdHzJ97Mfkd0bWhPCLsvZbaQIylAb
         qxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ5jI0G4hX1A08XO49d5+/bf9foafrkt0On/sCJEiuI=;
        b=SbRw1+yPW8FLM14FFYAt6H87PXiZaautK+CIQ6qaPHwzblxTbr4sHZCr+wkjhhq9G7
         bkR757Wy3nk3EjQIgy/8VHCyAjaFsztCTdmvCbE47As8rdYbMBSLn+wiAsg+1eo3CRta
         kvlqq0hkst8O0JnRk7z+rwM2FQZR16YsX0V5jjzwarRkWzm1K75V+w8xbGJeyaMAwt8i
         mE2BD8yjELOlYL5/8g9FO+QXjyvxnsz+/FTgWUzjdVTBJLk2ppWhVogIT2Bb4w9Pv+Yv
         QcC5pp9CrIVOiF3CKcCRmkw5oJPTM0bBe5TyqrEUG/vCQ5BsrDHXHYwkupl4qjpDGFop
         uA+A==
X-Gm-Message-State: ANoB5pkaH7aQHxrLpPP+kq7Z/ZhSaVFL5TKiHmNvdtqNYgZJnS25LS5U
        gEPKRgrA6xTxmeOJqHUai1xhKg==
X-Google-Smtp-Source: AA0mqf5PosCgjZuIMDn413vUNIRDY6kkEVRGUNZYkcg0aJE90noLrihl+JuV0j8tLeB9BwK18weaWw==
X-Received: by 2002:ac2:52b9:0:b0:4b5:83ba:8c55 with SMTP id r25-20020ac252b9000000b004b583ba8c55mr5363905lfm.8.1670956390178;
        Tue, 13 Dec 2022 10:33:10 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b004b501497b6fsm465963lfr.148.2022.12.13.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:33:08 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: i2c: qcom,i2c-cci: Fall back to common compatibles
Date:   Tue, 13 Dec 2022 19:33:00 +0100
Message-Id: <20221213183305.544644-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Almost every compatible string in the CCI driver is a duplicate. Adjust
the bindings to include a common (first-soc-implementing-vX) compatible
to remove the need to keep adding superfluous compatible strings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- make sure the actual patch contests are tested..
- resolve errors

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 47 ++++++++++++-------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index cf9f8fda595f..87e414f0c39c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -12,14 +12,23 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8226-cci
-      - qcom,msm8916-cci
-      - qcom,msm8974-cci
-      - qcom,msm8996-cci
-      - qcom,sdm845-cci
-      - qcom,sm8250-cci
-      - qcom,sm8450-cci
+    oneOf:
+      - enum:
+          - qcom,msm8226-cci
+          - qcom,msm8974-cci
+          - qcom,msm8996-cci
+
+      - items:
+          - enum:
+              - qcom,msm8916-cci
+          - const: qcom,msm8226-cci # CCI v1
+
+      - items:
+          - enum:
+              - qcom,sdm845-cci
+              - qcom,sm8250-cci
+              - qcom,sm8450-cci
+          - const: qcom,msm8996-cci # CCI v2
 
   "#address-cells":
     const: 1
@@ -88,10 +97,12 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,msm8226-cci
-              - qcom,msm8974-cci
+          oneOf:
+            - contains:
+                enum:
+                  - qcom,msm8974-cci
+
+            - const: qcom,msm8226-cci
     then:
       properties:
         clocks:
@@ -105,10 +116,12 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,msm8916-cci
-              - qcom,msm8996-cci
+          oneOf:
+            - contains:
+                enum:
+                  - qcom,msm8916-cci
+
+            - const: qcom,msm8996-cci
     then:
       properties:
         clocks:
@@ -169,7 +182,7 @@ examples:
 
     cci@ac4a000 {
         reg = <0x0ac4a000 0x4000>;
-        compatible = "qcom,sdm845-cci";
+        compatible = "qcom,sdm845-cci", "qcom,msm8996-cci";
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.39.0

