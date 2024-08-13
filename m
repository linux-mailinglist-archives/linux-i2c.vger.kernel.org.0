Return-Path: <linux-i2c+bounces-5335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D89503EC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 13:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 771BBB21CBE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9D51990DE;
	Tue, 13 Aug 2024 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYbU/HvK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51496170A2B;
	Tue, 13 Aug 2024 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723549286; cv=none; b=tN/M8ygGo8FkzYRovZXtLJTAZW66PeS+A6tDsckgpdK1AGfUEuLRdIQ0ezR1zaSu2Nkn49ZsU4Y/6ZEhvWYkHi99NhXR2HpiiP1ABO44Zp/fISYfxhkOGnOOm40PXS9Ir9AyoMlYBQ+fPsxbcvPoOpisEHdj3hh4H0pn+0RIbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723549286; c=relaxed/simple;
	bh=I1yV/V1IVGNioZqOcI4srYsqZ1oyEFYyu5tfWfHA0Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKbnFldamn1HCjyZ1qaXPnqse03syDlrVK2+P8IS6e2xTpHgCKPF00Cygf09iy2bXgfVHGBmU6r3ADYKGP+NurGXvJkZbrCoe7LrOmvM3cwdDUWG6UncupU5OqkE4yfjin7cEzvNNtJ6vXGTzS2lQOc+SLQ8ZwVsnHpULv+fN1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYbU/HvK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723549285; x=1755085285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I1yV/V1IVGNioZqOcI4srYsqZ1oyEFYyu5tfWfHA0Ro=;
  b=kYbU/HvK58Dk2jrq/t9/935Itk/LzXQ2EelQwcGRpwvfLCiN/sNtA/UH
   4iuyVGAFaUB1QnN2PCl5SZ+NSwbfQgFYXfBuW1VJIqoCxNSm4htU0qfb6
   KyM1PIMgeMdrw2xRPUIKSEMtH4Zqr/ActARY9QTUHWn3z8ANYS2YV+4sb
   vCXqg+rO0LvbdLgAQqgwEY80y5B/UZucYSVM2Gf41MHvoe0PhoQ9AXk3k
   5teNTlODuDFbtlYYoArcsJzB4zrSxsvwtnGyi67xT88QTC+2C0c0kcJ8L
   2d6bO2VAibZCuE9M3kKAX2kMGkUcMoSPVuQ/mJt81iHPpkpt8bNaixK2k
   Q==;
X-CSE-ConnectionGUID: 8PBSXPctRa6lVN1tIa7XYg==
X-CSE-MsgGUID: /hhNGdqfQSySfuRQCNbkrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44226863"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="44226863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:41:24 -0700
X-CSE-ConnectionGUID: Su+4s2FHRTCcvTwpuFdDtA==
X-CSE-MsgGUID: Cww//6/TSFSLG5x9b7d5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58604117"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:41:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdptt-0000000EiB6-1uXP;
	Tue, 13 Aug 2024 14:41:17 +0300
Date: Tue, 13 Aug 2024 14:41:17 +0300
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
Subject: Re: [PATCH v4 4/6] i2c: of-prober: Add GPIO and regulator support
Message-ID: <ZrtGXfKE6BwupPPA@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-5-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 08, 2024 at 05:59:27PM +0800, Chen-Yu Tsai wrote:
> This adds GPIO and regulator management to the I2C OF component prober.

Can this be two patches?

> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
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

> +/*
> + * While 8 seems like a small number, especially when probing many component
> + * options, in practice all the options will have the same resources. The
> + * code getting the resources below does deduplication to avoid conflicts.
> + */
> +#define RESOURCE_MAX 8

Badly (broadly) named constant. Is it not the same that defines arguments in
the OF phandle lookup? Can you use that instead?

...

> +#define REGULATOR_SUFFIX "-supply"

Name is bad, also move '-' to the code, it's not part of the suffix, it's a
separator AFAICT.

...

> +	p = strstr(prop->name, REGULATOR_SUFFIX);

strstr()?! Are you sure it will have no side effects on some interesting names?

> +	if (!p)
> +		return 0;

> +	if (strcmp(p, REGULATOR_SUFFIX))
> +		return 0;

Ah, you do it this way...

What about




> +
> +	strscpy(con, prop->name, p - prop->name + 1);
> +	regulator = regulator_of_get_optional(node, con);
> +	/* DT lookup should never return -ENODEV */
> +	if (IS_ERR(regulator))
> +		return PTR_ERR(regulator);

...

> +	for (int i = 0; i < data->regulators_num; i++)

Why signed?

> +		if (regulator_is_equal(regulator, data->regulators[i])) {
> +			regulator_put(regulator);
> +			regulator = NULL;
> +			break;
> +		}

...

> +#define GPIO_SUFFIX "-gpio"

Bad define name, and why not "gpios"?

...

> +	p = strstr(prop->name, GPIO_SUFFIX);
> +	if (p) {
> +		strscpy(con, prop->name, p - prop->name + 1);
> +		con_id = con;
> +	} else if (strcmp(prop->name, "gpio") && strcmp(prop->name, "gpios")) {
> +		return 0;

We have an array of these suffixes, please use it. If required make it exported
to the others.

> +	}

...

> +	ret = of_parse_phandle_with_args_map(node, prop->name, "gpio", 0, &phargs);
> +	if (ret)
> +		return ret;

> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod)) {
> +		of_node_put(phargs.np);
> +		return PTR_ERR(gpiod);
> +	}

Try not to mix fwnode and OF specifics. You may rely on fwnode for GPIO completely.

> +	if (data->gpiods_num == ARRAY_SIZE(data->gpiods)) {
> +		of_node_put(phargs.np);
> +		gpiod_put(gpiod);
> +		return -ENOMEM;
> +	}

...

> +	for (int i = data->gpiods_num - 1; i >= 0; i--)
> +		gpiod_put(data->gpiods[i]);

This sounds like reinvention of gpiod_*_array() call.

...

> +	for (int i = data->regulators_num; i >= 0; i--)
> +		regulator_put(data->regulators[i]);

Bulk regulators?

...

> +	for_each_child_of_node_scoped(i2c_node, node) {

Eventually _scoped(), but...

> +		u32 addr;
> +
> +		if (!of_node_name_prefix(node, type))
> +			continue;
> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +
> +		dev_dbg(dev, "Requesting resources for %pOF\n", node);
> +		ret = i2c_of_probe_get_res(dev, node, &data);
> +		if (ret) {

> +			of_node_put(i2c_node);

...huh?!

> +			return ret;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko



