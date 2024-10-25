Return-Path: <linux-i2c+bounces-7570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E999AFC26
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D341C21161
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168FE18CBF8;
	Fri, 25 Oct 2024 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqLW0t2d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD41BCA0E;
	Fri, 25 Oct 2024 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843705; cv=none; b=Q0nKwo121pVy+4LynBcVz4qLHUmFAjmFPKnrInpUVK1XCVKEwTHAOdWTqePVNo9DWugI+2EfZtRVeK34e4NjB4AAXNGmkgjQLCV4GhXVkHZl3BBrUCoS3OnrfWnenyzIR0CsjJSPMMO/qLvhxOPOtyWmaRUE7jMxBn95xGamZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843705; c=relaxed/simple;
	bh=gn2PQGxbiqmo59nILi5cwL9Vg7yl5vrI4/JPBzHBMl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4eWyzgixLD7knFyiNYP+ib4yCLzT0aiV2UOKOJEJWl0SaX4ZUDcOGupbr43nLnc2hgh0H1x1bTURpPSYVOGtaRSDnw+cH6RK9znbV1dyrehAdiJesDtvHByFjZw83C/b/Z2O03DbZnvHRCO6xtH2A8YuPQOWzOWcYfp1LEUzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqLW0t2d; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e292926104bso1904659276.0;
        Fri, 25 Oct 2024 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843701; x=1730448501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM0xtRQWp7YMaq79mGypDocR1tSvuLKFLGMnVtETs5Y=;
        b=KqLW0t2dLqnRf4R5s7dGCELki5+47bG1kIZCCgEtz3pwdx17IBL82tJXamsRLngs0d
         t4ypEwst7r55mqeq/igbkDSFAa5WYEXiu4fSwOc8waFjgNaer1MpoO4EsZ7uFXy4Gii1
         pg8eCle+zVdJzzx/mAkSyjEu37xUwB6ldls5GsaX18CUsjf5tsIaXMGXbI6BoVtC92HC
         LDXHgHBYqJNVXAOAjS3o6vDi9P+ZQM8AlhRMmH9MAvNQcPDlABJ+I4kHQ0LJEaNe8bua
         T49xmixuEwkg2LYQLREjpEGM4cu0302jNxbeYeF3lTlNqAqN3jNJecwmuP05yvi9zmkI
         MK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843701; x=1730448501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nM0xtRQWp7YMaq79mGypDocR1tSvuLKFLGMnVtETs5Y=;
        b=PIqqsPRIjjUNEWFVyE2znNEaEOxgvZQ8ZBmTQTsFDF3pH9b49TcrwdgsUzkWmBseVM
         U85q1BLOiqDy9lfXWBlgLvc/FSjL3r5cq3xlzthIMRF2L6R46pJUrP/HPKnmEAW3Xf3T
         FyDeMrpW7KxXmdaqZzIrER6C/wkYlI+pqSXTjTdxlSlbK87+XtJ49rBaq117FVAXoJ4q
         wq6d/yB43gnvlXQvFO1dmJv7eT68ii7vgmyeaGF6QAWszkHAq6hV5NnbOLiIVpsn+tgA
         t1CB84h/Z1nR5h/g+byUQw+/YJvz+5Hmy5uQ2WHQX9WYrv0npWEWMIRLgww+we99qG9t
         5mLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKi50pygiM603ihXeIrxgC+eL3tVHy9y73KLGbSEcDDYnGT+9mewZjeqNFQ3EPpOZUn4SqpfDNiT0mnw==@vger.kernel.org, AJvYcCUcxfcM9LJ6kd/k/ag6gIXJJYmEh95KejOEmrTsVgJKdlAKlFjS2reIXBPQczqAGSTZRso7s9NIFWDj@vger.kernel.org, AJvYcCUeGiaCC30Uk8TJ2mJS3R0aW4EdWOej2dUH9r1CoLxOajy3KRwWFVIEbZHeEhArW+zkZE1fY0ZdUxlI5m0=@vger.kernel.org, AJvYcCUuZcyLi4FwDf1V6oF4JMj+f+VljvfF0sY7xkmes22cZeILmVGMI3pNwwMdTrsWxawYqzryrt2gsA84@vger.kernel.org, AJvYcCWUC61Z/LyYTkCbIlat4exNbc5QAhLT+2JzzdmCdd1T0lwc5WW7dct8MpcdeTBAt+dqzcolhBT+AXg=@vger.kernel.org, AJvYcCWzY3RIH3g7VzUza0gThrEa3lMv0R8L7ovojPpioRjA+JVxR/CVm92wqpJIHyvRgfasN5eVzPUEZlrO@vger.kernel.org, AJvYcCXH7lYFaGJqQblW4U8dZd1ipuvL4hRHNYT7OVZ2hnnzGdvyBRidMnAf4JD9qhulE/sf+Ll/69Q1asHF3nTllto=@vger.kernel.org, AJvYcCXMrkMXq5gEF3gf0u6oz1w0d5SZ2DMUzodbqz6AOEVzhRx5BjUBVwjV9yW09kDT7iCwYyo1gclZ2spJ9TEm@vger.kernel.org, AJvYcCXZP7FmcQyp+LklAIk5Bl4tW/CPVubtSZnruDjOC2RIU242T2mpzWWDygijR8ArHERD9BsvyXPjCfiC@vger.kernel.org, AJvYcCXfmnotPOl4UMrvVrI/zyAw1h5J
 2H0SebmLN06mM6ycJSwaZ6BKq2Mhd+905SmAytKJr2Av8M3b@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5zfRpGfPeNtVt5FwbcglxznDiwz+jHzIt0iIP4i3rKzzZBdt
	xgLuUpbBO1gJPbMkiw2EMr+hrvFM2fOpKrZG/KGwuw5ri4PjGOUlWKtRYcWFSvtIHamPzMm/R0H
	UN9Azds/amfZJp4Wk41pT0sP6de4=
X-Google-Smtp-Source: AGHT+IF3N16BY9UNA4rxgjVQ9a93qQyc/LrKGu7pWUP/7H02UqvkJ2ozLXQs17wMas8pTaLubS56g2NuchQm3PjY36U=
X-Received: by 2002:a05:6902:100b:b0:e29:e81:fe45 with SMTP id
 3f1490d57ef6-e2f2fbc0580mr5645729276.35.1729843701393; Fri, 25 Oct 2024
 01:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
In-Reply-To: <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 16:08:10 +0800
Message-ID: <CAOoeyxUhnyYG3p+DQJG-tvU5vc5WYQZLLqCXW=uPcXTjq2gVfw@mail.gmail.com>
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

Sorry, resending this email in plain text format.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:21=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 24.10.2024 16:59:14, Ming Yu wrote:
> > The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > PWM, and RTC.
> >
> > This driver implements USB device functionality and shares the
> > chip's peripherals as a child device.
> >
> > Each child device can use the USB functions nct6694_read_msg()
> > and nct6694_write_msg() to issue a command. They can also register
> > a handler function that will be called when the USB device receives
> > its interrupt pipe.
>
> [...]
>
> > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > new file mode 100644
> > index 000000000000..9838c7be0b98
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694.c
>
> [...]
>
> > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset, u16 =
length,
> > +                  u8 rd_idx, u8 rd_len, unsigned char *buf)
>
> why not make buf a void *?

[Ming] I'll change the type in the next patch.

>
> > +{
> > +     struct usb_device *udev =3D nct6694->udev;
> > +     unsigned char err_status;
> > +     int len, packet_len, tx_len, rx_len;
> > +     int i, ret;
> > +
> > +     mutex_lock(&nct6694->access_lock);
> > +
> > +     /* Send command packet to USB device */
> > +     nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> > +     nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> > +     nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) & 0xFF;
> > +     nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_GET;
> > +     nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xFF;
> > +     nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8) & 0xFF;
> > +
> > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOIN=
T),
> > +                        nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             goto err;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT=
),
> > +                        nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             goto err;
> > +
> > +     err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> > +
> > +     /*
> > +      * Segmented reception of messages that exceed the size of USB bu=
lk
> > +      * pipe packets.
> > +      */
>
> The Linux USB stack can receive bulk messages longer than the max packet =
size.

[Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes for this MFD de=
vice.
The core will divide packet 256 bytes for high speed USB device, but
it is exceeds
the hardware limitation, so I am dividing it manually.

>
> > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_len) =
{
> > +             if (len > nct6694->maxp)
> > +                     packet_len =3D nct6694->maxp;
> > +             else
> > +                     packet_len =3D len;
> > +
> > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_=
ENDPOINT),
> > +                                nct6694->rx_buffer + nct6694->maxp * i=
,
> > +                                packet_len, &rx_len, nct6694->timeout)=
;
> > +             if (ret)
> > +                     goto err;
> > +     }
> > +
> > +     for (i =3D 0; i < rd_len; i++)
> > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx];
>
> memcpy()?
>
> Or why don't you directly receive data into the provided buffer? Copying
> of the data doesn't make it faster.
>
> On the other hand, receiving directly into the target buffer means the
> target buffer must not live on the stack.

[Ming] Okay! I'll change it to memcpy().
This is my perspective: the data is uniformly received by the rx_bffer held
by the MFD device. does it need to be changed?

>
> > +
> > +     if (err_status) {
> > +             pr_debug("%s: MSG CH status =3D %2Xh\n", __func__, err_st=
atus);
> > +             ret =3D -EIO;
> > +     }
> > +
> > +err:
> > +     mutex_unlock(&nct6694->access_lock);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(nct6694_read_msg);
> > +
> > +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> > +                   u16 length, unsigned char *buf)
> > +{
> > +     struct usb_device *udev =3D nct6694->udev;
> > +     unsigned char err_status;
> > +     int len, packet_len, tx_len, rx_len;
> > +     int i, ret;
> > +
> > +     mutex_lock(&nct6694->access_lock);
> > +
> > +     /* Send command packet to USB device  */
> > +     nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> > +     nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> > +     nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) & 0xFF;
> > +     nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_SET;
> > +     nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xFF;
> > +     nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8) & 0xFF;
>
> What about creating a struct that describes the cmd_buffer layout?

[Ming] I've thought about this before, thanks for your comments.

>
> > +
> > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_ENDPOIN=
T),
> > +                        nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             goto err;
> > +
> > +     /*
> > +      * Segmented transmission of messages that exceed the size of USB=
 bulk
> > +      * pipe packets.
> > +      */
>
> same as above
>
> > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_len) =
{
> > +             if (len > nct6694->maxp)
> > +                     packet_len =3D nct6694->maxp;
> > +             else
> > +                     packet_len =3D len;
> > +
> > +             memcpy(nct6694->tx_buffer + nct6694->maxp * i,
> > +                    buf + nct6694->maxp * i, packet_len);
> > +
> > +             ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT=
_ENDPOINT),
> > +                                nct6694->tx_buffer + nct6694->maxp * i=
,
> > +                                packet_len, &tx_len, nct6694->timeout)=
;
> > +             if (ret)
> > +                     goto err;
> > +     }
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDPOINT=
),
> > +                        nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             goto err;
> > +
> > +     err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> > +
> > +     /*
> > +      * Segmented reception of messages that exceed the size of USB bu=
lk
> > +      * pipe packets.
> > +      */
>
> same as above
>
> > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_len) =
{
> > +             if (len > nct6694->maxp)
> > +                     packet_len =3D nct6694->maxp;
> > +             else
> > +                     packet_len =3D len;
> > +
> > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_=
ENDPOINT),
> > +                                nct6694->rx_buffer + nct6694->maxp * i=
,
> > +                                packet_len, &rx_len, nct6694->timeout)=
;
> > +             if (ret)
> > +                     goto err;
> > +     }
> > +
> > +     memcpy(buf, nct6694->rx_buffer, length);
>
> why not rx into the destination buffer directly?
>
> > +
> > +     if (err_status) {
> > +             pr_debug("%s: MSG CH status =3D %2Xh\n", __func__, err_st=
atus);
> > +             ret =3D -EIO;
> > +     }
> > +
> > +err:
> > +     mutex_unlock(&nct6694->access_lock);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(nct6694_write_msg);
>
> [...]
>
> > +static int nct6694_usb_probe(struct usb_interface *iface,
> > +                          const struct usb_device_id *id)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct device *dev =3D &udev->dev;
> > +     struct usb_host_interface *interface;
> > +     struct usb_endpoint_descriptor *int_endpoint;
> > +     struct nct6694 *nct6694;
> > +     int pipe, maxp, bulk_pipe;
> > +     int ret =3D EINVAL;
> > +
> > +     interface =3D iface->cur_altsetting;
> > +     /* Binding interface class : 0xFF */
> > +     if (interface->desc.bInterfaceClass !=3D USB_CLASS_VENDOR_SPEC ||
> > +         interface->desc.bInterfaceSubClass !=3D 0x00 ||
> > +         interface->desc.bInterfaceProtocol !=3D 0x00)
> > +             return -ENODEV;
> > +
> > +     int_endpoint =3D &interface->endpoint[0].desc;
> > +     if (!usb_endpoint_is_int_in(int_endpoint))
> > +             return -ENODEV;
> > +
> > +     nct6694 =3D devm_kzalloc(&udev->dev, sizeof(*nct6694), GFP_KERNEL=
);
> > +     if (!nct6694)
> > +             return -ENOMEM;
> > +
> > +     pipe =3D usb_rcvintpipe(udev, INT_IN_ENDPOINT);
> > +     maxp =3D usb_maxpacket(udev, pipe);
>
> better move these 2 down to the usb_fill_int_urb().

[Ming] Okay! I'll move these in the next patch.

>
> > +
> > +     nct6694->cmd_buffer =3D devm_kcalloc(dev, CMD_PACKET_SZ,
> > +                                        sizeof(unsigned char), GFP_KER=
NEL);
> > +     if (!nct6694->cmd_buffer)
> > +             return -ENOMEM;
> > +     nct6694->rx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > +                                       sizeof(unsigned char), GFP_KERN=
EL);
> > +     if (!nct6694->rx_buffer)
> > +             return -ENOMEM;
> > +     nct6694->tx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > +                                       sizeof(unsigned char), GFP_KERN=
EL);
> > +     if (!nct6694->tx_buffer)
> > +             return -ENOMEM;
> > +     nct6694->int_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > +                                        sizeof(unsigned char), GFP_KER=
NEL);
> > +     if (!nct6694->int_buffer)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!nct6694->int_in_urb) {
> > +             dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     /* Bulk pipe maximum packet for each transaction */
> > +     bulk_pipe =3D usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
> > +     nct6694->maxp =3D usb_maxpacket(udev, bulk_pipe);
> > +
> > +     mutex_init(&nct6694->access_lock);
> > +     nct6694->udev =3D udev;
> > +     nct6694->timeout =3D URB_TIMEOUT; /* Wait until urb complete */
> > +
> > +     INIT_LIST_HEAD(&nct6694->handler_list);
> > +     spin_lock_init(&nct6694->lock);
> > +
> > +     usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> > +                      nct6694->int_buffer, maxp, usb_int_callback,
> > +                      nct6694, int_endpoint->bInterval);
> > +     ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> > +     if (ret)
> > +             goto err_urb;
> > +
> > +     dev_set_drvdata(&udev->dev, nct6694);
> > +     usb_set_intfdata(iface, nct6694);
> > +
> > +     ret =3D mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
> > +                                   ARRAY_SIZE(nct6694_dev));
> > +     if (ret) {
> > +             dev_err(&udev->dev, "Failed to add mfd's child device\n")=
;
> > +             goto err_mfd;
> > +     }
> > +
> > +     nct6694->async_workqueue =3D alloc_ordered_workqueue("asyn_workqu=
eue", 0);
>
> Where is the async_workqueue used?
>
> > +
> > +     dev_info(&udev->dev, "Probed device: (%04X:%04X)\n",
> > +              id->idVendor, id->idProduct);
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
> > +     flush_workqueue(nct6694->async_workqueue);
> > +     destroy_workqueue(nct6694->async_workqueue);
> > +     usb_set_intfdata(iface, NULL);
>
> I think this is not needed.

[Ming] I'll remove it in the next patch.

>
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +     usb_free_urb(nct6694->int_in_urb);
> > +}
> > +
> > +static const struct usb_device_id nct6694_ids[] =3D {
> > +     { USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> > +
> > +static struct usb_driver nct6694_usb_driver =3D {
> > +     .name   =3D DRVNAME,
> > +     .id_table =3D nct6694_ids,
> > +     .probe =3D nct6694_usb_probe,
> > +     .disconnect =3D nct6694_usb_disconnect,
> > +};
> > +
> > +module_usb_driver(nct6694_usb_driver);
> > +
> > +MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> > new file mode 100644
> > index 000000000000..0797564363be
> > --- /dev/null
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -0,0 +1,168 @@
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
> > +#define NCT6694_DEV_GPIO             "nct6694-gpio"
> > +#define NCT6694_DEV_I2C                      "nct6694-i2c"
> > +#define NCT6694_DEV_CAN                      "nct6694-can"
> > +#define NCT6694_DEV_WDT                      "nct6694-wdt"
> > +#define NCT6694_DEV_IIO                      "nct6694-iio"
> > +#define NCT6694_DEV_HWMON            "nct6694-hwmon"
> > +#define NCT6694_DEV_PWM                      "nct6694-pwm"
> > +#define NCT6694_DEV_RTC                      "nct6694-rtc"
> > +
> > +#define NCT6694_VENDOR_ID            0x0416
> > +#define NCT6694_PRODUCT_ID           0x200B
> > +#define INT_IN_ENDPOINT                      0x81
> > +#define BULK_IN_ENDPOINT             0x82
>
> In Linux we don't add the 0x80 for IN endpoint, the framework does this
> for you.

[Ming] I'll change it in the next patch.

>
> > +#define BULK_OUT_ENDPOINT            0x03
> > +#define MAX_PACKET_SZ                        0x100
> > +
> > +#define CMD_PACKET_SZ                        0x8
> > +#define HCTRL_SET                    0x40
> > +#define HCTRL_GET                    0x80
> > +
> > +#define REQUEST_MOD_IDX                      0x01
> > +#define REQUEST_CMD_IDX                      0x02
> > +#define REQUEST_SEL_IDX                      0x03
> > +#define REQUEST_HCTRL_IDX            0x04
> > +#define REQUEST_LEN_L_IDX            0x06
> > +#define REQUEST_LEN_H_IDX            0x07
> > +
> > +#define RESPONSE_STS_IDX             0x01
> > +
> > +#define INT_IN_IRQ_IDX                       0x00
> > +#define GPIO_IRQ_STATUS                      BIT(0)
> > +#define CAN_IRQ_STATUS                       BIT(2)
> > +#define RTC_IRQ_STATUS                       BIT(3)
> > +
> > +#define URB_TIMEOUT                  1000
> > +
> > +/*
> > + * struct nct6694 - Nuvoton NCT6694 structure
> > + *
> > + * @udev: Pointer to the USB device
> > + * @int_in_urb: Interrupt pipe urb
> > + * @access_lock: USB transaction lock
> > + * @handler_list: List of registered handlers
> > + * @async_workqueue: Workqueue of processing asynchronous work
> > + * @tx_buffer: USB write message buffer
> > + * @rx_buffer: USB read message buffer
> > + * @cmd_buffer: USB send command message buffer
> > + * @int_buffer: USB receive interrupt message buffer
> > + * @lock: Handlers lock
> > + * @timeout: URB timeout
> > + * @maxp: Maximum packet of bulk pipe
> > + */
> > +struct nct6694 {
> > +     struct usb_device *udev;
> > +     struct urb *int_in_urb;
> > +     struct list_head handler_list;
> > +     struct workqueue_struct *async_workqueue;
> > +
> > +     /* Make sure that every USB transaction is not interrupted */
> > +     struct mutex access_lock;
> > +
> > +     unsigned char *tx_buffer;
> > +     unsigned char *rx_buffer;
> > +     unsigned char *cmd_buffer;
> > +     unsigned char *int_buffer;
> > +
> > +     /* Prevent races within handlers */
> > +     spinlock_t lock;
> > +
> > +     /* time in msec to wait for the urb to the complete */
> > +     long timeout;
> > +
> > +     /* Bulk pipe maximum packet for each transaction */
> > +     int maxp;
> > +};
> > +
> > +/*
> > + * struct nct6694_handler_entry - Stores the interrupt handling inform=
ation
> > + * for each registered peripheral
> > + *
> > + * @irq_bit: The bit in irq_status[INT_IN_IRQ_IDX] representing interr=
upt
>                     ^^^
>
> I think this comment could be more precise, you can emphasize, that it's
> not the bit number but the bit mask.

[Ming] Okay! I'll change it in the next patch.

>
> > + * @handler: Function pointer to the interrupt handler of the peripher=
al
> > + * @private_data: Private data specific to the peripheral driver
> > + * @list: Node used to link to the handler_list
> > + */
> > +struct nct6694_handler_entry {
> > +     int irq_bit;
>
> the int_status you compare against in the IRQ callback ist a unsigned
> char. Better make all a u8.

[Ming] Okay! I'll change it in the next patch.

>
> > +     void (*handler)(void *private_data);
> > +     void *private_data;
> > +     struct list_head list;
> > +};
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

