Return-Path: <linux-i2c+bounces-6803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185697A3F6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 16:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48DFA28BDA7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38FF15852E;
	Mon, 16 Sep 2024 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y7pxXbE4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A01581F3
	for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496164; cv=none; b=bY7LO3xnNMRFRVK7lzNM+uLaPmgNw0vOeIUYDmOTjJ79LqdQwtL0t3nNwrFcuksEHK/Xoh2GpO32RwVAOjvGZt0se434SL73nSmkvOX0YfjZ9KsdVUTxBpy7wDJF1nTUoFjCKcaK94q2YH4gsbQ/58VFV6NG7eVzbQDLzqS4K7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496164; c=relaxed/simple;
	bh=4vNgVS9GZ2j9kKRodh0jVIgu5z1qSsuIchwcUpNkRWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeuKykUtF0w3WtsyHpl+P4EEaX8eN6DRDBgUXtNoeEPhVacH7h0GDaFnpGXJjlwzrk/QGw66QU4B0XUnmfXc3/OYCgT5dVAldiYVv8Wf2e4exVwuhHHQuKlReLWYHUUsT5RL05vxv/HUP3Lz4XLN3Tf33rM5YtdDjMxH2py9yBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y7pxXbE4; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9acc6f22dso450882285a.0
        for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726496159; x=1727100959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE+jV0zHlg6zy6Ts72y2t3G+5soo/pTPKebVXXxYvbc=;
        b=Y7pxXbE4KGSGgRurO08kJH/vd6qTFxnS8g4JMdh1iUmdwIwxLTqm2KV7dJTXradL9U
         QQrL7CwqSiQ9dEKeh4E4/jrnw8hFAOAay7GW+Nky1NhrsfcSG69DKIR7Gim1pmQ6triK
         VMymn/+2OMC4nTF/sYV2cW2dA1s17orn5Kbs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726496159; x=1727100959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZE+jV0zHlg6zy6Ts72y2t3G+5soo/pTPKebVXXxYvbc=;
        b=xDkf3/0Vr/clbzf9nVS8805Loz4UrJ7jR78YQAvBkGjK1DrSAADSiJT/ef05xFIhZI
         xlRVxzFiDFjXyyWqbBjVgn1bommd9HiyEw93EIC2zg4+7fP+/A/E+K4PhJGaKxUXs1/l
         2VDfuX+7z+fOO1ckCymni0SI8jLkUKM2hWWJkIQ2SVVsSijNdgolg7jE5gK1WAGYFyfj
         LtahatyhznPmhUxVn3QaOLBm81ik4O2VeAArolGA+kh/ILZmAsvof29idEuuW3C31ugK
         9pqi6tGC61Afqap7dTO62BscA36QHjUmZlUgLV7lZMyOqqzIfuldur0ogvb8J6NiOUNH
         LRkA==
X-Forwarded-Encrypted: i=1; AJvYcCWi8nTbLE8FQsuUv0N1VqV5DSZFwFQRELccpyRPWDP+oqzua8p8YvDPlau/7YdApSIJh3U+YJlbJao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyLA3CeVxnmDnrbLJJ61ctLJv9AxFWKmweY0hApU+tr5auufEv
	rCI1/XgKJjF1QYyzP9mqG/B3aRDeShUFLhVhJ09teDSlAi8C6O4YcKN4hq+6yMUDLBa4LdhHdMJ
	MyA==
X-Google-Smtp-Source: AGHT+IGQP0iplB5B153Oah6S0qGmiPjPkYs76wuhtm7DMwvoQjLrbcn3jSd72YxHVKsG0sTwSac87g==
X-Received: by 2002:a05:6214:4509:b0:6c3:6a68:499f with SMTP id 6a1803df08f44-6c573568dd5mr248624096d6.19.1726496158610;
        Mon, 16 Sep 2024 07:15:58 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c642671sm24638896d6.65.2024.09.16.07.15.57
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 07:15:57 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6c354415c19so39325306d6.2
        for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 07:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVW9zFykiCIJWkzl2ahJOxaKR1pSFLB5ayCsM2PTAd7PidfHpKnrWEjLOYujVI3cIs3ataufpcb8Io=@vger.kernel.org
X-Received: by 2002:a05:6214:5245:b0:6c3:6e5e:64d4 with SMTP id
 6a1803df08f44-6c5736c8fdbmr253820506d6.32.1726496156795; Mon, 16 Sep 2024
 07:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com> <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com>
In-Reply-To: <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Sep 2024 07:15:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
Message-ID: <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
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

On Sun, Sep 15, 2024 at 4:32=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > + * Assumes that across the entire device tree the only instances of =
nodes
> > > + * prefixed with "type" are the ones that need handling for second s=
ource
> > > + * components. In other words, if "type" is "touchscreen", then all =
device
> > > + * nodes named "touchscreen*" are the ones that need probing. There =
cannot
> >
> > "touchscreen*" implies that it can have an arbitrary suffix. Can it?
>
> That is the idea. The use case is for components that have conflicting
> addresses and need special probing. Such device nodes obviously can't
> have the same node name. This is planned but not implemented in this
> series.

Maybe "touchscreen@*" instead of "touchscreen*" if I'm understanding correc=
tly.


> > > + * be another "touchscreen" node that is already enabled.
> > > + *
> > > + * Assumes that for each "type" of component, only one actually exis=
ts. In
> > > + * other words, only one matching and existing device will be enable=
d.
> > > + *
> > > + * Context: Process context only. Does non-atomic I2C transfers.
> > > + *          Should only be used from a driver probe function, as the=
 function
> > > + *          can return -EPROBE_DEFER if the I2C adapter or other res=
ources
> > > + *          are unavailable.
> > > + * Return: 0 on success or no-op, error code otherwise.
> > > + *         A no-op can happen when it seems like the device tree alr=
eady
> > > + *         has components of the type to be probed already enabled. =
This
> > > + *         can happen when the device tree had not been updated to m=
ark
> > > + *         the status of the to-be-probed components as "fail". Or t=
his
> > > + *         function was already run with the same parameters and suc=
ceeded
> > > + *         in enabling a component. The latter could happen if the u=
ser
> >
> > s/latter/later
>
> Are you sure?

No. latter looked weird to me and I searched quickly and thought I was
right. With a more full search looks like you're right.


> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_p=
robe_cfg *cfg, void *ctx)
> > > +{
> > > +       const struct i2c_of_probe_ops *ops;
> > > +       const char *type;
> > > +       struct device_node *i2c_node;
> > > +       struct i2c_adapter *i2c;
> > > +       int ret;
> > > +
> > > +       if (!cfg)
> > > +               return -EINVAL;
> >
> > Drop extra check of "!cfg". In general kernel conventions don't check
> > for NULL pointers passed by caller unless it's an expected case. You
> > don't check for a NULL "dev" and you shouldn't need to check for a
> > NULL "cfg". They are both simply required parameters.
>
> "dev" is only passed to dev_printk(), and that can handle "dev" being
> NULL. Same can't be said for "cfg".
>
> I don't know what the preference is though. Crashing is probably not the
> nicest thing, even if it only happens to developers.

Honestly as a developer I'd prefer the crash. It points out the exact
line where I had an invalid NULL. Returning an error code means I've
got to compile/boot several more times to track down where the error
code is coming from.

I'm fairly certain that the kernel convention is to only check things
for NULL if it's part of the API to accept NULL or if the value can be
NULL due to untrusted data. If the only way it can be NULL is due to
buggy code elsewhere in the kernel then you should omit the error
checks.

> > > +               if (!of_device_is_available(node))
> > > +                       continue;
> > > +
> > > +               /*
> > > +                * Device tree has component already enabled. Either =
the
> > > +                * device tree isn't supported or we already probed o=
nce.
> > > +                */
> > > +               ret =3D 0;
> > > +               goto out_put_i2c_node;
> > > +       }
> > > +
> > > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > +       if (!i2c) {
> > > +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't g=
et I2C adapter\n");
> > > +               goto out_put_i2c_node;
> > > +       }
> > > +
> > > +       /* Grab resources */
> > > +       ret =3D 0;
> > > +       if (ops->get_resources)
> > > +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > +       if (ret)
> > > +               goto out_put_i2c_adapter;
> > > +
> > > +       /* Enable resources */
> > > +       if (ops->enable)
> > > +               ret =3D ops->enable(dev, ctx);
> > > +       if (ret)
> > > +               goto out_release_resources;
> >
> > I won't insist, but a part of me wonders whether we should just
> > combine "get_resources" and "enable" and then combine "cleanup" and
> > "free_resources_late". They are always paired one after another and
> > I'm having a hard time seeing why they need to be separate. It's not
> > like you'll ever get the resources and then enable/disable multiple
> > times.
>
> Maybe. The structure was carried over from the original non-callback
> version. I think it's easier to reason about if they are kept separate,
> especially since the outgoing path is slightly different when no working
> component is found and one of the callbacks ends up not getting called.

Actually, both of the outgoing callbacks are always called. It's only
the 3rd callback (the "early" one) that's called sometimes.

I won't insist on combining them, but I still feel like combining them
would be better. I'd be interested in other opinions, though.


-Doug

