Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 253FAAD2C1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2019 06:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfIIE41 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Sep 2019 00:56:27 -0400
Received: from mleia.com ([178.79.152.223]:40066 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbfIIE40 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Sep 2019 00:56:26 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id CBC1639C7AA;
        Mon,  9 Sep 2019 04:56:23 +0000 (UTC)
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
From:   Vladimir Zapolskiy <vz@mleia.com>
To:     jacopo mondi <jacopo@jmondi.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
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
Message-ID: <1fb71437-eaa2-99a7-885f-63ee769969aa@mleia.com>
Date:   Mon, 9 Sep 2019 07:56:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <aedad45b-16d6-d189-b045-329727440ca5@mleia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190909_045623_861624_81A29212 
X-CRM114-Status: GOOD (  22.75  )
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca, Jacopo, Wolfram, Peter,

On 09/08/2019 11:45 PM, Vladimir Zapolskiy wrote:
> Hi Luca, Jacopo, Wolfram, Peter,
> 
> On 09/01/2019 05:31 PM, jacopo mondi wrote:
>> Hi Luca,
>>    thanks for keep pushing this series! I hope we can use part of this
>> for the (long time) on-going GMSL work...
>>
>> I hope you will be patient enough to provide (another :) overview
>> of this work during the BoF Wolfram has organized at LPC for the next
>> week.
>>
>> In the meantime I would have some comments after having a read at the
>> series and trying to apply its concept to GMSL
>>
> 
> I won't attend the LPC, however I would appreciate if you book some
> time to review my original / alternative implementation of the TI
> DS90Ux9xx I2C bridge device driver.
> 
> For your convenience the links to the driver are given below:
> * dt bindings: https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#mead5ea226550b
> * driver code: https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#m2fe3664c5f884
> * usage example: https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/#m56c146f5decdc
> 
> The reasons why my driver is better/more flexible/more functional are
> discussed earlier, please let me know, if you expect anything else
> from me to add, also I would be happy to get a summary of your offline
> discussion.

I forgot to repeat my main objection against Luca's approach, the TI
DS90Ux9xx I2C bridge driver does not require to call i2c_add_adapter()
or register a new mux/bus and then do run select/deselect in runtime to
overcome the created handicap.

> The undeniable fact is that the device tree bindings in my I2C bridge
> implementation can be improved further, thanks to Luca for the comments.
> 
>> On Tue, Jul 23, 2019 at 10:37:19PM +0200, Luca Ceresoli wrote:
>>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>>> slave "upstream" port and N master "downstream" ports, and forwards
>>> transactions from upstream to the appropriate downstream port. But is
>>> is different in that the forwarded transaction has a different slave
>>> address. The address used on the upstream bus is called the "alias"
>>> and is (potentially) different from the physical slave address of the
>>> downstream chip.
>>>
>>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>>> implementing ATR features in a device driver. The helper takes care or
>>> adapter creation/destruction and translates addresses at each transaction.
>>>
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>
> 

--
Best wishes,
Vladimir

