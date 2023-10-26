Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF1F7D85A1
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 17:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345399AbjJZPJ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 11:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345395AbjJZPJ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 11:09:58 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07FE18A;
        Thu, 26 Oct 2023 08:09:56 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-59e88a28b98so9081997b3.1;
        Thu, 26 Oct 2023 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698332996; x=1698937796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75afhKIki2MH320fMMs1G/iqDOlXln6+st6AMPJCLVw=;
        b=FNuGCSnzz8t0irCgtqu7ki/QjYLncD09eQdwAnfUKrMxFI3Eb64fKN6om8JXUXHRVk
         DqS9THDCdxH08MueQs1Uw36P8Wz4pHwg3KfuXOnhI6xkUqZlgdo8xc2Md8RSgncOdEYd
         BnuVuNsJ9SUo6gNHZ++4yyHRJmB9ce1S8C64Ah465UK93DgxlFrkNgoNJasUBtZRxhvF
         S5S+7fDYOpPkHOzI6psVyHzcCpB1FYqDE2LyGpiKEhV7BF6sh5uMJOb0jvEk0IiiplE0
         D865OlsenBkasy6eCYG58LYcS5Ny5MUiV1HKNbw8b5egtfVXBvvTIWnVGpSbmVEE0XII
         OpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698332996; x=1698937796;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75afhKIki2MH320fMMs1G/iqDOlXln6+st6AMPJCLVw=;
        b=rDnZNx8aZUcIbe3MexsqWHY0LMGyOWsBqUZfZkRIiS+IF6DVgjoBMDm+EN33bVDQ18
         fp2I1BvmOJI0KjZzXigdEwOqGXBEVU6zTgCi0Ay3BC6V1LOG3A1AOFiyF/AdyOqurz1I
         wcxC7DKMoW1SqIs34z0RY71JFEz3J3XX3MDQWtT/z4KHSUkQbvIwLqAnMyKP0xmGN8jZ
         QaHHqQJIsmpOqcYpMa3JZN6itOJgr5QW/zWJNNb1K2mj4sU4t55OUoFh+XZN6SdCW7wl
         oHBKrWRfxJlKzr+U1dC2VGVPKCjCic7go2dqoF0GxBc+dRy0OYPqrl29WG9WMoBv+FS4
         X/vA==
X-Gm-Message-State: AOJu0YzDAdSlyqMvTIF8oZW+dgEYmodgnQ6Kzf4l2j9Ok7KWHEbEyHOd
        vry0gd918zjDu05pqEVOJOI=
X-Google-Smtp-Source: AGHT+IHD++PBcpdui/9TiMk2cEZAWtW2G937tYwxgv12fWXW2nUrbT0fGTjquMvR9nVleeurC6RC4g==
X-Received: by 2002:a81:9897:0:b0:5a7:bfc6:96aa with SMTP id p145-20020a819897000000b005a7bfc696aamr4970538ywg.7.1698332995767;
        Thu, 26 Oct 2023 08:09:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r83-20020a819a56000000b005af5ef0687fsm170776ywg.6.2023.10.26.08.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 08:09:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
Date:   Thu, 26 Oct 2023 08:09:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>,
        Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
In-Reply-To: <20231026-dicing-crispy-a10af575d3e5@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/26/23 07:25, Conor Dooley wrote:
> Hey,
> 
> On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
>> Add a device tree bindings for ltc4286 driver.
> 
> Bindings are for devices, not for drivers.
> 
>>
>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>>
>> Changelog:
>>    v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>>       - Add type for adi,vrange-select-25p6
>>       - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
>> ---
>>   .../bindings/hwmon/lltc,ltc4286.yaml          | 50 +++++++++++++++++++
>>   MAINTAINERS                                   | 10 ++++
>>   2 files changed, 60 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>> new file mode 100644
>> index 000000000000..17022de657bb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LTC4286 power monitors
>> +
>> +maintainers:
>> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - lltc,ltc4286
>> +      - lltc,ltc4287
> 
> I don't recall seeing an answer to Guenter about this ltc4287 device:
> https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-us.net/
> 

At least the chip does officially exist now, and a datasheet is available.

https://www.analog.com/en/products/ltc4287.html

It shows that coefficients for the telemetry commands are different,
meaning that indeed both chips need to be explicitly referenced
in the properties description (and handled in the driver, which proves
my point of needing a datasheet before accepting such a driver).

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  adi,vrange-select-25p6:
>> +    description:
>> +      This property is a bool parameter to represent the
>> +      voltage range is 25.6 or not for this chip.
> 
> 25.6 what? Volts? microvolts?
> What about Guenter's suggestion to name this so that it better matches
> the other, similar properties?
> 

I still would prefer one of the more common properties.
I still prefer adi,vrange-high-enable.

Guenter

