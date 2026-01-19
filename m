Return-Path: <linux-i2c+bounces-15265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 092AAD3A614
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 12:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02F53300C03D
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D095357718;
	Mon, 19 Jan 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4pl0ofF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B11EE00A;
	Mon, 19 Jan 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820594; cv=none; b=R/Z/e1v1OyDt+gQf3sgixqr+NXqufEcSlp2th93ZWr0TYk9ZPvs3SIHFsKH3OXmKidmHQXt5UD5qVf2pTadINa+G3cGURUSZMIpeYs81WT7GfQuwUVMr+2xArVR4qpJ8EbGhHNYxIxTWML/sw3BOxou+0RHKl+JRthwAAIFz9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820594; c=relaxed/simple;
	bh=Mt0lTtW0SXUZ+bfiJxVUlnJJ2N4AYGqAw+VCdzmAl/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHYz/Nod6fRQ67dPVQEhyc1kshJOQCl2DF1qLy/JR0AAXgVwia+ufIEzF1Kf4id64pwzydft1ZiXL/rCzAhFXCclR2AHncpyjYh0UzuzmLRdG5oGIFWb3LYKJNE4Ru3LE5NR9MomXJQpE3Jp8dzJrxBi7BZNzb+glqNHK5FkGhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4pl0ofF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7800BC116C6;
	Mon, 19 Jan 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820593;
	bh=Mt0lTtW0SXUZ+bfiJxVUlnJJ2N4AYGqAw+VCdzmAl/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4pl0ofFVaZCWtIpWJuGDssLs+2l2nRdSBXVxh6DBcRX26quEJJHUBZTwC44GHoYU
	 Sq3KC8JHsAD2+9OD17hTSWRkgCPsL2XoZOgE1LIPMtGdrDJmK6bgGER6XgwtSO3VZs
	 ThFtbVqn/JDqSueZGKjpbzJxoaTdLR5M7m2QsV53lTG++FOzrXWIUHwOHZU0KECT9W
	 cVGuEJwW7PmX+lXcVYQ1dDPeuEkOtWecV4nFkcsYEUAgQf9U2VH40udzyT1pKMnPvX
	 QW8lrTHNl9UJPMIZtkdEAaBSnysDMlF7KWo+vbtJHtdW+gMOl2YDSTr+H0R+NNLWvw
	 GZo3UpMCsJcnA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vhn2I-000000000vD-10Ay;
	Mon, 19 Jan 2026 12:03:06 +0100
Date: Mon, 19 Jan 2026 12:03:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aW4PajoKqmyjkciY@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com>
 <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>

On Tue, Dec 23, 2025 at 04:11:08PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 23, 2025 at 3:24 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > > It's been another year of discussing the object life-time problems at
> > > conferences. I2C is one of the offenders and its problems are more
> > > complex than those of some other subsystems. It seems the revocable[1]
> > > API may make its way into the kernel this year but even with it in
> > > place, I2C won't be able to use it as there's currently nothing to
> > > *revoke*. The struct device is embedded within the i2c_adapter struct
> > > whose lifetime is tied to the provider device being bound to its driver.
> > >
> > > Fixing this won't be fast and easy but nothing's going to happen if we
> > > don't start chipping away at it. The ultimate goal in order to be able
> > > to use an SRCU-based solution (revocable or otherwise) is to convert the
> > > embedded struct device in struct i2c_adapter into an __rcu pointer that
> > > can be *revoked*. To that end we need to hide all dereferences of
> > > adap->dev in drivers.
> >
> > No, this is not the way to do it. You start with designing and showing
> > what the end result will look like *before* you start rewriting world
> > like you are doing here.
> 
> The paragraph you're commenting under explains exactly what I propose
> to do: move struct device out of struct i2c_adapter and protect the
> pointer storing its address with SRCU. This is a well-known design
> that's being generalized to a common "revocable" API which will
> possibly be available upstream by the time we're ready to use it.

Revocable, as presented in plumbers, is not going upstream.

> You know I can't possibly *show* the end result in a single series
> because - as the paragraph before explains - we need to first hide all
> direct dereferences of struct device in struct i2c_adapter behind
> dedicated interfaces so that we when do the conversion, it'll affect
> only a limited number of places. It can't realistically be done at
> once.

You can post an RFC converting one driver with a proper description of
the problem you're trying to solve.

Johan

