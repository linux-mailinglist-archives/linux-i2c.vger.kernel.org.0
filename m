Return-Path: <linux-i2c+bounces-5546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D15957516
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 21:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FDD1281CB6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 19:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2A01DD387;
	Mon, 19 Aug 2024 19:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cd0Um/A1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2821DAC42;
	Mon, 19 Aug 2024 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097403; cv=none; b=KIpkQ6C5pyZnEfubceognfFdn62O6hJM2UdFl2qK1vjvRZtBQ0oC1+uMHMbNx17gkaKoixwzog0ja1y0IBqStP9XtSDEa4c5sY1IIywoEJbFygl9h/IUYS+W0thQ7sEBwo/o8sR2VZs3aifvKccndn9Lw+12eYMwrwcaH+bNlo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097403; c=relaxed/simple;
	bh=tPvpMLuFSAnOXuRFxzSXoYbAnnW8myMFN1l5mA7qOGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAMiyQ+0H7nQXtmdyQypXJlwFmSyNW+iRcjo+qgF25Kd/CYFoAzYj+z1Pz0s7vcXhfX3YnEVmzgIXlbqLA7++1fhHh5vE/KbqnRNeKEpCgM8Zez5vXFU1UkxvA5PoAo3vBHa60pAWb8/cXySNTkHq5To2rsX8rEX03MY7BZt4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cd0Um/A1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF04AC32782;
	Mon, 19 Aug 2024 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724097403;
	bh=tPvpMLuFSAnOXuRFxzSXoYbAnnW8myMFN1l5mA7qOGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cd0Um/A1HsQExf5JaaOM+jT0Sc+ix861H5ANMh7BoAMVUP6BR+9afuxpmE2bJhN22
	 M7wsDOESLVR3rHfB9SHUFj1nbIbuAPtGdqoVQVB78kC/6M90nZ+P5zdedbANMzE9uF
	 LcNTmsHKkNAN6e3sL7sFq1Oo7Dw4KlttZxNN3nbu/GCmrCQBVi2g+18G33cdH8vJvs
	 KI4QIqa3qZBVAhr/5FBgJ+s1HVKQiNucgvcsMR5ptZUAdVjrUGimt4HVw/8ifaR0eI
	 79ZgBnfzhC6e09lGnyGXuWONc6CB0v5MESWmiV6LBIkEB3mXXpHa4FValPfcrpY2X6
	 wgPVpnA+BOBZw==
Date: Mon, 19 Aug 2024 21:56:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, claudiu beznea <claudiu.beznea@tuxon.dev>, 
	Chris Brandt <Chris.Brandt@renesas.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Message-ID: <dl7vqbmypa6cxzlfutlpnn6tfuxr3elj7wdzway3eyhho5mdxy@ylw2azxpdbdw>
References: <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
 <7c542f46-c644-4f22-bbc4-408b7dad8273@tuxon.dev>
 <CAMuHMdUmiQjsKt93jM62V5YR_NdtUDXhcxFs+F+BCu3NTNsx8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUmiQjsKt93jM62V5YR_NdtUDXhcxFs+F+BCu3NTNsx8Q@mail.gmail.com>

Hi Geert,

I've been reading all the review history of this series and now
I'm walking through all the review history again do see if
everything has been 

> > >>>> On the manual I've downloaded from Renesas web site the FMPE bit of RIICnFER is not available on
> > >>>> RZ/A1H.
> > >>>
> > >>> I just found RZ/A2M manual, it supports FMP and register layout looks similar to RZ/G2L.
> > >>
> > >> I introduced struct riic_of_data::fast_mode_plus because of RZ/A1H.
> > >
> > > Do you need to check for that?
> > >
> > > The ICFER_FMPE bit won't be set unless the user specifies the FM+
> > > clock-frequency.  Setting clock-frequency beyond Fast Mode on RZ/A1H
> > > would be very wrong.
> >
> > I need it to avoid this scenario ^. In patch 09/12 there is this code:
> >
> > +       if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
> > +           (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
> > +               dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
> > +                       info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
> > +                       I2C_MAX_FAST_MODE_FREQ);
> >                 return -EINVAL;
> >
> > to avoid giving the user the possibility to set FM+ freq on platforms not
> > supporting it.
> >
> > Please let me know if I'm missing something (or wrongly understood your
> > statement).
> 
> Wolfram/Andi: what is your view on this?

I don't have anything against it... what exactly are you
proposing here?

If you want you can directly reply to the v4 6/11 patch.

Thanks Geert for checking on this series.
Andi

