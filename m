Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A738964BD42
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 20:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbiLMT2c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 14:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236509AbiLMT2a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 14:28:30 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7D724085
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:28:28 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id p36so6603146lfa.12
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 11:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFrcfOUYi3nTn96rxqRBPL4KLleaoJ4XIQjtuefCT10=;
        b=TN7k30kv0Hol7Qz25R2Jzy0vyNTkSZ8Ib87jLudvkEa0UCRlC/Wz0z9xV1BeEGrJWN
         hqECeJYUzyTDS3pIJcT/nz7TxoXmmo1aYgJA9S5Ldp2dTjBbPHp3CmWzPtB2S8uWxRLO
         LcOucSYV9vHVxOkApgicHo99v3AbNmCIFKoaKWmuZek07GgjFI6PIvaMNQxSIvT7CENS
         zgPV4N/mhYrBoRgKOH6hT44hWMNsKcJVvjT90N+eD+I1YStbRHEeT1Qbb41F5867Eirb
         BaCB7FGqfVXJ/AW/5brdLk5rPwwCIyEDaiLJPiMrkOgGigDmpFEdbm9BRQ60TSkaPb7K
         +kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFrcfOUYi3nTn96rxqRBPL4KLleaoJ4XIQjtuefCT10=;
        b=uz5utfUjnaaWAhX2cRX21MTNJpz93pdzuKAf5mLxGuNuU8tl5GSNbikSdG+khThUlX
         Mryr5JYWhcl6ISYfCcQJfSXBbklcuhodMVCJIB6Des4Cn+/Ykr/EQl9uzgBQXJjvhyJ5
         SjXWSmad62u5hFjcn3M2hAajOp0X8cP+Sb+7A95ID7+/UuwJTNnFWgLgt8kfVzW6JlDJ
         /b4/DffFN53CcapXwomQiP8UvBR3Wzc0dn65f6FixqSEJRLrW6Vv5LptkdPyCVD7nEA4
         tgml3H8b8rtiPIEcPe8uZS2o3ZieAbUkTSa8OikfO4wo4tQVDjk0rejxUeXgGgNCApEv
         DLAw==
X-Gm-Message-State: ANoB5pnnYHVXt+1LnqDW92WYDCOssUUKrB+WaozwJ1NOcZQI1EEfNPOn
        UKKUycllrdDmMXjW9xnzhhBZhQ==
X-Google-Smtp-Source: AA0mqf6rsUdXU64xn6m0QEWHsRnUq/TALCX5FjMIBfN4toCN9uU3ct9+4W/DM0TYi1Le4odI4jKaGw==
X-Received: by 2002:ac2:4154:0:b0:4a4:86ff:9562 with SMTP id c20-20020ac24154000000b004a486ff9562mr5361647lfi.38.1670959706958;
        Tue, 13 Dec 2022 11:28:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g27-20020a2ea4bb000000b002797e41e1bdsm377107ljm.86.2022.12.13.11.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 11:28:26 -0800 (PST)
Message-ID: <c1a2634e-8917-e70a-ca7a-61363dea62de@linaro.org>
Date:   Tue, 13 Dec 2022 20:28:25 +0100
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
 <91e0e86c-480b-41a4-e4d5-21d59199e430@linaro.org>
 <96fd8fc1-96ba-2efe-f6ae-5786131d9c94@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <96fd8fc1-96ba-2efe-f6ae-5786131d9c94@linaro.org>
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

On 13/12/2022 20:20, Konrad Dybcio wrote:
> 
>>
>>>      then:
>>>        properties:
>>>          clocks:
>>> @@ -105,10 +116,12 @@ allOf:
>>>    - if:
>>>        properties:
>>>          compatible:
>>> -          contains:
>>> -            enum:
>>> -              - qcom,msm8916-cci
>>> -              - qcom,msm8996-cci
>>> +          oneOf:
>>> +            - contains:
>>> +                enum:
>>> +                  - qcom,msm8916-cci
>>> +
>>> +            - const: qcom,msm8996-cci
>>
>> The same comment.
> e.g. the 845 example contains 8996 but does not fall in this category,
> reverting this change causes errors.

Ah, I see, indeed. Looks reasonable:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

