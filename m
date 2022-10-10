Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FA35F9CC1
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Oct 2022 12:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiJJK2k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Oct 2022 06:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiJJK2d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Oct 2022 06:28:33 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FF212AE0
        for <linux-i2c@vger.kernel.org>; Mon, 10 Oct 2022 03:28:32 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id a18so3483670qko.0
        for <linux-i2c@vger.kernel.org>; Mon, 10 Oct 2022 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrUwBNnbqd4ksk/FmUIV1AB6T9m45SMvhXf0F8HKU5I=;
        b=xqD0qMsTR9VP3gwWUCR5g70s4AZojnbDrPy5m1C+Iv93XOLUncuIAcb4fDca1cAOKh
         +6qsfkS1Uito0MzSemkYyh4IJwRLvnXcAgcI49RS1I1cgRNTvoUYP1ALnRJUSFt0LqUP
         2jm09DApo5685+hakOwf78NX/hFgmBFahtzFbxKAG2fNrf1gxqyPo7E89oE282o4XU8O
         6ZTnyaGg2W37Gjiqkz312cWf8IFeTUvtn04GWdGXUsjQ8u4XVS51WYtzD5mj/kdU8YT2
         KLQe9OzOVObKx9zuIuuP62K6cprOhSTtWF6HDkNHLRoV1CQj0+qPDadZhGAe5uwiIzKS
         ty7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrUwBNnbqd4ksk/FmUIV1AB6T9m45SMvhXf0F8HKU5I=;
        b=M6yzog/59O8cIn8UBSLEhJFHTiG7HNz5dPQ3k0Cxx84gZlUEx3p7sPvttbJ/Xndy8r
         LaFfkYBVbG+fJpyhGsTFkMiM8+M9WBk6xEINyOdeSoZ6wQjokdePWVNXTMaepBvgbUv7
         fUyViETcYv8hqTOhXh5nejAGGsNouZZgl+pqvWnkqPU644d6qU+NNhebde5cOpAWW7b6
         2f6rJXKAB+tQtp/U4ZK3gJOWW6RZ6NyacnFXfNbVYWuJA6p07TLIYoqGMk/fqADmRx0e
         C4ScdnY2D2ErPT3MSx0dYfObUL88aXoaunx3Qpkn+eYMuU8PL4gae1UGLhmaSN9uoFT3
         VkIg==
X-Gm-Message-State: ACrzQf1T0PkRKcrtYJOJyLH8e+k+cR/PeaKAzhZg/UrLFcUBQeiDycl+
        4PwcuEDNgpIYcXbnYc7nnxixkg==
X-Google-Smtp-Source: AMsMyM6zubrft+MZXIieNYHeZnBqAdduX1ndvw0Bw4fd77NNY1ToPzGUXv6vQgeKKs4tO1OUIFNb5Q==
X-Received: by 2002:a05:620a:284a:b0:6ab:9cc5:cb4c with SMTP id h10-20020a05620a284a00b006ab9cc5cb4cmr12163260qkp.609.1665397711394;
        Mon, 10 Oct 2022 03:28:31 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id bl23-20020a05620a1a9700b006ce30a5f892sm5732273qkb.102.2022.10.10.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 03:28:30 -0700 (PDT)
Message-ID: <fa7feb67-9ad0-2cff-a1f2-4c204d3995fc@linaro.org>
Date:   Mon, 10 Oct 2022 06:26:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [v9 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        robh@kernel.org, wsa@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-2-patrick.rudolph@9elements.com>
 <20221008115019.6jxsbawtye7cdkfh@mobilestation>
 <68327197-6835-1ec4-e8f1-217b5d2ef947@linaro.org>
 <20221009180340.hqt3ngp5d26g3euw@mobilestation>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221009180340.hqt3ngp5d26g3euw@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/10/2022 14:03, Serge Semin wrote:
> On Sun, Oct 09, 2022 at 05:25:22PM +0200, Krzysztof Kozlowski wrote:
>> On 08/10/2022 13:50, Serge Semin wrote:
>>> On Fri, Oct 07, 2022 at 09:53:50AM +0200, Patrick Rudolph wrote:
>>>> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
>>>> chips. The functionality will be provided by the exisintg pca954x driver.
>>>>
>>>> While on it make the interrupts support conditionally as not all of the
>>>> existing chips have interrupts.
>>>>
>>>> For chips that are powered off by default add an optional regulator
>>>> called vdd-supply.
>>>>
>>>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>> ---
>>>>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 39 ++++++++++++++++---
>>>>  1 file changed, 34 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>>> index 9f1726d0356b..efad0a95806f 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>>> @@ -4,21 +4,25 @@
>>>>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>  
>>>> -title: NXP PCA954x I2C bus switch
>>>> +title: NXP PCA954x I2C and compatible bus switches
>>>>  
>>>>  maintainers:
>>>>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>  
>>>>  description:
>>>> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
>>>> -
>>>
>>>> -allOf:
>>>> -  - $ref: /schemas/i2c/i2c-mux.yaml#
>>>
>>> Why do you move the allOf statement to the bottom of the schema?
>>
> 
>> Because it goes with 'ifs' at the bottom of the schema...
> 
> Is there a requirement to move the allOf array to the bottom of the
> schema if it contains the 'if' statement? If only there were some
> kernel doc with all such implicit conventions...

It's just a convention, although quite logical because "ifs" can grow
significantly, so putting it before properties is outside of context.
Reader does not know yet to what this if applies.

> 
>>
>>>
>>>> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
>>>> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
>>>
>>> What about combining the sentence: "The binding supports NXP
>>> PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices." ?
>>> Currently it does look a bit bulky.
>>
>> Drop "The binding supports". Instead describe the hardware.
>>
>>>
>>>>  
>>>>  properties:
>>>>    compatible:
>>>>      oneOf:
>>>>        - enum:
>>>> +          - maxim,max7356
>>>> +          - maxim,max7357
>>>> +          - maxim,max7358
>>>> +          - maxim,max7367
>>>> +          - maxim,max7368
>>>> +          - maxim,max7369
>>>>            - nxp,pca9540
>>>>            - nxp,pca9542
>>>>            - nxp,pca9543
>>>> @@ -59,10 +63,33 @@ properties:
>>>>      description: if present, overrides i2c-mux-idle-disconnect
>>>>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>>>>  
>>>> +  vdd-supply:
>>>> +    description: A voltage regulator supplying power to the chip.
>>>> +
>>>>  required:
>>>>    - compatible
>>>>    - reg
>>>>  
>>>> +allOf:
>>>> +  - $ref: /schemas/i2c/i2c-mux.yaml#
>>>> +  - if:
>>>> +      not:
>>>> +        properties:
>>>> +          compatible:
>>>> +            contains:
>>>> +              enum:
>>>> +                - maxim,max7367
>>>> +                - maxim,max7369
>>>> +                - nxp,pca9542
>>>> +                - nxp,pca9543
>>>> +                - nxp,pca9544
>>>> +                - nxp,pca9545
>>>> +    then:
>>>
>>>> +      properties:
>>>> +        interrupts: false
>>>> +        "#interrupt-cells": false
>>>> +        interrupt-controller: false
>>>
>>> I'd suggest to add an opposite definition. Evaluate the properties for
>>> the devices which expect them being evaluated instead of falsing their
>>> existence for the devices which don't support the interrupts.
>>
> 
>> The properties rather should be defined in top-level than in "if", so I
>> am not sure how would you want to achieve opposite way.
> 
> With one more implicit convention like "preferably define the
> properties in the top-level than in if" of course I can't. Otherwise I
> thought something like this would work:
> +allOf:
> +  - ...
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum: [...]
> +    then:
> +      properties:
> +        interrupts: ...
> +        "#interrupt-cells": ...
> +        interrupt-controller: ...
> ...
> -  interrupts:
> -  "#interrupt-cells":
> -  interrupt-controller: ...
> 
> With unevaluatedProperties set to false and evaluation performed for
> the particular compatibles such schema shall work with the same
> semantic.

Yes, this will work, but defining properties inside "if" is usually not
readable.

Best regards,
Krzysztof

