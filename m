Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D23B6473BE
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 17:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiLHQB2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 11:01:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLHQB1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 11:01:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0CD5E9FD;
        Thu,  8 Dec 2022 08:01:25 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C37825B;
        Thu,  8 Dec 2022 17:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670515283;
        bh=/Gi18eEY/McV0Qto8WvXepa9hiIT4Dza2hydohuZMsE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e2E8id13JFmvvhrmzf4qSCMMlCzagmlG0ahdeTnuqOttP4kgtPzypXj/weEeXIiD6
         DAhUSYpcaoUjUVispaP1dCfbWYCwg0nbF8MsXbPl65mEGSCHdrsPOl31tJdo4Cdw8y
         OxeKpGOMr/xUtX1AvLVEdvRMD9wcDuUPu+Eus5ls=
Message-ID: <e55d0aa0-e860-3510-2d2f-11486a23c3ea@ideasonboard.com>
Date:   Thu, 8 Dec 2022 18:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/8] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-3-tomi.valkeinen@ideasonboard.com>
 <Y5HeRL6H5vEeDznl@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y5HeRL6H5vEeDznl@smile.fi.intel.com>
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

Hi Andy,

On 08/12/2022 14:53, Andy Shevchenko wrote:
> On Thu, Dec 08, 2022 at 12:40:00PM +0200, Tomi Valkeinen wrote:
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>> slave "upstream" port and N master "downstream" ports, and forwards
>> transactions from upstream to the appropriate downstream port. But is
>> is different in that the forwarded transaction has a different slave
>> address. The address used on the upstream bus is called the "alias"
>> and is (potentially) different from the physical slave address of the
>> downstream chip.
>>
>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>> implementing ATR features in a device driver. The helper takes care or
>> adapter creation/destruction and translates addresses at each transaction.
> 
> Besides comments given against diff between series versions, see below.
> 
> ...
> 
>> +static int i2c_atr_attach_client(struct i2c_adapter *adapter,
>> +				 const struct i2c_board_info *info,
>> +				 const struct i2c_client *client)
>> +{
>> +	struct i2c_atr_chan *chan = adapter->algo_data;
>> +	struct i2c_atr *atr = chan->atr;
>> +	struct i2c_atr_cli2alias_pair *c2a;
>> +	u16 alias_id;
>> +	int ret;
>> +
>> +	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
>> +	if (!c2a)
>> +		return -ENOMEM;
>> +
>> +	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
>> +				      &alias_id);
>> +	if (ret)
>> +		goto err_free;
> 
>> +	if (alias_id == 0) {
>> +		ret = -EINVAL;
> 
> I'm wondering why attach_client can't return this error and provide a guarantee
> that if no error, the alias_id is never be 0?

I think that's a valid point. I see no reason to check for alias_id == 0 
here.

>> +		goto err_free;
>> +	}
>> +
>> +	c2a->client = client;
>> +	c2a->alias = alias_id;
>> +	list_add(&c2a->node, &chan->alias_list);
>> +
>> +	return 0;
>> +
>> +err_free:
>> +	kfree(c2a);
>> +	return ret;
>> +}
> 
> ...
> 
>> +	if (bus_handle) {
>> +		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
> 
> I believe the correct way, while above still works, is
> 
> 		device_set_node(&chan->adap.dev, bus_handle);
> 		fwnode_handle_get(dev_fwnode(&chan->adap.dev));

Hmm, why is that correct? Shouldn't you give device_set_node() an fwnode 
that has been referenced?

> But I agree that this looks a bit verbose. And...
> 
>> +	} else {
>> +		struct fwnode_handle *atr_node;
>> +		struct fwnode_handle *child;
>> +		u32 reg;
>> +
>> +		atr_node = device_get_named_child_node(dev, "i2c-atr");
>> +
>> +		fwnode_for_each_child_node(atr_node, child) {
>> +			ret = fwnode_property_read_u32(child, "reg", &reg);
>> +			if (ret)
>> +				continue;
>> +			if (chan_id == reg)
>> +				break;
>> +		}
>> +
>> +		device_set_node(&chan->adap.dev, child);
> 
> ...OTOH, you set node with bumped reference here. So I leave all this to
> the maintainers.
> 
>> +		fwnode_handle_put(atr_node);
>> +	}
> 
>> +	ret = i2c_add_adapter(&chan->adap);
>> +	if (ret) {
>> +		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
>> +			chan_id, ret);
>> +		goto err_mutex_destroy;
>> +	}
>> +
>> +	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
>> +		 chan->chan_id);
>> +
>> +	ret = sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device");
>> +	if (ret)
>> +		dev_warn(dev, "can't create symlink to atr device\n");
>> +	ret = sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name);
>> +	if (ret)
>> +		dev_warn(dev, "can't create symlink for channel %u\n", chan_id);
>> +
>> +	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
>> +
>> +	atr->adapter[chan_id] = &chan->adap;
>> +	return 0;
>> +
>> +err_mutex_destroy:
> 
> Now it's a bit misleading, wouldn't be better
> 
> err_put_fwnode:
> 
> ?

Yes.

>> +	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
>> +	mutex_destroy(&chan->orig_addrs_lock);
>> +	kfree(chan);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(i2c_atr_add_adapter);
> 
> Wondering if we may put this into namespace from day 1.

Right, that's something I didn't look at all for v5. I have not heard 
anyone else commenting about the NS, though. I could have a look at it 
anyway, just to learn about NSes.

> ...
> 
>> +/**
>> + * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by
>> + * i2c_atr_del_adapter().
>> + * @atr:     The I2C ATR
>> + * @chan_id: Index of the `adapter to be removed (0 .. max_adapters-1)
>> + */
>> +void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
>> +{
>> +	char symlink_name[ATR_MAX_SYMLINK_LEN];
>> +
>> +	struct i2c_adapter *adap = atr->adapter[chan_id];
>> +	struct i2c_atr_chan *chan = adap->algo_data;
>> +	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
>> +	struct device *dev = atr->dev;
> 
>> +	if (!atr->adapter[chan_id]) {
> 
> Isn't it the same as
> 
> 	if (!adap)
> 
> ?

Yes.

> 
>> +		dev_err(dev, "Adapter %d does not exist\n", chan_id);
>> +		return;
>> +	}
>> +
>> +	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
>> +
>> +	atr->adapter[chan_id] = NULL;
>> +
>> +	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
>> +		 chan->chan_id);
>> +	sysfs_remove_link(&dev->kobj, symlink_name);
>> +	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
>> +
>> +	i2c_del_adapter(adap);
>> +	fwnode_handle_put(fwnode);
>> +	mutex_destroy(&chan->orig_addrs_lock);
>> +	kfree(chan->orig_addrs);
>> +	kfree(chan);
>> +}
> 
> ...
> 
>> +struct i2c_atr {
>> +	/* private: internal use only */
> 
> What is private? The entire structure? Then why it's defined in
> the include/linux/? Can't you make it opaque?

Good point, I see no reason to keep this in the public header. 
i2c_atr_set/get_clientdata used it, but I can move their implementations 
into the .c file.

>> +	struct i2c_adapter *parent;
>> +	struct device *dev;
>> +	const struct i2c_atr_ops *ops;
>> +
>> +	void *priv;
>> +
>> +	struct i2c_algorithm algo;
>> +	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
>> +	struct mutex lock;
>> +	int max_adapters;
>> +
>> +	struct i2c_adapter *adapter[];
>> +};
> 
> ...
> 
>> +static inline void i2c_atr_set_clientdata(struct i2c_atr *atr, void *data)
>> +{
>> +	atr->priv = data;
>> +}
>> +
>> +static inline void *i2c_atr_get_clientdata(struct i2c_atr *atr)
>> +{
>> +	return atr->priv;
>> +}
> 
> The function names are misleading, because I would think this is about driver
> data that has been set.
> 
> I would rather use name like
> 
> 	i2c_atr_get_priv()
> 	i2c_atr_set_priv()

Indeed, set_clientdata is probably wrong. But i2c_atr_set_priv() sounds 
like it's private to the i2c-atr itself. Maybe i2c_atr_set_driver_data?

  Tomi

