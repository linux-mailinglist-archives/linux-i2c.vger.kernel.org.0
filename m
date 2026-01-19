Return-Path: <linux-i2c+bounces-15264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C0D3A60B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 11:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A6483036423
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2373502BF;
	Mon, 19 Jan 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HodbY79Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E7E3033DB;
	Mon, 19 Jan 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820321; cv=none; b=NaEZRDyLz5Parn4A9MLQzTHQE608awEwsgOI6BUjMGI8n6pQmllvgyTQXPgPozr/TIUVeOMcVDdgoPzCkUAjb+I+TJaB8HD8Jki4Yck2q7sGxZ/LfbrSRiYp6vcFyDhasuY/YGX12+gAR143FYpmsq4Swtnroh2TgZjuFUX4+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820321; c=relaxed/simple;
	bh=yfPKb9BVO6k+dZ/kURKCnEAbYk4oQ741nblYfmVk/kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6YxfSCkzTqAf9bzuy7D1wrJBadVkcdRADQ7YrJym2wC+JZ08ts4oGsFpsOVBhe2cOEzdCSM/KOXE/dCedWUM91jkPEB4PuVJnLpEKlPhTDhHki71hc9NQ+cUbZCUNOTv0MW9aX6rFGbQCRxXRWpCtQNCbdVu9f0jIC/klU3R58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HodbY79Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CE9C116C6;
	Mon, 19 Jan 2026 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820321;
	bh=yfPKb9BVO6k+dZ/kURKCnEAbYk4oQ741nblYfmVk/kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HodbY79QQVJ1ToMX5FDjVjQkmPR0PLVyFCNUfN4lnBuhJ3LQDiZeYLYgaTkuV//eN
	 SgDkEg8c4DfTwOMz3z3aUGKlApba7dWXHIaEw04s+8r82rJQryi3h3PGeH/j7FCks8
	 TMqExMZUu3bhJLf+3/RcSv7jOfLO3YIenhAHjFPQKtDjv0xJjjQBbiOUuih8fVplyy
	 nwXmiphIma7RnMeA5CgVwGiJJ6KmD1FBTVYwaxOaCVU8qH/U3MnP8N8WMCNe2VqW2D
	 +XciX3/vx8jCBLLGaaqukWP6Fe4L+NJiv6eZhcD86GMD8qUOvWR/rTOMBpX76wfgKA
	 aUTTOvfu8/ZMg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vhmxu-000000000rP-02O8;
	Mon, 19 Jan 2026 11:58:34 +0100
Date: Mon, 19 Jan 2026 11:58:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: Big I2C core changes coming up this year (was: Re: [PATCH 00/12]
 i2c: add and start using i2c_adapter-specific printk helpers
Message-ID: <aW4OWnyYp6Vas53L@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com>
 <aWYYZEPX-_1GfQtL@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWYYZEPX-_1GfQtL@ninjato>

On Tue, Jan 13, 2026 at 11:03:16AM +0100, Wolfram Sang wrote:
> Johan, (and all future readers I have pointed to this mail)
> 
> > No, this is not the way to do it. You start with designing and showing
> > what the end result will look like *before* you start rewriting world
> > like you are doing here.
> 
> In general, this is correct. It does not apply here, though. I will
> describe it in detail, so I can also point other people to this mail who
> wonder about quite some intrusive changes to I2C core this year.
> 
> > We should not be making driver code less readable just to address some
> > really niche corner cases like hot pluggable i2c controllers.
> 
> It is not a niche-case for hot-plugging. Hot-plugging (which still
> should be avoided for I2C) just makes a subsystem-inherent lifecycle
> problem more obvious. All of Bart's patch series basically prepare to
> tackle this comment from the I2C core:
> 
> 1805         /* wait until all references to the device are gone
> 1806          *
> 1807          * FIXME: This is old code and should ideally be replaced by an
> 1808          * alternative which results in decoupling the lifetime of the struct
> 1809          * device from the i2c_adapter, like spi or netdev do. Any solution
> 1810          * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
> 1811          */
> 1812         init_completion(&adap->dev_released);
> 1813         device_unregister(&adap->dev);
> 1814         wait_for_completion(&adap->dev_released);
> 
> This has been in the I2C core since switching to the driver model and
> the underlying problem applies to *all* i2c adapters. Simply unbind an
> I2C controller while you still have a reference to its i2c-dev
> counterpart and you are right in the problem space.

Unbinding drivers is even more of a corner case than hot-plugging i2c
controllers is since only root can do that.

Unloading modules is really just a development (debugging) tool so there
is a perfectly simple solution for any issues stemming from root
unbinding a driver while it's in use: don't do that then.

Furthermore, we even have mechanisms for preventing root from shooting
themselves in the foot with module refcounting and suppression of bind
attributes (which sometimes makes sense).

Issues stemming from unbinding drivers are not in themselves a
sufficient reason for making code harder to read and maintain or for
adding overhead to normal operation.

> The problem is known for decades(!) and nobody dared to touch it, so
> far. Even worse, the above pattern is not only present in I2C but also
> other subsystems. Bart and I have been talking about potential solutions
> for three years now. Bart brought in SRCU as a generic solution and at a
> Plumbers 2024 session with many experienced maintainers present, it was
> decided that this path is worth exploring. Greg suggested to try SRCU
> with GPIO and I2C subsystems, and if this works well, we can try to
> abstract it into something useful for other canidates as well. Now,
> recently, the 'revocable' patch series was introduced which might be
> helpful in our case.

Revocable is definitely not something we want for the very reasons I
outlined above (wrapping every access in code that's generally simply
not needed).

> It is also perfectly okay to work incrementally here, in my book. It is
> such an intrusive change that we need to touch a lot of drivers in any
> case. Yet, with the I2C core being a moving target, all the I2C drivers,
> the 'revocable' patch series, and Linux in general, I think requesting a
> fully complete patch series now is neither efficient nor maintainable.

Again, if the end result is undesirable, that's what we should be
focusing on and not "chipping away" in a direction were we most likely
do not want to go.

It doesn't have to be a complete series, an RFC reworking one driver is
more than enough to be able to judge the end result. And of course a
proper description of the problem you're trying to solve.

> Bartosz and I do have a plan. We are happy to discuss it with other
> interested people, of course. Still, despite all our efforts it might be
> a bumpy ride. Because it is such a crucial and deep-inside change to the
> subsystem core. This is part of development, though. If something
> breaks, we will fix or revert. The alternative is stagnation which I
> don't want. The above code was fine back in the days but now we have
> better mechanisms to handle lifecycle issues. And I really do not want
> Linux to have lifecycle issues. Especially not ones we *know of*.

There are lifetime issues in some subsystems related to user space
interfaces and hotplugging, but driver unbind is really not something
you need to worry about.

> > But in any case, don't get ahead of things by posting changes that we
> > most likely don't want in the end anyway.
> 
> We want helpers accessing that specific 'struct device', so we have
> central place to implement access to a protected version of it.

I really don't think we do. USB has been dealing with hotplugging since
forever without any of this. You need to keep some state around and
prevent new accesses until the last user is gone. That's about it.

Johan

