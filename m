Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D20D69ABFD
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 13:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjBQM5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 07:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjBQM5L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 07:57:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D11A1A951;
        Fri, 17 Feb 2023 04:57:09 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F9E12D8;
        Fri, 17 Feb 2023 13:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676638626;
        bh=Ir7oJf+hvbJDHRFZ81MDofW8bdJd+0sZrLJTMAgzQI4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=L7Hgr8gpFqZHEZgveWosIO7YDT0EBNpnm8sEuO6PQHkHdiTQuUqU/1saRmupcXoiT
         QoBuLmtzyPpZrulfeGlwlGrHahjMfbOns/RNiODEBZkls8M4sqZIFtaSfBwF43l9no
         1bFeIjn0OjjOhcmoWZa2WGBS83ZJjvwUsaESXVNI=
Message-ID: <9f3f0744-f771-cd2c-3b8e-5b79f7a430c7@ideasonboard.com>
Date:   Fri, 17 Feb 2023 14:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 0/8] i2c-atr and FPDLink
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
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
 <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
 <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
 <Y+9j3cYOG+Z0zmyC@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y+9j3cYOG+Z0zmyC@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/02/2023 13:24, Andy Shevchenko wrote:
> On Fri, Feb 17, 2023 at 08:57:32AM +0200, Tomi Valkeinen wrote:
>> On 16/02/2023 17:53, Andy Shevchenko wrote:
>>> On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>>>    	struct i2c_board_info ser_info = {
>>>> -		.of_node = to_of_node(rxport->remote_fwnode),
>>>> -		.fwnode = rxport->remote_fwnode,
>>>
>>>> +		.of_node = to_of_node(rxport->ser.fwnode),
>>>> +		.fwnode = rxport->ser.fwnode,
>>>
>>> Why do you need to have both?!
>>
>> I didn't debug it, but having only fwnode there will break the probing (no
>> match).
> 
> This needs to be investigated. The whole fwnode approach, when we have both
> fwnode and legacy of_node fields in the same data structure, is that fwnode
> _OR_ of_node initialization is enough, when both are defined the fwnode
> should take precedence.
> 
> If your testing is correct (and I have no doubts) it means we have a serious
> bug lurking somewhere.

Having both defined or only of_node defined works for me.

Perhaps the issue is that these drivers only add of_match_table, and 
thus having only .fwnode above is not enough.

Looking at i2c_device_match(), i2c_of_match_device() only uses of_node, 
so perhaps I would need CONFIG_ACPI for acpi_driver_match_device to do 
matching with of_node? Although I don't see the acpi code using fwnode, 
just of_node. Well, I have to say I have no idea without spending more 
time on this.

>>>>    		.platform_data = ser_pdata,
>>>>    	};
> 
> ...
> 
>>> 		cur_vc = desc.entry[0].bus.csi2.vc;
>>>
>>>> +		for (i = 0; i < desc.num_entries; ++i) {
>>>> +			u8 vc = desc.entry[i].bus.csi2.vc;
>>>
>>>> +			if (i == 0) {
>>>> +				cur_vc = vc;
>>>> +				continue;
>>>> +			}
>>>
>>> This is an invariant to the loop, see above.
>>
>> Well, the current code handles the case of num_entries == 0. I can change it
>> as you suggest, and first check if num_entries == 0 and also start the loop
>> from 1.
> 
> You may try to compile both variants and see which one gets lets code.
> I believe it will be mine or they are equivalent in case compiler is clever
> enough to recognize the invariant.

But your suggestion accesses desc.entry[0] even if there are no entries, 
accessing possibly uninitialized memory. In that case it doesn't use it 
for anything, but at least I find that kind of code worrying.

>>>> +			if (vc == cur_vc)
>>>> +				continue;
>>>> +
>>>> +			dev_err(&priv->client->dev,
>>>> +				"rx%u: source with multiple virtual-channels is not supported\n",
>>>> +				nport);
>>>> +			return -ENODEV;
>>>> +		}
> 
> ...
> 
>>>> +	for (i = 0; i < 6; ++i)
>>>>    		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
>>>>    	id[6] = 0;
>>>
>>> Wondering if this magic can be defined.
>>
>> The number of ID registers? Yes, I can add a define.
> 
> Yes.
> 
> ...
> 
> ...
> 
>>>>    	if (ret) {
>>>>    		if (ret != -EINVAL) {
>>>> -			dev_err(dev,
>>>> -				"rx%u: failed to read 'ti,strobe-pos': %d\n",
>>>> -				nport, ret);
>>>> +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
>>>> +				"ti,strobe-pos", ret);
>>>>    			return ret;
>>>>    		}
>>>>    	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
>>>> @@ -3512,8 +3403,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>>>>    	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
>>>>    	if (ret) {
>>>>    		if (ret != -EINVAL) {
>>>> -			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
>>>> -				nport, ret);
>>>> +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
>>>> +				"ti,eq-level", ret);
>>>>    			return ret;
>>>>    		}
>>>>    	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
>>>
>>
>> Hmm, I noticed this one (and the one above) was missing return -EINVAL.
>>
>>> Seems like you may do (in both cases) similar to the above:
>>>
>>> 	var = 0;
>>> 	ret = read_u32();
>>> 	if (ret && ret != -EINVAL) {
>>> 		// error handling
>>> 	}
>>> 	if (var > limit) {
>>> 		// another error handling
>>> 	}
>>
>> That's not the same. You'd also need to do:
>>
>> if (!ret) {
>> 	// handle the retrieved value
>> }
>>
>> which, I think, is not any clearer (perhaps more unclear).
>>
>> What I could do is:
>>
>> if (ret) {
>> 	if (ret != -EINVAL) {
>> 		dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
>> 			"ti,eq-level", ret);
>> 		return ret;
>> 	}
>> } else {
>> 	if (eq_level > UB960_MAX_EQ_LEVEL) {
>> 		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n",
>> 			nport, eq_level);
>> 		return -EINVAL;
>> 	}
>>
>> 	rxport->eq.manual_eq = true;
>> 	rxport->eq.manual.eq_level = eq_level;
>> }
>>
>> Maybe the above style makes it clearer, as it clearly splits the "don't have
>> value" and "have value" branches.
> 
> Up to you, but this just a good example why I do not like how optional
> properties are handled in a "smart" way.
> 
> To me
> 
> 	foo = DEFAULT;
> 	_property_read_(&foo); // no error checking
> 
> is clean, neat, small and good enough solution.

Yes, if you have a default. I don't. I could add a new magic number for 
the eq_level which means not-defined and use it as a default, but I 
don't usually like default values which are not 0. Here I have the 
manual_eq boolean to tell if we're using manual EQ or not.

  Tomi

