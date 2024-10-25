Return-Path: <linux-i2c+bounces-7585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DFA9B077E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 17:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2485A1F26B1F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 15:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308BA20BB5A;
	Fri, 25 Oct 2024 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m31cEXQ5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F01158861;
	Fri, 25 Oct 2024 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869054; cv=none; b=amz5my1ysp/WXESx5tDRxgBuzLJCKo5oSW36qmv0mL85YS69ppaICXFvbBXC/RJKRPzeLOCfCDpVjf0fdjypqc5nK/0KIkWijlsGk411eeOb06Fd/FYXVJsNEKOvgsoRrHrjJn+QYpyTdLJneriehsbqf6C9i+4Ng92VBBx9yYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869054; c=relaxed/simple;
	bh=NnGaC0MapQ/uU7EBQTIV3b985hFkGxfDFGuwRBB04/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHmR4sj9sVUp+NguxoiNpp4WXx6XfnEWL17sP+9NkGVWtMb62klfuHSBIIIYSFNm5S1ITecMGc4ET3xovlKosb4odK4Ebq2QTM/G/oz92C/HFRtRCnZfbj2PbqGrj0HY8U2AUsj/obpNeLC9cXxguRHg6CU+f9ixUJbzge0Tk5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m31cEXQ5; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2e2ef2e906so2505421276.2;
        Fri, 25 Oct 2024 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729869051; x=1730473851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQea3tO9vmCJ9tbOfx9ZKRZNBxbZElEyPnxqsxB/BYc=;
        b=m31cEXQ5kLMvd1szEQkzXsv5IlRkN5KPWcEyhhT2u4VvOGr+gHEZcUnZ15oQzePJa1
         7KXNyc/cIhSA8k2s+rPCIc5PMcz8t3E41JM/sW7/JN/yv7sn4ZtmeVMkbSGXe5p0Qj5Z
         k58t+w3damexqzkV/7puztvm0UnecJEajStpugAl1qSGKw9KY1r/HuJ0dnQMICYAzst7
         H3PHuipbuZwMtA+0u7glOQX84VwKhk/Ujku7TqEontyrfovGSjug4+xyMeIGNBnkob68
         /hAnpRkW163HA/uahzsxIc39e3gH8hKVfGz+XH5zuNWyefed3My+IwKtyZyoI82eluFZ
         bPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869051; x=1730473851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQea3tO9vmCJ9tbOfx9ZKRZNBxbZElEyPnxqsxB/BYc=;
        b=rsfPNe+y0cE3i535OnAA7XPlzMZ4eHlfy/yFCjBr/oIJ8lkWyDZwFnIO6gqx8kYbdR
         mv2pfEUz1CKt+Ycdg5lPvp6wWfABNQNezJxKLAir2bqqQxMjSOD/xX9dGvXHA9xveNrX
         z0jDdYf8tREFAxrm5CxEa299elBgLxUYtV5mLy1azuS2xw/s3vXzfJFuIrVXc8x09qsw
         Em3H2Hxwwf76PDQpmx1uRKqCVJxaz7c1ze1P3wIHwrzwf6mqDQf9/7J+9BRzkaJyC+fQ
         qCxNIgKw/OSyekLmpqMZDsFp3oJE69EujQs4eUlt3DDBrdqADzlEYHDZ5MXdjTRlyfpn
         4H9w==
X-Forwarded-Encrypted: i=1; AJvYcCV8fYvZCCGq6TciZ8aDFD3leYsoJMqQmZ6LSwA35VF90CXUTInHtm75lm2yheWTu/CSdorNxDx/n6xsdoyR@vger.kernel.org, AJvYcCVEtXkuWqhiCglf6mj6n6jS2MdWWpYZ7WAMX5b3wFnLD9f+zsumptaGww+IaPowbj6PrimJeKQy/mRUQPc=@vger.kernel.org, AJvYcCVg5LYK1O5Yunrf12d7b6ZE3ZbFIE6TJX0r1P3qfJH/tM7XuSKrUPET3ZS1W+b4uLYyyPQvHkSCocNy@vger.kernel.org, AJvYcCW9KW9Vci8VDFRh68APtaLBg7nwmVcp27torQ90XjRhRhtbN1GqXWNyW1jv7dPhAbrCe9LFwxjt79Kz@vger.kernel.org, AJvYcCWpisrTawlNTmjm6GrM3kOHCIb+nljmhmKycHTJuCiqVIslMUyTPlG6tec2pffOBfL9zrjB+wDnAbG5@vger.kernel.org, AJvYcCX1IOMsZqrO9CAYiV2wqOQjEyyNOC8D3/9bQNfIeM4O3xfXhg3HWIkvWprPUdFbh4SdfUZ1pCr6@vger.kernel.org, AJvYcCXMXfzcvbuTw4nXKzc4vSGIn5FiP9o+a4y+a11mLRMqUN+jiWWIlU3tU+mgSgTqBdyPnqlxA8SlO8vIj2d4KVw=@vger.kernel.org, AJvYcCXanjmuunOWKbgI1o5uIsW9lDIpCi9EoX//k9QcYSTDbeqtPvMwUAxe4wh5SSUzSpBzgqf70QumVzk=@vger.kernel.org, AJvYcCXob8rBEfvi57FmKmX5esfgPOtfhQlJWOT8NPbIBvAuLZuye3uB7lGj0HoH6g3EbGykkdDe8ZbJD3TV@vger.kernel.org, AJvYcCXvw9yXdq6vqsG3vpf26dIAEEKwS67nVK9F
 KuXFp+nCbnNCNEUIc0yXJwPqZXkKhd5cUWnsszjP5gZtTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmY4HjbiffxFkdWm5WhEWtRN0rJdHFn5HgwGHLHCrfZ1nwRzVP
	CVhBRhJeDpyQOoeqzS0z92Y3UBVLRT1XfftDOzojiro5BDiR7ySrEuswXI1LpHhqbdStjtsG8nx
	pKTrAkwSlK+1FU5AkX78jr6CW4gA=
X-Google-Smtp-Source: AGHT+IEKTIP9/v66F5ynswKvVD9uaUspfJZVVXjyMQfVF7V3KOCc4Zewa7eB5Yc+1N/+KzlLanQiqPulSh2OgbQ8ouU=
X-Received: by 2002:a05:690c:4783:b0:6e5:b96b:6de2 with SMTP id
 00721157ae682-6e7f0fdb0e9mr86433697b3.42.1729869050569; Fri, 25 Oct 2024
 08:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
In-Reply-To: <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 23:10:35 +0800
Message-ID: <CAOoeyxXLxVwvUv=TRY+L8MmCC0VXy-K0ukHbVvv7Wjmb5wgawg@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Kalesh,

Thank you for your comments.

Ming

Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com> =E6=96=BC
2024=E5=B9=B410=E6=9C=8824=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:=
20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Oct 24, 2024 at 2:33=E2=80=AFPM Ming Yu <a0282524688@gmail.com> w=
rote:
> >
> > This driver supports Hardware monitor functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >  MAINTAINERS                   |   1 +
> >  drivers/hwmon/Kconfig         |  10 +
> >  drivers/hwmon/Makefile        |   1 +
> >  drivers/hwmon/nct6694-hwmon.c | 407 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 419 insertions(+)
> >  create mode 100644 drivers/hwmon/nct6694-hwmon.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 63387c0d4ab6..2aa87ad84156 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16439,6 +16439,7 @@ M:      Ming Yu <tmyu0@nuvoton.com>
> >  L:     linux-kernel@vger.kernel.org
> >  S:     Supported
> >  F:     drivers/gpio/gpio-nct6694.c
> > +F:     drivers/hwmon/nct6694-hwmon.c
> >  F:     drivers/i2c/busses/i2c-nct6694.c
> >  F:     drivers/mfd/nct6694.c
> >  F:     drivers/net/can/nct6694_canfd.c
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 08a3c863f80a..740e4afe6582 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1625,6 +1625,16 @@ config SENSORS_NCT6683
> >           This driver can also be built as a module. If so, the module
> >           will be called nct6683.
> >
> > +config SENSORS_NCT6694
> > +       tristate "Nuvoton NCT6694 Hardware Monitor support"
> > +       depends on MFD_NCT6694
> > +       help
> > +         Say Y here to support Nuvoton NCT6694 hardware monitoring
> > +         functionality.
> > +
> > +         This driver can also be built as a module. If so, the module
> > +         will be called nct6694-hwmon.
> > +
> >  config SENSORS_NCT6775_CORE
> >         tristate
> >         select REGMAP
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 9554d2fdcf7b..729961176d00 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) +=3D mlxreg-fan.o
> >  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) +=3D menf21bmc_hwmon.o
> >  obj-$(CONFIG_SENSORS_MR75203)  +=3D mr75203.o
> >  obj-$(CONFIG_SENSORS_NCT6683)  +=3D nct6683.o
> > +obj-$(CONFIG_SENSORS_NCT6694)  +=3D nct6694-hwmon.o
> >  obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-core.o
> >  nct6775-objs                   :=3D nct6775-platform.o
> >  obj-$(CONFIG_SENSORS_NCT6775)  +=3D nct6775.o
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
> > +#define REQUEST_RPT_MOD                        0xFF
> > +#define REQUEST_HWMON_MOD              0x00
> > +
> > +/* Report Channel */
> > +#define HWMON_FIN_IDX(x)               (0x50 + ((x) * 2))
> > +#define HWMON_FIN_STS(x)               (0x6E + (x))
> > +#define HWMON_PWM_IDX(x)               (0x70 + (x))
> > +
> > +/* Message Channel*/
> > +/* Command 00h */
> > +#define REQUEST_HWMON_CMD0_LEN         0x40
> > +#define REQUEST_HWMON_CMD0_OFFSET      0x0000  /* OFFSET =3D SEL|CMD *=
/
> > +#define HWMON_FIN_EN(x)                        (0x04 + (x))
> > +#define HWMON_PWM_FREQ_IDX(x)          (0x30 + (x))
> > +/* Command 02h */
> > +#define REQUEST_HWMON_CMD2_LEN         0x90
> > +#define REQUEST_HWMON_CMD2_OFFSET      0x0002  /* OFFSET =3D SEL|CMD *=
/
> > +#define HWMON_SMI_CTRL_IDX             0x00
> > +#define HWMON_FIN_LIMIT_IDX(x)         (0x70 + ((x) * 2))
> > +#define HWMON_CMD2_HYST_MASK           0x1F
> > +/* Command 03h */
> > +#define REQUEST_HWMON_CMD3_LEN         0x08
> > +#define REQUEST_HWMON_CMD3_OFFSET      0x0003  /* OFFSET =3D SEL|CMD *=
/
> > +
> > +struct nct6694_hwmon_data {
> > +       struct nct6694 *nct6694;
> > +
> > +       /* Make sure read & write commands are consecutive */
> > +       struct mutex hwmon_lock;
> > +};
> > +
> > +#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_ENABLE | HWMON_F_INPUT | \
> > +                                 HWMON_F_MIN | HWMON_F_MIN_ALARM)
> > +#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_FREQ)
> > +
> > +static const struct hwmon_channel_info *nct6694_info[] =3D {
> > +       HWMON_CHANNEL_INFO(fan,
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN0 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN1 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN2 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN3 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN4 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN5 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN6 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN7 */
> > +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN8 */
> > +                          NCT6694_HWMON_FAN_CONFIG),   /* FIN9 */
> > +
> > +       HWMON_CHANNEL_INFO(pwm,
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM0 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM1 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM2 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM3 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM4 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM5 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM6 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM7 */
> > +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM8 */
> > +                          NCT6694_HWMON_PWM_CONFIG),   /* PWM9 */
> > +       NULL
> > +};
> > +
> > +static int nct6694_fan_read(struct device *dev, u32 attr, int channel,
> > +                           long *val)
> > +{
> > +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf[2];
> > +       int ret;
> > +
> > +       switch (attr) {
> > +       case hwmon_fan_enable:
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_M=
OD,
> > +                                      REQUEST_HWMON_CMD0_OFFSET,
> > +                                      REQUEST_HWMON_CMD0_LEN,
> > +                                      HWMON_FIN_EN(channel / 8),
> > +                                      1, buf);
> > +               if (ret)
> > +                       return -EINVAL;
> > +
> > +               *val =3D buf[0] & BIT(channel % 8) ? 1 : 0;
> > +
> > +               break;
> > +
> > +       case hwmon_fan_input:
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD=
,
> > +                                      HWMON_FIN_IDX(channel), 2, 0,
> > +                                      2, buf);
> > +               if (ret)
> > +                       return -EINVAL;
> > +
> > +               *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> > +
> > +               break;
> > +
> > +       case hwmon_fan_min:
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_M=
OD,
> > +                                      REQUEST_HWMON_CMD2_OFFSET,
> > +                                      REQUEST_HWMON_CMD2_LEN,
> > +                                      HWMON_FIN_LIMIT_IDX(channel),
> > +                                      2, buf);
> > +               if (ret)
> > +                       return -EINVAL;
> > +
> > +               *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> > +
> > +               break;
> > +
> > +       case hwmon_fan_min_alarm:
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD=
,
> > +                                      HWMON_FIN_STS(channel / 8),
> > +                                      1, 0, 1, buf);
> > +               if (ret)
> > +                       return -EINVAL;
> > +
> > +               *val =3D buf[0] & BIT(channel % 8);
> > +
> > +               break;
> > +
> > +       default:
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel,
> > +                           long *val)
> > +{
> > +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf;
> > +       int ret;
> > +
> > +       switch (attr) {
> > +       case hwmon_pwm_input:
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MOD=
,
> > +                                      HWMON_PWM_IDX(channel),
> > +                                      1, 0, 1, &buf);
> > +               if (ret)
> > +                       return -EINVAL;
> > +
> > +               *val =3D buf;
> > +
> > +               break;
> > +       case hwmon_pwm_freq:
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_M=
OD,
> > +                                      REQUEST_HWMON_CMD0_OFFSET,
> > +                                      REQUEST_HWMON_CMD0_LEN,
> > +                                      HWMON_PWM_FREQ_IDX(channel),
> > +                                      1, &buf);
> > +               if (ret)
> > +                       return -EINVAL;
> > +
> > +               *val =3D buf * 25000 / 255;
> > +
> > +               break;
> > +
> > +       default:
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int nct6694_fan_write(struct device *dev, u32 attr, int channel=
,
> > +                            long val)
> > +{
> > +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};
> [Kalesh] Please try to maintain RCT order for variable declaration
> > +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> > +       u16 fan_val =3D (u16)val;
> > +       int ret;
> > +
> > +       switch (attr) {
> > +       case hwmon_fan_enable:
> > +               mutex_lock(&data->hwmon_lock);
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_M=
OD,
> > +                                      REQUEST_HWMON_CMD0_OFFSET,
> > +                                      REQUEST_HWMON_CMD0_LEN, 0,
> > +                                      REQUEST_HWMON_CMD0_LEN,
> > +                                      enable_buf);
> > +               if (ret)
> > +                       goto err;
> > +
> > +               if (val)
> > +                       enable_buf[HWMON_FIN_EN(channel / 8)] |=3D BIT(=
channel % 8);
> > +               else
> > +                       enable_buf[HWMON_FIN_EN(channel / 8)] &=3D ~BIT=
(channel % 8);
> > +
> > +               ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> > +                                       REQUEST_HWMON_CMD0_OFFSET,
> > +                                       REQUEST_HWMON_CMD0_LEN, enable_=
buf);
> > +               if (ret)
> > +                       goto err;
> > +
> > +               break;
> > +
> > +       case hwmon_fan_min:
> > +               mutex_lock(&data->hwmon_lock);
> > +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_M=
OD,
> > +                                      REQUEST_HWMON_CMD2_OFFSET,
> > +                                      REQUEST_HWMON_CMD2_LEN, 0,
> > +                                      REQUEST_HWMON_CMD2_LEN, buf);
> > +               if (ret)
> > +                       goto err;
> > +
> > +               buf[HWMON_FIN_LIMIT_IDX(channel)] =3D (u8)((fan_val >> =
8) & 0xFF);
> > +               buf[HWMON_FIN_LIMIT_IDX(channel) + 1] =3D (u8)(fan_val =
& 0xFF);
> > +               ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> > +                                       REQUEST_HWMON_CMD2_OFFSET,
> > +                                       REQUEST_HWMON_CMD2_LEN, buf);
> > +               if (ret)
> > +                       goto err;
> > +
> > +               break;
> > +
> > +       default:
> > +               ret =3D -EOPNOTSUPP;
> [Kalesh] If you initialize "ret =3D -EOPNOTSUPP;" during declararion,
> you can just break from here.
> > +               goto err;
> > +       }
> > +
> > +err:
> > +       mutex_unlock(&data->hwmon_lock);
> > +       return ret;
> > +}
> > +
> > +static int nct6694_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> > +                       u32 attr, int channel, long *val)
> > +{
> > +       switch (type) {
> > +       case hwmon_fan: /* in RPM */
> > +               return nct6694_fan_read(dev, attr, channel, val);
> > +
> > +       case hwmon_pwm: /* in value 0~255 */
> > +               return nct6694_pwm_read(dev, attr, channel, val);
> > +
> > +       default:
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int nct6694_write(struct device *dev, enum hwmon_sensor_types t=
ype,
> > +                        u32 attr, int channel, long val)
> > +{
> > +       switch (type) {
> > +       case hwmon_fan:
> > +               return nct6694_fan_write(dev, attr, channel, val);
> > +       default:
> > +               return -EOPNOTSUPP;
> > +       }
> [Kalesh] You can use simple if condition here than a switch like:
> if (type !=3D hwmon_fan)
>          return -EOPNOTSUPP;
> return nct6694_fan_write(dev, attr, channel, val);
> > +
> > +       return 0;
> > +}
> > +
> > +static umode_t nct6694_is_visible(const void *data, enum hwmon_sensor_=
types type,
> > +                                 u32 attr, int channel)
> > +{
> > +       switch (type) {
> > +       case hwmon_fan:
> > +               switch (attr) {
> > +               case hwmon_fan_enable:
> > +               case hwmon_fan_min:
> > +                       return 0644;
> [Kalesh] I think there is no need to leave a new line in between cases
> > +
> > +               case hwmon_fan_input:
> > +               case hwmon_fan_min_alarm:
> > +                       return 0444;
> > +
> > +               default:
> > +                       return 0;
> > +               }
> > +
> > +       case hwmon_pwm:
> > +               switch (attr) {
> > +               case hwmon_pwm_input:
> > +               case hwmon_pwm_freq:
> > +                       return 0444;
> > +               default:
> > +                       return 0;
> > +               }
> > +
> > +       default:
> > +               return 0;
> > +       }
> > +
> > +       return 0;
> [Kalesh] This return statement looks redundant as the execution never
> reaches here. Same comment applies to other functions above as well.
> > +}
> > +
> > +static const struct hwmon_ops nct6694_hwmon_ops =3D {
> > +       .is_visible =3D nct6694_is_visible,
> > +       .read =3D nct6694_read,
> > +       .write =3D nct6694_write,
> > +};
> > +
> > +static const struct hwmon_chip_info nct6694_chip_info =3D {
> > +       .ops =3D &nct6694_hwmon_ops,
> > +       .info =3D nct6694_info,
> > +};
> > +
> > +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
> > +{
> > +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> > +       int ret;
> > +
> > +       /* Set Fan input Real Time alarm mode */
> > +       mutex_lock(&data->hwmon_lock);
> > +       ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
> > +                              REQUEST_HWMON_CMD2_OFFSET,
> > +                              REQUEST_HWMON_CMD2_LEN, 0,
> > +                              REQUEST_HWMON_CMD2_LEN, buf);
> > +       if (ret)
> > +               goto err;
> [Kalesh] It would be better to rename the label as "unlock". Same
> comment on other functions as well.
> > +
> > +       buf[HWMON_SMI_CTRL_IDX] =3D 0x02;
> > +
> > +       ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
> > +                               REQUEST_HWMON_CMD2_OFFSET,
> > +                               REQUEST_HWMON_CMD2_LEN, buf);
> > +       if (ret)
> > +               goto err;
> > +
> > +err:
> > +       mutex_unlock(&data->hwmon_lock);
> > +       return ret;
> > +}
> > +
> > +static int nct6694_hwmon_probe(struct platform_device *pdev)
> > +{
> > +       struct nct6694_hwmon_data *data;
> > +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +       struct device *hwmon_dev;
> > +       int ret;
> > +
> > +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       data->nct6694 =3D nct6694;
> > +       mutex_init(&data->hwmon_lock);
> > +       platform_set_drvdata(pdev, data);
> > +
> > +       ret =3D nct6694_hwmon_init(data);
> > +       if (ret)
> > +               return -EIO;
> > +
> > +       /* Register hwmon device to HWMON framework */
> > +       hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > +                                                        "nct6694", dat=
a,
> > +                                                        &nct6694_chip_=
info,
> > +                                                        NULL);
> > +       if (IS_ERR(hwmon_dev)) {
> > +               dev_err(&pdev->dev, "%s: Failed to register hwmon devic=
e!\n",
> > +                       __func__);
> > +               return PTR_ERR(hwmon_dev);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver nct6694_hwmon_driver =3D {
> > +       .driver =3D {
> > +               .name   =3D DRVNAME,
> > +       },
> > +       .probe          =3D nct6694_hwmon_probe,
> > +};
> > +
> > +static int __init nct6694_init(void)
> > +{
> > +       int err;
> > +
> > +       err =3D platform_driver_register(&nct6694_hwmon_driver);
> > +       if (!err) {
> > +               if (err)
> [Kalesh] This whole check looks strange. You can simplify this function a=
s:
> return platform_driver_register(&nct6694_hwmon_driver);
> > +                       platform_driver_unregister(&nct6694_hwmon_drive=
r);
> > +       }
> > +
> > +       return err;
> > +}
> > +subsys_initcall(nct6694_init);
> > +
> > +static void __exit nct6694_exit(void)
> > +{
> > +       platform_driver_unregister(&nct6694_hwmon_driver);
> > +}
> > +module_exit(nct6694_exit);
> > +
> > +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
> >
>
>
> --
> Regards,
> Kalesh A P

