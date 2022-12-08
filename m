Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAEC646BCC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 10:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiLHJXt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 04:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiLHJXs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 04:23:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8875C74E;
        Thu,  8 Dec 2022 01:23:45 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ADBE25B;
        Thu,  8 Dec 2022 10:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670491423;
        bh=6e3cUNNKs0Mbc6lRI0WlQoFsDq6mdyEYot1UJAoMES8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=viWeAjRfAvQDJgnz5ohqc3JZkl7Q+gk/Z3jJt8aK+WmByB4rXDZUkfs2Sg2ZcCA4E
         fddgUjJkVmLM9By1Lr+REp0CsPRxZDIQxfz+uEvj73auGnCvKWwy6r4mo73JXaMmSm
         LmAN/hm7+be8HNS8BQ/HlAqrxUToEAWMkxYNCp2o=
Message-ID: <e2f8d8f2-dd16-fe2a-8413-ba408672801d@ideasonboard.com>
Date:   Thu, 8 Dec 2022 11:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
 <20221102172630.GA4140587-robh@kernel.org>
 <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
 <fb9e9d5e-9c8b-1ce2-5723-efa498d1ba93@fi.rohmeurope.com>
 <8360ac8f-64aa-9edd-a110-903e734739f3@ideasonboard.com>
 <20221111172631.2832ae6c@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221111172631.2832ae6c@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On 11/11/2022 18:26, Luca Ceresoli wrote:
> Hello Tomi, Matti, Wolfram,
> 
> On Thu, 3 Nov 2022 14:32:02 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> On 03/11/2022 14:13, Vaittinen, Matti wrote:
>>> On 11/3/22 13:50, Tomi Valkeinen wrote:
>>>> Hi Rob,
>>>>
>>>> On 02/11/2022 19:26, Rob Herring wrote:
>>>>> On Tue, Nov 01, 2022 at 03:20:27PM +0200, Tomi Valkeinen wrote:
>>>>>> +
>>>>>> +  i2c-alias-pool:
>>>>>
>>>>> Something common or could be? If not, then needs a vendor prefix.
>>>>
>>>> I'll have to think about this. It is related to the i2c-atr, so I think
>>>> it might be a common thing.
>>>
>>> I'd say this should be common. Where the i2c-atr properties should live
>>> is another question though. If the I2C-atr stays as a genericly usable
>>> component - then these bindings should be in a file that can be
>>> referenced by other I2C-atr users (like the UB960 here).
>>
>> Yep. All the links, link, serializer and alias nodes/properties are new
>> things here, and I guess these could be used by other deser-ser systems.
>> That said, I don't have any experience with other systems.
> 
> The i2c-alias-pool was discussed during the RFC,v2 review [1] and it
> was agreed that it should be generic. The same principle should apply
> to the other ATR properties.
> 
> That said, at some point it was also decided that the alias pool should
> just be ditched in favor of an automatic selection of an unused address
> by the i2c core [2] [3]. Maybe that idea has changed, definitely some
> i2c core things needed to be omdified for it to happen, but overall I'm
> still convinced automatic assignment without a pool was a good idea.

Yes, the serializer and the remote peripheral i2c aliases can be 
dynamically reserved at runtime, so the i2c-alias-pool and the i2c-alias 
are, in that sense, not needed.

I haven't looked at this in depth yet, but reading the references you 
gave, it sounds like it's not quite clear what addresses are available 
and what are not.

On the other hand, is dynamic i2c address reservation something that the 
users expect to happen? All i2c devices I have used have always had a 
fixed address in the DT, even if at times the devices may support 
choosing between a few different addresses.

Keeping with that tradition, would it be best to just use fixed i2c 
aliases, defined in the DT, for the serializers and the remote 
peripherals? In the current series this is already the case for 
serializers (with i2c-alias property), but we could do something similar 
for the remote peripherals.

  Tomi

