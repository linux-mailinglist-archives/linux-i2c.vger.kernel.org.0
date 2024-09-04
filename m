Return-Path: <linux-i2c+bounces-6176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D453496BDF6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534AE1F227B2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1191DB940;
	Wed,  4 Sep 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNS67AgF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE61DAC4E;
	Wed,  4 Sep 2024 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455404; cv=none; b=mI/+OFdtohrtBNhzXwzTRdB8lkQANoMd3xbbACbViaYEaHlCXvr3SeocZC+8Iqe1DCwWfSiDubjl5nJlGTL3cgC9MrTOnkVCo2WP0m8peeKp/En9g0FMCRpnjq49TFLG2cDuMJXrl94C+P/STVPk8o+hyKn+Xbmi5Np8uFKZnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455404; c=relaxed/simple;
	bh=tATWn40qt4pXS+t/MnTUTHbZoXR7GdywvSxVFOVuwNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQYlWdU9xjQQ8DkV2cefEf8K1yltSXQyNN2shP/8m/EjymFXgvDj38I8WFBFicDj6uN3u/WSa6BRtXIzJWT4h5BmjxgniEzS2ZDAED6t9dLPTQLq7JyNOa78QtPCbAbo17Byjbzzgm30ix2+c4ZV//j7WOTmZcCH6n9oCw02evQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNS67AgF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455403; x=1756991403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tATWn40qt4pXS+t/MnTUTHbZoXR7GdywvSxVFOVuwNw=;
  b=lNS67AgFSn/C79coJF+OiI/fVpnOzxWferL4iRJo93eCKeIdATXS1WF8
   Aq2s0gWOP/aMgLbbgukhZb0QYDJjYraInHRDlgskFU3m/623ziagnSCTR
   hVoGfUW7pDAR1pJb1a4TIDIzp7ZIm+AZv2X0Vi2emLtdEfzZhnH4HQrRh
   OfbQiXq50BXSuqViYb0s1vgNZr0zBShj7CxO6eCRm7+cmVwBP0u67K8O0
   k5DQfFS0tP7yo3O8XMJ8L7ZUUNUO4TF7MpF+tMe8PiTcMjv9FrgHsT9h2
   PcOle711Y+PEu8OBJ9YXfbcqD5i9PBMfSejRv703U9ldWfBSEHezfIzeX
   A==;
X-CSE-ConnectionGUID: 2HdmYyBMQxKLHa37bOQPHQ==
X-CSE-MsgGUID: p8gNrBBqROWK/91fEjC9PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35475114"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35475114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:10:02 -0700
X-CSE-ConnectionGUID: uC3tCP1tTJOsjejHvYHljg==
X-CSE-MsgGUID: zGepQVQES8CnElRy5vFcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65307987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:09:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slplG-000000054Je-2wKN;
	Wed, 04 Sep 2024 16:09:26 +0300
Date: Wed, 4 Sep 2024 16:09:26 +0300
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
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:
> There's still a bit of OF-specific code in the regulator device lookup
> function.
> 
> Move those bits of code over to of_regulator.c, and create a new
> function of_regulator_dev_lookup() to encapsulate the code moved out of
> regulator_dev_lookup().
> 
> Also mark of_find_regulator_by_node() as static, since there are no
> other users in other compile units.
> 
> There are no functional changes. A line alignment was also fixed.

...

> +/**
> + * of_get_child_regulator - get a child regulator device node
> + * based on supply name
> + * @parent: Parent device node
> + * @prop_name: Combination regulator supply name and "-supply"
> + *
> + * Traverse all child nodes.
> + * Extract the child regulator device node corresponding to the supply name.
> + *
> + * Return: Pointer to the &struct device_node corresponding to the regulator
> + *	   if found, or %NULL if not found.
> + */
> +static struct device_node *of_get_child_regulator(struct device_node *parent,
> +						  const char *prop_name)
> +{
> +	struct device_node *regnode = NULL;
> +	struct device_node *child = NULL;
> +
> +	for_each_child_of_node(parent, child) {

> +		regnode = of_parse_phandle(child, prop_name, 0);
> +		if (!regnode) {
> +			regnode = of_get_child_regulator(child, prop_name);
> +			if (regnode)
> +				goto err_node_put;
> +		} else {
> +			goto err_node_put;
> +		}

I know this is just a move of the existing code, but consider negating the
conditional and have something like

		regnode = of_parse_phandle(child, prop_name, 0);
		if (regnode)
			goto err_node_put;

		regnode = of_get_child_regulator(child, prop_name);
		if (regnode)
			goto err_node_put;

> +	}
> +	return NULL;
> +
> +err_node_put:
> +	of_node_put(child);
> +	return regnode;
> +}

...

I assume the use of _scoped() macros is in mind for the future changes?

...

> +/**
> + * of_get_regulator - get a regulator device node based on supply name
> + * @dev: Device pointer for the consumer (of regulator) device
> + * @supply: regulator supply name
> + *
> + * Extract the regulator device node corresponding to the supply name.
> + *
> + * Return: Pointer to the &struct device_node corresponding to the regulator
> + *	   if found, or %NULL if not found.
> + */
> +static struct device_node *of_get_regulator(struct device *dev, const char *supply)
> +{
> +	struct device_node *regnode = NULL;
> +	char prop_name[64]; /* 64 is max size of property name */
> +
> +	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
> +
> +	snprintf(prop_name, 64, "%s-supply", supply);
> +	regnode = of_parse_phandle(dev->of_node, prop_name, 0);

> +	if (!regnode) {

Similarly here

	snprintf(prop_name, 64, "%s-supply", supply);
	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
	if (regnode)
		return regnode;


> +		regnode = of_get_child_regulator(dev->of_node, prop_name);
> +		if (regnode)
> +			return regnode;
> +
> +		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
> +			prop_name, dev->of_node);
> +		return NULL;
> +	}
> +	return regnode;

	regnode = of_get_child_regulator(dev->of_node, prop_name);
	if (regnode)
		return regnode;

	dev_dbg(dev, "Looking up %s property in node %pOF failed\n", prop_name, dev->of_node);
	return NULL;

> +}

-- 
With Best Regards,
Andy Shevchenko



