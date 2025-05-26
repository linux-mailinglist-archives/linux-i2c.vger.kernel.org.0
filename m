Return-Path: <linux-i2c+bounces-11134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B83AC3851
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 05:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA094171663
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 03:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A07519D08F;
	Mon, 26 May 2025 03:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMYCWkrM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75C7E110;
	Mon, 26 May 2025 03:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748231800; cv=none; b=gv3fq4VMuBjLVRDSkAA0ykX6WV4uIMBffJcDxwGKboC+t/kLLmbN8hc3QgDbjFhX1JBJzQBAZVwIc3I59mIfvymOqgbCSCN+kyzwiAXBH5m407LrqrdxHD4CTPZwmCC80hpJ4JE9C+4pEnNDdZ4cfvfuG1yxyukzKaFIJOP6rcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748231800; c=relaxed/simple;
	bh=DZrlE/bv8rOS6qOE2CpBwzOco93+rwVtR9PKQ5hujjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPUesOuYk1Vlf00PfH4t1NSpBQrPtwi29YJcvhzATnr0tSCvCML0AFIaLaPqq+MZnoT2lrLMF6RlOXGXgwGVWfXlwx52L1LubDF5Aji4gY8vfxlhpDyVPzfb/s9z6vQ1aaMpy9oGMTl4tE+e5vtugsMyDOLnt7cUrWB2d0Qu8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMYCWkrM; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7d90078caeso1500625276.3;
        Sun, 25 May 2025 20:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748231797; x=1748836597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcXECQBhnFA3Mb5kPluHe4DGBg2LPiSyVzF0Ca7K9Ec=;
        b=RMYCWkrM7R5ZrxWBG66m2SrHqAxK8QdeMeYRd4WEyvsjzp192AetjMcCHEB1P0lAvT
         xZwrCW64Xll5ua7bxzGE0YQmOZOngVJBOpm8ujjJ8tqZ9Y5wF4b31r2uhBmYGsfUbsXN
         x8mbrHsdVKAJr9SzGR+hTYDrE6vyLFt29VNq9CL+u21ule1TDaC3RushkNHzVFuJpGjE
         w2arUYX/F9IKYSQUDwc3IGatHVS0qTgUwVabeqFt/74vrS2TAup1OQ8FfCFE8y/qn4fs
         MRiSV1XRU26G4g6qjNo08w5HUQ95o3oaSzYkDnYCooCNwyuW0x0soiyjd3brKKvM+i/+
         DGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748231797; x=1748836597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcXECQBhnFA3Mb5kPluHe4DGBg2LPiSyVzF0Ca7K9Ec=;
        b=Q82qQP9X2jvo436tXtVbrLQghcRZ/eeuwk7eyQHpdCyg4I6XSOTmAlXjPaifNGe0mt
         e47nfZUJUXeclDw6MvlT/KUGr+iBci6l7t9Y9DIEpB0s/Ik71JLGcDJK1wgKHhHCt1ZH
         F0mV2Zv7IMoQkIno/40hDgJwLP/HJsBa3X2T1Xag19pOI3GGQDDvnsN7+yDsvwwrQRna
         RMRKXn3ectgdr7yts6m3E0wCzNnsNb/Id0dC2dBJw+eskv6SrOcr6/4YbSsFvzV/fMdt
         mIfGQtDiBrKimV9DaOgyTP4dbcaDLGsyZo37W12CE53jEOFT0EkMJqP7abXCcz1C+2SC
         4aSw==
X-Forwarded-Encrypted: i=1; AJvYcCU1McOvQl2oDEfsXYMDyGiDWo96bdn9wr+Q5sEOJAH56K9PnfOaWWSV0vsqDWwJP6kZ3oqLPmu0TjKX@vger.kernel.org, AJvYcCUuQMtfJvfc0AXw3Cm/lHO8ZJdiGP1YRIWbrDGxKi4gLSUV80NGjYOyAhX7MIHp0MeehmFv9N9mRQkiibG2uTo=@vger.kernel.org, AJvYcCVUUgttKaEUQovKA1kkAA59QoRyqNzjs3223JIO9GmWtLOGBPUiAdOdMkrBCUiPN8n//hmH1ZzhPVFD@vger.kernel.org, AJvYcCW4rbtYVd1Z9UGzFdMk85HpGKieNQcCJqjHiQ5aKFugLBNvDF2xrttyLV/8jVNrcA8728Ei4TSDBI8b78o=@vger.kernel.org, AJvYcCX/HK4zVuPf/gZUc4znx9MfmZSv3hZe8L1+e3He4lVGJdhR4H2UTa8bvVN17uKwNfLgDAVS+09W@vger.kernel.org, AJvYcCXQcCJgQRHyol/gNapEvTA0q60GXI0oxMIHPiceSmcZM0f+Q7ahnkU9R9xQ4Z0ptA4ADrb2maKJOvJ7IA==@vger.kernel.org, AJvYcCXSvHIk15Uza9iUxPQBHw8NEpFNtwDNsyPhAwDOwnEYes1Abf+7y6bHdlbK+dZSCrmJSVwA6zEo6sRL6jMv@vger.kernel.org, AJvYcCXhnVtlIiIctsi8XeKiqK32W5eOVExi72vDOaZshyLZqQycowx3lAyPEz45Y/ayUBNhYyYpWO+RwqJo@vger.kernel.org, AJvYcCXtUaZ2Ie53JDe2qFePFld0g9KMCmzIdzqhSeo0O6SlVmjEVUu06SeEXrOiaZG8W7IZM0dkDEG1GzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlPxpDYS8vZkpMVKiPN7pwvPTWrJrDbvVR/xRmf4x7f3eJXyVH
	p6zrWc3lRG+uafbiMSi+W5JxavbDrG+iJ8sMQIV0oG7fcx/HaFskJVoGz8PkPHmbcRhq6dwFFBM
	28lk+T8XWsImrd762sAYDgrrp62jL8xM=
X-Gm-Gg: ASbGncu+SVlQhDdWLn+itM1616pZEAt3AUXl3DatBGlLpVKcU96DZEUlXxscdiIENsG
	FgPnPbHYKUITUCsbSdxMKbyjEzF/6I/h+6KPLfQK22g6JoS67S57Klzs/pe0UA+GzLUlym9QCaq
	m7Bro6X4QPXgg5mNUzE+8wIhYEkeAu5IxQ3dT/+/jwTZjNOzrslcIBy/96xfOuwJC/u0c=
X-Google-Smtp-Source: AGHT+IHBOM1OanC7PctOKlKIA/qqdT+KTdJ1sIRiHPRM93YrlR6/SshGx6q+jmHoL85oR/ljjBwIGDPwYdyHzYtdif4=
X-Received: by 2002:a05:6902:1543:b0:e6d:da84:e901 with SMTP id
 3f1490d57ef6-e7d919f01c5mr8035278276.27.1748231797046; Sun, 25 May 2025
 20:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520020355.3885597-1-tmyu0@nuvoton.com> <20250520020355.3885597-2-tmyu0@nuvoton.com>
 <20250523090207.GD1378991@google.com>
In-Reply-To: <20250523090207.GD1378991@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 26 May 2025 11:56:25 +0800
X-Gm-Features: AX0GCFuMuPJii5QWGzS547_08e9jROJWo5JYbgwGTIEUBA702NbvTfv_wsjtEQ0
Message-ID: <CAOoeyxW-4ChnrgeUT-8Tfcx2=MkehcM6hUtztwrb7128iC95_Q@mail.gmail.com>
Subject: Re: [PATCH v11 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
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

Dear Lee,

Thank you for reviewing.
I will fix the code which you mentioned.

Additionally, I will revert the mfd_cell changes to match version 10. (i.e.=
,
static const struct mfd_cell nct6694_dev[] =3D {
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
    MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
    ...
}; ), since I found that using devm_mfd_add_devices() with id field
set to 0 meets my needs. This allows me to use pdev->id in the
sub-drivers.


Best regards,
Ming

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B45=E6=9C=8823=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 20 May 2025, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <tmyu0@nuvoton.com>
> >
> > The Nuvoton NCT6694 provides an USB interface to the host to
> > access its features.
> >
> > Sub-devices can use the USB functions nct6694_read_msg() and
> > nct6694_write_msg() to issue a command. They can also request
> > interrupt that will be called when the USB device receives its
> > interrupt pipe.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >
> > Changes since version 10:
> > - Add change log for the patch
> > - Fix mfd_cell to MFD_CELL_NAME()
> > - Remove unnecessary blank line
> >
> > Changes since version 9:
> > - Add KernelDoc to exported functions
> >
> > Changes since version 8:
> > - Modify the signed-off-by with my work address
> > - Rename all MFD cell names to "nct6694-xxx"
> > - Fix some comments in nct6694.c and in nct6694.h
> >
> > Changes since version 7:
> > - Add error handling for devm_mutex_init()
> >
> > Changes since version 6:
> >
> > Changes since version 5:
> > - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> > - Drop unnecessary macros
> >
> > Changes since version 4:
> > - Modify arguments in read/write function to a pointer to cmd_header
> >
> > Changes since version 3:
> > - Modify array buffer to structure
> > - Fix defines and comments
> > - Add header <linux/bits.h> and use BIT macro
> > - Modify mutex_init() to devm_mutex_init()
> >
> > Changes since version 2:
> >
> > Changes since version 1:
> > - Implement IRQ domain to handle IRQ demux
> > - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API
> > - Add command structure
> > - Fix USB functions
> > - Sort each driver's header files alphabetically
> >
> >  MAINTAINERS                 |   6 +
> >  drivers/mfd/Kconfig         |  15 ++
> >  drivers/mfd/Makefile        |   2 +
> >  drivers/mfd/nct6694.c       | 387 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/nct6694.h |  98 +++++++++
> >  5 files changed, 508 insertions(+)
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 include/linux/mfd/nct6694.h
>
> [...]
>
> I was just going to fix this up for you when I applied the set, but
> seeing as it looks like you have to re-submit anyway ...
>
> > +static const struct usb_device_id nct6694_ids[] =3D {
> > +     { USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUC=
T_ID, 0xFF, 0x00, 0x00)},
>
> You need a space before the '}'.
>
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> > +
> > +static struct usb_driver nct6694_usb_driver =3D {
> > +     .name           =3D "nct6694",
> > +     .id_table       =3D nct6694_ids,
> > +     .probe          =3D nct6694_usb_probe,
> > +     .disconnect     =3D nct6694_usb_disconnect,
> > +};
> > +module_usb_driver(nct6694_usb_driver);
> > +
> > +MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> > new file mode 100644
> > index 000000000000..5e172609be3f
> > --- /dev/null
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2025 Nuvoton Technology Corp.
> > + *
> > + * Nuvoton NCT6694 USB transaction and data structure.
> > + */
> > +
> > +#ifndef __MFD_NCT6694_H
> > +#define __MFD_NCT6694_H
> > +
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
> > +     NCT6694_IRQ_CAN0,
> > +     NCT6694_IRQ_CAN1,
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
> > +     struct device *dev;
> > +     struct irq_domain *domain;
> > +     struct mutex access_lock;
> > +     struct mutex irq_lock;
> > +     struct urb *int_in_urb;
> > +     struct usb_device *udev;
> > +     union nct6694_usb_msg *usb_msg;
> > +     unsigned char *int_buffer;
> > +     unsigned int irq_enable;
> > +};
> > +
> > +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd=
_header *cmd_hd, void *buf);
> > +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cm=
d_header *cmd_hd, void *buf);
> > +
> > +#endif
> > --
> > 2.34.1
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

