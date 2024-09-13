Return-Path: <linux-i2c+bounces-6705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB411977E04
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB1528168F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99111D86C7;
	Fri, 13 Sep 2024 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DS0g2vZk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0FF14A4FB;
	Fri, 13 Sep 2024 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726224775; cv=none; b=cuv287MSLCwqlxdr7xt4O0pYxi3kZzLTUxuqnRM17OZRW3HtZtHBTRsI7OGLbcjmo8qkDz2UdVHA0STY/vYcMNoRTWxJojAYWEOBycGKGSaCAs0P2jTr8R8ZFuwhIqxio25rFbB0AeCzK7sYhJ3V+hLz1vUcI8e/asC4FuE4ww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726224775; c=relaxed/simple;
	bh=vfmDCSc14mOA4j2yfWDNkchC1g26e9g7RDxQlrvfJnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJGFzS1krq3XL4Vs2dOuSUJtr1BP5kiQYz+SfMtr40wypfUwKHsFyj4nF2zfo44arhF7YeDjAu7qrXL4M6jrMg/TOyu5Rwg+SXCkvGKbJ3sYJozLdsFt2nSdPw/qnecVkADFrr/stsMOnTnguKnAvQEpxvLt2oXhSBF/LDIp50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DS0g2vZk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726224774; x=1757760774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vfmDCSc14mOA4j2yfWDNkchC1g26e9g7RDxQlrvfJnI=;
  b=DS0g2vZkQ/zqWYJZ9edZ33/IC7ex4hnYXMqNOalLnNIMCMSKfH3uVhVi
   bx+oWdsmbqMLHPfrpAjRZp7ivj9/35g+iXUqOoejHAkOnh5fZJvmcaMlr
   rRd7Irfe3l1vlY8t0+IHS36pbiuddV4CPNRwb9MP95uNmsNAUIWiTZl+7
   m2Y1OCfsv7mBn8Slm0LAI2RfGMx7SuEQd4mi2I8BNTbMbLwH8ljHZ/1gX
   r3Qm3ZU4G+6MuFwBUe+Jj0U7t1W49mdXSq2xOUec8iKBpVuSVuKg3mhUj
   iJhZitARPNPGmfwIxcN0qFNZgLV/ke4ssiFn2Fc17x9uxlg/4uzJiYZyd
   A==;
X-CSE-ConnectionGUID: 4u5yQGEXQRGU1lTq8mb7FQ==
X-CSE-MsgGUID: vEHy6HWVRTKwhuM13kmzog==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24989409"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24989409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:52:54 -0700
X-CSE-ConnectionGUID: cSOVMhO3SjG5+iiaEOC6lw==
X-CSE-MsgGUID: Bcldi3p3QBCw2CtSci/RBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68331128"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:52:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3uw-00000008Gdo-2uie;
	Fri, 13 Sep 2024 13:52:46 +0300
Date: Fri, 13 Sep 2024 13:52:46 +0300
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
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZuQZfvqGii9fcH-j@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 03:27:46PM +0800, Chen-Yu Tsai wrote:
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
> +	const char *con_id = NULL;
> +
> +	/* NULL signals no GPIO needed */
> +	if (!ctx->opts->gpio_name)
> +		return 0;
> +
> +	/* An empty string signals an unnamed GPIO */
> +	if (strlen(ctx->opts->gpio_name))

You run for entire string in order to check the first byte only?

	if (ctx->opts->gpio_name[0] == '\0')
		con_id = NULL;
	else

> +		con_id = ctx->opts->gpio_name;

Also note, that comment is given in inverted condition to what you actually do
in the code. With my suggestion it looks better.

> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	ctx->gpiod = gpiod;
> +
> +	return 0;
> +}

...

> +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx->gpiod)
> +		return 0;

> +	dev_dbg(dev, "Setting GPIO\n");

> +	ret = gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_high_to_enable ? 1 : 0);

Hmm... _raw() in use... Perhaps it's on a territory of Bart and Linus to review
and comment on this.

> +	if (ret)
> +		return ret;
> +
> +	msleep(ctx->opts->post_reset_deassert_delay_ms);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



