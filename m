Return-Path: <linux-i2c+bounces-5678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4DC95B803
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C6DAB231F0
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA7B1CB316;
	Thu, 22 Aug 2024 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxhKk+7b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD3BA45;
	Thu, 22 Aug 2024 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335776; cv=none; b=cTJqaXWEjK2SYWY0Tv5V60inYE+eLggfNVGa7CI1gTBkmST6G49sys3E66aE9gObFxiXwM86Z097jZ6Qdhk/Sc0B61j1QULUtqiHGUOQlsXCkN/kL0CJG+VDQOqj9bGQOwRbe3W5Q5fjDJQVFeFDII8483kTHxzEAO9c51apcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335776; c=relaxed/simple;
	bh=Zz4O4whEUesMfAhJ7j0Z3pqJqU8Y23VLUAaNVPdDNDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCwP+w9Rp0/iTRt2zEk/t10ljUAi9Kr27ww/+8zJoKtN/oOHqSlGzU847bzxm0ropz1CtRBzvCykuvSIt/R1chWl5U/U5PkcWfLd72u0qrIbhlCgMub49XytqXNmhTi5r9rsYh9mwB5h+0MxnZHp2yv6wwXKEI/SiZVMXdkJH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxhKk+7b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724335774; x=1755871774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zz4O4whEUesMfAhJ7j0Z3pqJqU8Y23VLUAaNVPdDNDc=;
  b=DxhKk+7b+HRihOP5y4iZ+F18z+aFiLEawH8fNPt3MOHJqZkplto2m3DJ
   AoXFknyVAZn5WlcPfvNnX6px43SfKaiYEDHorzf8rCbSr/gaijhzQq0da
   6x8WuSGtD2I4dZtbSDd8bWZm5FikDpmko93UgfZj58coETHG8N+6UuFB3
   78pqq4V1MXU4VWsPZEWeflkLNG0S7FgDk02Ol75qsshHy65W0i08DHCk0
   d3pfN6vmF+TBXXzBehPQc27Jb5CHJ8NJItm5XYwBgfAXMpKzSsjvseWxC
   rL0Fyu7ZyWfJGh4MxGOZCxOiIn74FU1F6GdKkTf+91Kmmackdta6bCAd7
   A==;
X-CSE-ConnectionGUID: KGwcGZMwS5GRcEFWg/Uw2g==
X-CSE-MsgGUID: almexMnLT1OXqjij7u6Hkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33416183"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33416183"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:09:34 -0700
X-CSE-ConnectionGUID: o0O4O1N9Q9eKJEQkwOUDag==
X-CSE-MsgGUID: 4ThAX0y+RG21HH6ZEn/45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="84625756"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:09:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8VB-00000000TUH-0yhz;
	Thu, 22 Aug 2024 17:09:25 +0300
Date: Thu, 22 Aug 2024 17:09:24 +0300
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
Subject: Re: [PATCH v5 07/10] i2c: of-prober: Add regulator support
Message-ID: <ZsdGlMyq4pwWAOk4@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:20:00PM +0800, Chen-Yu Tsai wrote:
> This adds regulator management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
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

>  /*

>   * address responds.
>   *
>   * TODO:
> - * - Support handling common regulators and GPIOs.
> + * - Support handling common GPIOs.

You can split this to two lines in the first place and have less churn in this
patch and the other one.

>   * - Support I2C muxes
>   */

..

> +/* Returns number of regulator supplies found for node, or error. */
> +static int i2c_of_probe_get_regulator(struct device *dev, struct device_node *node,
> +				      struct i2c_of_probe_data *data)
> +{
> +	struct regulator_bulk_data *tmp, *new_regulators;
> +	int ret;
> +
> +	ret = of_regulator_bulk_get_all(dev, node, &tmp);
> +	if (ret <= 0)
> +		return ret;

I would split this and explain 0 case.


> +	if (!data->regulators) {
> +		data->regulators = tmp;
> +		data->regulators_num = ret;
> +		return ret;
> +	};
> +
> +	new_regulators = krealloc(data->regulators,
> +				  sizeof(*tmp) * (data->regulators_num + ret),

krealloc_array()

> +				  GFP_KERNEL);
> +	if (!new_regulators) {
> +		regulator_bulk_free(ret, tmp);
> +		return -ENOMEM;
> +	}
> +
> +	data->regulators = new_regulators;

> +	for (unsigned int i = 0; i < ret; i++)
> +		memcpy(&data->regulators[data->regulators_num++], &tmp[i], sizeof(*tmp));

Seems like copying array to array, no? If so, can't be done in a single memcpy() call?

> +	return ret;
> +}

...

> +static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
> +				struct i2c_of_probe_data *data)
> +{
> +	struct property *prop;
> +	int ret;
> +
> +	ret = i2c_of_probe_get_regulator(dev, node, data);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
> +		goto err_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_cleanup:
> +	i2c_of_probe_free_res(data);
> +	return ret;
> +}

Hmm... why not

static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
				struct i2c_of_probe_data *data)
{
	struct property *prop;
	int ret;

	ret = i2c_of_probe_get_regulator(dev, node, data);
	if (ret < 0) {
		i2c_of_probe_free_res(data);
		return dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
	}

	return 0;
}

...

> +static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
> +{
> +	int ret = 0;

Redundant assignment.

> +	dev_dbg(dev, "Enabling regulator supplies\n");
> +
> +	ret = regulator_bulk_enable(data->regulators_num, data->regulators);
> +	if (ret)
> +		return ret;
> +
> +	/* largest post-power-on pre-reset-deassert delay seen among drivers */
> +	msleep(500);

How would we monitor if any [new] driver wants to use bigger timeout?

> +	return 0;
> +}

...

>  	struct i2c_adapter *i2c;
> +	struct i2c_of_probe_data probe_data = {0};

Reversed xmas tree order?

'0' is not needed.

...

> +	/* Grab resources */
> +	for_each_child_of_node_scoped(i2c_node, node) {
> +		u32 addr;
> +
> +		if (!of_node_name_prefix(node, type))
> +			continue;

Is it third or fourth copy of this code? At some point you probably want

#define for_each_child_of_node_with_prefix_scoped()
	for_each_if(...)

(or equivalent)

> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +
> +		dev_dbg(dev, "Requesting resources for %pOF\n", node);
> +		ret = i2c_of_probe_get_res(dev, node, &probe_data);
> +		if (ret)
> +			return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko



