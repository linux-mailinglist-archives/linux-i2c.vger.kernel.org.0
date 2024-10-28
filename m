Return-Path: <linux-i2c+bounces-7628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E579B2A9F
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23BE71C20294
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4881922EB;
	Mon, 28 Oct 2024 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xfovqt/R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69818E354;
	Mon, 28 Oct 2024 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104966; cv=none; b=JvMWk47tIVMPhi7lTXi/hqYQsQN8DhEWQ/BrwMfCblsb6MS8dFKiGRbLdzLt+n4oifSujy0oCWfun3S9XTKlMKAXrp09unG1ZAwCEwKVLZ9dtE00MEZ02gfy09FsIS8PuOSWfYu1QHDcvvlV1lxJY9v9PK0YtykchB8wZkFC57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104966; c=relaxed/simple;
	bh=ePdra3MO0IeugyPP66t4pLFrGguG+bv817WMQlCvkKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1I6Znmf6f7H2aDnDf/Wv3Da1lSsOCqBxLJ1auzOUaTiLwfJSpvQmQ8hN4w3geEONq4dqN1s2sGFRY3ErOkIal3aOt1BQOR54+WkW7+HuBoUOADeDZeaxja6Ba85jnWahAUk4MyKme1pbF+N7QM4bFc1APKCWmTOumsjn2WuHbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xfovqt/R; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e29218d34f8so3003635276.1;
        Mon, 28 Oct 2024 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730104962; x=1730709762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stlw52D2RkaztgFBEjmFaW+TcxiAM+r4HIlJjKJf9u0=;
        b=Xfovqt/Rkj79tgAH8i0YHXr7Si+pDttq9hAs2agUCVteHQry0b0ooWIPf6pfUrCF8c
         YQx/IxJXIPzmNATCyACOL9vmQU2A5zb8MT1Ez4+DYz3W3jRp2Q5ESp7B9BCQcadlNh+3
         OmRUn0Capc+UUROZbBJ8Lt/fIttLH9zew4sbM55QBlAT/r8aOP+CTWLRfdWQFKuRGzPT
         O9KiTGv8tKrNwfB8nq11e5nqlYTJulwYXexx0OzBgPmpTAwDuy9M7czYxqzQAx//8mY8
         8rGpX8+YEUpoZjSu7/1rv6MbO6qY97ECCM0GIipxUkuFMajeL2kEQGO6CydxWAUOK8NT
         XdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104962; x=1730709762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stlw52D2RkaztgFBEjmFaW+TcxiAM+r4HIlJjKJf9u0=;
        b=IbyIxO8BdK9H6exLvdv/H7mqzjNg+uOaZjINdqWeB/F2I5rraahgEMizVBzkHO4VHt
         txq0HjAZtWOAbDvYvjwzi4nYBauzLAV4pXOC017DqkWVzzWyIe6xF+1QVmG8bRhyqnhf
         Z+LpPNMykBjbpFLlDicqvsoINDMVF2jTBWXFDKWlIdhynOGmNjkCBTv4oZtEsbT2ds1g
         lLJQbS/Qqnc0NP+MgbSxrD5VheXGQ9zmaCtcompDeKEZyCxxkTXneLDEOxBHXtPYsald
         C/DwB8knfZHZ1mbMGJbQdPZWk9uYHK0bM88qrLehLrWnLJYtU3lehXEpAKDEeo4r8opb
         eW1g==
X-Forwarded-Encrypted: i=1; AJvYcCU7JXg0ZnVHyOGPRMELPtxahgsrt0U8cveGJkLNxqLj/1WbVkxHCClNuY4ucqr6VF+mus8ms1NMBtfe50Y=@vger.kernel.org, AJvYcCV2MKa4LkAN0A+dDUZ3OeeMYtLQJJU2Rru5z4GGUaC7umeGyV9QrDLepRNrYYR4AnnZL3s480NwZdCq@vger.kernel.org, AJvYcCV3fO5VE3HghSlgeQvMzUkngjD908RidW0G0bqRs3YDBAQDmy9QIVPMYcMilvOZvKKh5TRvpZq4OCTh7pRc6lA=@vger.kernel.org, AJvYcCVD3rZpdrtJERDpiOVk7lR8TVmQuh8ehwgahsk5dvRuycQg9wkM7YZ9Ak6tahgjSWzEBMIXfZ2wMk06eA==@vger.kernel.org, AJvYcCVIuH8tmDrEc1OvKxb5Z7Ik5wBhkJA5Y7RiExZADiNDAvzDwMVfwkoY7HS1wHgbXq3+ECZTHEc3qMCU@vger.kernel.org, AJvYcCVcLPJ50kmly1u7/br2mZ/nTWnpru2otOpsm94UReVeouFLOI8i1ARd+hKnuN8zo2PsDYRRchvw0DNv@vger.kernel.org, AJvYcCWQ3mRl9F9FvU5j/MXazRDx6RgfRmzzrA59twGVDJ/3VgAARIzj6BcwYIC62KLVdxhQXe9hg5P+HEvp@vger.kernel.org, AJvYcCX9K09zX+1lMdjTGje2DDxwiyKrIrReMkLL8Kw8Ivg9IfznFX4uG6zOph84RzK60xUPfJo4WptHmzcSvlDY@vger.kernel.org, AJvYcCXcuK5w0x+knsSmyEG1UV8d6dVlkCc2qoPwRw236IFtIZIXUFUKFGfhesjRCeCsQp7vVjuil6xr@vger.kernel.org, AJvYcCXqgcIxcoAXwnu1pIeoR/tzVA2LJ0up
 RXxgTlZIG29DDb8S5hjuqIf9tNj97iQf+z+xXOdFOjxWDtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzftiXADv/GaqMLAjxah+CToi6gXBI2KNZ5A9q9nrzfmFJ+O/V5
	/sF5GYD/1K4HCx2Qk7xvMvVrpVsj8YtBgBcj1Mz6f1w3XotkZPWT5r9BFl2bW88VDswNQREiv+N
	FyYxF6dubgC+KkCH/fBPWyDviD1I=
X-Google-Smtp-Source: AGHT+IG9RrL4kvo7wKzvY4aDE5N31bqWZtK2jDgsvVsMeP2l/gNDdDnQ5zO31xLW8eBUDB5vuj9P2lLvVLS8JUMFKd4=
X-Received: by 2002:a25:b285:0:b0:e29:6f34:5a78 with SMTP id
 3f1490d57ef6-e2eb866aed4mr11080319276.9.1730104962251; Mon, 28 Oct 2024
 01:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-10-tmyu0@nuvoton.com>
 <CABMQnVK5_gq2+ftMDdJuzdGY131==OEsxuF9hCqT=KmQw-fYoA@mail.gmail.com>
In-Reply-To: <CABMQnVK5_gq2+ftMDdJuzdGY131==OEsxuF9hCqT=KmQw-fYoA@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 16:42:31 +0800
Message-ID: <CAOoeyxXiNWWznKWEC+aXbnyMEoLNrVfGAw92WZ6XR85xzbNnBA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] rtc: Add Nuvoton NCT6694 RTC support
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
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

Dear Nobuhiro,

Thank you for your comments,

Nobuhiro Iwamatsu <iwamatsu@nigauri.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
26=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=887:35=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hello,
>
> 2024=E5=B9=B410=E6=9C=8824=E6=97=A5(=E6=9C=A8) 18:04 Ming Yu <a0282524688=
@gmail.com>:
> >
> > This driver supports RTC functionality for NCT6694 MFD device
> > based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >  MAINTAINERS               |   1 +
> >  drivers/rtc/Kconfig       |  10 ++
> >  drivers/rtc/Makefile      |   1 +
> >  drivers/rtc/rtc-nct6694.c | 276 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 288 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-nct6694.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4d5a5eded3b9..8de90bda8b5e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16445,6 +16445,7 @@ F:      drivers/i2c/busses/i2c-nct6694.c
> >  F:     drivers/mfd/nct6694.c
> >  F:     drivers/net/can/nct6694_canfd.c
> >  F:     drivers/pwm/pwm-nct6694.c
> > +F:     drivers/rtc/rtc-nct6694.c
> >  F:     drivers/watchdog/nct6694_wdt.c
> >  F:     include/linux/mfd/nct6694.h
> >
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 66eb1122248b..240c496d95f7 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -406,6 +406,16 @@ config RTC_DRV_NCT3018Y
> >            This driver can also be built as a module, if so, the module=
 will be
> >            called "rtc-nct3018y".
> >
> > +config RTC_DRV_NCT6694
> > +       tristate "Nuvoton NCT6694 RTC support"
> > +       depends on MFD_NCT6694
> > +       help
> > +       If you say yes to this option, support will be included for Nuv=
oton
> > +       NCT6694, a USB device to RTC.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called rtc-nct6694.
> > +
> >  config RTC_DRV_RK808
> >         tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
> >         depends on MFD_RK8XX
> > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > index f62340ecc534..64443d26bb5b 100644
> > --- a/drivers/rtc/Makefile
> > +++ b/drivers/rtc/Makefile
> > @@ -116,6 +116,7 @@ obj-$(CONFIG_RTC_DRV_MXC)   +=3D rtc-mxc.o
> >  obj-$(CONFIG_RTC_DRV_MXC_V2)   +=3D rtc-mxc_v2.o
> >  obj-$(CONFIG_RTC_DRV_GAMECUBE) +=3D rtc-gamecube.o
> >  obj-$(CONFIG_RTC_DRV_NCT3018Y) +=3D rtc-nct3018y.o
> > +obj-$(CONFIG_RTC_DRV_NCT6694)  +=3D rtc-nct6694.o
> >  obj-$(CONFIG_RTC_DRV_NTXEC)    +=3D rtc-ntxec.o
> >  obj-$(CONFIG_RTC_DRV_OMAP)     +=3D rtc-omap.o
> >  obj-$(CONFIG_RTC_DRV_OPAL)     +=3D rtc-opal.o
> > diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
> > new file mode 100644
> > index 000000000000..622bb9fbe6f6
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-nct6694.c
> > @@ -0,0 +1,276 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 RTC driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/slab.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/rtc.h>
> > +#include <linux/bcd.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mfd/nct6694.h>
>
> Please sort header files alphabetically.

[Ming] Okay! I will sort these headers in the next patch.

>
> > +
> > +#define DRVNAME "nct6694-rtc"
> > +
> > +/* Host interface */
> > +#define REQUEST_RTC_MOD                0x08
> > +
> > +/* Message Channel */
> > +/* Command 00h */
> > +#define REQUEST_RTC_CMD0_LEN   0x07
> > +#define REQUEST_RTC_CMD0_OFFSET        0x0000  /* OFFSET =3D SEL|CMD *=
/
> > +#define RTC_SEC_IDX            0x00
> > +#define RTC_MIN_IDX            0x01
> > +#define RTC_HOUR_IDX           0x02
> > +#define RTC_WEEK_IDX           0x03
> > +#define RTC_DAY_IDX            0x04
> > +#define RTC_MONTH_IDX          0x05
> > +#define RTC_YEAR_IDX           0x06
> > +/* Command 01h */
> > +#define REQUEST_RTC_CMD1_LEN   0x05
> > +#define REQUEST_RTC_CMD1_OFFSET        0x0001  /* OFFSET =3D SEL|CMD *=
/
> > +#define RTC_ALRM_EN_IDX                0x03
> > +#define RTC_ALRM_PEND_IDX      0x04
> > +/* Command 02h */
> > +#define REQUEST_RTC_CMD2_LEN   0x02
> > +#define REQUEST_RTC_CMD2_OFFSET        0x0002  /* OFFSET =3D SEL|CMD *=
/
> > +#define RTC_IRQ_EN_IDX         0x00
> > +#define RTC_IRQ_PEND_IDX       0x01
> > +
> > +#define RTC_IRQ_EN             (BIT(0) | BIT(5))
>
> RTC_IRQ_INT_EN | RTC_IRQ_GPO_EN ?

[Ming] Yes, it is used to enable both of them.

>
> > +#define RTC_IRQ_INT_EN         BIT(0)  /* Transmit a USB INT-in when R=
TC alarm */
> > +#define RTC_IRQ_GPO_EN         BIT(5)  /* Trigger a GPO Low Pulse when=
 RTC alarm */
> > +#define RTC_IRQ_STS            BIT(0)  /* Write 1 clear IRQ status */
> > +
> > +struct nct6694_rtc_data {
> > +       struct nct6694 *nct6694;
> > +       struct rtc_device *rtc;
> > +       struct work_struct alarm_work;
> > +};
> > +
> > +static int nct6694_rtc_read_time(struct device *dev, struct rtc_time *=
tm)
> > +{
> > +       struct nct6694_rtc_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf[REQUEST_RTC_CMD0_LEN];
> > +       int ret;
> > +
> > +       ret =3D nct6694_read_msg(data->nct6694, REQUEST_RTC_MOD,
> > +                              REQUEST_RTC_CMD0_OFFSET, REQUEST_RTC_CMD=
0_LEN,
> > +                              0, REQUEST_RTC_CMD0_LEN, buf);
> > +       if (ret) {
> > +               pr_err("%s: Failed to get rtc device!\n", __func__);
> > +               return -EIO;
> > +       }
> > +
> > +       tm->tm_sec =3D bcd2bin(buf[RTC_SEC_IDX]);         /* tm_sec exp=
ect 0 ~ 59 */
> > +       tm->tm_min =3D bcd2bin(buf[RTC_MIN_IDX]);         /* tm_min exp=
ect 0 ~ 59 */
> > +       tm->tm_hour =3D bcd2bin(buf[RTC_HOUR_IDX]);       /* tm_hour ex=
pect 0 ~ 23 */
> > +       tm->tm_wday =3D bcd2bin(buf[RTC_WEEK_IDX]) - 1;   /* tm_wday ex=
pect 0 ~ 6 */
> > +       tm->tm_mday =3D bcd2bin(buf[RTC_DAY_IDX]);        /* tm_mday ex=
pect 1 ~ 31 */
> > +       tm->tm_mon =3D bcd2bin(buf[RTC_MONTH_IDX]) - 1;   /* tm_month e=
xpect 0 ~ 11 */
> > +       tm->tm_year =3D bcd2bin(buf[RTC_YEAR_IDX]) + 100; /* tm_year ex=
pect since 1900 */
> > +
> > +       return ret;
> > +}
> > +
> > +static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *t=
m)
> > +{
> > +       struct nct6694_rtc_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf[REQUEST_RTC_CMD0_LEN];
> > +       int ret;
> > +
> > +       buf[RTC_SEC_IDX] =3D bin2bcd(tm->tm_sec);
> > +       buf[RTC_MIN_IDX] =3D bin2bcd(tm->tm_min);
> > +       buf[RTC_HOUR_IDX] =3D bin2bcd(tm->tm_hour);
> > +       buf[RTC_WEEK_IDX] =3D bin2bcd(tm->tm_wday + 1);
> > +       buf[RTC_DAY_IDX] =3D bin2bcd(tm->tm_mday);
> > +       buf[RTC_MONTH_IDX] =3D bin2bcd(tm->tm_mon + 1);
> > +       buf[RTC_YEAR_IDX] =3D bin2bcd(tm->tm_year - 100);
> > +
> > +       ret =3D nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
> > +                               REQUEST_RTC_CMD0_OFFSET, REQUEST_RTC_CM=
D0_LEN,
> > +                               buf);
> > +       if (ret) {
> > +               pr_err("%s: Failed to set rtc device!\n", __func__);
> > +               return -EIO;
>
> Why do you return -EIO? Please do not overwrite error codes.

[Ming] Understood, thank you.

>
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alrm)
> > +{
> > +       struct nct6694_rtc_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf[REQUEST_RTC_CMD1_LEN];
> > +       int ret;
> > +
> > +       ret =3D nct6694_read_msg(data->nct6694, REQUEST_RTC_MOD,
> > +                              REQUEST_RTC_CMD1_OFFSET, REQUEST_RTC_CMD=
1_LEN,
> > +                              0, REQUEST_RTC_CMD1_LEN, buf);
> > +       if (ret) {
> > +               pr_err("%s: Failed to get rtc device!\n", __func__);
> > +               return -EIO;
>
> same as above.
>
> > +       }
> > +
> > +       alrm->time.tm_sec =3D bcd2bin(buf[RTC_SEC_IDX]);
> > +       alrm->time.tm_min =3D bcd2bin(buf[RTC_MIN_IDX]);
> > +       alrm->time.tm_hour =3D bcd2bin(buf[RTC_HOUR_IDX]);
> > +
> > +       alrm->enabled =3D buf[RTC_ALRM_EN_IDX];
> > +       alrm->pending =3D buf[RTC_ALRM_PEND_IDX];
> > +
> > +       return ret;
> > +}
> > +
> > +static int nct6694_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> > +{
> > +       struct nct6694_rtc_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf[REQUEST_RTC_CMD1_LEN];
> > +       int ret;
> > +
> > +       buf[RTC_SEC_IDX] =3D bin2bcd(alrm->time.tm_sec);
> > +       buf[RTC_MIN_IDX] =3D bin2bcd(alrm->time.tm_min);
> > +       buf[RTC_HOUR_IDX] =3D bin2bcd(alrm->time.tm_hour);
> > +       buf[RTC_ALRM_EN_IDX] =3D alrm->enabled ? RTC_IRQ_EN : 0;
> > +       buf[RTC_ALRM_PEND_IDX] =3D 0;
> > +
> > +       ret =3D nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
> > +                               REQUEST_RTC_CMD1_OFFSET, REQUEST_RTC_CM=
D1_LEN,
> > +                               buf);
> > +       if (ret) {
> > +               pr_err("%s: Failed to set rtc device!\n", __func__);
> > +               return -EIO;
>
> same as above.
>
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned i=
nt enabled)
> > +{
> > +       struct nct6694_rtc_data *data =3D dev_get_drvdata(dev);
> > +       unsigned char buf[REQUEST_RTC_CMD2_LEN] =3D {0};
> > +       int ret;
> > +
> > +       if (enabled)
> > +               buf[RTC_IRQ_EN_IDX] |=3D RTC_IRQ_EN;
> > +       else
> > +               buf[RTC_IRQ_EN_IDX] &=3D ~RTC_IRQ_EN;
> > +
> > +       ret =3D nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
> > +                               REQUEST_RTC_CMD2_OFFSET, REQUEST_RTC_CM=
D2_LEN,
> > +                               buf);
> > +       if (ret) {
> > +               pr_err("%s: Failed to set rtc device!\n", __func__);
> > +               return -EIO;
>
> same as above.
>
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct rtc_class_ops nct6694_rtc_ops =3D {
> > +       .read_time =3D nct6694_rtc_read_time,
> > +       .set_time =3D nct6694_rtc_set_time,
> > +       .read_alarm =3D nct6694_rtc_read_alarm,
> > +       .set_alarm =3D nct6694_rtc_set_alarm,
> > +       .alarm_irq_enable =3D nct6694_rtc_alarm_irq_enable,
> > +};
> > +
> > +static void nct6694_rtc_alarm(struct work_struct *work)
> > +{
> > +       struct nct6694_rtc_data *data;
> > +       unsigned char buf[REQUEST_RTC_CMD2_LEN] =3D {0};
> > +
> > +       data =3D container_of(work, struct nct6694_rtc_data, alarm_work=
);
> > +
> > +       pr_info("%s: Got RTC alarm!\n", __func__);
> > +       buf[RTC_IRQ_EN_IDX] =3D RTC_IRQ_EN;
> > +       buf[RTC_IRQ_PEND_IDX] =3D RTC_IRQ_STS;
> > +       nct6694_write_msg(data->nct6694, REQUEST_RTC_MOD,
> > +                         REQUEST_RTC_CMD2_OFFSET,
> > +                         REQUEST_RTC_CMD2_LEN, buf);
> > +}
> > +
> > +static void nct6694_rtc_handler(void *private_data)
> > +{
> > +       struct nct6694_rtc_data *data =3D private_data;
> > +       struct nct6694 *nct6694 =3D data->nct6694;
> > +
> > +       queue_work(nct6694->async_workqueue, &data->alarm_work);
> > +}
> > +
> > +static int nct6694_rtc_probe(struct platform_device *pdev)
> > +{
> > +       struct nct6694_rtc_data *data;
> > +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +       int ret;
> > +
> > +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       data->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > +       if (IS_ERR(data->rtc))
> > +               return PTR_ERR(data->rtc);
>
> Please use dev_err_probe.

[Ming] Okay! I will change it in the next patch.

>
> > +
> > +       data->nct6694 =3D nct6694;
> > +       data->rtc->ops =3D &nct6694_rtc_ops;
> > +       data->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> > +       data->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > +
> > +       INIT_WORK(&data->alarm_work, nct6694_rtc_alarm);
> > +
> > +       ret =3D nct6694_register_handler(nct6694, RTC_IRQ_STATUS,
> > +                                      nct6694_rtc_handler, data);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "%s:  Failed to register handler: %=
pe\n",
> > +                       __func__, ERR_PTR(ret));
>
> Please use dev_err_probe.

[Ming] Okay! I will change it in the next patch.

>
> > +               return ret;
> > +       }
> > +
> > +       device_set_wakeup_capable(&pdev->dev, 1);
> > +
> > +       platform_set_drvdata(pdev, data);
> > +
> > +       /* Register rtc device to RTC framework */
> > +       ret =3D devm_rtc_register_device(data->rtc);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Failed to register rtc device!\n")=
;
> > +               return ret;
> > +       }
>
> You can simplify return devm_rtc_register_device.

[Ming] Okay! I will change it in the next patch.

>
> > +
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver nct6694_rtc_driver =3D {
> > +       .driver =3D {
> > +               .name   =3D DRVNAME,
> > +       },
> > +       .probe          =3D nct6694_rtc_probe,
> > +};
> > +
> > +static int __init nct6694_init(void)
> > +{
> > +       int err;
> > +
> > +       err =3D platform_driver_register(&nct6694_rtc_driver);
> > +       if (!err) {
> > +               if (err)
>
> This looks strange. You can simplify return platform_driver_register.

[Ming] For platform driver registration, I'll change it to
module_platform_driver() in the next patch.

>
> > +                       platform_driver_unregister(&nct6694_rtc_driver)=
;
> > +       }
> > +
> > +       return err;
> > +}
> > +subsys_initcall(nct6694_init);
> > +
> > +static void __exit nct6694_exit(void)
> > +{
> > +       platform_driver_unregister(&nct6694_rtc_driver);
> > +}
> > +module_exit(nct6694_exit);
> > +
> > +MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
> >
>
> Best regards,
>   Nobuhiro
>
> --
> Nobuhiro Iwamatsu
>    iwamatsu at {nigauri.org / debian.org / kernel.org}
>    GPG ID: 32247FBB40AD1FA6

Best regards,
Ming

