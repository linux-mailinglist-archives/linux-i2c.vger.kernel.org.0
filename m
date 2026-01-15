Return-Path: <linux-i2c+bounces-15174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4760D22E5E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 08:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E1C230069BF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 07:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084DF328B52;
	Thu, 15 Jan 2026 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTbb7+/6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141CA288D0;
	Thu, 15 Jan 2026 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462892; cv=none; b=ktduQ+EWJ7JgAispPnpDJCHWmAxjyxkG7+q3DVC8wTL/rnqPLBs09Ym3IUG5E1/EpWrTEVSIEPLcsEBtIcSS0USniEprGwe5mARXPDE0il4IQFOVjDpTOe1w+pXk9QiZn3xrqyAKbX3LxJBbspHqiR4gS/ZGew76AD2yEDIHEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462892; c=relaxed/simple;
	bh=yISrOmQX89tJ9IRQWp5UtScjYIErlPwrN+kmF+ZIPbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgUSmpPCKydLSivISl9adBgRB+7WWSrOahC/IJv/qYYHVDYBSH8W0Fzrt+HH2mfT3nxetv6ITr9/DuT7uF5ltbcqiPA1D2+gO7mvyllt1Hl562zuYu55+GOsXzEVoXTIsSSUlIi50EImSrbx/P7b9omNlFXPh0UatBsZpOC+vt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTbb7+/6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768462891; x=1799998891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yISrOmQX89tJ9IRQWp5UtScjYIErlPwrN+kmF+ZIPbw=;
  b=cTbb7+/6OsH0XgTdYYf18lfTDA1vfIHl08iLlKH8QCaiaZ7AyJt5Pr0H
   jWkV6um2mx3wUxyLYKh3nuMTfbKIm493xk9GHy+h+cQOE0a+nhpCnVgVu
   IRPhqeksc/5xf5q1WfuBEz2beR0pV6Mt20obCctBMueGtHOluOYDDJRup
   7xV7ZJbGuqHWloAt6R3Q+dSy1lXJ+BT3E/mu3qB7FSc4dmNP65kQmCCm9
   +dgeVtT96yG67N0KPMJVjB57SzlQFXNz2IQ7ms/a6s8dB88v7oPkI9uAV
   utzj/vhdXGOQ1+Mn9y9gamaQdZkfAy9AA7Sq7ABqZrYNtVIuruoe3YcdN
   g==;
X-CSE-ConnectionGUID: qadtDf/CTceZzbkwN0Db7A==
X-CSE-MsgGUID: iKKA+BWgS4i82u/s74EG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73398101"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73398101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:41:31 -0800
X-CSE-ConnectionGUID: OOmdaKROQY+6HZTC8LTi7A==
X-CSE-MsgGUID: pJiDPrcOSC+sDzGriwZGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="236143195"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:41:28 -0800
Date: Thu, 15 Jan 2026 09:41:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Use device_is_compatible()
 instead of custom approach
Message-ID: <aWiaJugAIuVG1yK8@smile.fi.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>
 <20260114115304.GC2275908@black.igk.intel.com>
 <aWe_pcSm3tJZhNxw@smile.fi.intel.com>
 <20260115053959.GD2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115053959.GD2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 06:39:59AM +0100, Mika Westerberg wrote:
> On Wed, Jan 14, 2026 at 06:09:09PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 14, 2026 at 12:53:04PM +0100, Mika Westerberg wrote:
> > > On Wed, Jan 14, 2026 at 09:17:51AM +0100, Andy Shevchenko wrote:
> > > > We use MODEL_MSCC_OCELOT effectively is a flag for comparing against
> > > 
> > > as a flag?
> > 
> > Yes, sorry for the typo.
> > 
> > > > "compatible" property. Use device_is_compatible() directly to make it
> > > > clear.
> > > 
> > > Okay but if something else ever needs this same quirk then we would need to
> > > add new entry here and also to the IDs list.
> > 
> > Yes, that's how DT works and there are, of course, examples all over
> > the kernel, first that comes to my mind: drivers/mmc/host/sdhci-pltfm.c.
> > 
> > > With the flag you can have the IDs in a single place not all over the
> > > driver.
> > 
> > Makes the reality harder to read. If I know that the same quirk is used by
> > different platform (in terms of compatible string) I will see it immediately
> > from the code. Flag is meaningless.
> 
> Well with the flag you get the help from the compiler if you typo it but
> with the string comparison you are on your own.

It only affects the development cycle, isn't it obvious that any quirk should
be tested by the author, otherwise it won't work.

> Therefore I prefer the flag and as I said it also avoid duplicating the
> compatible string.

Duplicating compatible string is not a problem, linker nowadays combines
the same strings into one. In case you are worrying about the space, it's
not a problem.

-- 
With Best Regards,
Andy Shevchenko



