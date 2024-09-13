Return-Path: <linux-i2c+bounces-6694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA4977D49
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6F01F210B9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F781D6DC6;
	Fri, 13 Sep 2024 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoVeK1mN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6918A6D6;
	Fri, 13 Sep 2024 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223135; cv=none; b=r2ehhg8ZUn0EPUggDdsq+M6KSpCplmls3/toiNwwDxi/Kqb5n2AyqXN2J7UXI50q6nrmqslX9Ec4fOizgj5j32rJ0A+8cE1r/gbB5/hPhK2hkFW20edvVulu1T5hl9S3jnU30CgUDSuH+WYfRkxrAfIk+ULGUXBI2iNlO6GIwaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223135; c=relaxed/simple;
	bh=lt83t51ZsHqvSfIdV0RclKGYyXqJEVdfzYc8IAcGfMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJuYRag4IOTQV6HDNkvqE4KhunecyPNjA4kfIxtkW7B3LNtUb3/+rl+P0FFUymGaYRJik90dnorRic4hQup16VkuS4BAf5M2WgdRq1eekW6rLBLzPkkZx6ep6BXsf8JWqcUlR5Elr103N0Kd+lKloIq/tjJGFn7eRqWkMS5aTT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoVeK1mN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223133; x=1757759133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lt83t51ZsHqvSfIdV0RclKGYyXqJEVdfzYc8IAcGfMI=;
  b=eoVeK1mNJRWc3z5aygMfzpErifduT3FGz7kiiZc5Gso3XaxJFKaHDWDX
   yiAVPAAfzXkBd/RpCAoW1Rgywbk9nHOuYURdGQ0KwA08ddQlk+9q70ru9
   tg/zcJ+i6+j5hh2EtoH/TBDo8+1m75bTe0iYg24BeNlM8Zt8vgujIgwxB
   NuC+RkVsh4sP8GSKg0aGoU/1dNjFedLzgoveO7Lm1IfpTgILIjum1Z9F/
   tayTqUL6GksR+m2v3QQg6shv8APqrNsVzHwK7BsGxhQ6TCpOpCHOlXGDq
   2DtPSHvzWLFWni7ac7OdP1PI8XAfd2du+jUPr7CJgsCIQ2lpVONUjk/1P
   w==;
X-CSE-ConnectionGUID: kKkEeEF4RL6hf4UGBU3GGw==
X-CSE-MsgGUID: r972oy+5T+ediUx/73mW1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25271729"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25271729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:25:32 -0700
X-CSE-ConnectionGUID: 8QVI6aEsTCe+hCX64HmrqQ==
X-CSE-MsgGUID: EP8F7RfqRk6pAL0aOhSVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68096162"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:25:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3UT-00000008GAC-2BYS;
	Fri, 13 Sep 2024 13:25:25 +0300
Date: Fri, 13 Sep 2024 13:25:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZuQTFTNTBLCziD05@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "failed-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> +static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
> +{
> +	int ret;

> +	dev_info(dev, "Enabling %pOF\n", node);

Is it important to be on INFO level?

> +	struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
> +	if (!ocs)
> +		return -ENOMEM;
> +
> +	of_changeset_init(ocs);
> +	ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
> +	if (ret)
> +		return ret;
> +
> +	ret = of_changeset_apply(ocs);
> +	if (ret) {
> +		/* ocs needs to be explicitly cleaned up before being freed. */
> +		of_changeset_destroy(ocs);
> +	} else {
> +		/*
> +		 * ocs is intentionally kept around as it needs to
> +		 * exist as long as the change is applied.
> +		 */
> +		void *ptr __always_unused = no_free_ptr(ocs);
> +	}
> +
> +	return ret;
> +}

...

> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx)
> +{
> +	const struct i2c_of_probe_ops *ops;
> +	const char *type;
> +	struct device_node *i2c_node;
> +	struct i2c_adapter *i2c;
> +	int ret;
> +
> +	if (!cfg)
> +		return -EINVAL;
> +
> +	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
> +	type = cfg->type;
> +
> +	i2c_node = i2c_of_probe_get_i2c_node(dev, type);


	struct device_node *i2c_node __free(of_node_put) =
		i2c_...;

> +	if (IS_ERR(i2c_node))
> +		return PTR_ERR(i2c_node);
> +
> +	for_each_child_of_node_with_prefix(i2c_node, node, type) {
> +		if (!of_device_is_available(node))
> +			continue;
> +
> +		/*
> +		 * Device tree has component already enabled. Either the
> +		 * device tree isn't supported or we already probed once.
> +		 */
> +		ret = 0;

Shouldn't you drop reference count for "node"? (See also below)

> +		goto out_put_i2c_node;
> +	}
> +
> +	i2c = of_get_i2c_adapter_by_node(i2c_node);
> +	if (!i2c) {
> +		ret = dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
> +		goto out_put_i2c_node;
> +	}
> +
> +	/* Grab resources */
> +	ret = 0;
> +	if (ops->get_resources)
> +		ret = ops->get_resources(dev, i2c_node, ctx);
> +	if (ret)
> +		goto out_put_i2c_adapter;
> +
> +	/* Enable resources */
> +	if (ops->enable)
> +		ret = ops->enable(dev, ctx);
> +	if (ret)
> +		goto out_release_resources;
> +
> +	ret = 0;
> +	for_each_child_of_node_with_prefix(i2c_node, node, type) {
> +		union i2c_smbus_data data;
> +		u32 addr;
> +
> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
> +			continue;
> +
> +		/* Found a device that is responding */
> +		if (ops->free_resources_early)
> +			ops->free_resources_early(ctx);
> +		ret = i2c_of_probe_enable_node(dev, node);

Hmm... Is "node" reference count left bumped up for a reason?

> +		break;
> +	}
> +
> +	if (ops->cleanup)
> +		ops->cleanup(dev, ctx);
> +out_release_resources:
> +	if (ops->free_resources_late)
> +		ops->free_resources_late(ctx);
> +out_put_i2c_adapter:
> +	i2c_put_adapter(i2c);
> +out_put_i2c_node:
> +	of_node_put(i2c_node);
> +
> +	return ret;
> +}

...

> +/*
> + * i2c-of-prober.h - definitions for the Linux I2C OF component prober

Please avoid putting filenames inside files. In the possible future event of
file renaming this may become a burden and sometimes even forgotten.

> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#ifndef _LINUX_I2C_OF_PROBER_H
> +#define _LINUX_I2C_OF_PROBER_H

> +#if IS_ENABLED(CONFIG_OF_DYNAMIC)

Do you really need to hide data types with this? Wouldn't be enough to hide
APIs only?

> +struct device;
> +struct device_node;
> +
> +/**
> + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> + *
> + * A set of callbacks to be used by i2c_of_probe_component().
> + *
> + * All callbacks are optional. Callbacks are called only once per run, and are
> + * used in the order they are defined in this structure.
> + *
> + * All callbacks that have return values shall return %0 on success,
> + * or a negative error number on failure.
> + *
> + * The @dev parameter passed to the callbacks is the same as @dev passed to
> + * i2c_of_probe_component(). It should only be used for dev_printk() calls
> + * and nothing else, especially not managed device resource (devres) APIs.
> + */
> +struct i2c_of_probe_ops {
> +	/** @get_resources: Retrieve resources for components. */
> +	int (*get_resources)(struct device *dev, struct device_node *bus_node, void *data);
> +
> +	/** @free_resources_early: Release exclusive resources prior to enabling component. */
> +	void (*free_resources_early)(void *data);
> +
> +	/**
> +	 * @enable: Enable resources so that the components respond to probes.
> +	 *
> +	 * Resources should be reverted to their initial state before returning if this fails.
> +	 */
> +	int (*enable)(struct device *dev, void *data);
> +
> +	/**
> +	 * @cleanup: Opposite of @enable to balance refcounts after probing.
> +	 *
> +	 * Can not operate on resources already freed in @free_resources_early.
> +	 */
> +	int (*cleanup)(struct device *dev, void *data);
> +
> +	/**
> +	 * @free_resources_late: Release all resources, including those that would have
> +	 *                       been released by @free_resources_early.
> +	 */
> +	void (*free_resources_late)(void *data);
> +};
> +
> +/**
> + * struct i2c_of_probe_cfg - I2C OF component prober configuration
> + * @ops: Callbacks for the prober to use.
> + * @type: A string to match the device node name prefix to probe for.
> + */
> +struct i2c_of_probe_cfg {
> +	const struct i2c_of_probe_ops *ops;
> +	const char *type;
> +};
> +
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx);
> +
> +#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
> +
> +#endif /* _LINUX_I2C_OF_PROBER_H */

-- 
With Best Regards,
Andy Shevchenko



