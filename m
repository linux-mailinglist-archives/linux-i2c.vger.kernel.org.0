Return-Path: <linux-i2c+bounces-7586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C579B082B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 17:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 754BCB26220
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 15:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFB3183CBE;
	Fri, 25 Oct 2024 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmkApTRY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB417DFE4;
	Fri, 25 Oct 2024 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869752; cv=none; b=a8ho4z/l01ieKH+MpJAPGMs3XnUqj3D7yfcRUp/vcjeWH7SOqT1tPy7kWBZZ9CeidAixmrejp8H93+tt/7umSBOsrJtHAtrmWPE2U7b+NroYEa8gTxEjQGwwUGxiYCAj80Vx8moJb+wCuFzJ6iiuyoTgAzLgKkeUJF4jsB38V3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869752; c=relaxed/simple;
	bh=LgQT6/dSGQa+JUllKd2i/sNl6bORj1ohEgLC/sLQYhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCktRUDFZYZDuAMjCBk66DHzqQOxzPsl3tQmx1e/7JXnhElmMyozEVAoUxOWgFz5UGQKOxiCubXuuQ3RFi9D02GtS3w1Prx5o3c25L49ttO5Y4aye6lxAcqzEygILZYfs9QVCxhvnqtw5hS0YwiNEnugKgcLVnPIpn0MNibEspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmkApTRY; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e2e3179b224so2386320276.1;
        Fri, 25 Oct 2024 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729869745; x=1730474545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvRToPh7Hw2SiSjnL1xVUJoaCYXhUqpUVqiKECmUxCc=;
        b=PmkApTRYBAMdXElyQDUOlS28hY55jKavN8dslItMS+KSQ6c2QamUiwyLLNCHF0QBT7
         9p1Gayyqlr+kftEJq5tuNDrhOXzSqaD413HVXRtz0V0SqJ00yZdIQz6Y2C1Wf3qYiVgY
         ABH5Ahdzo4s+fbLkY3VRgqbKMMXvJStpY2ObvtBzq+QTp8szxQt43mBuO4CWkI/r8ZzY
         FTFg1cWBRIM4mMlJUSZudHxFQdzuD5b1lUNsE/wCgvRCnw7WAjAk4s9iJYB5rUEVNwRh
         +y7sq9+2BLmypNVRUVOpISRGQHcQt29z5zKKvz9eWjTqD+uOrwh/N/IYy1ibgP/kG4bY
         hl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869745; x=1730474545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvRToPh7Hw2SiSjnL1xVUJoaCYXhUqpUVqiKECmUxCc=;
        b=NjQNKfYg5xdutohE5qhWAAlSjCoT5hu15oJsMXn5unvIAupu8ppO9B1Xi63t8Z6aVY
         QXIO8ht2tmfj+lrH39DZj9r0BEirVkpJHIph25hcwoqbrX9opbHvDGup5fU4t6bozNQ1
         +5O28FJxBNfWBiAs89kQdhLg6YFaHsEzypIuQ/nk+wqA1XzrTuZtyRcot7C1BlZ2VInE
         yMpALZmDkREwxcP8Y806ivpp1cPeQXRcUna0WWPPQEHMjCYuIPQf2wDNGyq7wze9S3jQ
         dnpPL3KkFE+UwqF7VWd55saIhzuvmR2KBptd8KgSE3wxJGQ+mPo0SyL4TC8uLDBm6Ds0
         1LFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1jbbYMYINExmHkj4r9cwqtdzL9QZtu84+NS67hoLkHDPhAW4CfrjzcUFIpAegnAb+cDuRUNo3+dzM@vger.kernel.org, AJvYcCU9ycNNw5hbOdHdQWu7qMM+uYVhGk2RLVY+/kKEWNlSb2xhq+OiiZMTlUGe8of9uTxH8HHQ8PuuvSy80/o=@vger.kernel.org, AJvYcCUtvhCd12F8azUVvg0rDbt3WZm2lybWtm0rIz7gFnDa1PL6yc28TXg10pKA8T9T8yC+RNEc5DHvCiyb@vger.kernel.org, AJvYcCVQPLFe8TI7Gys6GC42OhK3UJCEQaPz17ypNdPlBWpv7SQGbXBmD3WakV57ywy2gxsbAODeZuIjFKKq@vger.kernel.org, AJvYcCW9Go+Vr9lOA3bCzl5EUNbjkl+3QX3M/1iBQyze5mapL0VCS1/2bSZ1tWhbTn3U5vh3nmjLSoeL2003fPGOyrw=@vger.kernel.org, AJvYcCWMDPZrapWZRd1Ug4/0Emfqfs13XplcgnuVj2BcEChStWaENAEoyAcZdB1sU7czljkwLjHP5oeZ@vger.kernel.org, AJvYcCWXlCck9pk91mLqZg8LvuvoDV67WbbnngtC5IH3ORG+ZnHISplULroLnB/IfIEFibsXp2hU6ay5dZpUwQ==@vger.kernel.org, AJvYcCX2oEnQBaO5jyp/v0jo2DWjOFoelf0bu6VbX0eMFQhacpnfMJs9FGwZZmRmq89sBQ/lkqZmk+B1rplUkKoU@vger.kernel.org, AJvYcCXXcJG3MWJu2gY1JOuC7byGbwPixVvnd4XIcQ0UAG5GRy5OsBHXNsInIAUwIp27SRAcIAvFK5YQ4cE=@vger.kernel.org, AJvYcCXr6Kryzv2Num/EhHVokC/91X0Rx93y
 3GgeLeBiKLztqtZgaFVuetjnoulSifIWbcLhzcGQTP7SHXUC@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsneKil2P06oCfe6r4sSgW7lQRtnUof6yQ/2bqXpYuNl/lfjd
	S2Zeo/eO8WF3oI9CEgvioshA59cctNiIXtHx/hjhqRIfTgKtWTKP64YaEsaNMnbqdzQvyORdKQD
	izRYdsg5kUZCEngualKrr66Fau1o=
X-Google-Smtp-Source: AGHT+IFm1Us4xntyPQWHer5zL09Jqcc29Dspx/EK11Pxrs4kCKkNh0C/NXWKYm0fqwlTVfm+CoqIdoKJyO4uvj8yufs=
X-Received: by 2002:a05:6902:2b8a:b0:e2b:d131:f293 with SMTP id
 3f1490d57ef6-e2e3a6d3e2amr10489964276.51.1729869745316; Fri, 25 Oct 2024
 08:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com> <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net>
In-Reply-To: <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 23:22:10 +0800
Message-ID: <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for your comments.

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:53=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10/24/24 02:20, Kalesh Anakkur Purayil wrote:
> > On Thu, Oct 24, 2024 at 2:33=E2=80=AFPM Ming Yu <a0282524688@gmail.com>=
 wrote:
> >>
> >> This driver supports Hardware monitor functionality for NCT6694 MFD
> >> device based on USB interface.
> >>
> >> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> >> ---
> >>   MAINTAINERS                   |   1 +
> >>   drivers/hwmon/Kconfig         |  10 +
> >>   drivers/hwmon/Makefile        |   1 +
> >>   drivers/hwmon/nct6694-hwmon.c | 407 ++++++++++++++++++++++++++++++++=
++
> >>   4 files changed, 419 insertions(+)
> >>   create mode 100644 drivers/hwmon/nct6694-hwmon.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 63387c0d4ab6..2aa87ad84156 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -16439,6 +16439,7 @@ M:      Ming Yu <tmyu0@nuvoton.com>
> >>   L:     linux-kernel@vger.kernel.org
> >>   S:     Supported
> >>   F:     drivers/gpio/gpio-nct6694.c
> >> +F:     drivers/hwmon/nct6694-hwmon.c
> >>   F:     drivers/i2c/busses/i2c-nct6694.c
> >>   F:     drivers/mfd/nct6694.c
> >>   F:     drivers/net/can/nct6694_canfd.c
> >> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >> index 08a3c863f80a..740e4afe6582 100644
> >> --- a/drivers/hwmon/Kconfig
> >> +++ b/drivers/hwmon/Kconfig
> >> @@ -1625,6 +1625,16 @@ config SENSORS_NCT6683
> >>            This driver can also be built as a module. If so, the modul=
e
> >>            will be called nct6683.
> >>
> >> +config SENSORS_NCT6694
> >> +       tristate "Nuvoton NCT6694 Hardware Monitor support"
> >> +       depends on MFD_NCT6694
> >> +       help
> >> +         Say Y here to support Nuvoton NCT6694 hardware monitoring
> >> +         functionality.
> >> +
> >> +         This driver can also be built as a module. If so, the module
> >> +         will be called nct6694-hwmon.
> >> +
> >>   config SENSORS_NCT6775_CORE
> >>          tristate
> >>          select REGMAP
> >> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >> index 9554d2fdcf7b..729961176d00 100644
> >> --- a/drivers/hwmon/Makefile
> >> +++ b/drivers/hwmon/Makefile
> >> @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) +=3D mlxreg-fan.o
> >>   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) +=3D menf21bmc_hwmon.o
> >>   obj-$(CONFIG_SENSORS_MR75203)  +=3D mr75203.o
> >>   obj-$(CONFIG_SENSORS_NCT6683)  +=3D nct6683.o
> >> +obj-$(CONFIG_SENSORS_NCT6694)  +=3D nct6694-hwmon.o
> >>   obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-core.o
> >>   nct6775-objs                   :=3D nct6775-platform.o
> >>   obj-$(CONFIG_SENSORS_NCT6775)  +=3D nct6775.o
> >> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwm=
on.c
> >> new file mode 100644
> >> index 000000000000..7d7d22a650b0
> >> --- /dev/null
> >> +++ b/drivers/hwmon/nct6694-hwmon.c
> >> @@ -0,0 +1,407 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Nuvoton NCT6694 HWMON driver based on USB interface.
> >> + *
> >> + * Copyright (C) 2024 Nuvoton Technology Corp.
> >> + */
> >> +
> >> +#include <linux/slab.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/hwmon.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/mfd/nct6694.h>
> >> +
> >> +#define DRVNAME "nct6694-hwmon"
> >> +
> >> +/* Host interface */
> >> +#define REQUEST_RPT_MOD                        0xFF
> >> +#define REQUEST_HWMON_MOD              0x00
> >> +
> >> +/* Report Channel */
> >> +#define HWMON_FIN_IDX(x)               (0x50 + ((x) * 2))
> >> +#define HWMON_FIN_STS(x)               (0x6E + (x))
> >> +#define HWMON_PWM_IDX(x)               (0x70 + (x))
> >> +
> >> +/* Message Channel*/
> >> +/* Command 00h */
> >> +#define REQUEST_HWMON_CMD0_LEN         0x40
> >> +#define REQUEST_HWMON_CMD0_OFFSET      0x0000  /* OFFSET =3D SEL|CMD =
*/
> >> +#define HWMON_FIN_EN(x)                        (0x04 + (x))
> >> +#define HWMON_PWM_FREQ_IDX(x)          (0x30 + (x))
> >> +/* Command 02h */
> >> +#define REQUEST_HWMON_CMD2_LEN         0x90
> >> +#define REQUEST_HWMON_CMD2_OFFSET      0x0002  /* OFFSET =3D SEL|CMD =
*/
> >> +#define HWMON_SMI_CTRL_IDX             0x00
> >> +#define HWMON_FIN_LIMIT_IDX(x)         (0x70 + ((x) * 2))
> >> +#define HWMON_CMD2_HYST_MASK           0x1F
> >> +/* Command 03h */
> >> +#define REQUEST_HWMON_CMD3_LEN         0x08
> >> +#define REQUEST_HWMON_CMD3_OFFSET      0x0003  /* OFFSET =3D SEL|CMD =
*/
> >> +
> >> +struct nct6694_hwmon_data {
> >> +       struct nct6694 *nct6694;
> >> +
> >> +       /* Make sure read & write commands are consecutive */
> >> +       struct mutex hwmon_lock;
> >> +};
> >> +
> >> +#define NCT6694_HWMON_FAN_CONFIG (HWMON_F_ENABLE | HWMON_F_INPUT | \
> >> +                                 HWMON_F_MIN | HWMON_F_MIN_ALARM)
> >> +#define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_FREQ)
> >> +
> >> +static const struct hwmon_channel_info *nct6694_info[] =3D {
> >> +       HWMON_CHANNEL_INFO(fan,
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN0 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN1 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN2 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN3 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN4 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN5 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN6 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN7 */
> >> +                          NCT6694_HWMON_FAN_CONFIG,    /* FIN8 */
> >> +                          NCT6694_HWMON_FAN_CONFIG),   /* FIN9 */
> >> +
> >> +       HWMON_CHANNEL_INFO(pwm,
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM0 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM1 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM2 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM3 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM4 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM5 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM6 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM7 */
> >> +                          NCT6694_HWMON_PWM_CONFIG,    /* PWM8 */
> >> +                          NCT6694_HWMON_PWM_CONFIG),   /* PWM9 */
> >> +       NULL
> >> +};
> >> +
> >> +static int nct6694_fan_read(struct device *dev, u32 attr, int channel=
,
> >> +                           long *val)
> >> +{
> >> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> >> +       unsigned char buf[2];
> >> +       int ret;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_fan_enable:
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> >> +                                      REQUEST_HWMON_CMD0_OFFSET,
> >> +                                      REQUEST_HWMON_CMD0_LEN,
> >> +                                      HWMON_FIN_EN(channel / 8),
> >> +                                      1, buf);
> >> +               if (ret)
> >> +                       return -EINVAL;
> >> +
> >> +               *val =3D buf[0] & BIT(channel % 8) ? 1 : 0;
> >> +
> >> +               break;
> >> +
> >> +       case hwmon_fan_input:
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MO=
D,
> >> +                                      HWMON_FIN_IDX(channel), 2, 0,
> >> +                                      2, buf);
> >> +               if (ret)
> >> +                       return -EINVAL;
> >> +
> >> +               *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> >> +
> >> +               break;
> >> +
> >> +       case hwmon_fan_min:
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> >> +                                      REQUEST_HWMON_CMD2_OFFSET,
> >> +                                      REQUEST_HWMON_CMD2_LEN,
> >> +                                      HWMON_FIN_LIMIT_IDX(channel),
> >> +                                      2, buf);
> >> +               if (ret)
> >> +                       return -EINVAL;
> >> +
> >> +               *val =3D (buf[1] | (buf[0] << 8)) & 0xFFFF;
> >> +
> >> +               break;
> >> +
> >> +       case hwmon_fan_min_alarm:
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MO=
D,
> >> +                                      HWMON_FIN_STS(channel / 8),
> >> +                                      1, 0, 1, buf);
> >> +               if (ret)
> >> +                       return -EINVAL;
> >> +
> >> +               *val =3D buf[0] & BIT(channel % 8);
> >> +
> >> +               break;
> >> +
> >> +       default:
> >> +               return -EOPNOTSUPP;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int nct6694_pwm_read(struct device *dev, u32 attr, int channel=
,
> >> +                           long *val)
> >> +{
> >> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> >> +       unsigned char buf;
> >> +       int ret;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_pwm_input:
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_RPT_MO=
D,
> >> +                                      HWMON_PWM_IDX(channel),
> >> +                                      1, 0, 1, &buf);
> >> +               if (ret)
> >> +                       return -EINVAL;
> >> +
> >> +               *val =3D buf;
> >> +
> >> +               break;
> >> +       case hwmon_pwm_freq:
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> >> +                                      REQUEST_HWMON_CMD0_OFFSET,
> >> +                                      REQUEST_HWMON_CMD0_LEN,
> >> +                                      HWMON_PWM_FREQ_IDX(channel),
> >> +                                      1, &buf);
> >> +               if (ret)
> >> +                       return -EINVAL;
> >> +
> >> +               *val =3D buf * 25000 / 255;
> >> +
> >> +               break;
> >> +
> >> +       default:
> >> +               return -EOPNOTSUPP;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int nct6694_fan_write(struct device *dev, u32 attr, int channe=
l,
> >> +                            long val)
> >> +{
> >> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> >> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};
> > [Kalesh] Please try to maintain RCT order for variable declaration
>
> Ok, but that is already the case here ?

[Ming] Is there anything that needs to be changed?

>
> >> +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> >> +       u16 fan_val =3D (u16)val;
> >> +       int ret;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_fan_enable:
> >> +               mutex_lock(&data->hwmon_lock);
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> >> +                                      REQUEST_HWMON_CMD0_OFFSET,
> >> +                                      REQUEST_HWMON_CMD0_LEN, 0,
> >> +                                      REQUEST_HWMON_CMD0_LEN,
> >> +                                      enable_buf);
> >> +               if (ret)
> >> +                       goto err;
> >> +
> >> +               if (val)
> >> +                       enable_buf[HWMON_FIN_EN(channel / 8)] |=3D BIT=
(channel % 8);
> >> +               else
> >> +                       enable_buf[HWMON_FIN_EN(channel / 8)] &=3D ~BI=
T(channel % 8);
> >> +
> >> +               ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON=
_MOD,
> >> +                                       REQUEST_HWMON_CMD0_OFFSET,
> >> +                                       REQUEST_HWMON_CMD0_LEN, enable=
_buf);
> >> +               if (ret)
> >> +                       goto err;
> >> +
> >> +               break;
> >> +
> >> +       case hwmon_fan_min:
> >> +               mutex_lock(&data->hwmon_lock);
> >> +               ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_=
MOD,
> >> +                                      REQUEST_HWMON_CMD2_OFFSET,
> >> +                                      REQUEST_HWMON_CMD2_LEN, 0,
> >> +                                      REQUEST_HWMON_CMD2_LEN, buf);
> >> +               if (ret)
> >> +                       goto err;
> >> +
> >> +               buf[HWMON_FIN_LIMIT_IDX(channel)] =3D (u8)((fan_val >>=
 8) & 0xFF);
> >> +               buf[HWMON_FIN_LIMIT_IDX(channel) + 1] =3D (u8)(fan_val=
 & 0xFF);
> >> +               ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON=
_MOD,
> >> +                                       REQUEST_HWMON_CMD2_OFFSET,
> >> +                                       REQUEST_HWMON_CMD2_LEN, buf);
> >> +               if (ret)
> >> +                       goto err;
> >> +
> >> +               break;
> >> +
> >> +       default:
> >> +               ret =3D -EOPNOTSUPP;
> > [Kalesh] If you initialize "ret =3D -EOPNOTSUPP;" during declararion,
> > you can just break from here.
>
> You are missing the point. The lock wasn't acquired here in the first pla=
ce.
> It is conceptually wrong to acquire a lock in the switch statement and re=
lease
> it outside. This patch is a case in point.

[Ming] Okay! I'll acquire the lock before switch() in the next patch.

>
> >> +               goto err;
> >> +       }
> >> +
> >> +err:
> >> +       mutex_unlock(&data->hwmon_lock);
> >> +       return ret;
> >> +}
> >> +
> >> +static int nct6694_read(struct device *dev, enum hwmon_sensor_types t=
ype,
> >> +                       u32 attr, int channel, long *val)
> >> +{
> >> +       switch (type) {
> >> +       case hwmon_fan: /* in RPM */
> >> +               return nct6694_fan_read(dev, attr, channel, val);
> >> +
> >> +       case hwmon_pwm: /* in value 0~255 */
> >> +               return nct6694_pwm_read(dev, attr, channel, val);
> >> +
> >> +       default:
> >> +               return -EOPNOTSUPP;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int nct6694_write(struct device *dev, enum hwmon_sensor_types =
type,
> >> +                        u32 attr, int channel, long val)
> >> +{
> >> +       switch (type) {
> >> +       case hwmon_fan:
> >> +               return nct6694_fan_write(dev, attr, channel, val);
> >> +       default:
> >> +               return -EOPNOTSUPP;
> >> +       }
> > [Kalesh] You can use simple if condition here than a switch like:
> > if (type !=3D hwmon_fan)
> >           return -EOPNOTSUPP;
> > return nct6694_fan_write(dev, attr, channel, val);
>
> That is a bit POV. I'd leave that to the developer.
> More important is that the return statements after the switch are unneces=
sary
> and never reached if each case returns immediately.

[Ming] Okay! I'll drop it in the next patch.

>
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static umode_t nct6694_is_visible(const void *data, enum hwmon_sensor=
_types type,
> >> +                                 u32 attr, int channel)
> >> +{
> >> +       switch (type) {
> >> +       case hwmon_fan:
> >> +               switch (attr) {
> >> +               case hwmon_fan_enable:
> >> +               case hwmon_fan_min:
> >> +                       return 0644;
> > [Kalesh] I think there is no need to leave a new line in between cases
> >> +
> >> +               case hwmon_fan_input:
> >> +               case hwmon_fan_min_alarm:
> >> +                       return 0444;
> >> +
> >> +               default:
> >> +                       return 0;
> >> +               }
> >> +
> >> +       case hwmon_pwm:
> >> +               switch (attr) {
> >> +               case hwmon_pwm_input:
> >> +               case hwmon_pwm_freq:
> >> +                       return 0444;
> >> +               default:
> >> +                       return 0;
> >> +               }
> >> +
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +
> >> +       return 0;
> > [Kalesh] This return statement looks redundant as the execution never
> > reaches here. Same comment applies to other functions above as well.
> >> +}
> >> +
> >> +static const struct hwmon_ops nct6694_hwmon_ops =3D {
> >> +       .is_visible =3D nct6694_is_visible,
> >> +       .read =3D nct6694_read,
> >> +       .write =3D nct6694_write,
> >> +};
> >> +
> >> +static const struct hwmon_chip_info nct6694_chip_info =3D {
> >> +       .ops =3D &nct6694_hwmon_ops,
> >> +       .info =3D nct6694_info,
> >> +};
> >> +
> >> +static int nct6694_hwmon_init(struct nct6694_hwmon_data *data)
> >> +{
> >> +       unsigned char buf[REQUEST_HWMON_CMD2_LEN] =3D {0};
> >> +       int ret;
> >> +
> >> +       /* Set Fan input Real Time alarm mode */
> >> +       mutex_lock(&data->hwmon_lock);
> >> +       ret =3D nct6694_read_msg(data->nct6694, REQUEST_HWMON_MOD,
> >> +                              REQUEST_HWMON_CMD2_OFFSET,
> >> +                              REQUEST_HWMON_CMD2_LEN, 0,
> >> +                              REQUEST_HWMON_CMD2_LEN, buf);
> >> +       if (ret)
> >> +               goto err;
> > [Kalesh] It would be better to rename the label as "unlock". Same
> > comment on other functions as well.
>
> The lock is not needed here in the first place. The function is called
> exactly once during initialization.

[Ming] I'll remove the lock in the next patch!

>
> >> +
> >> +       buf[HWMON_SMI_CTRL_IDX] =3D 0x02;
> >> +
> >> +       ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
> >> +                               REQUEST_HWMON_CMD2_OFFSET,
> >> +                               REQUEST_HWMON_CMD2_LEN, buf);
> >> +       if (ret)
> >> +               goto err;
> >> +
> >> +err:
> >> +       mutex_unlock(&data->hwmon_lock);
> >> +       return ret;
> >> +}
> >> +
> >> +static int nct6694_hwmon_probe(struct platform_device *pdev)
> >> +{
> >> +       struct nct6694_hwmon_data *data;
> >> +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> >> +       struct device *hwmon_dev;
> >> +       int ret;
> >> +
> >> +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> >> +       if (!data)
> >> +               return -ENOMEM;
> >> +
> >> +       data->nct6694 =3D nct6694;
> >> +       mutex_init(&data->hwmon_lock);
> >> +       platform_set_drvdata(pdev, data);
> >> +
> >> +       ret =3D nct6694_hwmon_init(data);
> >> +       if (ret)
> >> +               return -EIO;
> >> +
> >> +       /* Register hwmon device to HWMON framework */
> >> +       hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> >> +                                                        "nct6694", da=
ta,
> >> +                                                        &nct6694_chip=
_info,
> >> +                                                        NULL);
> >> +       if (IS_ERR(hwmon_dev)) {
> >> +               dev_err(&pdev->dev, "%s: Failed to register hwmon devi=
ce!\n",
> >> +                       __func__);
> >> +               return PTR_ERR(hwmon_dev);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static struct platform_driver nct6694_hwmon_driver =3D {
> >> +       .driver =3D {
> >> +               .name   =3D DRVNAME,
> >> +       },
> >> +       .probe          =3D nct6694_hwmon_probe,
> >> +};
> >> +
> >> +static int __init nct6694_init(void)
> >> +{
> >> +       int err;
> >> +
> >> +       err =3D platform_driver_register(&nct6694_hwmon_driver);
> >> +       if (!err) {
> >> +               if (err)
> > [Kalesh] This whole check looks strange. You can simplify this function=
 as:
> > return platform_driver_register(&nct6694_hwmon_driver);
> >> +                       platform_driver_unregister(&nct6694_hwmon_driv=
er);
> >> +       }
> >> +
> >> +       return err;
> >> +}
> >> +subsys_initcall(nct6694_init);
> >> +
> >> +static void __exit nct6694_exit(void)
> >> +{
> >> +       platform_driver_unregister(&nct6694_hwmon_driver);
> >> +}
> >> +module_exit(nct6694_exit);
> >> +
> >> +MODULE_DESCRIPTION("USB-HWMON driver for NCT6694");
> >> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.34.1
> >>
> >>
> >
> >
>

[Ming] For platform driver registration, I'll change it to
module_platform_driver() in the next patch.

Thank,
Ming

