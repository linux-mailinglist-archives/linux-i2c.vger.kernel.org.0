Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDDB619B89
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 16:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiKDP1F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 11:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbiKDP0n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 11:26:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB02D2EF64;
        Fri,  4 Nov 2022 08:26:30 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5895415;
        Fri,  4 Nov 2022 16:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667575587;
        bh=3VzQ30cMBk6wTrjtkgYF9rzwEsB+Jh+az5UA0Ad2rNU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NowtYkLtoJJ0QilJeNJ0asKWJP0evDr+fZISuIIqn+BdKixyc3igGHGgGFBAF6PiC
         NqLaBFzyD6OR7eoZ1Y7nSSptb1SUeeLuirN0yFh4nK4vFBHq9h4+esonh1YBDXWWza
         yLaR8p527E9bwT1Y0fDrhMmZJenZ/3A7hgi3SEU4=
Message-ID: <c0f0a5a3-c4bd-97e2-2047-da33bd896310@ideasonboard.com>
Date:   Fri, 4 Nov 2022 17:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
 <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
 <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
 <Y2UH0Wqp6R52tObC@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y2UH0Wqp6R52tObC@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/11/2022 14:38, Andy Shevchenko wrote:
> On Fri, Nov 04, 2022 at 01:59:06PM +0200, Tomi Valkeinen wrote:
>> On 01/11/2022 16:30, Andy Shevchenko wrote:
>>> On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>>> +	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
>>>> +				      &alias_id);
>>>
>>> On one line looks better.
>>
>> I agree, but it doesn't fit into 80 characters. I personally think that's a
>> too narrow a limit, but some maintainers absolutely require max 80 chars, so
>> I try to limit the lines to 80 unless it looks really ugly.
> 
> OK.
> 
> ...
> 
>>>> +	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
>>>> +	     "can't create symlink to atr device\n");
>>>> +	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
>>>> +	     "can't create symlink for channel %u\n", chan_id);
>>>
>>> Why WARNs? sysfs has already some in their implementation.
>>
>> True, and I can drop these if required. But afaics, sysfs_create_link only
>> warns if there's a duplicate entry, not for other errors.
> 
> The problem with WARN that it can be easily converted to real Oops. Do you
> consider other errors are so fatal that machine would need a reboot?

Yes, WARNs are bad, especially as the error here is not critical. I'll 
change these to dev_warn(). (also, I didn't know WARN could be made to 
oops).

> ...
> 
>>>> +	atr_size = struct_size(atr, adapter, max_adapters);
>>>
>>>> +	if (atr_size == SIZE_MAX)
>>>> +		return ERR_PTR(-EOVERFLOW);
>>>
>>> Dunno if you really need this to be separated from devm_kzalloc(), either way
>>> you will get an error, but in embedded case it will be -ENOMEM.
>>
>> Yep. Well... I kind of like it to be explicit. Calling alloc(SIZE_MAX)
>> doesn't feel nice.
> 
> Yeah, but that is exactly the point of returning SIZE_MAX by the helpers from
> overflow.h. And many of them are called inside a few k*alloc*() APIs.
> 
> So, I don't think it's ugly or not nice from that perspective.

Ok, sounds fine to me. I'll drop the check.

>>>> +	atr = devm_kzalloc(dev, atr_size, GFP_KERNEL);
>>>> +	if (!atr)
>>>> +		return ERR_PTR(-ENOMEM);
> 
> ...
> 
>>>> +EXPORT_SYMBOL_GPL(i2c_atr_delete);
>>>
>>> I would put these to their own namespace from day 1.
>>
>> What would be the namespace? Isn't this something that should be
>> subsystem-wide decision? I have to admit I have never used symbol
>> namespaces, and don't know much about them.
> 
> Yes, subsystem is I2C, but you introducing a kinda subsubsystem. Wouldn't be
> better to provide all symbols in the I2C_ATR namespace from now on?
> 
> It really helps not polluting global namespace and also helps to identify
> users in the source tree.

Alright, I'll look into this.

> ...
> 
>>>> +struct i2c_atr {
>>>> +	/* private: internal use only */
>>>> +
>>>> +	struct i2c_adapter *parent;
>>>> +	struct device *dev;
>>>> +	const struct i2c_atr_ops *ops;
>>>> +
>>>> +	void *priv;
>>>> +
>>>> +	struct i2c_algorithm algo;
>>>> +	struct mutex lock;
>>>> +	int max_adapters;
>>>> +
>>>> +	struct i2c_adapter *adapter[0];
>>>
>>> No VLAs.
>>
>> Ok.
>>
>> I'm not arguing against any of the comments you've made, I think they are
>> all valid, but I want to point out that many of them are in a code copied
>> from i2c-mux.
>>
>> Whether there's any value in keeping i2c-mux and i2c-atr similar in
>> design/style... Maybe not.
> 
> You can address my comment by simply dropping 0 in the respective member.

Oh, I thought you meant no "extensible" structs. I'll drop the 0.

  Tomi

