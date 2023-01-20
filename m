Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9E3675576
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 14:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjATNSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 08:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjATNSf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 08:18:35 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBC1C41DE
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:14:53 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ss4so13785306ejb.11
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=031w1g9Y5G2a1Xr/z7EdzNKTzhiIoWJq1q3UhyHxNMk=;
        b=hjhSK/azGy6/8bHlJ36i3bsWkmf7nBMd/TaTMlbpWpkf5BHUzAS+W4FnI2FVT5gmlR
         aPG5xxtLBO4AuU1ncz6zDn4FIjN1a3/OQs+iCGGtsRBDIWNolX+58WEGA3N944/pgCS1
         0ptgjvIhYL1ijkt3qnYfFr3wEJq2piFDJZpFNLcxxUdxOMu4POh6fJ4V1Fasskv84Mj8
         JJP/pJPsym0dd3nCdtDPzdRlm2UHgYW7tCTGzx3nFb3XvWcPSJK+rnaKuGOAcGQe9N/m
         YGfiofAv7F5KgTa1nGT0tc+Q3HKmsFp40tBU9RqElL9+24QUIa5QR68e/A6nt9gxWO8a
         AyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=031w1g9Y5G2a1Xr/z7EdzNKTzhiIoWJq1q3UhyHxNMk=;
        b=pk3IxRAi0mqMSjQSuK5uh6h+BcXbNOeH6z4VzhBgnHyEgVATbsGDg4pqeT8sFZc/rS
         WvNuQSy5RUZnE33wChytoEdsHhBAZ1Kb25duR1e4wqxDac/dctxmScNoKEXBljQvrnAB
         0uIF6nmpCAN+tJ2/6nGIacTfSkDg9P4EkRLib8c499yO5lkbifx5nL262J50evBMEmZD
         ib3swuAgRhNcPTsmOQQsva5DCmze+izTnfrm0XdDYk/duuTrkSvqPzVYm6MjP2PTgbue
         Q/3KmCFr5NgVrluda2jqQ46MD9c+muu3gGg7aUVR24xzdS/x938Rw74jwLb12V7lFJuW
         7dBw==
X-Gm-Message-State: AFqh2kpTwXjCnN3xtODmcjIt99aWwT6TzAgx5G36GWK+CDNZfmH36vis
        W9cUf7j/7AsfsGCkLdVi6px8GQ==
X-Google-Smtp-Source: AMrXdXuIXbFX/5M5zW9GdKZmjUZ3xfV0D1QO3DSGLjENqCzrRFFaRRvPqHuh98H+c2o9c9R6ZkDS9A==
X-Received: by 2002:a17:906:358f:b0:829:6064:bc52 with SMTP id o15-20020a170906358f00b008296064bc52mr14368169ejb.74.1674220491895;
        Fri, 20 Jan 2023 05:14:51 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:51 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 14:13:44 +0100
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document SM6350
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v2-1-15c2c14c34bb@fairphone.com>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12-dev-78462
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the compatible for the CCI block found on SM6350 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 87e414f0c39c..ec79b7270437 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sdm845-cci
+              - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
           - const: qcom,msm8996-cci # CCI v2
@@ -139,6 +140,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-cci
+              - qcom,sm6350-cci
     then:
       properties:
         clocks:

-- 
2.39.1

