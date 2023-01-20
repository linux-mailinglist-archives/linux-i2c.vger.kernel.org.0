Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4241675328
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 12:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjATLMe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 06:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjATLMb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 06:12:31 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F540B4E31
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:29 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id hw16so12990369ejc.10
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUNnBMHo4V/m1/iebYt9qbsuAZO+R7zPmq+6nrO1qh0=;
        b=cNRbRedeHdO39FShA6LTqR7IJduMzEJgbqDann74gwZjhlDGfsd4+Eyk9HeWc8kxtk
         m3NwCX+05bAl/9FQC6WI4Fpg32wSkvHkBrAesVpSVK+LkR/0kulzecI8NXTomNvgYB7O
         YjUCpCy25UPGECw4DNw93m9SUgOSSGY30AgN2sN6tvERNvm0kYhfmMZ1KVo138Y2dVib
         bLXZK7duSkg7I+ouq6wgS0wVNb1Cfw0ciOdP5+lYE/RT5ZC/6w3j/BxAUcQ40KN0mQ+l
         /+ZTS33eLdszOnEbl9x554yXW7Kby4EZXbqU1RhyRJnbrKu8T1k/ZnM1FC6Fu1lA2V0e
         zpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUNnBMHo4V/m1/iebYt9qbsuAZO+R7zPmq+6nrO1qh0=;
        b=6PMLqy4qReJTvZ8q1utIxw64f4W3ybLsx3hzzOz4415oMXqrqicnKRzzY7R+poDflH
         m1plqb8Hvb/6Mho7vCZuWzMMSV8pAaZQX+R0dpwmMhANvmdLIY+CHZIa4nnG+T0W8maO
         tpunZROJnTFDsui84CcHHWi28O4sUceMdFZna6Ssr51hJj1GELSXZ6sQMbw+h5s/1Aqo
         ehnkNS/toWVHO5qSwXIOL7ewfuPTxrOCGXm63yFJhrqf9oLGomdZpw/wyfCj5doKoCdX
         lxV9g1QKgk97NnTY9+VaeCRBgrMvL3G2WcU6wxB3/U9gJCGTFjhZYlFBF6sHrsrwPFHI
         Msvg==
X-Gm-Message-State: AFqh2kq+8cgsnmhnc0Iu0VIQvRpKacm33f2oQ9+bjL2aMJOxeK2BGuej
        6PHAN1NCw9fRz64cybO1egk5mw==
X-Google-Smtp-Source: AMrXdXtxRHs8EROx8v8cTkrUK2UuWtAUEX39Cl8wdExkrWY6Yi3IgIQpsY6He/UyCt9HDPg8/slNJg==
X-Received: by 2002:a17:907:629c:b0:86e:9345:e701 with SMTP id nd28-20020a170907629c00b0086e9345e701mr20614184ejc.2.1674213145134;
        Fri, 20 Jan 2023 03:12:25 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b0084bfd56fb3bsm17667492ejc.162.2023.01.20.03.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 03:12:24 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 12:11:53 +0100
Subject: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM6350 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v1-1-e5d0c36e0c4f@fairphone.com>
References: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
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
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.2
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
