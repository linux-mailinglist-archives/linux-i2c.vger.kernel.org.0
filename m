Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E25617C8D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 13:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiKCMcL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 08:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbiKCMcK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 08:32:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A475D2C2;
        Thu,  3 Nov 2022 05:32:09 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52556589;
        Thu,  3 Nov 2022 13:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667478726;
        bh=FZxcUfj1FmCWOBQW7K09YPCKFrtHQ2cMQSFNaoj6FhU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fF+7EjKN0Av9s26q97YDm4yoKHJQ/b2KSUv1HNYppzCjQndL7NG8rqpqAbu44t1Eu
         q77HPEAbiynZzKAeVrrX4kBF8wYC3zJHpBiY2fSno6/UznCwqHDM+wr+tSnLs+mDHl
         otr+xHruNmFQfH5w/zH+WJtnUsj1nwaiuDD1oYhI=
Message-ID: <8360ac8f-64aa-9edd-a110-903e734739f3@ideasonboard.com>
Date:   Thu, 3 Nov 2022 14:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Rob Herring <robh@kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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
        Wolfram Sang <wsa@the-dreams.de>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
 <20221102172630.GA4140587-robh@kernel.org>
 <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
 <fb9e9d5e-9c8b-1ce2-5723-efa498d1ba93@fi.rohmeurope.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <fb9e9d5e-9c8b-1ce2-5723-efa498d1ba93@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/11/2022 14:13, Vaittinen, Matti wrote:
> On 11/3/22 13:50, Tomi Valkeinen wrote:
>> Hi Rob,
>>
>> On 02/11/2022 19:26, Rob Herring wrote:
>>> On Tue, Nov 01, 2022 at 03:20:27PM +0200, Tomi Valkeinen wrote:
>>>> +
>>>> +  i2c-alias-pool:
>>>
>>> Something common or could be? If not, then needs a vendor prefix.
>>
>> I'll have to think about this. It is related to the i2c-atr, so I think
>> it might be a common thing.
> 
> I'd say this should be common. Where the i2c-atr properties should live
> is another question though. If the I2C-atr stays as a genericly usable
> component - then these bindings should be in a file that can be
> referenced by other I2C-atr users (like the UB960 here).

Yep. All the links, link, serializer and alias nodes/properties are new 
things here, and I guess these could be used by other deser-ser systems. 
That said, I don't have any experience with other systems.

> // snip
> 
>>>> +
>>>> +          i2c-alias:
>>>
>>> Vendor prefix.
>>>
>>>> +            description: |
>>>> +              The i2c address used for the serializer. Transactions
>>>> to this
>>>> +              address on the i2c bus where the deserializer resides are
>>>> +              forwarded to the serializer.
>>>> +
>>>> +          rx-mode:
>>>
>>> Vendor prefix. And so on... >
>> Yes, I totally missed these.
> 
> 
> I think the i2c-alias might need to be common as well?

Perhaps...

I was also thinking that the serializer addresses could be taken from 
the i2c-alias-pool. But maybe that's not a good idea, as the 
serializer-access and remote-peripheral-access are a bit different (e.g. 
no ATR when accessing the serializer).

And I was thinking that, at least here, the alias addresses can be 
"anything", so they could be reserved dynamically at runtime, without 
any predefined aliases. But that might be a bit confusing to the user.

  Tomi

