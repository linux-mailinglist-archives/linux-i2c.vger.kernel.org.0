Return-Path: <linux-i2c+bounces-933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFCE81BC5D
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 17:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6578B22963
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 16:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476B358219;
	Thu, 21 Dec 2023 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ7q2kIF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90825539FC;
	Thu, 21 Dec 2023 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703177552; x=1734713552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eZsDedLOgXWQlRcFgbfX4q8Y81MbK/Sk72Bvz168qRo=;
  b=eJ7q2kIFM3LVsyhSUJPMdOFUzjEAkgB0rWo+9N/IvPnCgd2lhS4Tw2iu
   dF0w5nBbHab5tpeY71wTl4WUDQQcnCYOHne+4YYcVvmitGayF/EMiLK2A
   6qYCoYd0w8SJwOzKdGz/8HOOE4LMp9t0xM2cK1SJVLv2d10PPbSPwiav7
   u0KwHPu9VsaVRMMlRec+yCBH3mjgH95Zdc76OY6Uph54S8HKeaeFRc0cE
   hCPpkkhyF66m7Jyjw8EFYk98YcJI+ZlIeCdZtkLuQ228QCDvRp2u4t3Yz
   VcTYIVEh+iwU4aHlPb7CIX0hg5aHwMYM82wt52DqpDjweceEvvN3Few/8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="393166692"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="393166692"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 08:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1108158455"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1108158455"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 08:52:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rGMHa-00000007tn0-1tUC;
	Thu, 21 Dec 2023 18:52:26 +0200
Date: Thu, 21 Dec 2023 18:52:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <ZYRtSuo1yLKyJASP@smile.fi.intel.com>
References: <20231221093936.1523908-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221093936.1523908-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 21, 2023 at 06:39:36PM +0900, Shin'ichiro Kawasaki wrote:
> p2sb_bar() unhides P2SB device to get resources from the device. It
> guards the operation by locking pci_rescan_remove_lock so that parallel
> rescans do not find the P2SB device. However, this lock causes deadlock
> when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> Hence the deadlock.
> 
> To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
> Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
> refer the cache and return to the caller.

Thank you for the update!
My comments below.

...

> +/*
> + * Cache BAR0 of P2SB device functions 0 to 7
> + * TODO: Move this definition to pci.h together with same other definitions

Missing periods at the end of sentences.

> + */
> +#define NR_P2SB_RES_CACHE 8

...

> +static bool p2sb_valid_resource(struct resource *res)
> +{
> +	return res->flags;
> +}

So, now if you look at this, there is no point in having the function.
But see below.

...

> +	if (!p2sb_valid_resource(pci_resource_n(pdev, 0)))
> +		return -ENOENT;

As per above (i.e. see below).

...

> +	ret = p2sb_scan_and_cache_devfn(bus, devfn);
> +	if (ret || PCI_FUNC(devfn) != 0)
> +		return ret;

This hides the fact that we don't scan functions if P2SB is not 0.

	if (ret)
		return ret;

	/* ...add a comment like above... */
	if (PCI_FUNC(devfn) != 0)
		return 0;


> +	/*
> +	 * When function number of the P2SB device is zero, scan other function

The first part will become the comment above. So, you may drop it from here.

> +	 * numbers. If devices are available, cache their BAR0.
> +	 */

...

> +		pci_bus_write_config_dword(p2sb_bus, devfn_p2sb, P2SBC,
> +					   P2SBC_HIDE);

Having it on one line is fine.

...

> +	if (!bus)
> +		bus = p2sb_bus;

Hmm... Maybe

static struct pci_bus *p2sb_get_bus(bus)
{
	static struct pci_bus *p2sb_bus;

	bus = bus ?: p2sb_bus;
	if (bus)
		return bus;

	p2sb_bus = ...;
	return p2sb_bus;
}

?

...

> +	if (!devfn) {

Maybe move this check to the callee?

> +		ret = p2sb_get_devfn(&devfn);
> +		if (ret)
> +			return ret;
> +	}

...

> +	cache = &p2sb_resources[PCI_FUNC(devfn)];
> +	if (!p2sb_valid_resource(&cache->res) ||
> +	    cache->bus_dev_id != bus->dev.id)
>  		return -ENODEV;

I don't remember if I mentioned in the last email(s), but I think what you want is

static int p2sb_valid_resource(struct resource *res)
{
	return res->flags ? 0 : -ENOENT;
}
	...
	cache = &p2sb_resources[PCI_FUNC(devfn)];
	if (cache->bus_dev_id != bus->dev.id)
		return -ENODEV;

	ret = p2sb_valid_resource(&cache->res);
	if (ret)
		return ret;

-- 
With Best Regards,
Andy Shevchenko



