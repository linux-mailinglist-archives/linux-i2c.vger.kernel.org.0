Return-Path: <linux-i2c+bounces-544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D78127FD8B9
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 14:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F8C1C20D9F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 13:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98934225D5;
	Wed, 29 Nov 2023 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR7SWPcq"
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 05:55:04 PST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2098F;
	Wed, 29 Nov 2023 05:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701266105; x=1732802105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7125ARMLtQIJtXfuOMwEC7WJB+aSFeYK25LGSUB5H+U=;
  b=WR7SWPcqYQ5ISzJfOme7gtcLOi3s/smGl6WbcJPz7nRqdTyAkRtmhnvm
   t4WDrem8GcSI1hgghg7msby9WNqynpkt+Zg/XyLnYScjbLJd+mjMndoO0
   e3D/RTXuX05HJ+E6VIvaTgUCGTFPv+PhkqR+JhCoSZ5k/iheHanqLE49X
   zdQ0MZmKjevFWyaQOD/4HfQbthx0niLYLkH+AEaLnCCU4Me/jYjo93WBp
   QcsDFk+ISSKuBAAth6YTrT+Li3M/0wbojR3axjaUkdIJu2QQNryVQE4OG
   NYfHntuR0Av1zJm+1ynG7RUuo4J/Wt46Z59/SHe9X7ENTZl8E3qKMQ/2g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="63866"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="63866"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="886866508"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="886866508"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:54:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8L0n-00000000SC8-1Dt4;
	Wed, 29 Nov 2023 15:53:57 +0200
Date: Wed, 29 Nov 2023 15:53:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
References: <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
 <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
 <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
 <20231129111739.GA14152@wunner.de>
 <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 03:50:21PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 29, 2023 at 12:17:39PM +0100, Lukas Wunner wrote:
> > On Tue, Nov 28, 2023 at 07:45:06AM +0000, Shinichiro Kawasaki wrote:
> > > On Nov 24, 2023 / 17:22, Andy Shevchenko wrote:

...

> > > > Another possible solution I was thinking about is to have a local cache,
> > > > so, make p2sb.c to be called just after PCI enumeration at boot time
> > > > to cache the P2SB device's bar, and then cache the bar based on the device
> > > > in question at the first call. Yet it may not remove all theoretical /
> > > > possible scenarios with dead lock (taking into account hotpluggable
> > > > devices), but won't fail the i801 driver in the above use case IIUC.
> > > 
> > > Thanks for the idea. I created an experimental patch below (it does not guard
> > > list nor free the list elements, so it is incomplete). I confirmed that this
> > > patch avoids the deadlock. So your idea looks working. I still observe the
> > > deadlock WARN, but it looks better than the hang by the deadlock.
> > 
> > Your patch uses a list to store a multitude of struct resource.
> > Is that actually necessary?  I thought there can only be a single
> > P2SB device in the system?
> > 
> > > Having said that, Heiner says in another mail that "A solution has to support
> > > pci drivers using p2sb_bar() in probe()". This idea does not fulfill it. Hmm.
> > 
> > Basically what you need to do is create two initcalls:
> > 
> > Add one arch_initcall to unhide the P2SB device.
> > 
> > The P2SB subsequently gets enumerated by the PCI core in a subsys_initcall.
> > 
> > Then add an fs_initcall which extracts and stashes the struct resource,
> > hides the P2SB device and destroys the corresponding pci_dev.
> > 
> > Then you don't need to acquire any locks at runtime, just retrieve the
> > stashed struct resource.
> > 
> > This approach will result in the P2SB device briefly being enumerated
> > and a driver could in theory bind to it.  Andy, is this a problem?
> > I'm not seeing any drivers in the tree which bind to 8086/c5c5.
> 
> At least one problem just out of my head. The P2SB on many system is PCI
> function 0. Unhiding the P2SB unhides all functions on that device, and
> we have use cases for those (that's why we have two first parameters to
> p2sb_bar() in case we want non-default device to be looked at).

For the clarity this is true for ATOM_GOLDMONT (see p2sb_cpu_ids array).

-- 
With Best Regards,
Andy Shevchenko



