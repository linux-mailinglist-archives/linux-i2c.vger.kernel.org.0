Return-Path: <linux-i2c+bounces-15266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA9D3A6A4
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 12:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A84F5308731D
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 11:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473512DE6FC;
	Mon, 19 Jan 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oonSw+3D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262D293B5F
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821483; cv=none; b=hrsiQ3il5iXUTCFjlsRa84WCQt8aPdGkZJbY9NVnZ8GshdrdaQ5lcZsL1ba0ITQCceNd+UXMK5FYWGlPB2p8gn0iVeuvd1F68PzPhc7IsH6rf98qfgZPBTaYrc7MAXFXF5iP8lafxAFfSRE4coH5QhENopa1z5eWE3iyZrbpZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821483; c=relaxed/simple;
	bh=Qrt8Pc2QUAYXx+nK9SbBMDpSB00S5AE1V+9Iq+T3JoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMChN0X9bXGn8J3JKVazBMWsM7TyqztfGaMN+xEq4noadvHq30AN8RlcxkijLIsirF77X3BfV2w2ejh9j8DAKFXSrdyRnjC+y7EGYYP/5NyTkH4tGIadABghJnMZW/sFasp7LGX1RiBg7yAp9JWx2sZWKmGAV1jnSLNlgvLSyNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oonSw+3D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D109BC19424
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821482;
	bh=Qrt8Pc2QUAYXx+nK9SbBMDpSB00S5AE1V+9Iq+T3JoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oonSw+3DrNZ2VxGfVQJTAP7oB7BETS53hJY4XHuPGm4vOMSzLyZfdS5H/fNqE+4hj
	 wFP8H+gbjqV2TkZtF9ngZ4MAocodmmqzxNVSADfNkYGXc9cH0SF1FExs1ipEfMc3KH
	 FMmgBdgdj2EytVqEzprFfY4SWHewcT0qDEm9MD16z4is+I70U8uPpvrf0Y1GE64wdt
	 V3t2WPguL/T80VnbgCPoqupoaTv5gS7NMc+4Jnn8huoU+UjX2O8PXsHaJLLDiYbroV
	 BXj02jdCvlj7WALcKPckJ1KTduN0hH3G8f7KeSnj1Y1g/s/j5c7gwNU3Q6iLjf+Jwg
	 fmeT8ZY7sLHmQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso4606731e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 03:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCw7dFvFD3HTcUhurmfaKKp6atCYqLPuGSYcY0IOIOdFDRFqd8Xrc+CtOeXsbK0AHvheuhLSI2DM4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/68RqKAAX0tnldLxh475MbGRBSWE/nQJ7kUnPHcUrtb91tONQ
	KDxTG7j5jORvHkojo6E7Ux0iwRsfNzsgluND8P/o/jdOMMcwctGTaoPBTicT+AMAQz1jWaJT3nz
	oH+mceyNW+6xiTisvPRUoc35QeqS+sslS5VZmApxIBA==
X-Received: by 2002:a05:6512:234a:b0:59b:73b9:1f49 with SMTP id
 2adb3069b0e04-59ba71a21a4mr5663497e87.26.1768821481438; Mon, 19 Jan 2026
 03:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com> <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
 <aW4PajoKqmyjkciY@hovoldconsulting.com>
In-Reply-To: <aW4PajoKqmyjkciY@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 12:17:49 +0100
X-Gmail-Original-Message-ID: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
X-Gm-Features: AZwV_QhTOAeF1zNPvjVLJF6GJlUC44HwEM3vIZ8FNKt6qikN3ueMCqdY3a7S--s
Message-ID: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:03=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Tue, Dec 23, 2025 at 04:11:08PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 23, 2025 at 3:24=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > > > It's been another year of discussing the object life-time problems =
at
> > > > conferences. I2C is one of the offenders and its problems are more
> > > > complex than those of some other subsystems. It seems the revocable=
[1]
> > > > API may make its way into the kernel this year but even with it in
> > > > place, I2C won't be able to use it as there's currently nothing to
> > > > *revoke*. The struct device is embedded within the i2c_adapter stru=
ct
> > > > whose lifetime is tied to the provider device being bound to its dr=
iver.
> > > >
> > > > Fixing this won't be fast and easy but nothing's going to happen if=
 we
> > > > don't start chipping away at it. The ultimate goal in order to be a=
ble
> > > > to use an SRCU-based solution (revocable or otherwise) is to conver=
t the
> > > > embedded struct device in struct i2c_adapter into an __rcu pointer =
that
> > > > can be *revoked*. To that end we need to hide all dereferences of
> > > > adap->dev in drivers.
> > >
> > > No, this is not the way to do it. You start with designing and showin=
g
> > > what the end result will look like *before* you start rewriting world
> > > like you are doing here.
> >
> > The paragraph you're commenting under explains exactly what I propose
> > to do: move struct device out of struct i2c_adapter and protect the
> > pointer storing its address with SRCU. This is a well-known design
> > that's being generalized to a common "revocable" API which will
> > possibly be available upstream by the time we're ready to use it.
>
> Revocable, as presented in plumbers, is not going upstream.
>

Oh really? :)

https://lore.kernel.org/all/2026011607-canister-catalyst-9fdd@gregkh/

> > You know I can't possibly *show* the end result in a single series
> > because - as the paragraph before explains - we need to first hide all
> > direct dereferences of struct device in struct i2c_adapter behind
> > dedicated interfaces so that we when do the conversion, it'll affect
> > only a limited number of places. It can't realistically be done at
> > once.
>
> You can post an RFC converting one driver with a proper description of
> the problem you're trying to solve.
>

It's not a one-driver problem. It's a subsystem-wide problem requiring
a subsystem-wide solution. Wolfram explained it really well in his
summary, I'm not going to repeat it here.

I also don't agree that i2c-specific helpers make code harder to read.
Is device_set_node() harder to read than

dev->fwnode =3D fwnode;
dev->of_node =3D to_of_node(fwnode);

?

Even if you answer yes - it at least helps hide the implementation
details of the OF layer where fwnode-level is preferred. We do it all
the time in the kernel. This kind of helpers allows easier transitions
when some implementation detail needs to change - as is the case here.

Bartosz

