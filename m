Return-Path: <linux-i2c+bounces-1055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C481F9C6
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 16:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE22E1C2263D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 15:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56331F4FA;
	Thu, 28 Dec 2023 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAkZCdFT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBBF4E7;
	Thu, 28 Dec 2023 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703778428; x=1735314428;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=pkkrB8UGPK4IeJL3oipr8PniokbpY1jH5UghdNoYQu4=;
  b=hAkZCdFTvw/ICvAtimHw6PBbWTmAo2hlZrm7NUiM0pXb/UnBDSYlJVNZ
   Nqx5DftTLKHgrGw1cYquDVKfddocpidqYT79X70Obm1xIz0RQJEO5iMg8
   xHPSk0sm3Y3bKUeabArItrGjrdgdF13BkZCduAMNrDfgNkhQR/R890Uoo
   rdZmqA9cgnpQ3RHEEUoVcwhsMtAei+52HpeYdbsxg6smm91bozS/8Q0MN
   ERhTq8LP+x8Vs/vfNsSc16p1D1JIyFuKXzi87WUgQTmBSye6G6EIxp2Mq
   MJyrQSbZTDq077ZbH3M4T7wOQjMSs+UqYlkGJnn9jzQwfRy9hIMXY9gHj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="427729562"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="427729562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 07:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="20282751"
Received: from rbiessy-mobl.ger.corp.intel.com ([10.252.50.223])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 07:47:06 -0800
Date: Thu, 28 Dec 2023 17:47:02 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, 
    linux-i2c@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
In-Reply-To: <5e9040b-caba-463d-c260-a8425736438@linux.intel.com>
Message-ID: <80daf8c4-d73a-3e6b-36bc-7e514bc38d1b@linux.intel.com>
References: <20231227072049.2281764-1-shinichiro.kawasaki@wdc.com> <5e9040b-caba-463d-c260-a8425736438@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-427332289-1703778299=:2140"
Content-ID: <4fee5ccf-c854-939f-8fd2-ac58e8817d9@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-427332289-1703778299=:2140
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <4ba4f4ca-d727-9f98-a728-9a6079a86dc8@linux.intel.com>

On Wed, 27 Dec 2023, Ilpo J�rvinen wrote:

> On Wed, 27 Dec 2023, Shin'ichiro Kawasaki wrote:
> 
> > p2sb_bar() unhides P2SB device to get resources from the device. It
> > guards the operation by locking pci_rescan_remove_lock so that parallel
> > rescans do not find the P2SB device. However, this lock causes deadlock
> > when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> > locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> > call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> > Hence the deadlock.
> > 
> > To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
> > Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> > for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
> > refer the cache and return to the caller.
> > 
> > Link: https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> > This patch reflects discussions held at the Link tag. I confirmed this patch
> > fixes the problem using a system with i2c_i801 device, building i2c_i801
> > module as both built-in and loadable. Reviews will be appreicated.
> 
> Why no Fixes tag?
> 
> > Changes from v3:
> > * Modified p2sb_valid_resource() to return boolean
> > 
> > Changes from v2:
> > * Improved p2sb_scan_and_cache() and p2sb_scan_and_cache_devfn()
> > * Reflected other review comments by Andy
> > 
> > Changes from v1:
> > * Reflected review comments by Andy
> > * Removed RFC prefix
> > 
> > Changes from RFC v2:
> > * Reflected review comments on the list
> > 
> > Changes from RFC v1:
> > * Fixed a build warning poitned out in llvm list by kernel test robot
> > 
> >  drivers/platform/x86/p2sb.c | 171 +++++++++++++++++++++++++++---------
> >  1 file changed, 129 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> > index 1cf2471d54dd..ccebfd885718 100644
> > --- a/drivers/platform/x86/p2sb.c
> > +++ b/drivers/platform/x86/p2sb.c
> > @@ -26,6 +26,19 @@ static const struct x86_cpu_id p2sb_cpu_ids[] = {
> >  	{}
> >  };
> >  
> > +/*
> > + * Cache BAR0 of P2SB device functions 0 to 7.
> > + * TODO: Move this definition to pci.h together with same other definitions.
> 
> "with same other definitions" sounds very odd and I don't understand what 
> you're trying to say here.
> 
> > + */
> > +#define NR_P2SB_RES_CACHE 8
> > +
> > +struct p2sb_res_cache {
> > +	u32 bus_dev_id;
> > +	struct resource res;
> > +};
> > +
> > +static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
> > +
> >  static int p2sb_get_devfn(unsigned int *devfn)
> >  {
> >  	unsigned int fn = P2SB_DEVFN_DEFAULT;
> > @@ -39,10 +52,18 @@ static int p2sb_get_devfn(unsigned int *devfn)
> >  	return 0;
> >  }
> >  
> > +static bool p2sb_valid_resource(struct resource *res)
> > +{
> > +	if (res->flags)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  /* Copy resource from the first BAR of the device in question */
> > -static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
> > +static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
> >  {
> > -	struct resource *bar0 = &pdev->resource[0];
> > +	struct resource *bar0 = pci_resource_n(pdev, 0);
> 
> This change is just cleanup and belongs IMO to own patch. (It's a good 
> change still, just doesn't belong to this fix.)
> 
> >  	/* Make sure we have no dangling pointers in the output */
> >  	memset(mem, 0, sizeof(*mem));
> > @@ -56,47 +77,64 @@ static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
> >  	mem->end = bar0->end;
> >  	mem->flags = bar0->flags;
> >  	mem->desc = bar0->desc;
> > -
> > -	return 0;
> >  }
> >  
> > -static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> > +static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
> >  {
> > +	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
> >  	struct pci_dev *pdev;
> > -	int ret;
> >  
> >  	pdev = pci_scan_single_device(bus, devfn);
> >  	if (!pdev)
> > -		return -ENODEV;
> > +		return;
> >  
> > -	ret = p2sb_read_bar0(pdev, mem);
> > +	p2sb_read_bar0(pdev, &cache->res);
> > +	cache->bus_dev_id = bus->dev.id;
> >  
> >  	pci_stop_and_remove_bus_device(pdev);
> > -	return ret;
> > +	return;
> >  }
> >  
> > -/**
> > - * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> > - * @bus: PCI bus to communicate with
> > - * @devfn: PCI slot and function to communicate with
> > - * @mem: memory resource to be filled in
> > - *
> > - * The BIOS prevents the P2SB device from being enumerated by the PCI
> > - * subsystem, so we need to unhide and hide it back to lookup the BAR.
> > - *
> > - * if @bus is NULL, the bus 0 in domain 0 will be used.
> > - * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> > - *
> > - * Caller must provide a valid pointer to @mem.
> > - *
> > - * Locking is handled by pci_rescan_remove_lock mutex.
> > - *
> > - * Return:
> > - * 0 on success or appropriate errno value on error.
> > - */
> > -int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> > +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
> > +{
> > +	unsigned int slot, fn;
> > +
> > +	if (PCI_FUNC(devfn) == 0) {
> > +		/*
> > +		 * When function number of the P2SB device is zero, scan it and
> > +		 * other function numbers, and if devices are available, cache
> > +		 * their BAR0s.
> > +		 */
> > +		slot = PCI_SLOT(devfn);
> > +		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
> > +			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> > +	} else {
> > +		/* Scan the P2SB device and cache its BAR0 */
> > +		p2sb_scan_and_cache_devfn(bus, devfn);
> > +	}
> > +
> > +	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
> > +		return -ENOENT;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
> > +{
> > +	static struct pci_bus *p2sb_bus;
> > +
> > +	bus = bus ?: p2sb_bus;
> > +	if (bus)
> > +		return bus;
> > +
> > +	/* Assume P2SB is on the bus 0 in domain 0 */
> > +	p2sb_bus = pci_find_bus(0, 0);
> > +	return p2sb_bus;
> > +}
> > +
> > +static int p2sb_cache_resources(void)
> >  {
> > -	struct pci_dev *pdev_p2sb;
> > +	struct pci_bus *bus;
> >  	unsigned int devfn_p2sb;
> >  	u32 value = P2SBC_HIDE;
> >  	int ret;
> > @@ -106,8 +144,9 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* if @bus is NULL, use bus 0 in domain 0 */
> > -	bus = bus ?: pci_find_bus(0, 0);
> > +	bus = p2sb_get_bus(NULL);
> > +	if (!bus)
> > +		return -ENODEV;
> >  
> >  	/*
> >  	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
> > @@ -115,17 +154,16 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> >  	 */
> >  	pci_lock_rescan_remove();
> >  
> > -	/* Unhide the P2SB device, if needed */
> > +	/*
> > +	 * The BIOS prevents the P2SB device from being enumerated by the PCI
> > +	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
> > +	 * Unhide the P2SB device here, if needed.
> > +	 */
> >  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> >  	if (value & P2SBC_HIDE)
> >  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
> >  
> > -	pdev_p2sb = pci_scan_single_device(bus, devfn_p2sb);
> > -	if (devfn)
> > -		ret = p2sb_scan_and_read(bus, devfn, mem);
> > -	else
> > -		ret = p2sb_read_bar0(pdev_p2sb, mem);
> > -	pci_stop_and_remove_bus_device(pdev_p2sb);
> > +	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
> >  
> >  	/* Hide the P2SB device, if it was hidden */
> >  	if (value & P2SBC_HIDE)
> > @@ -133,12 +171,61 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> >  
> >  	pci_unlock_rescan_remove();
> >  
> > -	if (ret)
> > -		return ret;
> > +	return ret;
> > +}
> > +
> > +/**
> > + * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> > + * @bus: PCI bus to communicate with
> > + * @devfn: PCI slot and function to communicate with
> > + * @mem: memory resource to be filled in
> > + *
> > + * If @bus is NULL, the bus 0 in domain 0 will be used.
> > + * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> > + *
> > + * Caller must provide a valid pointer to @mem.
> > + *
> > + * Return:
> > + * 0 on success or appropriate errno value on error.
> > + */
> > +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> > +{
> > +	struct p2sb_res_cache *cache;
> > +	int ret;
> >  
> > -	if (mem->flags == 0)
> > +	bus = p2sb_get_bus(bus);
> > +	if (!bus)
> >  		return -ENODEV;
> >  
> > +	if (!devfn) {
> > +		ret = p2sb_get_devfn(&devfn);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	cache = &p2sb_resources[PCI_FUNC(devfn)];
> > +	if (cache->bus_dev_id != bus->dev.id)
> > +		return -ENODEV;
> > +
> > +	if (!p2sb_valid_resource(&cache->res))
> > +		return -ENOENT;
> > +
> > +	memcpy(mem, &cache->res, sizeof(*mem));
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(p2sb_bar);
> > +
> > +static int __init p2sb_fs_init(void)
> > +{
> > +	p2sb_cache_resources();
> > +	return 0;
> > +}
> > +
> > +/*
> > + * pci_rescan_remove_lock avoids access to unhidden P2SB devices, but it causes
> > + * deadlock with sysfs pci bus rescan.
> 
> Does this actually tell how situation was before this change? If so, it 
> should be either removed or reworded to something that says "x cannot be 
> used to do y because of z".
> 
> > To avoid the deadlock, access to P2SB
> > + * devices at an early step in kernel initialization and cache required
> > + * resources. This should happen after subsys_initcall which initializes PCI
> > + * subsystem and before device_initcall which requires P2SB resources.
> > + */
> > +fs_initcall(p2sb_fs_init);
> > 
> 
> 

I've applied this into review-ilpo branch with a Fixes tag but without 
any changes to the code. Please do consider my feedback though to see if 
they comments would need to be improved.

-- 
 i.
--8323329-427332289-1703778299=:2140--

