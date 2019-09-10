Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FED2AF095
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 19:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437062AbfIJRke (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 13:40:34 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:34541 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436916AbfIJRke (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Sep 2019 13:40:34 -0400
Received: from [148.69.85.38] (port=22750 helo=[192.168.5.132])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1i7k7v-007JEr-Id; Tue, 10 Sep 2019 19:40:27 +0200
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
To:     Vladimir Zapolskiy <vz@mleia.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <aedad45b-16d6-d189-b045-329727440ca5@mleia.com>
 <1fb71437-eaa2-99a7-885f-63ee769969aa@mleia.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2f883643-6af3-4e34-cf2b-f65fed9392a1@lucaceresoli.net>
Date:   Tue, 10 Sep 2019 18:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1fb71437-eaa2-99a7-885f-63ee769969aa@mleia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vladimir,

On 09/09/19 05:56, Vladimir Zapolskiy wrote:
> Hi Luca, Jacopo, Wolfram, Peter,
> 
> On 09/08/2019 11:45 PM, Vladimir Zapolskiy wrote:
>> Hi Luca, Jacopo, Wolfram, Peter,
>>
>> On 09/01/2019 05:31 PM, jacopo mondi wrote:
>>> Hi Luca,
>>>    thanks for keep pushing this series! I hope we can use part of this
>>> for the (long time) on-going GMSL work...
>>>
>>> I hope you will be patient enough to provide (another :) overview
>>> of this work during the BoF Wolfram has organized at LPC for the next
>>> week.
>>>
>>> In the meantime I would have some comments after having a read at the
>>> series and trying to apply its concept to GMSL
>>>
>>
>> I won't attend the LPC, however I would appreciate if you book some
>> time to review my original / alternative implementation of the TI
>> DS90Ux9xx I2C bridge device driver.
>>
>> For your convenience the links to the driver are given below:
>> * dt bindings: https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#mead5ea226550b
>> * driver code: https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#m2fe3664c5f884
>> * usage example: https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#m56c146f5decdc
>>
>> The reasons why my driver is better/more flexible/more functional are
>> discussed earlier, please let me know, if you expect anything else
>> from me to add, also I would be happy to get a summary of your offline
>> discussion.
> 
> I forgot to repeat my main objection against Luca's approach, the TI
> DS90Ux9xx I2C bridge driver does not require to call i2c_add_adapter()
> or register a new mux/bus and then do run select/deselect in runtime to
> overcome the created handicap.

Whether the ser/deser drivers should or not instantiate an adapter
depends on whether the child I2C bus is a separate bus or it's "the same
bus" as the parent bus. Which in turn is not obvious, and depends on how
you look at it.

On one hand, the child bus looks like it is the same as the parent bus
because transactions on the child bus also happen on the parent bus (bus
not the other way around).

On the other hand the child bus also looks like a separate bus because
it is electrically separated from the parent bus, it can have a
different speed, and devices on one child bus cannot talk with devices
on another child bus under the same ser/deser.

The way you modeled it has the advantage of not requiring a runtime
rewriting of slave addresses. Thas's what I implemented in
i2c_atr_map_msgs(), I don't love the fact that it happens at every
iteration, but its runtime cost is negligible compared to I2C speeds. On
the other hand I'm not sure how your approach would work if you have an
i2c bridge behind another i2c bridge (see the "ATR behind another ATR"
case mentioned by Peter).

By contrast, adding an adapter for each child bus has its advantages. I
didn't have to write code to instantiate the devices, letting the i2c
core do it. Also, as child busses show up as real busses it's possible
to instantiate devices from userspace just like any standard i2c bus with:

  echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-4/new_device

and devices will be assigned an alias and be usable normally.

Finally, there is no need to call select()/deselect() in runtime. Those
callbacks are optional, and I'm probably removing them in a future
iteration as I'm more and more convinced they are not needed at all.

-- 
Luca
