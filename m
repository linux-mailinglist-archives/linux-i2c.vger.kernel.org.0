Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AA47463D6
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 22:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjGCUPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 16:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjGCUPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 16:15:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E8B10C1
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 13:15:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba86f069bso4310182e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688415333; x=1691007333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zw6wxQsp3ppsN0NYmVnswHP22+wvONtC2zjsX1wOzhI=;
        b=kg05hnSw+C0fw5X3QKM5EJqFl/E67tosGc7qEsUBd1uESSjUJoinl/1Cq8Ia9Y3ltL
         qqGg5SKRLiq15m77niL/simEGBrQP2ADQ1bwoAm1SFyU+LAcuDpAoV9w/WREOlI9oApT
         wCTeixf950CbSKvo5ZdSYRbjEUd0kxQ6K37rfyVRBq2AmNo3XaS2fS3m5Sm6YHjr8Tif
         BnozIrjt2LqkmgXqinHKagpO8YV8sY7b29nvGzl8Pf1KiAMkkXPM+2iMBf8NnWd+pQjC
         HOUBkhTdDvCdrna87Xyngu66JjyOIqILTpVTRgNmwelWTs2dA1t52ooq52E/qFpG2sA6
         22qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688415333; x=1691007333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zw6wxQsp3ppsN0NYmVnswHP22+wvONtC2zjsX1wOzhI=;
        b=BBAYiQpvL5ZOOBRiO6GIHkFjcKhq/rq2IHYsovAglPRYzZ7OiUxyXNRMD5PgqOpvOV
         Cq0HAA/XBMG2rIhi1S0HWqJPeIa1Yy7U5BhR1S3n1YqA0GarR7Fq4vQaqP7ZWkqZheJ1
         ysWIcbsl1xH7YEO/pGjuoxOz94x3eWBj4kbAjOaPROyBlLsfn6hozPKicZYpfIgry1it
         Di5ot747YnJYVp7Tldx5ZM7sau3fHxq++O3d4qnAP0rftymSkqABQPyskNEEPkWGSYmf
         gSB4hBBOV4jTMbHHkNo7O7fuNoUovx+nwo6/TiC5PByXckeuC5O+Hm/QaVXfJ3zpQsKR
         MwmQ==
X-Gm-Message-State: ABy/qLYarpTDyYA7iY52BVkQyMB8rHrqrbZMl7BhEzCEqOvfjKRHg+g0
        0AnaNVK3NXhYPVdyaDL/OnQRIQ==
X-Google-Smtp-Source: APBJJlEB2cpeUZXP7bFDXqxJwdwsLbkdpi4ohSagacd8cGXfV47jbplH/u+UU+20PuEMyM7b0yv1WA==
X-Received: by 2002:a05:6512:2386:b0:4fb:8987:734e with SMTP id c6-20020a056512238600b004fb8987734emr8489743lfv.68.1688415333183;
        Mon, 03 Jul 2023 13:15:33 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id w27-20020a05651204db00b004fba7edc6cesm1991365lfq.7.2023.07.03.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 13:15:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 22:15:25 +0200
Subject: [PATCH v2 1/4] dt-bindings: interconnect: qcom,rpmh: Add SM8250
 QUP virt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v2-1-9ba0a9460be2@linaro.org>
References: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688415328; l=1408;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EJ6eYxYacI/Fn0L+Te5iXNWv+IZ55D6VGRpRhOsYXw4=;
 b=Z1+5MuvegjQGm8/+jMIqIUlKRUaWugEZZIZpTzfJN7oMOHqyb0mfrwiPosIyVdrQOf4gU1brJ
 AkmxNnnbsD6Ax/vYIsfVqx25uu6KxmAvCdjU6uHAaODWJ9pwC24PI53
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the QUP virtual bus on SM8250.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/interconnect/qcom,rpmh.yaml    | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index 4d93ad415e0b..a46497af1fd8 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -18,9 +18,6 @@ description: |
    least one RPMh device child node pertaining to their RSC and each provider
    can map to multiple RPMh resources.
 
-allOf:
-  - $ref: qcom,rpmh-common.yaml#
-
 properties:
   reg:
     maxItems: 1
@@ -91,6 +88,7 @@ properties:
       - qcom,sm8250-mc-virt
       - qcom,sm8250-mmss-noc
       - qcom,sm8250-npu-noc
+      - qcom,sm8250-qup-virt
       - qcom,sm8250-system-noc
       - qcom,sm8350-aggre1-noc
       - qcom,sm8350-aggre2-noc
@@ -107,7 +105,19 @@ properties:
 
 required:
   - compatible
-  - reg
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            enum:
+              - qcom,sm8250-qup-virt
+    then:
+      required:
+        - reg
+
 
 unevaluatedProperties: false
 

-- 
2.41.0

