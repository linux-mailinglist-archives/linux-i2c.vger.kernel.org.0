Return-Path: <linux-i2c+bounces-7627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD99B2A60
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39A61F22499
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46498192D64;
	Mon, 28 Oct 2024 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gObW1FKn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D945191F84;
	Mon, 28 Oct 2024 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104300; cv=none; b=o9vGYbLUyUpk531Pei+mLc/RW9PAYoiS/rBwUndffSQPvVFVxy4bctNjLT25lZsuun8YBMiZ6wU3YItXRvxO2c/EUYzsixOfnLe1zc0274OtC6fRN8qUY2nnZ/+JrnjfA4ie1qg2FGukXru/jMiECir+1HGuHxfvO22cX5JtKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104300; c=relaxed/simple;
	bh=SHaV7a8m2yz52E+nctbzbDnlDwcDJN29F+Nh6Cj9wQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+mlMJKcq96R0YZpt7ia/q5WhwxjAtclR+17/AB4An9McDAwiNN46xM/Uejjm1gLNyr31U7KTVaJKQRDFTlVJc/DW0kuuejS6ZJrwRdkbxIXh1JiAzjFJVnaaa1Sd2kKCR8S2PqEvdgCyEhlYqMr1XxyA58LKRuyHDonXq24r8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gObW1FKn; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2e444e355fso3664556276.1;
        Mon, 28 Oct 2024 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730104296; x=1730709096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcY948jfGgx8uvT7sMECMiIeahovGQ0fYVq8akwUcN4=;
        b=gObW1FKn7gVFSkWlYYBfJmYhu6fuB+D9CD/d5iJIoVeF16+Rm/HUQac7Qkg4ij7syP
         L4UZrUpmkVOLcU10uBWm1g3lovmQIys7UumRJr4r4H138Du47MWefT3KHzMynaWw6Yc/
         0dYouKkmP0LBOqiW1Qcl7p4z9n3yLc9VnEkd2IUYfJle9sBZ7SaxbTetS+/1NiA9oNGV
         NyHnTuaajqOiJQqpnphjwf6B8oYMvYhKQGxEKIoWZ3cY+XNJaoMqg0ol6pPkSLDIXO4+
         F3IhO3s0A+8o3SgZTJomu5tK9cTYDfrEvozbtrIFd3mlcMXH8xi5310c6E78cZ8M2VC2
         NY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104296; x=1730709096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcY948jfGgx8uvT7sMECMiIeahovGQ0fYVq8akwUcN4=;
        b=So8rKw+xnR9Tv3sXBx677+557y+nalWwtOkIvn/6jnPUHEMBjeeJdxGZwu/2HKmWZ0
         KrVQwP0mWlwlTg1Zd59qQsw83Wq1+ecq88A0eHBGNuMxe9PL6FzRh2wsCdZzVkMuKc3L
         H+6RAfUdopLdpFHIC/KrSM4XPYqirNbB4BX3ZviqOk4oWznBB2lqu7PRhX4O1sRcBmem
         iY8XApqRqPpxSiyzYLJ3jcMYhRjx5sIzDkKal624R31UdS3+z8n2irGiONNKrIS5AA3f
         oXvd1SkQ8GWgRVJCeCBKcZ5xUp4pfm1NlY1N+392mKn724GujzZlODNfMLHneccHyBRl
         n+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU4IQo+2n7W6oyTsq+GBD/zOrurB0ozX/mOPiebsBeuR5nyBhN5CRyqQpPKAgIctcG9AA/xZziS+KzW@vger.kernel.org, AJvYcCUTWaDCtf7zE1CYL6dkUp2yRSqxSe/7zNR7LFE+hTV8cudcceEMaltWgKmpNL++X5p0tiAXdG2r+Nyz484=@vger.kernel.org, AJvYcCUeks932INjtR+EyYO3U5ddxEKrpbSRJOqS/dq5Wssd9SuGI9ZWie81ISfpBKp67eRE187Cc6S5nbSxuA==@vger.kernel.org, AJvYcCUhW7XKnj32CiOm3Kb1hIO8hi7fu/UFZxsYzlR65Fh5lbYu+/RDPgScfaH9X33GZCMHjYJy9Nk1@vger.kernel.org, AJvYcCV2pqpLT3bd0QS/DRlOhVlaQ7RdCMnhf2rFhuCSQ4FmT5f82MDKaAMzuml5KJ6MyPS+Anv7g0WYXzvY@vger.kernel.org, AJvYcCVj4uUHlOVgUN3cYJ8IrQJ4+1D0V/S5L8Gpx7CokN2qd8bGBTaXkHX7QzriNkHJ9K3eipKGf4i0OKRw@vger.kernel.org, AJvYcCVsNwKvCzw/9bBKegBex4duvgK9Xz3ZMkVeuEaJvAS7R1cSo2+pxTgKmLqWbF/jMgKz63UdrTXRbsw=@vger.kernel.org, AJvYcCWonxI+173RcA/of9X08tr3uwTwRY8jFEGm/qUICd/RUu87nnN0WLKd3W5uCbJUne8V+pamExJaHIW0Xljh@vger.kernel.org, AJvYcCWsmoGtEc/Tkor++bbhwNl5D3ygkrZPDTOKNX47WucbTzIg9yu6Q/Rf7tmDnSB7hvtCo71rF72ZiYjU@vger.kernel.org, AJvYcCXUTHqRjdCdc2NF0mHpXgWyP1y+f0Cilli7tFe1
 9Ff5gAFTXrnQzH2t8EplD3HsEVRVAowpkcjWEfK5qgXyteg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJa3+3o39EE84881NRL9ebhN6mMgPq8uqHeJ8/BvX1roZuTGR
	uj0/iDrHQ2+OBaeRrxZV5f3SZ0cxeJcP7ZQAoCPcs87Q7mjdWvxUacHesE3C8idM+XjK1girLyx
	XG/a84XN1k0ysIozX34RFt9Lqaps=
X-Google-Smtp-Source: AGHT+IHfwraBh0NJHVkb+HlEoXQBoeg+ynvlKolAIoDyidN1EgkxWY3yAqaQR4x8wGosSDNGXeaBP4zu0x6f9HQRy2Q=
X-Received: by 2002:a05:6902:100b:b0:e28:e700:2821 with SMTP id
 3f1490d57ef6-e30875dd6ffmr4666457276.25.1730104296331; Mon, 28 Oct 2024
 01:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <CAOoeyxUhnyYG3p+DQJG-tvU5vc5WYQZLLqCXW=uPcXTjq2gVfw@mail.gmail.com>
 <20241025-truthful-honest-newt-c371c8-mkl@pengutronix.de> <CAOoeyxUEf5vjqL67WjR-DbrhE0==2hqHLEyZ5XEBhEfMfQ5pag@mail.gmail.com>
 <20241025-spirited-nocturnal-antelope-ce93dd-mkl@pengutronix.de>
 <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com> <20241028-uptight-modest-puffin-0556e7-mkl@pengutronix.de>
In-Reply-To: <20241028-uptight-modest-puffin-0556e7-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 16:31:25 +0800
Message-ID: <CAOoeyxU1r3ayhNWrbE_muDhA0imfZYX3-UHxSen9TqsTrSsxyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 28.10.2024 15:33:08, Ming Yu wrote:
> > Dear Marc,
> >
> > Thank you for your comments,
> >
> > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=
=8825=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:24=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > On 25.10.2024 19:03:55, Ming Yu wrote:
> > > > Oh! I'm sorry about that I confused the packet size.
> > > > The NCT6694 bulk maximum packet size is 256 bytes,
> > > > and USB High speed bulk maximum packet size is 512 bytes.
> > > >
> > > > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=
=9C=8825=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:08=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > > >
> > > > > On 25.10.2024 16:08:10, Ming Yu wrote:
> > > > > > > > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 =
offset, u16 length,
> > > > > > > > +                  u8 rd_idx, u8 rd_len, unsigned char *buf=
)
> > > > > > >
> > > > > > > why not make buf a void *?
> > > > > >
> > > > > > [Ming] I'll change the type in the next patch.
> > > > > >
> > > > > > >
> > > > > > > > +{
> > > > > > > > +     struct usb_device *udev =3D nct6694->udev;
> > > > > > > > +     unsigned char err_status;
> > > > > > > > +     int len, packet_len, tx_len, rx_len;
> > > > > > > > +     int i, ret;
> > > > > > > > +
> > > > > > > > +     mutex_lock(&nct6694->access_lock);
> > > > > > > > +
> > > > > > > > +     /* Send command packet to USB device */
> > > > > > > > +     nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> > > > > > > > +     nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xF=
F;
> > > > > > > > +     nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8=
) & 0xFF;
> > > > > > > > +     nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_GET;
> > > > > > > > +     nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0=
xFF;
> > > > > > > > +     nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >>=
 8) & 0xFF;
> > > > > > > > +
> > > > > > > > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK=
_OUT_ENDPOINT),
> > > > > > > > +                        nct6694->cmd_buffer, CMD_PACKET_SZ=
, &tx_len,
> > > > > > > > +                        nct6694->timeout);
> > > > > > > > +     if (ret)
> > > > > > > > +             goto err;
> > > > > > > > +
> > > > > > > > +     /* Receive response packet from USB device */
> > > > > > > > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK=
_IN_ENDPOINT),
> > > > > > > > +                        nct6694->rx_buffer, CMD_PACKET_SZ,=
 &rx_len,
> > > > > > > > +                        nct6694->timeout);
> > > > > > > > +     if (ret)
> > > > > > > > +             goto err;
> > > > > > > > +
> > > > > > > > +     err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> > > > > > > > +
> > > > > > > > +     /*
> > > > > > > > +      * Segmented reception of messages that exceed the si=
ze of USB bulk
> > > > > > > > +      * pipe packets.
> > > > > > > > +      */
> > > > > > >
> > > > > > > The Linux USB stack can receive bulk messages longer than the=
 max packet size.
> > > > > >
> > > > > > [Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes for=
 this MFD device.
> > > > > > The core will divide packet 256 bytes for high speed USB device=
, but
> > > > > > it is exceeds
> > > > > > the hardware limitation, so I am dividing it manually.
> > > > >
> > > > > You say the endpoint descriptor is correctly reporting it's max p=
acket
> > > > > size of 128, but the Linux USB will send packets of 256 bytes?
> > > >
> > > > [Ming] The endpoint descriptor is correctly reporting it's max pack=
et
> > > > size of 256, but the Linux USB may send more than 256 (max is 512)
> > > > https://elixir.bootlin.com/linux/v6.11.5/source/drivers/usb/host/xh=
ci-mem.c#L1446
> > >
> > > AFAIK according to the USB-2.0 spec the maximum packet size for
> > > high-speed bulk transfers is fixed set to 512 bytes. Does this mean t=
hat
> > > your device is a non-compliant USB device?
> >
> > We will reduce the endpoint size of other interfaces to ensure that MFD=
 device
> > meets the USB2.0 spec. In other words, I will remove the code for manua=
l
> > unpacking in the next patch.
>
> I was not talking about the driver, but your USB device. According to
> the USB2.0 spec, the packet size is fixed to 512 for high-speed bulk
> transfers. So your device must be able to handle 512 byte transfers or
> it's a non-compliant USB device.

I understand. Therefore, the USB device's firmware will be modified to supp=
ort
bulk pipe size of 512 bytes to comply with the USB 2.0 spec.

>
> > > > > > > > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D =
packet_len) {
> > > > > > > > +             if (len > nct6694->maxp)
> > > > > > > > +                     packet_len =3D nct6694->maxp;
> > > > > > > > +             else
> > > > > > > > +                     packet_len =3D len;
> > > > > > > > +
> > > > > > > > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(ud=
ev, BULK_IN_ENDPOINT),
> > > > > > > > +                                nct6694->rx_buffer + nct66=
94->maxp * i,
> > > > > > > > +                                packet_len, &rx_len, nct66=
94->timeout);
> > > > > > > > +             if (ret)
> > > > > > > > +                     goto err;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     for (i =3D 0; i < rd_len; i++)
> > > > > > > > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx];
> > > > > > >
> > > > > > > memcpy()?
> > > > > > >
> > > > > > > Or why don't you directly receive data into the provided buff=
er? Copying
> > > > > > > of the data doesn't make it faster.
> > > > > > >
> > > > > > > On the other hand, receiving directly into the target buffer =
means the
> > > > > > > target buffer must not live on the stack.
> > > > > >
> > > > > > [Ming] Okay! I'll change it to memcpy().
> > > > >
> > > > > fine!
> > > > >
> > > > > > This is my perspective: the data is uniformly received by the r=
x_bffer held
> > > > > > by the MFD device. does it need to be changed?
> > > > >
> > > > > My question is: Why do you first receive into the nct6694->rx_buf=
fer and
> > > > > then memcpy() to the buffer provided by the caller, why don't you
> > > > > directly receive into the memory provided by the caller?
> > > >
> > > > [Ming] Due to the bulk pipe maximum packet size limitation, I think=
 consistently
> > > > using the MFD'd dynamically allocated buffer to submit URBs will be=
tter
> > > > manage USB-related operations
> > >
> > > The non-compliant max packet size limitation is unrelated to the
> > > question which RX or TX buffer to use.
> >
> > I think these two USB functions can be easily called using the buffer
> > dynamically
> > allocated by the MFD. However, if they transfer data directly to the
> > target buffer,
> > they must ensure that it is not located on the stack.
>
> You have a high coupling between the MFD driver and the individual
> drivers anyways, so why not directly use the dynamically allocated
> buffer provided by the caller and get rid of the memcpy()?

Okay! I will provide a function to request and free buffer for child device=
s,
and update the caller's variables to use these two functions in the next pa=
tch.

>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

Thanks,
Ming

