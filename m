Return-Path: <linux-i2c+bounces-11658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E7AEB616
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 13:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9273A189E772
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 11:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1192264FBB;
	Fri, 27 Jun 2025 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwUpA+xb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FD1A841C;
	Fri, 27 Jun 2025 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023024; cv=none; b=e8v7FHfswXmuYHG4EXH5Lfwlah/5pKEsrP3jKQLXWBRtdaPk1rJq6HU74bY2zYhsVsraKd7Wf9HW1OjR3sXeWJGuQUS82aPVyipP/0XXuLn/UAI45ACr+nt24wS8Ubff56H2OdsYgqVQVHYEYllsDuMNVQfk/NcW2heyRDw/2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023024; c=relaxed/simple;
	bh=XE+SNt4kCGXPHHVnVBp5uHmdhW6OwyVs1LNsF1QzHQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHCgZEssZA962Pb4JpQEWRALoqSb61uL77wTMG8XLtWb/dCFt23IdIRf9+Gy3953ZpQ29mPSK6lXbntPGpj50tKkxyK1ldesODb1N4hWLUL0SUlLIFNYposqgQEeunsZPZoz6o27YlcPX3GjcQ3RnnWATLE7+7bIbeUlSeTFoaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwUpA+xb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751023023; x=1782559023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XE+SNt4kCGXPHHVnVBp5uHmdhW6OwyVs1LNsF1QzHQU=;
  b=HwUpA+xb0nv5HIyiuI/OaFoGiI8wbsp7H4wbm5OEnb9QW5daj0JTV72k
   fAULeZXNzjcRSGgEEGDxCYLfcvzAxjSR44x6+RmIMEOaCyUlxC7yapvQJ
   2Jvwy7kcZnflQjCCTGPboO9I5uLk5j8jTvLoSBrOSNpNpp/qomqoA8ZTB
   pYd50K9lIXqRBTNIhKdYmO8xDnfdpRrVmTdR+a528yagtCpK6Punw/oy2
   QX9whLgbnUm2TGkL1SA85lASJ7Z12ksWpAl49Oq8/E2ln5pEGaZB3A6LA
   7R3tumFbumsM5NOzF7cQgiZnv4IpMZlrn8Nafr8fPHubvSn4VeqO4u2GT
   A==;
X-CSE-ConnectionGUID: 5a0fFqfHQ9miVNRS/raolw==
X-CSE-MsgGUID: ff9w2114QJai1ECmAiqnrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="75881763"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="75881763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:17:02 -0700
X-CSE-ConnectionGUID: dIAnwJDEQ7WGLe82EQUPNQ==
X-CSE-MsgGUID: Wx7byjf+QAyzYlBWvWrgKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183679231"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:16:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV74h-0000000ASge-0kdF;
	Fri, 27 Jun 2025 14:16:55 +0300
Date: Fri, 27 Jun 2025 14:16:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
Subject: Re: [PATCH v4 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aF59pnqrLEzSiKVL@smile.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-3-heikki.krogerus@linux.intel.com>
 <aF1XTr2y1EmkRT_8@smile.fi.intel.com>
 <aF5c02pfI_3FirXD@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF5c02pfI_3FirXD@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 11:56:51AM +0300, Heikki Krogerus wrote:
> On Thu, Jun 26, 2025 at 05:21:02PM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 26, 2025 at 04:56:07PM +0300, Heikki Krogerus wrote:

...

> > > +	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
> > 
> > Use of i2c->drm_dev makes harder to maintain and understand the code.
> > Managed resources should be carefully attached to the correct device,
> > otherwise it's inevitable object lifetime related issues.
> > 
> > With
> > 
> > 	struct device *dev = xe->drm.dev;
> > 
> > and using local dev, it becomes easier to get and avoid such subtle mistakes.
> 
> I have to disagree with you on this one. Local dev pointers create
> problems because of the assumption that there is only a single device
> in the function to deal with (especially if they are named "dev"),
> which is almost never the case - this function is no exception.

Hmm... In my experience more than 70% of the drivers are okay with this
approach as they do *not* use multiple device pointers. Usually, if we
take IIO for the example, they have a physical device, which is depicted
by the local variable named 'dev' and a Linux IIO device, which is container
that has struct device inside, but it's not used explicitly, IIO APIs use
the pointer to the container (and of course its name differs).

That said, it seems we have different experience (you are most likely talking
about USB cases, where that is indeed quite complicated already).

> But I'll add the local variable as you requested - I'll just name it
> carefully.

Sure.

...

> This kinda related but off topic. IMO in cases like this the regmap
> should be assigned to the child device that is being created instead
> of the parent device. That is currently prevented by the current
> regmap API - the device has to be fully registered before the regmap
> can be assigned (and I'm not referring to the resource managed devm_*
> API), but I'm not convinced that it has to be like that. The problem
> is that the parent device may have multiple child devices that each
> need a dedicated regmag. So just as a note to self: check if we can
> improve the regmap API.

I'm not sure I follow. The (some of) MFD drivers, for instance, work
with many children and one regmapi that is split over the devices.
I don't see any issue with that. The problem is when one tries to mix
regmap and non-regmap approaches in the same (big) driver. That's
a road to mine field.

-- 
With Best Regards,
Andy Shevchenko



