Return-Path: <linux-i2c+bounces-11702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF1AEDECC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B274A18862F6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6090C28B4FA;
	Mon, 30 Jun 2025 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDutYxkP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37728B3ED;
	Mon, 30 Jun 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289427; cv=none; b=Dk3/TeEyd5Xl6Z4cUQLQcewu3BcNTKwM3AbvpN6tIiVZa7KbLaMM1ANmvj1r7lxCtCv5eEETAbyGYnzPGW+9tvQPipS1yBN/VD2B1dTgjGD5rmHz00PdWI33DcKlszupq6xNnRA5+8v45c6Q29C5E6OGJg2cFy84ONEbAOGiYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289427; c=relaxed/simple;
	bh=C4G61X+GZRiY0wySqD/8oZ9zCG/EbzIivgQZ9FfrQkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTOJrONrHSO74zHj6VkI9hwZ1NleeONbX/2K8qfNZF/bfFBWyLxNA6R/4YJV2oDfu1dPojeVK/8knLez8Mw/I8CmcL1fSDLV8oh2tJnUjZChmyqkid5+OKI0JobPNWsr+bg0c+ggGJuUpupAtSZOWxqxm2WMXJCqmT1VBJzz4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDutYxkP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751289426; x=1782825426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C4G61X+GZRiY0wySqD/8oZ9zCG/EbzIivgQZ9FfrQkI=;
  b=BDutYxkPgHnTuUMC+ObqeyGoERYwBIOQpglXo5o+nfV1nFUWGxFdcZv2
   dBDYu7pURoYIRuFutQ1C18lp3rNGsBgMTfyHdbaDQrd7BG0ZkZbkHMzon
   OfSX7enSr7awpdWvs5x9FFyzOLMFKtYgiRdRxru4rWNEg1VqiCQpIzEgc
   V28cHWt3wjtkYVr41EnaJl9DZ4Ug/nenykVCq45ZEkDDYyMdl7+khJour
   ZLrI7cnaQOkvHDZrc4uNaNLBnSdJ0MpYfW7R4T1UhtXCMb+0qnUV+1Sd6
   aS/jCsnqI3Uh2vra8i5N5s/DajJuYZzr6QizwQXpN8ht69YEEfen7v6E/
   w==;
X-CSE-ConnectionGUID: XfbVQf3HQ66peYXkca0fmA==
X-CSE-MsgGUID: Verl4tf4TaKwDSVethLzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57320129"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57320129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:17:04 -0700
X-CSE-ConnectionGUID: 11SXBEQeR8GzYBlWXx7EDw==
X-CSE-MsgGUID: ZP+cpgEURHOK7ryIU+BFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153088137"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:16:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWENU-0000000BJat-1ySr;
	Mon, 30 Jun 2025 16:16:56 +0300
Date: Mon, 30 Jun 2025 16:16:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
 <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
 <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 02:59:21PM +0300, Heikki Krogerus wrote:
> On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:

...

> > > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > > 
> > > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > >  
> > > > > > >  	dev->dev = device;
> > > > > > >  	dev->irq = irq;
> > > > > > > +	dev->flags = flags;
> > > > > > 
> > > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > > 
> > > > > in between, it is introduced a new one:
> > > > > flags |= ACCESS_POLLING;
> > > > > 
> > > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > > it let the assignment to the last, along with the group.
> > > > 
> > > > I still don't get. The cited code is complete equivalent.
> > > 
> > > This was requested by Jarkko.
> > 
> > Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> > required?
> 
> You need to ask why from Jarkko - I did not really question him on
> this one. Unfortunately his on vacation at the moment.

Yeah :-(

> I can drop this, but then I'll have to drop also Jarkko's ACK.

I can give mine if it helps. The code as far as I can see is 100% equivalent.

> I think we already agreed that this function, and probable the entire
> file, need to be refactored a bit, so would you mind much if we just
> went ahead with this as it is?
> 
> I'm asking that also because I don't have means or time to test this
> anymore before I start my vacation.

I see, then we may ask Andi and Wolfram on this. I slightly prefer to have
no additional churn added without a good reason.

-- 
With Best Regards,
Andy Shevchenko



