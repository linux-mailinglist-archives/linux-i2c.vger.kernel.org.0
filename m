Return-Path: <linux-i2c+bounces-7371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 581A499DD82
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 07:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBF141F2437A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 05:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F801779BB;
	Tue, 15 Oct 2024 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OUXx9nnm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FC175568
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728970315; cv=none; b=eHttkiOWbpWws+6RBoXiXOMd2fDiIqWKXmLq7rncNvYIIElHAS+lQfr3+1PQi1mdTPL/ecWjU/AQqGcUPuVWAYlKtPe+LtUoYTuVUawQf/qA1uyVxRanQ469x5l3RErkrPNa0rxs7gtpXDnURRaQ4EJ9jcV18qsBCmJVk3s5+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728970315; c=relaxed/simple;
	bh=EfzX5krpuywmG5h0oUk6AHF+dbPj3jlM5kdV7Gl8Lu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC/LzqSeFEWUy+POkBek/uynlMegPBWwSdKUmmQVzx62wPBopsAhHfHEK/2K48kDZhw1GZfPtTWRe/MQPCS7m2jR2VNfgljc2AhnaTcrC3C/QnGMBIzCq+3UuMusnNehy2u0qks5Q/L5v0OFheteSNvCGPP2dJeLCCpxSam/iT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OUXx9nnm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2166124e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728970312; x=1729575112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=;
        b=OUXx9nnmvFQ6NMduKIE0bo073fKDCyWShE2Say6sTYHGKIG1g065eXweqYy0Ynvp8B
         c3DHgoJkfeadJk3pv0uP2gukw3s1Aah+bJFhkCluTVruC4A4mgZIaHPdRBeUWTgqki9r
         517ZXFShXOQW9a3akDIUvymUWTHkAvNoe5h+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728970312; x=1729575112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=;
        b=ndWHzwpKsH3BvnKHqG+mCs3b+5gC49/0JOcqmlexTQY7ZUp81pxTaXLnJ1AcfWmK/R
         qstEBseRsP1zr4mMxuFufcWAjB8fWK0gjIWU4mJa73i5Zsnpf1snHdMyc1jNEFqUTvOH
         eWCnrrth5ZiI4IYseTJyM1XGQhvh3vFmY3J7N8B9163EtpWDCsJbc4YXquTQyHPszukk
         2uMbWkxi4T7v/P9PunX5IjB5dCjHkGBHuvzvAataVyGqTiEk1gwqZxsA5uUHC+GnxBw3
         QOqc/LiojW25gpkdxeie26E20H3nneQSotB/Q7DkzOGN7T4oIOTZE2IQ4HedAVbDoJPw
         EY8g==
X-Forwarded-Encrypted: i=1; AJvYcCVOP3pncfuVW3+MF0P9Wy2ga9Q85jTIbTOLMly/pX+YSICMgk2KvDdxHXAPHtUUGAF1sRwcwZcbz2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqzQn1WR5mGnrMbz6Ms9MzXVOYjyjZFQA8hTV1IZFwMAmz2um+
	AQnbe6lfpFpWYvjW1uOygM65fqirniM06F3n2W8/MqUZ9X+slxVu7X47sTPkmogfovmD8aNz6bc
	nrVRkG7PmXsjd1ZZZYzrVPhbcCubsdg6nk5zW
X-Google-Smtp-Source: AGHT+IFnv6XcJ0IaPSidwG2NAv6IbIwCRYACAiR+zoSqxUioN+OKGyLgyzBfN8IaMOcvrXfdKkawj5iYaHp4/g0qQYA=
X-Received: by 2002:a05:6512:2811:b0:539:f4ab:5638 with SMTP id
 2adb3069b0e04-539f4ab57c9mr2610100e87.60.1728970311498; Mon, 14 Oct 2024
 22:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com> <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
In-Reply-To: <Zwz-benEP4PHbRb2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 13:31:40 +0800
Message-ID: <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 7:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> > > > Add GPIO support to the simple helpers for the I2C OF component pro=
ber.
> > > > Components that the prober intends to probe likely require their
> > > > regulator supplies be enabled, and GPIOs be toggled to enable them =
or
> > > > bring them out of reset before they will respond to probe attempts.
> > > > Regulator supplies were handled in the previous patch.
> > > >
> > > > The assumption is that the same class of components to be probed ar=
e
> > > > always connected in the same fashion with the same regulator supply
> > > > and GPIO. The names may vary due to binding differences, but the
> > > > physical layout does not change.
> > > >
> > > > This supports at most one GPIO pin. The user must specify the GPIO =
name,
> > > > the polarity, and the amount of time to wait after the GPIO is togg=
led.
> > > > Devices with more than one GPIO pin likely require specific power
> > > > sequencing beyond what generic code can easily support.
>
> ...
>
> > > > +     /* An empty string signals an unnamed GPIO */
> > > > +     if (!ctx->opts->gpio_name[0])
> > > > +             con_id =3D NULL;
> > > > +     else
> > > > +             con_id =3D ctx->opts->gpio_name;
> > >
> > > Can it use positive conditional?
> > >
> > >         if (ctx->opts->gpio_name[0])
> > >                 con_id =3D ctx->opts->gpio_name;
> > >         else
> > >                 con_id =3D NULL;
> >
> > You suggested writing it this way in your reply to v7. Please pick one.
>
> Oh, whatever you will finish with then, sorry for the noise.

Thank you.

> ...
>
> > > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, s=
truct i2c_of_probe_simple_ctx *ctx)
> > > > +{
> > > > +     if (!ctx->gpiod)
> > > > +             return;
> > >
> > > Do you need this check for the future patches?
> >
> > Not sure I follow. The check is needed because this function is called
> > in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > function a no-op.
>
> Do you have a known race condition then? This is bad. You shouldn't rely =
on
> the sequence of events here, or the serialisation has to be added.

No there isn't. Explanation below.

> > The helpers for the release side are quite short, but the ones on the
> > request side wrap some conditional and error handling. I think it's
> > better to keep it symmetric?
>
> Yes, but why do you need the above check, I didn't still get...
> I.o.w. you think that there is a gap in time that (if no check) the GPIO
> descriptor might be changed? But then how does it affect anyway the possi=
bility
> that it becomes not NULL even with the current code.

There are two codes paths, either

    a) successfully finding a device and enabling it, or
    b) exhausting all options and not finding a device, because it was
       optional or it is malfunctioning.

After either code path, this cleanup function is called.

In path (a), the GPIO descriptor is released prior to enabling the device,
because the descriptor is an exclusive resource, and as soon as the device
is enabled, its corresponding driver may probe and request the same GPIO,
and would fail if it was not released.

In path (b), nothing was enabled, and the GPIO descriptor was not released
early.

The cleanup function here accounts for both cases, hence the check.

A step-by-step description might be clearer:

1. i2c_of_probe_simple_enable()
   ...
   1a. i2c_of_probe_simple_get_supply()
   1b. i2c_of_probe_simple_get_gpiod()
   1c. i2c_of_probe_simple_enable_regulator()
   1d. i2c_of_probe_simple_set_gpio()

2. Loop through potential component options and probe; if one is found:
   2a. i2c_of_probe_simple_cleanup_early()
       2a-i. i2c_of_probe_simple_put_gpiod
   2b. Enable device and driver's probe() gets called

3. i2c_of_probe_simple_cleanup()
   3a. i2c_of_probe_simple_disable_gpio()
   3b. i2c_of_probe_simple_put_gpiod()
   3c. i2c_of_probe_simple_disable_regulator()
   3d. i2c_of_probe_simple_put_supply()


ChenYu

> > > > +     /* Ignore error if GPIO is not in output direction */
> > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable=
);
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

