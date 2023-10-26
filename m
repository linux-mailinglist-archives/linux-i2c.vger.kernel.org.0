Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643F87D86EE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 18:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjJZQsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 12:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjJZQsk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 12:48:40 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C68187;
        Thu, 26 Oct 2023 09:48:38 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9c2420e417so841084276.2;
        Thu, 26 Oct 2023 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698338916; x=1698943716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sO6k4iZXI5gVc3XI9r4gXhrXrv6eyD5MBhD8ODEC+L4=;
        b=GYUyJ7qEaUZXlf7AxtOUku7IHZgOCWYDH8ZyCRmF3JBvFgxol9ZNinIEEiomr17OkH
         VKZRXYHnXIxegcJtPkFQ7u3Dk/5oxkz8MTN9b1k0pvC6SVygb6Wg/5+vGaf8icxi+ail
         xHagSKb9bWDlo4nlUOV5T0ukXfovkVZ/Kih2U3+sD9Nx95BcHdSqfqPOrL5BNNueAFCs
         mxXgMmpzVYRkOXp7ISuyWwON7m5HxnmwZ4gfEb8u3LV16znPHu4seybCSFsa+XwfIoul
         gHUDj1vuXFILv97rjgoBV3m9BY02ecbZVCTp/xIIuQHhYJ2eqfLyw1iU3+j9rxsNQMNQ
         2KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698338916; x=1698943716;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sO6k4iZXI5gVc3XI9r4gXhrXrv6eyD5MBhD8ODEC+L4=;
        b=IILNfciy+lKlnpzIxKHi9garQj79ALNsnkFmUus7zDQ6FE6kcrL6P0EkXTW6gG0X5o
         yLJtZ+qiUxiyVPxMvB0ixamapb77TQpqXcyRsWRhip7E9a3H+YiZF2v4JLdL4REvUjt2
         v2lMjDd3pRmWdFt0dYaSnEzfIyZKmKiVf0/uC69H+bTSRfs+UoZOW9EqlF+UTWiziS6j
         BkOb0cwysxq4XrRgkijjLki/SdG6yRMovLUaJmwI5NL0uugbFmqWHYUbpR2CEZZrpxnI
         QpknYVzHGvMHNJB952mn+aNTUfx7udUoK6cskB20ZHoZA9vJG6jWgcr1Gl9CBM09rtzb
         n3oQ==
X-Gm-Message-State: AOJu0YwplExLMIgBp3UHVv/svniZvRh/OOXRfRPkL6sMjotzr8V7E0Mj
        y8bUILnmkf88Slyf3xGCSpw1Jt99ESo=
X-Google-Smtp-Source: AGHT+IHZicZw0ErmgnGn0eZoIV1A4A1z0FPCfOFw/7XqKlelGMvCvWAzGMCYmtflZX1FmEOQs7gbAQ==
X-Received: by 2002:a25:494:0:b0:d91:b6e5:54dd with SMTP id 142-20020a250494000000b00d91b6e554ddmr19928537ybe.3.1698338916486;
        Thu, 26 Oct 2023 09:48:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e78-20020a256951000000b00d9ab95777ecsm2150923ybc.49.2023.10.26.09.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 09:48:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c734e26a-6fad-bc23-ec58-10c6a440ec83@roeck-us.net>
Date:   Thu, 26 Oct 2023 09:48:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
 <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
 <20231026-poison-encrypt-1df55e023867@spud>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
In-Reply-To: <20231026-poison-encrypt-1df55e023867@spud>
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

On 10/26/23 08:26, Conor Dooley wrote:
> On Thu, Oct 26, 2023 at 08:09:52AM -0700, Guenter Roeck wrote:
>> On 10/26/23 07:25, Conor Dooley wrote:
>>> Hey,
>>>
>>> On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
>>>> Add a device tree bindings for ltc4286 driver.
>>>
>>> Bindings are for devices, not for drivers.
>>>
>>>>
>>>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>>>>
>>>> Changelog:
>>>>     v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>>>>        - Add type for adi,vrange-select-25p6
>>>>        - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
>>>> ---
>>>>    .../bindings/hwmon/lltc,ltc4286.yaml          | 50 +++++++++++++++++++
>>>>    MAINTAINERS                                   | 10 ++++
>>>>    2 files changed, 60 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>>>> new file mode 100644
>>>> index 000000000000..17022de657bb
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>>>> @@ -0,0 +1,50 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: LTC4286 power monitors
>>>> +
>>>> +maintainers:
>>>> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - lltc,ltc4286
>>>> +      - lltc,ltc4287
>>>
>>> I don't recall seeing an answer to Guenter about this ltc4287 device:
>>> https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-us.net/
>>>
>>
>> At least the chip does officially exist now, and a datasheet is available.
>>
>> https://www.analog.com/en/products/ltc4287.html
>>
>> It shows that coefficients for the telemetry commands are different,
>> meaning that indeed both chips need to be explicitly referenced
>> in the properties description (and handled in the driver, which proves
>> my point of needing a datasheet before accepting such a driver).
> 
> Oh neat, would've been good if that'd been mentioned!
> 

Actually, turns out there is some contradiction in the LTC4286 datasheet.
It mentions different coefficients in different places. It is all but
impossible to determine if the datasheet is wrong or if the chip uses
a variety of coefficients unless one has a real chip available. Sigh :-(.

>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  adi,vrange-select-25p6:
>>>> +    description:
>>>> +      This property is a bool parameter to represent the
>>>> +      voltage range is 25.6 or not for this chip.
>>>
>>> 25.6 what? Volts? microvolts?
>>> What about Guenter's suggestion to name this so that it better matches
>>> the other, similar properties?
>>>
>>
>> I still would prefer one of the more common properties.
>> I still prefer adi,vrange-high-enable.
> 
> I think, from reading the previous version, that this is actually the
> lower voltage range, as there is a 102.x $unit range too that is the
> default in the hardware. Obviously, the use of the property could be
> inverted to match that naming however.
> 

It needs to be programmed either way because it is unknown how the chip
has been programmed before. That means some action is needed no matter
if the property is provided or not.

Sure, we could add something like adi,vrange-low-enable. Not sure if
that would be any better.

Actually, after looking at the datasheets, I'd be more interested
in the impact of other configuration buts such as VPWR_SELECT
which selects the voltage used for power calculations, or
all the settings in MFR_ADC_CONFIG. The datasheet doesn't really
explain (or I can't figure out how it does) how the different
configurations affect the reported telemetry values. But that is
a question for the driver, not for the property description.

Guenter

