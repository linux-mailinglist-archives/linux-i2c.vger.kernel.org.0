Return-Path: <linux-i2c+bounces-6518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67465974A2A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 08:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8891C21419
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 06:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0569878C9D;
	Wed, 11 Sep 2024 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hACQQODt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D67D3F4
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035175; cv=none; b=EpF9NMz31gylZQF/6uVyx9h+TH1RUuB+U1iZEa9iAz5CabAAi7QIq7HWtGXK9M60U87IlYcxSLVnVY6z7FrBzIoXB9Rm6ckpU7TqF9fEyLFE3hh+7ZKInFJN8DGEwfhk8US7WrSQ6lyGLDjwadE0D5TZQbdnHXL5LjHThY32yHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035175; c=relaxed/simple;
	bh=lWel3D6GMiP9Rfq6kYs4mMzndOOkGErK+hNpBxYCXh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jU2cTB4arfnCk+9jdBU7oRKkMCKbhjjtdr49ZVdAYQYH80YuGVsaXxoHACdrA2399FUHFQ4QUUCg3cHA4Jp9hRFsboDiUyXs7YfDg64wX0BzgoPj3SPY5vPFNBybxZsgoYkAAn0lHww6xjsImBM1Xthq9Jndz+Ll3FH0JUHaRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hACQQODt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-535be093a43so2158236e87.3
        for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 23:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726035172; x=1726639972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XNFzyMI6KqMDwE1IO9Ek2dtaONrpE2artFV7jstPIM=;
        b=hACQQODtdJHgQCW0ZPco3c1Ge3TOnTTBm4nXJnQnBuddDSQhjAEdhviZeIG4XZTa3B
         Z34qWxrlMIVTgFRTTIu99xjEIi9sCS+RDwfdLBFsNg8suwcX85djXu0IkkPDKfkIcQmO
         gI7cgbeO4JzY28u56wxHpqGt+jzusnVZfAuvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035172; x=1726639972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XNFzyMI6KqMDwE1IO9Ek2dtaONrpE2artFV7jstPIM=;
        b=ITU+wLKp0eVklNpaB5Ef2DM1/IUU4WWYpOZ9BaZfFrcHS5z2I7RPpm6ZMeem/fYenX
         Pv8Mjvm5rtX+77VnnM9Ygl2R8ag/17REfZ3ER0LBrB2bpdV8p/IcTG51f1LNppN+uPLG
         0zut3g09JqMLP+2xQzL0dxpGtf62LChXHE5lurHQBtzK0/NAa3no1Ww+2wNCEx5hiP5L
         hy8ArwyBy+JgqCWYVHTeJ4djZYwbUeFlub4Yl8TG+jZk6cDKlfMnLzlOKrKaFqd1Jl/A
         I9tVmAFdl5lj9de/oJmEeeZiAWPKycbEM6PQwlTGUvHXsVJEP1b5zkD13TcqeNdiPqta
         CNgg==
X-Forwarded-Encrypted: i=1; AJvYcCWhdc25B5mKrR8dwOyV2Gh02OkjVXLYyJGhSPAuTBuXENydCwvVSMll7AKajwJXtpXhA2ylgA37vtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEKg5v7Wpj5+prdiw0e5evYS4RT/mMNjdiIby12V1sudsb3A9
	BUGL6Ibpg5WXQf3V4rWGNu1o477A/zQjrkX4u+9r5SFomXCjh7ipfd01YVNY12wrWhTdS95zT35
	ScIwiO5JDQHw+tM0Bd3nIw+8PpT+RWxkt+8RH
X-Google-Smtp-Source: AGHT+IESpl9e5qogMXjCi+PCfTVtTiD2A76c7HZC3GBajms5nyfib2OnEjFoW3h6xIM0cWiUrvCKreVPmCVCrosR47U=
X-Received: by 2002:a05:6512:e85:b0:536:53f0:2f8e with SMTP id
 2adb3069b0e04-53673c96a8fmr856177e87.37.1726035171499; Tue, 10 Sep 2024
 23:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
 <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com> <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
In-Reply-To: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Sep 2024 14:12:40 +0800
Message-ID: <CAGXv+5G9pMOU+SZpNH=Rk31wnhADQc3MTm4TjykmdGb=WXdVDw@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 8:30=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Sep 5, 2024 at 8:45=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > > > IIUC we could have the "options" data structure have much more boar=
d
> > > > specific information:
> > > >
> > > >   - name of node to fetch resources (regulator supplies and GPIOs) =
from
> > > >   - names of the resources for the node given from the previous ite=
m
> > > >   - delay time after each resource is toggled
> > > >   - polarity in the case of GPIOs
> > > >   - prober callback to do power sequencing
> > > >
> > > > The "resource collection" step would use the first two items to ret=
rieve
> > > > the regulator supplies and GPIOS instead of the bulk APIs used righ=
t now.
> > > >
> > > > The power sequencing callback would use the resources combined with=
 the
> > > > given delays to enable the supplies and toggle the GPIOs.
> > > >
> > > > For now I would probably only implement a generic one regulator sup=
ply
> > > > plus one GPIO helper. That is the common case for touchscreens and
> > > > trackpads connected over a ribbon cable.
> > > >
> > > > Does that sound like what you have in mind?
> > >
> > > I guess I'd have to see how the code looks to know for sure, but if I
> > > understand it sounds a little awkward. Specifically, the "options"
> > > sound like they might become complicated enough that you're inventing
> > > your own little programming language (with delays, abilities to drive
> > > pins low and high, abilities to turn on/off clocks, and abilities to
> > > turn off/on regulators) and then probers need to code up their
> > > programs in this language. You also need to handle undoing things
> > > properly if there is a failure in the middle. Like your "program"
> > > would look like this (obviously you'd have to play with enums more,
> > > but you get the idea):
> > >
> > > {
> > >    { OPCODE_TURN_REGULATOR_ON, "vdd" },
> > >    { OPCODE_DELAY, 10 },
> > >    { OPCODE_GPIO_ASSERT, "reset" },
> > >    { OPCODE_DELAY, 5 },
> > >    { OPCODE_GPIO_DEASSERT "reset" },
> > >    { OPCODE_DELAY, 100 },
> > >    { OPCODE_TURN_REGULATOR_ON, "vddIO" },
> > > }
> > >
> > > Why not just expect the board probers to write C code to turn things
> > > on before looking for i2c devices, then provide helpers to the C code=
?
> > >
> > > So there wouldn't be some generic "resource collection" API, but you'=
d
> > > provide a helper to make it easy to grab regulators from one of the
> > > nodes by name. If you think bulk enabling regulators is common then
> > > you could make a helper that grabs all of the regulators from a node
> > > in a way that is consistent with the bulk APIs, but I wouldn't expect
> > > every driver to use that since devices I've seen expect regulators to
> > > be enabled in a very specific order even if they don't need a delay
> > > between them.
> > >
> > > I wouldn't expect a "collect all GPIOs" API because it seems really
> > > weird to me that we'd ever want to jam multiple GPIOs in a state
> > > without knowing exactly which GPIO was what and asserting them in the
> > > right sequence.
> >
> > So I'm slightly confused, as it sounds like at this point the i2c probe=
r
> > would be litter more than just a framework, and the heavy lifting is to
> > be all done by callbacks provided by the board-specific driver?
> >
> > So the framework becomes something like:
> >
> > 1. find i2c bus node
> > 2. call provided callback with i2c bus node to gather resources;
> >    let callback handle specifics
> > 3. call provided callback to enable resources
> > 4. for each i2c component, call provided callback to probe
>
> I don't think I'd do it as callbacks but just have the HW prober call
> the functions directly. AKA, instead of doing:
>
>   i2c_of_probe_component(dev, "touchscreen", ts_opts, ts_callbacks);
>
> Do:
>
>   grab_touchscreen_resources(...);
>   power_on_touchscreens(...);
>   i2c_of_probe_component(...);
>   power_off_touchscreen(...);
>   release_touchscreen_resources(...);
>
> Obviously I'm spitballing here, though. Without writing the code it's
> hard for me to know that my proposal would be better, but my gut tells
> me that trying to write something overly generic with lots of options
> / callbacks would be more confusing.

The helpers would be exported along with the framework, so there's nothing
preventing others from using the helpers directly. The framework provides
boilerplate so that scenarios fitting it won't have to duplicate the code.
Obviously I'm basing it on my scenario here, but I think it works out for
the simpler cases.

I'll send out what I have reworked, and we can continue the discussion
either on the mailing list or in person at ELCE and Plumbers.

> >   If the probe succeeded:
> >
> >     5. call provided callback for early release of resources (GPIOs)
> >     6. set "status" to "okay"
> >     7. call provided callback for late release of resources (regulators=
)
> >
> >   Otherwise at the end of the loop
> >
> > 8. release resources
> >
> > The current code can be reworked into helpers for steps 2, 3, 5, 7 for
> > the single regulator single GPIO case.
> >
> > > > This next item would be a later enhancement (which isn't implemente=
d in
> > > > this series anyway):
> > > >
> > > >   - optional prober callback that does actual probing
> > > >
> > > > In our case it would only be used for cases where an HID-over-I2C
> > > > component shares the same address as a non-HID one, and some extra
> > > > work is needed to determine which type it is. I still need to think
> > > > about the structure of this.
> > >
> > > IMO _that_ would be a great option to the i2c prober. It feels like
> > > you could have an optional register read that needs to match to have
> > > the i2c prober succeed. Most people would leave it blank (just the i2=
c
> > > device existing is enough) but probably a single register read would
> > > be enough to confirm you got the right device. Most i2c devices have
> > > some sort of "version" / "vendor" / "id" type register somewhere.
> >
> > At least for the stuff that we have (touchscreens and trackpads) such
> > registers typically don't exist, unless it's an HID-over-I2C device,
> > in which case there's the standard HID descriptor at some address.
> > But, yeah, reading the HID descriptor was the use case I had in mind.
> >
> > At least for one Chromebooks it's a bit more tricky because that one
> > HID-over-I2C component shares the same address as a non-HID one. We
> > currently have different SKU IDs and thus different device trees for
> > them, but we could make the prober work with this. It just has be able
> > to tell if the component it's currently probing needs the special
> > prober and is it responding correctly. This bit I need to think about.
>
> I guess Mark Brown also thought that there wouldn't be some magic
> register, but my gut still tells me that most i2c devices have some
> way to confirm that they are what you expect even if it's not an
> official "vendor" or "version" register. Some type of predictable
> register at a predictable location that you could use, at least if you
> knew all of the options that someone might stuff.
>
> For instance, in elan trackpads you can see elan_i2c_get_product_id().
> That just reads a location (ETP_I2C_UNIQUEID_CMD =3D 0x0101) that could
> theoretically be used to figure out (maybe in conjunction with other
> registers) that it's an elan trackpad instead of an i2c-hid one. You'd
> have to (of course) confirm that an i2c-hid device wouldn't somehow
> return back data from this read that made it look like an elan
> trackpad, but it feels like there ought to be some way to figure it
> out with a few i2c register reads.
>
> ...that being said, I guess my original assertion that you might be
> able to figure out with a simple register read was naive and you'd
> actually need a function (maybe as a callback) to figure this out.

Yeah, that's my plan for a follow-up series, likely after the SKU ID
based prober work is done. The actual probe function would likely only
target the known cases of I2C address conflicts we have on ChromeOS
devices.

