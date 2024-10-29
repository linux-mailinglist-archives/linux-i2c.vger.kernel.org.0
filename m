Return-Path: <linux-i2c+bounces-7642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F09B412A
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 04:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA15A1F228BB
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 03:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E121FF7B7;
	Tue, 29 Oct 2024 03:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gtowu2h4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC34282FB;
	Tue, 29 Oct 2024 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173545; cv=none; b=cU7VKgyN9Tbvo4XaXV/Z9jcFkjBu/61ZvBF71HWbW2+z2ElSZ3zPizBqzwhtni4HG87khRIMTjkAyUyFtQJdsbMJpfzChO9VgjovyiioqkMgcRxaVn6Fpe/TLMcL0y+77SsK7jwMe2T1saPLDxsa2QKH/CK6Vov0kjv0pQ36C6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173545; c=relaxed/simple;
	bh=XYnM6DX+CYxWd6ljUMrgeFtnN/QrAB98BtTRnD5Ohn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiR/hcCUb0gDngSvQhBeGQPD+IZPoTW4Xq9DDjwYwu9NUQ/h/AG4qCdlLjGD+UJyudlbaMZZztjdpOeXGBx1ieFPpGM11lRP5sRV+oQ2/vIgyo+dO1IgY+C0l60yFiqIj+cQuWjvkhEjAGd/PkrNe1JtXRx7Mn2cBi2dhZVHQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gtowu2h4; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2974743675so4472896276.1;
        Mon, 28 Oct 2024 20:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730173542; x=1730778342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/CTs5K1y1Wb1h73no9mebagu5POeGng1N3JgW2OuRU=;
        b=Gtowu2h4SGC7DktSemUBNe3r4C20PuuQUK1Gu13xI6e/FzBpc6IK+U5Xtv2IntjXSo
         E/mdfhK58XXJ6Nmo511UJF8+qnTHJ3QvrtDdBQirngGPLaK4iv/qJx9re8QSbQ3XYhtt
         W4Hm8gNlTjDjX3FZ7MxCSx4KJGQXa/hsQQpTuDwUN89K5E4Hi9QagrHiuifwTOTtI6gA
         +b1QLEEATwH7r0iBWRsC+hHQyPqtchS6ycs94PG2YO3inqkwSVolknfWdGjfQduQbhZS
         4qutj6pb2Gpa/EOuXiHiuEH4iPTSaH29O+HQflMy0BvcFUB0bYmsC10NCYE5SGNy3OWo
         ifbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730173542; x=1730778342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/CTs5K1y1Wb1h73no9mebagu5POeGng1N3JgW2OuRU=;
        b=t5i8r6dSCwm8eh0UCn896urLAM+3epkSM9lcBqYB6b3P1aoI4KXVqFRjR1O/cqW2je
         BMgH5cLTwqJ+cvnGbmwJBrrPWbpL0spBB2RAd5XZmbkyU7RKtpRIPTbQ2U3l9xbFl4KU
         Gw253pZRTdsSQSMNQHMIR6hValDX6getVKGCKPMYFUz4UYS6I7u+RUe4+9Pl5nJuQTt4
         ut/fjBngAFYXY4XD5OejU+3fbotvFmv6pJPMP8DXRpRNKcjC1oqiZ44/JW9tdO10l6Qt
         Y5HVHmiouDUp7qhhJtgmO8cLpWpOinM/H5faPk7oR3yS4BRzk7JntSlAcyFjd2HxFU1A
         ubdA==
X-Forwarded-Encrypted: i=1; AJvYcCURcLGxst1+NU9cIT5bXYzfKvq1OhgGIkaKyW7Ri6MdUap5aSYEpgl7z8GnVuiNu0hp96JUC34I@vger.kernel.org, AJvYcCVLpI+LIcNFeJPFqtgZIQ2tsbWzTQ7YWsnaPoLNBB2vBBlnLNjri45qawrDzCh0urB8T24MSogosFlGCg==@vger.kernel.org, AJvYcCVXEz+IAHGrePm4MZiwdutlNHBRGkpnm5G1vcZWgRH68ka4v13M4aCe9iM5LepavSF4ciqqVSpVNG8=@vger.kernel.org, AJvYcCW0hbK0CU9DKLaZRoRV1/cDBjvrfeDOwlaiZZYpiSlQ3nTWMZvFG/nK28Iv3FTuiQxN8Du0nRVq9L3TQJaF@vger.kernel.org, AJvYcCWAPdNVkHsOdMKm82yQiPuJodMGvS9cLfznjib4cu/RpZoHf3DAXM4NfnVy8R9XPN80OWxKjQ5/lyGX/sGDzxU=@vger.kernel.org, AJvYcCWZkA/Ebsvrsm1nzQqmVI2QoA1ZLgpgTRitgXjN8jvi04UxfTJXUSdvJJZBI29dEHCW19EocshcjMsD@vger.kernel.org, AJvYcCWkG26bwOBYdHuWuIx/w2ArSIw3v87kU1Y4rlaRyWYjU2BOAb7kM0cLziyhhTStxp9nn8JjpB2oIZmG@vger.kernel.org, AJvYcCWuMZkQ6fiBJUd6dKzdOqopu9ee/4dLre2VnjOYGotjP8a2gaFhmngHb70e9lgWIL+Kf7t2PCK6twu8@vger.kernel.org, AJvYcCXQ9JdtvqAXoRNx/prs/2BJ1/R5lr+9AN9OJrqABJIqbhtaB8GOL7kBwuXkw12C7k2tW+FfHJPkHZTMyXg=@vger.kernel.org, AJvYcCXWHd0MgKNNBFnsAHuLjCoPlYuEUNEx
 lw2sttxwdG7itDJKcHe38WKblEkalUz8d8Ebu0alXzNU+97Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuBDcQF97Vo9aOSBY2QbzEN1iEoyEskfpXMznDbVuFeJHiGq2
	JIRFRrYrFA/4rwSxWfoURJb/LvIvvRHnE8HDCUl65E04W88xv3VvrwGjfWotcyiVg7ZrPX+Smna
	jUxy+V7JjyNEx1npWxMvPC9R4Rek=
X-Google-Smtp-Source: AGHT+IGfm8i1NTOjdK59ar/oHoMjiqsPSqbc0JD5K9R4kxYreI+daaN7dVKfGowPbsaVFEJzyIlEL4zXfN95OO4rnFY=
X-Received: by 2002:a05:6902:12cc:b0:e28:faf8:5cd7 with SMTP id
 3f1490d57ef6-e3087a6c107mr8166564276.15.1730173542428; Mon, 28 Oct 2024
 20:45:42 -0700 (PDT)
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
 <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com>
 <20241028-uptight-modest-puffin-0556e7-mkl@pengutronix.de>
 <CAOoeyxU1r3ayhNWrbE_muDhA0imfZYX3-UHxSen9TqsTrSsxyA@mail.gmail.com> <20241028-observant-gentle-doberman-0a2baa-mkl@pengutronix.de>
In-Reply-To: <20241028-observant-gentle-doberman-0a2baa-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 29 Oct 2024 11:45:30 +0800
Message-ID: <CAOoeyxWh1-=NVQdmNp5HBzf1YPo9tQdh=OzUUVFmvC-F7sCHWg@mail.gmail.com>
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
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:06=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 28.10.2024 16:31:25, Ming Yu wrote:
> > > > > > > > > The Linux USB stack can receive bulk messages longer than=
 the max packet size.
> > > > > > > >
> > > > > > > > [Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes=
 for this MFD device.
> > > > > > > > The core will divide packet 256 bytes for high speed USB de=
vice, but
> > > > > > > > it is exceeds
> > > > > > > > the hardware limitation, so I am dividing it manually.
> > > > > > >
> > > > > > > You say the endpoint descriptor is correctly reporting it's m=
ax packet
> > > > > > > size of 128, but the Linux USB will send packets of 256 bytes=
?
> > > > > >
> > > > > > [Ming] The endpoint descriptor is correctly reporting it's max =
packet
> > > > > > size of 256, but the Linux USB may send more than 256 (max is 5=
12)
> > > > > > https://elixir.bootlin.com/linux/v6.11.5/source/drivers/usb/hos=
t/xhci-mem.c#L1446
> > > > >
> > > > > AFAIK according to the USB-2.0 spec the maximum packet size for
> > > > > high-speed bulk transfers is fixed set to 512 bytes. Does this me=
an that
> > > > > your device is a non-compliant USB device?
> > > >
> > > > We will reduce the endpoint size of other interfaces to ensure that=
 MFD device
> > > > meets the USB2.0 spec. In other words, I will remove the code for m=
anual
> > > > unpacking in the next patch.
> > >
> > > I was not talking about the driver, but your USB device. According to
> > > the USB2.0 spec, the packet size is fixed to 512 for high-speed bulk
> > > transfers. So your device must be able to handle 512 byte transfers o=
r
> > > it's a non-compliant USB device.
> >
> > I understand. Therefore, the USB device's firmware will be modified to =
support
> > bulk pipe size of 512 bytes to comply with the USB 2.0 spec.
>
> Then you don't need manual segmentation of bulk transfers anymore!

Understood, thank you very much.

>
> > > > > > > > > > +     for (i =3D 0, len =3D length; len > 0; i++, len -=
=3D packet_len) {
> > > > > > > > > > +             if (len > nct6694->maxp)
> > > > > > > > > > +                     packet_len =3D nct6694->maxp;
> > > > > > > > > > +             else
> > > > > > > > > > +                     packet_len =3D len;
> > > > > > > > > > +
> > > > > > > > > > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpip=
e(udev, BULK_IN_ENDPOINT),
> > > > > > > > > > +                                nct6694->rx_buffer + n=
ct6694->maxp * i,
> > > > > > > > > > +                                packet_len, &rx_len, n=
ct6694->timeout);
> > > > > > > > > > +             if (ret)
> > > > > > > > > > +                     goto err;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     for (i =3D 0; i < rd_len; i++)
> > > > > > > > > > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx]=
;
> > > > > > > > >
> > > > > > > > > memcpy()?
> > > > > > > > >
> > > > > > > > > Or why don't you directly receive data into the provided =
buffer? Copying
> > > > > > > > > of the data doesn't make it faster.
> > > > > > > > >
> > > > > > > > > On the other hand, receiving directly into the target buf=
fer means the
> > > > > > > > > target buffer must not live on the stack.
> > > > > > > >
> > > > > > > > [Ming] Okay! I'll change it to memcpy().
> > > > > > >
> > > > > > > fine!
> > > > > > >
> > > > > > > > This is my perspective: the data is uniformly received by t=
he rx_bffer held
> > > > > > > > by the MFD device. does it need to be changed?
> > > > > > >
> > > > > > > My question is: Why do you first receive into the nct6694->rx=
_buffer and
> > > > > > > then memcpy() to the buffer provided by the caller, why don't=
 you
> > > > > > > directly receive into the memory provided by the caller?
> > > > > >
> > > > > > [Ming] Due to the bulk pipe maximum packet size limitation, I t=
hink consistently
> > > > > > using the MFD'd dynamically allocated buffer to submit URBs wil=
l better
> > > > > > manage USB-related operations
> > > > >
> > > > > The non-compliant max packet size limitation is unrelated to the
> > > > > question which RX or TX buffer to use.
> > > >
> > > > I think these two USB functions can be easily called using the buff=
er
> > > > dynamically
> > > > allocated by the MFD. However, if they transfer data directly to th=
e
> > > > target buffer,
> > > > they must ensure that it is not located on the stack.
> > >
> > > You have a high coupling between the MFD driver and the individual
> > > drivers anyways, so why not directly use the dynamically allocated
> > > buffer provided by the caller and get rid of the memcpy()?
> >
> > Okay! I will provide a function to request and free buffer for child de=
vices,
> > and update the caller's variables to use these two functions in the nex=
t patch.
>
> I don't see a need to provide dedicated function to allocate and free
> the buffers. The caller can allocate them as part of their private data,
> or allocate them during probe().

Okay, so each child device may allocate a buffer like this during probe():
priv->xmit_buf =3D devm_kcalloc(dev, MAX_PACKET_SZ, sizeof(unsigned char),
GFP_KERNEL), right?

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

