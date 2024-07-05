Return-Path: <linux-i2c+bounces-4662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E8928881
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 14:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2F81C22A3B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 12:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6F514A4D9;
	Fri,  5 Jul 2024 12:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRNLJr9+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA5149C52;
	Fri,  5 Jul 2024 12:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720181670; cv=none; b=QjRIFi9qDHWpIgLp5jp0radH/eiKhgDU/R6gFtgnx7wZBhz+ZSpmzPL7KEdnuHvVn/pdUOu4hNLBFI30v/8ds8pCAMUG+1SZ6fW0Z7xiJJn6VUKXCwaPwC//AFlcxpk6aZuGg6fFc6VfcYZYWN8CiIP7U28LFtbFAkRAYikqceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720181670; c=relaxed/simple;
	bh=KFWQMJ6Wph6R6V0qaI65f80zhp/w/EFE5FRhTDDL+xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gslrTJwPZ3IfG6OVaZ//bEWdQCPcEwVbnaXVJYCAYzkTOAzNK1QwgvoOADrpPmKsqcS/7/JjUl+NqWzC58WUrKDp8PcACZVK4ylCXhMWrOA7z1tmnaiHLyeTbv5SB+8+WhF6VO6DUCFZ1m8KABaYO+QyDgfJzUeDF91ouS8aD+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRNLJr9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2ADC116B1;
	Fri,  5 Jul 2024 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720181669;
	bh=KFWQMJ6Wph6R6V0qaI65f80zhp/w/EFE5FRhTDDL+xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRNLJr9+eR+eutN+367lEVtaOqpNnKGvCTQZ2J7AXumKZGhVIy2hFWSw+9+My+beK
	 p35b7s0npFsbQ04UczaxtAgee0ohsHYhIo9y+fOMrlYD83MLEXfBN84ztD8HV3W2Vd
	 VU9+MEma+qXB5Qv8W4jtvmd2Z6890skNsd0YJQgRoosgTVYIxfjd2xqe2CgUWU27rf
	 ej+u02/dINuhMO0G9sSRD8ATCRoTO/zoKbHWdRsROZXXNNhje4D9FLqIzV3ONUOT3p
	 eppRfldJi30VRs5U1FzVD9dQlouh9Tk2EsRoAn0dWR3zsIWmplyrA/Rrx8Y5RHi+4C
	 If4IMfXLtvoBA==
Date: Fri, 5 Jul 2024 14:14:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Message-ID: <5pg2ubwv5gl7md55rjo3n6qgssirdryyou3gsbwbm35gxk4boo@q3hcnrminnzm>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
 <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>

Hi Geert,

> > >  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
> > >  {
> > >       writeb(val, riic->base + riic->info->regs[offset]);
> > > @@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> > >       struct riic_dev *riic = i2c_get_adapdata(adap);
> > >       struct device *dev = adap->dev.parent;
> > >       unsigned long time_left;
> > > -     int i;
> > > +     int i, ret;
> > >       u8 start_bit;
> > >
> > > -     pm_runtime_get_sync(dev);
> > > +     ret = pm_runtime_resume_and_get(dev);
> >
> > In principle I like the error message to be always checked and I
> 
> s/message/condition/?

yes :-)

> > will always approve it. Whenever there is a return value, even
> > when we are sure it's always '0', it needs to be checked.
> >
> > I had lots of discussions in the past about this topic but I
> > haven't always found support. I'd love to have the ack from a
> > renesas maintainer here.
> 
> I don't mind checking for the error here.
> 
> >
> > > +     if (ret) {
> > > +             dev_err(dev, riic_rpm_err_msg);
> 
> Do you need to print these error messages?

I don't think it's needed, indeed.

> AFAIU, this cannot happen anyway.

That's what I was saying earlier. It's just a different point of
view.

To be honest, I don't really mind.

Thanks,
Andi

> Ultimately, I expect the device driver that requested the transfer to
> handle failures, and print a message when needed.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

