Return-Path: <linux-i2c+bounces-7372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AE99DD8B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 07:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C65828371E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 05:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A261684A1;
	Tue, 15 Oct 2024 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fqqI43QN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD6D170828
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728970507; cv=none; b=LjS8ogIeHSPGqTKHpyyIKo5nL55+K08yqmomUM3lzFBiw+ISTCD5ge2gHfeQW2yc6PVRpSvX3wdC3iTGybm8R2Y9ys1hLRXhi1XRcZZDM4qtCJW/YGBKqtY5+hyDl/hWyeLOZz4cCDDeXL+pic5E7Zzs3DJHIKFoO75pN+AqeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728970507; c=relaxed/simple;
	bh=JR6gZ2MYyBQRhGGMVIzq353IT1yqvpAlneMgFsqBvhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpdJk5bIsy8GbVmD3FTZwa+QKO6VeACPuEcwibAd7QW7EiTBUazw5IiYyE9O5uZXjtQdg/ak74nZ7Zq9RrrmMurofOkJyw/McNE+DQ6nvb+EedN5QsuwVucJtibcYVuOhpek28OQtHMzPZrLTn81fF2IBv1D0tAF2jufzcZ7JNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fqqI43QN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2347078e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728970503; x=1729575303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=;
        b=fqqI43QNkB+bJpOjwnY8O0LZdEmGzSYuVG+oUajBkNI19xNVzxaF4A5pGBDvsp22Dp
         BNdSOvhl1OE1mqcug0JrlBYvF+dtgplaJckilfupNJGH+05Uptj67GNow7t9tXsLmbfO
         9bbqsnFPZ2htEJODKmaCx0JPvqdoY9vHBvvYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728970503; x=1729575303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=;
        b=E/Y9FmIQqs4Z+08uBcFm1+a51pBwtP6FmYHB0i6uU+aW4ZoPMweQ8GTMCxu5jaT0c8
         7BngQprvgL6UuRz0tuv3R4VuRvHlpLSR6aHZb8yPWRY54ug+dZ9f96UcvieETdgD16t2
         ez0ujOz48S2+9gHiLtfXLTh9RsGMOon/tZdnItIc/eGSBw7XNcD8FQfLyUbtL9ZLHWIc
         j1IRtkcaL78FIN2mgtRnIPz4CuuNp4cc0t+Cr9cQCeVIs3Uc8PUXKOLXhHlUX5hB6mNi
         +IJsLy/hro207miEUmN5Fo5xSzPgsocJs9BdWjuu8mM0iaJ0pxn4DsAgcgHNZZUChqOz
         KgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8nRkG5dzRXputJJpmUb1/zC7ad0kDQhem9wdIK21Bu3cEd2+5hzJksu64Yfq85WvZ/l2T6UbA8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdjAdNewNyJ5zjWS3x3aqBCM7DS2xHkEx+WDc8Q1BoJxMXeIQO
	XQiokpyqD4MwlzmYfmMia2FZ7st5RJAHuwl4O+nUutoJ29P+EqfuJ83x8+ZklnrmvPmUlrnvJgV
	b9X1/btb4E2blunhjbK3kWaTW/FR+3z+OpsZr
X-Google-Smtp-Source: AGHT+IE/CwxLRzqmXVYjkMDrcTm2+DQg9NcGd7Zyw9exDfJ8teYEZF+svaLAA8rUa5571DxzVoiZK6455ROycmYsGCQ=
X-Received: by 2002:a05:6512:1598:b0:539:9155:e8d4 with SMTP id
 2adb3069b0e04-539e54d77ecmr4621333e87.8.1728970503111; Mon, 14 Oct 2024
 22:35:03 -0700 (PDT)
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
Date: Tue, 15 Oct 2024 13:34:52 +0800
Message-ID: <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
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
>
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
>
> > The helpers for the release side are quite short, but the ones on the
> > request side wrap some conditional and error handling. I think it's
> > better to keep it symmetric?
>
> Yes, but why do you need the above check, I didn't still get...
> I.o.w. you think that there is a gap in time that (if no check) the GPIO
> descriptor might be changed? But then how does it affect anyway the possi=
bility
> that it becomes not NULL even with the current code.

The opposite actually. Either it is always NULL, or it was initially valid,
but the early cleanup function released it and thus it became NULL by the
time this function gets called.

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

