Return-Path: <linux-i2c+bounces-964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9A81CB6A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 15:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6AFC285A6C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 14:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9728B1D689;
	Fri, 22 Dec 2023 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aT5f3MVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645414AB1;
	Fri, 22 Dec 2023 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703255810; x=1734791810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ysfz0sJr04j5WQYOvg5mY1/gop8AYTMGClcMfw6PbyE=;
  b=aT5f3MVqRHsi+P3XK9f74dxvy1MMt4kJsazvscPjVmt2L93Dc9EIlGj9
   aA9givslUL6sGikbsGDgwqfwleK6SSyQIUJ8EmadaZaNWgbrfefsIsO3a
   H72iN8/hCTJ+ZUTXOruo+cm4/zsttidD85brGCHcAGy+slJUa6gYz1VTC
   5c7ZDAeP7rS2eOaIeIXBD47Yd9nlLUTHLty0buxIal4xsn/zDI+FUGrvg
   MUr0FfLjl6V8ysfpTMg3EbVOeztIPpq+fbnr60MvSgeE+NIWzgzfvIyar
   a1o7hy9qIji5Ryzo5BaFiMUm8xguPhPTK01faxslj0ALP3iQ4qxa1rp2L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="375610123"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="375610123"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 06:36:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="1108486293"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="1108486293"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 06:36:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rGgdo-00000008Arr-2r5Z;
	Fri, 22 Dec 2023 16:36:44 +0200
Date: Fri, 22 Dec 2023 16:36:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <ZYWe_P7-TkbaOl0k@smile.fi.intel.com>
References: <20231222072054.1640144-1-shinichiro.kawasaki@wdc.com>
 <ZYWcRupBcrGCSgcb@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYWcRupBcrGCSgcb@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 22, 2023 at 04:25:10PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 22, 2023 at 04:20:54PM +0900, Shin'ichiro Kawasaki wrote:

...

> > +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
> > +{
> > +	unsigned int slot, fn;
> > +	int ret;
> > +
> > +	/* Scan the P2SB device and cache its BAR0 */
> > +	ret = p2sb_scan_and_cache_devfn(bus, devfn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * When function number of the P2SB device is zero, scan other function
> > +	 * numbers.
> > +	 */
> > +	if (PCI_FUNC(devfn) != 0)
> > +		return 0;
> > +
> > +	/* If devices are available, cache their BAR0 */
> > +	slot = PCI_SLOT(devfn);
> > +	for (fn = 1; fn < NR_P2SB_RES_CACHE; fn++)
> > +		p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> > +
> > +	return 0;
> > +}
> 
> So, we can actually do the for-loop from index 0.
> 
> 	if (PCI_FUNC(devfn) == 0) {
> 		/*
> 		 * When function number of the P2SB device is zero, scan it
> 		 * and other function numbers, and if devices are available,
> 		 * cache their BAR0s.
> 		 */
> 		slot = PCI_SLOT(devfn);
> 
> // This will allow us to have something like pci_dev_for_each_func() in the future.
> 
> 		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
> 			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> 	} else {
> 		/* Scan the P2SB device and cache its BAR0 */
> 		ret = p2sb_scan_and_cache_devfn(bus, devfn);
> 		if (ret)
> 			return ret;
> 	}

Even going further

	if (PCI_FUNC(devfn) == 0) {
		/*
		 * When function number of the P2SB device is zero, scan it
		 * and other function numbers, and if devices are available,
		 * cache their BAR0s.
		 */
		slot = PCI_SLOT(devfn);
		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
	} else {
		/* Scan the P2SB device and cache its BAR0 */
		p2sb_scan_and_cache_devfn(bus, devfn);
	}

	return p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)]);

// With this it's maybe p2sb_scan_and_cache_devfn() can be void.

-- 
With Best Regards,
Andy Shevchenko



