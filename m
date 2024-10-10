Return-Path: <linux-i2c+bounces-7323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E1998C4D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 17:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74982B2C3DE
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8F51CC146;
	Thu, 10 Oct 2024 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0lpxxZS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F73B646;
	Thu, 10 Oct 2024 15:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573641; cv=none; b=r2wGOPdi3hmQWBR0AhwdVURRvLyj6P9cLtifZXE+diRVyWX67018CnRbp4nfRbF5jfFEcX+k3AmfWYBKLcSpBqxx9pERd0F9P8yzKM1SLypgwSyaNq4umWRaU/Rr7hebb/TVu+rp+RbBwmt1aPf1gElkGwIrLX61vwuAA5dLJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573641; c=relaxed/simple;
	bh=FMOKQmRnRuG0u6SCHuk/rSndbZsClfTEYhslQL/e4Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnaL6pqJ4dpwrJfeahfMKD++CPfbavR1IqWvK9uaMq8tJRMr8HTHI9pxG3nhjdxqtnD9xgOBpiT6YVYhY9f/LPWD4lcIfvsGt7I/5RKyOHM3eWmNttHYDxJi1q3L8KLJ+e1CHJAtUkijSpXFCoEliltnHmy927IG8+XdKkefOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0lpxxZS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728573640; x=1760109640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FMOKQmRnRuG0u6SCHuk/rSndbZsClfTEYhslQL/e4Ss=;
  b=Z0lpxxZSVK9zbaYNzoqGUBV29/foJEJf7mVF3GY8IWsSbnU0Qg0W3q0Y
   58EZ6HUZswo1Z2M8utA7g9z7qUSdQkONfXHS2TliWtCw5oMkQ7FolWJpg
   2Ls217S+PrhlJ5I0tVZzAGZMcfLUrUHmAFMvFLDpmLm4Q4eJwblg+Abxy
   auyvLob1gN9vJ0lwjp5nh/NKgmsvm8iy2Ip+D1NAM8korusUGqnMRq3CO
   6wLxOW0ltXsEc1887z8xx5ChoQaGRBr7TwYN/inChRG/3mu7Z02HVhD1e
   +VSjQYq4TZ6Q/uEp+nCnWSpGvB+XrOoN1xM+/oB2oedecnrIgw55qnOTl
   A==;
X-CSE-ConnectionGUID: W35/HYwmSrqEun/momCJJA==
X-CSE-MsgGUID: JqyMZV81RTu2+bLrf40CkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45417083"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="45417083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:20:39 -0700
X-CSE-ConnectionGUID: uFuqKWFpRUGoCWa1ZSzSlg==
X-CSE-MsgGUID: HFVp1nsLSFi0YkYM0dHCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76532971"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:20:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syuxr-00000001ZlS-3lMj;
	Thu, 10 Oct 2024 18:20:31 +0300
Date: Thu, 10 Oct 2024 18:20:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
Message-ID: <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073430.3992087-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.

...

> +static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct device_node *node,
> +					 struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> +	struct gpio_desc *gpiod;
> +	const char *con_id;
> +
> +	/* NULL signals no GPIO needed */
> +	if (!ctx->opts->gpio_name)
> +		return 0;
> +
> +	/* An empty string signals an unnamed GPIO */
> +	if (!ctx->opts->gpio_name[0])
> +		con_id = NULL;
> +	else
> +		con_id = ctx->opts->gpio_name;

Can it use positive conditional?

	if (ctx->opts->gpio_name[0])
		con_id = ctx->opts->gpio_name;
	else
		con_id = NULL;

> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	ctx->gpiod = gpiod;
> +
> +	return 0;
> +}

...

> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	if (!ctx->gpiod)
> +		return;

Do you need this check for the future patches?

> +	/* Ignore error if GPIO is not in output direction */
> +	gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> +}

...

>  struct regulator;
> +struct gpio_desc;

Ordered?

-- 
With Best Regards,
Andy Shevchenko



