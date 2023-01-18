Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F381671FAF
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 15:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjAROfL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 09:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjAROez (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 09:34:55 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B322748C;
        Wed, 18 Jan 2023 06:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674051842; x=1705587842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JW3Z4qGJkww64HEvaFHH2zXhHyqrRqOdAVZDOpAtKk8=;
  b=QaI4ogYNVLn/Yyb6QADgDDFmYQ7YIhwojhhpFnzhtaCb5e1Mendtx/Hv
   41SVq+aqav0mpoAkiRTK0Asis/NMKZ3ID+DOJW0rguyhu0HzpGoAigTIP
   mZzZPDpxtmRD5XgNFZJlILuhfEyWyRVlBTAiZUmrD7qg/E8zg44o23wq5
   oL+PzSZtNhxlKNxoa7czIGtKkEVWQgx6y2VU4q5GLcQXXIV50WR7Rzqd1
   fDpGNiCmOQbMfGrCi0vpa8stDQOv3XouOyo//TQ9HiqNdz0/tPdP4ZQAo
   9jF7NkfH/yo3jQwVL4zYjjdJfBDKdIjpN45cOZ2pV2LHGLM2MtqGFx8Qo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352239982"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="352239982"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 06:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833598833"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833598833"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 06:23:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pI9M1-00BDkv-1i;
        Wed, 18 Jan 2023 16:23:53 +0200
Date:   Wed, 18 Jan 2023 16:23:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 02:40:25PM +0200, Tomi Valkeinen wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> slave "upstream" port and N master "downstream" ports, and forwards
> transactions from upstream to the appropriate downstream port. But is
> is different in that the forwarded transaction has a different slave

is is ?

> address. The address used on the upstream bus is called the "alias"
> and is (potentially) different from the physical slave address of the
> downstream chip.
> 
> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> implementing ATR features in a device driver. The helper takes care or
> adapter creation/destruction and translates addresses at each transaction.

...

> +A typical example follows.
> +
> +Topology::
> +
> +                      Slave X @ 0x10
> +              .-----.   |
> +  .-----.     |     |---+---- B
> +  | CPU |--A--| ATR |
> +  `-----'     |     |---+---- C
> +              `-----'   |
> +                      Slave Y @ 0x10
> +
> +Alias table:
> +
> +.. table::
> +
> +   ======   =====
> +   Client   Alias
> +   ======   =====
> +   X        0x20
> +   Y        0x30
> +   ======   =====
> +
> +Transaction:
> +
> + - Slave X driver sends a transaction (on adapter B), slave address 0x10
> + - ATR driver rewrites messages with address 0x20, forwards to adapter A
> + - Physical I2C transaction on bus A, slave address 0x20
> + - ATR chip propagates transaction on bus B with address translated to 0x10
> + - Slave X chip replies on bus B
> + - ATR chip forwards reply on bus A
> + - ATR driver rewrites messages with address 0x10
> + - Slave X driver gets back the msgs[], with reply and address 0x10

I'm not sure I got the real / virtual status of the adapters. Are the B and C
virtual ones, while A is the real?

...

> +#define ATR_MAX_ADAPTERS 99	/* Just a sanity limit */

Hmm... It's not clear why this is not 100, for example, and how 99 below is
related to that, assuming channel numbering is started from 0.

> +#define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */

...

> +	/* Ensure we have enough room to save the original addresses */
> +	if (unlikely(chan->orig_addrs_size < num)) {
> +		u16 *new_buf;
> +
> +		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);

I remember that I asked why we don't use krealloc_array() here... Perhaps
that we don't need to copy the old mapping table? Can we put a short comment
to clarify this in the code?

> +		if (!new_buf)
> +			return -ENOMEM;
> +
> +		kfree(chan->orig_addrs);
> +		chan->orig_addrs = new_buf;
> +		chan->orig_addrs_size = num;
> +	}

...

> +struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
> +			    const struct i2c_atr_ops *ops, int max_adapters)
> +{
> +	struct i2c_atr *atr;
> +	int ret;
> +
> +	if (max_adapters > ATR_MAX_ADAPTERS)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!ops || !ops->attach_client || !ops->detach_client)
> +		return ERR_PTR(-EINVAL);

> +	atr = devm_kzalloc(dev, struct_size(atr, adapter, max_adapters),
> +			   GFP_KERNEL);

How do you know (or why do we limit) that the scope of this function will be
only in ->probe()? Even though, I would replace devm_ by non-devm_ since there
is the tear-down function has to be called by the user anyway.

> +	if (!atr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&atr->lock);
> +
> +	atr->parent = parent;
> +	atr->dev = dev;
> +	atr->ops = ops;
> +	atr->max_adapters = max_adapters;
> +
> +	if (parent->algo->master_xfer)
> +		atr->algo.master_xfer = i2c_atr_master_xfer;
> +	if (parent->algo->smbus_xfer)
> +		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
> +	atr->algo.functionality = i2c_atr_functionality;
> +
> +	atr->i2c_nb.notifier_call = i2c_atr_bus_notifier_call;
> +	ret = bus_register_notifier(&i2c_bus_type, &atr->i2c_nb);
> +	if (ret) {
> +		mutex_destroy(&atr->lock);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return atr;
> +}

...

> +void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
> +{
> +	char symlink_name[ATR_MAX_SYMLINK_LEN];

> +

Redundant blank line.

> +	struct i2c_adapter *adap = atr->adapter[chan_id];
> +	struct i2c_atr_chan *chan = adap->algo_data;
> +	struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
> +	struct device *dev = atr->dev;

> +	if (!adap)
> +		return;

Redundant check (it will be optimized out by compiler) or wrong assignments
above.

> +	dev_dbg(dev, "Removing ATR child bus %d\n", i2c_adapter_id(adap));
> +
> +	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
> +		 chan->chan_id);
> +	sysfs_remove_link(&dev->kobj, symlink_name);
> +	sysfs_remove_link(&chan->adap.dev.kobj, "atr_device");
> +
> +	i2c_del_adapter(adap);
> +
> +	atr->adapter[chan_id] = NULL;
> +
> +	fwnode_handle_put(fwnode);
> +	mutex_destroy(&chan->orig_addrs_lock);
> +	kfree(chan->orig_addrs);
> +	kfree(chan);
> +}

...

> +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
> +{
> +	atr->priv = data;
> +}
> +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
> +
> +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
> +{
> +	return atr->priv;
> +}
> +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);

Just to be sure: Is it really _driver_ data and not _device instance_ data?

-- 
With Best Regards,
Andy Shevchenko


