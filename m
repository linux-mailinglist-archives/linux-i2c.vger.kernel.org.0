Return-Path: <linux-i2c+bounces-7784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE69BD0D7
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF795287D4B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95AB126C0F;
	Tue,  5 Nov 2024 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQ9lKqsv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F0770FE;
	Tue,  5 Nov 2024 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730821353; cv=none; b=Cvpx/sDgrGLlPaB6fLfora5Hk9I7rQApQTcE42QylpmadBGb3UHCLNfBzizLLxvtOtRs0lpyBTC+ZH/rqMaP0epSvBF3JDtj0bimaU2VsoMZR4GIvG1XUhu8Xnn6FxXKh3pEUzeKo/nGBKS8MMo+Vvd4Mbv08ynilCuBIZ4Zlik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730821353; c=relaxed/simple;
	bh=DNYglHMr7L6vuXQNnGdBn2o0APyXECiyiPQA7XQRW/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfivefaLKu7SjoTUZGUExJ6nV2fSeH9DB9ubhqM2dahU9mAe6NLyvqMnNeRUb7yoVXQ/4y9xLHo1E/zWAawh310FgD0M0n2Fpp1X3b0qb4b/M97FCmqRrLlxhHPB4Q7SLI4fbu9Ak0oYsR4n57/jbWfI9/UhtSAfGYgs9CrbGQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQ9lKqsv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730821352; x=1762357352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DNYglHMr7L6vuXQNnGdBn2o0APyXECiyiPQA7XQRW/g=;
  b=LQ9lKqsv5vuAYOGEsZdleYV2cj3Pv+ecfJI8XqRmtaQMIIkT8WP3jhU+
   XGNTnsCYaHhlWDfIr1A+gTV+Hh4gCPenCWezkRFtWnUw3BDgrQdAWP5I+
   n2nnwXI8b5fN/U5gtpDLU67gVq1dxiPkcsvwfYkKW1nWZcPjJI3EU/2ky
   e1DoPcatrdqIeIQ+8ubAbXeJuRY++hbbg6LD+YV+j7+1c8tEly9HQmxVb
   1v2iFmvvKF000f8Cdl8mxz0HXCK1olv/cjIZp3jdf2szyjcHr68J9oD12
   OhtkgZYxvo/N0nCJUf4MRgbjjuCHn0K9TooojaGObIyLKmeziPFxwhlmA
   w==;
X-CSE-ConnectionGUID: y07yl+maRJqG5+6fZKXAaA==
X-CSE-MsgGUID: Ky8CGwloRjuW23FM1ycdEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30348594"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30348594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 07:42:31 -0800
X-CSE-ConnectionGUID: gDrU65daRhiJew45Cdu4LA==
X-CSE-MsgGUID: snHpnrVgSOuta0U1t1IzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84010716"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 07:42:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8LhL-0000000BSLc-3om8;
	Tue, 05 Nov 2024 17:42:27 +0200
Date: Tue, 5 Nov 2024 17:42:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <Zyo84z0DUi-NweEV@smile.fi.intel.com>
References: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>
 <l75w7qvvw34u3vwvd7ddnka2q3fcrvzpxbfwrh22niggndrp2s@fctmlyvdfiqm>
 <ZyoyJSiWXBNar47_@smile.fi.intel.com>
 <ow63ccyclvg3zhvaq4lnubvrjvtaw3maf76engq6zdrcvvdwaz@lqj4okf3jt6c>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ow63ccyclvg3zhvaq4lnubvrjvtaw3maf76engq6zdrcvvdwaz@lqj4okf3jt6c>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 05, 2024 at 04:11:37PM +0100, Andi Shyti wrote:
> On Tue, Nov 05, 2024 at 04:56:37PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 05, 2024 at 03:44:34PM +0100, Andi Shyti wrote:
> > > On Mon, Nov 04, 2024 at 12:39:14PM +0200, Andy Shevchenko wrote:
> > > > *-objs suffix is reserved rather for (user-space) host programs while
> > > > usually *-y suffix is used for kernel drivers (although *-objs works
> > > > for that purpose for now).
> > > > 
> > > > Let's correct the old usages of *-objs in Makefiles.

...

> > > >  config I2C_AT91_SLAVE_EXPERIMENTAL
> > > > -	tristate "Microchip AT91 I2C experimental slave mode"
> > > > +	bool "Microchip AT91 I2C experimental slave mode"
> > > >  	depends on I2C_AT91
> > > >  	select I2C_SLAVE
> > > >  	help
> > > > @@ -440,7 +440,7 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
> > > >  	  been tested in a heavy way, help wanted.
> > > >  	  There are known bugs:
> > > >  	    - It can hang, on a SAMA5D4, after several transfers.
> > > > -	    - There are some mismtaches with a SAMA5D4 as slave and a SAMA5D2 as
> > > > +	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as
> > > 
> > > Although these changes are related and I'm OK also with the typo
> > > fix, could you please propose here a couple of lines that I can
> > > add to the commit message?
> > 
> > Would this work?
> > "While at it, fix an obvious typo in help section of the Kconfig."
> 
> works for me.
> 
> > Of course, feel free to drop that hunk or request for a new version without it
> > (or split into a separate change), I am fine with all options.
> > 
> > Note, bool is essential to for the patch, but can be split as a prerequisite,
> > but without this patch it doesn't really fix match as we never try to build
> > the code when it was =m.
> 
> As you wish, you can keep it in three patches or I can keep it
> as it is. I'm not too religious.
> 
> If I don't see anything coming I will take this patch as it is.

If you can take it as is (including the above mentioned add-on
to the commit message) it would be the best.

-- 
With Best Regards,
Andy Shevchenko



