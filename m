Return-Path: <linux-i2c+bounces-6823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A262D97B03C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 14:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7BB01C2199C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 12:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C591714C9;
	Tue, 17 Sep 2024 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BdwosHhi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED016FF37
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576903; cv=none; b=NqK7i1e9hXsc7xvgEWuN0fr/IhurYTp62F3szPbcKhvMKUbV06Vg3Knce1eaKP4q8wzo6FJF+7zUehJdEXvJc4djwXlGvftxglts1gJR8ODrtPMJh3m5fWiPnKsWLeBBaotaUNt6A/2xrG92wmUncGqOrcz+th11JjReWDHq5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576903; c=relaxed/simple;
	bh=ZJFRDeZ8soV10dD+MfPoyVRxBMFppyhwS9UoRQCw/jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poOiFl1xjUl+5D1gOsZ8GlQ+7FTSx6U3bWSy7t/H7sRf6Aq0KNazMb+n6WQXyhy6QSpTdl1z6cwi7RtqtW/q7KWVqI1F3SGe+mvkPJgcV7Gi9TYScWrkrmBD4vpNh9WIYNMrbKjBnQVv+ochcn2F1JgE93UljMYu+8wcy91ymrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BdwosHhi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53654e2ed93so6044156e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726576899; x=1727181699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=;
        b=BdwosHhiGfHGzwNkOzyC8LISD3LkgVMlTBqiczIfPz93/CmHgUmmI4C3Tx5B1IovPh
         6gVGmuGUNQtxq7+r9c2meZ7tbQD8FnRKapb0gTA6GLT+WFC2gkRipjVlVpkJOyG4fHIJ
         oMQbVyTqgbYI38/iiGlvdobQRGH75Iy7SDndg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726576899; x=1727181699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=;
        b=uEHmuF3D+vYpYckc4v/J2FKHi4CCUT3ewUUQl1Oz58zDwoH2vLiiCPPlmM3WZez4jk
         kknVk3qsKK+Om1F2fHegfKiTzuITlpdqhBUjDDRc7JC7qhQpeTnPhXWHmFb7wwlWIaDO
         X+8YWqA4ZQIkQiobu1/zeS+bvftF1ndQee01aepzUEBL3NojWTP4gOgWwTUD6RkOaXev
         luj73aqSb9AzTpabQNzz9bRC4c9PnI0WrUbsP3LIPaGYJ8OIhFelArQS+rXf/KaO7VvI
         fpYr4wn1q13ZnPsjk8h9YG6E5W78SViN4f4+IoE4CBWjAnjciXi12myGepWLGB+mwcQW
         CZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXN0DcQJHaYBXYLU8b+ix6n7PQINtvTID+oWonHNEEffaKpQIXDFx58Tl3kobSYGgixj9VKNuf9x4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQhNoRaV2vHm4hu1JS9RADG8zI+40/k+10vtrT6xgeXVBK6FY
	UI0cq77UDcDKllFGf0nh6tuaHxdQN20882djKnB5Jq+1v0/1qPL971NpsOc7WKdeZfVb1IR709+
	ynV/25q6GtnRvCBj9+3OTx1Ai/BwZl9jdE0HF
X-Google-Smtp-Source: AGHT+IFn3m+495dQ3DEAPrBhGOQnGwVGdz2fTnahxh2yXDyCOMPHxLysb0zN6DNlW9fowNODvzSDvoxEfUfwPvjJvLE=
X-Received: by 2002:a05:6512:3f18:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53678f6143cmr9822670e87.0.1726576898996; Tue, 17 Sep 2024
 05:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
 <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
In-Reply-To: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 17 Sep 2024 14:41:26 +0200
Message-ID: <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
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

On Sat, Sep 14, 2024 at 1:49=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c=
_of_probe_simple_ctx *ctx)
> > +{
> > +       int ret;
> > +
> > +       if (!ctx->gpiod)
> > +               return 0;
> > +
> > +       dev_dbg(dev, "Setting GPIO\n");
> > +
> > +       ret =3D gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_=
high_to_enable ? 1 : 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       msleep(ctx->opts->post_reset_deassert_delay_ms);
>
> Like in the previous patch, you need an "if
> (ctx->opts->post_reset_deassert_delay_ms)" before the msleep().

Ack.

> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +       if (!ctx->gpiod)
> > +               return;
> > +
> > +       dev_dbg(dev, "Setting GPIO to input\n");
> > +
> > +       gpiod_direction_input(ctx->gpiod);
>
> This is weird. Why set it to input?

It seemed to me this would be more like the initial state, without knowing
the actual initial state.

> > @@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev,=
 void *data)
> >  {
> >         struct i2c_of_probe_simple_ctx *ctx =3D data;
> >
> > +       i2c_of_probe_simple_disable_gpio(dev, ctx);
>
> Maybe add a comment before the GPIO call that it's a noop if we found
> something and i2c_of_probe_simple_free_res_early() was already called?
> Otherwise you need to read into the function to understand why this
> doesn't crash if the early call was made. To me, that makes the
> abstraction add confusion instead of simplifying things.

Ack.

> > @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, cons=
t struct i2c_of_probe_cfg *cf
> >   * struct i2c_of_probe_simple_opts - Options for simple I2C component =
prober callbacks
> >   * @res_node_compatible: Compatible string of device node to retrieve =
resources from.
> >   * @supply_name: Name of regulator supply.
> > + * @gpio_name: Name of GPIO.
>
> Talk about the fact that gpio_name can be NULL or an empty string and
> that they mean different things.

Ack.

> >   * @post_power_on_delay_ms: Delay in ms after regulators are powered o=
n. Passed to msleep().
> > + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Pas=
sed to msleep().
> > + * @gpio_high_to_enable: %true if GPIO should be set to electrical hig=
h to enable component.
>
> Now that you've added the GPIOs and more delays, the description of
> this structure needs to list exactly what the power sequence your
> simple functions assume.

Ack.

> I would also say: given that you're providing a parameter anyway and
> you're giving the GPIO name, can you please move away from the "raw"
> values and move to "logical" values?

I disagree. When hardware engineers design for swappable components, they
likely look at the electrical compatibility of them. In this case, an
active-high "enable" pin is electrically compatible with an active-low
"reset" pin. If we use the logical value here, then we would need more
logic to know when the logical polarity has to be reversed.

Note that this doesn't work for components that are electrically
incompatible. But in that case a lot more board dependent code would be
needed anyway.


ChenYu

