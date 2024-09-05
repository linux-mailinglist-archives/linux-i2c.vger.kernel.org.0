Return-Path: <linux-i2c+bounces-6270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF996E1B4
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9340D1C23ABD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 18:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3647017C98A;
	Thu,  5 Sep 2024 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hUm8dU8k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73418037
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725560120; cv=none; b=HoaPLNlRcWsP4LxmFV8rtuFS0ITSCNF7e2u3ugoMO/JVPmldCLSUSphSrhShwCyAXtc65Io2KCZkWSjnKCr/GICWNCg3bw9xgTrYR40fntG0jEWqGaPKRBRNlilAiKl11cRjJjuZEyc5MbphiPhsATI4Th3DcXvHDEpjZjwYzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725560120; c=relaxed/simple;
	bh=nDG3UDzOVaSdxvk0JLqS43cmf8Hv19su6jsAk51mwWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZsyp0kRLu9+9kdcSrl4daJt88mBUioAPArG6OHlj4e4LcW08gg6MZMt3gIuzcGaFi3X0XGeiYWdBfNfT9NV4oplEeftxTzi6wQO1V7MvRT2+YYquQAP2K5UL/THQM3RAzaHEYAp+48bob4KhH6w3U38s6+6xdPyf/S8R1NS2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hUm8dU8k; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a977bf0290so72478585a.3
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 11:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725560115; x=1726164915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqMkVgPFvnHANIyPGIBBKdw4kieVUrc29sSkj0u1A2s=;
        b=hUm8dU8k72fZ/bXAoNn0Cqj9HiaIJcwwfZiiLg78LZKdOy8tpPV78LrL0el83tKwSd
         5LaDg7dRALtO5VaDTI1NkCHqcoUu26v3oMhOmKijnyf+bQfLEEniJpbo51zqaOo7kuzA
         AAYP2vBGGoYh5lwemdisvxY/5ITvBcQL5sn70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725560115; x=1726164915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqMkVgPFvnHANIyPGIBBKdw4kieVUrc29sSkj0u1A2s=;
        b=dl7P84M615+o/S9/SvBSYaWxHC7JJTP8AmjILh5Gz9uMCyDNps1qjbCzBHH7L+gg/C
         2Q65dhCQWs09sCVcnyh+A70WeVZbfgsi8um+C6y9UIs8c2dbZL5t0lxXQi30tjmzAZhr
         FfxkKxMUMFIsGp3EohHMw9ZxUudMsNaqIdfKUR1L0YzTK0W2XwFKKi8RNVh8czP//QG0
         NIiujYYWs9uNKzClLZrEf+dJ8MHTFUGaDBEwedDxSL/d6SdiaoLwN4Zv6C+mdP+6AdED
         lJDUXLckWeavkjGbst1ZdnriMpxmeUHR3rCMe5/tbQIpAzDGi0iH1C/qJMeCBtEFQyRS
         e04w==
X-Forwarded-Encrypted: i=1; AJvYcCWUot2QP30q9IHO+eWkOHyF5MXQvVVk5f7A8bfyTotlxLpluCl6KRbV4ZlxW8pJuI9jgMphtttEhZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUacnumCfCGOWanzTh43qheUMMQ4hCjatLGMR5MsC3soKkiEx
	0hXUfpz3AQtbGMiOiAAuaduq9S7wJPoa+UNjgwpszMDdeERqN94PkT/xF8JE1uMCJdZ5IHgOa8E
	=
X-Google-Smtp-Source: AGHT+IEAaWOf8U4anLdO//E1M9BdO7EM2s+SgIrjgZwsB45ovSuITbvpjPqLp1tjeHw4BoTFgMAHRQ==
X-Received: by 2002:a05:620a:1a85:b0:7a2:c13:458d with SMTP id af79cd13be357-7a8041de72bmr2907467385a.42.1725560114736;
        Thu, 05 Sep 2024 11:15:14 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98f00ad85sm95336585a.101.2024.09.05.11.15.13
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 11:15:13 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c34c2a7dc7so5836166d6.3
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 11:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVInmxq/iewFcHzlo2R8Zq7CfnELKebyDWVkT8nG4VBMkX1EKQR5EHdSZVani/5aDM8diYoiBYlMJI=@vger.kernel.org
X-Received: by 2002:a05:6214:3a8a:b0:6c3:5cf1:e5b2 with SMTP id
 6a1803df08f44-6c35cf1e7ddmr191248766d6.29.1725560112825; Thu, 05 Sep 2024
 11:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com> <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
In-Reply-To: <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Sep 2024 11:14:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Message-ID: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hi,

On Thu, Sep 5, 2024 at 8:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Thu, Sep 5, 2024 at 6:57=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> > >
> > > This adds regulator management to the I2C OF component prober.
> > > Components that the prober intends to probe likely require their
> > > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > > bring them out of reset before they will respond to probe attempts.
> > > GPIOs will be handled in the next patch.
> > >
> > > Without specific knowledge of each component's resource names or
> > > power sequencing requirements, the prober can only enable the
> > > regulator supplies all at once, and toggle the GPIOs all at once.
> > > Luckily, reset pins tend to be active low, while enable pins tend to
> > > be active high, so setting the raw status of all GPIO pins to high
> > > should work. The wait time before and after resources are enabled
> > > are collected from existing drivers and device trees.
> > >
> > > The prober collects resources from all possible components and enable=
s
> > > them together, instead of enabling resources and probing each compone=
nt
> > > one by one. The latter approach does not provide any boot time benefi=
ts
> > > over simply enabling each component and letting each driver probe
> > > sequentially.
> > >
> > > The prober will also deduplicate the resources, since on a component
> > > swap out or co-layout design, the resources are always the same.
> > > While duplicate regulator supplies won't cause much issue, shared
> > > GPIOs don't work reliably, especially with other drivers. For the
> > > same reason, the prober will release the GPIOs before the successfull=
y
> > > probed component is actually enabled.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Changes since v5:
> > > - Split of_regulator_bulk_get_all() return value check and explain
> > >   "ret =3D=3D 0" case
> > > - Switched to of_get_next_child_with_prefix_scoped() where applicable
> > > - Used krealloc_array() instead of directly calculating size
> > > - copy whole regulator array in one memcpy() call
> > > - Drop "0" from struct zeroing initializer
> > > - Split out regulator helper from i2c_of_probe_enable_res() to keep
> > >   code cleaner when combined with the next patch
> > > - Added options for customizing power sequencing delay
> > > - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators(=
)
> > > - Add i2c_of_probe_free_regulator() helper
> > >
> > > Changes since v4:
> > > - Split out GPIO handling to separate patch
> > > - Rewrote using of_regulator_bulk_get_all()
> > > - Replaced "regulators" with "regulator supplies" in debug messages
> > >
> > > Changes since v3:
> > > - New patch
> > >
> > > This change is kept as a separate patch for now since the changes are
> > > quite numerous.
> > > ---
> > >  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++=
--
> > >  include/linux/i2c.h              |  10 +-
> > >  2 files changed, 155 insertions(+), 9 deletions(-)
> >
> > I never jumped back into looking at this since you started sending new
> > versions last month (sorry), but I finally did...
> >
> > At a high level, I have to say I'm not really a fan of the "reach into
> > all of the devices, jam their regulators on, force their GPIOs high,
> > and hope for the best" approach. It just feels like it's going to
> > break at the first bit of slightly different hardware and cause power
> > sequence violations left and right. If nothing else, regulators often
> > need delays between when one regulator is enabled and the next. There
> > may also be complex relationships between regulators and GPIOs, GPIOs,
> > GPIOs that need to be low, or even GPIO "toggle sequences" (power on
> > rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
> > rail 2).
> >
> > IMO the only way to make this reliable is to have this stuff be much
> > less automatic and much more driven by the board.
> >
> > I think that, in general, before the board prober checks i2c address
> > then the prober should be in charge of setting up pinctrl and turning
> > on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
> > may be specified by different children, the prober will just have to
> > pick one child to find those resources. It should have enough
> > board-specific knowledge to make this choice. Then the prober should
> > turn them on via a board-specific power-on sequence that's known to
> > work for all the children. Then it should start probing.
> >
> > I think there can still be plenty of common helper functions that the
> > board-specific prober can leverage, but overall I'd expect the actual
> > power-on and power-off code to be board-specific.
> >
> > If many boards have in common that we need to turn on exactly one
> > regulator + one GPIO, or just one regulator, or whatever then having a
> > helper function that handles these cases is fine. ...but it should be
> > one of many choices that a board proper could use and not the only
> > one.
>
> IIUC we could have the "options" data structure have much more board
> specific information:
>
>   - name of node to fetch resources (regulator supplies and GPIOs) from
>   - names of the resources for the node given from the previous item
>   - delay time after each resource is toggled
>   - polarity in the case of GPIOs
>   - prober callback to do power sequencing
>
> The "resource collection" step would use the first two items to retrieve
> the regulator supplies and GPIOS instead of the bulk APIs used right now.
>
> The power sequencing callback would use the resources combined with the
> given delays to enable the supplies and toggle the GPIOs.
>
> For now I would probably only implement a generic one regulator supply
> plus one GPIO helper. That is the common case for touchscreens and
> trackpads connected over a ribbon cable.
>
> Does that sound like what you have in mind?

I guess I'd have to see how the code looks to know for sure, but if I
understand it sounds a little awkward. Specifically, the "options"
sound like they might become complicated enough that you're inventing
your own little programming language (with delays, abilities to drive
pins low and high, abilities to turn on/off clocks, and abilities to
turn off/on regulators) and then probers need to code up their
programs in this language. You also need to handle undoing things
properly if there is a failure in the middle. Like your "program"
would look like this (obviously you'd have to play with enums more,
but you get the idea):

{
   { OPCODE_TURN_REGULATOR_ON, "vdd" },
   { OPCODE_DELAY, 10 },
   { OPCODE_GPIO_ASSERT, "reset" },
   { OPCODE_DELAY, 5 },
   { OPCODE_GPIO_DEASSERT "reset" },
   { OPCODE_DELAY, 100 },
   { OPCODE_TURN_REGULATOR_ON, "vddIO" },
}

Why not just expect the board probers to write C code to turn things
on before looking for i2c devices, then provide helpers to the C code?

So there wouldn't be some generic "resource collection" API, but you'd
provide a helper to make it easy to grab regulators from one of the
nodes by name. If you think bulk enabling regulators is common then
you could make a helper that grabs all of the regulators from a node
in a way that is consistent with the bulk APIs, but I wouldn't expect
every driver to use that since devices I've seen expect regulators to
be enabled in a very specific order even if they don't need a delay
between them.

I wouldn't expect a "collect all GPIOs" API because it seems really
weird to me that we'd ever want to jam multiple GPIOs in a state
without knowing exactly which GPIO was what and asserting them in the
right sequence.


> This next item would be a later enhancement (which isn't implemented in
> this series anyway):
>
>   - optional prober callback that does actual probing
>
> In our case it would only be used for cases where an HID-over-I2C
> component shares the same address as a non-HID one, and some extra
> work is needed to determine which type it is. I still need to think
> about the structure of this.

IMO _that_ would be a great option to the i2c prober. It feels like
you could have an optional register read that needs to match to have
the i2c prober succeed. Most people would leave it blank (just the i2c
device existing is enough) but probably a single register read would
be enough to confirm you got the right device. Most i2c devices have
some sort of "version" / "vendor" / "id" type register somewhere.

-Doug

