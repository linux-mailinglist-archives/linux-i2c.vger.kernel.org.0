Return-Path: <linux-i2c+bounces-6191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1996BF8B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD7331F21FD1
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3780F1DA10D;
	Wed,  4 Sep 2024 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWYT5WFS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878EF1EBFF7;
	Wed,  4 Sep 2024 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458651; cv=none; b=EuOBDnhoLN2/ipNAWMdGNtF3UE+X1t5T9zBUftQ2AeW0/eqLUeY560e0Zt1Ened8Gv0crXjJBCoSoQy6ODgJgqUoeJWjncdN7yzBP19/kY8eVSPKoZLPsSM4Cz7p71E22U1/YIdT5jLsMQQJqMsrRSqPcMJIUd7JlXFiGcGvSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458651; c=relaxed/simple;
	bh=4TSPzyXFo3mbtoWssEyI2IeYSaBZSS1lpLsVvyGQj+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VadFAVlzXRRwMIvYftVgXIdiO2UeVG20DJIDXOHaXxihWzg9rfP6k0CjyyVZVGgvRToQNSiKcG0xeNSeYeWehBD2ZJOfawTNurqeljOjo4PL/VZ41VQQsnbEOVvfikemLZkB5q5YRJPI4IoWE8m6zlPr7hyLdpwCTMeL+pvDJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWYT5WFS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725458650; x=1756994650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4TSPzyXFo3mbtoWssEyI2IeYSaBZSS1lpLsVvyGQj+w=;
  b=jWYT5WFSSAd++YWDOM6kYfYT/Fwzd4ocz7iJQxFcLr4G45harGxmBQgg
   vwkD72oIrcUpXVxvCK0rnV6HAsTMGjvcxKui1/roq9nHUt+jvZ+Ua0lbJ
   xURYoPRcaL4/UlcTvdRYLs0NK2T+URMMbM+kAWgWBwpMAqiRbl7Bc+7V9
   5GCDIXEgcr91gjNItOLNUWynDlFY1RpECFb5JuLEGa8wdKJDHrVcXrQh7
   7lzqYYUMrixfQxlKM5292VhFrzM3og9EjZ8cdh0ZhFyTMvRhpAO5GVIRr
   Z+G98ChGMnyAo6BfIC+4JxG+2CXmz1Zo3vQNRwJS8sAoerHH1a237vLcM
   Q==;
X-CSE-ConnectionGUID: 0SneqrSkRq+9ax95WV73tQ==
X-CSE-MsgGUID: fAstGxtiQ2SPUqgdMG/igw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24263230"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24263230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:04:09 -0700
X-CSE-ConnectionGUID: vo0i1YUjRZmNB8mT1EJMSw==
X-CSE-MsgGUID: iLEpjnPLTGeJk6AuL3/5Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65120093"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:04:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqc6-000000055Ds-0KY5;
	Wed, 04 Sep 2024 17:04:02 +0300
Date: Wed, 4 Sep 2024 17:04:01 +0300
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
Subject: Re: [PATCH v6 10/12] i2c: of-prober: Add GPIO support
Message-ID: <Ztho0WuqgFZxpD1Q@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-11-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-11-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:12PM +0800, Chen-Yu Tsai wrote:
> This adds GPIO management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> regulator support was added in the previous patch.
> 
> Without specific knowledge of each component's resource names or
> power sequencing requirements, the prober can only enable the
> regulator supplies all at once, and toggle the GPIOs all at once.
> Luckily, reset pins tend to be active low, while enable pins tend to
> be active high, so setting the raw status of all GPIO pins to high
> should work. The wait time before and after resources are enabled
> are collected from existing drivers and device trees.
> 
> The prober collects resources from all possible components and enables
> them together, instead of enabling resources and probing each component
> one by one. The latter approach does not provide any boot time benefits
> over simply enabling each component and letting each driver probe
> sequentially.
> 
> The prober will also deduplicate the resources, since on a component
> swap out or co-layout design, the resources are always the same.
> While duplicate regulator supplies won't cause much issue, shared
> GPIOs don't work reliably, especially with other drivers. For the
> same reason, the prober will release the GPIOs before the successfully
> probed component is actually enabled.

...

> +static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
> +				  struct i2c_of_probe_data *data)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> +	struct gpio_descs *gpiods;
> +	struct gpio_desc *gpiod;
> +	char propname[32]; /* 32 is max size of property name */
> +	char *con_id = NULL;
> +	size_t new_size;
> +	int len, ret;
> +
> +	len = gpio_get_property_name_length(prop->name);
> +	if (len < 0)
> +		return 0;
> +
> +	ret = strscpy(propname, prop->name);
> +	if (ret < 0) {
> +		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
> +		       node, prop->name);
> +		return -EINVAL;

Any good reason to shadow the error code from strscpy() here?

> +	}
> +
> +	if (len > 0) {
> +		/* "len < ARRAY_SIZE(propname)" guaranteed by strscpy() above */

is guaranteed

> +		propname[len] = '\0';

Please, check if it's guaranteed by strscpy() (IIRC it is, hence redundant line).

> +		con_id = propname;
> +	}
> +
> +	/*
> +	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
> +	 * can't differentiate between GPIOs shared between devices to be probed and
> +	 * other devices (which is incorrect). If the initial request fails with
> +	 * -EBUSY, retry with GPIOD_FLAGS_BIT_NONEXCLUSIVE and see if it matches
> +	 * any existing ones.
> +	 */
> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod)) {
> +		if (PTR_ERR(gpiod) != -EBUSY || !data->gpiods)
> +			return PTR_ERR(gpiod);
> +
> +		gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0,
> +					       GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> +					       "i2c-of-prober");
> +		for (unsigned int i = 0; i < data->gpiods->ndescs; i++)
> +			if (gpiod == data->gpiods->desc[i])
> +				return 1;
> +
> +		return -EBUSY;
> +	}
> +
> +	new_size = struct_size(gpiods, desc, data->gpiods ? data->gpiods->ndescs + 1 : 1);
> +	gpiods = krealloc(data->gpiods, new_size, GFP_KERNEL);
> +	if (!gpiods) {
> +		gpiod_put(gpiod);
> +		return -ENOMEM;
> +	}
> +
> +	data->gpiods = gpiods;
> +	data->gpiods->desc[data->gpiods->ndescs++] = gpiod;
> +
> +	return 1;
> +}

...

> +static int i2c_of_probe_set_gpios(struct device *dev, struct i2c_of_probe_data *data)
> +{
> +	int ret;
> +	int gpio_i;

Why signed? And can it be simply named 'i'?

> +
> +	if (!data->gpiods)
> +		return 0;
> +
> +	for (gpio_i = 0; gpio_i < data->gpiods->ndescs; gpio_i++) {
> +		/*
> +		 * "reset" GPIOs normally have opposite polarity compared to
> +		 * "enable" GPIOs. Instead of parsing the flags again, simply
> +		 * set the raw value to high.
> +		 */
> +		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
> +		ret = gpiod_direction_output_raw(data->gpiods->desc[gpio_i], 1);
> +		if (ret)
> +			goto disable_gpios;
> +	}
> +
> +	msleep(data->opts->post_reset_deassert_delay_ms);
> +
> +	return 0;
> +
> +disable_gpios:

> +	for (gpio_i--; gpio_i >= 0; gpio_i--)

	while (i--)

> +		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);
> +
> +	return ret;
> +}


-- 
With Best Regards,
Andy Shevchenko



