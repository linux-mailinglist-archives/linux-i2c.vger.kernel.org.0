Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA91B614C95
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 15:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiKAObI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 10:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiKAObH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 10:31:07 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A123BDF0D;
        Tue,  1 Nov 2022 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667313062; x=1698849062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAkQIO0lXzFvIQqcZhyeAZ/wLDJsTwxjoqncpDsYCzA=;
  b=XIzmdRsHSGH+qr52MsbfafCzynL/VkgPXtVzZ2Jkh6QhW5Do3PhmTsoe
   ITY03vOWv60Qj7804+3QghE3AatjP7Vst3+qj5bJhsnFqjJ27cx4BG/tD
   6FIdxY6Qchc33EgCMeEBN5PO6la/ISSPHUywqh4VoV5Y4gK/BD/A3QYGN
   1Vm+g1L338K51IbtgB0/2h72KArBlLcVYyLUTjAc9pw9b4TLu9DnyYTqn
   hVMe9NCFr+0YOKzBk/WBbgOhs+N1/+OvfT4DiW8qQjC27ISDjyffxt2d4
   b5qQLM6ZM6swiMni+sNMU2Dm9jTdVSzKHeNA7o6AnRDB4QUohU0V/HTGG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="306760605"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="306760605"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 07:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="759190709"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="759190709"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 01 Nov 2022 07:30:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1opsI1-005d2R-2N;
        Tue, 01 Nov 2022 16:30:53 +0200
Date:   Tue, 1 Nov 2022 16:30:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Subject: Re: [PATCH v4 2/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y2EtnSNqBOfGRDMO@smile.fi.intel.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101132032.1542416-3-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 01, 2022 at 03:20:26PM +0200, Tomi Valkeinen wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> slave "upstream" port and N master "downstream" ports, and forwards
> transactions from upstream to the appropriate downstream port. But is
> is different in that the forwarded transaction has a different slave
> address. The address used on the upstream bus is called the "alias"
> and is (potentially) different from the physical slave address of the
> downstream chip.
> 
> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> implementing ATR features in a device driver. The helper takes care or
> adapter creation/destruction and translates addresses at each transaction.

...

>     i2c-topology
>     muxes/i2c-mux-gpio
>     i2c-sysfs
> +   muxes/i2c-atr

Doesn't make sense to group muxes/*, that they are following each other?

...

> +I2C ADDRESS TRANSLATOR (ATR)
> +M:	Luca Ceresoli <luca@lucaceresoli.net>

Hmm... Are you going to maintain this? Or Review? Why not?

> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/i2c-atr.c
> +F:	include/linux/i2c-atr.h

...

> +		void *new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
> +					      GFP_KERNEL);
> +		if (new_buf == NULL)
> +			return -ENOMEM;

Isn't it better to write this as

		void *new_buf;

		new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]), GFP_KERNEL);
		if (!new_buf)
			return -ENOMEM;

Remarks:
- note the style of the conditional
- why is it void?

Also, does it make sense to use krealloc_array() or is it complete replacement
of the data?

> +		kfree(chan->orig_addrs);
> +		chan->orig_addrs = new_buf;
> +		chan->orig_addrs_size = num;

...

> +static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg msgs[],
> +			       int num)

[] in the function parameter is longer than * and actually doesn't make
difference in C. Ditto for the rest of similar cases.

...

> +static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
> +			      unsigned short flags, char read_write, u8 command,
> +			      int size, union i2c_smbus_data *data)

Can flags be fixed size (yes I understand that in our case short would probably
never be different to u16, but for the sake of clearness)?

...

> +static int i2c_atr_attach_client(struct i2c_adapter *adapter,
> +				 const struct i2c_board_info *info,
> +				 const struct i2c_client *client)
> +{
> +	struct i2c_atr_chan *chan = adapter->algo_data;
> +	struct i2c_atr *atr = chan->atr;
> +	struct i2c_atr_cli2alias_pair *c2a;

> +	u16 alias_id = 0;

Can we split assignment from the definition and locate it closer to the first
use?

> +	int ret = 0;

Useless assignment.

> +
> +	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
> +	if (!c2a)
> +		return -ENOMEM;
> +
> +	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
> +				      &alias_id);

On one line looks better.

> +	if (ret)
> +		goto err_free;
> +	if (alias_id == 0) {
> +		ret = -EINVAL;
> +		goto err_free;
> +	}
> +
> +	c2a->client = client;
> +	c2a->alias = alias_id;
> +	list_add(&c2a->node, &chan->alias_list);
> +
> +	return 0;
> +
> +err_free:
> +	kfree(c2a);
> +	return ret;
> +}

...

> +int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
> +			struct fwnode_handle *bus_handle)
> +{
> +	struct i2c_adapter *parent = atr->parent;
> +	struct device *dev = atr->dev;
> +	struct i2c_atr_chan *chan;
> +	char *symlink_name;
> +	int ret;
> +
> +	if (chan_id >= atr->max_adapters) {
> +		dev_err(dev, "No room for more i2c-atr adapters\n");
> +		return -EINVAL;
> +	}
> +
> +	if (atr->adapter[chan_id]) {
> +		dev_err(dev, "Adapter %d already present\n", chan_id);
> +		return -EEXIST;
> +	}
> +
> +	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
> +	if (!chan)
> +		return -ENOMEM;
> +
> +	chan->atr = atr;
> +	chan->chan_id = chan_id;
> +	INIT_LIST_HEAD(&chan->alias_list);
> +	mutex_init(&chan->orig_addrs_lock);
> +
> +	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
> +		 i2c_adapter_id(parent), chan_id);
> +	chan->adap.owner = THIS_MODULE;
> +	chan->adap.algo = &atr->algo;
> +	chan->adap.algo_data = chan;
> +	chan->adap.dev.parent = dev;
> +	chan->adap.retries = parent->retries;
> +	chan->adap.timeout = parent->timeout;
> +	chan->adap.quirks = parent->quirks;
> +	chan->adap.lock_ops = &i2c_atr_lock_ops;
> +	chan->adap.attach_ops = &i2c_atr_attach_ops;
> +
> +	if (bus_handle) {
> +		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
> +	} else {
> +		struct fwnode_handle *atr_node;
> +		struct fwnode_handle *child;
> +		u32 reg;
> +
> +		atr_node = device_get_named_child_node(dev, "i2c-atr");
> +
> +		fwnode_for_each_child_node(atr_node, child) {
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret)
> +				continue;
> +			if (chan_id == reg)
> +				break;
> +		}
> +
> +		device_set_node(&chan->adap.dev, child);
> +		fwnode_handle_put(atr_node);
> +	}

It seems you have OF independent code, but by some reason you included of.h
instead of property.h. Am I right?

> +	ret = i2c_add_adapter(&chan->adap);
> +	if (ret) {
> +		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
> +			chan_id, ret);
> +		goto err_add_adapter;
> +	}
> +
> +	symlink_name = kasprintf(GFP_KERNEL, "channel-%u", chan_id);

No NULL check?

> +	WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
> +	     "can't create symlink to atr device\n");
> +	WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
> +	     "can't create symlink for channel %u\n", chan_id);

Why WARNs? sysfs has already some in their implementation.

> +
> +	kfree(symlink_name);
> +
> +	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
> +
> +	atr->adapter[chan_id] = &chan->adap;
> +	return 0;
> +
> +err_add_adapter:
> +	mutex_destroy(&chan->orig_addrs_lock);
> +	kfree(chan);
> +	return ret;
> +}

...

> +	struct fwnode_handle *fwnode = adap->dev.fwnode;

Please don't dereference fwnode like this, we have dev_fwnode() for that.

...

> +	if (atr->adapter[chan_id] == NULL) {

!

> +		dev_err(dev, "Adapter %d does not exist\n", chan_id);
> +		return;
> +	}

...

> +	snprintf(symlink_name, sizeof(symlink_name),
> +		 "channel-%u", chan->chan_id);

Once line?

...

> +	atr_size = struct_size(atr, adapter, max_adapters);

> +	if (atr_size == SIZE_MAX)
> +		return ERR_PTR(-EOVERFLOW);

Dunno if you really need this to be separated from devm_kzalloc(), either way
you will get an error, but in embedded case it will be -ENOMEM.

> +	atr = devm_kzalloc(dev, atr_size, GFP_KERNEL);
> +	if (!atr)
> +		return ERR_PTR(-ENOMEM);

...

> +EXPORT_SYMBOL_GPL(i2c_atr_delete);

I would put these to their own namespace from day 1.


...

> +/**
> + * Helper to add I2C ATR features to a device driver.
> + */

??? Copy'n'paste typo?

> +struct i2c_atr {
> +	/* private: internal use only */
> +
> +	struct i2c_adapter *parent;
> +	struct device *dev;
> +	const struct i2c_atr_ops *ops;
> +
> +	void *priv;
> +
> +	struct i2c_algorithm algo;
> +	struct mutex lock;
> +	int max_adapters;
> +
> +	struct i2c_adapter *adapter[0];

No VLAs.

> +};

...

> +int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
> +			struct fwnode_handle *bus_np);

Missing

struct fwnode_handle;

at the top of the file?

-- 
With Best Regards,
Andy Shevchenko


