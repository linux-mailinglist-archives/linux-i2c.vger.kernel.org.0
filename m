Return-Path: <linux-i2c+bounces-6704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F9977DEA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F251C21B80
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464961D88A2;
	Fri, 13 Sep 2024 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ae/23Uoq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729791D7E39;
	Fri, 13 Sep 2024 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726224397; cv=none; b=q6FOLkC8x+52mKl7vhsDw92ZGVhOwBmqteTNqi6icWjzWp9gIGoHkKQm5qJyhtd/KUGJS7v7Ke/ea7EdvJIBpw9LKGBtyXNc/ZBZbS5p9FjB4GwLysvhI8a30f7Fq2/5dFtcuKrB3p40XovayDcMAp7a9tdy63n4d3y0ojG9DMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726224397; c=relaxed/simple;
	bh=e+un8vaDxaujRJMqDIAlvYg83zY4vEsoD9RPHPWxTwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pr50SIhIb24cM9h06YitJFBN8SxClEK9CHESn2BbZCXzXyH24JM6c9OkdK7Oc+1CXMLKVcjPFKCCalk/TwSmIPa2iHhiGkaddYXPvUng7BlJ2u+sQcokEFaHs2QMS1L+ufqB4SL5gi+bPW5qc+5ktCh0OmO2VvllSr6mt9V+QWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ae/23Uoq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726224395; x=1757760395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e+un8vaDxaujRJMqDIAlvYg83zY4vEsoD9RPHPWxTwo=;
  b=ae/23UoqqdmhacqBw6LjgwJxMICWMMRsYuVkiQDeRXCJ3kk1d3WnpBxG
   ILib/1bJGKgcv4E/PvEjvsoqXZv1SWCCoD8LVagu7Op90pueNpQ8xFl+1
   uYraH9lCMpDuo4QYrP6JdEBf07MF4WiD0dQi08MLLjD+zW5EN8Pg15+Uf
   ovFFCFd8ntUPuv5ij6pbZSvqhYmiYniDl30B0mrTUdDyOP37ODfTSY7Vm
   cZjSGEAQvDfgLd9utZOMoOWgHfoSYMLHLuftAcgzqd0uA2FNeo0XLgQGv
   xiApmu2EG4q5kV5LageiHKEU4Z/YPizUF4Nny0PbPC00xpf2fbOdg7Ptl
   Q==;
X-CSE-ConnectionGUID: vk65TY1JRMyugHXntDcOwg==
X-CSE-MsgGUID: vz7xmvZzRpyVVa6M/Y4RZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35785565"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35785565"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:46:33 -0700
X-CSE-ConnectionGUID: Hhyk6Xc+Sgq83pUXYmyoqg==
X-CSE-MsgGUID: meWPunBWTZyMDaizKz0Dpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72781058"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:46:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3oo-00000008GXj-3PLy;
	Fri, 13 Sep 2024 13:46:26 +0300
Date: Fri, 13 Sep 2024 13:46:26 +0300
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
Subject: Re: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for
 regulator support
Message-ID: <ZuQYAu9tBN0wrNfo@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 03:27:45PM +0800, Chen-Yu Tsai wrote:
> Add helpers to do regulator management for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This set of helpers supports at most one regulator supply. The user
> must specify the node from which the supply is retrieved. The supply
> name and the amount of time to wait after the supply is enabled are
> also given by the user.

...

> +static int i2c_of_probe_simple_get_supply(struct device *dev, struct device_node *node,
> +					  struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	const char *supply_name;
> +	struct regulator *supply;
> +
> +	/*
> +	 * It's entirely possible for the component's device node to not have regulator
> +	 * supplies. While it does not make sense from a hardware perspective, the
> +	 * supplies could be always on or otherwise not modeled in the device tree, but
> +	 * the device would still work.
> +	 */

I would reformat as

	/*
	 * It's entirely possible for the component's device node to not have the
	 * regulator supplies. While it does not make sense from a hardware perspective,
	 * the supplies could be always on or otherwise not modeled in the device tree,
	 * but the device would still work.
	 */

> +	supply_name = ctx->opts->supply_name;
> +	if (!supply_name)
> +		return 0;
> +
> +	supply = of_regulator_get_optional(dev, node, supply_name);
> +	if (IS_ERR(supply)) {
> +		return dev_err_probe(dev, PTR_ERR(supply),
> +				     "Failed to get regulator supply \"%s\" from %pOF\n",
> +				     supply_name, node);
> +	}
> +
> +	ctx->supply = supply;
> +
> +	return 0;
> +}

...

> +int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node, void *data)
> +{
> +	struct i2c_of_probe_simple_ctx *ctx = data;
> +	struct device_node *node;
> +	const char *compat;
> +	int ret;
> +
> +	dev_dbg(dev, "Requesting resources for components under I2C bus %pOF\n", bus_node);
> +
> +	if (!ctx || !ctx->opts)
> +		return -EINVAL;
> +
> +	compat = ctx->opts->res_node_compatible;
> +	if (!compat)
> +		return -EINVAL;

> +	node = of_get_compatible_child(bus_node, compat);

	__free(of_node_put) ?

> +	if (!node)
> +		return dev_err_probe(dev, -ENODEV, "No device compatible with \"%s\" found\n",
> +				     compat);
> +
> +	ret = i2c_of_probe_simple_get_supply(dev, node, ctx);
> +	if (ret)
> +		goto out_put_node;
> +
> +	return 0;
> +
> +out_put_node:
> +	of_node_put(node);
> +	return ret;
> +}

...

> + * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().

No need to duplicate the units as it's obvious from the variable name and msleep().

 * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().

-- 
With Best Regards,
Andy Shevchenko



