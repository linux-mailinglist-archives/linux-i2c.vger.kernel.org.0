Return-Path: <linux-i2c+bounces-566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732277FF35A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 16:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4B72819A3
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 15:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9983524A4;
	Thu, 30 Nov 2023 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXSmw3cG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5000610DF;
	Thu, 30 Nov 2023 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701357587; x=1732893587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zV5Zr36aJejNVLLuT5YdsNKr+qGMCmTR8SHAzhX71NU=;
  b=nXSmw3cG/FGGnPLG1Y2sNg5F0va2Q54bcDjrkPEnPQZteKuzDn9q+Y/K
   sH5Hhg7Jg4f9ilw8nHTnDpf7YLCxHCwW5SeJ4x9SzVaP+IX0bq2ZbDSsd
   TktIcUr1Q/MpDQiVnoLMGZaPJstPXcjw1EMvIsjW+3k5Ew9E0X70SeC/r
   YtrzQa/RIIUrJPMmW1jztPtYxjoBTPfjPHOArz2zGAgfmu22eXq93g7/a
   U3q7fMkibI8xFDV3ZvC40J8RdR/XdtJ3GYlWT5Z4T9f+zzGhSppyti8kw
   IcLJZZzcTbRee+7wADx5lRPFb/C1UVivxotFXlSipyAD2krmcoaD7jfEl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="397229011"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="397229011"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="839819206"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="839819206"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:19:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8ipI-00000000jOe-3V5s;
	Thu, 30 Nov 2023 17:19:40 +0200
Date: Thu, 30 Nov 2023 17:19:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Lukas Wunner <lukas@wunner.de>, Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <ZWioDBqfeFk4pPAP@smile.fi.intel.com>
References: <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
 <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
 <20231129111739.GA14152@wunner.de>
 <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
 <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
 <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 07:30:56AM +0000, Shinichiro Kawasaki wrote:
> On Nov 29, 2023 / 15:53, Andy Shevchenko wrote:
> > On Wed, Nov 29, 2023 at 03:50:21PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 29, 2023 at 12:17:39PM +0100, Lukas Wunner wrote:
> > > > On Tue, Nov 28, 2023 at 07:45:06AM +0000, Shinichiro Kawasaki wrote:
> > > > > On Nov 24, 2023 / 17:22, Andy Shevchenko wrote:

...

> > > > > > Another possible solution I was thinking about is to have a local cache,
> > > > > > so, make p2sb.c to be called just after PCI enumeration at boot time
> > > > > > to cache the P2SB device's bar, and then cache the bar based on the device
> > > > > > in question at the first call. Yet it may not remove all theoretical /
> > > > > > possible scenarios with dead lock (taking into account hotpluggable
> > > > > > devices), but won't fail the i801 driver in the above use case IIUC.
> > > > > 
> > > > > Thanks for the idea. I created an experimental patch below (it does not guard
> > > > > list nor free the list elements, so it is incomplete). I confirmed that this
> > > > > patch avoids the deadlock. So your idea looks working. I still observe the
> > > > > deadlock WARN, but it looks better than the hang by the deadlock.
> > > > 
> > > > Your patch uses a list to store a multitude of struct resource.
> > > > Is that actually necessary?  I thought there can only be a single
> > > > P2SB device in the system?
> 
> Yes, the list might be too much. I was not sure what is the expected number of
> P2SB resources to be cached. I found drivers/mfd/lpc_ich.c calls p2sb_bar() at
> two places for devfn=0 and devfn=(13,2), so at least two resources look
> required. Not sure about the future. If two static resources are sufficient, the
> code will be simpler.

PCI specification defines up to 8 functions. So, basically you need to cache 8.
But note, each function may have up to 6 or more resources, we only now rely on
bar 0 as it's hard coded IIRC.

Theoretically we might require any bar from any function, but practically we have
at most two right now. So, to follow KISS 8 should be enough.

> > > > > Having said that, Heiner says in another mail that "A solution has to support
> > > > > pci drivers using p2sb_bar() in probe()". This idea does not fulfill it. Hmm.
> > > > 
> > > > Basically what you need to do is create two initcalls:
> > > > 
> > > > Add one arch_initcall to unhide the P2SB device.
> > > > 
> > > > The P2SB subsequently gets enumerated by the PCI core in a subsys_initcall.
> > > > 
> > > > Then add an fs_initcall which extracts and stashes the struct resource,
> > > > hides the P2SB device and destroys the corresponding pci_dev.
> > > > 
> > > > Then you don't need to acquire any locks at runtime, just retrieve the
> > > > stashed struct resource.
> > > > 
> > > > This approach will result in the P2SB device briefly being enumerated
> > > > and a driver could in theory bind to it.  Andy, is this a problem?
> > > > I'm not seeing any drivers in the tree which bind to 8086/c5c5.
> > > 
> > > At least one problem just out of my head. The P2SB on many system is PCI
> > > function 0. Unhiding the P2SB unhides all functions on that device, and
> > > we have use cases for those (that's why we have two first parameters to
> > > p2sb_bar() in case we want non-default device to be looked at).
> > 
> > For the clarity this is true for ATOM_GOLDMONT (see p2sb_cpu_ids array).
> 
> Lukas, thank you for the idea. If I understand the comment by Andy correctly,
> P2SB should not be unhidden between arch_initcall and fs_initcall. Hmm.
> 
> This made me think: how about to unhide and hide P2SB just during fs_initcall
> to cache the P2SB resources? To try it, I added a function below on top of the
> previous trial patch. The added function calls p2sb_bar() for devfn=0 at
> fs_initcall so that the resource is cached before probe of i2c-i801. This worked
> good on my system. It avoided the deadlock as well as the lockdep WARN :)
> 
> static int __init p2sb_fs_init(void)
> {
> 	struct pci_bus *bus;
> 	struct resource mem;
> 	int ret = 0;

> 	bus = pci_find_bus(0, 0);
> 	if (bus) {

This is inside p2sb_bar(), no need to repeat it.

> 		ret = p2sb_bar(bus, 0, &mem);
> 		if (ret)
> 			pr_err("p2sb_bar failed: %d", ret);
> 	}
> 	return 0;
> }
> fs_initcall(p2sb_fs_init);
> 
> The result of the trial is encouraging, but I'm not yet sure if this idea is
> really feasible. I have three questions in my mind:
> 
> - The trial function above assumed the P2SB device is at the PCI bus number=0
>   and domain=0. It is ok on my system, but is it valid always? I see this is
>   valid at least for drivers/edac/pdn2_edac.c and
>   drivers/watchdog/simatic-ipc-wdt.c, but not sure for drivers/mfd/lpc_ich.c
>   and drivers/i2c/busses/i2c-i801.
> 
> - The trial function above only caches the resource for devfn=0. This is not
>   enough for drivers/mfd/lpc_ich.c. Another resource for devfn=(13,2) should be
>   cached. It does not look good to hardcode these devfns and cache them always.
>   It looks required to communicate devfn to cache from p2sb_bar() caller drivers
>   to p2sb. How can we do it?
> 
> - Does this work when suspend-resume happens?
> 
> Comments on the questions will be appreciated.

I would give a try with a cache for full hierarchy, basically it's either 1 or
8 resources. It would be quite weird to have devfn to be different 'in device"
to P2SB itself.

So, something like this.

- unhide p2sb device
- cache its bar 0 (with BDF, etc)
- if F == 0, iterate over F == 1..7 and if there is a device, cache its
  bar 0 as well (as in previous entry)
- make p2sb_bar() to be just a cache lookup call (mutex protected?)

Note, P2SB is inside PCI South Bridge, it's unlikely we will see it
in external / Thunderbolt / etc devices.

-- 
With Best Regards,
Andy Shevchenko



