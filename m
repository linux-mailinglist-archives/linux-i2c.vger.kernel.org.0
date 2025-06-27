Return-Path: <linux-i2c+bounces-11661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD0AAEB89C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 15:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B797E3A9E02
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 13:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1351E2BF3DB;
	Fri, 27 Jun 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvfQMwv/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ABB2F1FDF;
	Fri, 27 Jun 2025 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030112; cv=none; b=k3iy/QEbmy4Te7y8yH2XTCuTmAYkneT4ThhZGFWTMOruVe3h5x88z0+oujnY8L5CHcWsOvspCdmh2eL6nVg0nRdJ2iuuFAX5MsGCOY1na0a5v/Zv6c3KSp3LZ8H4P6VsK6PvS1hGjukgFXySFuZXiOH/TozF9EkZ3XjQy2TbEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030112; c=relaxed/simple;
	bh=VjdU2NlKVHF9vM2n5EUuxsVjkk9LSUZ5KXU+QdtsE0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO0nFS97odPhyTK4S6/yNCdkE2ZxNfLJoK9yJQ6STYGBFkXjvsOCZ1M9QWr63qJJP8gJhYL3UCcDQ5f0w/geGfu/C9xMiDbdyA7mi28fSbzpnbVLlOi5bEDXRRTmfRO56lAo3wRJxVGezn3kbc5gukWkpkJNOfJHCfdd4xqzrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvfQMwv/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751030111; x=1782566111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjdU2NlKVHF9vM2n5EUuxsVjkk9LSUZ5KXU+QdtsE0k=;
  b=JvfQMwv/Iont2s7uS2R2gZQs5BW+a9KQOVpC6vTmtkwqikLaJ1ZIwq+C
   eTVtiOWkWQwV2F6hyPMb7XMZxXs6WhgELUZH37LX31/VwvIaCYF0fkbTt
   ZX10FZsqNQofWuwiWDl7CFA5wAJU2Itkw8H+8pVt81xUgvG2XKOuZrqjx
   9IWIK8kp0Z7nuizpJpW47oyM5sMjQRWG+ZBchaEC1UwjB2Vwdjg1IPVOK
   0riu1B8l7AtYIazsZqCucRapW2jWbi6HIL4Ssv49yHSaEHpgo6cr23kaZ
   5IIsxuuhVPP9+Ldre0ULjwTXpcXsjOGHiY8oJtPvz2+H/gQ79roT386WD
   w==;
X-CSE-ConnectionGUID: OoV+8GF4Q2iUjyOjLNcHwA==
X-CSE-MsgGUID: aS9FiWYLRCyBb6kCCkBpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57020691"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57020691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:15:11 -0700
X-CSE-ConnectionGUID: XmokPrzcR6KueluvSsfnog==
X-CSE-MsgGUID: FUzCa7dhSdOjxa0t8jxRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153334438"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:15:06 -0700
Date: Fri, 27 Jun 2025 16:15:03 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe/pm: Wire up suspend/resume for I2C
 controller
Message-ID: <aF6ZVwtCddEb873G@black.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
 <aF6SaLLw7HlSxagh@black.fi.intel.com>
 <aF6VWADKrLbw1Pbl@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6VWADKrLbw1Pbl@kuha.fi.intel.com>

On Fri, Jun 27, 2025 at 03:58:00PM +0300, Heikki Krogerus wrote:
> On Fri, Jun 27, 2025 at 03:45:28PM +0300, Raag Jadav wrote:
> > Hi Heikki,
> > 
> > Thanks for picking this up.
> > 
> > On Thu, Jun 26, 2025 at 04:56:08PM +0300, Heikki Krogerus wrote:
> > > From: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Wire up suspend/resume handles for I2C controller to match its power
> > > state with SGUnit.
> > 
> > ...
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > index bfbfe1de7f77..0227fcba2168 100644
> > > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > @@ -227,6 +227,31 @@ static const struct regmap_config i2c_regmap_config = {
> > >  	.fast_io = true,
> > >  };
> > >  
> > > +void xe_i2c_pm_suspend(struct xe_device *xe)
> > > +{
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +
> > > +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > > +		return;
> > > +
> > > +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> > 
> > I just realized the power modes will need (__force u32) casting to make
> > sparse happy. If you're planning another version, can you please include
> > it? If not, we can have a quick fix later on.
> 
> I can include the casting, np. Is it enough to cast PCI_D3hot?

Looking at some of the existing code, it seems should be good enough.

Raag

> > > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> > > +}
> > > +
> > > +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> > > +{
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > +
> > > +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > > +		return;
> > > +
> > > +	if (d3cold)
> > > +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> > > +
> > > +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> > 
> > Ditto.
> > 
> > > +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));

