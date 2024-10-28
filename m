Return-Path: <linux-i2c+bounces-7631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34B9B2BDC
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 10:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0B141C21E8D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7F21CF2A5;
	Mon, 28 Oct 2024 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4+xPrEc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684F199247;
	Mon, 28 Oct 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108982; cv=none; b=ZqCoRjjCwy0xj2zegNkAY7IEp4LCetmATgqyz99dARh/2VDlz55tt3w8vbWuF6w69+gB4ggpRUCMBONLXb3OEkbP0LH7kelsgf24FLMgBZUSVmaeQBLA3+kFXI5aa2Ufx9V/aOkbJEtNFNisYbvqVyNK5uustlF+fIuNnsWizbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108982; c=relaxed/simple;
	bh=Li/zX1NMGiQvayP1B1aJKA3UADp1/9nYihQP1djZBfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EldwzIeUqUVxkudzSfKBbb2RvsZ+5SjzjkImeY4rJP6SAWW6lHsCmjmc/7IrtnoiFFRkNXwZKa6CmC6xcJU8/FfZSKcIEhiSM3bD70exX/GwRyNx1UGLmBRK2TxWgh87z/pxZfFuQQYnJGk6XxGNW71h6P2f5mHaNm+rPXdxhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4+xPrEc; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e308038caf9so2387400276.0;
        Mon, 28 Oct 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730108978; x=1730713778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhpScoTjsoE4TEraqLIv4xYHR/WULjEZZgJExIMyL3k=;
        b=W4+xPrEcjDUUvVck1IxXN2mA/lK33yjsitef4xvdc8GkskceNwG5bmaiP/ViKDv408
         r4VagANpXCkS+in+5UF9dZm8SXdULp8gTUqBtQFCKw08OUiemr3+DQa5Z2y4AL1q40il
         1DSGoyw9uxP2lrwmN5oNWIrGdJnxueeV7zulx35hHF17D0aqNotQy4wirIJJNK6CUBPI
         ZRGmXctCWs9SKiuTmqWegTlxwNbxFbNbXnNJV+8caworLTO64A+PiYYGJ/bRpbAbNBBz
         V5Gxz8VW0bTw3YJeX7IMDxAIisQx73RysHTektRTcKf1XCB64/26y/2QfwC75atgSvq2
         setQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108978; x=1730713778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhpScoTjsoE4TEraqLIv4xYHR/WULjEZZgJExIMyL3k=;
        b=vV4Ti3giEpInAksHMLro7GzprGFGJ25TDHbKbHe8tKHmy4PHFxpnuxgq3wToByKHh9
         eVjMRJ95BNUm1wUvCqDQxU1aX/RvF8yWR5Db4wlJtJg/fZGqKRwdHv3uMmqGpLfEhl8/
         cSMEBVyfjlUQkLRSsBjlzGHGCeGBD0YNM6tI1atZCVh/m1YsYVG0DDLLnzYj++evs0oc
         JbGvHrmKVom4OPVnia6RQ6R1BxAkUJ1eJZ5eI3KamLx+QS//zb2JQbq8tpC11CmpugEu
         zgej1qEIypWC2sVEFV2Y+FoCpc1l55mv7izfu/jQ2xY/EUlCB+CmrvDKTL80WzFIN38G
         rS1w==
X-Forwarded-Encrypted: i=1; AJvYcCUfJLxDcbbXsBEbOq/97A6dRt3BTjusEhkaUWPlDAu1K/J8xXXaTa/LY4N8GqOci7xBAtwBC4Nk@vger.kernel.org, AJvYcCUgKQgTkNSCTHMzpEtFxeJiLADOkwF7OHyTHzi9Ubkz9MWEDMlNN+cFKTN19rktSQq1L+CzQFkOEoXtrw3j@vger.kernel.org, AJvYcCV9clnBxlmm0uwKdB3a92PmWZABJ8YDY0WHYCHA4Gjqb86l7uVTLKexjPNJLuRe5Ovg5Z6JEvViBdBp@vger.kernel.org, AJvYcCW1MedrU6B50gTGf+EYFZ0aoIyIs32C5iMIJEtQb+qsw/YjV4Z1GSfWbAD0JIMJvfA7mq07+j+zPcc=@vger.kernel.org, AJvYcCWxTz8Vc3KO9fEQtKSiCyAB0O8PowYuu4qf9aiedZAgB77tfyNwPP02ww4ZCdUglZg4b4ZLM/HV4v+Z@vger.kernel.org, AJvYcCX6g/TcIzSOtWN7ozDIZaRLRjekh/6ZIGk80/cz2webSlhnMrloAOf2EGTPtw5bPvupXrMVv8iVVKmqCQ==@vger.kernel.org, AJvYcCXNzDyru1JtBWLrx/IKYOtJhwE+Y/HqaO+EsAyEf2kSjf+zPkHUKpNxaXuim4zPLuGzeytXrUE5q6bN38I=@vger.kernel.org, AJvYcCXjQJrzNOUJtaXJN01WUjl+dceVYoM8oM0+8U6e+79J3wLCXLzUw9LuDsn0ZzyoKkNqwXhNsCDmZtdi@vger.kernel.org, AJvYcCXlxphkzVE7iM8ne3tH5/hKqcRlnAxcKyDI+pH4UBJr4gVH+zhq6BF0fISlW9EHuEpXXpMHUrvceGub@vger.kernel.org, AJvYcCXvKa2RAA25F+MiDivpxfQbBi8jxG5YZI5HlTwu
 7hcqusahduXX1Zzjg1+dJF3bDdJ4wBWav9JIXFAzXZHligI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsbGQC2nmQU5ozBq8h+LPmA0HJNVqzc/1VQis61Nrq/x9RUkHU
	uJOb1PGpWzcVVA1lrO/b/FxHPbB6vHiFdccSExNNnsqX1YJBGQevaehTVzHG/CBOJbkcHQdng/C
	lHN96NdN2cIxmkrggFh9MEazX4yU=
X-Google-Smtp-Source: AGHT+IGv/kQg5QwmYKV2g9AhyVpVmbcIttPyRL1Tcppmw9+CvLPoQ9tbgFB7KPK9h0QIakEEHmpKcrw3aHRnIlz8Afo=
X-Received: by 2002:a05:6902:724:b0:e30:84f1:999a with SMTP id
 3f1490d57ef6-e3087a6e9a8mr6374575276.20.1730108978166; Mon, 28 Oct 2024
 02:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-6-tmyu0@nuvoton.com>
 <5fa97399-25b8-4877-be6e-69ba1ae1837d@roeck-us.net>
In-Reply-To: <5fa97399-25b8-4877-be6e-69ba1ae1837d@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 17:49:26 +0800
Message-ID: <CAOoeyxX1TS0u0qE+W3xD0gQWmC7nZWURNpOS-z0_j07uHmXmQQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] watchdog: Add Nuvoton NCT6694 WDT support
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

Dear Guenter,

Thank you for your comments,
I will remove the unnecessary logs in the next patch.

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10/24/24 01:59, Ming Yu wrote:
> > This driver supports Watchdog timer functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >   MAINTAINERS                    |   1 +
> >   drivers/watchdog/Kconfig       |  11 ++
> >   drivers/watchdog/Makefile      |   1 +
> >   drivers/watchdog/nct6694_wdt.c | 329 ++++++++++++++++++++++++++++++++=
+
> >   4 files changed, 342 insertions(+)
> >   create mode 100644 drivers/watchdog/nct6694_wdt.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index eccd5e795daa..63387c0d4ab6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16442,6 +16442,7 @@ F:    drivers/gpio/gpio-nct6694.c
> >   F:  drivers/i2c/busses/i2c-nct6694.c
> >   F:  drivers/mfd/nct6694.c
> >   F:  drivers/net/can/nct6694_canfd.c
> > +F:   drivers/watchdog/nct6694_wdt.c
> >   F:  include/linux/mfd/nct6694.h
> >
> >   NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 684b9fe84fff..bc9d63d69204 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -739,6 +739,17 @@ config MAX77620_WATCHDOG
> >         MAX77620 chips. To compile this driver as a module,
> >         choose M here: the module will be called max77620_wdt.
> >
> > +config NCT6694_WATCHDOG
> > +     tristate "Nuvoton NCT6694 watchdog support"
> > +     depends on MFD_NCT6694
> > +     select WATCHDOG_CORE
> > +     help
> > +     If you say yes to this option, support will be included for Nuvot=
on
> > +     NCT6694, a USB device to watchdog timer.
> > +
> > +     This driver can also be built as a module. If so, the module
> > +     will be called nct6694_wdt.
> > +
> >   config IMX2_WDT
> >       tristate "IMX2+ Watchdog"
> >       depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index ab6f2b41e38e..453ceacd43ab 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -231,6 +231,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) +=3D wm831x_wdt.o
> >   obj-$(CONFIG_WM8350_WATCHDOG) +=3D wm8350_wdt.o
> >   obj-$(CONFIG_MAX63XX_WATCHDOG) +=3D max63xx_wdt.o
> >   obj-$(CONFIG_MAX77620_WATCHDOG) +=3D max77620_wdt.o
> > +obj-$(CONFIG_NCT6694_WATCHDOG)       +=3D nct6694_wdt.o
> >   obj-$(CONFIG_ZIIRAVE_WATCHDOG) +=3D ziirave_wdt.o
> >   obj-$(CONFIG_SOFT_WATCHDOG) +=3D softdog.o
> >   obj-$(CONFIG_MENF21BMC_WATCHDOG) +=3D menf21bmc_wdt.o
> > diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_=
wdt.c
> > new file mode 100644
> > index 000000000000..68e2926ec504
> > --- /dev/null
> > +++ b/drivers/watchdog/nct6694_wdt.c
> > @@ -0,0 +1,329 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 WDT driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/watchdog.h>
> > +#include <linux/slab.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mfd/nct6694.h>
> > +
> > +#define DRVNAME "nct6694-wdt"
> > +
> > +#define WATCHDOG_TIMEOUT     10
> > +#define WATCHDOG_PRETIMEOUT  0
> > +
> > +/* Host interface */
> > +#define REQUEST_WDT_MOD              0x07
> > +
> > +/* Message Channel*/
> > +/* Command 00h */
> > +#define REQUEST_WDT_CMD0_LEN 0x0F
> > +#define REQUEST_WDT_CMD0_OFFSET(idx) (idx ? 0x0100 : 0x0000) /* OFFSET=
 =3D SEL|CMD */
> > +#define WDT_PRETIMEOUT_IDX   0x00
> > +#define WDT_PRETIMEOUT_LEN   0x04    /* PRETIMEOUT(3byte) | ACT(1byte)=
 */
> > +#define WDT_TIMEOUT_IDX              0x04
> > +#define WDT_TIMEOUT_LEN              0x04    /* TIMEOUT(3byte) | ACT(1=
byte) */
> > +#define WDT_COUNTDOWN_IDX    0x0C
> > +#define WDT_COUNTDOWN_LEN    0x03
> > +
> > +#define WDT_PRETIMEOUT_ACT   BIT(1)
> > +#define WDT_TIMEOUT_ACT              BIT(1)
> > +
> > +/* Command 01h */
> > +#define REQUEST_WDT_CMD1_LEN         0x04
> > +#define REQUEST_WDT_CMD1_OFFSET(idx) (idx ? 0x0101 : 0x0001) /* OFFSET=
 =3D SEL|CMD */
> > +#define WDT_CMD_IDX                  0x00
> > +#define WDT_CMD_LEN                  0x04
> > +
> > +static unsigned int timeout;
> > +module_param(timeout, int, 0);
> > +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> > +
> > +static unsigned int pretimeout;
> > +module_param(pretimeout, int, 0);
> > +MODULE_PARM_DESC(pretimeout, "Watchdog pre-timeout in seconds");
> > +
> > +static bool nowayout =3D WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (d=
efault=3D"
> > +                        __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +struct nct6694_wdt_data {
> > +     struct nct6694 *nct6694;
> > +     struct watchdog_device wdev;
> > +     unsigned int wdev_idx;
> > +};
> > +
> > +static inline void set_buf32(void *buf, u32 u32_val)
> > +{
> > +     u8 *p =3D (u8 *)buf;
> > +
> > +     p[0] =3D u32_val & 0xFF;
> > +     p[1] =3D (u32_val >> 8) & 0xFF;
> > +     p[2] =3D (u32_val >> 16) & 0xFF;
> > +     p[3] =3D (u32_val >> 24) & 0xFF;
> > +}
> > +
> > +static int nct6694_wdt_start(struct watchdog_device *wdev)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +
> > +     pr_debug("%s: WDT(%d) Start\n", __func__, data->wdev_idx);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_wdt_stop(struct watchdog_device *wdev)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned char buf[REQUEST_WDT_CMD1_LEN] =3D {'W', 'D', 'T', 'C'};
> > +     int ret;
> > +
> > +     pr_debug("%s: WDT(%d) Close\n", __func__, data->wdev_idx);
> > +     ret =3D nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> > +                             REQUEST_WDT_CMD1_OFFSET(data->wdev_idx),
> > +                             REQUEST_WDT_CMD1_LEN, buf);
> > +     if (ret)
> > +             pr_err("%s: Failed to start WDT device!\n", __func__);
>
> Please refrain from logging noise. Besides, the message is wrong:
> the watchdog is stopped here, not started.
>
> Also, all messages should use dev_, not pr_ functions.

[Ming] Okay! I will change it.

>
> > +
> > +     return ret;
> > +}
> > +
> > +static int nct6694_wdt_ping(struct watchdog_device *wdev)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned char buf[REQUEST_WDT_CMD1_LEN] =3D {'W', 'D', 'T', 'S'};
> > +     int ret;
> > +
> > +     pr_debug("%s: WDT(%d) Ping\n", __func__, data->wdev_idx);
> > +     ret =3D nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> > +                             REQUEST_WDT_CMD1_OFFSET(data->wdev_idx),
> > +                             REQUEST_WDT_CMD1_LEN, buf);
> > +     if (ret)
> > +             pr_err("%s: Failed to ping WDT device!\n", __func__);
>
> Same as above and everywhere else.
>
> > +
> > +     return ret;
> > +}
> > +
> > +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> > +                                unsigned int timeout)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned int timeout_fmt, pretimeout_fmt;
> > +     unsigned char buf[REQUEST_WDT_CMD0_LEN];
> > +     int ret;
> > +
> > +     if (timeout < wdev->pretimeout) {
> > +             pr_err("%s: 'timeout' must be greater than 'pre timeout'!=
\n",
> > +                    __func__);
> > +             return -EINVAL;
>
> the driver is supposed to adjust pretimeout in this case. And please,
> again, refrain from logging noise.

[Ming] Excuse me, is any recommendation about pretimeout value?

> > +     }
> > +
> > +     timeout_fmt =3D timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
> > +     pretimeout_fmt =3D wdev->pretimeout * 1000 | (WDT_PRETIMEOUT_ACT =
<< 24);
> > +     set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
> > +     set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
> > +
> > +     ret =3D nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> > +                             REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> > +                             REQUEST_WDT_CMD0_LEN, buf);
> > +     if (ret) {
> > +             pr_err("%s: Don't write the setup command in Start stage!=
\n",
> > +                    __func__);
> > +             return ret;
> > +     }
> > +
> > +     wdev->timeout =3D timeout;
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> > +                                   unsigned int pretimeout)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned int timeout_fmt, pretimeout_fmt;
> > +     unsigned char buf[REQUEST_WDT_CMD0_LEN];
> > +     int ret;
> > +
> > +     if (pretimeout > wdev->timeout) {
> > +             pr_err("%s: 'pre timeout' must be less than 'timeout'!\n"=
,
> > +                    __func__);
> > +             return -EINVAL;
>
> Already checked by the watchdog core.

[Ming] I understand. I will remove it.

>
> > +     }
> > +     timeout_fmt =3D wdev->timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
> > +     pretimeout_fmt =3D pretimeout * 1000 | (WDT_PRETIMEOUT_ACT << 24)=
;
> > +     set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
> > +     set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
> > +
> > +     ret =3D nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> > +                             REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> > +                             REQUEST_WDT_CMD0_LEN, buf);
> > +     if (ret) {
> > +             pr_err("%s: Don't write the setup command in Start stage!=
\n", __func__);
>
> Besides it being noise, I don't even understand what this message is
> supposed to mean, and neither would anyone else.
>
> > +             return ret;
> > +     }
> > +
> > +     wdev->pretimeout =3D pretimeout;
> > +     return 0;
> > +}
> > +
> > +static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned char buf[WDT_COUNTDOWN_LEN];
> > +     unsigned int timeleft_ms;
> > +     int ret;
> > +
> > +     ret =3D nct6694_read_msg(nct6694, REQUEST_WDT_MOD,
> > +                            REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> > +                            REQUEST_WDT_CMD0_LEN, WDT_COUNTDOWN_IDX,
> > +                            WDT_COUNTDOWN_LEN, buf);
> > +     if (ret)
> > +             pr_err("%s: Failed to get WDT device!\n", __func__);
> > +
> > +     timeleft_ms =3D ((buf[2] << 16) | (buf[1] << 8) | buf[0]) & 0xFFF=
FFF;
>
> If the above command failed this will be a random number.

[Ming] Okay! I will update error handling about return value.

>
> > +
> > +     return timeleft_ms / 1000;
> > +}
> > +
> > +static int nct6694_wdt_setup(struct watchdog_device *wdev)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned char buf[REQUEST_WDT_CMD0_LEN] =3D {0};
> > +     unsigned int timeout_fmt, pretimeout_fmt;
> > +     int ret;
> > +
> > +     if (timeout)
> > +             wdev->timeout =3D timeout;
> > +
> Already set.
>
> > +     if (pretimeout) {
> > +             wdev->pretimeout =3D pretimeout;
>
> Pretimeout is already set in the probe function. Do it completely there.
>
> > +             pretimeout_fmt =3D wdev->pretimeout * 1000 | (WDT_PRETIME=
OUT_ACT << 24);
> > +     } else {
> > +             pretimeout_fmt =3D 0;
> > +     }
> > +
> > +     timeout_fmt =3D wdev->timeout * 1000 | (WDT_TIMEOUT_ACT << 24);
> > +     set_buf32(&buf[WDT_TIMEOUT_IDX], le32_to_cpu(timeout_fmt));
> > +     set_buf32(&buf[WDT_PRETIMEOUT_IDX], le32_to_cpu(pretimeout_fmt));
> > +
> > +     ret =3D nct6694_write_msg(nct6694, REQUEST_WDT_MOD,
> > +                             REQUEST_WDT_CMD0_OFFSET(data->wdev_idx),
> > +                             REQUEST_WDT_CMD0_LEN, buf);
>
>
> This seems pretty pointless at this time. Why not do it in the watchdog
> start function ?

[Ming] Yes, I will remove it and do it in the start callback in the next pa=
tch.

>
> > +     if (ret)
> > +             return ret;
> > +
> > +     pr_info("Setting WDT(%d): timeout =3D %d, pretimeout =3D %d\n",
> > +             data->wdev_idx, wdev->timeout, wdev->pretimeout);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct watchdog_info nct6694_wdt_info =3D {
> > +     .options =3D WDIOF_SETTIMEOUT     |
> > +                WDIOF_KEEPALIVEPING  |
> > +                WDIOF_MAGICCLOSE     |
> > +                WDIOF_PRETIMEOUT,
> > +     .identity =3D DRVNAME,
> > +};
> > +
> > +static const struct watchdog_ops nct6694_wdt_ops =3D {
> > +     .owner =3D THIS_MODULE,
> > +     .start =3D nct6694_wdt_start,
> > +     .stop =3D nct6694_wdt_stop,
> > +     .set_timeout =3D nct6694_wdt_set_timeout,
> > +     .set_pretimeout =3D nct6694_wdt_set_pretimeout,
> > +     .get_timeleft =3D nct6694_wdt_get_time,
> > +     .ping =3D nct6694_wdt_ping,
> > +};
> > +
> > +static int nct6694_wdt_probe(struct platform_device *pdev)
> > +{
> > +     const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_wdt_data *data;
> > +     struct watchdog_device *wdev;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->nct6694 =3D nct6694;
> > +     data->wdev_idx =3D cell->id;
> > +
> > +     wdev =3D &data->wdev;
> > +     wdev->info =3D &nct6694_wdt_info;
> > +     wdev->ops =3D &nct6694_wdt_ops;
> > +     wdev->timeout =3D WATCHDOG_TIMEOUT;
> > +     wdev->pretimeout =3D WATCHDOG_PRETIMEOUT;
> > +     wdev->min_timeout =3D 1;
> > +     wdev->max_timeout =3D 255;
> > +
> > +     platform_set_drvdata(pdev, data);
> > +
> > +     /* Register watchdog timer device to WDT framework */
> > +     watchdog_set_drvdata(&data->wdev, data);
> > +     watchdog_init_timeout(&data->wdev, timeout, &pdev->dev);
> > +     watchdog_set_nowayout(&data->wdev, nowayout);
> > +     watchdog_stop_on_reboot(&data->wdev);
> > +
> > +     ret =3D devm_watchdog_register_device(&pdev->dev, &data->wdev);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "%s: Failed to register watchdog devi=
ce: %d\n",
> > +                     __func__, ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D nct6694_wdt_setup(&data->wdev);
>
> This is too late. It needs to be done before registering the watchdog.
>
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "Failed to setup WDT device!\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver nct6694_wdt_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D DRVNAME,
> > +     },
> > +     .probe          =3D nct6694_wdt_probe,
> > +};
> > +
> > +static int __init nct6694_init(void)
> > +{
> > +     int err;
> > +
> > +     err =3D platform_driver_register(&nct6694_wdt_driver);
> > +     if (!err) {
> > +             if (err)
> > +                     platform_driver_unregister(&nct6694_wdt_driver);
> > +     }
> > +
> > +     return err;
> > +}
> > +subsys_initcall(nct6694_init);
> > +
> > +static void __exit nct6694_exit(void)
> > +{
> > +     platform_driver_unregister(&nct6694_wdt_driver);
> > +}
> > +module_exit(nct6694_exit);
> > +
> > +MODULE_DESCRIPTION("USB-WDT driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
>

Best regards,
Ming

