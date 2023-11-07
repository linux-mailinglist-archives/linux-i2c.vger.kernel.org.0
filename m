Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235E67E3431
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 04:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbjKGDaE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 22:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjKGDaD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 22:30:03 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE34101;
        Mon,  6 Nov 2023 19:30:01 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b40d5ea323so3099485b6e.0;
        Mon, 06 Nov 2023 19:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699327800; x=1699932600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PR4pVo5ohCGwHvj2+pxLerF4kRjPdh1NPEv5/1jSHx4=;
        b=Oi+Xzv2D9FTOb3PuwjjxVa95VKiD8k9f3ss5eHIqS1OorsO0lwqCilGWK1zn7HXfkE
         zLUaa7o03u6r+Xye3mpol3vRYU8ZGa//i+RYY5A/YZM1cyI1Ub5D+G7BRU1GpOVrEb+U
         f3dSONDl1m2io2tOo+9ijUBsswrfgEhpL/odR4r2EIY3OCwzBLkLIhzdK9OCW2PeUQTs
         1E/qG4w+IvZrm6fRvRF8Y24d1/ThIduec9xqbikmrLF2bciqF8fBDZVn1UcLNLzmLS5q
         FD23SDee0unbIZvyoDGwGBydym4K/BOlYmFfWybX79coQbh1TUKZlcFnH8Huzn34RIIf
         Xkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699327800; x=1699932600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR4pVo5ohCGwHvj2+pxLerF4kRjPdh1NPEv5/1jSHx4=;
        b=Zn3OmU7Nu+FfsTOdTa8ts7yyFf7/pvZKS9EGjZaFWvIlZgwVrAIfMjosKdG/Evzf7k
         tgF++z6zfsqcA355nkUVD6kf2/yTVSYGsefJZxUqjWuP0/NImQju+0urcAAzqaw81Zba
         +KmwefxYN1F71MChj5lEa5vISGPThbI6zA+KXwi8HQXkg6BXu6Z6U9INAKTPqwT0pI6S
         UlLRwHyWdwDvRMugElA/In6wdjzWSxmoKg7wOqjdLWFye/T6pwSPOJhTNa4JXHBf0Su8
         X/GhkjwHXHcuBW4Q0VRnbiFKlhd9hxpINCU/yeGMDnMATFYTxl4rorIu8DRXMm3bpZ40
         ywLA==
X-Gm-Message-State: AOJu0YyGGPu70pecgmOU7AU7QDwxijelFu4VZLyVuPYetFenY3JiXVBu
        0XhIijKKivZAGISbOqodhRZhT2EE6sU=
X-Google-Smtp-Source: AGHT+IEAShhKAbRmLSNX8rcyN/I1anLhJttiPLSsSN41/umy50w0mk0QwS0fSu+C5tP9UscFVJQotQ==
X-Received: by 2002:a05:6358:881f:b0:168:ed99:4e74 with SMTP id hv31-20020a056358881f00b00168ed994e74mr45917676rwb.20.1699327800218;
        Mon, 06 Nov 2023 19:30:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a7-20020a63d407000000b005742092c211sm431141pgh.64.2023.11.06.19.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 19:29:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b73a239-c90e-4515-b89d-65de15a1e9a9@roeck-us.net>
Date:   Mon, 6 Nov 2023 19:29:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To:     Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
 <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
 <SG2PR04MB5543FEAFC1777ADE29239AC9A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e223764a-c081-4634-810b-56886a29804a@roeck-us.net>
 <SG2PR04MB55436CFA902895FD5472838AA1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SG2PR04MB55436CFA902895FD5472838AA1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/6/23 19:08, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Tuesday, October 31, 2023 9:47 PM
>> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
>> patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Jonathan Corbet
>> <corbet@lwn.net>
>> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
>> linux-i2c@vger.kernel.org; linux-hwmon@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> linux-doc@vger.kernel.org
>> Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
>>
>>    Security Reminder: Please be aware that this email is sent by an external
>> sender.
>>
>> On 10/30/23 23:46, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> [ ... ]
>>>>
>>>>> +
>>>>> +     ret = of_property_read_u32(client->dev.of_node,
>>>>> +                                "shunt-resistor-micro-ohms",
>>>> &rsense);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>> +
>>>>> +     if (rsense == 0)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     info = &ltc4286_info;
>>>>> +
>>>>> +     /* Default of VRANGE_SELECT = 1, 102.4V */
>>>>> +     if (device_property_read_bool(&client->dev,
>>>> "adi,vrange-select-25p6")) {
>>>>
>>>> What if the adi,vrange-select-25p6 property is not provided, but the
>>>> chip is programmed for this range ?
>>> The binding document tells programmers how to fill the dts.
>>> Thus, programmers must fill this property if their system is 25.6 volts voltage
>> range.
>>>
>>
>> Sure, but there is no else case, meaning VRANGE_SELECT is unmodified in that
>> case. There is no guarantee that the chip is in its power-on state.
> 
> The else case is in v2 ltc4286.c line 133
> It means that the voltage range for programmer is 102.4 volts which is default value,
> so driver doesn't need to do any change for VRANGE_SELECT bit.

There is no guarantee that the value wasn't changed before the driver was loaded.

Guenter

> Additionally, we have checked the behavior of VRANGE_SELECT bit with vendor.
> Below is the reply from vendor:
> [Our question]
> If we change the VRANGE_SELECT bit value to 0, the value would return to default after we restart this device?
> Or VRANGE_SELECT bit value would never change util someone change its value?
> [ADI reply]
> chip reset will go back to default. Thanks.
> 
> Thus, we must overwrite this bit if the user fill adi,vrange-select-25p6 here whenever driver probes
> 
>>
>> Guenter
> 

