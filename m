Return-Path: <linux-i2c+bounces-9119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B1A13164
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 03:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA906166355
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 02:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACF68635B;
	Thu, 16 Jan 2025 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RijYDDtd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC024A7EE;
	Thu, 16 Jan 2025 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994547; cv=none; b=bN47g9Vubl617TtCmBOOjFvKX/g5tvz+hNcisKICo+shRxdnGKblVL/A+uI73jyYBUy54/YZQRXuKo+5LMugM7kFAVkmATHNG2VE4CkeJ5Q8WNvFTwr0DlPeQpMjyShOoSaomhO8NBStjlznU5PCWQPwRmY6XPPOB5i7F+MTago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994547; c=relaxed/simple;
	bh=WT0+dydykW/JxtikGPMFnEDS5xnaa0bePUsfbe5etr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K88ksL04s14dV29OgfHfYnblHFN0zopTmKfqKiPodrB0UhBVOZ2KSPR6iUXJ/5GsGIV9VGQ15FV/ijpYkkt2423ZmxI9A0JjLq+r7W1LjGL+FJJtbKDrCNaaLwtBZaNo0BUCVq5P+zoPbZ9A7nxr99i5oTwig3ULqOkgotgMHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RijYDDtd; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e4a6b978283so2845998276.0;
        Wed, 15 Jan 2025 18:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736994544; x=1737599344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GIKsnvbzkRGvM2ntRhtRXwKVW3iyvrkQS53nqfJvuY=;
        b=RijYDDtdvDRukqmIVCl6JLELqYPF3DRNzhipZfe7SSlInJIHZd2UZLCwLkI3CZa58H
         w/CgLG/aGQJKZothmihIQN0WH71cKVO25NdtTGFfmKCuhqy1mA5UzebkIv+1nPqw940g
         xQ666Ut8cWWlSr1VutZZJgY5dKgUJOEEIX4jpi7B+NOIqLMwEyQPhzqHEETnlHa6MhSu
         AvGGJFoG87lGIQlgNrBPdp8blWkSmWzAgkIxgzHQQil2NdhA6SLAwRX+L8jv2RGRJ99G
         bvg/qHNY4CbdpkwB1ObIqyh2BsUt1vpy3RimzqSduXhIiWgjSUySmGegqWvckaKrsOld
         RAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736994544; x=1737599344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GIKsnvbzkRGvM2ntRhtRXwKVW3iyvrkQS53nqfJvuY=;
        b=ojIs2AhGlxxNrCkdrTG3R0TkdtMP0UhU0lMnzxjWEXArTicmV5HhJVGtRkm72+RxuP
         h/zVnvobnPlNI3e03Dk+hvJf65u4cVJgr08od5Dq2nHXse3RQ/wBQHNagdR4LDjAw4sl
         eGUVMGMguAXkRhsbBQwhdytnCAcIjJtQBbuIcbFiua5gi5RxNvJhZpNL7ifMhfVByxKW
         f6REyL1TQ/pBvQXe8fNrdkgV/8PK7LmGnv6eTjCJwvNdRTWeoESG1vNElEke1uNVVHrK
         AJ/tkmSyr/oKq60rPjU19C4Ax4TwDWu+cFiTQqzzi7Diy2O3zxuhHLaidjPeC61oEyS0
         LfcA==
X-Forwarded-Encrypted: i=1; AJvYcCUm3zeEBuWWcS6+LhD1SjbARFgbTmLbq3Ea0gBfquPibRsBDIqC5FiecXKtvUvQ4XbKMS4cw2kpQN2mQv50@vger.kernel.org, AJvYcCUveRYMDMD67uRsq6HQwDOYDAbeCo8zqUvVBF9CmumahFt0eZNWCK97rxDWiSrkL2KtGjvbaGmm/C/E@vger.kernel.org, AJvYcCUwu2aEZlJiWGbdcziFqGmZ5YgFdSLXU8l+QnI5Jx6ZYIvkF/qFDFQm3Kex72e0lDinKR2Ao9gkUYAO@vger.kernel.org, AJvYcCVCEScyr8RK6NTXL+bExrzfzjUZyrU9MOWuKfbu+MZc4kQXtvPDQe85qC50qf1pJ+zeKzD+32iZgZCrpg==@vger.kernel.org, AJvYcCVeqcLodN0hhtoI9MwBtlsGF2d3U+hh6lNRUjUXY2VIIVXtctxhbGK0BZsIoDaRRBs35QOF+8D9niw=@vger.kernel.org, AJvYcCWJNURevdnipstKYHrITOi4SfdB7MnFoPyv/+24PyExgwykZjTd3/3K+Fq/PoN9oUs6OOgyRaP7@vger.kernel.org, AJvYcCWMiJazvvvszXHVyP1ZTh8chUAhaZx5TfYozgnWq1YjQpNhXnWO0xtNlUVfmocifYZrydsKip0K+Ubh@vger.kernel.org, AJvYcCWhKEX/7q/PXKg4WWT7Rn9u3APXV5fE+iIAdsrYYsfO31J5zX1rbaZARDod/lpfFsWwGjaMEZ0236fewiq5QiQ=@vger.kernel.org, AJvYcCWruuhHOAoy4THXEZFVhavC8+YftqybT45KapfkVmWKUvb1DPq/n/ap4qMCaeRwhTdNAPB7rVPgyb3YFpo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3TZTrQ9shSvCOzjYBdbSPZ/sURyk5bwYUNe/c1KKsfOBOwjvL
	nWM5iEqVdWW7x/ZwvjgN5wPx2qPQyM6VUCj/qpWJYAy9GeXLWV8bWAPIkMxPPInBiHL14Q6gC0e
	B4bYOInjgDwsBv45YikUEFn+GEU4=
X-Gm-Gg: ASbGnctVYgkM6YxI7ELE3PMpKOYVqz2Y9VYHzEZXTNF6l0/POVwQMHvRRxD3kLft2zQ
	45mwiI9gZrQR5niV3VOwifuXngkkeIKBzJLwNvw==
X-Google-Smtp-Source: AGHT+IEXEI4dBQcymfAC4IaxFxxb5qCy4f8kvxuST9nbCahb3NMNK4TdbJW3B8YiXQ7p3u5hvM7jseKvSXKy/pVV0ZI=
X-Received: by 2002:a05:6902:260c:b0:e38:b399:590b with SMTP id
 3f1490d57ef6-e578a1222dcmr4578245276.2.1736994543998; Wed, 15 Jan 2025
 18:29:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-2-a0282524688@gmail.com> <20250115160401.GL6763@google.com>
In-Reply-To: <20250115160401.GL6763@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 16 Jan 2025 10:28:52 +0800
X-Gm-Features: AbW1kvbGm6LzPwIFioqWJ7E3m4sciO9tqukVeoKIPgzARRTQGynoAHmnM5M95sI
Message-ID: <CAOoeyxWUCOcxqovKP0cnnNOtdSc-8JMe0g9aE5W0JMEcTsG2pQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lee,

Thank you for your comments,

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=8816=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:04=E5=AF=AB=E9=81=93=EF=BC=9A
...
> > +config MFD_NCT6694
> > +     tristate "Nuvoton NCT6694 support"
> > +     select MFD_CORE
> > +     depends on USB
> > +     help
> > +       This adds support for Nuvoton USB device NCT6694 sharing periph=
erals
>
> Missing full stop.
>
> > +       This includes the USB device driver and core APIs.
> > +       Additional drivers must be enabled in order to use the function=
ality
>
> New sentences do not have to be on new lines.
>
> > +       of the device.
>
> Please explain what this functionality is.
>

Okay! I will fix these in the next patch.

> > +
> >  config MFD_OCELOT
> >       tristate "Microsemi Ocelot External Control Support"
> >       depends on SPI_MASTER
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index e057d6d6faef..3c902d3704dc 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -121,6 +121,8 @@ obj-$(CONFIG_MFD_MC13XXX) +=3D mc13xxx-core.o
> >  obj-$(CONFIG_MFD_MC13XXX_SPI)        +=3D mc13xxx-spi.o
> >  obj-$(CONFIG_MFD_MC13XXX_I2C)        +=3D mc13xxx-i2c.o
> >
> > +obj-$(CONFIG_MFD_NCT6694)    +=3D nct6694.o
> > +
> >  obj-$(CONFIG_MFD_CORE)               +=3D mfd-core.o
> >
> >  ocelot-soc-objs                      :=3D ocelot-core.o ocelot-spi.o
> > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > new file mode 100644
> > index 000000000000..294b6b7a902e
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694.c
> > @@ -0,0 +1,388 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 MFD driver based on USB interface.
>
> No such thing as an MFD driver.  What is this device?
>

Fix it in the v6.

> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb.h>
> > +
> > +#define MFD_DEV_SIMPLE(_name)                                \
> > +{                                                    \
> > +     .name =3D NCT6694_DEV_##_name,                    \
>
> Device names are usually lower case.
>
> > +}                                                    \
>
> MFD_CELL_NAME()
>

Fix it in the v6.

> > +#define MFD_DEV_WITH_ID(_name, _id)                  \
> > +{                                                    \
> > +     .name =3D NCT6694_DEV_##_name,                    \
> > +     .id =3D _id,                                      \
> > +}
>
> MFD_CELL_BASIC()
>
> Or add a new one to include/linux/mfd/core.h.
>

Fix it in the v6.

> > +/* MFD device resources */
>
> This comment is superfluous.
>

Drop it in the v6.

> > +static const struct mfd_cell nct6694_dev[] =3D {
> > +     MFD_DEV_WITH_ID(GPIO, 0x0),
>
> Why doesn't PLATFORM_DEVID_AUTO work for you?
>

I need to manage these IDs to ensure that child devices can be
properly utilized within their respective modules.

> > +     MFD_DEV_WITH_ID(GPIO, 0x1),
> > +     MFD_DEV_WITH_ID(GPIO, 0x2),
> > +     MFD_DEV_WITH_ID(GPIO, 0x3),
> > +     MFD_DEV_WITH_ID(GPIO, 0x4),
> > +     MFD_DEV_WITH_ID(GPIO, 0x5),
> > +     MFD_DEV_WITH_ID(GPIO, 0x6),
> > +     MFD_DEV_WITH_ID(GPIO, 0x7),
> > +     MFD_DEV_WITH_ID(GPIO, 0x8),
> > +     MFD_DEV_WITH_ID(GPIO, 0x9),
> > +     MFD_DEV_WITH_ID(GPIO, 0xA),
> > +     MFD_DEV_WITH_ID(GPIO, 0xB),
> > +     MFD_DEV_WITH_ID(GPIO, 0xC),
> > +     MFD_DEV_WITH_ID(GPIO, 0xD),
> > +     MFD_DEV_WITH_ID(GPIO, 0xE),
> > +     MFD_DEV_WITH_ID(GPIO, 0xF),
> > +
> > +     MFD_DEV_WITH_ID(I2C, 0x0),
> > +     MFD_DEV_WITH_ID(I2C, 0x1),
> > +     MFD_DEV_WITH_ID(I2C, 0x2),
> > +     MFD_DEV_WITH_ID(I2C, 0x3),
> > +     MFD_DEV_WITH_ID(I2C, 0x4),
> > +     MFD_DEV_WITH_ID(I2C, 0x5),
> > +
> > +     MFD_DEV_WITH_ID(CAN, 0x0),
> > +     MFD_DEV_WITH_ID(CAN, 0x1),
> > +
> > +     MFD_DEV_WITH_ID(WDT, 0x0),
> > +     MFD_DEV_WITH_ID(WDT, 0x1),
> > +
> > +     MFD_DEV_SIMPLE(HWMON),
> > +     MFD_DEV_SIMPLE(RTC),
> > +};
> > +
> > +static int nct6694_response_err_handling(struct nct6694 *nct6694,
> > +                                      unsigned char err_status)
> > +{
> > +     struct device *dev =3D &nct6694->udev->dev;
> > +
> > +     switch (err_status) {
> > +     case NCT6694_NO_ERROR:
> > +             return err_status;
> > +     case NCT6694_NOT_SUPPORT_ERROR:
> > +             dev_dbg(dev, "%s: Command is not supported!\n", __func__)=
;
>
> These should be dev_warns().
>
> __func__ shouldn't be used in production code.
>
> Users don't care about functions.
>

Fix it in the v6.

> > +             break;
> > +     case NCT6694_NO_RESPONSE_ERROR:
> > +             dev_dbg(dev, "%s: Command received no response!\n", __fun=
c__);
> > +             break;
> > +     case NCT6694_TIMEOUT_ERROR:
> > +             dev_dbg(dev, "%s: Command timed out!\n", __func__);
> > +             break;
> > +     case NCT6694_PENDING:
> > +             dev_dbg(dev, "%s: Command is pending!\n", __func__);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return -EIO;
> > +}
> > +
> > +int nct6694_read_msg(struct nct6694 *nct6694,
> > +                  struct nct6694_cmd_header *cmd_hd,
> > +                  void *buf)
> > +{
> > +     union nct6694_usb_msg *msg =3D nct6694->usb_msg;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
> > +
> > +     /* Send command packet to USB device */
> > +     memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> > +     msg->cmd_header.hctrl =3D NCT6694_HCTRL_GET;
> > +
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        &msg->cmd_header, sizeof(*msg), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        &msg->response_header, sizeof(*msg), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive data packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        buf, le16_to_cpu(cmd_hd->len), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (rx_len !=3D le16_to_cpu(cmd_hd->len)) {
> > +             dev_dbg(&nct6694->udev->dev, "%s: Received length is not =
match!\n",
>
> "does not match <something>"
>

Fix it in the v6.

> > +                     __func__);
>
> This should be dev_err().
>

Fix it in the v6.

> > +             return -EIO;
> > +     }
> > +
> > +     return nct6694_response_err_handling(nct6694, msg->response_heade=
r.sts);
> > +}
> > +EXPORT_SYMBOL(nct6694_read_msg);
> > +
> > +int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_head=
er *cmd_hd,
> > +                   void *buf)
> > +{
> > +     union nct6694_usb_msg *msg =3D nct6694->usb_msg;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
> > +
> > +     /* Send command packet to USB device */
> > +     memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> > +     msg->cmd_header.hctrl =3D NCT6694_HCTRL_SET;
> > +
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        &msg->cmd_header, sizeof(*msg), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Send data packet to USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        buf, le16_to_cpu(cmd_hd->len), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        &msg->response_header, sizeof(*msg), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive data packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        buf, le16_to_cpu(cmd_hd->len), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (rx_len !=3D le16_to_cpu(cmd_hd->len)) {
> > +             dev_dbg(&nct6694->udev->dev, "%s: Sent length is not matc=
h!\n",
> > +                     __func__);
>
> This should be dev_err().
>

Fix it in the v6.

> > +             return -EIO;
> > +     }
> > +
> > +     return nct6694_response_err_handling(nct6694, msg->response_heade=
r.sts);
> > +}
> > +EXPORT_SYMBOL(nct6694_write_msg);
> > +
> > +static void usb_int_callback(struct urb *urb)
> > +{
> > +     struct nct6694 *nct6694 =3D urb->context;
> > +     struct device *dev =3D &nct6694->udev->dev;
> > +     unsigned int *int_status =3D urb->transfer_buffer;
> > +     int ret;
> > +
> > +     switch (urb->status) {
> > +     case 0:
> > +             break;
> > +     case -ECONNRESET:
> > +     case -ENOENT:
> > +     case -ESHUTDOWN:
> > +             return;
> > +     default:
> > +             goto resubmit;
> > +     }
> > +
> > +     while (*int_status) {
> > +             int irq =3D __ffs(*int_status);
> > +
> > +             generic_handle_irq_safe(irq_find_mapping(nct6694->domain,=
 irq));
> > +             *int_status &=3D ~BIT(irq);
> > +     }
> > +
> > +resubmit:
> > +     ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> > +     if (ret)
> > +             dev_dbg(dev, "%s: Failed to resubmit urb, status %pe",
> > +                     __func__, ERR_PTR(ret));
> > +}
> > +
> > +static void nct6694_irq_lock(struct irq_data *data)
> > +{
> > +     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +
> > +     mutex_lock(&nct6694->irq_lock);
> > +}
> > +
> > +static void nct6694_irq_sync_unlock(struct irq_data *data)
> > +{
> > +     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +
> > +     mutex_unlock(&nct6694->irq_lock);
> > +}
> > +
> > +static void nct6694_irq_enable(struct irq_data *data)
> > +{
> > +     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> > +
> > +     nct6694->irq_enable |=3D BIT(hwirq);
>
> Changing a bit mask doesn't actually {en,dis}able an IRQ, right?
>

Yes, it's only used to record irq.

> > +}
> > +
> > +static void nct6694_irq_disable(struct irq_data *data)
> > +{
> > +     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> > +
> > +     nct6694->irq_enable &=3D ~BIT(hwirq);
> > +}
> > +
> > +static struct irq_chip nct6694_irq_chip =3D {
> > +     .name =3D "nct6694-irq",
> > +     .flags =3D IRQCHIP_SKIP_SET_WAKE,
> > +     .irq_bus_lock =3D nct6694_irq_lock,
> > +     .irq_bus_sync_unlock =3D nct6694_irq_sync_unlock,
> > +     .irq_enable =3D nct6694_irq_enable,
> > +     .irq_disable =3D nct6694_irq_disable,
> > +};
> > +
> > +static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int i=
rq,
> > +                               irq_hw_number_t hw)
> > +{
> > +     struct nct6694 *nct6694 =3D d->host_data;
> > +
> > +     irq_set_chip_data(irq, nct6694);
> > +     irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_ir=
q);
> > +
> > +     return 0;
> > +}
> > +
> > +static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned in=
t irq)
> > +{
> > +     irq_set_chip_and_handler(irq, NULL, NULL);
> > +     irq_set_chip_data(irq, NULL);
> > +}
> > +
> > +static const struct irq_domain_ops nct6694_irq_domain_ops =3D {
> > +     .map    =3D nct6694_irq_domain_map,
> > +     .unmap  =3D nct6694_irq_domain_unmap,
> > +};
> > +
> > +static int nct6694_usb_probe(struct usb_interface *iface,
> > +                          const struct usb_device_id *id)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct usb_endpoint_descriptor *int_endpoint;
> > +     struct usb_host_interface *interface;
> > +     struct device *dev =3D &udev->dev;
> > +     struct nct6694 *nct6694;
> > +     int pipe, maxp;
> > +     int ret;
> > +
> > +     interface =3D iface->cur_altsetting;
>
> Initialise this during allocation.
>

Should these be moved before usb_fill_int_urb()?

> > +     int_endpoint =3D &interface->endpoint[0].desc;
> > +     if (!usb_endpoint_is_int_in(int_endpoint))
> > +             return -ENODEV;
> > +
> > +     nct6694 =3D devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> > +     if (!nct6694)
> > +             return -ENOMEM;
> > +
> > +     pipe =3D usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> > +     maxp =3D usb_maxpacket(udev, pipe);
> > +
> > +     nct6694->usb_msg =3D devm_kzalloc(dev, sizeof(union nct6694_usb_m=
sg),
> > +                                     GFP_KERNEL);
>
> Unwrap this - you can use up to 100-chars.
>

Fix it in the v6.

> > +     if (!nct6694->usb_msg)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_buffer =3D devm_kzalloc(dev, maxp, GFP_KERNEL);
> > +     if (!nct6694->int_buffer)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!nct6694->int_in_urb)
> > +             return -ENOMEM;
> > +
> > +     nct6694->domain =3D irq_domain_add_simple(NULL, NCT6694_NR_IRQS, =
0,
> > +                                             &nct6694_irq_domain_ops,
> > +                                             nct6694);
> > +     if (!nct6694->domain) {
> > +             ret =3D -ENODEV;
> > +             goto err_urb;
> > +     }
> > +
> > +     nct6694->udev =3D udev;
> > +     nct6694->timeout =3D NCT6694_URB_TIMEOUT; /* Wait until urb compl=
ete */
>
> "URB completes"?
>

Fix it in the v6.

> > +
> > +     devm_mutex_init(dev, &nct6694->access_lock);
> > +     devm_mutex_init(dev, &nct6694->irq_lock);
> > +
> > +     usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> > +                      nct6694->int_buffer, maxp, usb_int_callback,
> > +                      nct6694, int_endpoint->bInterval);
> > +     ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> > +     if (ret)
> > +             goto err_urb;
> > +
> > +     dev_set_drvdata(dev, nct6694);
> > +     usb_set_intfdata(iface, nct6694);
>
> These two do the same thing.  You don't need both.
>

Fix it in the v6.

> > +     ret =3D mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6=
694_dev));
> > +     if (ret)
> > +             goto err_mfd;
> > +
> > +     return 0;
> > +
> > +err_mfd:
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +err_urb:
> > +     usb_free_urb(nct6694->int_in_urb);
> > +     return ret;
> > +}
> > +
> > +static void nct6694_usb_disconnect(struct usb_interface *iface)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
> > +
> > +     mfd_remove_devices(&udev->dev);
>
> Does devm_* work here?
>

No, or do you think mfd_add_hotplug_devices() should be replaced with
devm_mfd_add_devices()?

> > +     usb_kill_urb(nct6694->int_in_urb);
> > +     usb_free_urb(nct6694->int_in_urb);
> > +}
> > +
> > +static const struct usb_device_id nct6694_ids[] =3D {
> > +     { USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
> > +                                     NCT6694_PRODUCT_ID,
> > +                                     0xFF, 0x00, 0x00)},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> > +
> > +static struct usb_driver nct6694_usb_driver =3D {
> > +     .name   =3D "nct6694",
> > +     .id_table =3D nct6694_ids,
> > +     .probe =3D nct6694_usb_probe,
> > +     .disconnect =3D nct6694_usb_disconnect,
> > +};
> > +
> > +module_usb_driver(nct6694_usb_driver);
> > +
> > +MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
>
> Remove all references to MFD.
>

Fix it in the v6.

> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> > new file mode 100644
> > index 000000000000..67ca835589ad
> > --- /dev/null
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -0,0 +1,109 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Nuvoton NCT6694 USB transaction and data structure.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#ifndef __MFD_NCT6694_H
> > +#define __MFD_NCT6694_H
> > +
> > +#define NCT6694_DEV_GPIO     "nct6694-gpio"
> > +#define NCT6694_DEV_I2C              "nct6694-i2c"
> > +#define NCT6694_DEV_CAN              "nct6694-can"
> > +#define NCT6694_DEV_WDT              "nct6694-wdt"
> > +#define NCT6694_DEV_HWMON    "nct6694-hwmon"
> > +#define NCT6694_DEV_RTC              "nct6694-rtc"
>
> Use raw strings in place please.
>

Fix it in the v6.

> > +#define NCT6694_VENDOR_ID    0x0416
> > +#define NCT6694_PRODUCT_ID   0x200B
> > +#define NCT6694_INT_IN_EP    0x81
> > +#define NCT6694_BULK_IN_EP   0x02
> > +#define NCT6694_BULK_OUT_EP  0x03
> > +
> > +#define NCT6694_HCTRL_SET    0x40
> > +#define NCT6694_HCTRL_GET    0x80
> > +
> > +#define NCT6694_URB_TIMEOUT  1000
> > +
> > +enum nct6694_irq_id {
>
> These are never used.
>

Some of these numbers ared used by child devices to map the irq_domain.
(e.g. NCT6694_IRQ_CAN1, NCT6694_IRQ_RTC)

> > +     NCT6694_IRQ_GPIO0 =3D 0,
> > +     NCT6694_IRQ_GPIO1,
> > +     NCT6694_IRQ_GPIO2,
> > +     NCT6694_IRQ_GPIO3,
> > +     NCT6694_IRQ_GPIO4,
> > +     NCT6694_IRQ_GPIO5,
> > +     NCT6694_IRQ_GPIO6,
> > +     NCT6694_IRQ_GPIO7,
> > +     NCT6694_IRQ_GPIO8,
> > +     NCT6694_IRQ_GPIO9,
> > +     NCT6694_IRQ_GPIOA,
> > +     NCT6694_IRQ_GPIOB,
> > +     NCT6694_IRQ_GPIOC,
> > +     NCT6694_IRQ_GPIOD,
> > +     NCT6694_IRQ_GPIOE,
> > +     NCT6694_IRQ_GPIOF,
> > +     NCT6694_IRQ_CAN1,
> > +     NCT6694_IRQ_CAN2,
> > +     NCT6694_IRQ_RTC,
> > +     NCT6694_NR_IRQS,
> > +};
> > +
> > +enum nct6694_response_err_status {
> > +     NCT6694_NO_ERROR =3D 0,
> > +     NCT6694_FORMAT_ERROR,
> > +     NCT6694_RESERVED1,
> > +     NCT6694_RESERVED2,
> > +     NCT6694_NOT_SUPPORT_ERROR,
> > +     NCT6694_NO_RESPONSE_ERROR,
> > +     NCT6694_TIMEOUT_ERROR,
> > +     NCT6694_PENDING,
> > +};
> > +
> > +struct __packed nct6694_cmd_header {
> > +     u8 rsv1;
> > +     u8 mod;
> > +     union __packed {
> > +             __le16 offset;
> > +             struct __packed {
> > +                     u8 cmd;
> > +                     u8 sel;
> > +             };
> > +     };
> > +     u8 hctrl;
> > +     u8 rsv2;
> > +     __le16 len;
> > +};
> > +
> > +struct __packed nct6694_response_header {
> > +     u8 sequence_id;
> > +     u8 sts;
> > +     u8 reserved[4];
> > +     __le16 len;
> > +};
> > +
> > +union __packed nct6694_usb_msg {
> > +     struct nct6694_cmd_header cmd_header;
> > +     struct nct6694_response_header response_header;
> > +};
> > +
> > +struct nct6694 {
>
> Do all of these values need to be stored?
>

I think that's right.

> > +     struct usb_device *udev;
> > +     struct urb *int_in_urb;
> > +     struct irq_domain *domain;
> > +     struct mutex access_lock;
> > +     struct mutex irq_lock;
> > +     union nct6694_usb_msg *usb_msg;
> > +     unsigned char *int_buffer;
> > +     unsigned int irq_enable;
> > +     /* time in msec to wait for the urb to the complete */
>
> "Time"  "URB"

Fix it in the v6.

> > +     long timeout;
> > +};
> > +
> > +int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_heade=
r *cmd_hd,
> > +                  void *buf);
> > +
> > +int nct6694_write_msg(struct nct6694 *nct6694, struct nct6694_cmd_head=
er *cmd_hd,
> > +                   void *buf);
> > +
> > +#endif
> > --
> > 2.34.1
> >
>

Best regards,
Ming

