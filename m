Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5CF64701B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 13:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiLHMxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 07:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiLHMxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 07:53:36 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A180660370;
        Thu,  8 Dec 2022 04:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670504015; x=1702040015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CK5TqcJGV7ARN7Am6uXTA58QztV19Khx/pdgHfX61TI=;
  b=Zv1XrKm4E27LhKhFhhVliW4TD6InUis5SMfjFXFUAHcui5csag2V3FaU
   D0vb/Ik3T5ACpQjTUt6ofwmC6yBPsjAWVqpe6QK1bURNxTEtMgnE/Bjum
   9VErdw1wKWGLg2HoEbqLNZaLqSdirmo9B0Jm2pQ5aU35yeWi/J4D2tQZr
   YWxGLube97us2fQBSQxZWwe+MT0Oh+P0aZK1Crzr97IWdt++/6P6yz321
   PDkG2lwDgCqzTELzH8zYPJIYt0RqnklTDtXFLaH4xs6rZLzSKIOqQYr5R
   mehjMK6V4apmGSMEqAXmRVxB3rhXrMjlfB6uLVa4xIuUawIq9DYjdlwvM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379323468"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="379323468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 04:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="624689132"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="624689132"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 08 Dec 2022 04:53:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3GOy-006Koi-2O;
        Thu, 08 Dec 2022 14:53:24 +0200
Date:   Thu, 8 Dec 2022 14:53:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v5 2/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y5HeRL6H5vEeDznl@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-3-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 08, 2022 at 12:40:00PM +0200, Tomi Valkeinen wrote:
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

Besides comments given against diff between series versions, see below.

...

> +static int i2c_atr_attach_client(struct i2c_adapter *adapter,
> +				 const struct i2c_board_info *info,
> +				 const struct i2c_client *client)
> +{
> +	struct i2c_atr_chan *chan = adapter->algo_data;
> +	struct i2c_atr *atr = chan->atr;
> +	struct i2c_atr_cli2alias_pair *c2a;
> +	u16 alias_id;
> +	int ret;
> +
> +	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
> +	if (!c2a)
> +		return -ENOMEM;
> +
> +	ret = atr->ops->attach_client(atr, chan->chan_id, info, client,
> +				      &alias_id);
> +	if (ret)
> +		goto err_free;

> +	if (alias_id == 0) {
> +		ret = -EINVAL;

I'm wondering why attach_client can't return this error and provide a guarantee
that if no error, the alias_id is never be 0?

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

> +	if (bus_handle) {
> +		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));

I believe the correct way, while above still works, is

		device_set_node(&chan->adap.dev, bus_handle);
		fwnode_handle_get(dev_fwnode(&chan->adap.dev));

But I agree that this looks a bit verbose. And...

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

...OTOH, you set node with bumped reference here. So I leave all this to
the maintainers.

> +		fwnode_handle_put(atr_node);
> +	}

> +	ret = i2c_add_adapter(&chan->adap);
> +	if (ret) {
> +		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
> +			chan_id, ret);
> +		goto err_mutex_destroy;
> +	}
> +
> +	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
> +		 chan->chan_id);
> +
> +	ret = sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device");
> +	if (ret)
> +		dev_warn(dev, "can't create symlink to atr device\n");
> +	ret = sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name);
> +	if (ret)
> +		dev_warn(dev, "can't create symlink for channel %u\n", chan_id);
> +
> +	dev_dbg(dev, "Added ATR child bus %d\n", i2c_adapter_id(&chan->adap));
> +
> +	atr->adapter[chan_id] = &chan->adap;
> +	return 0;
> +
> +err_mutex_destroy:

Now it's a bit misleading, wouldn't be better

err_put_fwnode:

?

> +	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
> +	mutex_destroy(&chan->orig_addrs_lock);
> +	kfree(chan);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i2c_atr_add_adapter);

Wondering if we may put this into namespace from day 1.

...

> +/**
> + * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by
> + * i2c_atr_del_adapter().
> + * @atr:     The I2C ATR
> + * @chan_id: Index of the `adapter to be removed (0 .. max_adapters-1)
> + */
> +void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
> +{
> +	char symlink_name[ATR_MAX_SYMLINK_LEN];
> +
> +	struct i2c_adapter *adap = atr->adapter[chan_id];
> +	struct i2c_atr_chan *chan = adap->algo_data;
> +	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
> +	struct device *dev = atr->dev;

> +	if (!atr->adapter[chan_id]) {

Isn't it the same as

	if (!adap)

?

> +		dev_err(dev, "Adapter %d does not exist\n", chan_id);
> +		return;
> +	}
> +
> +	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
> +
> +	atr->adapter[chan_id] = NULL;
> +
> +	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
> +		 chan->chan_id);
> +	sysfs_remove_link(&dev->kobj, symlink_name);
> +	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
> +
> +	i2c_del_adapter(adap);
> +	fwnode_handle_put(fwnode);
> +	mutex_destroy(&chan->orig_addrs_lock);
> +	kfree(chan->orig_addrs);
> +	kfree(chan);
> +}

...

> +struct i2c_atr {
> +	/* private: internal use only */

What is private? The entire structure? Then why it's defined in
the include/linux/? Can't you make it opaque?

> +	struct i2c_adapter *parent;
> +	struct device *dev;
> +	const struct i2c_atr_ops *ops;
> +
> +	void *priv;
> +
> +	struct i2c_algorithm algo;
> +	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
> +	struct mutex lock;
> +	int max_adapters;
> +
> +	struct i2c_adapter *adapter[];
> +};

...

> +static inline void i2c_atr_set_clientdata(struct i2c_atr *atr, void *data)
> +{
> +	atr->priv = data;
> +}
> +
> +static inline void *i2c_atr_get_clientdata(struct i2c_atr *atr)
> +{
> +	return atr->priv;
> +}

The function names are misleading, because I would think this is about driver
data that has been set.

I would rather use name like

	i2c_atr_get_priv()
	i2c_atr_set_priv()

-- 
With Best Regards,
Andy Shevchenko


