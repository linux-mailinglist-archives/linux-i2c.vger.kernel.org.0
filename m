Return-Path: <linux-i2c+bounces-11692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EDAED944
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 12:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7827318994AD
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 10:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEA025291D;
	Mon, 30 Jun 2025 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6bmcTLT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2167253331;
	Mon, 30 Jun 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277786; cv=none; b=McvSB/YoVzVDWRD04GLZzYRrt1/xxrsdEbBgxvlpm61uIhS62Nmyp8m05reDQsFGKBcQtPzsE0Uv7+9h6AWf4NfUvEV5yrkt7Go63WOc6oCzUnXCi6od4NsT6RLRkrrVmAyqZqccoj+3P/Kq4zuiVOAWPEPFgjYYaTzLehKx0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277786; c=relaxed/simple;
	bh=wNvXIKtXvn6NfqG8kHUW3OxzPA4DPds/TwxFtq3HPoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfMhDR+7luH+55TuQTneme4cUEq6nZWU1bgbxqOhR3fDPtF/BG4dK5erErwudhXg9uXSVYvdoKsfKkGhHL1BmvLX9Iw/lsNDiyw5WQYcUeoNxIgVmurQ5m3nYE42zP4Sxm2sOeibx1t3buMyAUHqQj1dqP31GjMyliZWJJ39NiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6bmcTLT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277785; x=1782813785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wNvXIKtXvn6NfqG8kHUW3OxzPA4DPds/TwxFtq3HPoo=;
  b=W6bmcTLTVYPMvsDTN4SBLEhPR2ItTXK0O0XsSH+Bb9AfwlljAhG9juoe
   60yHmhvLHtODpZDGrvyiEEctx+o9RobEEdpYF37j5dgBim2MAQJuaa/E7
   IPANcpZXIxmRSYnu+jTLpzzdo9KdiMbFiWVIik6meLdS0O8VdB/jOoRqc
   kZQxKMIMHtTgZC9vq6eLUTBq9A/T7UhYUwetwUzWZ3oX7mFReOcEH9eQ1
   M6AcvcY4WD9jYlXhDuU/Tj9wTDmX5atc5+ZVkBhpvIWjwH7TIpqmeCM0S
   oxFJVG8Ek9/S/4HjRCHlHgvOl3+C/DdJQV3nJJ+YWDUjtwHqfv95wshP2
   Q==;
X-CSE-ConnectionGUID: dwEMDsbSSUeAtKiW7tvqrA==
X-CSE-MsgGUID: XtvOGhUUQHWcgpttyAvW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53359673"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53359673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:03:04 -0700
X-CSE-ConnectionGUID: Mte4yZEWQ7ePO1tG76oQBw==
X-CSE-MsgGUID: 0KLmOUJvRNOWydQS4DSd1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159145392"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:03:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWBLl-0000000BGqE-0VOl;
	Mon, 30 Jun 2025 13:02:57 +0300
Date: Mon, 30 Jun 2025 13:02:56 +0300
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
Message-ID: <aGJg0FZK__xYGP7C@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
 <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGJGWFOpccaNzpni@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:

...

> > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > >  {
> > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > 
> > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > >  
> > > > >  	dev->dev = device;
> > > > >  	dev->irq = irq;
> > > > > +	dev->flags = flags;
> > > > 
> > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > 
> > > in between, it is introduced a new one:
> > > flags |= ACCESS_POLLING;
> > > 
> > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > it let the assignment to the last, along with the group.
> > 
> > I still don't get. The cited code is complete equivalent.
> 
> This was requested by Jarkko.

Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
required?

-- 
With Best Regards,
Andy Shevchenko



