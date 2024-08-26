Return-Path: <linux-i2c+bounces-5787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4196F95EA45
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 09:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79FF1F21C1B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 07:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B561112BEBE;
	Mon, 26 Aug 2024 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ca+2nGf6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899F376E6
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656878; cv=none; b=NsFKz8e1c8rSgUymj7bPrwOqKb6QRTfjX9/QRH/Om4kPg9nV48jHIMvE7Da+KZpC29CAfDFUzBTGaXn3juP57C+cWvPzQGJBMNgdXyg/HZ4BIAiAKxFDM1hqyAjmHS9QaZjhzu0/e3zPYYjdLsuMApoPXrP10XgdkUiSdpHJjs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656878; c=relaxed/simple;
	bh=82WFEoh8dI6a0Rbl//ansxOC9mSUsYdhkWeiRVQn/Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fn0jYRxL0OMpMvWKeA8k0HJcXz+ciPqh5k3M6qJ0nSJ1QhzEbKTkNk4A1Sz+UnaFCM+zFLVlqI2NpjBebQLRnBgcWUAyXF8BZkgomul1BRpaBtsfE4G8Wwhh/UAuNAQ0b4splnil1+lS9FhjDjvulG26JaYVPtE1zrefdr3Kx0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ca+2nGf6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53438aa64a4so3353339e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724656875; x=1725261675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9s80hAoba+vF/YE3Nvr8fKfluCQHu+8VdHsPUZS9vM=;
        b=Ca+2nGf6mgohEbxkJrirCdMCKV0IAz+TOKjWORQxdPW2ptfaGcRBjTm6LLpllBsI0J
         3aIgfjo4wjKzPokTwUv3x8zUWSyhCKL+6ywHiTd/yJ589tMGzTiw5U2+RA31PBGekY0e
         S/8NKBZ917eEfWU/1IaoNsC0fxgHoq+L5GThs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724656875; x=1725261675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9s80hAoba+vF/YE3Nvr8fKfluCQHu+8VdHsPUZS9vM=;
        b=mtU/Ol47CeZAjnbtR9GevLQlqhFsQPHzZR665v/FTEiLHugs7cwpVYnCRkO62Xm53r
         vHFcmBJIBPFZcq47+XT1uHjdPlEZW2HuCi+YpyYNJY9+uKELsJxacig0+9G2ZNlrbM+6
         ekticoTqnnQIRvCUyce2v52YPtf7x4Q8xh4yY7c3OyWHZCh1msM3s6Bd9ovq7b9mC5Kj
         RHgoaluOkfujuz7b9tSgeQZurIfFaZTvDSck1TjEOUVHhOSYm3TVSzyPTXp3oXOYiiwU
         vkoc8pc9lARa08wR/mmJ+1+OOqHlXQQFqq8wqlFF7TV7TUOARqnsUy4Z6m9JmNdRWbaM
         lKnA==
X-Forwarded-Encrypted: i=1; AJvYcCVdTArONHo9w3SkiXloX2F18uuOdfuz7FMdltKWMttJMl3AFj4BJDTNhzhAXHEDQnvK37A6ec8JER8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8L8Os2lQeyjZ+dq4ft53j2CoPXcto/2WaUGzt7smpnp9vN98
	eLIWsBHORxyjyTdrmWWLXyrX/ED+2tL4tgkGBAmTMNPqiApObAJzC8rpXXdzjsK+hpXU9cnZ0tQ
	9EtF4A89lSMEnozkSE0ZP3KLpO/LHKWiLZasC
X-Google-Smtp-Source: AGHT+IGihttkaipApdxajdI+u8zonSwerG1x9HLpL1VsK/H7AuQIzQB7NEiNyk7f9sK11N97AVeIrS8sEeRsiAeiSOI=
X-Received: by 2002:a05:6512:3087:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-53438868deemr6871597e87.52.1724656874411; Mon, 26 Aug 2024
 00:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-9-wenst@chromium.org>
 <ZsdJOUe44hiGur-s@smile.fi.intel.com> <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
 <ZsiWALpt1IpTHsKg@smile.fi.intel.com>
In-Reply-To: <ZsiWALpt1IpTHsKg@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Aug 2024 15:21:03 +0800
Message-ID: <CAGXv+5FzMb3fERnUwd5DF_=TqXr2_6h+n_UPpfvJc_-eu7pNYg@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 10:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 23, 2024 at 06:32:16PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 22, 2024 at 10:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +     if (!data->gpiods)
> > > > +             return 0;
> > >
> > > If it comes a new code (something else besides GPIOs and regulators) =
this
> > > will be a (small) impediment. Better to have a helper for each case a=
nd do
> > >
> > >         ret =3D ..._gpiods();
> > >         if (ret)
> > >                 ...
> > >
> > > Same for regulators and anything else in the future, if any.
> >
> > I'm not sure I follow. Do you mean wrap each individual type in a wrapp=
er
> > and call those here, like the following?
> >
> >     i2c_of_probe_enable_res(...)
> >     {
> >         ret =3D i2c_of_probe_enable_regulators(...)
> >         if (ret)
> >               return ret;
> >
> >         ret =3D i2c_of_probe_enable_gpios(...)
> >         if (ret)
> >               goto error_disable_regulators;
> >
> >         ...
> >     }
>
> Yes.
>
> ...
>
> > > > +             /*
> > > > +              * reset GPIOs normally have opposite polarity compar=
ed to
> > >
> > > "reset"
> > >
> > > > +              * enable GPIOs. Instead of parsing the flags again, =
simply
> > >
> > > "enable"
> > >
> > > > +              * set the raw value to high.
> > >
> > > This is quite a fragile assumption. Yes, it would work in 98% cases, =
but will
> > > break if it's not true somewhere else.
> >
> > Well, this seems to be the de facto standard. Or it would have to remem=
ber
> > what each GPIO descriptor's name is, and try to classify those into eit=
her
> > "enable" or "reset", and set their respective logical values to 1 or 0.
> > And then you run into a peripheral with a broken binding that has its
> > "reset" GPIO inverted, i.e. it's driver behavior needs to follow the
> > "enable" GPIO style. The class of devices this prober targets are
> > consumer electronics (laptops, tablets, phones) that at least have gone
> > through some component selection where the options won't have conflicti=
ng
> > requirements.
>
> I'm talking from real life example(s) :-)
>
> Recently I looked at the OV7251 sensor driver that expects "enable" GPIO =
while
> all users supply "reset"-as-"enable" with the exact trouble I described.
> Yet it's pure software / ABI issue in that case, but who knows what PCB
> engineers may come up with.

For the OV7251 case specifically, the current approach works fine, as the
polarity is the same: high electric level for a working chip.

But now that you mention it, camera sensors are exactly the case I had
in mind, though not the same chip. Some of the OmniVision and GalaxyCore
sensors have a "shutdown" pin that is active high, i.e. high electric
level shuts down the chip.

So I guess the alternative would be to remember each GPIO's name, and
do the appropriate thing based on the name, and also set the logical
value, not the raw value. If it says "shutdown" or "reset", set the
logical value to 0; if it says "enable", set it to 1. And hopefully
we don't run into a binding which has "shutdown" but is actually
"enable" ...

I don't have this case and I kind of want to leave it as a TODO though.
I feel like the scope of the series is expanding ever so slightly.


ChenYu

> > And if the polarities of the possible components don't line up, then th=
is
> > probe structure can't really do anything. One would need something that
> > power sequences each component separately and probes it. I would really
> > like to avoid that if possible, as it makes the boot time (to periphera=
l
> > available) dependent on which component you have and how far down the
> > list it is. We have Chromebooks that have 4 touchscreen components
> > introduced over the years. In that case something more like Doug's
> > original proposal would work better: something that forces mutual
> > exclusivity among a class of devices.
>
> Maybe. I just pointed out the potential problem.
>
> > > > +              */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

