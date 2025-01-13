Return-Path: <linux-i2c+bounces-9036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDBEA0ADA7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 04:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6DF3A600B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 03:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8172D139CEF;
	Mon, 13 Jan 2025 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msrmVdeE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C279E1;
	Mon, 13 Jan 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736737222; cv=none; b=rWGLD+Ik/ca036BVBdCx88tt91VWpGZS7Y+8s8b4RMTsFTiQ4jyxNzcL2lC0g3Ancgu4qVFuIwOHZiGkRUHcaZHBJgARK5q8RfU4nwcHM3do0AfX0zBWu9zJaWIgTxbAHuBIwcAF1IFn3MudHDb52M3yPGzWZMDDLS9hPBq3k8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736737222; c=relaxed/simple;
	bh=vWDv9c+Hb5NFBDqnLC3anS0jUC4B07QypVbhZL/BxTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmf+eAJtbIH/LRS8V24RLS3He/IwgfqZL506ztWHylZCrB4fqg/SgCTwMuMrCtb8UqXLm2a2njhg0oVVqYt+7B0Lp0S+QIq73hrZKFXldmyZSsqrhgUQA2V0rRRo9bY5GkvZNtpDiUlUJnWcBwy2FtlLvLbYMqhX8qTPJPBOCJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msrmVdeE; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e3983426f80so5878731276.1;
        Sun, 12 Jan 2025 19:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736737219; x=1737342019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHUyb9eNg2JqWHIeEtx4JxxlaEahhQgvricUcB0kaU=;
        b=msrmVdeEXhgI6OED5WasaszCm5FJkvfwO3V8oini06lN/Mojp3sV8ykJybQRGFQWuS
         Ew4rAU1R1AUK5pgbno5Nb9RR+bIkn0OW4uJHmQ7s4+rWo6lPX85smR7wyx5j77HZ9aMq
         twY7tS0SH6tJqpETq5PeX0L7Kg+L3Gvn6n6nY3cNWnkgziJiZ/GHE427Oj8YzvkBuyz/
         GVJY80AGg0t+ybgFyfDcoiM6yi5Tt089NLddd9HtHC2v4QDZ3BKyQjQZiPwTRSDOxO0H
         pn6tFJ8vrNY7+q0LNx/aAirs4YN6unnNSLhHvcsZXTepPJAN2MAPfpXycAhj4NpfjnXN
         Pvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736737219; x=1737342019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vHUyb9eNg2JqWHIeEtx4JxxlaEahhQgvricUcB0kaU=;
        b=qTHphbfIIT1Iq8UwDKRHQ574R1okZ5Z2hcmXyK/XKLbBxk293ek3NIvwHiYEZkdrkV
         mDKlYRl7iwi15/lr4/bfr2t2f3OAh1SjXJMMIU7lfylitsgKmYZZcdTX0KiRrUojYn+m
         ZsLR8sAgP8VXyitGejHPZrPve5gDE7o4aS4g7nbqR1ubSAoa3dNUa9Y9ZZ4B4oQuxRDV
         KUbzrdwi8ugQyHhO/lOrR3cJ/r9KUr3kAM5h4o5HAJW1l2rE53rs0OfjaFl17Whtubse
         jqrTWs+YEPqegIF3irgAaWl3c1h1xH368c9mc0SGfFBxO8MKyCQVuoxpE3Qj4PsGmoAx
         UYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK0CiXomYykw0fdYj25dDmuoz/DZ4uJO3K2AxyvWTU8flJhvikoOuw9IBPC0ybs/6dyjgORcr/@vger.kernel.org, AJvYcCW0ApG1ciJhKM3IKFIVaRBORJuiwNEbF8++CiaFhPEizgTZcR3fwFxpmu/v0dYxgiQYQ08bJBfXlXlZ+H83@vger.kernel.org, AJvYcCW6EaLrO+tG32JQ0cue501tXWsg4XFhspq3VfT/Kba979fUmpClYRfKlTIk4gl7RifjG5EGhYqreHj+@vger.kernel.org, AJvYcCWMmIrFgET8eIEZlM1xmwg7b73IWmYEzR5ajuUQLOtuqeKNwdaFddDaEDpuhyJEFDRo1SpLo1rufE7Dk536ZAg=@vger.kernel.org, AJvYcCWO+oeLv2sCLPYF6YY2NyFoJfy9kMEMoJ3RejC7We6Ihj74u8nqlX9Slin68afjb0DV87ogDvkEZVwW@vger.kernel.org, AJvYcCWTdxm8p1omKnHHmheTqjL4KsjoQFY/8u3ZWOhgQh24MxzIABD6NgS2ZYgHIV9On3utXfGl9F5cK99sreA=@vger.kernel.org, AJvYcCX20F3YL8xNuL17QBGXdtMQBbKB0AYtjkbbvA+2M78HpK1rqJ5godFBk/fGSYflfzYWfL9oa7XPc3YftA==@vger.kernel.org, AJvYcCXcKAb20c0Lj9IQ0urOd6JsQ3dDTXJbz/FVxlUt5o4TuGW2GWcY3PkPA4U5GJ+ptk9WTukgx65oTCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxobPcfGrskszvDhj9vf0VjY4IUM9aypLXs2avVgcBTYruQ9wj
	LxtFSMwhhUXvo4qZIPdlv1kWHt3wMZ3vUbgBuyRqYYJDJxzSIUOrOFe2ZGEwUh3hZL4Zd1BEVPd
	haJYYAgbSONTloICF8jkoCr0T/qo=
X-Gm-Gg: ASbGncubp5jZFm15NToKBfk87nrjcXQn9k0H3umDmqmj2WsUvn7eB3GNyJggPD3RGxW
	cPsN4i9M5JtDr0qFhlTPPD8k4sXoiJDcUX2XkNd85rJHDD4/0ni8b+HDHxdYf3w/5Dkr+M08=
X-Google-Smtp-Source: AGHT+IGsfoH84Emy/3VAy+2ciT/LDM53GHF7kLpSuNtlkY+mcbIYtSqMBLpJAo2tp5wPRRi4KWOuDrwlzY99kXjwbZU=
X-Received: by 2002:a25:2104:0:b0:e47:f4e3:87e3 with SMTP id
 3f1490d57ef6-e54edf25ca4mr10429337276.11.1736737218579; Sun, 12 Jan 2025
 19:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-7-a0282524688@gmail.com> <20250106135135.GN4068@kernel.org>
In-Reply-To: <20250106135135.GN4068@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 13 Jan 2025 11:00:07 +0800
X-Gm-Features: AbW1kvZmveBm_1ZsSzbrQ6SCqOa0J-Y9vxXUkcqQ9J4x_X6pa8sZdwCwcoEMWQw
Message-ID: <CAOoeyxWvRzHRVLW-U=nemfUpoF5pcO_bDmvg4U-wVqkFp=V=Yg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Simon Horman <horms@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Simon,

Thank you for your comments,

Simon Horman <horms@kernel.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=886=E6=97=A5=
 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char pwm_en;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     switch (attr) {
> > +     case hwmon_pwm_enable:
> > +             pwm_en =3D data->hwmon_en.pwm_en[channel / 8];
> > +             *val =3D !!(pwm_en & BIT(channel % 8));
> > +
> > +             return 0;
> > +     case hwmon_pwm_input:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> > +                                    NCT6694_PWM_IDX(channel),
> > +                                    sizeof(data->rpt->fin),
> > +                                    &data->rpt->fin);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D data->rpt->fin;
>
> Hi Ming Yu,
>
> *val is host byte order, but fin is big endian.
> Elsewhere in this patch this seems to be handled using,
> which looks correct to me:
>
>                 *val =3D be16_to_cpu(data->rpt->fin);
>
> Flagged by Sparse.
>

Yes, it needs to be fixed to be16_to_cpu(). I'll make the modification
in the next patch.

> > +
> > +             return 0;
> > +     case hwmon_pwm_freq:
> > +             *val =3D NCT6694_FREQ_FROM_REG(data->hwmon_en.pwm_freq[ch=
annel]);
> > +
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
>
> ...
>
> > +static int nct6694_fan_write(struct device *dev, u32 attr, int channel=
,
> > +                          long val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_enable:
> > +             if (val =3D=3D 0)
> > +                     data->hwmon_en.fin_en[channel / 8] &=3D ~BIT(chan=
nel % 8);
> > +             else if (val =3D=3D 1)
> > +                     data->hwmon_en.fin_en[channel / 8] |=3D BIT(chann=
el % 8);
> > +             else
> > +                     return -EINVAL;
> > +
> > +             return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                      NCT6694_HWMON_CONTROL,
> > +                                      sizeof(data->msg->hwmon_ctrl),
> > +                                      &data->hwmon_en);
> > +     case hwmon_fan_min:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                    NCT6694_HWMON_ALARM,
> > +                                    sizeof(data->msg->hwmon_alarm),
> > +                                    &data->msg->hwmon_alarm);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             val =3D clamp_val(val, 1, 65535);
> > +             data->msg->hwmon_alarm.fin_ll[channel] =3D (u16)cpu_to_be=
16(val);
>
> cpu_to_be16() returns a 16bit big endian value.
> And, AFAIKT, the type of data->msg->hwmon_alarm.fin_ll[channel] is __be16=
.
>
> So the cast above seems both unnecessary and misleading.
>
> Also flagged by Sparse,
>

Understood. Fix it in v5.

> ...

Best regards,
Ming

