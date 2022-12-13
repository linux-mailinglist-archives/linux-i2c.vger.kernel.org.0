Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4AC64BD1D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 20:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbiLMTU1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 14:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236808AbiLMTUK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 14:20:10 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DD822535
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:20:09 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s25so4422745lji.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVPbvJWciRs9JzSnzKTGQNf2Bl8LuRMA/Eg4GzPXB54=;
        b=tc7iFGJVf0Ydos7tzuNeW880PufIi1d2itbA51+ZPBGcNdQQsrNmYScs9WjeCfJIFT
         mgbUzK3bb3wD05YGHD2A/WV5HMWCLmkRJzp12zzcz+WtI0H9OXRrG2wsDZNVSMeEkkEk
         Hi9l2fzn9sjQcw/YkVJ3sjJ3PTqvfeeuaHt/ClYcbNW+9kHIH1YuC8xzDFNve3Bz2fgL
         kmBTQ+uZZCVsRw3eaRpOiSEzjLu1kJv9pMdg0GEvZ+/MjNp1pVkRnvNHi/8iPdf9MqZG
         hJGzlTDQvsKcCQ42W0GijnWfpJ3EZaHtoOviDNtPbF8Qw27fh7+mXH1T1KSn1kTORkE0
         9qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVPbvJWciRs9JzSnzKTGQNf2Bl8LuRMA/Eg4GzPXB54=;
        b=1JSYhTy1H2XKU+24P2hyr6+HE0Iigpl1h2bVaBwhWb289LcP4rlCHsSMXdOBFft/WL
         HCnC5kw4J+JtpLsAKkXBea5ApausY6RHkdh2qm3S57XlVcwQLYR5IR6PFJBNzenDp9Dk
         Y2ujEth3GCoO4VE14KeM9Dq0sfpYpxrDJ8VUVDXn2AB/d6f3rLrpmVTo8+e1b18nv6sJ
         cTGI9iv0x1OLXpieLy+Zwa98G3rDRkZbChQUtHTEckxGAKqCRfqsVAbBx7ZLKRoMEvu8
         828wxjkvzWqI3PMkWOu80XBCTpwuV9HLjIBQEPx5iEd4YRb0uGaxKltqi3qH8GDKXv/g
         X0Nw==
X-Gm-Message-State: ANoB5pl255bDxX9aWjAnMb7UD6BkvrC0hWu1zxec2tMQIVsjNhQqW4Q5
        6HL65TMn9MmK4e5+ZQ+EFZdKKQ==
X-Google-Smtp-Source: AA0mqf7t/Y7F6KhgIvo+01ugvmb6p9Tqqkc526ipYHNI9t6ZFdw3DGjL+SZA9FGuyZAYBxkbn+/GnQ==
X-Received: by 2002:a2e:ab1b:0:b0:277:3921:6a19 with SMTP id ce27-20020a2eab1b000000b0027739216a19mr5286242ljb.48.1670959207580;
        Tue, 13 Dec 2022 11:20:07 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id l2-20020a194942000000b00497b198987bsm485261lfj.26.2022.12.13.11.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 11:20:06 -0800 (PST)
Message-ID: <96fd8fc1-96ba-2efe-f6ae-5786131d9c94@linaro.org>
Date:   Tue, 13 Dec 2022 20:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom,i2c-cci: Fall back to
 common compatibles
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <91e0e86c-480b-41a4-e4d5-21d59199e430@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <91e0e86c-480b-41a4-e4d5-21d59199e430@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 13.12.2022 20:16, Krzysztof Kozlowski wrote:
> On 13/12/2022 19:33, Konrad Dybcio wrote:
>> Almost every compatible string in the CCI driver is a duplicate. Adjust
>> the bindings to include a common (first-soc-implementing-vX) compatible
>> to remove the need to keep adding superfluous compatible strings.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Changes in v2:
>> - make sure the actual patch contests are tested..
>> - resolve errors
>>
>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 47 ++++++++++++-------
>>  1 file changed, 30 insertions(+), 17 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index cf9f8fda595f..87e414f0c39c 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -12,14 +12,23 @@ maintainers:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - qcom,msm8226-cci
>> -      - qcom,msm8916-cci
>> -      - qcom,msm8974-cci
>> -      - qcom,msm8996-cci
>> -      - qcom,sdm845-cci
>> -      - qcom,sm8250-cci
>> -      - qcom,sm8450-cci
>> +    oneOf:
>> +      - enum:
>> +          - qcom,msm8226-cci
>> +          - qcom,msm8974-cci
>> +          - qcom,msm8996-cci
>> +
>> +      - items:
>> +          - enum:
>> +              - qcom,msm8916-cci
>> +          - const: qcom,msm8226-cci # CCI v1
>> +
>> +      - items:
>> +          - enum:
>> +              - qcom,sdm845-cci
>> +              - qcom,sm8250-cci
>> +              - qcom,sm8450-cci
>> +          - const: qcom,msm8996-cci # CCI v2
>>  
>>    "#address-cells":
>>      const: 1
>> @@ -88,10 +97,12 @@ allOf:
>>    - if:
>>        properties:
>>          compatible:
>> -          contains:
>> -            enum:
>> -              - qcom,msm8226-cci
>> -              - qcom,msm8974-cci
>> +          oneOf:
>> +            - contains:
>> +                enum:
>> +                  - qcom,msm8974-cci
>> +
>> +            - const: qcom,msm8226-cci
> 
> The old version is here also correct and simpler. I don't think you need
> to change it this way.
> 
>>      then:
>>        properties:
>>          clocks:
>> @@ -105,10 +116,12 @@ allOf:
>>    - if:
>>        properties:
>>          compatible:
>> -          contains:
>> -            enum:
>> -              - qcom,msm8916-cci
>> -              - qcom,msm8996-cci
>> +          oneOf:
>> +            - contains:
>> +                enum:
>> +                  - qcom,msm8916-cci
>> +
>> +            - const: qcom,msm8996-cci
> 
> The same comment.
e.g. the 845 example contains 8996 but does not fall in this category,
reverting this change causes errors.

Konrad
> 
>>      then:
>>        properties:
>>          clocks:
>> @@ -169,7 +182,7 @@ examples:
>>  
>>      cci@ac4a000 {
>>          reg = <0x0ac4a000 0x4000>;
>> -        compatible = "qcom,sdm845-cci";
>> +        compatible = "qcom,sdm845-cci", "qcom,msm8996-cci";
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>  
> 
> Best regards,
> Krzysztof
> 
