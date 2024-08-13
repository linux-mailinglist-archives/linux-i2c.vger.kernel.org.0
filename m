Return-Path: <linux-i2c+bounces-5333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57373950381
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 13:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6971F244FE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D164194AE6;
	Tue, 13 Aug 2024 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kna32EFk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674CE190470;
	Tue, 13 Aug 2024 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723548150; cv=none; b=r0hAdqlCp2ADKyw/yznUVmF7vFexTfkyy8GnUyL2/5M9H/dVfWlj/P7SakHpUk8zCKWHLzROe3RuMrzBdz3dNWlIHRse0GFLIJc1pWCk3WcaTeD29uoKIP8LsURIWYiVZX0p91qccc9Af08kUz7El2nt5Mt/oCa3bULHdWBF4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723548150; c=relaxed/simple;
	bh=mEePcR8nadTN2WwOSCJ4XUGSlm4GH5pq61cZ2MGoSgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1Z0pRDIxFtv4FOJNY0bkeKumV6P04CgxLfLuWYAbcyFYHbBVfd6hxJSKFipEuQ00zXdp3/eDIfVuoANz7SjD7CXDzA07feIy/Yy0w9GToiE1cOSHfb3+MGTrPqTot7BptlIBtonQRphBFbM2TuJUqWOLRjk9bFDcZPPJ2Ns9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kna32EFk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723548148; x=1755084148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mEePcR8nadTN2WwOSCJ4XUGSlm4GH5pq61cZ2MGoSgc=;
  b=kna32EFk+rB/2LoK8jQXVVpdU9fh4KdL1iguwdxlfcCCRlgH6Qn5f5nu
   Tg3p/byEYrUo8ynCut8XNEFCVM3+ZhknRCprVrSBk4GqRzHJa1Q6Itj4y
   Y16FFwTlWwZO4XwYlIDcpOglwWFNLdGfKJrrDAdLcSmkJ4G6t26ykHPd5
   e0YPiMNxdKgl8eGkNA3Zd/gxw2q55JJnxXFBcQaxdBNSJ/KPd2pH2TqgY
   XG/+CCbaJYA/Qwd3VZpBRQe1UnNk2rkew9oTZcMI6lyxnnvCkfe0cGbks
   D5+FD2DaVb0USqVtrmooaaJczfeJs6PGI9HfIwvOmwKAPooYeRzJRohp8
   A==;
X-CSE-ConnectionGUID: qEv35sFzQyOt+j/4/WROfQ==
X-CSE-MsgGUID: JEPn1LBATpCTiNVneOMSTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21263351"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21263351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:22:28 -0700
X-CSE-ConnectionGUID: iM9QhMsrRlC/RmA8aYMD7A==
X-CSE-MsgGUID: LwyBf4ceQ4W+RavON2Bbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58573160"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:22:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpbY-0000000EhrZ-2ZRZ;
	Tue, 13 Aug 2024 14:22:20 +0300
Date: Tue, 13 Aug 2024 14:22:20 +0300
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
Subject: Re: [PATCH v4 2/6] regulator: Add regulator_of_get_optional() for
 pure DT regulator lookup
Message-ID: <ZrtB7NPmnqF5ya2A@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 08, 2024 at 05:59:25PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> This adds a new regulator_of_get_optional() for this purpose. The
> underlying code that support the existing regulator_get*() functions
> are extended to support this specific case.

...

>  /**
>   * regulator_dev_lookup - lookup a regulator device.
>   * @dev: device for regulator "consumer".
> + * @node: device node for regulator supply lookup.
> + *        Falls back to dev->of_node if NULL.

Please, avoid using dereferences in the comments. Use plain language:
"Falls back to the OF node of the @dev, if NULL." or alike.

>   * @supply: Supply name or regulator ID.

>   */

...

>  static struct regulator_dev *regulator_dev_lookup(struct device *dev,
> +						  struct device_node *node,

This function has no of_ prefix in its name. If you want to make it for all,
please use fwnode instead. Otherwise I would expect a new one with of_ prefix.
(But I really prefer just agnostic, i.e. fwnode, approach!)

>  						  const char *supply)
>  {
> +	bool pure_dt_lookup = false;

Redundant assignment.

> +	pure_dt_lookup = (node && !dev);
>  
> +	/* Pure DT lookup should use given supply name directly */
> +	if (!pure_dt_lookup)
> +		regulator_supply_alias(&dev, &supply);
> +
> +	if (!node && dev && dev->of_node)

The dev->of_node is redundant and with the above...

> +		node = dev->of_node;

...this becomes as simple as

	if (!node && dev)

> +	/* Pure DT lookup stops here. */
> +	if (pure_dt_lookup)
> +		return ERR_PTR(-ENODEV);

Looking at this pure_dt_lookup and the above (somehow inverted) case I would
rather use (node && !dev) or (!node && dev) explicitly everywhere.

...

> +struct regulator *_regulator_get(struct device *dev, struct device_node *node,
> +				 const char *id, enum regulator_get_type get_type)

Again, no of_ prefix and function becomes OF-specific...

-- 
With Best Regards,
Andy Shevchenko



