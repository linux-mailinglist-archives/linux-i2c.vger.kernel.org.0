Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56037DA58D
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 09:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbjJ1HwF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 03:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjJ1HwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 03:52:04 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0740F2
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 00:52:01 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507bd19eac8so4103951e87.0
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698479520; x=1699084320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JGrC62Cz8tBAzGwSj9i2LT+uBMbAYtDqXM1Ad8lHqzA=;
        b=nFtVMIlFIFf+8sR4R0XlHbvtZelA+ycLPD0/c6bX7KTdr3K3QI5iUX90HthCcRi2zw
         syLOW8hYeIjKuvdfkTJI1pMC98iQ+v7zMI0YEGJBFz99C1P0GPf6SUM0e3OQXICp8z+1
         2UGrHS09+YHdsglqN+3XaE7Pkpk47wiuRS2ik087e5BJDhDgHNDEmU29U8pcys0NBshX
         KgzaDEEgA6VaexT8QvQJkm1A5PIxwgRwVAbAf3qaUz+vc1rwL9OpLC1AhQacJPqImwMj
         dYIc6hJJK2fk+Aa4ztatdTGrqObzi8LBye9EjQ0ikupuE5wGOFWveta8N4qq4IG07Xzl
         z9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698479520; x=1699084320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGrC62Cz8tBAzGwSj9i2LT+uBMbAYtDqXM1Ad8lHqzA=;
        b=lYySu+k2uyrr0TbDZC+pZXVU0xQuIQbZeOr+seDzn/zSI8BongRKNI0u9m9ZfTwg1G
         7FV0jjQOz9ikQcssznMEt1/DLQdQsMeZpGZTZjjSEGxpuxJS1BnFtB5ncj7PAVholJtT
         NKCiIclZTrgzOsfb6YYNBdJMNJoJ2HG8Kll2waNMTAZ0wyLbZNwZBGawDJ5ohyFA+D9f
         nmKjEywDOGnEcnjhBrdJmNBBiXTx28tbkuYTQSvaA+GTA12JDkdkx2HTjscjbQ7LpOHG
         tUkE6Edof4i+ebmWz+3Z+7uoQKMdz9lS/eYqIfOrTYdUl5S6xW0bXNZOVdAfbfvGltI4
         1gkA==
X-Gm-Message-State: AOJu0YwuTMP/ub2hfoVRpThNK2Mdei4ApIawriAwScoSf7h6dGJbt9iR
        z3cH70jqqbCXE4uXGx11gfjsAn7ILSbLPwYhd+0=
X-Google-Smtp-Source: AGHT+IG8LT/8/vtU2oKWwFpAMqaM3pCankZtGfV9VOeL4k5QH3ciVGVBmiMoJtNVwFA0oXEl73CDsQ==
X-Received: by 2002:ac2:446e:0:b0:4fe:2f8a:457e with SMTP id y14-20020ac2446e000000b004fe2f8a457emr3252303lfl.43.1698479519924;
        Sat, 28 Oct 2023 00:51:59 -0700 (PDT)
Received: from [192.168.0.22] ([78.10.206.168])
        by smtp.gmail.com with ESMTPSA id f9-20020a19ae09000000b00507ce053ca4sm561987lfc.66.2023.10.28.00.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 00:51:59 -0700 (PDT)
Message-ID: <7260268c-c646-426c-90d6-edd1fc3e1f46@linaro.org>
Date:   Sat, 28 Oct 2023 09:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: mv64xxx: add bus-reset-gpios
 property
To:     Rob Herring <robh@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        krzysztof.kozlowski+dt@linaro.org, gregory.clement@bootlin.com,
        andi.shyti@kernel.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-2-chris.packham@alliedtelesis.co.nz>
 <ZTt+ZgNe5Y35E/C2@shikoro> <7bfa2f6c-3e99-49a6-9b5a-81398d4bce7e@linaro.org>
 <20231027192236.GA2946793-robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231027192236.GA2946793-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/10/2023 21:22, Rob Herring wrote:
> On Fri, Oct 27, 2023 at 01:25:56PM +0200, Krzysztof Kozlowski wrote:
>> On 27/10/2023 11:09, Wolfram Sang wrote:
>>> On Fri, Oct 27, 2023 at 04:31:03PM +1300, Chris Packham wrote:
>>>> Add bus-reset-gpios and bus-reset-duration-us properties to the
>>>> marvell,mv64xxx-i2c binding. These can be used to describe hardware
>>>> where a common reset GPIO is connected to all downstream devices on and
>>>> I2C bus. This reset will be asserted then released before the downstream
>>>> devices on the bus are probed.
>>>>
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Krzysztof, are you fine with this change?
>>
>> Actually no. NAK.
>>
>> Not because of the naming, but because the new name triggered some new
>> paths in my brain which brought the point - this is old problem of power
>> sequencing of children.
>>
>> I believe this must be solved in more generic way. First - generic for
>> all I2C devices. Second - generic also matching other buses/subsystems,
>> which have similar problem. We did it for USB (onboard USB), MMC
>> (unloved MMC power sequence) and now we are doing it for PCIe and few
>> others (Cc: Abel)
> 
> Unlike the others I2C doesn't expect to access the bus/device before 
> devices probe, right?
> 
>> https://lpc.events/event/17/contributions/1507/
> 
> Oh, good!
> 
>> Current solution is heavily limited. What about regulators? What about
>> buses having 2 reset lines (still the same bus)? What about sequence?
> 
> A more complicated case should be handled by the device's driver. If the 
> GPIO reset was not shared we'd be handling it there too. I think what's 
> needed is to solve the shared aspect. That's already done with reset 
> subsys, so I think making 'reset-gpios' handled by it too is the way 
> forward. That would handle the QCA WiFi/BT case I think.
> 
> I'm not sure waiting for that or something else to happen is worth 
> holding up this simple case. It's not the only case of a common reset 
> for a bus (MDIO).

I argue also that this bus-reset-gpios is not a property of this I2C
controller. IIUC, the I2C controller does not have a line to reset all
children. It's the children who have reset lines and it happens it is
shared. Just like my WSA884x case:
https://lore.kernel.org/alsa-devel/84f9f1c4-0627-4986-8160-b4ab99469b81@linaro.org/


Best regards,
Krzysztof

