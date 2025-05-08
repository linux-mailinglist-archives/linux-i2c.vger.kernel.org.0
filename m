Return-Path: <linux-i2c+bounces-10885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB8AAF19E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 05:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A599E099A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 03:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CE620012B;
	Thu,  8 May 2025 03:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVoAb1fc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D91E32BE;
	Thu,  8 May 2025 03:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674784; cv=none; b=qKWw90PRVl6VqXhHifZZIHi5eVovfn96GwAkK6cFcMhdNXdWb9qfv1UhsacE0aGgtf/NGog0RD9RugFIkSDrdkOmHA7lDYlWnAjvoUY/vg+xhtNtLPpJNoPw0mjZ9IekZGmtSL/3JKuv+VSFg8VYzRqAk7xu1yJprHRGmKWbvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674784; c=relaxed/simple;
	bh=sgMGxSIPEB3TiLNN/LyxLmdGzWzWazFsYiB+n3IGauE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYxU6XDI4dLN1MthyblmLbsesw6/Cvfk99XNgXDpxjJeTX6bMkdkn9tGsBYs0Ytx2ZrbPrenrVpbbmfU5Mk7UARRSK+x4lL9/BQUfIniAf3Vqko4+PndS0J2JMp/1sDqU0zWRS8/0YEtz6mBq/qvLysZhrBcFaO989Hx0mvvWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVoAb1fc; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70a35432c21so169877b3.0;
        Wed, 07 May 2025 20:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746674781; x=1747279581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQXpXy9kvwFz/LNWQbKVfO2XYo1pOkSXCQtCYhWplNI=;
        b=hVoAb1fcAgeOY+8UjjCJOsKIwZJhV0W0Iy9g8TZabzlNYXa4k8a+r7hDQgNJVIPvvs
         shGIHaCkuaAJPs9V5bq1cYgyR/AYKCYQ7Ipzrn+V1jc+0Zx1jn5BAZ6JbDpxPFn3KrDA
         N4xy2JoKoQwL1ah0BQy7Ja4Q+0SxOxq/rjXpQ0Ak0XxaEU2yR5EyH2g6w8kCrH5XvsFz
         4MOVNJRfEL5VAYg9OBB31DzcSlvJziMQCVtA/0gc5Vr2lqrQiVijcsgxF+YxP/6Vjv/b
         LPMNC3R1Yi5GWxmuaBUcx0hPBlltJ2yzf8rxKXbKb8/RIwXsl0dC0XqMouhiFI+i64rn
         oAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746674781; x=1747279581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQXpXy9kvwFz/LNWQbKVfO2XYo1pOkSXCQtCYhWplNI=;
        b=MTI1JwyrgEqR9DA653BfVtahtLxRxgtRzj/Eme1df2l3ujSpKUL+Qv9D5F8ZuPHJg7
         eL34Gw8TJhu5GfwwW8bpeWQNSEmVXjO7f8AUn1He0R/vjQ9JKDyBtzrB4IdFFokDaz5t
         AfD3uGD4u7P3GyXMnk1vCQqOyuv/pv5vFg9Iockv7F0CD4Fb3vKmYTFYIibdzz6NoAFq
         Du729xitjxfz+zaAM8SE8qtb3aU87qlteoCSCPUcL0+RHWAqMmxUUsfFH1wswoPcY7aF
         t7mFNCQoYuYWsj9pP8HneBByKwAJgmuRJmjSJoZHsXp5xs/T535uzJA2AnTuGQFry1xh
         hphA==
X-Forwarded-Encrypted: i=1; AJvYcCU1zLWzKCQJftUFxjlv8G6UPLTwGvUjjReMkf2UNbIte2mQf157EIcuEVcznQNC/1JBUHhvQd6E8x+pEZtZPGo=@vger.kernel.org, AJvYcCVpjUjUD+zCASP/7OSejT9jCr2ofEHdJiGdipZL7pFbDWw5IjXWgWY7YLTjIn/oDIJ5e4+3kfwgEkAONwk=@vger.kernel.org, AJvYcCWB7lJwu5gJDZOp1Kh2UOIdaB9v8ZwXPu1uNmpmTjLJT3uwMs8yXeb7zgwf8lfj2HCGy54gvOEac3I=@vger.kernel.org, AJvYcCWK6n7O58VyYHKhSmY3luzEAq3dvIKOg3alvnSPMO801FJRHjBPGMZeSuZbluj+j1x8FTnUeY8z@vger.kernel.org, AJvYcCWR79hRbs+P3fKQOzHXQkZlMu81guAWRLij/JU16u1ooR4ZpUx9SudbLQrhbcSud/a/65PN1HMmsa5Q5JtO@vger.kernel.org, AJvYcCWi7BSzaIu5MP2Mv2cyaaOv+gzIcJF7QaYbLPKhx0tzoi2dJOYpgxVrInfh32zxZxJ/PVtrrPcH2bBx@vger.kernel.org, AJvYcCWvjt2mY9sgfhLNbDql5UC1xYoqOZqQIDW90jcn55PXmoF5HU3MX3tTzXoni9av8Dxui/2VHWVeAzyuNg==@vger.kernel.org, AJvYcCWypr1tsCU9gIhtBqdXY5FPc654e6qzTaixxaSVNUwJjXI9oYPwH+JxOjm7ODHe9SKXr5bjGRLAB0Yg@vger.kernel.org, AJvYcCXEH6qm/smUEDJ6NkvHQQBWRfqSqPdbhdI9N/KLZ4cE/+V2g/x6u0lfco8GCUEKUAIanjjXP/DroveE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CikslRkxEtmueoDvtvOsk/ZkimkhVzPsypEN+CSAe61VOu89
	yUOlRQdJBsubUZRn1kvYCjAIPQryCaTeFlbiyyO77aZgG08yGbufsPsJE4eAGgurh593kl+Y6em
	fPs+wz4liJpm6iyJXp3LyFjsab+Y=
X-Gm-Gg: ASbGncuEf34dHw8KNbq0ieuh8kCw+Gbo9Ytl91OLkbcARZ2GVJS0e9qQVbh/RH4Kk6H
	Eb1R+10hgfqUMMiEsiFZodj71cZuRRFYhQUDK1uHczQmLzv06RKobzLYN+p1WkGKZUQuZ6Vvx7k
	I0mzYX5HshQU8kdtVg0TKE0Q6JlF3nS5xrlW5AKk1g8XObG5TxKJAm09dn
X-Google-Smtp-Source: AGHT+IHo2Dnh2TuiUkEaDlxF/MceVyFC/xMnqNp7oGWDOa1fZjnFFojZOFIfnLlkXimaCOBxvK9y2PySrS0yBZ4zOwk=
X-Received: by 2002:a05:690c:620c:b0:6f9:97f7:a5c4 with SMTP id
 00721157ae682-70a1db166d9mr80859697b3.29.1746674781289; Wed, 07 May 2025
 20:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423094058.1656204-1-tmyu0@nuvoton.com> <20250423094058.1656204-5-tmyu0@nuvoton.com>
 <20250503-fulmar-of-sexy-upgrade-1184a7-mkl@pengutronix.de>
In-Reply-To: <20250503-fulmar-of-sexy-upgrade-1184a7-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 8 May 2025 11:26:09 +0800
X-Gm-Features: ATxdqUGTZzo2tvN_GyqRwnemDb0_weO_pv8-aCyrEUlG0IXDKCVeV7FIjSxksDk
Message-ID: <CAOoeyxWbr6jfZjPvYFD+vHKMZ9CpM6SLt+2xo-4E-NnhGinfvg@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marc,

Thank you for reviewing.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B45=E6=9C=883=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=889:57=E5=AF=AB=E9=81=93=EF=BC=
=9A

> > This driver supports Socket CANFD functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
>
> The destroy functions nct6694_canfd_close() and nct6694_canfd_remove()
> are not the exact inverse of their init functions. Se comments inline.
>
> Please fix and add:
>
> Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
>
> Feel free to mainline this patch as part of the series outside of the
> linux-can-next tree. Better ask the netdev maintainers for their OK, too.
>
> What about transceiver delay compensation for higher CAN-FD bitrates?
> How does you device handle these?
>

In the CAN CMD0's DBTP field, bit 23 is the TDC flag, I will add
support for enabling tdc, and firmware will automatically configure
tdco. Do you think this approach is appropriate?

> > ---
> >  MAINTAINERS                         |   1 +
> >  drivers/net/can/usb/Kconfig         |  11 +
> >  drivers/net/can/usb/Makefile        |   1 +
> >  drivers/net/can/usb/nct6694_canfd.c | 814 ++++++++++++++++++++++++++++
> >  4 files changed, 827 insertions(+)
> >  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 751b9108524a..ee8583edc2d2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17364,6 +17364,7 @@ S:    Supported
> >  F:   drivers/gpio/gpio-nct6694.c
> >  F:   drivers/i2c/busses/i2c-nct6694.c
> >  F:   drivers/mfd/nct6694.c
> > +F:   drivers/net/can/usb/nct6694_canfd.c
> >  F:   include/linux/mfd/nct6694.h
> >
> >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> > diff --git a/drivers/net/can/usb/Kconfig b/drivers/net/can/usb/Kconfig
> > index 9dae0c71a2e1..759e724a67cf 100644
> > --- a/drivers/net/can/usb/Kconfig
> > +++ b/drivers/net/can/usb/Kconfig
> > @@ -133,6 +133,17 @@ config CAN_MCBA_USB
> >         This driver supports the CAN BUS Analyzer interface
> >         from Microchip (http://www.microchip.com/development-tools/).
> >
> > +config CAN_NCT6694
> > +     tristate "Nuvoton NCT6694 Socket CANfd support"
> > +     depends on MFD_NCT6694
> > +     select CAN_RX_OFFLOAD
> > +     help
> > +       If you say yes to this option, support will be included for Nuv=
oton
> > +       NCT6694, a USB device to socket CANfd controller.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called nct6694_canfd.
> > +
> >  config CAN_PEAK_USB
> >       tristate "PEAK PCAN-USB/USB Pro interfaces for CAN 2.0b/CAN-FD"
> >       help
> > diff --git a/drivers/net/can/usb/Makefile b/drivers/net/can/usb/Makefil=
e
> > index 8b11088e9a59..fcafb1ac262e 100644
> > --- a/drivers/net/can/usb/Makefile
> > +++ b/drivers/net/can/usb/Makefile
> > @@ -11,5 +11,6 @@ obj-$(CONFIG_CAN_F81604) +=3D f81604.o
> >  obj-$(CONFIG_CAN_GS_USB) +=3D gs_usb.o
> >  obj-$(CONFIG_CAN_KVASER_USB) +=3D kvaser_usb/
> >  obj-$(CONFIG_CAN_MCBA_USB) +=3D mcba_usb.o
> > +obj-$(CONFIG_CAN_NCT6694) +=3D nct6694_canfd.o
> >  obj-$(CONFIG_CAN_PEAK_USB) +=3D peak_usb/
> >  obj-$(CONFIG_CAN_UCAN) +=3D ucan.o
> > diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/=
nct6694_canfd.c
> > new file mode 100644
> > index 000000000000..9cf6230ffb7d
> > --- /dev/null
> > +++ b/drivers/net/can/usb/nct6694_canfd.c
> > @@ -0,0 +1,814 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Nuvoton NCT6694 Socket CANfd driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/can/dev.h>
> > +#include <linux/can/rx-offload.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/netdevice.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DEVICE_NAME "nct6694-canfd"
> > +
> > +/* USB command module type for NCT6694 CANfd controller.
> > + * This defines the module type used for communication with the NCT669=
4
> > + * CANfd controller over the USB interface.
> > + */
> > +#define NCT6694_CANFD_MOD                    0x05
> > +
> > +/* Command 00h - CAN Setting and Initialization */
> > +#define NCT6694_CANFD_SETTING                        0x00
> > +#define NCT6694_CANFD_SETTING_ACTIVE_CTRL1   BIT(0)
> > +#define NCT6694_CANFD_SETTING_ACTIVE_CTRL2   BIT(1)
> > +#define NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP       BIT(2)
> > +#define NCT6694_CANFD_SETTING_CTRL1_MON              BIT(0)
> > +#define NCT6694_CANFD_SETTING_CTRL1_NISO     BIT(1)
> > +#define NCT6694_CANFD_SETTING_CTRL1_LBCK     BIT(2)
> > +#define NCT6694_CANFD_SETTING_NBTP_NTSEG2    GENMASK(6, 0)
> > +#define NCT6694_CANFD_SETTING_NBTP_NTSEG1    GENMASK(15, 8)
> > +#define NCT6694_CANFD_SETTING_NBTP_NBRP              GENMASK(24, 16)
> > +#define NCT6694_CANFD_SETTING_NBTP_NSJW              GENMASK(31, 25)
> > +#define NCT6694_CANFD_SETTING_DBTP_DSJW              GENMASK(3, 0)
> > +#define NCT6694_CANFD_SETTING_DBTP_DTSEG2    GENMASK(7, 4)
> > +#define NCT6694_CANFD_SETTING_DBTP_DTSEG1    GENMASK(12, 8)
> > +#define NCT6694_CANFD_SETTING_DBTP_DBRP              GENMASK(20, 16)

I will add the macro in v11: #define NCT6694_CANFD_SETTING_DBTP_TDC

> > +
> > +/* Command 01h - CAN Information */
> > +#define NCT6694_CANFD_INFORMATION            0x01
> > +#define NCT6694_CANFD_INFORMATION_SEL                0x00
> > +
> > +/* Command 02h - CAN Event */
> > +#define NCT6694_CANFD_EVENT                  0x02
> > +#define NCT6694_CANFD_EVENT_SEL(idx, mask)   \
> > +     ((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
> > +
> > +#define NCT6694_CANFD_EVENT_MASK             GENMASK(5, 0)
> > +#define NCT6694_CANFD_EVT_TX_FIFO_EMPTY              BIT(7)  /* Read-c=
lear */
> > +#define NCT6694_CANFD_EVT_RX_DATA_LOST               BIT(5)  /* Read-c=
lear */
> > +#define NCT6694_CANFD_EVT_RX_DATA_IN         BIT(7)  /* Read-clear*/
>                                                                     ^^
> add a space
>
> > +
...
> > +static int nct6694_canfd_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > +     struct nct6694_canfd_setting *setting __free(kfree) =3D NULL;
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CANFD_MOD,
> > +             .cmd =3D NCT6694_CANFD_SETTING,
> > +             .sel =3D ndev->dev_port,
> > +             .len =3D cpu_to_le16(sizeof(*setting))
> > +     };
> > +     int ret;
> > +
> > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > +     if (!setting)
> > +             return -ENOMEM;
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTR=
L1_MON);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTR=
L1_NISO);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTR=
L1_LBCK);
> > +
> > +     /* Disable clock divider */
> > +     setting->ctrl2 =3D 0;
> > +
> > +     setting->nbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NB=
TP_NSJW,
> > +                                            n_bt->sjw - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NBTP=
_NBRP,
> > +                                            n_bt->brp - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NBTP=
_NTSEG2,
> > +                                            n_bt->phase_seg2 - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NBTP=
_NTSEG1,
> > +                                            n_bt->prop_seg + n_bt->pha=
se_seg1 - 1));
> > +
> > +     setting->dbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DB=
TP_DSJW,
> > +                                            d_bt->sjw - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP=
_DBRP,
> > +                                            d_bt->brp - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP=
_DTSEG2,
> > +                                            d_bt->phase_seg2 - 1) |
> > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP=
_DTSEG1,
> > +                                            d_bt->prop_seg + d_bt->pha=
se_seg1 - 1));

I'll update the code to:
     setting->dbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DS=
JW,
                                            d_bt->sjw - 1) |
                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DBRP=
,
                                            d_bt->brp - 1) |
                                 FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSE=
G2,
                                            d_bt->phase_seg2 - 1) |
                                FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG=
1,
                                           d_bt->prop_seg +
d_bt->phase_seg1 - 1) |
                                NCT6694_CANFD_SETTING_DBTP_TDC);

> > +
> > +     setting->active =3D NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
> > +                       NCT6694_CANFD_SETTING_ACTIVE_CTRL2 |
> > +                       NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP;
> > +
> > +     ret =3D nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +
> > +     return 0;
> > +}
> > +
> > +static void nct6694_canfd_stop(struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_canfd_setting *setting __free(kfree) =3D NULL;
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CANFD_MOD,
> > +             .cmd =3D NCT6694_CANFD_SETTING,
> > +             .sel =3D ndev->dev_port,
> > +             .len =3D cpu_to_le16(sizeof(*setting))
> > +     };
> > +
> > +     /* The NCT6694 cannot be stopped. To ensure safe operation and av=
oid
> > +      * interference, the control mode is set to Listen-Only mode. Thi=
s
> > +      * mode allows the device to monitor bus activity without activel=
y
> > +      * participating in communication.
> > +      */
> > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > +     if (!setting)
> > +             return;
> > +
> > +     nct6694_read_msg(priv->nct6694, &cmd_hd, setting);
> > +     setting->ctrl1 =3D cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
> > +     setting->active =3D NCT6694_CANFD_SETTING_ACTIVE_CTRL1;
> > +     nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> > +
> > +     priv->can.state =3D CAN_STATE_STOPPED;
> > +}
> > +
> > +static int nct6694_canfd_close(struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +
>
> make this inverse to nct6694_canfd_open()
>

Fix it in v11.

> > +     netif_stop_queue(ndev);
> > +     can_rx_offload_disable(&priv->offload);
> > +     nct6694_canfd_stop(ndev);
> > +     free_irq(ndev->irq, ndev);
> > +     destroy_workqueue(priv->wq);
> > +     close_candev(ndev);
> > +     return 0;
> > +}
> > +
> > +static int nct6694_canfd_set_mode(struct net_device *ndev, enum can_mo=
de mode)
> > +{
> > +     int ret;
> > +
> > +     switch (mode) {
> > +     case CAN_MODE_START:
> > +             ret =3D nct6694_canfd_start(ndev);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             netif_wake_queue(ndev);
> > +             break;
> > +
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int nct6694_canfd_open(struct net_device *ndev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +     int ret;
> > +
> > +     ret =3D open_candev(ndev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     can_rx_offload_enable(&priv->offload);
> > +
> > +     ret =3D request_threaded_irq(ndev->irq, NULL,
> > +                                nct6694_canfd_irq, IRQF_ONESHOT,
> > +                                "nct6694_canfd", ndev);
> > +     if (ret) {
> > +             netdev_err(ndev, "Failed to request IRQ\n");
> > +             goto close_candev;
>
> nitpick: rename to can_rx_offload_disable
>

Fix it in v11.

> > +     }
> > +
> > +     priv->wq =3D alloc_ordered_workqueue("%s-nct6694_wq",
> > +                                        WQ_FREEZABLE | WQ_MEM_RECLAIM,
> > +                                        ndev->name);
> > +     if (!priv->wq) {
> > +             ret =3D -ENOMEM;
> > +             goto free_irq;
> > +     }
> > +
> > +     ret =3D nct6694_canfd_start(ndev);
> > +     if (ret)
> > +             goto destroy_wq;
> > +
> > +     netif_start_queue(ndev);
> > +
> > +     return 0;
> > +
> > +destroy_wq:
> > +     destroy_workqueue(priv->wq);
> > +free_irq:
> > +     free_irq(ndev->irq, ndev);
> > +close_candev:
> > +     can_rx_offload_disable(&priv->offload);
> > +     close_candev(ndev);
> > +     return ret;
> > +}
> > +
> > +static const struct net_device_ops nct6694_canfd_netdev_ops =3D {
> > +     .ndo_open =3D nct6694_canfd_open,
> > +     .ndo_stop =3D nct6694_canfd_close,
> > +     .ndo_start_xmit =3D nct6694_canfd_start_xmit,
> > +     .ndo_change_mtu =3D can_change_mtu,
> > +};
> > +
> > +static const struct ethtool_ops nct6694_canfd_ethtool_ops =3D {
> > +     .get_ts_info =3D ethtool_op_get_ts_info,
> > +};
> > +
> > +static int nct6694_canfd_get_clock(struct nct6694_canfd_priv *priv)
> > +{
> > +     struct nct6694_canfd_information *info __free(kfree) =3D NULL;
> > +     static const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_CANFD_MOD,
> > +             .cmd =3D NCT6694_CANFD_INFORMATION,
> > +             .sel =3D NCT6694_CANFD_INFORMATION_SEL,
> > +             .len =3D cpu_to_le16(sizeof(*info))
> > +     };
> > +     int ret, can_clk;
> > +
> > +     info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> > +     if (ret)
> > +             return ret;
> > +
> > +     can_clk =3D le32_to_cpu(info->can_clk);
>
> return le32_to_cpu(info->can_clk);
>

Fix it in v11.

> > +
> > +     return can_clk;
> > +}
> > +
> > +static int nct6694_canfd_probe(struct platform_device *pdev)
> > +{
> > +     const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_canfd_priv *priv;
> > +     struct net_device *ndev;
> > +     int ret, irq, can_clk;
> > +
> > +     irq =3D irq_create_mapping(nct6694->domain,
> > +                              NCT6694_IRQ_CAN0 + cell->id);
> > +     if (!irq)
> > +             return irq;
> > +
> > +     ndev =3D alloc_candev(sizeof(struct nct6694_canfd_priv), 1);
> > +     if (!ndev) {
> > +             ret =3D -ENOMEM;
> > +             goto dispose_irq;
> > +     }
> > +
> > +     ndev->irq =3D irq;
> > +     ndev->flags |=3D IFF_ECHO;
> > +     ndev->dev_port =3D cell->id;
> > +     ndev->netdev_ops =3D &nct6694_canfd_netdev_ops;
> > +     ndev->ethtool_ops =3D &nct6694_canfd_ethtool_ops;
> > +
> > +     priv =3D netdev_priv(ndev);
> > +     priv->nct6694 =3D nct6694;
> > +     priv->ndev =3D ndev;
> > +
> > +     can_clk =3D nct6694_canfd_get_clock(priv);
> > +     if (can_clk < 0) {
> > +             ret =3D dev_err_probe(&pdev->dev, can_clk,
> > +                                 "Failed to get clock\n");
> > +             goto free_candev;
> > +     }
> > +
> > +     INIT_WORK(&priv->tx_work, nct6694_canfd_tx_work);
> > +
> > +     priv->can.clock.freq =3D can_clk;
> > +     priv->can.bittiming_const =3D &nct6694_canfd_bittiming_nominal_co=
nst;
> > +     priv->can.data_bittiming_const =3D &nct6694_canfd_bittiming_data_=
const;
> > +     priv->can.do_set_mode =3D nct6694_canfd_set_mode;
> > +     priv->can.do_get_berr_counter =3D nct6694_canfd_get_berr_counter;
> > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> > +             CAN_CTRLMODE_FD_NON_ISO;
> > +
> > +     ret =3D can_set_static_ctrlmode(ndev, CAN_CTRLMODE_FD);
> > +     if (ret)
> > +             goto free_candev;
> > +
> > +     ret =3D can_rx_offload_add_manual(ndev, &priv->offload,
> > +                                     NCT6694_NAPI_WEIGHT);
> > +     if (ret) {
> > +             dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\=
n");
> > +             goto free_candev;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +     SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> > +
> > +     ret =3D register_candev(priv->ndev);
> > +     if (ret)
> > +             goto rx_offload_del;
> > +
> > +     return 0;
> > +
> > +rx_offload_del:
> > +     can_rx_offload_del(&priv->offload);
> > +free_candev:
> > +     free_candev(ndev);
> > +dispose_irq:
> > +     irq_dispose_mapping(irq);
> > +     return ret;
> > +}
> > +
> > +static void nct6694_canfd_remove(struct platform_device *pdev)
> > +{
> > +     struct nct6694_canfd_priv *priv =3D platform_get_drvdata(pdev);
> > +     struct net_device *ndev =3D priv->ndev;
> > +
> > +     unregister_candev(ndev);
> > +     irq_dispose_mapping(ndev->irq);
> > +     can_rx_offload_del(&priv->offload);
> > +     free_candev(ndev);
>
> Make the order inverse to the nct6694_canfd_probe() function.
>

Fix it in v11.


Best regards,
Ming

