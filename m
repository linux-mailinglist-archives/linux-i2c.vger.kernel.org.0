Return-Path: <linux-i2c+bounces-6257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFE96DD9E
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C15371C259B5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69321A0714;
	Thu,  5 Sep 2024 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="irx+YzsE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97121198E84
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549050; cv=none; b=fmsHeXQK4Z9QGu/85O8LPpNWzAsQ2IA3NSOV5ejL9dxduB4zRZiOJ9IxND+MNdS9yC/GN5zbXueMKYXvjm+XV00FuApkPFMjJDaqTcuEh4O6Sk9XJK/nnXcH0brWrOPdb1dpzrVioduCTfF9dKzQ3kicnSIbUJX08cr+ikLPNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549050; c=relaxed/simple;
	bh=Jg419JiaVpr39nxDzhXqFqCEex8GnrqdC99ZhI00XOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqsYMUgKpVazqsJHkYPa8tQD9jPTALMmkOJ5PHsiPrut+27reT7izN+gLnNQ6SxEIaVQ8gMyynSn25ZEOmhHtHi3/NNbVgJ18AbBV2wbIPPRDjRimevJq1dafJKCZp1tO5Kq+UA0MqxlF66Yd+JJZ5EKkVwSLbRSzes/vW+bxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=irx+YzsE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f4f2868783so11397151fa.2
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725549047; x=1726153847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbZG96yCjg3dP1dRLPb67mYWLsYBymVv/aX2fCRRjEc=;
        b=irx+YzsEk/aIPL7RCnfn9yvgdduNyYInq+jtgInIwpoH4G51G0Z0aNztvxfLqZ93jx
         +k9hwFBZtcXRt98dzBfXiQ9fO5P/tFVnH9yQ0P/gOGVGeGgItvEiikCqx67sst//nSDH
         hPNwydwMfHYqGT3P0JcYVgHvGDAtywkbUCmiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725549047; x=1726153847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbZG96yCjg3dP1dRLPb67mYWLsYBymVv/aX2fCRRjEc=;
        b=RAXU3lWpTI5MOFanqrrL/NJHbM18zjOOtX3noNUssCdLMw6OyF4D9M0ySjTGRvKD2k
         P859TFiRlnW0yAZ+DON70Ju+VkAuJToygskAwbBKWltdO4CUqFMjhk9Aj8tV+OHyv4RJ
         J+toJZ9CnjoX4rn54jAEqytqiP3I0H4oax2dR42XwvJSucX5ppa7aZvm7XGu3O0bJa2g
         gT1rlDi30PYiprm/wZgaMS04vyTL+KVwzCfi1YTpQuYNiatZrCzi4BPqXsLbUY0d3Yp2
         eqHmGjpYZvXvj05vtNP/ktE2bOsYyePgpzpKy31HwoKkJIOrYoz7QYvA0wUEm8PMcgmR
         UUxA==
X-Forwarded-Encrypted: i=1; AJvYcCWZtkPg9ckhbC248VIDAK0HsqqdSp0ZhIl2r8RXWALiPLvZDJfIaPi7lFbwYqWeMsxYSuZ3veKMP9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7G1E6NHqmIl5AN6C+rPb0NZT55vrufYa2BDRb0nbYd60GuOe5
	D/UxRNPzbjifs9B49pk9FVlruZFSZYbb4jXXIK6r+Djg9Z0Mt29PRQNp1pS4wAMZeZJ8LwvmgNT
	8JeVjmM0a8RdrdwvtDCMcXv5V2rTwHXzHOQvE
X-Google-Smtp-Source: AGHT+IEoyY9FAQCs2QvyohjteVuKx8qEJUbTxgD4g5/TL4wAkdAbEbByYe9g569nCl27ndm/hY5F+Ctp+XibXgbNBjM=
X-Received: by 2002:a2e:f1a:0:b0:2f6:5f7b:e5e0 with SMTP id
 38308e7fff4ca-2f65f7be680mr30625541fa.21.1725549046375; Thu, 05 Sep 2024
 08:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 23:10:34 +0800
Message-ID: <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
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

On Thu, Sep 5, 2024 at 6:57=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > This adds regulator management to the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > GPIOs will be handled in the next patch.
> >
> > Without specific knowledge of each component's resource names or
> > power sequencing requirements, the prober can only enable the
> > regulator supplies all at once, and toggle the GPIOs all at once.
> > Luckily, reset pins tend to be active low, while enable pins tend to
> > be active high, so setting the raw status of all GPIO pins to high
> > should work. The wait time before and after resources are enabled
> > are collected from existing drivers and device trees.
> >
> > The prober collects resources from all possible components and enables
> > them together, instead of enabling resources and probing each component
> > one by one. The latter approach does not provide any boot time benefits
> > over simply enabling each component and letting each driver probe
> > sequentially.
> >
> > The prober will also deduplicate the resources, since on a component
> > swap out or co-layout design, the resources are always the same.
> > While duplicate regulator supplies won't cause much issue, shared
> > GPIOs don't work reliably, especially with other drivers. For the
> > same reason, the prober will release the GPIOs before the successfully
> > probed component is actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Split of_regulator_bulk_get_all() return value check and explain
> >   "ret =3D=3D 0" case
> > - Switched to of_get_next_child_with_prefix_scoped() where applicable
> > - Used krealloc_array() instead of directly calculating size
> > - copy whole regulator array in one memcpy() call
> > - Drop "0" from struct zeroing initializer
> > - Split out regulator helper from i2c_of_probe_enable_res() to keep
> >   code cleaner when combined with the next patch
> > - Added options for customizing power sequencing delay
> > - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
> > - Add i2c_of_probe_free_regulator() helper
> >
> > Changes since v4:
> > - Split out GPIO handling to separate patch
> > - Rewrote using of_regulator_bulk_get_all()
> > - Replaced "regulators" with "regulator supplies" in debug messages
> >
> > Changes since v3:
> > - New patch
> >
> > This change is kept as a separate patch for now since the changes are
> > quite numerous.
> > ---
> >  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++--
> >  include/linux/i2c.h              |  10 +-
> >  2 files changed, 155 insertions(+), 9 deletions(-)
>
> I never jumped back into looking at this since you started sending new
> versions last month (sorry), but I finally did...
>
> At a high level, I have to say I'm not really a fan of the "reach into
> all of the devices, jam their regulators on, force their GPIOs high,
> and hope for the best" approach. It just feels like it's going to
> break at the first bit of slightly different hardware and cause power
> sequence violations left and right. If nothing else, regulators often
> need delays between when one regulator is enabled and the next. There
> may also be complex relationships between regulators and GPIOs, GPIOs,
> GPIOs that need to be low, or even GPIO "toggle sequences" (power on
> rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
> rail 2).
>
> IMO the only way to make this reliable is to have this stuff be much
> less automatic and much more driven by the board.
>
> I think that, in general, before the board prober checks i2c address
> then the prober should be in charge of setting up pinctrl and turning
> on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
> may be specified by different children, the prober will just have to
> pick one child to find those resources. It should have enough
> board-specific knowledge to make this choice. Then the prober should
> turn them on via a board-specific power-on sequence that's known to
> work for all the children. Then it should start probing.
>
> I think there can still be plenty of common helper functions that the
> board-specific prober can leverage, but overall I'd expect the actual
> power-on and power-off code to be board-specific.
>
> If many boards have in common that we need to turn on exactly one
> regulator + one GPIO, or just one regulator, or whatever then having a
> helper function that handles these cases is fine. ...but it should be
> one of many choices that a board proper could use and not the only
> one.

IIUC we could have the "options" data structure have much more board
specific information:

  - name of node to fetch resources (regulator supplies and GPIOs) from
  - names of the resources for the node given from the previous item
  - delay time after each resource is toggled
  - polarity in the case of GPIOs
  - prober callback to do power sequencing

The "resource collection" step would use the first two items to retrieve
the regulator supplies and GPIOS instead of the bulk APIs used right now.

The power sequencing callback would use the resources combined with the
given delays to enable the supplies and toggle the GPIOs.

For now I would probably only implement a generic one regulator supply
plus one GPIO helper. That is the common case for touchscreens and
trackpads connected over a ribbon cable.

Does that sound like what you have in mind?


This next item would be a later enhancement (which isn't implemented in
this series anyway):

  - optional prober callback that does actual probing

In our case it would only be used for cases where an HID-over-I2C
component shares the same address as a non-HID one, and some extra
work is needed to determine which type it is. I still need to think
about the structure of this.


Thanks
ChenYu

