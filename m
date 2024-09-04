Return-Path: <linux-i2c+bounces-6190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D296BF1C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EAB81F22201
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846FD1DA311;
	Wed,  4 Sep 2024 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HptEWlm3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707B1DB53E;
	Wed,  4 Sep 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458020; cv=none; b=OgXl/iYcndAzOG6jdH/UJcywrhovt9b6cyEel4vskmW0NRDbEOh0C//TDuSqQs4YxerT3YzvXznIO86nR6xTScXOySvW/J7GCeFoEHQrkqLr0eMd6eqN1bAIvCOkPB/t99bXNg2I65b1Jq0ZKVitZMpD5OVQRg2ELn7bDr9PpXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458020; c=relaxed/simple;
	bh=IrZ7cqUQ/rV3TjzeCgtYwOAMGS511YXRIN78hNIahso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN0hZDZCc5tXt3J2CYdQqWKd7r3Pr4Dvxyqp9oXxrlwy/4WtSG7RUL6XLnUffKqFIn18wqc9ZWNk01azY0f2RWpji2DeKU9z+4T7rMuzqzhUhaqfy1Rnq1zHfiXGqMYFhlgohGRCpVBsmO+ZjQ86uKTqH4cwt/eVXahiqTMun8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HptEWlm3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725458019; x=1756994019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IrZ7cqUQ/rV3TjzeCgtYwOAMGS511YXRIN78hNIahso=;
  b=HptEWlm3zqmmEQs/7V1hm4OF3hWBlUxM5DGP1k7OpjqyMwrR4O3je4G/
   X3escZqcD+MvmtMtzgCnBIGG8ztaxTeE6SBmS/hNxNSW1KFzy4QTi+fsR
   c184D8Bo8Kax8XFHcm4bgWCvP+z7E0JGz+cX5uhb2Q13Csb/qsDEgd6S/
   OO02NiC3POFQhw1lmEVtrVdkfHkRHKlbtFyGIaAT1Gf8PLOJN0RRJomCa
   JypDiQn0QJurvzFW8WLx5RPimT6fq3AMXsoE17QBc1MjKm+BKgm7zJjHy
   lU0oITppCulam+YDjezeRHB6miK9oGJUga6oh8dB2GGOW+BtOPIYBT+96
   w==;
X-CSE-ConnectionGUID: rvSWWMr0TvKTRMN1X4QdmA==
X-CSE-MsgGUID: aJvU4W1aTMmdAWoJFq+0xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41619643"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="41619643"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:53:37 -0700
X-CSE-ConnectionGUID: j610Y+0US6q4B+XEa1zMhw==
X-CSE-MsgGUID: bvEv6kCCSCmYTMkuy16joQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="64946038"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:53:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqRu-0000000553f-1ICw;
	Wed, 04 Sep 2024 16:53:30 +0300
Date: Wed, 4 Sep 2024 16:53:30 +0300
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
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <ZthmWoJbjrEmzOzu@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-10-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:11PM +0800, Chen-Yu Tsai wrote:
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

> +static int i2c_of_probe_get_regulators(struct device *dev, struct device_node *node,
> +				       struct i2c_of_probe_data *data)
> +{
> +	struct regulator_bulk_data *tmp, *new_regulators;
> +	int ret;
> +
> +	ret = of_regulator_bulk_get_all(dev, node, &tmp);
> +	if (ret < 0) {
> +		return ret;
> +	} else if (ret == 0) {
> +		/*
> +		 * It's entirely possible for a device node to not have
> +		 * regulator supplies. While it doesn't make sense from
> +		 * a hardware perspective, the supplies could be always
> +		 * on or otherwise not modeled in the device tree, but
> +		 * the device would still work.
> +		 */
> +		return ret;
> +	}

	if (ret < 0)
		return ret;

	/*
	 * It's entirely possible for a device node to not have regulator
	 * supplies. While it doesn't make sense from a hardware perspective,
	 * the supplies could be always on or otherwise not modeled in
	 * the device tree, but the device would still work.
	 */
	if (ret == 0)
		return ret;

> +	if (!data->regulators) {
> +		data->regulators = tmp;
> +		data->regulators_num = ret;
> +		return ret;
> +	};
> +
> +	new_regulators = krealloc_array(data->regulators, (data->regulators_num + ret),

Redundant parentheses.

> +					sizeof(*tmp), GFP_KERNEL);
> +	if (!new_regulators) {
> +		regulator_bulk_free(ret, tmp);
> +		return -ENOMEM;
> +	}
> +
> +	data->regulators = new_regulators;
> +	memcpy(&data->regulators[data->regulators_num], tmp, sizeof(*tmp) * ret);

Shouldn't be the size calculated based on the size of the destination?

> +	data->regulators_num += ret;
> +
> +	return ret;
> +}

...

As I said earlier my main concern is that timeout heuristic which seems fragile.
But I have no ideas to propose, leave this to others to comment on / think about.

-- 
With Best Regards,
Andy Shevchenko



