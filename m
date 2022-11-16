Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA8362B7CD
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237263AbiKPKWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236947AbiKPKVx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:21:53 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4492C20F55
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:52 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id k8so29155309wrh.1
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzVAeZmGHVgJEk1mN8aP1HtyXLkmqX2nhQXPCT6cTuU=;
        b=PY6DbNBtnIrOC0If+NnbwkXi4lEoiLW4JHS2tZW1xdp3TZKdRUhJKKypyDtK9OZ2Ql
         jNm1YMnQscrg9tVYX+9N0xwnHgYGCv4zKyCqPXcN27CjMF4OO8WM6DkQ8lHuEsfoUVkJ
         Nu25gyIND2qWn/dPbNj58E8FzyD6/FypBhWB9iboODRFstHEl74Px4ooIRHr1oAgrh8k
         NiEcB2PJFladkoi2+0swKCfuh4Zi6wO/iJkz6j56e61v/kv0Z2VtYMC51AJZLwj3gA0O
         kSo8ii5v3eAm0hClrCkB4qnL2XXFF4qjEDYyAXvjsMP82MsiFQ/Usr8igLM9pxjeJklC
         k+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzVAeZmGHVgJEk1mN8aP1HtyXLkmqX2nhQXPCT6cTuU=;
        b=xWlNphRnYAdJ+ck71gda5bJduRe1aX/YrJz1HjfnVTMIkV7xJ4INSS5Q8lgKpFyIK6
         DoZxUhviURhmcEfUXnLVeOPXBw5qE8h8otz8rDhnoAX8swSTVenFQ2kRl8dBkJriZcH/
         FADgT9d4nF8I2yQQevl01K83imD6xRUinXe6kWNjXlhuDJvl62Gu1Bh74adYYgOwvk+r
         XQItrDwX6BxKKeRg8LDLdKdnWju1utQIZA3iLheIu42DW2TOkilnPx4dg5JWh6gloBfd
         gHKVd0c8+ZTivSkeGyX+uFsI9BDBMSiOtdtKD5lRWVzafrlQBMRIYjTd+PlWAkbIMs7j
         JK+w==
X-Gm-Message-State: ANoB5pk/XEfZ/Fk5tRvwdiaRGfR15Oc3Ww1mD3tbkaPCA+ixckWjZd6s
        il726AEJmlRdxQYQ1g46WXOXAQ==
X-Google-Smtp-Source: AA0mqf6akapjvVkRRkk1Oq7XXlxEh+w40Xf9NT20bvT8pFibvOl6oGNNKwAXpNBJxUckfGdG6x2M6Q==
X-Received: by 2002:adf:b19d:0:b0:236:6fb2:ff91 with SMTP id q29-20020adfb19d000000b002366fb2ff91mr12948000wra.520.1668594110852;
        Wed, 16 Nov 2022 02:21:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:50 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:49 +0100
Subject: [PATCH 2/6] dt-bindings: i2c: qcom-geni: document I2C Master Hub serial
 I2C engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-2-64449106a148@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

This documents the I2C Serial Engine variant used within the I2C Master
Hub Wrapper. This serial engine variant lacks DMA support, and requires
a core clock, and since DMA support is lacking, the memory interconnect
path isn't needed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 61 +++++++++++++++++-----
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 0e7ed00562e2..ea2c28e70cf5 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -15,13 +15,13 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-i2c
+    enum:
+      - qcom,geni-i2c
+      - qcom,geni-i2c-master-hub
 
-  clocks:
-    maxItems: 1
+  clocks: true
 
-  clock-names:
-    const: se
+  clock-names: true
 
   clock-frequency:
     default: 100000
@@ -34,14 +34,9 @@ properties:
       - const: tx
       - const: rx
 
-  interconnects:
-    maxItems: 3
+  interconnects: true
 
-  interconnect-names:
-    items:
-      - const: qup-core
-      - const: qup-config
-      - const: qup-memory
+  interconnect-names: true
 
   interrupts:
     maxItems: 1
@@ -71,6 +66,48 @@ required:
   - clock-names
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,geni-i2c-master-hub
+then:
+  properties:
+    clock-names:
+      items:
+        - const: se
+        - const: core
+
+    clocks:
+      maxItems: 2
+
+    dmas: false
+    dma-names: false
+
+    interconnects:
+      maxItems: 2
+
+    interconnect-names:
+      items:
+        - const: qup-core
+        - const: qup-config
+else:
+  properties:
+    clocks:
+      maxItems: 1
+
+    clock-names:
+      const: se
+
+    interconnects:
+      maxItems: 3
+
+    interconnect-names:
+      items:
+        - const: qup-core
+        - const: qup-config
+        - const: qup-memory
+
 unevaluatedProperties: false
 
 examples:

-- 
b4 0.10.1
