Return-Path: <linux-i2c+bounces-6291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00896E861
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 05:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6D91F24CD7
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 03:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3963D96A;
	Fri,  6 Sep 2024 03:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dbdVFCKg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143573B1A2
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 03:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594350; cv=none; b=uOut6eOD+d10z4+Q76Rl3A/QmpXr+QudGJA0lBwLqKRKGtXNZlbwZ3JzsIs2pdb8fbm1G1psSACwKbSSg79QDE9mz/fUL+O731rcNSvCiEC4rAC/FN4e0ikLTugOGWO3VbnGWtyzd1GPkD3KRjFPcyjVhAQJnCBW6vcQ/fTLQds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594350; c=relaxed/simple;
	bh=Y5loWRXWbahmV7nqTNvR3j2wD04YWClhrnUeryXAWXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoVvSQKMSgC/MKfek/dVpSWB0Fxw7Ww8L5T20yc3nZp9xSbwGj6hus/ogBPoQk9FZc3noSxyXS/n5zwTOz069o5kokpzEcp0H9TFU5oTEf0cRaiDg1M62S8mAzRutMWuEV+OXf8gDO9UJ7rPVqP7Qf9bYJEY7YKwM4xPhecY7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dbdVFCKg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-535dc4ec181so1447672e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 20:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725594345; x=1726199145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQg6ZHV3OdQlAidOiVD+50gKZuem+V/huVxuvPthNh0=;
        b=dbdVFCKgGnxqbphFl/yng0t4e8l7AmUdFGIcVgKmdymLLcdcq0u7IMig6aZ2a0XiYX
         B75udrLv64nznzykwJM/SheWjIMo9UulzN3bQ07aZZMjAZTZrJscky3YGvbit3K8ZA/8
         Fhd3iev27C1+Y/zb1En4Xcj5bozOuD+KFWCko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725594345; x=1726199145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQg6ZHV3OdQlAidOiVD+50gKZuem+V/huVxuvPthNh0=;
        b=dyoW5Pm+/DQjlmWZ3L4XTgoWc8cYGGL2vzgz/9oqe6tUe6sPoYzWkJ1F2fxD601HVF
         cwyK5Pder3+WFCO8QD8CmQ2UfSVRnA5M8KATrcWQupydPkSCQn6YDnPPtyrO/5kJvC2C
         26I9d8dEmKsH2xratPrfi9C1q1GEhHo5ixmUFhhDxKOxvzzorX9j+402OXGUSDasDSlX
         bJmdkZAH6otWpJQj2i6qLQZlY0pjefJwNhEc7p5m1d36ik/NqjBgPrD/DAkt9Bl9IdAV
         NFDfjok1DVPJx9eT3S96xsrNZcKZEI2RmUi2iVlJh6HTBPYDdcAQEMzS/MMsA7UPfkCJ
         trzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbaMH2Yn38tLJjxtWXEr1bW5ijGVwANS7N1OlVx+hbaTg5S0AacPWcMbVW1D/aNUMQgOEmgWeuFlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSMhwKgfEjH1ZfyXa6R6H9MmZ9p09gebBdyjWqX32zcQBEKmz
	0y4LfDzjLb9flu7mgIjpFaSm2SLQAsVWXybhIleO6hqZ1yuptXGz0xO9NOHiY49248LkRVvTxQ3
	8xZ9AnutZ2BdZcJZeOKMvSz0TLQoDiKRjQv4A
X-Google-Smtp-Source: AGHT+IG243ompPdx0bSLx60HLWBy1dMFQGFZ33UY1sxTQVuYCfEAueQxhuwkLwa9fvxCvh+SDZnngn0Tw4cydJcut8A=
X-Received: by 2002:a05:6512:3c96:b0:536:54bd:8375 with SMTP id
 2adb3069b0e04-536587c54bcmr603777e87.33.1725594344775; Thu, 05 Sep 2024
 20:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com> <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
In-Reply-To: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Sep 2024 11:45:32 +0800
Message-ID: <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
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

On Fri, Sep 6, 2024 at 2:15=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Sep 5, 2024 at 8:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > On Thu, Sep 5, 2024 at 6:57=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > > >
> > > > This adds regulator management to the I2C OF component prober.
> > > > Components that the prober intends to probe likely require their
> > > > regulator supplies be enabled, and GPIOs be toggled to enable them =
or
> > > > bring them out of reset before they will respond to probe attempts.
> > > > GPIOs will be handled in the next patch.
> > > >
> > > > Without specific knowledge of each component's resource names or
> > > > power sequencing requirements, the prober can only enable the
> > > > regulator supplies all at once, and toggle the GPIOs all at once.
> > > > Luckily, reset pins tend to be active low, while enable pins tend t=
o
> > > > be active high, so setting the raw status of all GPIO pins to high
> > > > should work. The wait time before and after resources are enabled
> > > > are collected from existing drivers and device trees.
> > > >
> > > > The prober collects resources from all possible components and enab=
les
> > > > them together, instead of enabling resources and probing each compo=
nent
> > > > one by one. The latter approach does not provide any boot time bene=
fits
> > > > over simply enabling each component and letting each driver probe
> > > > sequentially.
> > > >
> > > > The prober will also deduplicate the resources, since on a componen=
t
> > > > swap out or co-layout design, the resources are always the same.
> > > > While duplicate regulator supplies won't cause much issue, shared
> > > > GPIOs don't work reliably, especially with other drivers. For the
> > > > same reason, the prober will release the GPIOs before the successfu=
lly
> > > > probed component is actually enabled.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > > Changes since v5:
> > > > - Split of_regulator_bulk_get_all() return value check and explain
> > > >   "ret =3D=3D 0" case
> > > > - Switched to of_get_next_child_with_prefix_scoped() where applicab=
le
> > > > - Used krealloc_array() instead of directly calculating size
> > > > - copy whole regulator array in one memcpy() call
> > > > - Drop "0" from struct zeroing initializer
> > > > - Split out regulator helper from i2c_of_probe_enable_res() to keep
> > > >   code cleaner when combined with the next patch
> > > > - Added options for customizing power sequencing delay
> > > > - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulator=
s()
> > > > - Add i2c_of_probe_free_regulator() helper
> > > >
> > > > Changes since v4:
> > > > - Split out GPIO handling to separate patch
> > > > - Rewrote using of_regulator_bulk_get_all()
> > > > - Replaced "regulators" with "regulator supplies" in debug messages
> > > >
> > > > Changes since v3:
> > > > - New patch
> > > >
> > > > This change is kept as a separate patch for now since the changes a=
re
> > > > quite numerous.
> > > > ---
> > > >  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++=
++--
> > > >  include/linux/i2c.h              |  10 +-
> > > >  2 files changed, 155 insertions(+), 9 deletions(-)
> > >
> > > I never jumped back into looking at this since you started sending ne=
w
> > > versions last month (sorry), but I finally did...
> > >
> > > At a high level, I have to say I'm not really a fan of the "reach int=
o
> > > all of the devices, jam their regulators on, force their GPIOs high,
> > > and hope for the best" approach. It just feels like it's going to
> > > break at the first bit of slightly different hardware and cause power
> > > sequence violations left and right. If nothing else, regulators often
> > > need delays between when one regulator is enabled and the next. There
> > > may also be complex relationships between regulators and GPIOs, GPIOs=
,
> > > GPIOs that need to be low, or even GPIO "toggle sequences" (power on
> > > rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
> > > rail 2).
> > >
> > > IMO the only way to make this reliable is to have this stuff be much
> > > less automatic and much more driven by the board.
> > >
> > > I think that, in general, before the board prober checks i2c address
> > > then the prober should be in charge of setting up pinctrl and turning
> > > on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
> > > may be specified by different children, the prober will just have to
> > > pick one child to find those resources. It should have enough
> > > board-specific knowledge to make this choice. Then the prober should
> > > turn them on via a board-specific power-on sequence that's known to
> > > work for all the children. Then it should start probing.
> > >
> > > I think there can still be plenty of common helper functions that the
> > > board-specific prober can leverage, but overall I'd expect the actual
> > > power-on and power-off code to be board-specific.
> > >
> > > If many boards have in common that we need to turn on exactly one
> > > regulator + one GPIO, or just one regulator, or whatever then having =
a
> > > helper function that handles these cases is fine. ...but it should be
> > > one of many choices that a board proper could use and not the only
> > > one.
> >
> > IIUC we could have the "options" data structure have much more board
> > specific information:
> >
> >   - name of node to fetch resources (regulator supplies and GPIOs) from
> >   - names of the resources for the node given from the previous item
> >   - delay time after each resource is toggled
> >   - polarity in the case of GPIOs
> >   - prober callback to do power sequencing
> >
> > The "resource collection" step would use the first two items to retriev=
e
> > the regulator supplies and GPIOS instead of the bulk APIs used right no=
w.
> >
> > The power sequencing callback would use the resources combined with the
> > given delays to enable the supplies and toggle the GPIOs.
> >
> > For now I would probably only implement a generic one regulator supply
> > plus one GPIO helper. That is the common case for touchscreens and
> > trackpads connected over a ribbon cable.
> >
> > Does that sound like what you have in mind?
>
> I guess I'd have to see how the code looks to know for sure, but if I
> understand it sounds a little awkward. Specifically, the "options"
> sound like they might become complicated enough that you're inventing
> your own little programming language (with delays, abilities to drive
> pins low and high, abilities to turn on/off clocks, and abilities to
> turn off/on regulators) and then probers need to code up their
> programs in this language. You also need to handle undoing things
> properly if there is a failure in the middle. Like your "program"
> would look like this (obviously you'd have to play with enums more,
> but you get the idea):
>
> {
>    { OPCODE_TURN_REGULATOR_ON, "vdd" },
>    { OPCODE_DELAY, 10 },
>    { OPCODE_GPIO_ASSERT, "reset" },
>    { OPCODE_DELAY, 5 },
>    { OPCODE_GPIO_DEASSERT "reset" },
>    { OPCODE_DELAY, 100 },
>    { OPCODE_TURN_REGULATOR_ON, "vddIO" },
> }
>
> Why not just expect the board probers to write C code to turn things
> on before looking for i2c devices, then provide helpers to the C code?
>
> So there wouldn't be some generic "resource collection" API, but you'd
> provide a helper to make it easy to grab regulators from one of the
> nodes by name. If you think bulk enabling regulators is common then
> you could make a helper that grabs all of the regulators from a node
> in a way that is consistent with the bulk APIs, but I wouldn't expect
> every driver to use that since devices I've seen expect regulators to
> be enabled in a very specific order even if they don't need a delay
> between them.
>
> I wouldn't expect a "collect all GPIOs" API because it seems really
> weird to me that we'd ever want to jam multiple GPIOs in a state
> without knowing exactly which GPIO was what and asserting them in the
> right sequence.

So I'm slightly confused, as it sounds like at this point the i2c prober
would be litter more than just a framework, and the heavy lifting is to
be all done by callbacks provided by the board-specific driver?

So the framework becomes something like:

1. find i2c bus node
2. call provided callback with i2c bus node to gather resources;
   let callback handle specifics
3. call provided callback to enable resources
4. for each i2c component, call provided callback to probe

  If the probe succeeded:

    5. call provided callback for early release of resources (GPIOs)
    6. set "status" to "okay"
    7. call provided callback for late release of resources (regulators)

  Otherwise at the end of the loop

8. release resources

The current code can be reworked into helpers for steps 2, 3, 5, 7 for
the single regulator single GPIO case.

> > This next item would be a later enhancement (which isn't implemented in
> > this series anyway):
> >
> >   - optional prober callback that does actual probing
> >
> > In our case it would only be used for cases where an HID-over-I2C
> > component shares the same address as a non-HID one, and some extra
> > work is needed to determine which type it is. I still need to think
> > about the structure of this.
>
> IMO _that_ would be a great option to the i2c prober. It feels like
> you could have an optional register read that needs to match to have
> the i2c prober succeed. Most people would leave it blank (just the i2c
> device existing is enough) but probably a single register read would
> be enough to confirm you got the right device. Most i2c devices have
> some sort of "version" / "vendor" / "id" type register somewhere.

At least for the stuff that we have (touchscreens and trackpads) such
registers typically don't exist, unless it's an HID-over-I2C device,
in which case there's the standard HID descriptor at some address.
But, yeah, reading the HID descriptor was the use case I had in mind.

At least for one Chromebooks it's a bit more tricky because that one
HID-over-I2C component shares the same address as a non-HID one. We
currently have different SKU IDs and thus different device trees for
them, but we could make the prober work with this. It just has be able
to tell if the component it's currently probing needs the special
prober and is it responding correctly. This bit I need to think about.


ChenYu

