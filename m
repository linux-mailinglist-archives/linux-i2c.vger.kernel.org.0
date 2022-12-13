Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C217664BB90
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236501AbiLMSHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 13:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236414AbiLMSG7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 13:06:59 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C747248C3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 10:06:47 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 1so6251879lfz.4
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADpodWKXROZu/3D+Zxer6l8IxEoAVXT4LlWfeI8NjbI=;
        b=QMwjkoir1ul5Xka1V9XDto/QZCV7qWabFkeYDzEs08Sz4QgXBTb4jSc9cV1CPDuyLV
         vY2O+dpeDflpgh5YtGadK9EZq5ssrGI35o0sEMYYG/0GMWeTaIB9I+IRC6FFsjYeHbBP
         q+bxHCtxCkgYU8XEjq4KswgR53edjv9dX8uI35aE8H+vfsqepB4WatzI3mMUidU3S45F
         /fH195BOCSnIN3we/1EfobW1JA5DnqCHAIiTbWSitLaqqy6XJwuUZy9v4/BBFx504nd/
         8Y2dGs5+idsYlxw5SjuAdIQunN607EQ00Gzk7p0AkawzRInKtShLO6VTe8ohqJxFsDDx
         ETbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADpodWKXROZu/3D+Zxer6l8IxEoAVXT4LlWfeI8NjbI=;
        b=5sn1e9PmwS3kzaRYfbrfFJ4HeUJptjWZJUZaUyK66rojDUtjCO7BX0ENiSwsn8lJpp
         MLwLfRb4TDdmpPxWkWjI2J58pmppKqgFBvyIl61m9l98kLMmbFmtsTDBZZFklqzjQwFD
         vo8lGcVzESgSNfB7zXH1DBZ5aUZFEhrmULVHt+zLIdncMhubnMPKDRowh/9nZ92BZ51O
         95hzUaws1lGA4WeBTMqn2uigzcVZGTPKR0whG6IVlsrrKtK3AmFlhsNiH4yOaqn5bRO/
         MWYE25zUhYCQJrEJHHDMV9lfwfcqt5R3Rk2VgIvXVkcY1A5YO0yYF3yUYCaM3yNebpJU
         JL0A==
X-Gm-Message-State: ANoB5plkw1tI8TXbKJ+8Adeyj/XatdfmQ3HbhewprjuQK815bZ55onC8
        0rJQUc/NhnBC9iPACnKV4VkKQQ==
X-Google-Smtp-Source: AA0mqf7sUGungFI5a/97OKrQx5IbqK4ZIfMYj93YgT+DCO0eJ3Yh2Ot1uIneRrVv+5l1e8oxTpvp+g==
X-Received: by 2002:a05:6512:15a7:b0:4b6:e494:a98d with SMTP id bp39-20020a05651215a700b004b6e494a98dmr4223840lfb.44.1670954806151;
        Tue, 13 Dec 2022 10:06:46 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id v10-20020ac2560a000000b00497aa190523sm454543lfd.248.2022.12.13.10.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 10:06:45 -0800 (PST)
Message-ID: <1a950cde-6713-a14e-f899-3450dbad5312@linaro.org>
Date:   Tue, 13 Dec 2022 19:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom,i2c-cci: Fall back to common
 compatibles
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
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
References: <20221213115628.105149-1-konrad.dybcio@linaro.org>
 <b8be66e0-f987-b3ec-b78e-5be8bf54b05e@linaro.org>
 <b289a9c5-54de-5ca4-b247-90751be05fa9@linaro.org>
In-Reply-To: <b289a9c5-54de-5ca4-b247-90751be05fa9@linaro.org>
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



On 13.12.2022 18:01, Konrad Dybcio wrote:
> 
> 
> On 13.12.2022 17:58, Krzysztof Kozlowski wrote:
>> On 13/12/2022 12:56, Konrad Dybcio wrote:
>>> Almost every compatible string in the CCI driver is a duplicate. Adjust
>>> the bindings to include a common (first-soc-implementing-vX) compatible
>>> to remove the need to keep adding superfluous compatible strings.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 25 +++++++++++++------
>>>  1 file changed, 17 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index cf9f8fda595f..65cf7860a9a0 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -12,14 +12,23 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    enum:
>>> -      - qcom,msm8226-cci
>>> -      - qcom,msm8916-cci
>>> -      - qcom,msm8974-cci
>>> -      - qcom,msm8996-cci
>>> -      - qcom,sdm845-cci
>>> -      - qcom,sm8250-cci
>>> -      - qcom,sm8450-cci
>>> +    oneOf:
>>
>> Except missing test,
> Hm? I tested this locally with dt_binding_check and it passed..
Eh, looks like I didn't hit save before running it or something,
I see it now, sorry bout that..

Konrad
> 
> how about also adding a comment to the driver, that
>> list of compatibles should not grow when not needed?
> Sure.
> 
> Konrad
>>
>> Best regards,
>> Krzysztof
>>
