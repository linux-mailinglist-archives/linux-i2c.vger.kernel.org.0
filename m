Return-Path: <linux-i2c+bounces-5679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FE95B833
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 986971C236D1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAD81CB154;
	Thu, 22 Aug 2024 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLb1bdj/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99501C93DF;
	Thu, 22 Aug 2024 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336451; cv=none; b=a8+44wGuB9QZ6j3oOnfjxALJphuLAwHlGau1VvKW1rFF2prVsj0EMVl2gJ1wi8nlXLTYgiGMc8/ulaHGLH7kBCyDhmLCEruykVjgUAhr3eVYYuXYydcCYQjs8nhMPTsSE8CXQqMURjro1twAUTGugEttKMmrJPTsZy4JVUb49qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336451; c=relaxed/simple;
	bh=DbkNI2FbaBywilWppugkB1Yz7W1BXd9eW/krIM7n1Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtI6BAynISPIqVzi/qpVox1TipfOVeGXOQul4qnuDgbmmPcOfa1iVHJ5XZ+ZTfznSpkGLybC5+iT2c0KXHJKWTq1boMzuoXnOusk6Necy0gUzNj/eZawh0SKydvvdhpIJyT/l1kuyxH5wh3D3oLKLK/PBj29PzBKknJ0mF+lHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLb1bdj/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724336450; x=1755872450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DbkNI2FbaBywilWppugkB1Yz7W1BXd9eW/krIM7n1Lg=;
  b=FLb1bdj/uyIRegGVz9DaoxdPm8jav5Rc5GgKJsOmAEyiPO7VC83R28sf
   ZSbN5+OSyhA6urxwaBk/NLa4+PIpDQTy9ZkJELgJEVKN6rScnKOkjnkvS
   3Q5vgjGUIueNA3Tavxpn4gxPHg1AuZs2GMauS3rLkXOvjiK1dkf08NTSw
   4piTaqvAZpeY3aL1rw60a7qN6sLYaQgzxbGPu5ntMb48GecXwrPRmC0/D
   pZYFE/c8HNfsAa4H/pQhvPBPhgJzYDR8GqNK9ffqCN/SID3S0zd19v76G
   rB1V+DiW4iCK4mkPq3zRD6UowSR1BpOQZSrSLhNGgyNjcbHpy4F0h/W25
   A==;
X-CSE-ConnectionGUID: 2jNETJlQQH6VvK1gDQkVdw==
X-CSE-MsgGUID: 4T3h9FnwRImNoduJLnsuuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40264409"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="40264409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:20:49 -0700
X-CSE-ConnectionGUID: Xgwb6QXRS7q1FUsK/fMpdg==
X-CSE-MsgGUID: DY2HQ1VIR2i4q8kjbVJB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61465764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:20:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8g6-00000000TfG-10aA;
	Thu, 22 Aug 2024 17:20:42 +0300
Date: Thu, 22 Aug 2024 17:20:41 +0300
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
Subject: Re: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
Message-ID: <ZsdJOUe44hiGur-s@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:
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

> +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> +	struct gpio_descs *gpiods;
> +	struct gpio_desc *gpiod;
> +	char con[32]; /* 32 is max size of property name */

Use 'propname' to be aligned with GPIO library usages.

> +	char *con_id = NULL;
> +	size_t new_size;
> +	int len;

...

> +	if (len >= sizeof(con) - 1) {

This can be transformed to check the returned value from strscpy().

> +		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
> +		       node, prop->name);
> +		return -EINVAL;
> +	}
> +
> +	if (len > 0) {
> +		strscpy(con, prop->name, len + 1);

The correct (robust) call is with destination size. Which means here that you
may use 2-argument strscpy().

> +		con_id = con;
> +	}

...

> +	if (!data->gpiods)
> +		return 0;

If it comes a new code (something else besides GPIOs and regulators) this will be a (small) impediment. Better to have a helper for each case and do

	ret = ..._gpiods();
	if (ret)
		...

Same for regulators and anything else in the future, if any.

> +		/*
> +		 * reset GPIOs normally have opposite polarity compared to

"reset"

> +		 * enable GPIOs. Instead of parsing the flags again, simply

"enable"

> +		 * set the raw value to high.

This is quite a fragile assumption. Yes, it would work in 98% cases, but will
break if it's not true somewhere else.

> +		 */

...

> +	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
> +	msleep(300);

Same Q, how do you monitor _all_ the drivers?

...

> +disable_gpios:
> +	for (gpio_i--; gpio_i >= 0; gpio_i--)
> +		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);

Can't you call the _array() variant here?

...

> -	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
> +	dev_dbg(dev, "Resources: # of GPIOs = %d, # of regulator supplies = %d\n",
> +		probe_data.gpiods ? probe_data.gpiods->ndescs : 0,
> +		probe_data.regulators_num);

I would issue one message per class of the devices (GPIOs, regulators, ...)

-- 
With Best Regards,
Andy Shevchenko



