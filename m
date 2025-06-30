Return-Path: <linux-i2c+bounces-11694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BCAEDC27
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 13:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B78170EFB
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 11:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D27D287268;
	Mon, 30 Jun 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdVNem9b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C8287253;
	Mon, 30 Jun 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284770; cv=none; b=OvxnTWLk+wBj4m5udjFLUSWTv6258E5AE00O60MALX9NoJF9+fjv1jqDSH6PA+zOWVc6zJ94EgWxc4xKbENUqR2kpwzQ7TIDJW94JqtjLXxCvpxdRAoNhDgTA0UhvQ5NFXVUUz85gALNE17en8fbO9xs5C9/X5WINwynZS0bSbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284770; c=relaxed/simple;
	bh=PSmMpH9CH+p3L8SXyMXOWEil3/qqIcHitztY6zSNvkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKpWQXvPMg0oF8NMCqgdmxHwzaD7cbDrVIpNxXw2yT7TMR6nTiTLRgJ4nxbiC0pUiXhwj2ShXOfVGIt0+5h+WI0pJ2PZvuGJNVF7UX107K2U5l2PbAzuBGHGrrXrefqp/X5ays45Jkl2XElD+40MqjQwosYYvqF2a1I/R6yqWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdVNem9b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751284769; x=1782820769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PSmMpH9CH+p3L8SXyMXOWEil3/qqIcHitztY6zSNvkQ=;
  b=PdVNem9b1NV+Dazrvwa4D6HA+Wtl+qTCUaPKZnBF3N/O8Ol/tk/653X0
   1qNSEYQLy6kZVcE7NIr0b8ilLIexClAcyVuW0jjjXmsD++Okbb8xPDVwp
   0EeqUT26n3arY6Wc+UqAmEjicicW9hQCvLDsNdHASZguDWBEY5179Gf79
   PCtbju4mrfm7VClD6bvJueeWyabLc7YE9S0wRmQEpAmQMI4cPzkpg6Ypy
   biseUibV++nIzs7M5PMdicsIJ2i1fcKr6B/NFxrkczXzcCQ10k3bQnv4N
   HndUQiTmwtZB3plBhoUiSCPUJC6wLD28BwcjiphEDggp/eh3hFCvdK1Z8
   w==;
X-CSE-ConnectionGUID: 4ppcZc3iQkWmCvq9y5aOaQ==
X-CSE-MsgGUID: tUVycZq5S+mwPhn7euDodQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52737861"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52737861"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:59:27 -0700
X-CSE-ConnectionGUID: CcwZZ7rATIKhWRjrylVmew==
X-CSE-MsgGUID: 7abXUxSOQ1iqzD67eoF71w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157989007"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa004.jf.intel.com with SMTP; 30 Jun 2025 04:59:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 30 Jun 2025 14:59:21 +0300
Date: Mon, 30 Jun 2025 14:59:21 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
 <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGJg0FZK__xYGP7C@smile.fi.intel.com>

On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > 
> > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > >  
> > > > > >  	dev->dev = device;
> > > > > >  	dev->irq = irq;
> > > > > > +	dev->flags = flags;
> > > > > 
> > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > 
> > > > in between, it is introduced a new one:
> > > > flags |= ACCESS_POLLING;
> > > > 
> > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > it let the assignment to the last, along with the group.
> > > 
> > > I still don't get. The cited code is complete equivalent.
> > 
> > This was requested by Jarkko.
> 
> Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> required?

You need to ask why from Jarkko - I did not really question him on
this one. Unfortunately his on vacation at the moment. I can drop
this, but then I'll have to drop also Jarkko's ACK.

I think we already agreed that this function, and probable the entire
file, need to be refactored a bit, so would you mind much if we just
went ahead with this as it is?

I'm asking that also because I don't have means or time to test this
anymore before I start my vacation.

thanks,

-- 
heikki

