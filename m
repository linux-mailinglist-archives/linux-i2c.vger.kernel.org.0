Return-Path: <linux-i2c+bounces-14738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 668FBCD9BDC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 16:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07A68303437B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 15:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD57128C5AA;
	Tue, 23 Dec 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HscJwIiy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBC283FE5
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766502682; cv=none; b=hczGVmyuiCaH9uN+EjQ1rwy8BvktDaN7tVsuGqKbBeNxAZjrBl4lUH4x1eMuMlusDfZXXk1fKBVY/Hwe73ltbDLFXC/mcXMP3dCdhElREgbhdZPI3GTEKkKeYnzErpBHB0iXV95F23loDR8HOdM3DbiQ+ysBN65Wfumev7Zi5MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766502682; c=relaxed/simple;
	bh=hBd99sFsDzr3RqRdPe5qJoyoWGaL7p/NWTHuLq0D7w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1SUHPmXg4VJWAAPIPPjIkAQrybu0DVZQ2qhB6T5PCE8LDmKb8iI9vYJDuCUX3AmLhSLxAio49g6up6jhy/NSp3jQfH3nZgiM+DktEy/J1LBwxRaVH82kQzJ/v+pS8CzV+M6atCDb43LWhBLUaJlUa7EdTpyCQnGGulSzNGrCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HscJwIiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AB0C116D0
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766502682;
	bh=hBd99sFsDzr3RqRdPe5qJoyoWGaL7p/NWTHuLq0D7w8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HscJwIiyIaDTcugZolmE0cmSpADXJGHFjUpBlkDaROd55L+oN8Csh27PiHW46YJHO
	 0Vg9/Lj+clrBlQsCwLVLYyC97RVVJ17XbEI4AckP4Ck83e5jhVDb1IG/brgY89Tz8n
	 fG56tzdzDuiklT7my4Un0bkCFuyKT2g30h+Vy+G57isKQMZ2JwOXYF2M9SCl0SoG92
	 7dbDu+BEAcsGO4oexsFk1B/WrYcvAxCujGHZUkAr4BVpfmYuAS+QIeIYcF6jlGL3dO
	 XMpW+GojzJyRODYogUXvvj3+4rFMQcc/kaEH58YhZnsh+UHzc1xOX+JbzLo2PDPuE5
	 4sizM2ROUZl1A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a2dced861so60098331fa.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 07:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrtfeXlK0RFbWnTfEALT20cPoSqqj3ry+v1HajIX6vATSoTn8vp3eU2r8v53FQA9DNDtn1BoC26Bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmQgF3F0ttPH46f+sCN0VRY+qu4C2IRZSe8qX9pfnyUSAdCyH
	h9w6fTOEnUHUlwsWFwKLGOxV+sOZEng7WeN84aWNrX6DNRWAAFf5JvdRgNy6/umyW+i+YENuS1M
	iAAcvL4kzYcQ0wZLF09x/zE3IiGu0+YxCVtjuPQMG0w==
X-Google-Smtp-Source: AGHT+IFdufR6j9R1oFKNSbl+pKd9Z0pO11ahHM/zkyZYbJzkzxH5yHhlEwogbQjTtBxGrsqfRKfJTkaYfWLXkoOjLuo=
X-Received: by 2002:a2e:b88f:0:b0:37e:6b29:111b with SMTP id
 38308e7fff4ca-38113162f37mr64888811fa.2.1766502680316; Tue, 23 Dec 2025
 07:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aUql_tZisfH8E1bq@hovoldconsulting.com>
In-Reply-To: <aUql_tZisfH8E1bq@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 23 Dec 2025 16:11:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
X-Gm-Features: AQt7F2oePEehO-JdLKixmyMZf7bMW4cvrFzOuWvK19hmXZhvMoz_mkpRCfNkPVc
Message-ID: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
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

On Tue, Dec 23, 2025 at 3:24=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > It's been another year of discussing the object life-time problems at
> > conferences. I2C is one of the offenders and its problems are more
> > complex than those of some other subsystems. It seems the revocable[1]
> > API may make its way into the kernel this year but even with it in
> > place, I2C won't be able to use it as there's currently nothing to
> > *revoke*. The struct device is embedded within the i2c_adapter struct
> > whose lifetime is tied to the provider device being bound to its driver=
.
> >
> > Fixing this won't be fast and easy but nothing's going to happen if we
> > don't start chipping away at it. The ultimate goal in order to be able
> > to use an SRCU-based solution (revocable or otherwise) is to convert th=
e
> > embedded struct device in struct i2c_adapter into an __rcu pointer that
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> No, this is not the way to do it. You start with designing and showing
> what the end result will look like *before* you start rewriting world
> like you are doing here.
>

The paragraph you're commenting under explains exactly what I propose
to do: move struct device out of struct i2c_adapter and protect the
pointer storing its address with SRCU. This is a well-known design
that's being generalized to a common "revocable" API which will
possibly be available upstream by the time we're ready to use it.

You know I can't possibly *show* the end result in a single series
because - as the paragraph before explains - we need to first hide all
direct dereferences of struct device in struct i2c_adapter behind
dedicated interfaces so that we when do the conversion, it'll affect
only a limited number of places. It can't realistically be done at
once.

> We should not be making driver code less readable just to address some
> really niche corner cases like hot pluggable i2c controllers.
>
> But in any case, don't get ahead of things by posting changes that we
> most likely don't want in the end anyway.
>

The changes I sent are the result of another discussion with Wolfram
at LPC so I'll definitely wait for his take on it before dropping
anything.

Bartosz

