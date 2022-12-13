Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1325664BD00
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 20:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbiLMTQv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 14:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236330AbiLMTQt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 14:16:49 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758DBF4D
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:16:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 1so6608353lfz.4
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1MYv6ZqEUNCdU/NipcNolSkM2/basvNg4kfvTnNlEs=;
        b=DIkzuHTh8JrgbiIglflRjxwqRENEGZKDFMOntTIz+KyJslV32lJ9ALvTSiDbgeR7Rf
         zdSZ+7Lbl9nE89lGena8OON+5wfHjrG4CUmXwxP9UFrMtGd4cfM8GJ4KNEGUhNITMeem
         FzHS+HDsWaf1JZ5ntVYfAlW3dWKRf4L/KF2V66EC5UeYdfD3TsGkqJoXvSaJDDOa9dRo
         JO6fGoUteKHoNbIUisvh/5XTOMoZOAuNoiIqfkMIpfzp+Pueacj6P72wSVeLPrncJzRl
         Vtn8cVjJtOSc3zcwRUca3vbnwECr9jLMuN3OgocnoY4eEHmMOI4Ru3jhzWTX6TJJwr9u
         qzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1MYv6ZqEUNCdU/NipcNolSkM2/basvNg4kfvTnNlEs=;
        b=GuLj99S9glNTRBpu5fzwKWShDiKCYw46OTSTCo8J9bv8ZIQRwxiWbDVSj+NvzLveBh
         mefOJMbPCU9TBmXtuDtBhPTcapyh4TtGDoAJ+TiJ/TSxoDRA7PqewLjcqA+ZFOiEX42g
         ml4PSU5vST4GyxPzOSKHyCXtIJcmWb/C2G8DD/GawrrhAXaPz5ae3yX+RXoZR13sJPrF
         R2VjiltGdNJTRWCmOKGwlbwreoN/sH2K8i10nJ9oSv1ia4PvMInzSHVOYUvpJsSRdMAw
         7EDrLq5A5BTrWflvlmO9YhGbkKMcN+iNxud636ImKmLq7+4iG/7PZMJk0jvPrDbebIw5
         Eyvw==
X-Gm-Message-State: ANoB5pkXjP6v+qTKMECVjQJlCW2dPfQ25ZrIkJ4Wf0awYbgWjMAcc9K/
        p9S5YJ9GPJD1DXALJ81eQq5o1Q==
X-Google-Smtp-Source: AA0mqf6VUXJe8MpCG+6xW8mkkjnteKcxasX9WCzC1yEZM4FKm5I+R747nye4tlE7WxwFYRn2EXzyXQ==
X-Received: by 2002:a05:6512:2111:b0:4b5:6163:b677 with SMTP id q17-20020a056512211100b004b56163b677mr4755088lfr.38.1670959005904;
        Tue, 13 Dec 2022 11:16:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512078200b004b577fdce62sm475679lfr.158.2022.12.13.11.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 11:16:45 -0800 (PST)
Message-ID: <91e0e86c-480b-41a4-e4d5-21d59199e430@linaro.org>
Date:   Tue, 13 Dec 2022 20:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom,i2c-cci: Fall back to
 common compatibles
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13/12/2022 19:33, Konrad Dybcio wrote:
> Almost every compatible string in the CCI driver is a duplicate. Adjust
> the bindings to include a common (first-soc-implementing-vX) compatible
> to remove the need to keep adding superfluous compatible strings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v2:
> - make sure the actual patch contests are tested..
> - resolve errors
> 
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 47 ++++++++++++-------
>  1 file changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index cf9f8fda595f..87e414f0c39c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -12,14 +12,23 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,msm8226-cci
> -      - qcom,msm8916-cci
> -      - qcom,msm8974-cci
> -      - qcom,msm8996-cci
> -      - qcom,sdm845-cci
> -      - qcom,sm8250-cci
> -      - qcom,sm8450-cci
> +    oneOf:
> +      - enum:
> +          - qcom,msm8226-cci
> +          - qcom,msm8974-cci
> +          - qcom,msm8996-cci
> +
> +      - items:
> +          - enum:
> +              - qcom,msm8916-cci
> +          - const: qcom,msm8226-cci # CCI v1
> +
> +      - items:
> +          - enum:
> +              - qcom,sdm845-cci
> +              - qcom,sm8250-cci
> +              - qcom,sm8450-cci
> +          - const: qcom,msm8996-cci # CCI v2
>  
>    "#address-cells":
>      const: 1
> @@ -88,10 +97,12 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            enum:
> -              - qcom,msm8226-cci
> -              - qcom,msm8974-cci
> +          oneOf:
> +            - contains:
> +                enum:
> +                  - qcom,msm8974-cci
> +
> +            - const: qcom,msm8226-cci

The old version is here also correct and simpler. I don't think you need
to change it this way.

>      then:
>        properties:
>          clocks:
> @@ -105,10 +116,12 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            enum:
> -              - qcom,msm8916-cci
> -              - qcom,msm8996-cci
> +          oneOf:
> +            - contains:
> +                enum:
> +                  - qcom,msm8916-cci
> +
> +            - const: qcom,msm8996-cci

The same comment.

>      then:
>        properties:
>          clocks:
> @@ -169,7 +182,7 @@ examples:
>  
>      cci@ac4a000 {
>          reg = <0x0ac4a000 0x4000>;
> -        compatible = "qcom,sdm845-cci";
> +        compatible = "qcom,sdm845-cci", "qcom,msm8996-cci";
>          #address-cells = <1>;
>          #size-cells = <0>;
>  

Best regards,
Krzysztof

