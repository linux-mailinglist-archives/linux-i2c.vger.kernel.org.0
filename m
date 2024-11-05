Return-Path: <linux-i2c+bounces-7783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A89BD025
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99E19B20F11
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A1E1D89F3;
	Tue,  5 Nov 2024 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWRy+D0G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711C838DD6;
	Tue,  5 Nov 2024 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730819502; cv=none; b=I1/jHjipOK9XZVjOoO2bsvPa3MY1LCK//tTkyJMDJjzImIfIR12DXGm4R53lZH0jPoP38RI06a2qjbqAtvG9rtb14Z3kyeHsuffw5+PPwg3tyKr9DtbWSihmqnyVSIEAanLrxTZTFhE0izvgHYS49U+dEEPJBNgOVAScYiO+WBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730819502; c=relaxed/simple;
	bh=eXvWZ6HZrFe4UlkwLHKP0WMYz43YXwcGYnpHi3jCo44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gx5DidsbUHNj1ZLqwDJeXLT/UJ/dbxEMvwx9fWFyDDYeTy0JyYG4j2zm30+RIKjXfwkh7I1iBck0yToCXoKzQFjfAk42zbHWc4lT0Ny3/RmaZmEGVfptH/a165nBMtJMWYSd+uhJM2coWckR7fxnEW3aM3WdpFTqQwhJFTc8E2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWRy+D0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB52AC4CECF;
	Tue,  5 Nov 2024 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730819502;
	bh=eXvWZ6HZrFe4UlkwLHKP0WMYz43YXwcGYnpHi3jCo44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWRy+D0GZ1lUaCfoiPgwGHFpo/GCf06hOQtcbYVE77bOr4zHwkLPuWQmUbnivy9Vg
	 x1IzZHJ3mZkkQuXn/ncNqIDGxfe+JQpC9YzzH3riVcbHoiTx0SCCMx3kDIROSptIaD
	 50x1GN01H3luGmhOT6yp9Jlf42z4TZNd+NLv969m2R3hcMpSEH44t2OuvbgtHHqvr/
	 rlJNEmgn8mwGS8C4J6SRURmR9q3ckEPFKhdJERAA/MXM7kgPYa9odcN6SP6j9tC5U6
	 OvoSutVWL/1Y1GAmjca9RXviO63jsDDLg5ZH9riQ5K3JhrhYOWKpOy70fLZPiHdGNQ
	 JVZhN2zoKntZQ==
Date: Tue, 5 Nov 2024 16:11:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <ow63ccyclvg3zhvaq4lnubvrjvtaw3maf76engq6zdrcvvdwaz@lqj4okf3jt6c>
References: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>
 <l75w7qvvw34u3vwvd7ddnka2q3fcrvzpxbfwrh22niggndrp2s@fctmlyvdfiqm>
 <ZyoyJSiWXBNar47_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyoyJSiWXBNar47_@smile.fi.intel.com>

On Tue, Nov 05, 2024 at 04:56:37PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 05, 2024 at 03:44:34PM +0100, Andi Shyti wrote:
> > On Mon, Nov 04, 2024 at 12:39:14PM +0200, Andy Shevchenko wrote:
> > > *-objs suffix is reserved rather for (user-space) host programs while
> > > usually *-y suffix is used for kernel drivers (although *-objs works
> > > for that purpose for now).
> > > 
> > > Let's correct the old usages of *-objs in Makefiles.
> 
> ...
> 
> > >  config I2C_AT91_SLAVE_EXPERIMENTAL
> > > -	tristate "Microchip AT91 I2C experimental slave mode"
> > > +	bool "Microchip AT91 I2C experimental slave mode"
> > >  	depends on I2C_AT91
> > >  	select I2C_SLAVE
> > >  	help
> > > @@ -440,7 +440,7 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
> > >  	  been tested in a heavy way, help wanted.
> > >  	  There are known bugs:
> > >  	    - It can hang, on a SAMA5D4, after several transfers.
> > > -	    - There are some mismtaches with a SAMA5D4 as slave and a SAMA5D2 as
> > > +	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as
> > 
> > Although these changes are related and I'm OK also with the typo
> > fix, could you please propose here a couple of lines that I can
> > add to the commit message?
> 
> Would this work?
> "While at it, fix an obvious typo in help section of the Kconfig."

works for me.

> Of course, feel free to drop that hunk or request for a new version without it
> (or split into a separate change), I am fine with all options.
> 
> Note, bool is essential to for the patch, but can be split as a prerequisite,
> but without this patch it doesn't really fix match as we never try to build
> the code when it was =m.

As you wish, you can keep it in three patches or I can keep it
as it is. I'm not too religious.

If I don't see anything coming I will take this patch as it is.

Andi

