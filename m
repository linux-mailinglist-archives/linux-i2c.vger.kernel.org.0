Return-Path: <linux-i2c+bounces-6804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DEE97A426
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 16:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A5B41C255B6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3896914F12F;
	Mon, 16 Sep 2024 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eb6R5/ed"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598D146588
	for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497085; cv=none; b=lk219BxT7u+ubBdu1dZUSq6o+A68ZBuZJeya23eKdpjMxHMvev13Mxbm096lJmCy1HDvNN8pP+qb+x5sHxVEymF9WtBATNo8rjWuE1O+0R1jCK2PKOe7iA3P6u1x/DbJZksX08hOZKhXDx4ZPQ2BhVEiW9/pCoiiPD+MzH/uBpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497085; c=relaxed/simple;
	bh=3eBLfo1IFKlM9MOc9/Nl+T446JfcOCihigpqPc9cT8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQg/XV4AD5Q2cemBdE4rxz4Q4DRKYK1NLsstUcTYZmreix73U663LfZDgFzvodvqbsYjwzPY77sY0RyOLXfyRtGGcdQ9uBLfm6tKoanfrPMwo4nTJhHcUDjRAcj3SoIGy81iXjDY1Q0RPZ1uCzgyOBJnMKiJVYCSM/9YsoMb92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eb6R5/ed; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-535be093a43so5609594e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726497081; x=1727101881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEjVxo0CmyP05sESlkGQPWhlG2jLiBb3+PXO6NFhtwk=;
        b=eb6R5/edWlmtNC3P8q0S6yglZQlJWSkWtgmIwbC7iJ3lJJXofUq9+BXfwrGvwtp98b
         6r8YQBb5MwuPDjaSyophM+TAGWFWzUbNLs5caCKktooZitCZqPJqztD5NBiNKJ30m03n
         2+wqVDGUAMpIrhfG8lmA3ldZeEjnWFQdgMI8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726497081; x=1727101881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEjVxo0CmyP05sESlkGQPWhlG2jLiBb3+PXO6NFhtwk=;
        b=pITIxHi3hXb2SJlykducdeadVuY1uwzStLXLAGVkMeqHD6soXklf3iEkhLsQ0Xagtf
         SZdsWQd+s6etAXcjdAPcy+eiCU3xaJSs5BQNU9A6XFuKP/6+hU82E+tvESXqjpEsNZDu
         PcAi2B7ckhpp0Yu1twEM2vXhjingFthCdjXHiYCBjgCsn64NWJc5XsFZqTdBAqS8gN7i
         kh6KuuSql9lnepYVWdvso3jgd/sfl6envfurPhNqDTkDMZiMpgY0tcJPwuX1W7Ldw/af
         gTEYg+B2Kj6mHqLlLW0L7yx/+VsWXQ09t+G/kalqSYoJfOD4PH9Oe/fct6TcyH227BSJ
         iJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtyTWAf3p0xeo7Ab4pcKtQVEl9G8hckVOltnaPW9e1rz3dkxNJ6W3UwP9BUbVLPM38AadtV+CtV2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4YEAG25wxk7vJyPMTrE2mB93iocdp6uVW46x8LG8Guv25Bo3
	h1sOo4gDSzf6ILbiB+8pD9hnMTMJQiIHJarhckkzyl7ufsJItgaP0UVROHRdoiHZ1z+in8ToWmi
	HwKgIhpv5dYfdIynuCMmMtoJ35QeG/5XesOJj
X-Google-Smtp-Source: AGHT+IF2gZvo4YLNzvfNxlnTgC8reRT76wxDzBx5nebPrFcFPFYPCHPUrhTxpiZOy4gaju7avMHM0oeFH4FKcyH9Q+Y=
X-Received: by 2002:ac2:4c49:0:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53678fb1d9emr7650183e87.5.1726497081139; Mon, 16 Sep 2024
 07:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
 <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com> <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
In-Reply-To: <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:31:09 +0200
Message-ID: <CAGXv+5Eo3r6WPDnHwEZPFz7PBd5v48n32iXXWy=Vr-v1H2zEoQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
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

On Mon, Sep 16, 2024 at 4:16=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Sep 15, 2024 at 4:32=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > > > + * Assumes that across the entire device tree the only instances o=
f nodes
> > > > + * prefixed with "type" are the ones that need handling for second=
 source
> > > > + * components. In other words, if "type" is "touchscreen", then al=
l device
> > > > + * nodes named "touchscreen*" are the ones that need probing. Ther=
e cannot
> > >
> > > "touchscreen*" implies that it can have an arbitrary suffix. Can it?
> >
> > That is the idea. The use case is for components that have conflicting
> > addresses and need special probing. Such device nodes obviously can't
> > have the same node name. This is planned but not implemented in this
> > series.
>
> Maybe "touchscreen@*" instead of "touchscreen*" if I'm understanding corr=
ectly.

Then it would be "touchscreen*@*".

> > > > + * be another "touchscreen" node that is already enabled.
> > > > + *
> > > > + * Assumes that for each "type" of component, only one actually ex=
ists. In
> > > > + * other words, only one matching and existing device will be enab=
led.
> > > > + *
> > > > + * Context: Process context only. Does non-atomic I2C transfers.
> > > > + *          Should only be used from a driver probe function, as t=
he function
> > > > + *          can return -EPROBE_DEFER if the I2C adapter or other r=
esources
> > > > + *          are unavailable.
> > > > + * Return: 0 on success or no-op, error code otherwise.
> > > > + *         A no-op can happen when it seems like the device tree a=
lready
> > > > + *         has components of the type to be probed already enabled=
. This
> > > > + *         can happen when the device tree had not been updated to=
 mark
> > > > + *         the status of the to-be-probed components as "fail". Or=
 this
> > > > + *         function was already run with the same parameters and s=
ucceeded
> > > > + *         in enabling a component. The latter could happen if the=
 user
> > >
> > > s/latter/later
> >
> > Are you sure?
>
> No. latter looked weird to me and I searched quickly and thought I was
> right. With a more full search looks like you're right.
>
>
> > > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of=
_probe_cfg *cfg, void *ctx)
> > > > +{
> > > > +       const struct i2c_of_probe_ops *ops;
> > > > +       const char *type;
> > > > +       struct device_node *i2c_node;
> > > > +       struct i2c_adapter *i2c;
> > > > +       int ret;
> > > > +
> > > > +       if (!cfg)
> > > > +               return -EINVAL;
> > >
> > > Drop extra check of "!cfg". In general kernel conventions don't check
> > > for NULL pointers passed by caller unless it's an expected case. You
> > > don't check for a NULL "dev" and you shouldn't need to check for a
> > > NULL "cfg". They are both simply required parameters.
> >
> > "dev" is only passed to dev_printk(), and that can handle "dev" being
> > NULL. Same can't be said for "cfg".
> >
> > I don't know what the preference is though. Crashing is probably not th=
e
> > nicest thing, even if it only happens to developers.
>
> Honestly as a developer I'd prefer the crash. It points out the exact
> line where I had an invalid NULL. Returning an error code means I've
> got to compile/boot several more times to track down where the error
> code is coming from.
>
> I'm fairly certain that the kernel convention is to only check things
> for NULL if it's part of the API to accept NULL or if the value can be
> NULL due to untrusted data. If the only way it can be NULL is due to
> buggy code elsewhere in the kernel then you should omit the error
> checks.

Make sense.

> > > > +               if (!of_device_is_available(node))
> > > > +                       continue;
> > > > +
> > > > +               /*
> > > > +                * Device tree has component already enabled. Eithe=
r the
> > > > +                * device tree isn't supported or we already probed=
 once.
> > > > +                */
> > > > +               ret =3D 0;
> > > > +               goto out_put_i2c_node;
> > > > +       }
> > > > +
> > > > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > > +       if (!i2c) {
> > > > +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't=
 get I2C adapter\n");
> > > > +               goto out_put_i2c_node;
> > > > +       }
> > > > +
> > > > +       /* Grab resources */
> > > > +       ret =3D 0;
> > > > +       if (ops->get_resources)
> > > > +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > > +       if (ret)
> > > > +               goto out_put_i2c_adapter;
> > > > +
> > > > +       /* Enable resources */
> > > > +       if (ops->enable)
> > > > +               ret =3D ops->enable(dev, ctx);
> > > > +       if (ret)
> > > > +               goto out_release_resources;
> > >
> > > I won't insist, but a part of me wonders whether we should just
> > > combine "get_resources" and "enable" and then combine "cleanup" and
> > > "free_resources_late". They are always paired one after another and
> > > I'm having a hard time seeing why they need to be separate. It's not
> > > like you'll ever get the resources and then enable/disable multiple
> > > times.
> >
> > Maybe. The structure was carried over from the original non-callback
> > version. I think it's easier to reason about if they are kept separate,
> > especially since the outgoing path is slightly different when no workin=
g
> > component is found and one of the callbacks ends up not getting called.
>
> Actually, both of the outgoing callbacks are always called. It's only
> the 3rd callback (the "early" one) that's called sometimes.

So IIRC do "get + enable" and "cleanup + release_late", and leave
"release_early" alone?

ChenYu

> I won't insist on combining them, but I still feel like combining them
> would be better. I'd be interested in other opinions, though.
>
>
> -Doug
>

