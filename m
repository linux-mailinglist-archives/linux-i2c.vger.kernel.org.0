Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FA6745E9A
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 16:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjGCOiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 10:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbjGCOiH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 10:38:07 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC86E5E
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 07:38:04 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so7003300e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688395083; x=1690987083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ly7UoRFAfJIXz+VZaxLWPYiCxf0M8wVXDUzALvT+VJw=;
        b=P1Q+CDXgpdgM6oPIREepdtde+wYfYizdyI94xbx8/wNAN9yLHAGkLsy4MJWwTUXEaZ
         360BaXS/bgSxxN9JO4b5QO+HGMWTUdYKCT4+cZSb7S6o5KccL6dluWHDCns/Yz6t2drP
         R/1K20vZIdpAP5B+DIZKM8jmnDq84q+WYFHVvlRQ3TlZ5ddc3iN8qbEiOvuEFuCLlZRW
         eaXmmud5RcSbX7zC+G855Yqcd0+4EYhDZdW3jJR4P0eE8YX7QChV+7S4DQMGjcxHp4bm
         uOLJI2clsyvbq0UWEgBwe5HMWdEfwo/eJLxBagF7/aevPiPa9GqQ4/GORry59dYmkyBX
         8Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688395083; x=1690987083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ly7UoRFAfJIXz+VZaxLWPYiCxf0M8wVXDUzALvT+VJw=;
        b=eLXmpl/I2EN/KiRjb5Ss1s58aZJ1IB5PFXTT4fZiN9yK8zzNlbBaa0uLeCd8hw2o8v
         N7HJHqzvYiMiUxeJYOS8EMYydZCgFWxRBdz3vFAc84ul5/r7E1+BvOFolP/ciF95WQL2
         txRF5wKe1GGj9dHDofegbvIkCNO93wgnb/7g5tK0EPcJ1TMEPiu3XvSoMzut0+YR48DN
         N6VcPlF4d7uZkF0REgDNtx6qfrGaVb7LkCnTK0GeH7A2mXzes1PdvdqEOUf31SeJQsKp
         fPHx8sn6hkFzAKiPUz+EiLG2ryL4BU+JigCrDOuT3j+//jpZtFg7O8Ghs4TYc/W0oR5Z
         wxzQ==
X-Gm-Message-State: ABy/qLbCOfqL5RaKGp+4jhexSKTGr8ksoDjtB8qIT/zoLixDEwVE9IQ2
        64QbKA2CeDV017y+Fz1n91CQtg==
X-Google-Smtp-Source: APBJJlFqk+6qejn9duPcCZsPljYfwRyF88tcjmxYswN/z+Qf/DKk0PiKz2qLPHygCRJ+3hv9aiNP2w==
X-Received: by 2002:a05:6512:20d0:b0:4f7:4098:9905 with SMTP id u16-20020a05651220d000b004f740989905mr6057789lfr.65.1688395082833;
        Mon, 03 Jul 2023 07:38:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b004fba5eb0a64sm2004685lfe.42.2023.07.03.07.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:38:02 -0700 (PDT)
Message-ID: <d3d6af2b-4feb-1545-5576-a811941a47e1@linaro.org>
Date:   Mon, 3 Jul 2023 16:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] dt-bindings: serial: geni-qcom: Allow no qup-core icc
 path
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
 <20230703-topic-8250_qup_icc-v1-2-fea39aa07525@linaro.org>
 <b8d3e99b-157e-4f7d-1f5e-a702acd8e819@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b8d3e99b-157e-4f7d-1f5e-a702acd8e819@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3.07.2023 16:01, Krzysztof Kozlowski wrote:
> On 03/07/2023 15:31, Konrad Dybcio wrote:
>> Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
>> Allow such case.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/serial/qcom,serial-geni-qcom.yaml     | 26 +++++++++++++++-------
>>  1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> index dd33794b3534..a0acba57bc06 100644
>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>> @@ -25,14 +25,6 @@ properties:
>>    clock-names:
>>      const: se
>>  
>> -  interconnects:
>> -    maxItems: 2
>> -
>> -  interconnect-names:
>> -    items:
>> -      - const: qup-core
>> -      - const: qup-config
> 
> Instead please keep the definition of the fields in top-level properties
> with the widest constraints, e.g.
> interconnects:
>   minItems: 1
>   maxItems: 2
> 
> interconnect-names:
>   minItems: 1
>   items:
>    - const: qup-core
>    - const: qup-config
Sadly the issue here is that the qup-config path exists, but qup-core
doesn't.

Konrad
> 
> If there was allOf:if:then per variant, this could be further customized.
> 
> Best regards,
> Krzysztof
> 
