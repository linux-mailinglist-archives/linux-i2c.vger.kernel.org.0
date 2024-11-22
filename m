Return-Path: <linux-i2c+bounces-8138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D799D5ADB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FCA1F23712
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43E318B49B;
	Fri, 22 Nov 2024 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkCHLhtO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9819184101;
	Fri, 22 Nov 2024 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263339; cv=none; b=Qb/Kb3UcUgLNGM8nwSrI62lGpVDWeZCz3NIONC8F4QX4/Wwalt/hPtTuT4LjEvAzSVR78CLRAuceCRMdJjJDC3S+BbBL46h9ZBtG+uXCG8nKJvuQEaY2+SeDqo0q+ONB0tOZ9EZOVM4DnONnECVqD/gtb4grfEJoELAyR297S0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263339; c=relaxed/simple;
	bh=UXngmQ22E5Ln7cPommdezSyEwswMdAZSYYQteIcmhII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exuS48kkVj14hHTLF9YAnBkUuwixSeej/iniLkzH5yxWffTwu3j3r3JuDR8s2ulvc2G8HavRgU1uWCnd5lrVKh0xA9nAB73z+WIwD/DR7CzOLswlMMb4M3J2nIZFgD4BzRrrf+9OrdvjkeccspRI7g8uSAZXz865ujAmydwpdC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkCHLhtO; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee745e3b2bso22145297b3.0;
        Fri, 22 Nov 2024 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732263336; x=1732868136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyr8qLSn43QIrBhIICQVkh1BFCJxDyjXHmi9R1Z0AAg=;
        b=kkCHLhtOIpqe5H4w8qBboIFBWVw4FTRDjBxljfEADKu9itukrYBboh4r6NcJtki2HH
         n7UVvMuXYsvuB0Ht23e+OK9Q/Ju2q2csHcGCB6oLdQLZGXoGbs0b4emPV4+H9hF1pwK9
         nqayGZdLQkrRjH6Tx9M92MZzk7nehZ8BcZ7OYhnTI/V2FX7Vqjz3LP9nucTNqhq2ncnt
         enOHxiPDLkTEG/hrPN1aeP7V6sBYqHAkXBt3hGv+8BOukgO47Gio0Mfdxo73jH3n5xcc
         Jh5zNPCCIajNKrIZH2ygrWNjb6jRUfH3aTNr1NzaHuDabqcwz6R9DOZh7fZEt5cUwkO+
         o4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732263336; x=1732868136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyr8qLSn43QIrBhIICQVkh1BFCJxDyjXHmi9R1Z0AAg=;
        b=R8H7aHETg0f/4bXjlhFI+WUY/bPnh6W5quOebcUqD7bUuULpdBXWvp73Tmw10aOONX
         iIywGd/TqDESY+bps/s4g1yeyATaS+o9E2TbHQYwWKZpy5Fa342kBL+RbFtZKIwjnCPr
         NPYs1jZG+cXlXzaaTE6e7Jf4jNRtyIvTi3pycF48oBDjUOUtOmnakyP3oANCw8+ERKlH
         bGS7qL4KBc7N1LYkn9/1qG0gthRXc+CFBmLYLqpAQ2g7msLI9CbWo01LxEmoyf3IUmmA
         IfomB+/wzraNLPQ3qICBtOipvsw7P2AYfIe9FDaXHqtLZuMkivF+IscLGskwefgWcrQD
         9WoA==
X-Forwarded-Encrypted: i=1; AJvYcCU2WyExLH9owD3emx6WA+7WJV5azLkAAMuCqsCuIGhbqPGUKFWht3RiFFj2SYtiTEdjjbrj+1TRlB9K7A==@vger.kernel.org, AJvYcCU5gQTVBn7FmChr8Is0w0jbfBfv875zdNIioOKlHWqzVswzTw6KGlWp6NAq13O3BVzPHFvauHtXYGmV@vger.kernel.org, AJvYcCVAfaEv7sqoUu8Hv+sEHhKkHLmQG0gGITjNxZOnXuyYyZ0rAxSVK15A/TP2TBPrpR/91IJUyxfZ@vger.kernel.org, AJvYcCVJSKRDkluUedrxjweUXFi0RQpuUHggHFePBJx9sHPVDqasRmR/qjR351iw7YjXJLkZnc3mtABOPfE=@vger.kernel.org, AJvYcCVlFjY4Egt39ACx0b5EjfBib8TVwMzVvadGkSdGLOPh/UahIwPyqqpjy2zDzX2jyKFP2E8q4JTKf32zb5Q=@vger.kernel.org, AJvYcCVm+qKMmCsi02hwmTkk9kTbNkcqSUzatzIA1HkB6uoFE2TF7LLxcYBA8z/aYlpMlfihYv6tJk03euCVxPkU@vger.kernel.org, AJvYcCW30Rgm3bvxaLSlyi2nZ8Cr/PvUxiBWNQBMVaYnAkNJ4mO6uwlNo5+y8wREeO7EhEAVQ+FKDWIUNUvi@vger.kernel.org, AJvYcCWknUIrxd5IQKbpUEY4efq4BBVK6Qabha/LqF+NQ3OJC+VJ1aRDMzWfNRX4xkgXcG19vyG4W7qFRlLfH43JFis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEI81tUhnMYpj82d/mH092FQY5GdpuW7c6ZhTlDYSqfXo3hwA
	6mCfjDGWvKIZWuiGlJMJpRzD2N2GhBqoFG4FX/JF1zLawDK189Zh+5IEdxpVXVIMlu/TQz+gGuB
	DUWCRFClOi7W8bqD+fMvmy4ngA9M=
X-Gm-Gg: ASbGnctvS1Cl5cxFsCrhd2DWfx2XHH0QxtOn5ZQ7rUd5PPgYwSfrd/8jsrBwnyFumd9
	UU7yShf1gUBk5hg7jfdhG9GIUbi46XZA=
X-Google-Smtp-Source: AGHT+IH4e/mVYiQ32e25TRZ177Vd5CDQUc1yz6a5vA71sHZkd/Q1Rlk/9prOUk+6rMXUHws0NFGThryLzmxccLQtL+w=
X-Received: by 2002:a05:6902:c07:b0:e2b:dc72:3bdf with SMTP id
 3f1490d57ef6-e38f7047ea6mr2183988276.10.1732263336640; Fri, 22 Nov 2024
 00:15:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-7-tmyu0@nuvoton.com>
 <c1ff92a6-8ad9-43fa-97af-12b1471b5bef@roeck-us.net>
In-Reply-To: <c1ff92a6-8ad9-43fa-97af-12b1471b5bef@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 22 Nov 2024 16:15:25 +0800
Message-ID: <CAOoeyxW5PrvhO_cunYwAjXynLH9jZ4OQsdnju-ZONBKsrXgakg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for your comments,

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B411=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
...
> > +static int nct6694_in_read(struct device *dev, u32 attr, int channel,
> > +                        long *val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char vin_en;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     switch (attr) {
> > +     case hwmon_in_enable:
> > +             vin_en =3D data->hwmon_en[NCT6694_VIN_EN(channel / 8)];
> > +             *val =3D vin_en & BIT(channel % 8) ? 1 : 0;
>
> Nit: !!(vin_en & BIT(channel % 8))
>
> Not even worth mentioning, but !! is used below, so it would make sense
> to use it here as well for consistency.
>

Understood. I will make the modifications in v3.

> > +
> > +             return 0;
...
> > +static int nct6694_temp_write(struct device *dev, u32 attr, int channe=
l,
> > +                           long val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     signed char temp_max, temp_hyst;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     switch (attr) {
> > +     case hwmon_temp_enable:
> > +             return nct6694_enable_channel(dev, NCT6694_TIN_EN(channel=
 / 8),
> > +                                           channel, val);
> > +     case hwmon_temp_max:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                    NCT6694_HWMON_CMD2_OFFSET,
> > +                                    NCT6694_HWMON_CMD2_LEN,
> > +                                    data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             val =3D clamp_val(val, -127000, 127000);
> > +             data->xmit_buf[NCT6694_TIN_HL(channel)] =3D temp_to_reg(v=
al);
> > +
> > +             return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                      NCT6694_HWMON_CMD2_OFFSET,
> > +                                      NCT6694_HWMON_CMD2_LEN,
> > +                                      data->xmit_buf);
> > +     case hwmon_temp_max_hyst:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                    NCT6694_HWMON_CMD2_OFFSET,
> > +                                    NCT6694_HWMON_CMD2_LEN,
> > +                                    data->xmit_buf);
> > +
> > +             val =3D clamp_val(val, -127000, 127000);
> > +             temp_max =3D (signed char)data->xmit_buf[NCT6694_TIN_HL(c=
hannel)];
> > +             temp_hyst =3D (temp_max < 0) ? (temp_max + val / 1000) :
> > +                                          (temp_max - val / 1000);
> > +             if (temp_hyst < 0 || temp_hyst > 7)
> > +                     return -EINVAL;
> > +
>
> Just use clamp_val() again. Otherwise it is difficult for the user to det=
ermine
> valid ranges.
>

Understood. I will make the modifications in v3.

> > +             data->xmit_buf[NCT6694_TIN_HYST(channel)] =3D
> > +                    (data->xmit_buf[NCT6694_TIN_HYST(channel)] & ~NCT6=
694_TIN_HYST_MASK) |
> > +                    FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
> > +
> > +             return nct6694_write_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                      NCT6694_HWMON_CMD2_OFFSET,
> > +                                      NCT6694_HWMON_CMD2_LEN,
> > +                                      data->xmit_buf);
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
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
> > +             return nct6694_enable_channel(dev, NCT6694_FIN_EN(channel=
 / 8),
> > +                                           channel, val);
> > +     case hwmon_fan_min:
> > +             if (val <=3D 0)
> > +                     return -EINVAL;
> > +
> I'd suggest to just use clamp_val() and drop this check.
>

Understood. I will make the modifications in v3.

Best regards,
Ming

