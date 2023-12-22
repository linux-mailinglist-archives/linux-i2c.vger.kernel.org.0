Return-Path: <linux-i2c+bounces-963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7C81CB53
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 15:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB2E1C218A1
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 14:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E45F1CFB7;
	Fri, 22 Dec 2023 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW/nSFb/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411951CF94;
	Fri, 22 Dec 2023 14:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703255393; x=1734791393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GOKIXT4a3uK0FQyf+eOrkj8hRwcz+XIwMIH/R7VMSwE=;
  b=BW/nSFb/NMkBcVUbwN8wB+iFZOfQri1BNxQCyiJv/RYHSYiAg/kzaLSn
   F2Ua78c4avXCrwpyF6tkGPvMzEZh2t8oKHi+WKvRI6xJZ/iORdeJcF0q9
   0hooQgQOfVd2EMX8Pdj4XTxIC3qkVo1vVzlFuHHSr8MoKnvpUGH/KACzQ
   nxsACJIjADeMPLoIoZrhA4+6JClpri2riO3BKleBrC8fs9tatO4Rv10bY
   AB4Xv3UTHq7hPb4CGuQK/baR3Ty0H2KHpauGAzWyYstvMP23NySfUvO4m
   nbyJUWXsupx6eV2Mba/1ocMUyHxtqwi752XBqRr/O2HXf14jr2J6St4I9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="482299180"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="482299180"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 06:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="805952518"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="805952518"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 06:29:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rGgSc-00000008AjD-46r9;
	Fri, 22 Dec 2023 16:25:10 +0200
Date: Fri, 22 Dec 2023 16:25:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <ZYWcRupBcrGCSgcb@smile.fi.intel.com>
References: <20231222072054.1640144-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222072054.1640144-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 22, 2023 at 04:20:54PM +0900, Shin'ichiro Kawasaki wrote:
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

Thanks for this version!

My (mostly cosmetic) comments below. I believe next version will be good
enough to go with.

...

> +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
> +{
> +	unsigned int slot, fn;
> +	int ret;
> +
> +	/* Scan the P2SB device and cache its BAR0 */
> +	ret = p2sb_scan_and_cache_devfn(bus, devfn);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * When function number of the P2SB device is zero, scan other function
> +	 * numbers.
> +	 */
> +	if (PCI_FUNC(devfn) != 0)
> +		return 0;
> +
> +	/* If devices are available, cache their BAR0 */
> +	slot = PCI_SLOT(devfn);
> +	for (fn = 1; fn < NR_P2SB_RES_CACHE; fn++)
> +		p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> +
> +	return 0;
> +}

So, we can actually do the for-loop from index 0.

	if (PCI_FUNC(devfn) == 0) {
		/*
		 * When function number of the P2SB device is zero, scan it
		 * and other function numbers, and if devices are available,
		 * cache their BAR0s.
		 */
		slot = PCI_SLOT(devfn);

// This will allow us to have something like pci_dev_for_each_func() in the future.

		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
	} else {
		/* Scan the P2SB device and cache its BAR0 */
		ret = p2sb_scan_and_cache_devfn(bus, devfn);
		if (ret)
			return ret;
	}

...

> +	static struct pci_bus *bus;

The "static" word is not needed.

> +	bus = p2sb_get_bus(NULL);
> +	if (!bus)
> +		return -ENODEV;

...

>  	/* Hide the P2SB device, if it was hidden */
>  	if (value & P2SBC_HIDE)
>  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
> -

Stray change.

>  	pci_unlock_rescan_remove();

-- 
With Best Regards,
Andy Shevchenko



