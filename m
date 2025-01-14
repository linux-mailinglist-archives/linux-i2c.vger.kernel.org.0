Return-Path: <linux-i2c+bounces-9078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5AA10495
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE481885F18
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 10:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3526322DC32;
	Tue, 14 Jan 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVQiBLdQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056F22F19;
	Tue, 14 Jan 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851615; cv=none; b=LO9SfFaSRWlQCray9W05WJY6PxD3+RQPsu53Bz2GLWY1K/uxxJnfd98ZyFshSgIl40PLt2ee6o+au13OsIVUdOvvS8aHmA89csgsTmrYi0p5H6Led47aqipRy8e9/UtXN3ptPZ+fXStXZ/+v6OdxkGos5itlueturby7ZVnXsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851615; c=relaxed/simple;
	bh=rjMV+L+goG7e6VBb7CfH5F2xhbiQQQXITZA+TJsEAB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4V5zGI48md+aM1aq0vvA5hE3xwyDPmkZCU0UXPw5Cq8HHt8fntDm7EIsDcINYnTtZaMPYLa9+h0pVx2JYzskPsVF4xcbw6JeLp/ksoIt5/Uwl55Erti9CbXbW/mhAGckkK0/HbaUTHgA3ncB4Z+gV5Bo9RPWq7u5bSTXYcSKpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVQiBLdQ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e46ebe19489so7755083276.2;
        Tue, 14 Jan 2025 02:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736851612; x=1737456412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4du5YEVf29pRGLSWaY50G/+K955C6Kw1M/OKwC+b8GM=;
        b=CVQiBLdQQHIS8JkbmLP1bgBDd5gl1PvadiT5cmhPdTNkT/85dAfMiUOoH0GDeJlT+5
         /Ik8N3T4hA+E+mb0DJNy00Q5/UyZFiE7PqITnTmSZf+wr+1mtpaJUPSICmydPlUUY1U9
         00geKOV8UfaikyMade/9NxhL9UiQ2Mo8oBCmWfzenMOP6fSbd/Bwdg5SYhDRlve/dqez
         fM3Og2jUccDKdtnhImUfqBawJg4UJYDkXolsbdj1xtKYRGrYwAKyVFT6Zkq81+Ue4C1l
         SbpspnfIju8cpLeyyLA/4QYEMjy6TNtOEPXkY1ddstfuIJzKdfUR77iuL5MfnlwKMU0k
         OAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851612; x=1737456412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4du5YEVf29pRGLSWaY50G/+K955C6Kw1M/OKwC+b8GM=;
        b=uMNlkztovaHwr5xNUItmm3Q2eJOKku5SRK2VzSaXJJpmzi4MwRrV/MCIIOacea0HvY
         VuEOKGHqXyYVl9H9nz/vtoQ+wJuNmpVPC9/sduu2bLxe2DElybO7So2s9qETslp0rYO1
         gNAmcYTsG4HYhyX22RgRTXvFghA8MXGJNU0k5DXid/gl/tzEJc9n3Kkoq6NMOxF8siCa
         ILNAW0zHLY0XFmEUFrlcKM+dlqb7owdWP3yKpsE0xXsLYgF4TT9PPWx2MGc3lWn76ZIm
         lWt54IGEHDwvmVRW0JekBZQm1BFcs1YUQEidxCJpvZ+cxTxyJxCoW+kpn92ylSinf3lR
         eqDw==
X-Forwarded-Encrypted: i=1; AJvYcCUBJpaIAEMF59QdMcaYFmIApH7A7IBSPn5I3IhtqNH8ZHIYfj5Goztcy0H1qr08SW+6yaxF5aBg3yUp@vger.kernel.org, AJvYcCVDglhc/GB6HCaUsej0WWc2CX4AQW8waLAOdirmdTiTEdFCb8kaOVzUQ1Bh8Vf8FqzG/9tgNZJZSgt2@vger.kernel.org, AJvYcCVINrpYC+H+UCh5DE318+vdaPfubSw0avsk3y4CzGSS5P9L2984sbpAXVcbrpKZ70+jrQ+NFOJPM/vUqKE=@vger.kernel.org, AJvYcCVasdrOqDbuXAIW02amQVhOlLofNJ5F2VQYCCotseYW0fO5I8fVeILZOrwOvCiG6qvFQ8fT4+H/tC7cuWq7@vger.kernel.org, AJvYcCWNh/UyNlRfboNPNuHVNeayJspj12GM3krKfZ6zZZZE5gTgg0e0wpJz3zU3QmiPrtkyfLFIribw5iw=@vger.kernel.org, AJvYcCWsDhdxvWUKL+HpXCGv4XWnsrIotfAajy8qhT9O7SZoJqHKkke7vrVNSBdSyfDSARpOXDDDts9ypydU@vger.kernel.org, AJvYcCX5LLgRF5l3aoBKYdmH9ruVynwSmWgHyOs5zY90le/ZmiTjwwj8uc6ko9SEIksxBqCVUvELG+Uq@vger.kernel.org, AJvYcCXas/dx22RbETfDgrDiJqY76azr5Aoc39S2rsdRRwYjI5jPq9/E+3n1yzja/cYZI7go+9YI6STz/zfOUA==@vger.kernel.org, AJvYcCXkOGdD2/HXpw11oWHTlxLPxpSaAUTSO+QMuE8LTRe3OHsRGT9PEc9MOwaTyNYjGPn6Z/sxvt8cTbe/VaYz+v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhxnLfNnB/eUbPpv4muBJsEp/O+BD/g8Xy1RbEqO1z3ru0qDts
	62s1M0QK0sDJta6yk3DBcqoMnDMK2nX1RVbyJjPXTkE18+Z+24dHZpJWqgTQobHD2ySSIJjiSPb
	p36NRzvWr0XL/s36Uo3KCfkOK6po=
X-Gm-Gg: ASbGncv++VeeMoMO+60HJopzhBsNcszg0VSC4c3eVXn3DOYQyrqwRMnzbS8PPK/eJbx
	k8lIZ72ZTbRy7lVTR/TUiNroX19RGI/+fKMhUedZzXEy3Q6baCRrShRcgo36HMAvIR7ZOIa3F
X-Google-Smtp-Source: AGHT+IEdmGLeYOyRSUVFmPnIYdpnXhkvam4YWGRAPVz0dgXVlkyjCFV0ykP/lQVIS/cIfZizKL4EzfjBPT5lgfX14e0=
X-Received: by 2002:a05:6902:a84:b0:e57:4b07:66c2 with SMTP id
 3f1490d57ef6-e574b076871mr6708426276.38.1736851611527; Tue, 14 Jan 2025
 02:46:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com> <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
In-Reply-To: <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 14 Jan 2025 18:46:40 +0800
X-Gm-Features: AbW1kvagzYOqEv5YC4IV09sOV_gUTnUbNHtHLRFiOVszossazo-YoasJxs9FlY0
Message-ID: <CAOoeyxW=k35-bkeqNmhyZwUxjy=g3irTBS5mbXLxqp1Stx-Zfg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your reply,
I'll add comments to describe these locks in the next patch,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:06=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
...
> > +config CAN_NCT6694
> > +       tristate "Nuvoton NCT6694 Socket CANfd support"
> > +       depends on MFD_NCT6694
>
> Your driver uses the CAN rx offload. You need to select it here.
>
>           select CAN_RX_OFFLOAD
>

Understood! I'll add it in v6.

> > +       help
> > +         If you say yes to this option, support will be included for N=
uvoton
> > +         NCT6694, a USB device to socket CANfd controller.
> > +
> > +         This driver can also be built as a module. If so, the module =
will
> > +         be called nct6694_canfd.
>
> Here, the name is nct6694_canfd...
>
> >  config CAN_PEAK_USB
> >         tristate "PEAK PCAN-USB/USB Pro interfaces for CAN 2.0b/CAN-FD"
> >         help
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
> > index 000000000000..7a15c39021ff
> > --- /dev/null
> > +++ b/drivers/net/can/usb/nct6694_canfd.c
> > @@ -0,0 +1,856 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 Socket CANfd driver based on USB interface.
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
> > +#define DRVNAME "nct6694-can"
>
> ... but here, it is nct6694-can.
>
> Use a consistent name between the module name and the driver name.
>

Okay, Fix it in v6.

> > +/*
> > + * USB command module type for NCT6694 CANfd controller.
> > + * This defines the module type used for communication with the NCT669=
4
> > + * CANfd controller over the USB interface.
> > + */
> > +#define NCT6694_CAN_MOD                        0x05
> > +
> > +/* Command 00h - CAN Setting and Initialization */
> > +#define NCT6694_CAN_SETTING            0x00
> > +#define NCT6694_CAN_SETTING_SEL(idx)   (idx ? 0x01 : 0x00)
>
> What are the possible values for idx? Isn't it only 0 or 1? If so, no
> need for this NCT6694_CAN_SETTING_SEL() macro. Directly assign the
> channel index to the selector field.
>

Okay, Fix it in v6.

> > +#define NCT6694_CAN_SETTING_CTRL1_MON  BIT(0)
> > +#define NCT6694_CAN_SETTING_CTRL1_NISO BIT(1)
> > +#define NCT6694_CAN_SETTING_CTRL1_LBCK BIT(2)
> > +
> > +/* Command 01h - CAN Information */
> > +#define NCT6694_CAN_INFORMATION                0x01
> > +#define NCT6694_CAN_INFORMATION_SEL    0x00
> > +
> > +/* Command 02h - CAN Event */
> > +#define NCT6694_CAN_EVENT              0x02
> > +#define NCT6694_CAN_EVENT_SEL(idx, mask)       \
> > +       ((idx ? 0x80 : 0x00) | ((mask) & 0xFF))
>
> Can idx and mask really overlap? Shouldn't this be:
>
>   #define NCT6694_CAN_EVENT_SEL(idx, mask)  \
>           ((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
>

Sorry, you're right, I'll fix it in v6.

> > +#define NCT6694_CAN_EVENT_ERR          BIT(0)
> > +#define NCT6694_CAN_EVENT_STATUS       BIT(1)
> > +#define NCT6694_CAN_EVENT_TX_EVT       BIT(2)
> > +#define NCT6694_CAN_EVENT_RX_EVT       BIT(3)
> > +#define NCT6694_CAN_EVENT_REC          BIT(4)
> > +#define NCT6694_CAN_EVENT_TEC          BIT(5)
> > +#define NCT6694_CAN_EVENT_MASK         GENMASK(3, 0)
> > +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY  BIT(7)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_DATA_LOST   BIT(5)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_HALF_FULL   BIT(6)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_DATA_IN     BIT(7)  /* Read-clear*/
>
> Some of those macro are not used:
>
>   drivers/net/can/usb/nct6694_canfd.c:52: warning: macro
> "NCT6694_CAN_EVT_RX_HALF_FULL" is not used [-Wunused-macros]
>      52 | #define NCT6694_CAN_EVT_RX_HALF_FULL BIT(6) /* Read-clear */
>         |
>   drivers/net/can/usb/nct6694_canfd.c:43: warning: macro
> "NCT6694_CAN_EVENT_ERR" is not used [-Wunused-macros]
>      43 | #define NCT6694_CAN_EVENT_ERR  BIT(0)
>         |
>   drivers/net/can/usb/nct6694_canfd.c:44: warning: macro
> "NCT6694_CAN_EVENT_STATUS" is not used [-Wunused-macros]
>      44 | #define NCT6694_CAN_EVENT_STATUS BIT(1)
>         |
>   drivers/net/can/usb/nct6694_canfd.c:46: warning: macro
> "NCT6694_CAN_EVENT_RX_EVT" is not used [-Wunused-macros]
>      46 | #define NCT6694_CAN_EVENT_RX_EVT BIT(3)
>         |
>   drivers/net/can/usb/nct6694_canfd.c:45: warning: macro
> "NCT6694_CAN_EVENT_TX_EVT" is not used [-Wunused-macros]
>      45 | #define NCT6694_CAN_EVENT_TX_EVT BIT(2)
>         |
>
> Is this OK?
>

Yes, these macros are replaced by  NCT6694_CAN_EVENT_MASK, I'll drop
them in the next patch.

> > +/* Command 10h - CAN Deliver */
> > +#define NCT6694_CAN_DELIVER            0x10
> > +#define NCT6694_CAN_DELIVER_SEL(buf_cnt)       \
> > +       ((buf_cnt) & 0xFF)
> > +
> > +/* Command 11h - CAN Receive */
> > +#define NCT6694_CAN_RECEIVE            0x11
> > +#define NCT6694_CAN_RECEIVE_SEL(idx, buf_cnt)  \
> > +       ((idx ? 0x80 : 0x00) | ((buf_cnt) & 0xFF))
>
> Can idx and buf_cnt really overlap? Shouldn't this be:
>
>   #define NCT6694_CAN_RECEIVE_SEL(idx, buf_cnt)  \
>           ((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))
>

Fix it in v6.

> > +#define NCT6694_CAN_FRAME_TAG_CAN0     0xC0
> > +#define NCT6694_CAN_FRAME_TAG_CAN1     0xC1
> > +#define NCT6694_CAN_FRAME_FLAG_EFF     BIT(0)
> > +#define NCT6694_CAN_FRAME_FLAG_RTR     BIT(1)
> > +#define NCT6694_CAN_FRAME_FLAG_FD      BIT(2)
> > +#define NCT6694_CAN_FRAME_FLAG_BRS     BIT(3)
> > +#define NCT6694_CAN_FRAME_FLAG_ERR     BIT(4)
> > +
> > +#define NCT6694_NAPI_WEIGHT            32
> > +
> > +enum nct6694_event_err {
> > +       NCT6694_CAN_EVT_ERR_NO_ERROR =3D 0,
> > +       NCT6694_CAN_EVT_ERR_CRC_ERROR,
> > +       NCT6694_CAN_EVT_ERR_STUFF_ERROR,
> > +       NCT6694_CAN_EVT_ERR_ACK_ERROR,
> > +       NCT6694_CAN_EVT_ERR_FORM_ERROR,
> > +       NCT6694_CAN_EVT_ERR_BIT_ERROR,
> > +       NCT6694_CAN_EVT_ERR_TIMEOUT_ERROR,
> > +       NCT6694_CAN_EVT_ERR_UNKNOWN_ERROR,
> > +};
> > +
> > +enum nct6694_event_status {
> > +       NCT6694_CAN_EVT_STS_ERROR_ACTIVE =3D 0,
> > +       NCT6694_CAN_EVT_STS_ERROR_PASSIVE,
> > +       NCT6694_CAN_EVT_STS_BUS_OFF,
> > +       NCT6694_CAN_EVT_STS_WARNING,
> > +};
> > +
> > +struct __packed nct6694_can_setting {
> > +       __le32 nbr;
> > +       __le32 dbr;
> > +       u8 active;
> > +       u8 reserved[3];
> > +       __le16 ctrl1;
> > +       __le16 ctrl2;
> > +       __le32 nbtp;
> > +       __le32 dbtp;
> > +};
> > +
> > +struct __packed nct6694_can_information {
> > +       u8 tx_fifo_cnt;
> > +       u8 rx_fifo_cnt;
> > +       u8 reserved[2];
> > +       __le32 can_clk;
> > +};
> > +
> > +struct __packed nct6694_can_event {
> > +       u8 err;
> > +       u8 status;
> > +       u8 tx_evt;
> > +       u8 rx_evt;
> > +       u8 rec;
> > +       u8 tec;
> > +       u8 reserved[2];
> > +};
> > +
> > +struct __packed nct6694_can_frame {
> > +       u8 tag;
> > +       u8 flag;
> > +       u8 reserved;
> > +       u8 length;
> > +       __le32 id;
> > +       u8 data[64];
>
> Nitpick, use CANFD_MAX_DLEN here:
>
>           u8 data[CANFD_MAX_DLEN];
>

Fix it in v6.

> > +};
> > +
...
> > +static void nct6694_can_rx(struct net_device *ndev, u8 rx_evt)
> > +{
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +       struct nct6694_can_frame *frame =3D &priv->rx->frame;
> > +       struct nct6694_cmd_header cmd_hd =3D {
> > +               .mod =3D NCT6694_CAN_MOD,
> > +               .cmd =3D NCT6694_CAN_RECEIVE,
> > +               .sel =3D NCT6694_CAN_RECEIVE_SEL(priv->can_idx, 1),
> > +               .len =3D cpu_to_le16(sizeof(*frame))
> > +       };
> > +       struct canfd_frame *cfd;
> > +       struct can_frame *cf;
> > +       struct sk_buff *skb;
> > +       int ret;
> > +
> > +       ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
> > +       if (ret)
> > +               return;
> > +
> > +       if (frame->flag & NCT6694_CAN_FRAME_FLAG_FD) {
>
> Reduce scope of variable when possible: move declaration of cfd here:
>
>                 struct canfd_frame *cfd;
>

Okay! Fix it in v6.

> > +               skb =3D alloc_canfd_skb(priv->ndev, &cfd);
> > +               if (!skb)
> > +                       return;
> > +
> > +               cfd->can_id =3D le32_to_cpu(frame->id);
> > +               cfd->len =3D frame->length;
>
> No. I asked you to sanitize the length in this message:
>
>   https://lore.kernel.org/linux-can/8d66cf66-5564-4272-8c3e-51b715c3d785@=
wanadoo.fr/
>
> Never use the length as is.
>

Sorry! I misunderstood your meaning.
I'll Fix it to cfd->len =3D canfd_sanitize_len(frame->length).

> > +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> > +                       cfd->can_id |=3D CAN_EFF_FLAG;
> > +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_BRS)
> > +                       cfd->flags |=3D CANFD_BRS;
> > +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_ERR)
> > +                       cfd->flags |=3D CANFD_ESI;
> > +
> > +               memcpy(cfd->data, frame->data, cfd->len);
> > +       } else {
>
> Reduce scope of variable when possible: move declaration of cf here:
>
>                 struct canfd_frame *cf;
>

Fix it in v6.

> > +               skb =3D alloc_can_skb(priv->ndev, &cf);
> > +               if (!skb)
> > +                       return;
> > +
> > +               cf->can_id =3D le32_to_cpu(frame->id);
> > +               cf->len =3D frame->length;
>
> Ditto, sanitize the length.
>

Fix it in v6.

> > +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> > +                       cf->can_id |=3D CAN_EFF_FLAG;
> > +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
> > +                       cf->can_id |=3D CAN_RTR_FLAG;
> > +
> > +               memcpy(cf->data, frame->data, cf->len);
>
> Only copy can data if the frame is not an RTR frame.
>
>                   if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
>                           cf->can_id |=3D CAN_RTR_FLAG;
>                   else
>                           memcpy(cf->data, frame->data, cf->len);
>
> I already asked you to do this in below comment:
>
>   https://lore.kernel.org/linux-can/a25ea362-142f-4e27-8194-787d9829f607@=
wanadoo.fr/
>

Sorry for forgetting the part, I'll fix it in the next patch.

> > +       }
> > +
> > +       nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
> > +static void nct6694_can_clean(struct net_device *ndev)
> > +{
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +       if (priv->tx_skb || netif_queue_stopped(ndev))
> > +               ndev->stats.tx_errors++;
> > +       dev_kfree_skb(priv->tx_skb);
> > +       priv->tx_skb =3D NULL;
> > +}
> > +
> > +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> > +                                       struct can_berr_counter *bec)
> > +{
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +       struct nct6694_can_event *evt =3D priv->rx->event;
> > +       struct nct6694_cmd_header cmd_hd;
> > +       u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> > +       int ret;
> > +
> > +       guard(mutex)(&priv->lock);
> > +
> > +       cmd_hd =3D (struct nct6694_cmd_header) {
> > +               .mod =3D NCT6694_CAN_MOD,
> > +               .cmd =3D NCT6694_CAN_EVENT,
> > +               .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, mask),
> > +               .len =3D cpu_to_le16(sizeof(priv->rx->event))
> > +       };
> > +
> > +       ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> > +       if (ret < 0)
> > +               return ret;
>
> You are holding the priv->lock mutex before calling
> nct6694_read_msg(). But nct6694_read_msg() then holds the
> nct6694->access_lock mutex. Why do you need a double mutex here? What
> kind of race scenario are you trying to prevent here?
>

I think priv->lock need to be placed here to prevent priv->rx from
being assigned by other functions, and nct6694->access_lock ensures
that the nct6694_read_msg() transaction is completed.
But in this case, cmd_hd does not need to be in priv->lock's scope.

> > +       bec->rxerr =3D evt[priv->can_idx].rec;
> > +       bec->txerr =3D evt[priv->can_idx].tec;
> > +
> > +       return 0;
> > +}
> > +
> > +static void nct6694_can_handle_state_change(struct net_device *ndev,
> > +                                           u8 status)
> > +{
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +       enum can_state new_state =3D priv->can.state;
> > +       enum can_state rx_state, tx_state;
> > +       struct can_berr_counter bec;
> > +       struct can_frame *cf;
> > +       struct sk_buff *skb;
> > +
> > +       nct6694_can_get_berr_counter(ndev, &bec);
> > +       can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state)=
;
>
> Here, you set up tx_state and rx_state...
>
> > +       switch (status) {
> > +       case NCT6694_CAN_EVT_STS_ERROR_ACTIVE:
> > +               new_state =3D CAN_STATE_ERROR_ACTIVE;
> > +               break;
> > +       case NCT6694_CAN_EVT_STS_ERROR_PASSIVE:
> > +               new_state =3D CAN_STATE_ERROR_PASSIVE;
> > +               break;
> > +       case NCT6694_CAN_EVT_STS_BUS_OFF:
> > +               new_state =3D CAN_STATE_BUS_OFF;
> > +               break;
> > +       case NCT6694_CAN_EVT_STS_WARNING:
> > +               new_state =3D CAN_STATE_ERROR_WARNING;
> > +               break;
> > +       default:
> > +               netdev_err(ndev, "Receive unknown CAN status event.\n")=
;
> > +               return;
> > +       }
> > +
> > +       /* state hasn't changed */
> > +       if (new_state =3D=3D priv->can.state)
> > +               return;
> > +
> > +       skb =3D alloc_can_err_skb(ndev, &cf);
> > +
> > +       tx_state =3D bec.txerr >=3D bec.rxerr ? new_state : 0;
> > +       rx_state =3D bec.txerr <=3D bec.rxerr ? new_state : 0;
>
> ... but you never used the values returned by
> can_state_get_by_berr_counter() and just overwrote the tx and rx
> state.
>
> What is the logic here? Why do you need to manually adjust those two
> values? Isn't the logic in can_change_state() sufficient?
>
> > +       can_change_state(ndev, cf, tx_state, rx_state);
> > +
> > +       if (new_state =3D=3D CAN_STATE_BUS_OFF) {
>
> Same for the new_state. The function can_change_state() calculate the
> new state from tx_state and rx_state and save it under
> can_priv->state. But here, you do your own calculation.
>
> Only keep one of the two. If your device already tells you the state,
> then fine! Just use the information from your device and do not use
> can_change_state(). Here, you are doing double work resulting in a
> weird mix.
>

Okay! I will revert nct6694_can_handle_state_change() back to the v3 versio=
n.

> > +               can_bus_off(ndev);
> > +       } else if (skb) {
> > +               cf->can_id |=3D CAN_ERR_CNT;
> > +               cf->data[6] =3D bec.txerr;
> > +               cf->data[7] =3D bec.rxerr;
> > +       }
> > +
> > +       nct6694_can_rx_offload(&priv->offload, skb);
> > +}
> > +
...
> > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > +{
> > +       struct net_device *ndev =3D data;
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +       struct nct6694_can_event *evt =3D priv->rx->event;
> > +       struct nct6694_cmd_header cmd_hd;
> > +       u8 tx_evt, rx_evt, bus_err, can_status;
> > +       u8 mask_sts =3D NCT6694_CAN_EVENT_MASK;
>
> No need for the mask_sts variable. Directly use NCT6694_CAN_EVENT_MASK.
>

Okay! Fix it in v6.

> > +       irqreturn_t handled =3D IRQ_NONE;
> > +       int can_idx =3D priv->can_idx;
> > +       int ret;
> > +
> > +       scoped_guard(mutex, &priv->lock) {
>
> Reduce scope of variable when possible: move the declarations of
> cmd_hd and ret here.
>

Okay! Fix it in v6.

> > +               cmd_hd =3D (struct nct6694_cmd_header) {
> > +                       .mod =3D NCT6694_CAN_MOD,
> > +                       .cmd =3D NCT6694_CAN_EVENT,
> > +                       .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, m=
ask_sts),
> > +                       .len =3D cpu_to_le16(sizeof(priv->rx->event))
> > +               };
> > +
...
> > +static void nct6694_can_tx(struct net_device *ndev)
> > +{
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +       struct nct6694_can_frame *frame =3D &priv->tx->frame;
> > +       struct nct6694_cmd_header cmd_hd =3D {
> > +               .mod =3D NCT6694_CAN_MOD,
> > +               .cmd =3D NCT6694_CAN_DELIVER,
> > +               .sel =3D NCT6694_CAN_DELIVER_SEL(1),
> > +               .len =3D cpu_to_le16(sizeof(*frame))
> > +       };
> > +       struct net_device_stats *stats =3D &ndev->stats;
> > +       struct sk_buff *skb =3D priv->tx_skb;
> > +       struct canfd_frame *cfd;
> > +       struct can_frame *cf;
> > +       u32 txid;
> > +       int err;
> > +
> > +       memset(frame, 0, sizeof(*frame));
> > +
> > +       if (priv->can_idx =3D=3D 0)
> > +               frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN0;
> > +       else
> > +               frame->tag =3D NCT6694_CAN_FRAME_TAG_CAN1;
> > +
> > +       if (can_is_canfd_skb(skb)) {
>
> Reduce scope of variable when possible: move declaration of cfd here:
>
>                 struct canfd_frame *cfd;
>

Okay! Fix it in v6.

> > +               cfd =3D (struct canfd_frame *)priv->tx_skb->data;
> > +
> > +               if (cfd->flags & CANFD_BRS)
> > +                       frame->flag |=3D NCT6694_CAN_FRAME_FLAG_BRS;
> > +
> > +               if (cfd->can_id & CAN_EFF_FLAG) {
> > +                       txid =3D cfd->can_id & CAN_EFF_MASK;
> > +                       frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> > +               } else {
> > +                       txid =3D cfd->can_id & CAN_SFF_MASK;
> > +               }
> > +               frame->flag |=3D NCT6694_CAN_FRAME_FLAG_FD;
> > +               frame->id =3D cpu_to_le32(txid);
> > +               frame->length =3D cfd->len;
> > +
> > +               memcpy(frame->data, cfd->data, cfd->len);
> > +       } else {
>
> Reduce scope of variable when possible: move declaration of cf here:
>
>                 struct canfd_frame *cf;
>

Okay! Fix it in v6.

> > +               cf =3D (struct can_frame *)priv->tx_skb->data;
> > +
> > +               if (cf->can_id & CAN_RTR_FLAG)
> > +                       frame->flag |=3D NCT6694_CAN_FRAME_FLAG_RTR;
> > +
> > +               if (cf->can_id & CAN_EFF_FLAG) {
> > +                       txid =3D cf->can_id & CAN_EFF_MASK;
> > +                       frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> > +               } else {
> > +                       txid =3D cf->can_id & CAN_SFF_MASK;
> > +               }
> > +               frame->id =3D cpu_to_le32(txid);
> > +               frame->length =3D cf->len;
> > +
> > +               memcpy(frame->data, cf->data, cf->len);
>
> Don't copy cf->data if the can frame is a RTR frame.
>

Okay! Fix it in v6.

> > +       }
> > +
> > +       err =3D nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
> > +       if (err) {
> > +               netdev_err(ndev, "%s: Tx FIFO full!\n", __func__);
> > +               can_free_echo_skb(ndev, 0, NULL);
> > +               stats->tx_dropped++;
> > +               stats->tx_errors++;
> > +               netif_wake_queue(ndev);
> > +       }
> > +}
> > +
...
> > +static int nct6694_can_probe(struct platform_device *pdev)
> > +{
> > +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +       struct nct6694_can_priv *priv;
> > +       struct net_device *ndev;
> > +       int ret, irq, can_clk;
> > +
> > +       irq =3D irq_create_mapping(nct6694->domain,
> > +                                NCT6694_IRQ_CAN1 + cell->id);
> > +       if (!irq)
> > +               return irq;
> > +
> > +       ndev =3D alloc_candev(sizeof(struct nct6694_can_priv), 1);
> > +       if (!ndev)
> > +               return -ENOMEM;
> > +
> > +       ndev->irq =3D irq;
> > +       ndev->flags |=3D IFF_ECHO;
> > +       ndev->netdev_ops =3D &nct6694_can_netdev_ops;
> > +       ndev->ethtool_ops =3D &nct6694_can_ethtool_ops;
>
> Your device has two CAN interfaces, right? Do not forget to populate
> netdev->dev_port.
>
>           netdev->dev_port =3D cell->id;
>

Okay! I'll add it in v6.

> > +       priv =3D netdev_priv(ndev);
> > +       priv->nct6694 =3D nct6694;
> > +       priv->ndev =3D ndev;
> > +

Best regards,
Ming

