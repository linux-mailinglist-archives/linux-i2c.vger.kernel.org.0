Return-Path: <linux-i2c+bounces-7587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A349B0862
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 17:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3BAD1C22B86
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 15:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9110D158A2E;
	Fri, 25 Oct 2024 15:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmpGYw1k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388CF1339B1;
	Fri, 25 Oct 2024 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870433; cv=none; b=G2Zz7FGWeZ6Mfiw5RASBFsWzjl0qFTB4wy4bJxc6VFtnO7wG6W40pFa5P8+/wedHQ2M/cVG6FAJr5Z3G5ewdArpI99u/iu0zMn3AfGwwKBYP1gANwIwl1WKaPZNSh0Ei5KWtg1YbCaQdnHuZzgRGzPmQIfd9L3Am1fR2wSBy0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870433; c=relaxed/simple;
	bh=Cq2d7AMaJmgf7X1yzzs24AiYKxnvAxr3uFO0fjdUNZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPHDB3rxU0rhW0LvHuEJM0Z92yumzpv/mUwt8SnLpJllORcqr9VP5ys9FCVNFvTunoKe/9HPUgk6YRV0BW2W9xAgtBfRmNEiFlyEB2V+EA8MNbw1jj4+vY5z6fawFxqV98hKbGuqXXTA4FPEIHBsC6FvWselv6ZzFz74phIxQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmpGYw1k; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e330b7752cso24595637b3.1;
        Fri, 25 Oct 2024 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729870429; x=1730475229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLbQaWrMmC+8lXVUb6E2Hd5N+4Bi/RD2LyQ5FHw7Phw=;
        b=RmpGYw1kpBem8F/ib225cOqd7+ewPAqfPbSrf1aHnXTS8jEVX7Fii1QF8huddRX488
         jGxfDWRD7R688rVS/Jrbce2kGXMLuCD6Vw+4nJqB2q7FRamDsGxAMVGFH2IDluoYDJSC
         V+hnepXnuoCb7E7v3tjkiZBMWYFdYDyeHByboTc3Zx5YkXot3Z3XhB6CBywQPTe4myNN
         YHv8F+b64oKClW6kg9EhOXfblvaaW0r6vIr/atgknB2LU2i4TD6VOj+OgAi7y/b/Wlp2
         zBP0/BlhbOP3mocvELtPn4dMMuZ/e2BnyVs/QYhUbHlDvuDb1Ij0eiGFKsDhZKg7iDNQ
         rpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870429; x=1730475229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLbQaWrMmC+8lXVUb6E2Hd5N+4Bi/RD2LyQ5FHw7Phw=;
        b=aTDxIzTtfwBsnGplL6INPLOwRkZkD/zF3QLMHbJroCgE7iGQy0Emm+s5diLT2jPmyN
         w4KyP19Jtf3HeK3CZ8fkvyHXHCFJkNkkuZ2atxPnBCqMuzdbeTVB3F5Er7DbrBRH2wPv
         OoYtA0UsaBvAHP+QuYGuc9etCgUUnqGrqTSnfeGkecDWvmYUJ5v+cF8fCmSfl0WUoaEI
         k5tnNsv8ohOEa3x1oR6WDwD5LZs1m+5SgVbIy575K4vrbfyAhtSZr/Ub1gH6bdkNLarn
         ya1nyyGXeGtxj2sPb3rfxNRfKgq49F7aW5HC6KVnQU57oPEGet+xKq+2certsPFlr8LB
         9g5A==
X-Forwarded-Encrypted: i=1; AJvYcCU/gopEzS7PHPTiE09AmZ+Ky8s+9cvhf8JXGAipBWYf5Y/WqvO0GYDFJEYHJLB6aaXHlTHW6YnK+Zeg@vger.kernel.org, AJvYcCUcopglvwusaMDjJmRSp4s0JuZbEpSwFJAlKkvn6BqwzvIYltF6LzukqcZHkfTBBOm0HnD+TwtgrAyd@vger.kernel.org, AJvYcCUqxbufZ7Au5sPv8UwapbwSXWGLohlstgEmwrHZhMTYCRlRr9zzWqYAM+VrP/EOX95VsY5zfLrv0Mg=@vger.kernel.org, AJvYcCVWmm2gNYdEyTqX+ASHkO+ABEMnDNj6O+UK+gokQCr326cmu/2GQ5Uj/RWF+McpBOPfvrVQlU3+@vger.kernel.org, AJvYcCVdqeE8lE2kFMopAayM9+vJQDrMRdihI/oLgmV7MAcIXTl5ghUk/yx0LVMGMJg/C6GYK6abW9jtAC1Z@vger.kernel.org, AJvYcCWSDLZtKLsqnlKYEZsbUOEvLdHfIHVx6sSqhzk9IGpQb0DIi5T+Ya9DAVKN/jqp/m79Mz3U82FcbvOD@vger.kernel.org, AJvYcCXK1O2PskylY6B3WQgQ8zyRScw+Ffg7H+vNVf9tPz410aJuqSXiUyLQUZEzrR1P4IFCbN+G7YgiwsjGmkVktMU=@vger.kernel.org, AJvYcCXO6josHpIVMxqmhnUVX+u1VcdXdo/Dm5Ritgqdm6ECtgtRV9ZufG8bhhnaSggeUI+MuNHzayDWM+CnDg==@vger.kernel.org, AJvYcCXbQmYmN0tJ2hSWSmxoiw+LYDxrZQY9xKWJQMeaRsynZV4lpz6tMtFMVClLLd4cQLMBlIsRe1ndVyH0Zwfs@vger.kernel.org, AJvYcCXnxU2LpsXxsNQsU9t19ShO5jQ12ppxAkX3
 IHmQuzq+71PyUIw1altIjm8thvkZdNo2et885igHp5DALsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3pP2KE7M6mTkNj+aEhZ6aCt/9H8zkfvAbFVFxjNz22REbyQg
	qC48bBiWGKkAws9j44Nf4ye1/Z+Mywf0bB5y9AZwpaBgnoxry2cCyCtvC1UqrwqScLGJukKs9OR
	0EIhz/alAn5Zz2om0KQSq/PzyjnQ=
X-Google-Smtp-Source: AGHT+IHOwEqSB+uvs8enCwISaQKjRcg0wam9/1dUGBkNh36PUem8WjHEiINnLAMsX5e/BnBGIdZV3XkYWiN4YYkTup8=
X-Received: by 2002:a05:690c:ed6:b0:6dd:f81a:80fb with SMTP id
 00721157ae682-6e84a31a2cfmr48068777b3.1.1729870429113; Fri, 25 Oct 2024
 08:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <ef306d61-0e47-4a77-b934-7d1c8ab817df@roeck-us.net>
In-Reply-To: <ef306d61-0e47-4a77-b934-7d1c8ab817df@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 23:33:34 +0800
Message-ID: <CAOoeyxWef1q8kM6xNrsuJM2ZF9D6jfiiqoBat+Kpzb5+iBFqdA@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I will remove the unnecessary return statement and lock, and update
the part of the code you mentioned.

Thanks,
Ming

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:03=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10/24/24 01:59, Ming Yu wrote:
> > This driver supports Hardware monitor functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >   MAINTAINERS                   |   1 +
> >   drivers/hwmon/Kconfig         |  10 +
> >   drivers/hwmon/Makefile        |   1 +
> >   drivers/hwmon/nct6694-hwmon.c | 407 +++++++++++++++++++++++++++++++++=
+
> >   4 files changed, 419 insertions(+)
> >   create mode 100644 drivers/hwmon/nct6694-hwmon.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 63387c0d4ab6..2aa87ad84156 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16439,6 +16439,7 @@ M:    Ming Yu <tmyu0@nuvoton.com>
> >   L:  linux-kernel@vger.kernel.org
> >   S:  Supported
> >   F:  drivers/gpio/gpio-nct6694.c
> > +F:   drivers/hwmon/nct6694-hwmon.c
> >   F:  drivers/i2c/busses/i2c-nct6694.c
> >   F:  drivers/mfd/nct6694.c
> >   F:  drivers/net/can/nct6694_canfd.c
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 08a3c863f80a..740e4afe6582 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1625,6 +1625,16 @@ config SENSORS_NCT6683
> >         This driver can also be built as a module. If so, the module
> >         will be called nct6683.
> >
> > +config SENSORS_NCT6694
> > +     tristate "Nuvoton NCT6694 Hardware Monitor support"
> > +     depends on MFD_NCT6694
> > +     help
> > +       Say Y here to support Nuvoton NCT6694 hardware monitoring
> > +       functionality.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called nct6694-hwmon.
> > +
> >   config SENSORS_NCT6775_CORE
> >       tristate
> >       select REGMAP
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 9554d2fdcf7b..729961176d00 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) +=3D mlxreg-fan.o
> >   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) +=3D menf21bmc_hwmon.o
> >   obj-$(CONFIG_SENSORS_MR75203)       +=3D mr75203.o
> >   obj-$(CONFIG_SENSORS_NCT6683)       +=3D nct6683.o
> > +obj-$(CONFIG_SENSORS_NCT6694)        +=3D nct6694-hwmon.o
> >   obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-core.o
> >   nct6775-objs                        :=3D nct6775-platform.o
> >   obj-$(CONFIG_SENSORS_NCT6775)       +=3D nct6775.o
> > diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmo=
n.c
> > new file mode 100644
> > index 000000000000..7d7d22a650b0
> > --- /dev/null
> > +++ b/drivers/hwmon/nct6694-hwmon.c
> > @@ -0,0 +1,407 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 HWMON driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/slab.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mfd/nct6694.h>
> > +
> > +#define DRVNAME "nct6694-hwmon"
> > +
> > +/* Host interface */
> > +#define REQUEST_RPT_MOD                      0xFF
> > +#define REQUEST_HWMON_MOD            0x00
> > +
> > +/* Report Channel */
> > +#define HWMON_FIN_IDX(x)             (0x50 + ((x) * 2))
> > +#define HWMON_FIN_STS(x)             (0x6E + (x))
> > +#define HWMON_PWM_IDX(x)             (0x70 + (x))
> > +
> > +/* Message Channel*/
> > +/* Command 00h */
> > +#define REQUEST_HWMON_CMD0_LEN               0x40
> > +#define REQUEST_HWMON_CMD0_OFFSET    0x0000  /* OFFSET =3D SEL|CMD */
> > +#define HWMON_FIN_EN(x)                      (0x04 + (x))
> > +#define HWMON_PWM_FREQ_IDX(x)                (0x30 + (x))
> > +/* Command 02h */
> > +#define REQUEST_HWMON_CMD2_LEN               0x90
> > +#define REQUEST_HWMON_CMD2_OFFSET    0x0002  /* OFFSET =3D SEL|CMD */
> > +#define HWMON_SMI_CTRL_IDX           0x00
> > +#define HWMON_FIN_LIMIT_IDX(x)               (0x70 + ((x) * 2))
> > +#define HWMON_CMD2_HYST_MASK         0x1F
> > +/* Command 03h */
> > +#define REQUEST_HWMON_CMD3_LEN               0x08
> > +#define REQUEST_HWMON_CMD3_OFFSET    0x0003  /* OFFSET =3D SEL|CMD */
> > +
> > +struct nct6694_hwmon_data {
> > +     struct nct6694 *nct6694;
> > +
> > +     /* Make sure read & write commands are consecutive */
> > +     struct mutex hwmon_lock;
> > +};
> > +
> > +#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_ENABLE | HWMON_F_INPUT | \
> > +                               HWMON_F_MIN | HWMON_F_MIN_ALARM)
> > +#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_FREQ)
> > +
> > +static const struct hwmon_channel_info *nct6694_info[] =3D {
> > +     HWMON_CHANNEL_INFO(fan,
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN0 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN1 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN2 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN3 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN4 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN5 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN6 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN7 */
> > +                        NCT6694_HWMON_FAN_CONFIG,    /* FIN8 */
> > +                        NCT6694_HWMON_FAN_CONFIG),   /* FIN9 */
> > +
> > +     HWMON_CHANNEL_INFO(pwm,
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM0 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM1 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM2 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM3 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM4 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM5 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM6 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM7 */
> > +                        NCT6694_HWMON_PWM_CONFIG,    /* PWM8 */
> > +                        NCT6694_HWMON_PWM_CONFIG),   /* PWM9 */
> > +     NULL
> > +};
> > +
> > +static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char buf[2];
> > +     int ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_enable:
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> > +                                    REQUEST_HWMON_CMD0_OFFSET,
> > +                                    REQUEST_HWMON_CMD0_LEN,
> > +                                    HWMON_FIN_EN(channel / 8),
> > +                                    1, buf);
> > +             if (ret)
> > +                     return -EINVAL;
>
> Do not overwrite error return values.
>
> > +
> > +             *val =3D buf[0] & BIT(channel % 8) ? 1 : 0;
> > +
> > +             break;
> > +
> > +     case hwmon_fan_input:
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> > +                                    HWMON_FIN_IDX(channel), 2, 0,
> > +                                    2, buf);
> > +             if (ret)
> > +                     return -EINVAL;
> > +
> > +             *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> > +
> > +             break;
> > +
> > +     case hwmon_fan_min:
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> > +                                    REQUEST_HWMON_CMD2_OFFSET,
> > +                                    REQUEST_HWMON_CMD2_LEN,
> > +                                    HWMON_FIN_LIMIT_IDX(channel),
> > +                                    2, buf);
> > +             if (ret)
> > +                     return -EINVAL;
> > +
> > +             *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> > +
> > +             break;
> > +
> > +     case hwmon_fan_min_alarm:
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> > +                                    HWMON_FIN_STS(channel / 8),
> > +                                    1, 0, 1, buf);
> > +             if (ret)
> > +                     return -EINVAL;
> > +
> > +             *val =3D buf[0] & BIT(channel % 8);
> > +
> > +             break;
> > +
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char buf;
> > +     int ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_pwm_input:
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD,
> > +                                    HWMON_PWM_IDX(channel),
> > +                                    1, 0, 1, &buf);
> > +             if (ret)
> > +                     return -EINVAL;
> > +
> > +             *val =3D buf;
> > +
> > +             break;
> > +     case hwmon_pwm_freq:
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> > +                                    REQUEST_HWMON_CMD0_OFFSET,
> > +                                    REQUEST_HWMON_CMD0_LEN,
> > +                                    HWMON_PWM_FREQ_IDX(channel),
> > +                                    1, &buf);
> > +             if (ret)
> > +                     return -EINVAL;
> > +
> > +             *val =3D buf * 25000 / 255;
> > +
> > +             break;
> > +
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_fan_write(struct device *dev, u32 attr, int channel=
,
> > +                          long val)
> > +{
> > +     struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +     unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};
> > +     unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> > +     u16 fan_val =3D (u16)val;
>
> This is wrong. It will result in overflows/underflows if out of range
> values are provided, and the driver should not write 0 if the user
> writes 65536. You need to use clamp_val() instead. For values with
> well defined range (specifically hwmon_fan_enable) you need to validate
> the parameter, not just take it as boolean.

[Ming] Okay! I'll update the code in the next patch.

>
> > +     int ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_enable:
> > +             mutex_lock(&data->hwmon_lock);
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> > +                                    REQUEST_HWMON_CMD0_OFFSET,
> > +                                    REQUEST_HWMON_CMD0_LEN, 0,
> > +                                    REQUEST_HWMON_CMD0_LEN,
> > +                                    enable_buf);
> > +             if (ret)
> > +                     goto err;
> > +
> > +             if (val)
> > +                     enable_buf[HWMON_FIN_EN(channel / 8)] |=3D BIT(ch=
annel % 8);
> > +             else
> > +                     enable_buf[HWMON_FIN_EN(channel / 8)] &=3D ~BIT(c=
hannel % 8);
> > +
> > +             ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MO=
D,
> > +                                     REQUEST_HWMON_CMD0_OFFSET,
> > +                                     REQUEST_HWMON_CMD0_LEN, enable_bu=
f);
> > +             if (ret)
> > +                     goto err;
> > +
> > +             break;
> > +
> > +     case hwmon_fan_min:
> > +             mutex_lock(&data->hwmon_lock);
> > +             ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD=
,
> > +                                    REQUEST_HWMON_CMD2_OFFSET,
> > +                                    REQUEST_HWMON_CMD2_LEN, 0,
> > +                                    REQUEST_HWMON_CMD2_LEN, buf);
> > +             if (ret)
> > +                     goto err;
> > +
> > +             buf[HWMON_FIN_LIMIT_IDX(channel)] =3D (u8)((fan_val >> 8)=
 & 0xFF);
> > +             buf[HWMON_FIN_LIMIT_IDX(channel) + 1] =3D (u8)(fan_val & =
0xFF);
> > +             ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MO=
D,
> > +                                     REQUEST_HWMON_CMD2_OFFSET,
> > +                                     REQUEST_HWMON_CMD2_LEN, buf);
> > +             if (ret)
> > +                     goto err;
> > +
> > +             break;
>
> The error handler goto and the break accomplish exactly the same,
> thus the conditional goto is pointless.
>
> > +
> > +     default:
> > +             ret =3D -EOPNOTSUPP;
> > +             goto err;
>
> As mentioned in my other reply, the lock is not acquired here,
> causing an unbalanced unlock.
>
> > +     }
> > +
> > +err:
> > +     mutex_unlock(&data->hwmon_lock);
> > +     return ret;
> > +}
> > +
> > +static int nct6694_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> > +                     u32 attr, int channel, long *val)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan: /* in RPM */
> > +             return nct6694_fan_read(dev, attr, channel, val);
> > +
> > +     case hwmon_pwm: /* in value 0~255 */
> > +             return nct6694_pwm_read(dev, attr, channel, val);
> > +
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
>
> Unnecessary return statement. Also seen elsewhere.
>
> > +}
> > +
> > +static int nct6694_write(struct device *dev, enum hwmon_sensor_types t=
ype,
> > +                      u32 attr, int channel, long val)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             return nct6694_fan_write(dev, attr, channel, val);
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static umode_t nct6694_is_visible(const void *data, enum hwmon_sensor_=
types type,
> > +                               u32 attr, int channel)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_enable:
> > +             case hwmon_fan_min:
> > +                     return 0644;
> > +
> > +             case hwmon_fan_input:
> > +             case hwmon_fan_min_alarm:
> > +                     return 0444;
> > +
> > +             default:
> > +                     return 0;
> > +             }
> > +
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_input:
> > +             case hwmon_pwm_freq:
> > +                     return 0444;
> > +             default:
> > +                     return 0;
> > +             }
> > +
> > +     default:
> > +             return 0;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct hwmon_ops nct6694_hwmon_ops =3D {
> > +     .is_visible =3D nct6694_is_visible,
> > +     .read =3D nct6694_read,
> > +     .write =3D nct6694_write,
> > +};
> > +
> > +static const struct hwmon_chip_info nct6694_chip_info =3D {
> > +     .ops =3D &nct6694_hwmon_ops,
> > +     .info =3D nct6694_info,
> > +};
> > +
> > +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
> > +{
> > +     unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> > +     int ret;
> > +
> > +     /* Set Fan input Real Time alarm mode */
> > +     mutex_lock(&data->hwmon_lock);
>
> Pointless lock (this is init code)
>
> > +     ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
> > +                            REQUEST_HWMON_CMD2_OFFSET,
> > +                            REQUEST_HWMON_CMD2_LEN, 0,
> > +                            REQUEST_HWMON_CMD2_LEN, buf);
> > +     if (ret)
> > +             goto err;
> > +
> > +     buf[HWMON_SMI_CTRL_IDX] =3D 0x02;
> > +
> > +     ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
> > +                             REQUEST_HWMON_CMD2_OFFSET,
> > +                             REQUEST_HWMON_CMD2_LEN, buf);
> > +     if (ret)
> > +             goto err;
> > +
> > +err:
> > +     mutex_unlock(&data->hwmon_lock);
> > +     return ret;
> > +}
> > +
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
> > +     data->nct6694 =3D nct6694;
> > +     mutex_init(&data->hwmon_lock);
> > +     platform_set_drvdata(pdev, data);
> > +
> > +     ret =3D nct6694_hwmon_init(data);
> > +     if (ret)
> > +             return -EIO;
>
> Again, do not overwrite error codes.
>
> > +
> > +     /* Register hwmon device to HWMON framework */
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > +                                                      "nct6694", data,
> > +                                                      &nct6694_chip_in=
fo,
> > +                                                      NULL);
> > +     if (IS_ERR(hwmon_dev)) {
> > +             dev_err(&pdev->dev, "%s: Failed to register hwmon device!=
\n",
> > +                     __func__);
>
> Use dev_err_probe(), and the function name is pointless.

[Ming] Okay! I'll change it in the next patch.

>
> > +             return PTR_ERR(hwmon_dev);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver nct6694_hwmon_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D DRVNAME,
> > +     },
> > +     .probe          =3D nct6694_hwmon_probe,
> > +};
> > +
> > +static int __init nct6694_init(void)
> > +{
> > +     int err;
> > +
> > +     err =3D platform_driver_register(&nct6694_hwmon_driver);
> > +     if (!err) {
> > +             if (err)
>
> Seriously ? Read this code again. It is never reached (and pointless).

[Ming] For platform driver registration, I'll change it to
module_platform_driver() in the next patch.

>
> > +                     platform_driver_unregister(&nct6694_hwmon_driver)=
;
> > +     }
> > +
> > +     return err;
> > +}
> > +subsys_initcall(nct6694_init);
> > +
> > +static void __exit nct6694_exit(void)
> > +{
> > +     platform_driver_unregister(&nct6694_hwmon_driver);
> > +}
> > +module_exit(nct6694_exit);
> > +
> > +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
>

