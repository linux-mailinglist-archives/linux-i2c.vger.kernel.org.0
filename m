Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8862C67DF02
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 09:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjA0IYO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 03:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjA0IYN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 03:24:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0817C4FC31;
        Fri, 27 Jan 2023 00:24:11 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 677642B3;
        Fri, 27 Jan 2023 09:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674807849;
        bh=niDyqFDWqiArhyvutjU5y1QCfPrstLEbn01CZDRz5yE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=utkgh9xOt6RyqBx6BRc/W34PP9y14HzAXTXaBKoL3rvxkL6KE9OECUZ1heRpNHJeX
         0Dsr4fWmfVtEo7R8n7LYjtRfsypG6KJbXRpzPVPYBy8wPmiH63QRRpEZAEIhmXC5TS
         WUClIj0vn6sCqbXsRJOuhx+TypGzwsYmbM9gnN54=
Message-ID: <0c13eac3-cadb-b923-d475-7851dbef0c4e@ideasonboard.com>
Date:   Fri, 27 Jan 2023 10:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
 <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
 <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
 <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
 <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
 <Y9FBlMl4b3l1zVck@smile.fi.intel.com>
 <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
 <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
 <04a82b08-524f-8d03-ac47-73d826907fc3@ideasonboard.com>
 <Y9JUEv66Gze8FjMZ@smile.fi.intel.com>
 <Y9JbMjPM3Ea3RVzH@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y9JbMjPM3Ea3RVzH@pendragon.ideasonboard.com>
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

On 26/01/2023 12:51, Laurent Pinchart wrote:
> On Thu, Jan 26, 2023 at 12:21:06PM +0200, Andy Shevchenko wrote:
>> On Thu, Jan 26, 2023 at 10:41:47AM +0200, Tomi Valkeinen wrote:
>>> On 25/01/2023 17:27, Andy Shevchenko wrote:
>>
>> ...
>>
>>>> But I probably don't understand the ATR structure and what exactly we need to
>>>> pass to it, perhaps it also can be replaced with properties (note, that we have
>>>> some interesting ones that called references, which is an alternative to DT
>>>> phandle).
>>>
>>> Well, maybe this needs a Linux bus implementation. I'm not that familiar
>>> with implementing a bus, but I think that would make it easier to share data
>>> between the deserializer and the serializer. A bus sounds a bit like an
>>> overkill for a 1-to-1 connection, used by a few drivers, but maybe it
>>> wouldn't be too much code.
>>
>> Have you looked at auxiliary bus (appeared a few releases ago in kernel)?
> 
> As far as I understand, the auxiliary bus infrastructure is meant for
> use cases where a single hardware device needs to be split into multiple
> logical devices (as in struct device). Platform devices were
> historically (ab)used for this, and the auxiliary bus is meant as a
> cleaner solution. I'm not sure if it would be a good match here, or if
> it would be considered an abuse of the auxiliary bus API.

The aux bus docs say "A key requirement for utilizing the auxiliary bus 
is that there is no dependency on a physical bus, device, register 
accesses or regmap support. These individual devices split from the core 
cannot live on the platform bus as they are not physical devices that 
are controlled by DT/ACPI.", which doesn't sound like a good fit.

The deserializer and serializers are currently independent devices and 
drivers (the pdata is the only shared thing), but I think we may need 
something better here. The devices are more tightly tied together than 
"normal" video devices, in my opinion, as the serializer is fully 
controlled by the deserializer (including power).

And if we ever want to implement something like power management, we 
probably need something more than what we have now. Although I don't 
know how that would be done, as all the peripherals behind the 
serializer would also lose power...

  Tomi

