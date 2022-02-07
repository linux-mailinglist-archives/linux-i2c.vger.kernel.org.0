Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA184AC5F1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 17:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343941AbiBGQhI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 11:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389592AbiBGQXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 11:23:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFE1C0401CE;
        Mon,  7 Feb 2022 08:23:40 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F51E340;
        Mon,  7 Feb 2022 17:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644251018;
        bh=L1PNPDKuRthTmWHneC7DGneT0OsniCKt5ocgM/FNQAY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BqSyY3N9mtxsy25nRjBW5T78kRfJz96/jgatmXIrtYT46e3ydtE3XQltgPIKu4eG2
         JVhMdzeLVoS1fdiihqmTjRAfFoWFDet4vOnrYnIac4c1CB+ib+EYucB7v7eoDwvS70
         5H76j7o+xSqgnmfUuYyhHHCRDaTVWUpYQc0vkxf0=
Message-ID: <ef6eec20-6c1b-4c27-e5ad-5fb87300c6ba@ideasonboard.com>
Date:   Mon, 7 Feb 2022 18:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
 <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
 <74bacec6-35e5-346a-fb05-09ae44fc5592@lucaceresoli.net>
 <608d23fc-eef7-c0dc-de5b-53b140fe2d0f@fi.rohmeurope.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <608d23fc-eef7-c0dc-de5b-53b140fe2d0f@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/02/2022 16:38, Vaittinen, Matti wrote:
> Hi again Luca,
> 
> On 2/7/22 16:07, Luca Ceresoli wrote:
>> Hi Matti,
>>
>> On 07/02/22 14:21, Vaittinen, Matti wrote:
>>> Hi dee Ho peeps,
>>>
>>> On 2/7/22 14:06, Tomi Valkeinen wrote:
>>>> Hi Luca,
>>>>
>>>> On 06/02/2022 13:59, Luca Ceresoli wrote:
>>>>> this RFCv3, codename "FOSDEM Fries", of RFC patches to support the TI
>>>>> DS90UB9xx serializer/deserializer chipsets with I2C address translation.
>>>
>>>
>>> I am not sure if I am poking in the nest of the wasps - but there's one
>>> major difference with the work I've done and with Toni's / Luca's work.
>>
>> You are. ;)
>>
>>> The TI DES drivers (like ub960 driver) packs pretty much everything
>>> under single driver at media/i2c - which (in my opinion) makes the
>>> driver pretty large one.
>>>
>>> My approach is/was to utilize MFD - and prepare the regmap + IRQs in the
>>> MFD (as is pretty usual) - and parse that much of the device-tree that
>>> we see how many SER devices are there - and that I get the non I2C
>>> related DES<=>SER link parameters set. After that I do kick alive the
>>> separate MFD cells for ATR, pinctrl/GPIO and media.
>>>
>>> The ATR driver instantiates the SER I2C devices like Toni's ub960 does.
>>> The SER compatible is once again matched in MFD (for SER) - which again
>>> provides regmap for SER, does initial I2C writes so SER starts
>>> responding to I2C reads and then kicks cells for media and pinctrl/gpio.
>>>
>>> I believe splitting the functionality to MFD subdevices makes drivers
>>> slightly clearer. You'll get GPIOs/pinctrl under pinctrl as usual,
>>> regmaps/IRQ-chips under MFD and only media/v4l2 related parts under media.
>>
>> There has been quite a fiery discussion about this in the past, you can
>> grab some popcorn and read
>> https://lore.kernel.org/linux-media/20181008211205.2900-1-vz@mleia.com/T/#m9b01af81665ac956af3c6d57810239420c3f8cee
>>
>> TL;DR: there have been strong opposition the the MFD idea.
> 
> Hm. I may be missing something but I didn't see opposition to using MFD
> or splitting the drivers. I do see opposition to adding _functionality_
> in MFD. If I read this correctly, Lee did oppose adding the I2C stuff,
> sysfs attributes etc in MFD. Quoting his reply:
> 
> "This driver does too much real work ('stuff') to be an MFD driver.
> MFD drivers should not need to care of; links, gates, modes, pixels,
> frequencies maps or properties.  Nor should they contain elaborate
> sysfs structures to control the aforementioned 'stuff'.
> 
> Granted, there may be some code in there which could be appropriate
> for an MFD driver.  However most of it needs moving out into a
> function driver (or two)."
> 
> And I tend to agree with Lee here. I would not put I2C bridge stuff or
> sysfs attributes in MFD. But I think it does not mean SERDESes should
> not use MFD when they clearly contain more IP blocks than the
> video/media ones :) I am confident Lee and others might be much more
> welcoming for driver which simply configures regmap and kicks subdriver
> for doing the ATR / I2C stuff.

I admit that I don't know MFD drivers too well, but I was thinking about 
this some time back and I wasn't quite sure about using MFD here.

My thinking was that MFD is fine and good when a device contains more or 
less independent functionalities, like a PMIC with, say, gpios and 
regulators, both of which just work as long as the PMIC is powered up.

Here all the functionalities depend on the link (fpdlink or some other 
"link" =), and the serializers. In other words, the link status or any 
changes to the link or the serializers might affect the GPIO/I2C/IRQ 
functionalities.

So, I don't have any clear concern here. Just a vague feeling that the 
functionalities in this kind of devices may be more tightly tied 
together than in normal MFDs. I could be totally wrong here.

  Tomi
