Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607076195B1
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 12:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiKDL7P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 07:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKDL7O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 07:59:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A36D29802;
        Fri,  4 Nov 2022 04:59:13 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BB168B;
        Fri,  4 Nov 2022 12:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667563150;
        bh=HnszknJqvNe0CRmLhV3ywEl3mb0b5R/82+6Y2R9VjOI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UA5hAEuKP6LpEtUFet3J9z3GBG805KpAZFtckd7GomolX84z6f6kJtzax/13JUvWF
         z4z+/dA5Z4CxErdqU0mhQ3kWVAkCLWVDhfvoYKXcFeKDABvRnxmPOh2CYuty1lpIjm
         U5Fb4GNKJJOmebeVD/I/0QAopfJ2wDbXsnNCJEto=
Message-ID: <cc510516-c961-9efb-bcdf-2abea795433a@ideasonboard.com>
Date:   Fri, 4 Nov 2022 13:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
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
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
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

Hi Andy,

On 01/11/2022 16:30, Andy Shevchenko wrote:
> On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:
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
> ...
> 
>>      i2c-topology
>>      muxes/i2c-mux-gpio
>>      i2c-sysfs
>> +   muxes/i2c-atr
> 
> Doesn't make sense to group muxes/*, that they are following each other?

Ok.

> ...
> 
>> +I2C ADDRESS TRANSLATOR (ATR)
>> +M:	Luca Ceresoli <luca@lucaceresoli.net>
> 
> Hmm... Are you going to maintain this? Or Review? Why not?

We haven't discussed with Luca if he wants to maintain this (this is 
mostly his code). But, indeed, I should add my name there.

>> +L:	linux-i2c@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/i2c/i2c-atr.c
>> +F:	include/linux/i2c-atr.h
> 
> ...
> 
>> +		void *new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
>> +					      GFP_KERNEL);
>> +		if (new_buf == NULL)
>> +			return -ENOMEM;
> 
> Isn't it better to write this as
> 
> 		void *new_buf;
> 
> 		new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]), GFP_KERNEL);
> 		if (!new_buf)
> 			return -ENOMEM;

Ok.

> Remarks:
> - note the style of the conditional
> - why is it void?

No idea. I'll change it.

> 
> Also, does it make sense to use krealloc_array() or is it complete replacement
> of the data?

The whole array will be rewritten, so we don't need to preserve the 
current data.

The buffer allocated here (i.e. orig_addrs) is only used for the 
duration of the i2c_atr_master_xfer(). So, we could allocate a new 
buffer for every xfer call, but to avoid that, we retain the old buffer. 
Any old data in the buffer can be discarded.

>> +		kfree(chan->orig_addrs);
>> +		chan->orig_addrs = new_buf;
>> +		chan->orig_addrs_size = num;
> 
> ...
> 
>> +static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg msgs[],
>> +			       int num)
> 
> [] in the function parameter is longer than * and actually doesn't make
> difference in C. Ditto for the rest of similar cases.

Ok. I missed a few, it seems.

> ...
> 
>> +static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
>> +			      unsigned short flags, char read_write, u8 command,
>> +			      int size, union i2c_smbus_data *data)
> 
> Can flags be fixed size (yes I understand that in our case short would probably
> never be different to u16, but for the sake of clearness)?

The parameters and their types come from the ops in struct i2c_algorithm.

> ...
> 
>> +static int i2c_atr_attach_client(struct i2c_adapter *adapter,
>> +				 const struct i2c_board_info *info,
>> +				 const struct i2c_client *client)
>> +{
>> +	struct i2c_atr_chan *chan = adapter->algo_data;
>> +	struct i2c_atr *atr = chan->atr;
>> +	struct i2c_atr_cli2alias_pair *c2a;
> 
>> +	u16 alias_id = 0;
> 
> Can we split assignment from the definition and locate it closer to the first
> use?

Actually, I don't think we need to initialize it at all. If 
attach_client() fails, we don't care about alias_id. If attach_client() 
succeeds, it _must_ return alias_id.

>> +	int ret = 0;
> 
> Useless assignment.

Yep.

>> +
>> +	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
>> +	if (!c2a)
>> +		return -ENOMEM;
>> +
>> +	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
>> +				      &alias_id);
> 
> On one line looks better.

I agree, but it doesn't fit into 80 characters. I personally think 
that's a too narrow a limit, but some maintainers absolutely require max 
80 chars, so I try to limit the lines to 80 unless it looks really ugly.

>> +	if (ret)
>> +		goto err_free;
>> +	if (alias_id == 0) {
>> +		ret = -EINVAL;
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
>> +int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
>> +			struct fwnode_handle *bus_handle)
>> +{
>> +	struct i2c_adapter *parent = atr->parent;
>> +	struct device *dev = atr->dev;
>> +	struct i2c_atr_chan *chan;
>> +	char *symlink_name;
>> +	int ret;
>> +
>> +	if (chan_id >= atr->max_adapters) {
>> +		dev_err(dev, "No room for more i2c-atr adapters\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (atr->adapter[chan_id]) {
>> +		dev_err(dev, "Adapter %d already present\n", chan_id);
>> +		return -EEXIST;
>> +	}
>> +
>> +	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
>> +	if (!chan)
>> +		return -ENOMEM;
>> +
>> +	chan->atr = atr;
>> +	chan->chan_id = chan_id;
>> +	INIT_LIST_HEAD(&chan->alias_list);
>> +	mutex_init(&chan->orig_addrs_lock);
>> +
>> +	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
>> +		 i2c_adapter_id(parent), chan_id);
>> +	chan->adap.owner = THIS_MODULE;
>> +	chan->adap.algo = &atr->algo;
>> +	chan->adap.algo_data = chan;
>> +	chan->adap.dev.parent = dev;
>> +	chan->adap.retries = parent->retries;
>> +	chan->adap.timeout = parent->timeout;
>> +	chan->adap.quirks = parent->quirks;
>> +	chan->adap.lock_ops = &i2c_atr_lock_ops;
>> +	chan->adap.attach_ops = &i2c_atr_attach_ops;
>> +
>> +	if (bus_handle) {
>> +		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
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
>> +		fwnode_handle_put(atr_node);
>> +	}
> 
> It seems you have OF independent code, but by some reason you included of.h
> instead of property.h. Am I right?

Just an leftover from the conversion from of to fwnode.

>> +	ret = i2c_add_adapter(&chan->adap);
>> +	if (ret) {
>> +		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
>> +			chan_id, ret);
>> +		goto err_add_adapter;
>> +	}
>> +
>> +	symlink_name = kasprintf(GFP_KERNEL, "channel-%u", chan_id);
> 
> No NULL check?

Right, missed that.

>> +	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
>> +	     "can't create symlink to atr device\n");
>> +	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
>> +	     "can't create symlink for channel %u\n", chan_id);
> 
> Why WARNs? sysfs has already some in their implementation.

True, and I can drop these if required. But afaics, sysfs_create_link 
only warns if there's a duplicate entry, not for other errors.

>> +
>> +	kfree(symlink_name);
>> +
>> +	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
>> +
>> +	atr->adapter[chan_id] = &chan->adap;
>> +	return 0;
>> +
>> +err_add_adapter:
>> +	mutex_destroy(&chan->orig_addrs_lock);
>> +	kfree(chan);
>> +	return ret;
>> +}
> 
> ...
> 
>> +	struct fwnode_handle *fwnode = adap->dev.fwnode;
> 
> Please don't dereference fwnode like this, we have dev_fwnode() for that.

Ok.

> ...
> 
>> +	if (atr->adapter[chan_id] == NULL) {
> 
> !

Yep.

>> +		dev_err(dev, "Adapter %d does not exist\n", chan_id);
>> +		return;
>> +	}
> 
> ...
> 
>> +	snprintf(symlink_name, sizeof(symlink_name),
>> +		 "channel-%u", chan->chan_id);
> 
> Once line?

80 char limit here too. But I see that this is (kind of) broken. In the 
i2c_atr_add_adapter() I used dynamic alloc for the symlink_name, but 
here we still have the fixed size buffer.

> 
> ...
> 
>> +	atr_size = struct_size(atr, adapter, max_adapters);
> 
>> +	if (atr_size == SIZE_MAX)
>> +		return ERR_PTR(-EOVERFLOW);
> 
> Dunno if you really need this to be separated from devm_kzalloc(), either way
> you will get an error, but in embedded case it will be -ENOMEM.

Yep. Well... I kind of like it to be explicit. Calling alloc(SIZE_MAX) 
doesn't feel nice.

>> +	atr = devm_kzalloc(dev, atr_size, GFP_KERNEL);
>> +	if (!atr)
>> +		return ERR_PTR(-ENOMEM);
> 
> ...
> 
>> +EXPORT_SYMBOL_GPL(i2c_atr_delete);
> 
> I would put these to their own namespace from day 1.

What would be the namespace? Isn't this something that should be 
subsystem-wide decision? I have to admit I have never used symbol 
namespaces, and don't know much about them.

> 
> ...
> 
>> +/**
>> + * Helper to add I2C ATR features to a device driver.
>> + */
> 
> ??? Copy'n'paste typo?

No idea where that is from... I'll fix it.

>> +struct i2c_atr {
>> +	/* private: internal use only */
>> +
>> +	struct i2c_adapter *parent;
>> +	struct device *dev;
>> +	const struct i2c_atr_ops *ops;
>> +
>> +	void *priv;
>> +
>> +	struct i2c_algorithm algo;
>> +	struct mutex lock;
>> +	int max_adapters;
>> +
>> +	struct i2c_adapter *adapter[0];
> 
> No VLAs.

Ok.

I'm not arguing against any of the comments you've made, I think they 
are all valid, but I want to point out that many of them are in a code 
copied from i2c-mux.

Whether there's any value in keeping i2c-mux and i2c-atr similar in 
design/style... Maybe not.

>> +};
> 
> ...
> 
>> +int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
>> +			struct fwnode_handle *bus_np);
> 
> Missing
> 
> struct fwnode_handle;
> 
> at the top of the file?

Ok.

  Tomi



