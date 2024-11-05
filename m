Return-Path: <linux-i2c+bounces-7800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C59BD58E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 20:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F6841F238E0
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 19:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945B21E7C31;
	Tue,  5 Nov 2024 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAeDah6H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75C1E3796;
	Tue,  5 Nov 2024 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730833268; cv=none; b=q2nnic59uKQRD/ch32DoTjTBNJn8qN35LXUDYEFLWRaLPvtQnSVoa8b8uAEAMkuFAZElpx8oiU798BoJKxVuAiS8Ecn3oo7OZpLt/Ug/1zL5Rld+s3QvkSapxDQgMrmJ4umm38FSCXHqyCYJA2HvsL7RtCwJ8QfIVJSubnU+7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730833268; c=relaxed/simple;
	bh=WT8FATNKOFEBbj0GsCPP23g5V43KaqqcPw4K1lQd4RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX2d+mfCgwJZ1dZA2qKILP0E893C5VS5h1rTUAun+PmhYKI77nSpA7vCj1JE0XCvySsF/RKt/aK/LnbzronD+czUKyRzkHEeHIdZHEmjkbSTMelwdRvWV7Ndt4C8ZfYyocp/QIf/Ve0tyWLN6k3FZPzBhmYEgLAGkFP+WFztOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAeDah6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA9C4CECF;
	Tue,  5 Nov 2024 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833267;
	bh=WT8FATNKOFEBbj0GsCPP23g5V43KaqqcPw4K1lQd4RA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAeDah6HlLHyuL3udGskeY0ZSK4knBv0zl9U/YDovZiwYZwuYVdn5B9eUTgyvttrS
	 3FHByJGLHiaTIDpryHRpyf8vtYHWhBVFZ8QYMpnAWrEl1X+QlDqD8PI9Q9BQk91zmd
	 jJmLtMX90B5xoDVa9FSi5urwbidL1N8hYdqTs3QGJo2sD+BEETYrVFu5ZnWP1epvtP
	 1oSb1gX0VftwzjYa3xoR5IRbbjCgW0N6tP7pU9IA3g8O76N12S51X0KN0m14om4XR1
	 vONQjg2Hh4g4Ndn3gwqiiUE3K0c0ru9OMOpvIyczZBG9aq9jSqxi7QCSYybs3G1Jmp
	 bcWwVc+WiB77A==
Date: Tue, 5 Nov 2024 20:01:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <jwvgvjygqeodzxphlxs32sobnc7jh3wfnjnazlax3mqj7qylyb@n7iyyo63deej>
References: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>
 <l75w7qvvw34u3vwvd7ddnka2q3fcrvzpxbfwrh22niggndrp2s@fctmlyvdfiqm>
 <ZyoyJSiWXBNar47_@smile.fi.intel.com>
 <ow63ccyclvg3zhvaq4lnubvrjvtaw3maf76engq6zdrcvvdwaz@lqj4okf3jt6c>
 <Zyo84z0DUi-NweEV@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyo84z0DUi-NweEV@smile.fi.intel.com>

Hi Andy,

On Tue, Nov 05, 2024 at 05:42:27PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 05, 2024 at 04:11:37PM +0100, Andi Shyti wrote:
> > On Tue, Nov 05, 2024 at 04:56:37PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 05, 2024 at 03:44:34PM +0100, Andi Shyti wrote:
> > > > On Mon, Nov 04, 2024 at 12:39:14PM +0200, Andy Shevchenko wrote:
> > > > > *-objs suffix is reserved rather for (user-space) host programs while
> > > > > usually *-y suffix is used for kernel drivers (although *-objs works
> > > > > for that purpose for now).
> > > > > 
> > > > > Let's correct the old usages of *-objs in Makefiles.
> 
> ...
> 
> > > > >  config I2C_AT91_SLAVE_EXPERIMENTAL
> > > > > -	tristate "Microchip AT91 I2C experimental slave mode"
> > > > > +	bool "Microchip AT91 I2C experimental slave mode"
> > > > >  	depends on I2C_AT91
> > > > >  	select I2C_SLAVE
> > > > >  	help
> > > > > @@ -440,7 +440,7 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
> > > > >  	  been tested in a heavy way, help wanted.
> > > > >  	  There are known bugs:
> > > > >  	    - It can hang, on a SAMA5D4, after several transfers.
> > > > > -	    - There are some mismtaches with a SAMA5D4 as slave and a SAMA5D2 as
> > > > > +	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as
> > > > 
> > > > Although these changes are related and I'm OK also with the typo
> > > > fix, could you please propose here a couple of lines that I can
> > > > add to the commit message?
> > > 
> > > Would this work?
> > > "While at it, fix an obvious typo in help section of the Kconfig."
> > 
> > works for me.
> > 
> > > Of course, feel free to drop that hunk or request for a new version without it
> > > (or split into a separate change), I am fine with all options.
> > > 
> > > Note, bool is essential to for the patch, but can be split as a prerequisite,
> > > but without this patch it doesn't really fix match as we never try to build
> > > the code when it was =m.
> > 
> > As you wish, you can keep it in three patches or I can keep it
> > as it is. I'm not too religious.
> > 
> > If I don't see anything coming I will take this patch as it is.
> 
> If you can take it as is (including the above mentioned add-on
> to the commit message) it would be the best.

And merged to i2c/i2c-host.

Thanks,
Andi

