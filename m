Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA96A77055A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 17:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjHDP4g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 11:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjHDP4e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 11:56:34 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501CBB2;
        Fri,  4 Aug 2023 08:56:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bb775625e2so15892775ad.1;
        Fri, 04 Aug 2023 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691164593; x=1691769393;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9u4RND7EcPo+OWHsAS1xl3llbbmhoUWKI06kDT5GXQA=;
        b=f9TVjbsQnqdTOVtBDcddw/eT28VsyM3GH4zgMl8jUs2Ex+Iu+6/UH99gPlD3sce1hu
         nsNb8DNhOetzXbl8JUBwkMzL9xyjjBKUNZYilYi8g44YnJTUa/D6LebkRHp+EfRUgnFI
         hOsnDHg5xFsCx+7+vWkf5kM61YQpZwi+cPSaGaBtvdnZo9jmwA2/8DJTMlc8Sr2vy3Uo
         wvbVn1+9VcpvBzYFHZXdyaWtzuXNDemIeuOY/XoBtIcHjWUTEKz48vneslLPMBvS3CxO
         jsr9pGrMK/B+WCPtYlH7BQje7h9qkJbZqutxI6VNfPj6+Zm7ejPpWZE0KKYxinBAE01y
         eTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691164593; x=1691769393;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9u4RND7EcPo+OWHsAS1xl3llbbmhoUWKI06kDT5GXQA=;
        b=LwVxNcD6rJZuCToly3dWiWdlzVUJn3vtZDr7NjE/8ZTwTSYpUDT8pklvPJjZu5Eal0
         v0MB9//YLPtLKm34b4LyxXUSKOSoeK9HIylx95mE4y+LZxKSkhbJmEjLB4eLaOmh4PBg
         cR4tf8ymd9iLJPzDFTQfEiIVyvV5DBgvML3zxR7U8V5mqGL/VkZkJQFWKXB1Z2kjdXbM
         AsH6gEyYXuZHm/bU8PJTKxk55bp0klbc0EYqq9IMw35ZWRMbTx8gb38z5xdXAonYJnoM
         BxQV9D9ithSN1RXvDzGSkNQ4z+1Mxk5SQ8rE+XgsH0hwvc17FhM1dWloCz5xMz8lfGMy
         toYw==
X-Gm-Message-State: AOJu0YznjSuyd2oN+2DSbEvhppd/csvpwji2qBtWxsb+1/KxjlMRKqhO
        ZJz/FbB3k0fINhdcKhQ1+5IPtBvBjE4=
X-Google-Smtp-Source: AGHT+IE+Tztu7bMsg6TruhEs+WPJAVgGUhYxNm5Ur4SydSLd6SpXKMbv1j+c37TJnXD/76t6rZHf8Q==
X-Received: by 2002:a17:902:e88a:b0:1b8:5bca:8256 with SMTP id w10-20020a170902e88a00b001b85bca8256mr50661plg.31.1691164592698;
        Fri, 04 Aug 2023 08:56:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v22-20020a17090331d600b001ac2be26340sm1929528ple.222.2023.08.04.08.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 08:56:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-us.net>
Date:   Fri, 4 Aug 2023 08:56:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Cc:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
 <321a84c6-6d74-4042-a6ce-6229073c8d30@roeck-us.net>
 <SG2PR04MB55436F03F6CAD6D415FDEE40A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e093a52d-e36f-ec26-e218-1e3b3b400e34@roeck-us.net>
 <SG2PR04MB55438E9C5E61ACB9330D829AA10BA@SG2PR04MB5543.apcprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
In-Reply-To: <SG2PR04MB55438E9C5E61ACB9330D829AA10BA@SG2PR04MB5543.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/1/23 22:31, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Monday, July 24, 2023 11:22 AM
>> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
>> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; linux-i2c@vger.kernel.org;
>> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
>> bindings
>>
>>    Security Reminder: Please be aware that this email is sent by an external
>> sender.
>>
>> On 7/23/23 19:12, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>>
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - lltc,ltc4286
>>>>> +      - lltc,ltc4287
>>>>
>>>> There is no LTC4287, at least according to the Analog website.
>>> It has been announced on Analog Devices website.
>>> Please refer to this link:
>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.
>>>
>> analog.com%2Fen%2Fproducts%2Fltc2487.html%23product-overview&data=0
>> 5%7
>>>
>> C01%7CWayne_SC_Liu%40wiwynn.com%7Cd97a86a696a54f28a26408db8bf52
>> 23d%7Cd
>>>
>> a6e0628fc834caf9dd273061cbab167%7C0%7C0%7C638257657193005539%7C
>> Unknown
>>>
>> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
>> wiLCJ
>>>
>> XVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=XrdlzCyq0pcjfv3M6QNX73Ieux0w
>> rfNKzNvv
>>> HgVSH40%3D&reserved=0
>>>
>>
>> No, that is wrong. You are pointing to ltc2487, which is something completely
>> different.
>>
> 
> We have sent e-mail to query about the release date for LTC4287 chip.
> Analog Device reply that they will release this chip in last week of Sep, 2023.
> Please refer to the attachment to review their reply.
> 

At least according to the driver code, LTC4286 and the LTC4287 are functionally
identical. I am kind of puzzled why you insist mentioning the not-yet-existing
LTC4287; instantiating LTC4287 as LTC4286 should work perfectly fine. LTC4287
can always be added as devicetree reference if/when it officially exists.

Care to explain ?

Note: If the chips are _not_ functionally identical, and a follow-up patch will
be needed to add full LTC4287 support to the driver after the chip has been
published, it would be inappropriate to make partial/incomplete changes now.
With that possibility in mind, I am not inclined to accept a driver that is
even mentioning LTC4287 without access to its datasheet because I think it
is important for me to understand the differences and similarities between
the two chips.

Guenter

