Return-Path: <linux-i2c+bounces-8462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BD9EE000
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 08:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ED9A28418E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 07:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B1D2080F1;
	Thu, 12 Dec 2024 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yl6d8XxY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51832054F5;
	Thu, 12 Dec 2024 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987364; cv=none; b=R+OBkteE7HDCh2isNeaNmxe58vYsgJN0/IjgMTndruDmbhv8cNnl9fZFkFnfwq0RIN45Xd3Qx8dGmzMknCUYiTAh7LxnPNmccpgTAxCZ/KpOWewmCpRM3fguRk98z8URlKCiyHbLH7hNYWy2h0IFGLFi0puSfpt4wkWhmSg1zTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987364; c=relaxed/simple;
	bh=ppx7UfD7CEejgot3gKMNHifKqTD14/uIn7OPS3BeCXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/WPZpmiUbWmEODAW6MR/WjKlnNtrvgLaQc4z88AWebq0GIv8fPyLWpFiB3jfECeuYXN6OgEO7hFYQoAtp7PhD26qXkNGnf9P/b8KbHcYmo0aLomQFsvELkARh1dz3UHGZDicJo9PoKsEg4iHM8dg+EPidt+bsFKM4nmR5rg/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yl6d8XxY; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6efeb120f4dso2253327b3.0;
        Wed, 11 Dec 2024 23:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987362; x=1734592162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4diuvg+oaKU11EMSSWNfxeZbcZBFUZuzqgH4wRg5Iw=;
        b=Yl6d8XxYd9ezRMzNz3kedcSiSiU241OTnN7m7ANnTcoJXo2aiAFECAyYEaM7ZA87Hv
         YLJknx4RDSGoX0OPnw3iYcTArPyrI/a5nxm9CUdj1rvKQ1aGTabgb8TYgG9hqQjMhZIz
         CDoUqu0t+uqskNmId53mnUiTuHU4rwU1LAdWt/WGhXLe9DxNJjtM9ZLJx8sR4aE9Oza3
         lg2c2VvzHQg1aAiMIErUl9WMDy0589NqOVw4OtHnMisHtBmfvckhTLzxdWVN8P33rev2
         l3WBuIzdAUxAXGGCbdsu4C+Mt22iiTRGpP9c/VZKaVow6ERXcnRdNry6ccUUQLtp6nk5
         BSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987362; x=1734592162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4diuvg+oaKU11EMSSWNfxeZbcZBFUZuzqgH4wRg5Iw=;
        b=BIPcomr0//F+dJV5zsar+DMbnmAamzXGqqH9S3g/OW+35tufZFTjCuW07kQ52dWxS6
         4oUoHhP5Kbqa3ILkwjL7NBqzGjG370DJ7uxtgEgQVp8z63iV/qsnHe2puccMfgC+PI6k
         UKAz1GLDWK0OSnhuXT/Cwkbx/OYLVcS5dcutH3tvtMms9iRWHtxbH9J2LwSJA1jJ6uj4
         JM7sUU9fkmwa4CoA9lAvynBgFLUhk/mHTqf7Pc/CRFm3NTpmVoJNBk6Qmhb0UYQ0K8Pp
         uWmbWG3Dn8BIQz9WCgfWNbPcyZKkbpP0MyQQR5Da4IMrgiWHbXXgRJjCk8yuyVzy0oRH
         7gkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrr2fHwTwO0rUKWiKPYw5BBuwldfrrdUWadkf5KVUnRwT/cfTyQjE72mRreHkGVHtcvANuiZRYqc4=@vger.kernel.org, AJvYcCVRVkSGqlgN6WG9Ls39JTdZhQIkS1lNI63SoksXvmO1m3AgvfW8bgQlDubGbQoaVyEvXCQJey2YNOlO@vger.kernel.org, AJvYcCVq/mfjVqzltaw95yb44T6l/0crJYfWF1fAUNHAs5KoKAcLtX+wD1JLPe7ZBwpS04QXaxp516LM6dqAVrwwDro=@vger.kernel.org, AJvYcCWm8CLa0/rFMQZzorvu9BugDq0s5v5QDJjjw7FtUHNFPqbWqDva5ejeWUmMzWwO4cJJBGfJsx273wTIxQ==@vger.kernel.org, AJvYcCWozTPyNzY4Y1ePzq0RmQk2KeZTG1yiWUos6H1P3vh8eqT15YxO0Ya3APEoezuPG8LkxLxlZq7R@vger.kernel.org, AJvYcCX1T2W7ja3YLhP/apNLvDwJIVtM08IsUv6+QDs5ajLeiZOgzYMQLEspdIl3052azh4J0pxDGg8Xbzok@vger.kernel.org, AJvYcCXAQOwaGkOeB+THeZvz1uSIZBZpDiand+UA9dFeQ8/MeInxLGF2kVHqY2S7/Wwqvt6TO0kkX/qy7lt2Omk7@vger.kernel.org, AJvYcCXaIRaK8LU9Q3vX1rgUsL2SAYsRJ7VKMjP0a28DhP+bnei2euiwouxPRZmE96jECH+VfqYsqf5GNmWyI04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1Q5Rvjmgt8hjTZaa84O2RrIZGC+OK5PtRSq7P1rNEiN8yoGJ
	PE2DM4WLPjFzRWMXTcGscyHC1H925MmTt8JyL5yQxqlfTc2/E87nnvBzs+RBq3WVUv2Myt46g1c
	sQ0Fd04h54pHSWM90snfaVkruzQE=
X-Gm-Gg: ASbGncssVkSh3XRZl4rT0obgOL1aZtox1jyc5+sEw+gHHv5OBJRSUNMg1vIE+yGXIca
	taSVc4ZNtwaLAcYWAllEAHyQ5w94MedG8cUVruBoBaImtMVAoEvlK/JAK74cVP2//kRxqIok=
X-Google-Smtp-Source: AGHT+IEFnNvRXx/tWGI8Vg9odUppiuOyMiUJuKJRi9u+NERI+YEHW8pZeW9YW2nu+O89c7w8C1PY1wRA7xdCEH9HA/M=
X-Received: by 2002:a05:690c:6510:b0:6ef:8c41:dee0 with SMTP id
 00721157ae682-6f19e5073cemr18308147b3.20.1733987361747; Wed, 11 Dec 2024
 23:09:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-7-tmyu0@nuvoton.com>
 <d3548f81-63f9-422c-9884-895d501e64b0@roeck-us.net>
In-Reply-To: <d3548f81-63f9-422c-9884-895d501e64b0@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 12 Dec 2024 15:09:10 +0800
Message-ID: <CAOoeyxX5Ahm91w2aJV77Q4653g75ZbNOEoHd44RJ=WeB98S_OQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
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

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B412=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:58=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Tue, Dec 10, 2024 at 06:45:23PM +0800, Ming Yu wrote:
> > This driver supports Hardware monitor functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
>
> checkpatch:
>
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Ming Yu <a02=
82524688@gmail.com>' !=3D 'Signed-off-by: Ming Yu <tmyu0@nuvoton.com>'
>

Fix it in v4.

...

> > +static inline long in_from_reg(u8 reg)
> > +{
> > +     return reg * 16;
> > +}
> > +
> > +static inline u8 in_to_reg(long val)
> > +{
> > +     if (val <=3D 0)
> > +             return 0;
>
> This is pointless since the calling code already clamps the value to [0, =
2032].
>

Drop it in v4.

> > +     return val / 16;
>
> DIV_ROUND_CLOSEST() ?
>

Fix it in v4.

> > +}
> > +
> > +static inline long temp_from_reg(u8 reg)
> > +{
> > +     return reg * 1000;
>
> This always returns a positive value, even though the temperature is
> supposed to be signed. More on that below.
>

I will modify the return value to (sign_extend32(reg, 7) * 1000) in v4.

> > +}
> > +
> > +static inline u8 temp_to_reg(long val)
> > +{
> > +     return val / 1000;
>
> DIV_ROUND_CLOSEST() ?
>

Fix it in v4.

> > +}
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
> > +             *val =3D !!(vin_en & BIT(channel % 8)) ? 1 : 0;
>
> Drop "? 1 : 0"
>

Drop it in v4.

> > +
> > +             return 0;
> > +     case hwmon_in_input:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> > +                                    NCT6694_VIN_IDX(channel), 1,
> > +                                    data->xmit_buf);
>
> I am curious: Since the received data length is not returned, and the
> expected minimum length is not passed to nct6694_read_msg(), the driver
> has no means to check if the received data actually includes the expected
> values at the expected index. That doesn't matter here, but some of the
> returned data is located far into the buffer. Is it indeed not necessary
> for the driver to check if the received data is actually as long as
> expected ?
>

The fourth parameter is expected length of nct6694_read_msg(), which
in this case is 1.
I will add the data length validation code for handling the
response_header in both nct6694_read_msg() and nct6694_write_msg() in
the next patch.

> > +             if (ret)
> > +                     return ret;
...
> > +static int nct6694_temp_read(struct device *dev, u32 attr, int channel=
,
> > +                          long *val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char temp_en, temp_hyst;
> > +     int ret, int_part, frac_part;
> > +     signed char temp_max;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     switch (attr) {
> > +     case hwmon_temp_enable:
> > +             temp_en =3D data->hwmon_en[NCT6694_TIN_EN(channel / 8)];
> > +             *val =3D !!(temp_en & BIT(channel % 8)) ? 1 : 0;
>
> Drop "? 1 : 0"
>

Drop it in v4.

> > +
> > +             return 0;
> > +     case hwmon_temp_input:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> > +                                    NCT6694_TIN_IDX(channel), 2,
> > +                                    data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             int_part =3D sign_extend32(data->xmit_buf[0], 7);
> > +             frac_part =3D FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_=
buf[1]);
> > +             if (int_part < 0)
> > +                     *val =3D (int_part + 1) * 1000 - (8 - frac_part) =
* 125;
> > +             else
> > +                     *val =3D int_part * 1000 + frac_part * 125;
> > +
> > +             return 0;
> > +     case hwmon_temp_max:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                    NCT6694_HWMON_CMD2_OFFSET,
> > +                                    NCT6694_HWMON_CMD2_LEN,
> > +                                    data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D temp_from_reg(data->xmit_buf[NCT6694_TIN_HL(chan=
nel)]);
> > +
>
> If the value in NCT6694_TIN_HL() is signed, this will return a large posi=
tive
> value instead.
>

Understood! I will fix it in v4.

> > +             return 0;
> > +     case hwmon_temp_max_hyst:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                    NCT6694_HWMON_CMD2_OFFSET,
> > +                                    NCT6694_HWMON_CMD2_LEN,
> > +                                    data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             temp_max =3D (signed char)data->xmit_buf[NCT6694_TIN_HL(c=
hannel)];
> > +             temp_hyst =3D FIELD_GET(NCT6694_TIN_HYST_MASK,
> > +                                   data->xmit_buf[NCT6694_TIN_HYST(cha=
nnel)]);
> > +             if (temp_max < 0)
>
> This suggests that the temperature limit is signed, suggesting in turn th=
at
> temp_from_reg() is wrong.
>

Understood! I will fix it in v4.

> > +                     *val =3D temp_from_reg(temp_max + temp_hyst);
> > +             else
> > +                     *val =3D temp_from_reg(temp_max - temp_hyst);
> > +
> > +             return 0;
> > +     case hwmon_temp_max_alarm:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> > +                                    NCT6694_TIN_STS(channel / 8), 1,
> > +                                        data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D !!(data->xmit_buf[0] & BIT(channel % 8));
> > +
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char fanin_en;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_enable:
> > +             fanin_en =3D data->hwmon_en[NCT6694_FIN_EN(channel / 8)];
> > +             *val =3D !!(fanin_en & BIT(channel % 8)) ? 1 : 0;
>
> Drop "? 1 : 0"
>

Drop it in v4.

> > +
> > +             return 0;
> > +     case hwmon_fan_input:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> > +                                    NCT6694_FIN_IDX(channel), 2,
> > +                                    data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D (data->xmit_buf[1] |
> > +                    (data->xmit_buf[0] << 8)) & 0xFFFF;
>
> The "& 0xffff" is pointless.
>

Fix it in v4.

> > +
> > +             return 0;
> > +     case hwmon_fan_min:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD=
,
> > +                                    NCT6694_HWMON_CMD2_OFFSET,
> > +                                    NCT6694_HWMON_CMD2_LEN,
> > +                                    data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D (data->xmit_buf[NCT6694_FIN_LL(channel)] |
> > +                     data->xmit_buf[NCT6694_FIN_HL(channel)] << 8) & 0=
xFFFF;
>
> Same here.
>

Fix it in v4.

> > +
> > +             return 0;
> > +     case hwmon_fan_min_alarm:
> > +             ret =3D nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
> > +                                    NCT6694_FIN_STS(channel / 8),
> > +                                    1, data->xmit_buf);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D !!(data->xmit_buf[0] & BIT(channel % 8));
> > +
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
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
> > +             pwm_en =3D data->hwmon_en[NCT6694_PWM_EN(channel / 8)];
> > +             *val =3D !!(pwm_en & BIT(channel % 8)) ? 1 : 0;
>
> Drop "? 1 : 0".
>

Drop it in v4.

> > +
...
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
>
> DIV_ROUND_CLOSEST() ?
>

Fix it in v4.

> > +             temp_hyst =3D clamp_val(temp_hyst, 0, 7);
> > +             data->xmit_buf[NCT6694_TIN_HYST(channel)] =3D
> > +                    (data->xmit_buf[NCT6694_TIN_HYST(channel)] & ~NCT6=
694_TIN_HYST_MASK) |
> > +                    FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
> > +
...
> > +
> > +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
> > +{
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
>
> Not significant, but this is unnecessary because the function is only
> called once from probe.
>

Understood! I will drop it in the next patch.

> > +     /*
...
> > +static int nct6694_hwmon_probe(struct platform_device *pdev)
> > +{
> > +     struct nct6694_hwmon_data *data;
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct device *hwmon_dev;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->xmit_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ=
,
> > +                                   sizeof(unsigned char), GFP_KERNEL);
>
> Wondering ... why not just devm_kzalloc(..,. NCT6694_MAX_PACKET_SZ, ...) =
?
> sizeof(unsigned char) is always 1, after all.
>

Okay, I'll fix it.

> > +     if (!data->xmit_buf)
> > +             return -ENOMEM;
> > +
> > +     data->nct6694 =3D nct6694;
> > +     mutex_init(&data->lock);
> > +     platform_set_drvdata(pdev, data);
>
> This is unnecessary unless I am missing something.
>

Drop it in v4.

> > +
> > +     ret =3D nct6694_hwmon_init(data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Register hwmon device to HWMON framework */
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > +                                                      "nct6694", data,
> > +                                                      &nct6694_chip_in=
fo,
> > +                                                      NULL);
> > +     return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static struct platform_driver nct6694_hwmon_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "nct6694-hwmon",
> > +     },
> > +     .probe          =3D nct6694_hwmon_probe,
> > +};
> > +
> > +module_platform_driver(nct6694_hwmon_driver);
> > +
> > +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:nct6694-hwmon");
> > --
> > 2.34.1
> >
> >

Best regards,
Ming

