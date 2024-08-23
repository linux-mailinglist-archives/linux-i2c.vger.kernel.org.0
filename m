Return-Path: <linux-i2c+bounces-5730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C095CA7F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 12:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D057E1C214BC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 10:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66716185B6B;
	Fri, 23 Aug 2024 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="apKd8pYw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696D417E01E
	for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2024 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409151; cv=none; b=LSD99EDY1Q0q+4N1B38UhsUnPmUeKEJHvHSjlpbxDF3swwTrRvf/mZGat04ZKyDpA04fAThnymZ6yOn665PAS8CDUGezubQD+/GOSR/h/Kr6M5xzx/IrRH1Gj1xSW1b54KMRNJHdYGnJznqI5/YAcRSazZjSg258b92UTynjj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409151; c=relaxed/simple;
	bh=IIacz7qfDLLOfGIR7Qsfd8HV7WiOO9Y8+iUqvYoBVfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlHwWRTxoDtTNnQOJny0sM/c34zHRjdMQXu3wPerhIC/L90F5oZ/+GFALEpWzMDkzvUNKesY7L4/Zx8yxiZxWpVrPE9GWsrg2M+nmTYPdJfozBbkQBkS8wnzHkld9HA+usZWN3t9lj4AEX1x+PPar4B5yzdYOlm2WC2rKtsvnog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=apKd8pYw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533521cd1c3so2099034e87.1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2024 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724409148; x=1725013948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msee6vptApu2Z/Zxm5KrwvjqOV+8m1GWJRTDYPaGTQ0=;
        b=apKd8pYwWmqlUAKBQXt1eoO3jMqCV8VA5HqpRLyFVEjKgMUj+mQiG8dQHZDcd+RihB
         1YGJkY5E626TJV7+WbBXHY84iBH/osN7GyKtG8TJsdIOPMy+zeszeyqfjsrtyaxFG9Dt
         P/crhCUsH7/rYaqLJaoNry51EW65kVrUpZAZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724409148; x=1725013948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msee6vptApu2Z/Zxm5KrwvjqOV+8m1GWJRTDYPaGTQ0=;
        b=VT74AFcg3CBVjs/BgBPgVknfdEOb9/WFpK/pBYpzfVv/NXLrFigDZkNEx2jLQnU7bO
         GI+1rMF2zb5Wh6u4i2kdEjg6PL8XInoVCF8FY/QffBnBFc+ucE/PJFAeHhKEv089CHw0
         6GbvxIv10yfF+EdnNo8nMvCuM99EpZDFmuMOrArcu3GsqKJu9bKrlRBznhW//svxVz0j
         1xQPcmmBx2Esu4joBDiJeLeY82B5NebYWnYSl93is6LYUdmBht52PjRbQhXO+7bLUcd6
         lmoLrsSAkz0qHlfLUElaKg5JIXdhnc7qao1BPmlXCUYw/KMprZ9GPp9TcRbyErrfsMTB
         FwhA==
X-Forwarded-Encrypted: i=1; AJvYcCX9oJ8eRTulkEFOZDME0ggZgS3sAhQm9tu4bpOIWbhmu1N7u66C0oj4HZWkUNVTjud7eDdzcL+l9N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkqW4XptR5zejjyuNjv3EhmgFDJI9oSFbOzM3iFsxHLRuDAkV4
	Guivh+dskWJzjqJC6GhgrN1Jz2S4Nw1cRFWdaC9LfkxSd3QVOPkePu3UCv5lhdSOGfTCfNOmJ4h
	tWPEg2Jr8Y/xvZ9+LIdvWcalxdtJ168qR7SFg
X-Google-Smtp-Source: AGHT+IHeN+Mw9mA2FjlysvQEEAUELAjuWivKbkYmYOUv0QR8Nac49Wn18na13i/jZffEieHV1XNO2MlM81/zZrEAaDU=
X-Received: by 2002:a05:6512:1111:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-534387e89d7mr1529511e87.0.1724409147414; Fri, 23 Aug 2024
 03:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-9-wenst@chromium.org>
 <ZsdJOUe44hiGur-s@smile.fi.intel.com>
In-Reply-To: <ZsdJOUe44hiGur-s@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 18:32:16 +0800
Message-ID: <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
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

On Thu, Aug 22, 2024 at 10:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:
> > This adds GPIO management to the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > regulator support was added in the previous patch.
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
>
> ...
>
> > +     struct fwnode_handle *fwnode =3D of_fwnode_handle(node);
> > +     struct gpio_descs *gpiods;
> > +     struct gpio_desc *gpiod;
> > +     char con[32]; /* 32 is max size of property name */
>
> Use 'propname' to be aligned with GPIO library usages.

Ack.

> > +     char *con_id =3D NULL;
> > +     size_t new_size;
> > +     int len;
>
> ...
>
> > +     if (len >=3D sizeof(con) - 1) {
>
> This can be transformed to check the returned value from strscpy().

Ack.

> > +             pr_err("%pOF: length of GPIO name \"%s\" exceeds current =
limit\n",
> > +                    node, prop->name);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (len > 0) {
> > +             strscpy(con, prop->name, len + 1);
>
> The correct (robust) call is with destination size. Which means here that=
 you
> may use 2-argument strscpy().

Ack.

> > +             con_id =3D con;
> > +     }
>
> ...
>
> > +     if (!data->gpiods)
> > +             return 0;
>
> If it comes a new code (something else besides GPIOs and regulators) this=
 will be a (small) impediment. Better to have a helper for each case and do
>
>         ret =3D ..._gpiods();
>         if (ret)
>                 ...
>
> Same for regulators and anything else in the future, if any.

I'm not sure I follow. Do you mean wrap each individual type in a wrapper
and call those here, like the following?

    i2c_of_probe_enable_res(...)
    {
        ret =3D i2c_of_probe_enable_regulators(...)
        if (ret)
              return ret;

        ret =3D i2c_of_probe_enable_gpios(...)
        if (ret)
              goto error_disable_regulators;

        ...
    }

> > +             /*
> > +              * reset GPIOs normally have opposite polarity compared t=
o
>
> "reset"
>
> > +              * enable GPIOs. Instead of parsing the flags again, simp=
ly
>
> "enable"
>
> > +              * set the raw value to high.
>
> This is quite a fragile assumption. Yes, it would work in 98% cases, but =
will
> break if it's not true somewhere else.

Well, this seems to be the de facto standard. Or it would have to remember
what each GPIO descriptor's name is, and try to classify those into either
"enable" or "reset", and set their respective logical values to 1 or 0.
And then you run into a peripheral with a broken binding that has its
"reset" GPIO inverted, i.e. it's driver behavior needs to follow the
"enable" GPIO style. The class of devices this prober targets are
consumer electronics (laptops, tablets, phones) that at least have gone
through some component selection where the options won't have conflicting
requirements.

And if the polarities of the possible components don't line up, then this
probe structure can't really do anything. One would need something that
power sequences each component separately and probes it. I would really
like to avoid that if possible, as it makes the boot time (to peripheral
available) dependent on which component you have and how far down the
list it is. We have Chromebooks that have 4 touchscreen components
introduced over the years. In that case something more like Doug's
original proposal would work better: something that forces mutual
exclusivity among a class of devices.

> > +              */
>
> ...
>
> > +     /* largest post-reset-deassert delay seen in tree for Elan I2C HI=
D */
> > +     msleep(300);
>
> Same Q, how do you monitor _all_ the drivers?

Discussion in the previous patch.

> ...
>
> > +disable_gpios:
> > +     for (gpio_i--; gpio_i >=3D 0; gpio_i--)
> > +             gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], =
0);
>
> Can't you call the _array() variant here?

I thought that without |struct gpio_array| the _array() variant wouldn't
help, i.e. it would still be a loop internally. Looks like I was wrong.

> ...
>
> > -     dev_dbg(dev, "Resources: # of regulator supplies =3D %d\n", probe=
_data.regulators_num);
> > +     dev_dbg(dev, "Resources: # of GPIOs =3D %d, # of regulator suppli=
es =3D %d\n",
> > +             probe_data.gpiods ? probe_data.gpiods->ndescs : 0,
> > +             probe_data.regulators_num);
>
> I would issue one message per class of the devices (GPIOs, regulators, ..=
.)

Ack.


Thank you for the review.
ChenYu

