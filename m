Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD16734FB
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 11:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjASKCF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 05:02:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjASKCB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 05:02:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFCC6E831;
        Thu, 19 Jan 2023 02:01:46 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C80917EC;
        Thu, 19 Jan 2023 11:01:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674122498;
        bh=UjM3igFLWj6BIm/BUGu8Ky1nK53+svqBdHbhRlvGPag=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=t5NoNKtdRHNE8//jhILU0So6+89flupJ//3UXPwuZ9O7joUuk6QKrIbxEidLTByPC
         b3EVcdLss4y5Y+i9WrIFt5TqENJkyK7Y9hAwMkcxomD3VrmB9NzEwKgYS+QrxX769U
         sclAGp8/GrGwTnvxzGkgk5BUTtFK83CoOlST58Nw=
Message-ID: <31562353-0794-8ad4-d609-3c117dd28d46@ideasonboard.com>
Date:   Thu, 19 Jan 2023 12:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
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
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/01/2023 16:23, Andy Shevchenko wrote:
> On Wed, Jan 18, 2023 at 02:40:25PM +0200, Tomi Valkeinen wrote:
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>> slave "upstream" port and N master "downstream" ports, and forwards
>> transactions from upstream to the appropriate downstream port. But is
>> is different in that the forwarded transaction has a different slave
> 
> is is ?

Is is a typo, I'll fix it.

>> address. The address used on the upstream bus is called the "alias"
>> and is (potentially) different from the physical slave address of the
>> downstream chip.
>>
>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>> implementing ATR features in a device driver. The helper takes care or
>> adapter creation/destruction and translates addresses at each transaction.
> 
> ...
> 
>> +A typical example follows.
>> +
>> +Topology::
>> +
>> +                      Slave X @ 0x10
>> +              .-----.   |
>> +  .-----.     |     |---+---- B
>> +  | CPU |--A--| ATR |
>> +  `-----'     |     |---+---- C
>> +              `-----'   |
>> +                      Slave Y @ 0x10
>> +
>> +Alias table:
>> +
>> +.. table::
>> +
>> +   ======   =====
>> +   Client   Alias
>> +   ======   =====
>> +   X        0x20
>> +   Y        0x30
>> +   ======   =====
>> +
>> +Transaction:
>> +
>> + - Slave X driver sends a transaction (on adapter B), slave address 0x10
>> + - ATR driver rewrites messages with address 0x20, forwards to adapter A
>> + - Physical I2C transaction on bus A, slave address 0x20
>> + - ATR chip propagates transaction on bus B with address translated to 0x10
>> + - Slave X chip replies on bus B
>> + - ATR chip forwards reply on bus A
>> + - ATR driver rewrites messages with address 0x10
>> + - Slave X driver gets back the msgs[], with reply and address 0x10
> 
> I'm not sure I got the real / virtual status of the adapters. Are the B and C
> virtual ones, while A is the real?
> 
> ...
> 
>> +#define ATR_MAX_ADAPTERS 99	/* Just a sanity limit */
> 
> Hmm... It's not clear why this is not 100, for example, and how 99 below is
> related to that, assuming channel numbering is started from 0.
> 
>> +#define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */

Right, it should be 100.

I think I set the ATR_MAX_SYMLINK_LEN to 16 just for alignment, but that 
probably doesn't make sense and I should just set ATR_MAX_SYMLINK_LEN to 
11 (10 + zero byte).

> ...
> 
>> +	/* Ensure we have enough room to save the original addresses */
>> +	if (unlikely(chan->orig_addrs_size < num)) {
>> +		u16 *new_buf;
>> +
>> +		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
> 
> I remember that I asked why we don't use krealloc_array() here... Perhaps
> that we don't need to copy the old mapping table? Can we put a short comment
> to clarify this in the code?

Yes, we don't care about the old data, we just require the buffer to be 
large enough.

I'm not sure what kind of comment you want here. Isn't this a common 
idiom, where you have a buffer for temporary data, but you might need to 
resize at some point if you need a larger one?

>> +		if (!new_buf)
>> +			return -ENOMEM;
>> +
>> +		kfree(chan->orig_addrs);
>> +		chan->orig_addrs = new_buf;
>> +		chan->orig_addrs_size = num;
>> +	}
> 
> ...
> 
>> +struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
>> +			    const struct i2c_atr_ops *ops, int max_adapters)
>> +{
>> +	struct i2c_atr *atr;
>> +	int ret;
>> +
>> +	if (max_adapters > ATR_MAX_ADAPTERS)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (!ops || !ops->attach_client || !ops->detach_client)
>> +		return ERR_PTR(-EINVAL);
> 
>> +	atr = devm_kzalloc(dev, struct_size(atr, adapter, max_adapters),
>> +			   GFP_KERNEL);
> 
> How do you know (or why do we limit) that the scope of this function will be
> only in ->probe()? Even though, I would replace devm_ by non-devm_ since there
> is the tear-down function has to be called by the user anyway.

That's a very good point. I don't know why devm_kzalloc is used here.

>> +	if (!atr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mutex_init(&atr->lock);
>> +
>> +	atr->parent = parent;
>> +	atr->dev = dev;
>> +	atr->ops = ops;
>> +	atr->max_adapters = max_adapters;
>> +
>> +	if (parent->algo->master_xfer)
>> +		atr->algo.master_xfer = i2c_atr_master_xfer;
>> +	if (parent->algo->smbus_xfer)
>> +		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
>> +	atr->algo.functionality = i2c_atr_functionality;
>> +
>> +	atr->i2c_nb.notifier_call = i2c_atr_bus_notifier_call;
>> +	ret = bus_register_notifier(&i2c_bus_type, &atr->i2c_nb);
>> +	if (ret) {
>> +		mutex_destroy(&atr->lock);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return atr;
>> +}
> 
> ...
> 
>> +void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
>> +{
>> +	char symlink_name[ATR_MAX_SYMLINK_LEN];
> 
>> +
> 
> Redundant blank line.

Right.

>> +	struct i2c_adapter *adap = atr->adapter[chan_id];
>> +	struct i2c_atr_chan *chan = adap->algo_data;
>> +	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
>> +	struct device *dev = atr->dev;
> 
>> +	if (!adap)
>> +		return;
> 
> Redundant check (it will be optimized out by compiler) or wrong assignments
> above.

Indeed.

The doc for the function says "If no I2C bus has been added this 
function is a no-op", so we need the check, and I need to fix the 
assignments.

Although to be honest, I don't usually like this kind of "do nothing if 
given wrong parameters".

  Tomi

