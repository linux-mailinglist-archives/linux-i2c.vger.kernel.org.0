Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240D767C617
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 09:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjAZIl4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 03:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234095AbjAZIlz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 03:41:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42554101;
        Thu, 26 Jan 2023 00:41:54 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8A802B3;
        Thu, 26 Jan 2023 09:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674722511;
        bh=3Sn2T7DMDWtvzEED2cak6HvLalouEIQ7lEIkSxU3JQA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gjKVterZbX4h4nkyhb0l49OHnESdB5QVCQpmCzl7sH0SfkVlFGElC3gCBMGaF5JSB
         89TpgOOCGNLfvDf1Wx+c4q310/yfCIbpFq1nwU0ih+pzuwv9fP8ILxNlXdZ+BkQD3p
         +fWYWm0c3ojmvv0vWPmzpXYKDS1T1kas4Ag1Y86U=
Message-ID: <04a82b08-524f-8d03-ac47-73d826907fc3@ideasonboard.com>
Date:   Thu, 26 Jan 2023 10:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
 <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
 <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
 <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
 <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
 <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
 <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
 <Y9FBlMl4b3l1zVck@smile.fi.intel.com>
 <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
 <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25/01/2023 17:27, Andy Shevchenko wrote:

>>>>>>>>>> +struct ds90ub9xx_platform_data {
>>>>>>>>>> +	u32 port;
>>>>>>>>>> +	struct i2c_atr *atr;
>>>>>>>>>> +	unsigned long bc_rate;
>>>>>>>>>
>>>>>>>>> Not sure why we need this to be public except, probably, atr...
>>>>>>>>
>>>>>>>> The port and atr are used by the serializers, for atr. The bc_rate is used
>>>>>>>> by the serializers to figure out the clocking (they may use the FPD-Link's
>>>>>>>> frequency internally).
>>>>>>>
>>>>>>> The plain numbers can be passed as device properties. That's why the question
>>>>>>> about platform data. Platform data in general is discouraged to be used in a
>>>>>>> new code.
>>>>>>
>>>>>> Device properties, as in, coming from DT?
>>>>>
>>>>>    From anywhere.
>>>>>
>>>>>> The port could be in the DT, but
>>>>>> the others are not hardware properties.
>>>>>
>>>>> Why do we need them? For example, bc_rate.
>>>>
>>>> The atr pointer is needed so that the serializers (ub913, ub953) can add
>>>> their i2c adapter to the deserializer's i2c-atr. The port is also needed for
>>>> that.
>>>>
>>>> The bc rate (back-channel rate) is the FPD-Link back-channel rate which the
>>>> serializers use for various functionalities. At the moment only the ub953
>>>> uses it for calculating an output clock rate.
>>>>
>>>> The bc-rate could be implemented using the clock framework, even if it's not
>>>> quite a plain clock. I had that code at some point, but it felt a bit off
>>>> and as we needed the pdata for the ATR, I added the bc-rate there.
>>>
>>> And I don't see why it is not a property of the device.
>>
>> It with a "property of the device" you mean a hardware property, it's not
>> because we don't know it, it can be changed at runtime. It's not supposed to
>> change after probing the serializer, but up to that point it can change.
> 
> Yes, which is still property of the device, isn't it?

No, I don't see it as a property of the serializer device.

The deserializer sends messages to the serializer over the back-channel. 
The rate of the back-channel is defined by the clock used for 
deserializer's refclock, and internal deserializer configuration. The 
serializer may use the back-channel rate for its own operations.

>>>>>> Yes, I don't like using platform data. We need some way to pass information
>>>>>> between the drivers.
>>>>>
>>>>> Device properties allow that and targeting to remove the legacy platform data
>>>>> in zillions of the drivers.
>>>>
>>>> Do you have any pointers to guide me into the right direction? I couldn't
>>>> find anything with some grepping and googling.
>>>>
>>>> If you mean "device properties" as in ACPI, and so similar to DT properties,
>>>> aren't those hardware properties? Only the port here is about the hardware.
>>>
>>> About hardware, or PCB, or as quirks for missing DT/ACPI/any FW properties,
>>> like clock rates.
>>>
>>> The Linux kernel layer for that is called software nodes. The rough
>>> approximation to see where and how it's being used can be achieved
>>> by grepping for specific macros:
>>>
>>> 	git grep -lw PROPERTY_ENTRY_.*
>>>
>>> E.g. arch/arm/mach-tegra/board-paz00.c tegra_paz00_wifikill_init()
>>> implementation.
>>
>> Thanks, I'll have a look. But I presume we can only pass "plain" values, so
>> it won't work for the ATR pointer anyway.
> 
> Yes, that's what I have told at the very beginning when answering to your
> patch.
> 
> But I probably don't understand the ATR structure and what exactly we need to
> pass to it, perhaps it also can be replaced with properties (note, that we have
> some interesting ones that called references, which is an alternative to DT
> phandle).

Well, maybe this needs a Linux bus implementation. I'm not that familiar 
with implementing a bus, but I think that would make it easier to share 
data between the deserializer and the serializer. A bus sounds a bit 
like an overkill for a 1-to-1 connection, used by a few drivers, but 
maybe it wouldn't be too much code.

  Tomi

