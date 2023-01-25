Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964B467B354
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 14:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbjAYNdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 08:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbjAYNdn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 08:33:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E645C366B1;
        Wed, 25 Jan 2023 05:33:41 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 980076E0;
        Wed, 25 Jan 2023 14:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674653619;
        bh=dKBgju70MFJqf2CRYXDiM5DEgZzSi9XFzToHAh5eN0A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e6IMWJsVU8C5HlyGuTDDLApH6HtDir3PTAkQ9Bhj8rpttoIHWv96F4/s2LTAIHk6O
         OiH/ceRHwNc5aaB5YB466v3JR/lu/F7ly+gf+TYd4xNsau2P4MWeiVNj488HhjTnp0
         Ti/EfYbyMX+Uq+JEcQfchcgRGZW8FPiX4JCvWcDM=
Message-ID: <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
Date:   Wed, 25 Jan 2023 15:33:35 +0200
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
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

On 25/01/2023 14:10, Andy Shevchenko wrote:
> On Wed, Jan 25, 2023 at 01:15:34PM +0200, Tomi Valkeinen wrote:
>> On 20/01/2023 18:47, Andy Shevchenko wrote:
> 
> ...
> 
>>>>> Esp. taking into account that some of them are using actually
>>>>> post-inc. Why this difference?
>>>>
>>>> Possibly a different person has written that particular piece of code, or
>>>> maybe a copy paste from somewhere.
>>>>
>>>> I'm personally fine with seeing both post and pre increments in code.
>>>
>>> I'm not :-), if it's not required by the code. Pre-increment always puzzles
>>> me: Is here anything I have to pay an additional attention to?
>>
>> That is interesting, as to me pre-increment is the simpler, more obvious
>> case. It's just:
>>
>> v = v + 1
>> v
>>
>> Whereas post-increment is:
>>
>> temp = v
>> v = v + 1
>> temp
>>
>> In any case, we're side-tracking here, I think =).
> 
> Yes, just see the statistics of use below.
> 
> ...
> 
>>>>>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
>>>>>
>>>>> Post-inc?
>>>>
>>>> I still like pre-inc =).
>>>>
>>>> I see there's a mix os post and pre incs in the code. I'll align those when
>>>> I encounter them, but I don't think it's worth the effort to methodically go
>>>> through all of them to change them use the same style.
>>>
>>> Kernel uses post-inc is an idiom for loops:
>>>
>>> $ git grep -n -w '[_a-z0-9]\+++' | wc -l
>>> 148693
>>>
>>> $ git grep -n -w ' ++[a-z0-9_]\+' | wc -l
>>> 8701
>>>
>>> So, non-standard pattern needs to be explained.
> 
>>>>>> +	}
> 
> ...
> 
>>>>>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
>>>>>> +	if (ret) {
>>>>>> +		if (ret != -EINVAL) {
>>>>>> +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
>>>>>> +				nport, ret);
>>>>>> +			return ret;
>>>>>> +		}
>>>
>>> This seems like trying to handle special cases, if you want it to be optional,
>>> why not ignoring all errors?
>>
>> I don't follow. Why would we ignore all errors even if the property is
>> optional? If there's a failure in reading the property, or checking if it
>> exists or not, surely that's an actual error to be handled, not to be
>> ignored?
> 
> What the problem to ignore them?

Well, probably nothing will explode if we just ignore them. But... Why 
would we ignore them?

> But if you are really pedantic about it, perhaps the proper way is to add
> 
> fwnode_property_*_optional()
> 
> APIs to the set where you take default and return 0 in case default had been
> used for the absent property.

Perhaps, but I don't have a default value here.

In any case, I'm not quite sure what you are arguing here. Is it just 
that you don't think the error check is necessary and should be dropped?

>>>>>> +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
>>>>>> +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
>>>>>> +			eq_level);
>>>
>>> This part is a validation of DT again, but we discussed above this.
>>>
>>>>>> +	} else {
>>>>>> +		rxport->eq.manual_eq = true;
>>>>>> +		rxport->eq.manual.eq_level = eq_level;
>>>>>> +	}
> 
> ...
> 
>>>>>> +struct ds90ub9xx_platform_data {
>>>>>> +	u32 port;
>>>>>> +	struct i2c_atr *atr;
>>>>>> +	unsigned long bc_rate;
>>>>>
>>>>> Not sure why we need this to be public except, probably, atr...
>>>>
>>>> The port and atr are used by the serializers, for atr. The bc_rate is used
>>>> by the serializers to figure out the clocking (they may use the FPD-Link's
>>>> frequency internally).
>>>
>>> The plain numbers can be passed as device properties. That's why the question
>>> about platform data. Platform data in general is discouraged to be used in a
>>> new code.
>>
>> Device properties, as in, coming from DT?
> 
>  From anywhere.
> 
>> The port could be in the DT, but
>> the others are not hardware properties.
> 
> Why do we need them? For example, bc_rate.

The atr pointer is needed so that the serializers (ub913, ub953) can add 
their i2c adapter to the deserializer's i2c-atr. The port is also needed 
for that.

The bc rate (back-channel rate) is the FPD-Link back-channel rate which 
the serializers use for various functionalities. At the moment only the 
ub953 uses it for calculating an output clock rate.

The bc-rate could be implemented using the clock framework, even if it's 
not quite a plain clock. I had that code at some point, but it felt a 
bit off and as we needed the pdata for the ATR, I added the bc-rate there.

>> Yes, I don't like using platform data. We need some way to pass information
>> between the drivers.
> 
> Device properties allow that and targeting to remove the legacy platform data
> in zillions of the drivers.

Do you have any pointers to guide me into the right direction? I 
couldn't find anything with some grepping and googling.

If you mean "device properties" as in ACPI, and so similar to DT 
properties, aren't those hardware properties? Only the port here is 
about the hardware.

  Tomi

