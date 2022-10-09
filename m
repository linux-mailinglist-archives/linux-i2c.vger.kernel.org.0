Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A393E5F8C03
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 17:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiJIPZc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 11:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiJIPZ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 11:25:27 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645E41DF1E
        for <linux-i2c@vger.kernel.org>; Sun,  9 Oct 2022 08:25:25 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id i12so5945379qvs.2
        for <linux-i2c@vger.kernel.org>; Sun, 09 Oct 2022 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PawHfS9TB644mU5735pYGa+FDnienqhSf5bbathaXc=;
        b=La05bCIRIhhzTeRo2u35kbHPgO/kBHLBMYBaso1QRasLAKZiqPN7OgoNXYc57OMU98
         Idw0EXfVhQFBkXVyNuVGGyI1pcxOjS5Vfz5qjJZ+gTYlF7Hee+7lg3UML2oW90HtX9lZ
         EI/0+jt2ycjNW+SHYPElu74SzHzYKeVCGkQIRbo0vcKwl33nvNAuTe5st1AFzVDXcZY3
         dYrbrfToCq+ZUC51ornwpRBndX2kiqtTcDrkez2m411aEyxccMscUo5WCuth/Av+4lK3
         n8eeOwVxuya7Aa5BLyk1lPq5/DAAg7AUuaERfVscwyu4EQ1ILGWh7+IWpSLc+b0CIaI/
         C96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PawHfS9TB644mU5735pYGa+FDnienqhSf5bbathaXc=;
        b=gTdivh0X989CVJtzHNjgsWSfZw53mBGhhFkwkYD/6D1XMuUW1iQi1qABlW2P65ReFv
         UR2kNWyfRLiwVW+gbN1GJw7a++dJlzoWOXo+VwWd2y6OsNzN6DsqkbQffgCAsInLtV5h
         6dNB6lbVR31UMW/UejIuHmHOM0osZXlshUpJcN07JRjRiGAwYCIdIYOPRJAWL0bO7Zfi
         dbFsiui+vkOc/WwCVe8EA262rRacoF/kq4a6mI/vr/PhdPiSN9apZTWvUDcKO6qhHKGf
         iBHM7GbRU9WibqcYGYB48WTCYmjQMKP86ijpnt+oItNM6QMirULn1fLa2h0AbdZt3Nmu
         jOGA==
X-Gm-Message-State: ACrzQf11xlfgz0Leh5oxPUqWpI+hy2WSpWa3fdxFB+DjwW2LjdV9pWnH
        M0Yjsu3TQ7OgJpkqLJhyE7lkS35WhhhsYA==
X-Google-Smtp-Source: AMsMyM7krx54u0UGGKpdEUxnZtTyufgiQ9fkcw8RwlHcjjLxBLNORQDcvl+DxeAtg1ks9+695JzlMQ==
X-Received: by 2002:ad4:5bc5:0:b0:4af:b73f:1914 with SMTP id t5-20020ad45bc5000000b004afb73f1914mr11586573qvt.117.1665329124420;
        Sun, 09 Oct 2022 08:25:24 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id l18-20020a37f912000000b006ce580c2663sm7532093qkj.35.2022.10.09.08.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 08:25:23 -0700 (PDT)
Message-ID: <68327197-6835-1ec4-e8f1-217b5d2ef947@linaro.org>
Date:   Sun, 9 Oct 2022 17:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [v9 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        robh@kernel.org, wsa@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-2-patrick.rudolph@9elements.com>
 <20221008115019.6jxsbawtye7cdkfh@mobilestation>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221008115019.6jxsbawtye7cdkfh@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/10/2022 13:50, Serge Semin wrote:
> On Fri, Oct 07, 2022 at 09:53:50AM +0200, Patrick Rudolph wrote:
>> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
>> chips. The functionality will be provided by the exisintg pca954x driver.
>>
>> While on it make the interrupts support conditionally as not all of the
>> existing chips have interrupts.
>>
>> For chips that are powered off by default add an optional regulator
>> called vdd-supply.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> ---
>>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 39 ++++++++++++++++---
>>  1 file changed, 34 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>> index 9f1726d0356b..efad0a95806f 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>> @@ -4,21 +4,25 @@
>>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: NXP PCA954x I2C bus switch
>> +title: NXP PCA954x I2C and compatible bus switches
>>  
>>  maintainers:
>>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>  
>>  description:
>> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
>> -
> 
>> -allOf:
>> -  - $ref: /schemas/i2c/i2c-mux.yaml#
> 
> Why do you move the allOf statement to the bottom of the schema?

Because it goes with 'ifs' at the bottom of the schema...

> 
>> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
>> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
> 
> What about combining the sentence: "The binding supports NXP
> PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices." ?
> Currently it does look a bit bulky.

Drop "The binding supports". Instead describe the hardware.

> 
>>  
>>  properties:
>>    compatible:
>>      oneOf:
>>        - enum:
>> +          - maxim,max7356
>> +          - maxim,max7357
>> +          - maxim,max7358
>> +          - maxim,max7367
>> +          - maxim,max7368
>> +          - maxim,max7369
>>            - nxp,pca9540
>>            - nxp,pca9542
>>            - nxp,pca9543
>> @@ -59,10 +63,33 @@ properties:
>>      description: if present, overrides i2c-mux-idle-disconnect
>>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>>  
>> +  vdd-supply:
>> +    description: A voltage regulator supplying power to the chip.
>> +
>>  required:
>>    - compatible
>>    - reg
>>  
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-mux.yaml#
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - maxim,max7367
>> +                - maxim,max7369
>> +                - nxp,pca9542
>> +                - nxp,pca9543
>> +                - nxp,pca9544
>> +                - nxp,pca9545
>> +    then:
> 
>> +      properties:
>> +        interrupts: false
>> +        "#interrupt-cells": false
>> +        interrupt-controller: false
> 
> I'd suggest to add an opposite definition. Evaluate the properties for
> the devices which expect them being evaluated instead of falsing their
> existence for the devices which don't support the interrupts.

The properties rather should be defined in top-level than in "if", so I
am not sure how would you want to achieve opposite way.


Best regards,
Krzysztof

