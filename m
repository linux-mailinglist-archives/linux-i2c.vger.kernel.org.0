Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E79662B7BF
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbiKPKWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236546AbiKPKVw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:21:52 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8379A21273
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:51 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bs21so29132430wrb.4
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSVWFwlfT1R0XiTLF2nwbR5ZrhzAtrkx1WJmlAjyhZw=;
        b=x8/Nh7PNQPl0JPgz1FPnoyB8tVf315HDN4l8JhIQoTrK2o4UrXz0OhldFesWs9j/bk
         NP4tyinpXGmQXGYivleJC6LvK2b5a5mi880xptmhkedFvOdg+99bt2NqDXT6++hSnRPO
         YBBsT/zes/4NEx8fQs7yrC2ZPzHGNIPx2ttFitygqDgLSGLMVG+vWnP0h6BoHTlTKrvB
         IA52vvfCXJm8+rTbIV6LBSSvEObIixFY/TnOO13DZlXT3dGM5UWhNRM02HIHX67TJKYF
         a7we3OerjfHyvJBlJOT50tPwnKpSxpoBij83jXyTIZVb2SN9c/CJ5o4/kizau7G5L9mc
         5dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSVWFwlfT1R0XiTLF2nwbR5ZrhzAtrkx1WJmlAjyhZw=;
        b=PbYAIpAkTl6gCZROEXTQoIjyMH1fS8YcL5G9xu92IUsrpuLa5HMR2cXHww35ZHjlTU
         0bJFs1OOmdf4eHEEhZxCHX4JRJVUMNsPSxeJGOAePYg5VZXzTKUPtWH74H9FdF+rFAE0
         48gPY5UDQTugL4MF5sB9c4+2tQaGgZLMPmYZwWUCYqcV6phKGfYZHu+qXmfgh2lZC8S6
         LThm0c6BsPKlRqbh5mI6AK1Mer6MbUCLxLqHZhtksi6wkoztHTMTcn/+M69lmQxWu4xv
         Z2KunKmbhUZ4eukdIr2aGOV19DpwL807FggCChoXpPECyoWNUHaw7AG4E9ueLy1I8u4u
         6ZvQ==
X-Gm-Message-State: ANoB5pmPtYS9Sgt+tVAfezRvOp1kjLqQBpp3Z1EOcOWv0e7uEXc0xa2Z
        oHJRmujNJrU/9zFqEOLP1LysCg==
X-Google-Smtp-Source: AA0mqf6o6qn/vwQRLAF3VvQYf1m2ozi/t0KjXMCL1uTOiIaI55mGLadKwa5eu6NzuymWaGKOOhPXhg==
X-Received: by 2002:adf:f6ca:0:b0:236:6e2a:ac12 with SMTP id y10-20020adff6ca000000b002366e2aac12mr12931127wrp.366.1668594110063;
        Wed, 16 Nov 2022 02:21:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:49 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:48 +0100
Subject: [PATCH 1/6] dt-bindings: qcom: geni-se: document I2C Master Hub wrapper
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-1-64449106a148@linaro.org>
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

This documents the variant compatible and forbids UART and SPI sub-nodes,
and removes requirement for the Master AHB clock and iommu property.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 43 ++++++++++++++++++----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 2bf5293fc995..6657e74df629 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -21,20 +21,15 @@ properties:
   compatible:
     enum:
       - qcom,geni-se-qup
+      - qcom,geni-se-i2c-master-hub
 
   reg:
     description: QUP wrapper common register address and length.
     maxItems: 1
 
-  clock-names:
-    items:
-      - const: m-ahb
-      - const: s-ahb
+  clock-names: true
 
-  clocks:
-    items:
-      - description: Master AHB Clock
-      - description: Slave AHB Clock
+  clocks: true
 
   "#address-cells":
     const: 2
@@ -81,6 +76,38 @@ patternProperties:
     description: GENI Serial Engine based UART Controller.
     $ref: /schemas/serial/qcom,serial-geni-qcom.yaml#
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,geni-se-i2c-master-hub
+then:
+  properties:
+    clock-names:
+      items:
+        - const: s-ahb
+
+    clocks:
+      items:
+        - description: Slave AHB Clock
+
+    iommus: false
+
+  patternProperties:
+    "spi@[0-9a-f]+$": false
+    "serial@[0-9a-f]+$": false
+else:
+  properties:
+    clock-names:
+      items:
+        - const: m-ahb
+        - const: s-ahb
+
+    clocks:
+      items:
+        - description: Master AHB Clock
+        - description: Slave AHB Clock
+
 additionalProperties: false
 
 examples:

-- 
b4 0.10.1
