Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26969745EAC
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 16:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjGCOlY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 10:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjGCOlX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 10:41:23 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF7FE72
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 07:41:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso350007666b.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688395277; x=1690987277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsxT2CXzmHNRKMKyTxxMYK1jnDo5PSeQbIe7Vn7ruhs=;
        b=ibuP6poiRv2NCpv0GANe5BUUMAtho2Sim6bzfVUn+CrFEk0BeMJH5r82Rsm/lrHb4B
         FZ6udm9GNduaB5PVVVvfx085xYtTTDg2yvhr1xAElZaSw/DNo+jVEX9j72mskdOTx1+L
         1gkkzTEkGsY+VhnT/EgfPPoAG692VJYniEIMJV3O5lPX0aBxe9Zii4MJZoJZbLLQJq+T
         zDQlamtXX523PrGN0SNns51BDHWiqG5wBA0qk8M0uOXFfOph57kVHiQKKzOLLBpH4ats
         3p6worsobf8sD/soHqHA9k+YonV6arMhM/smOcC69I92l0dLRjdLL65JOwv29W2G5BmN
         +RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688395277; x=1690987277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsxT2CXzmHNRKMKyTxxMYK1jnDo5PSeQbIe7Vn7ruhs=;
        b=YvSYpnASnXFQvtSILCEREwOaxY47ohgy4UltDwB9BdbsVbnFYuVYRz9WwlgikVDM56
         JusxoEGfUtjdtJR54o/mZwK4Ul6POVOPum2jwRPlpmTcDSCPKJXhG0zOKTuhb1dpK219
         o0Rs7EdUBvdO/JK55JXxWD6HpOMpinTcbmA0YOloqVi9R80M1sMY9Nmq8pylCsdPMSk0
         Bo6rUfuXaWeOl1rXVUNtnyjKJGGaRNOpC3T6WdgTvhaQPBpxduUfQL2rb7p0hutf1W18
         oUR3ZpkWrep6SGOuWerevnM6WMfJPlHq9vYUYg8yKjNxRos1hQpcnHMr1dNlLGpxT1lv
         efBQ==
X-Gm-Message-State: ABy/qLYPW6s5Ava+wJl0orJFGBfkb2S4eQYQb/YbugNtP1nQaLdZSKbd
        88+bc2jwJD0YFCzT9F00bABgtA==
X-Google-Smtp-Source: APBJJlGk9ekQfg4hjV5s18OXGN4VoU+I+0II8jd3rHixUG8SYz65UZyLq9XhnjMqiiDFTkFoY/5w9w==
X-Received: by 2002:a17:906:2dc5:b0:992:58fc:bcb8 with SMTP id h5-20020a1709062dc500b0099258fcbcb8mr6529593eji.56.1688395277328;
        Mon, 03 Jul 2023 07:41:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709065a9000b0098d93142ce1sm11957949ejq.109.2023.07.03.07.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:41:16 -0700 (PDT)
Message-ID: <30070c0d-df8c-2ab4-bc54-7801b6b7d49b@linaro.org>
Date:   Mon, 3 Jul 2023 16:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] dt-bindings: serial: geni-qcom: Allow no qup-core icc
 path
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <d3d6af2b-4feb-1545-5576-a811941a47e1@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d3d6af2b-4feb-1545-5576-a811941a47e1@linaro.org>
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

On 03/07/2023 16:38, Konrad Dybcio wrote:
> On 3.07.2023 16:01, Krzysztof Kozlowski wrote:
>> On 03/07/2023 15:31, Konrad Dybcio wrote:
>>> Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
>>> Allow such case.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../bindings/serial/qcom,serial-geni-qcom.yaml     | 26 +++++++++++++++-------
>>>  1 file changed, 18 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>> index dd33794b3534..a0acba57bc06 100644
>>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>> @@ -25,14 +25,6 @@ properties:
>>>    clock-names:
>>>      const: se
>>>  
>>> -  interconnects:
>>> -    maxItems: 2
>>> -
>>> -  interconnect-names:
>>> -    items:
>>> -      - const: qup-core
>>> -      - const: qup-config
>>
>> Instead please keep the definition of the fields in top-level properties
>> with the widest constraints, e.g.
>> interconnects:
>>   minItems: 1
>>   maxItems: 2
>>
>> interconnect-names:
>>   minItems: 1
>>   items:
>>    - const: qup-core
>>    - const: qup-config
> Sadly the issue here is that the qup-config path exists, but qup-core
> doesn't.

Ah, right, then:
interconnect-names:
  oneOf:
    - items:
      ....
    - items:
      ...

Best regards,
Krzysztof

