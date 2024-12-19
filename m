Return-Path: <linux-i2c+bounces-8645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC4B9F86B0
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 22:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9468316AA27
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 21:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D833420371B;
	Thu, 19 Dec 2024 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvEKPIvE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6F202C4A;
	Thu, 19 Dec 2024 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642499; cv=none; b=mfHDDpymO5/rUhDR8POEidfWaLLtDxQlatTOU8dnAGzXNbRRe6NXxxiC4Z4JAR8/wNBZsqkJTZNTcu2R67FRyZTDqbKEcjzw6XFuqx+QChDUsqu6GwciLghUXiZN7+z4WD/UTJnLIOhFzRXeckJJo6uMod5u+JSeSObZ8BjGDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642499; c=relaxed/simple;
	bh=fREqPow8DQ+UE+a6PeQ+XAdeXpkuxr2s3BJaKvd2SiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFbslTQQMyCXf0soTKFtP47wuEApO93jiuJmOkAdHIr8La9B/iTaxySRWvB+XPcTh8ZORKzEMiGdPhiWmctsXcRRmW7SyOC2bhtGSsKp1kVXbSZoO7PR3G3kk9W1dM3tWcaceZY9w0RbSZLXCgs3uLTP/6S5RTi+Ke1clmf76so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvEKPIvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915B3C4CECE;
	Thu, 19 Dec 2024 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734642498;
	bh=fREqPow8DQ+UE+a6PeQ+XAdeXpkuxr2s3BJaKvd2SiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvEKPIvExE+ORaD0PcJI7yzFDj6jsy5psmnuehaKkJEB1jpprHs1HhoEDnTYMfGVE
	 PyulV5Cnt+hqn5bKZL2obaox+uSUiGKXmWcwDTqnMVLLPQuBZx9ID+0Zur0neA3tNK
	 e4+a1ytkohIxK8nTOEsAfcwM9TKcFlcTtfQ/ldPAGL6aOQ0kIi0MPdZPjTiKFcHwf1
	 oMTqmbGe7jr/TyCrWLGEY1utSPx74FSi8IVVM7tEJ++jygpVyuUNA+KqaAGtBvCwYR
	 J4TnjXTy/G9yZlBi2Jy4NiTRh7GNUhRDpocKdb4PAWlFANqlFqXRq8cHCmCtWMnpfA
	 lj/9E28oSbAbQ==
Date: Thu, 19 Dec 2024 22:08:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in
 `dev_err_probe()`
Message-ID: <w33x5r6l2w3qfmc32mddt2jrcqnrzwqga7u6v2hmfdb7hhc7du@eeioqidbbfsu>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ozrnsv5gampgx3hz6mfkg6gtazofmfbl2xfelfpuxmwx7porcq@mejsk7hdc55o>
 <CA+V-a8sCCwxkEh=jF+XGuCf0X-N9_QUc8hiiQgtwtpxMm11tdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sCCwxkEh=jF+XGuCf0X-N9_QUc8hiiQgtwtpxMm11tdw@mail.gmail.com>

Hi Prabhakar,

On Thu, Dec 19, 2024 at 12:44:50PM +0000, Lad, Prabhakar wrote:
> Hi Andi,
> 
> On Thu, Dec 19, 2024 at 12:21 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Prabhakar,
> >
> > > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> > > index bfaa2d728a76..01195ffd4c07 100644
> > > --- a/drivers/i2c/busses/i2c-riic.c
> > > +++ b/drivers/i2c/busses/i2c-riic.c
> > > @@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
> > >                                     : I2C_MAX_FAST_MODE_FREQ;
> > >
> > >       if (t->bus_freq_hz > max_freq)
> > > -             return dev_err_probe(&riic->adapter.dev, -EINVAL,
> > > +             return dev_err_probe(dev, -EINVAL,
> > >                                    "unsupported bus speed %uHz (%u max)\n",
> > >                                    t->bus_freq_hz, max_freq);
> >
> > Which branch are you on? This change has already been introduced
> > in commit 71dacb2565ed ("i2c: riic: Simplify unsupported bus
> > speed handling")
> >
> I'm on v6.13-rc3, the above change just replaces the first parameter
> in dev_err_probe(). The change introduced in commit 71dacb2565ed
> ("i2c: riic: Simplify unsupported bus speed handling") does not update
> the first parameter in dev_err_probe() which this patch addresses.
> Actually I have fixes tag for commit 71dacb2565ed in the current
> patch.

oh, yes, sorry, ignore that :-)

Andi

