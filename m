Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD8364B491
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 12:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235397AbiLML5P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 06:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235495AbiLML4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 06:56:35 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F49F265E
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 03:56:33 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id v11so3011720ljk.12
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 03:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WSa5YG1jZqcHIsQqtvI5oWLoQrCTutP6LxjZjnHFZc=;
        b=iCOyGQ2kbacZcy43TpWKZ+7380PIwooK2kzfhDsH2/44Lvy3wn8YS9XwtmvVotm/l6
         NrGV4DwlUZmD2+NGYFTRGwnwrxt21PY2l8nFHTJTxm9dGxptcKdWYWKYXY7OYB2LdMiP
         frYWQjFzldLXR80Klearv7+W1glUcOArqG7ZdZtBqoKvrucimDxG05RLiC6ZaPdsv4ug
         zZ7DT23OxkVX0kQ72YFbwU1uyOnKMDaR/++yv239/+2uJbFrVjFqUMvjdF9UxcpvRo9k
         F0EHXRNQa6NEOOOeuZnHcHfJdolcL2ScZjZN+6rnkfz613nyE1OkoTZkS37HVu6vvacs
         JEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WSa5YG1jZqcHIsQqtvI5oWLoQrCTutP6LxjZjnHFZc=;
        b=6D6QS4WA+X5DGHRV2Y7MIkCF5b+OxP+VmrUnTXm3GCWkWdvACwwKchhVFQUns/4lg5
         6lYpmu6jmVp6d2/q2XiVau4lTPYqq4swpW3YxqhCqmzGmuByLBgb1z69Ge/Krrdbsv7J
         EQGrxDlxn8Q8eCziLZYrxlHdMCDToLo9X99T2dNtS8RChMAHezHQRoy7qdvkcOylvaOq
         tt45HFY+kg3KYebZcW+MS7yowdKwVlZDvWA+6bXprzamO8b+bwSqFOcpUYSxLahPoPxa
         Qf+rkL5Ag0Ws1oEUODizQEBO6ZPzhAVKjOeYrhj8bG+6McF0QON+HGZju9YHM/I/h5qb
         vwSw==
X-Gm-Message-State: ANoB5plJKnm6bX1Wv5KEsVYOuUX7pLASxHX+fkl4iC/XqvkkW3c2UwHF
        Xi/nxKU+VO7o9LhS4h70jhG/oA==
X-Google-Smtp-Source: AA0mqf6ChXZfr6yeU+E61wLJwlKqL2Pk9XG9Z7kOZivDCk4SZpS8RfDvaC6Gc5ABVG2j5hA0TKBlTA==
X-Received: by 2002:a2e:b4ab:0:b0:27a:25f:b274 with SMTP id q11-20020a2eb4ab000000b0027a025fb274mr4392242ljm.42.1670932591705;
        Tue, 13 Dec 2022 03:56:31 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b0026daf4fc0f7sm234573ljs.92.2022.12.13.03.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:56:31 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: i2c: qcom,i2c-cci: Fall back to common compatibles
Date:   Tue, 13 Dec 2022 12:56:25 +0100
Message-Id: <20221213115628.105149-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index cf9f8fda595f..65cf7860a9a0 100644
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
-- 
2.39.0

