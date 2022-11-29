Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD53A63C2FF
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 15:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbiK2OrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 09:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbiK2OrI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 09:47:08 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8E25B874
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:06 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso1123476wmb.0
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBiUrWwuuGLK6muO+p4UxsRMuSisu6TfPuhYR9/KcVs=;
        b=btAFXB5Xl4kCKcImulbHCBNx0FBTQ0jgsR7Wnuy9B5aaNW+MyWYAg/3pnJtkbqMiCQ
         vd0XTIv/J5OtEiltMBayX9S0UjAq02MpaHfzTKg4hoSljexvO2SN7rZm1Ih7INiUEMpe
         wpdecUm46rGOGG1Mg6ntcOyT01ITz+Pb+JzuxNBGjSRHsTWCsg+lVr1/ZhAPg9NQv0RD
         K7wiVXgrwNtU6hw1sPYn/JGmKx/Hu20TE88EjP/fHV1kZjpem0FNDI39IO3O1eOSXUfD
         eIog7nq0ysXP+IPi3cf1XCT3K+D35ko28qli8ONONrQqb4shE2mnT+Gm8+G+Hs6C/8NW
         jhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBiUrWwuuGLK6muO+p4UxsRMuSisu6TfPuhYR9/KcVs=;
        b=JdT1xT+6uv0a5Uyz6UkA5r5fHfO82ZiZ/Gh1oDtLMg2SNIuHRb2Qn5wm+kTKjpOLy0
         t1urHwL0YwBB0pn+ZkdRS94vf04k8O3ePJwuVbXD93ILjhYPWxBRaBmD7mSUr9irW+KX
         K+INWGTfqktaqMfR2gP5EP4MNgrPvynR+qDsRLPsZPOWwhFY9zOZGUuf9GMwPcu3BCCg
         S2UiaOjpSI+pMfGsaeiaN8YeaTBDg5y7SZsiX40Nk1OCNfeOilcWsKDMgmk9X2fftL7E
         j+7PQwfFKeXFoLHtaC7Hpu6qPw3DWp81vE1MRFCXu8OCNrgzwE7qMkzb/U+zgB/vWYL3
         aFtQ==
X-Gm-Message-State: ANoB5pm7yvHg9HamjFy754QoDoXoxRHC7gvb7otZS2SlSCz70yK5f0yU
        6RUXLRlfPM6SeXQml+LIPyfNYeRIllWviqji
X-Google-Smtp-Source: AA0mqf5R3/pLJNwgo1Y3EzpOdfJhTGQLeA+xHc2zaSTJJmVgYbJmpKl1SoZfez1u6MtNlJ/RXwbzvg==
X-Received: by 2002:a05:600c:384d:b0:3cf:7217:d5fa with SMTP id s13-20020a05600c384d00b003cf7217d5famr31122553wmr.191.1669733225099;
        Tue, 29 Nov 2022 06:47:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:04 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:02 +0100
Subject: [PATCH v3 2/6] dt-bindings: i2c: qcom-geni: document I2C Master Hub serial
 I2C engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-2-f6a20dc9996e@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

Document the I2C Serial Engine variant used within the I2C Master
Hub Wrapper.

This serial engine variant lacks DMA support, requires a core clock,
and since DMA support is lacking the memory interconnect path isn't
needed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 64 ++++++++++++++++++----
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 0e7ed00562e2..f5f7dc8f325c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -10,18 +10,19 @@ maintainers:
   - Andy Gross <agross@kernel.org>
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
-    const: qcom,geni-i2c
+    enum:
+      - qcom,geni-i2c
+      - qcom,geni-i2c-master-hub
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    const: se
+    minItems: 1
+    maxItems: 2
 
   clock-frequency:
     default: 100000
@@ -35,13 +36,12 @@ properties:
       - const: rx
 
   interconnects:
+    minItems: 2
     maxItems: 3
 
   interconnect-names:
-    items:
-      - const: qup-core
-      - const: qup-config
-      - const: qup-memory
+    minItems: 2
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -71,6 +71,50 @@ required:
   - clock-names
   - reg
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,geni-i2c-master-hub
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: se
+            - const: core
+
+        dmas: false
+        dma-names: false
+
+        interconnects:
+          maxItems: 2
+
+        interconnect-names:
+          items:
+            - const: qup-core
+            - const: qup-config
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          const: se
+
+        interconnects:
+          minItems: 3
+
+        interconnect-names:
+          items:
+            - const: qup-core
+            - const: qup-config
+            - const: qup-memory
+
 unevaluatedProperties: false
 
 examples:

-- 
b4 0.10.1
