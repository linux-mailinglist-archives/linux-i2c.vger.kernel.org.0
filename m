Return-Path: <linux-i2c+bounces-5726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148895C6F3
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 09:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7450BB20FF1
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 07:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF97813D28D;
	Fri, 23 Aug 2024 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MKDVcRCr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09430433CE
	for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2024 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399470; cv=none; b=Sm+xvDs8AXSRtlwWwNGxHWoARwiw7bYoqDa3FVYwV8uqN7i9SfjltVIT4zN0TCb/3CcBqYvD1kkY9ZWhy8INfvZRH/DENjJBgfl6aFAtm047954AgHqQWQ4l75DCnNr8aS/I1LTUJfINwM/wzC1jEk9iHyBSifkmbvgoClML2nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399470; c=relaxed/simple;
	bh=D4dhUmGSSacH4bz6ZKMoE07XsjL2wQLHWjSO4llLsis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT8HnE8/B4R5NpzkZoRQp8pwHGHu2TXDWhyZTjOE8f62e1SEqnhyAZir6w0yyxGsp8VtL8rcvhXtoq3ldOMyvyOTlbTQQmhas2Xt0KiYSGGJjlGgQqxyTh0G12noqSb/KbfNneRIAlOvVwlqBV8a0iMMxCMHIPaYkmriqNTP0Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MKDVcRCr; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53438aa64a4so404797e87.3
        for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2024 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724399467; x=1725004267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVFI/kAx4GZJG5dq3c75HD5Ktn0yw4zArYMGtwgACRE=;
        b=MKDVcRCrwnZoEeb+iUSJ6TUiVZscT7NDTYhkq0ZL6YKaO/EjTTs40ys/TYVaIr9tBI
         lWgd9shhPf3TnCOjlh15Oe5AImjSeXWcI+LgXIp4+BcH8pCPFLYy6mPu7dPIMO8sEDow
         cXuh/uszJ0OCobsVpRg8uUJXdGEPeQi29vbTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724399467; x=1725004267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVFI/kAx4GZJG5dq3c75HD5Ktn0yw4zArYMGtwgACRE=;
        b=jXfKXEhuoEBLqLdm5O38BDimngLmJdgvvrra+WpEIeWcFYNYNV+OFsMhqvQcjnjOD5
         3zAvK2OUGHdVOZ9eNbEHJv/m9bw23VmfkFlzq3L1naJEk+GTrKwsIOOh1FtZ6qk0iwh9
         SR77kSJnrH5u9LToV8exrGBbLZwB7PR+hjoYhd95qk3SCnmSeHdKMPh7XDrCFiPPfUfo
         0998Isjl0dXeop/ioHANtWg0r5YcAQyAvJplNnqG73aJhG5K7YuQCQNZVw879SMQ3Qnr
         Ehmi7Gz5nzQsClQz48QOg74drY+GnmuEuf6GYAm8smLmiZn+2nnCz9K3dSpMYL8Rj97e
         P/5A==
X-Forwarded-Encrypted: i=1; AJvYcCXywMPCWFA9h0AUOqgp2EgwHYsCQp41y5Nhq9QXRtqwlCXhKt/gcbGl289E3M/zCv54zunFACkHRD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VmZ59MzgfPqV3CR5uZHMlRPPXN9tw5rcwXpgBbBIsGV5OLQ6
	emE6tDlSSOWAQjb15JvtDZXf4hMvLSwUt/Q7quWIizWywgr762mYvycvKza3hIFaw7ZgoXtPzV5
	yYfjJOM1JKzJhI+SRqn6aKXwPjO5lkvKIfDtN
X-Google-Smtp-Source: AGHT+IGwq8qrwQzH9MhG9+f2TAUzL+lDTX48ZdahHSVAEA0ONPP07O3k9tJzluNvWAvmzLEjq7LhXUIOSOn/Kv6k6WU=
X-Received: by 2002:a05:6512:3087:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-53438868deemr943389e87.52.1724399466989; Fri, 23 Aug 2024
 00:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-6-wenst@chromium.org>
 <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
In-Reply-To: <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 15:50:55 +0800
Message-ID: <CAGXv+5H0eGEjQU8qbKjua5qfbL2FaX2bMSyQg0PMVQrFfaiR8g@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
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

On Thu, Aug 22, 2024 at 10:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:58PM +0800, Chen-Yu Tsai wrote:
> > The I2C device tree component prober needs to get and toggle GPIO lines
> > for the components it intends to probe. These components may not use th=
e
> > same name for their GPIO lines, so the prober must go through the devic=
e
> > tree, check each property to see it is a GPIO property, and get the GPI=
O
> > line.
> >
> > Instead of duplicating the GPIO suffixes, or exporting them to the
> > prober to do pattern matching, simply add and export a new function tha=
t
> > does the pattern matching and returns the length of the GPIO name. The
> > caller can then use that to copy out the name if it needs to.
>
> ...
>
> > +/**
> > + * gpio_property_name_length - Returns the GPIO name length from a pro=
perty name
> > + * @str:     string to check
>
> It's property name, so, I would name this 'propname'.

Ack.

> > + * This function checks if the given name matches the GPIO property pa=
tterns, and
> > + * returns the length of the name of the GPIO. The pattern is "*-<GPIO=
 suffix>"
> > + * or just "<GPIO suffix>".
> > + *
> > + * Returns:
> > + * The length of the string before '-' if it matches "*-<GPIO suffix>"=
, or
>
> What about "x-y-gpios"? It's unclear what will be the behaviour.

I thought it was implied that the '-' mentioned here is the one before the
suffix. I made it more explicit.

> > + * 0 if no name part, just the suffix, or
> > + * -EINVAL if the string doesn't match the pattern.
> > + */
> > +int gpio_property_name_length(const char *str)
>
> gpio_get_... ?

Ack.

> > +{
> > +     size_t len;
> > +
> > +     len =3D strlen(str);
>
> If it has a thousands characters...?

Shouldn't matter much? I suppose using strrchr() as you suggested
requires one less pass.

> > +     /* string need to be at minimum len(gpio) */
> > +     if (len < 4)
> > +             return -EINVAL;
>
> Do we really need it here? See below as well.
>
> > +     /* Check for no-name case: "gpio" / "gpios" */
> > +     for (const char *const *p =3D gpio_suffixes; *p; p++)
> > +             if (!strcmp(str, *p))
> > +                     return 0;
>
> > +     for (size_t i =3D len - 4; i > 0; i--) {
> > +             /* find right-most '-' and check if remainder matches suf=
fix */
> > +             if (str[i] !=3D '-')
> > +                     continue;
> > +
> > +             for (const char *const *p =3D gpio_suffixes; *p; p++)
> > +                     if (!strcmp(str + i + 1, *p))
> > +                             return i;
> > +
> > +             return -EINVAL;
> > +     }
>
> This can be combined with the above
>
>         for (const char *const *p =3D gpio_suffixes; *p; p++) {
>                 /*
>                  * Find right-most '-' and check if remainder matches suf=
fix.
>                  * If no separator found, check for no-name cases.
>                  */
>                 dash =3D strrchr(propname, '-');

I believe this line could be moved out of the for-loop. Otherwise it
looks much more concise compared to my version. I'll omit the comment
though, as it is just rehashing the kerneldoc description, and now
that the function is so short, it shouldn't be hard to read.

I'll add you as "Suggested-by".


Thanks
ChenYu

>                 if (!strcmp(dash ? dash + 1 : propname, *p))
>                         return i;
>         }
>
> > +     return -EINVAL;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

