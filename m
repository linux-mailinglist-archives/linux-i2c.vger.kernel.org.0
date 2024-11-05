Return-Path: <linux-i2c+bounces-7781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7549BCFD7
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2B8C1F222A9
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 14:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EC91D86CE;
	Tue,  5 Nov 2024 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSS/ZCBo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56FEAD2;
	Tue,  5 Nov 2024 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730818603; cv=none; b=sIQgA3jEb48aVT3pftuzBJ0Rrz0CasmznWreKYyVJ+r/yXa5/mYvw2eDOUvmHAK+SXjWN0QslXlHcB/H6i7tWHxBM5opsp0E8Ku88STjbg/9Zx9xmz+OjkhvdxSHleUOrlnTAbcx1AnWgXLL3hbDOjIlHAg1vrMfM6hkYt//A6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730818603; c=relaxed/simple;
	bh=bXQHXT6ZImyGG14uAG/J7P3v/eBu0r86aT4uSsUX9ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=of++CUdQ4Y5M554QdSZ25/95uGLAPdSuM/rIHA42RSVE+dxL0/0Zp56KSMcpD0f8mHosPRdf6XYrho3zy6w6haBFZt4TvqJEtBx2HygGctvi4w6Bus48EUa0Suemb9XQZnJx7cdNdNhqdbWSzMiBtzaku7eY3tOZd+Rei2L1/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSS/ZCBo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730818602; x=1762354602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bXQHXT6ZImyGG14uAG/J7P3v/eBu0r86aT4uSsUX9ng=;
  b=HSS/ZCBoSoqmmlDm06dHm06cwbZSRvs6m2TfwwRTqK457kGXMA4B4iD3
   rhDB3otiG0eub7HOskxCIWSNDphtFPgdLoNCnIcFAy9wTMNGSzD2DhqF+
   fL5C9rcrAuWQ1y6jVZT6wFIMSRoyTpQEZQ4UefQEKMKEInh3qc+zYQZJw
   0lVOaP4HUvXJmFzpmhmNvUMAYMavDGG072EKJ0HbDER0Y7w9Af1bPsFs6
   hefP8gmlZPnKNYmQgidgrkJIPkOrKebUkCfV8NWAZldeqACqkFSXam3gf
   ombY2hf21mvBN74+qxj2uIuVBMivj4ivelAXywdIXU3DAkMY4vrfBiSSa
   g==;
X-CSE-ConnectionGUID: gxa9ek92TtGstEVYnq/IRQ==
X-CSE-MsgGUID: +W8S6beFSWCEsMqVqkwRcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48032846"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48032846"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:56:41 -0800
X-CSE-ConnectionGUID: WMnr0vMNT1+2xKdMa2XSaA==
X-CSE-MsgGUID: 6oMmzSiRRwmw9AbY58KDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="88557321"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:56:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8Kyz-0000000BRHA-3UnC;
	Tue, 05 Nov 2024 16:56:37 +0200
Date: Tue, 5 Nov 2024 16:56:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <ZyoyJSiWXBNar47_@smile.fi.intel.com>
References: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>
 <l75w7qvvw34u3vwvd7ddnka2q3fcrvzpxbfwrh22niggndrp2s@fctmlyvdfiqm>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l75w7qvvw34u3vwvd7ddnka2q3fcrvzpxbfwrh22niggndrp2s@fctmlyvdfiqm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 05, 2024 at 03:44:34PM +0100, Andi Shyti wrote:
> On Mon, Nov 04, 2024 at 12:39:14PM +0200, Andy Shevchenko wrote:
> > *-objs suffix is reserved rather for (user-space) host programs while
> > usually *-y suffix is used for kernel drivers (although *-objs works
> > for that purpose for now).
> > 
> > Let's correct the old usages of *-objs in Makefiles.

...

> >  config I2C_AT91_SLAVE_EXPERIMENTAL
> > -	tristate "Microchip AT91 I2C experimental slave mode"
> > +	bool "Microchip AT91 I2C experimental slave mode"
> >  	depends on I2C_AT91
> >  	select I2C_SLAVE
> >  	help
> > @@ -440,7 +440,7 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
> >  	  been tested in a heavy way, help wanted.
> >  	  There are known bugs:
> >  	    - It can hang, on a SAMA5D4, after several transfers.
> > -	    - There are some mismtaches with a SAMA5D4 as slave and a SAMA5D2 as
> > +	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as
> 
> Although these changes are related and I'm OK also with the typo
> fix, could you please propose here a couple of lines that I can
> add to the commit message?

Would this work?
"While at it, fix an obvious typo in help section of the Kconfig."

Of course, feel free to drop that hunk or request for a new version without it
(or split into a separate change), I am fine with all options.

Note, bool is essential to for the patch, but can be split as a prerequisite,
but without this patch it doesn't really fix match as we never try to build
the code when it was =m.

-- 
With Best Regards,
Andy Shevchenko



