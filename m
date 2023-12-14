Return-Path: <linux-i2c+bounces-811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713181366D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 17:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5373B20DC6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D8260B99;
	Thu, 14 Dec 2023 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ca3vVkHM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A27114;
	Thu, 14 Dec 2023 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702571927; x=1734107927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wF4Gv0hmbYGA1HIkNGDcAqag49rX/LBeiAiw0wusqRY=;
  b=ca3vVkHMjw6fouJft446uiH4hDB+nQzaVHDzXTc9RZW7PyQaR3jr6IcT
   CnVV5jyN5qK4yByXp9dW76FBhzX54YAP0ur+VcyJdBe/frmADJoa9A4my
   4/Y2Xn/ow6sDzKuXLIowUBx2Cc42lJaSjsiCGmiyr/4tvoothIJY81Ezh
   Yym+kV+V1D3AzT4ZsuY5aMQQuSK+8S/WTZ/lkyYk+n2SsxRmF0NJ6fQVZ
   ztj/c/kDHR9IxTnpDcTQmAK0sDoMxgYyGeEBvhVU22g0xB72MPMGqrVMs
   2oXP0buQmCMU1hdgHdB4kNn8JYOqev68ZTShWX0/5Dggc9pytYB8IrJUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394013872"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="394013872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803343070"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="803343070"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:38:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDojR-00000005tey-2qie;
	Thu, 14 Dec 2023 18:38:41 +0200
Date: Thu, 14 Dec 2023 18:38:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
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

...

> +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> +#define NR_P2SB_RES_CACHE 8

This is fifth or so definition for the same, isn't it a good time to create
a treewide definition in pci.h?

See also below.

(In previous mail I even found all cases and listed, a bit lazy to repeat.)

...

> +static bool p2sb_invalid_resource(struct resource *res)

The naming is better to be p2sb_is_resource_valid().

...

>  	struct resource *bar0 = &pdev->resource[0];

This and in new code can use pci_resource_n() macro.

...

>  	pdev = pci_scan_single_device(bus, devfn);
> -	if (!pdev)
> +	if (!pdev || p2sb_invalid_resource(&pdev->resource[0]))
>  		return -ENODEV;

I prefer to split and have different error code for the second one:
-ENOENT / -EINVAL / etc.

...

> +	struct pci_bus *bus;
> +	unsigned int devfn_p2sb, slot_p2sb, fn;

Please, preserve reversed xmas tree ordering.

>  	u32 value = P2SBC_HIDE;
>  	int ret;

...

> -	/* if @bus is NULL, use bus 0 in domain 0 */
> -	bus = bus ?: pci_find_bus(0, 0);
> +	/* Assume P2SB is on the bus 0 in domain 0 */
> +	bus = pci_find_bus(0, 0);

The pci_find_bus() is called in two places now. Can we avoid doing
this duplication?

...

> +	/*
> +	 * When function number of the P2SB device is zero, scan other function
> +	 * numbers. If devices are available, cache their BAR0.
> +	 */
> +	if (!PCI_FUNC(devfn_p2sb)) {

I prefer to see '== 0' to make it clear that 0 has the same semantics as other
numbers here. It's not special like NULL.

> +		slot_p2sb = PCI_SLOT(devfn_p2sb);
> +		for (fn = 1; fn < 8; fn++)

As per above, use a definition for 8

> +			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
> +	}
> +
> +out:

Can it be split the above to the previous call or a separate helper?

...

> +static int __init p2sb_fs_init(void)
> +{
> +	p2sb_cache_resources();
> +	return 0;
> +}

Please, add a comment justifying fs_initcall().

> +fs_initcall(p2sb_fs_init);

-- 
With Best Regards,
Andy Shevchenko



