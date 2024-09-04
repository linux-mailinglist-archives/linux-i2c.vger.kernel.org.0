Return-Path: <linux-i2c+bounces-6189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C996BF03
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F70E1F27210
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141231D9335;
	Wed,  4 Sep 2024 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4OmrQLu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A51EEE4;
	Wed,  4 Sep 2024 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457650; cv=none; b=dzpz51yPoZC3X51WhAGR5LtCKS/V6k+VlSaiimX3Ag5vj/GK32ahZFzyTA26JRtxAt0wyWpN4bXrQXbLQ0B7JLAZX4lBDbS6WN/unm3d8d5pL+BVUfkzfp7BuRtfhHTIEi5ImIqzuRf6Zv8jnmLoxQBNwa106fh/ZYxBQaTuN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457650; c=relaxed/simple;
	bh=1Cm5WztYIpFnLS6eIgGjNr9ik/LNax1LhuKH3YtfC70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQscFCpYIvkRnNJrU23r7fPDC+MCtUTRXxuqMIa6LUuGVGvgaohCLGY/Un8iGFNqKKK+IIeIikqof1glt5opDnFUvlbu3Bdj4Rd8xJJwd97wwxhRhREcYdQNiNpc+0RELxGXmjoamhsAHg8oYA/pvt2fwXuB1fvxfxPiiTNNKeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4OmrQLu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725457650; x=1756993650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Cm5WztYIpFnLS6eIgGjNr9ik/LNax1LhuKH3YtfC70=;
  b=U4OmrQLunMQPdJUrIVIBuWRzuEmNi711aUf8vXENF6oHGhlf+pcsmbYc
   85CfI8qdqrWfbGbfxcoDng5XgwxTs4kmmaMgEiVh8uDKG6f3WcjDycOKx
   Lmcp3sSJ8ttab6JDhH6U8ZhKDCCefuEKVJzVFXkjvQWHAwa2EqiCAbFJv
   BoR9Rx3Ro5tUlOHIKkNzhjiUzm3gEyjMSu11vzIEaeEbZakISf35qCEjd
   WFn3vByCzMnK3mdwrNs2TGxqWuUxK22LNZ/nS/HR6EaVYQEjRDHbUV+dB
   1ubKK22C7JHddcy6O5J3BEDL+ZhJ94+8YvhEgTND96qDq7mlrf//++huL
   Q==;
X-CSE-ConnectionGUID: 0GuWNIniTtyE0jqPl238Pw==
X-CSE-MsgGUID: Dzwq+E1FTRWHypP06PNIfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27908230"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="27908230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:47:29 -0700
X-CSE-ConnectionGUID: AnPe26GcRkKYzlcvhNgOPA==
X-CSE-MsgGUID: p869J8LsREyJ55Rt1L9mqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65315322"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:47:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqLy-000000054xO-11w6;
	Wed, 04 Sep 2024 16:47:22 +0300
Date: Wed, 4 Sep 2024 16:47:07 +0300
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
Subject: Re: [PATCH v6 08/12] i2c: Introduce OF component probe function
Message-ID: <Zthk25W0zXcHWRdt@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:10PM +0800, Chen-Yu Tsai wrote:
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

> +int i2c_of_probe_component(struct device *dev, const char *type)
> +{
> +	struct i2c_adapter *i2c;
> +	int ret;
> +
> +	struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
> +	if (IS_ERR(i2c_node))
> +		return PTR_ERR(i2c_node);

> +	for_each_child_of_node_scoped(i2c_node, node) {

Hmm, but can it be for_each_child_of_node_with_prefix_scoped() now?

> +		if (!of_node_name_prefix(node, type))
> +			continue;
> +		if (!of_device_is_available(node))
> +			continue;
> +
> +		/*
> +		 * Device tree has component already enabled. Either the
> +		 * device tree isn't supported or we already probed once.
> +		 */
> +		return 0;
> +	}
> +
> +	i2c = of_get_i2c_adapter_by_node(i2c_node);
> +	if (!i2c)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
> +
> +	ret = 0;
> +	for_each_child_of_node_scoped(i2c_node, node) {

Ditto.

> +		union i2c_smbus_data data;
> +		u32 addr;
> +
> +		if (!of_node_name_prefix(node, type))
> +			continue;
> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
> +			continue;
> +
> +		/* Found a device that is responding */
> +		ret = i2c_of_probe_enable_node(dev, node);
> +		break;
> +	}
> +
> +	i2c_put_adapter(i2c);
> +
> +	return ret;
> +}

...

> +EXPORT_SYMBOL_GPL(i2c_of_probe_component);

Wonder if we may already use namespaced export from day 1.

-- 
With Best Regards,
Andy Shevchenko



