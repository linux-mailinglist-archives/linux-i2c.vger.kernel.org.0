Return-Path: <linux-i2c+bounces-7621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF649B2903
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D844282488
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 07:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F68198E80;
	Mon, 28 Oct 2024 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz6Zd+Sk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB919190696;
	Mon, 28 Oct 2024 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100803; cv=none; b=N5WQamEbWM/oBgujfv6eZDdXo2aNshJQ6ZmUiw8lv2a6qrh8bzpdN6k1pxzsb549BeHWuyeuLOkGzRzHtZGv6qQaCrLDbeJbmKBHd9U3pCQAe/35TwqSXWPyU5WYMBRBpMD7DQwauxXprlPBCdIQl8Oga0EnTipnbURLjcOzOtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100803; c=relaxed/simple;
	bh=RviHbXVg4aARHNlWk9U+W3hQID5NFafUc/tc+ztHxK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIlHTYOv78vY338cbktV+bEh6SYECrCu8TqY+P8CPj8LschbIUGBOjYfKSWDAtEe9YyJUSiLodibEkTZR1aWD9uVbXKLQlgJNbOaafmJlpSg3o/JrA9Pu9VpHczwhcx1DZh95jc/ePfou/0PYgRwqJJK2ADpZnEAftP6PCO6kVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz6Zd+Sk; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e291f1d659aso4294899276.3;
        Mon, 28 Oct 2024 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730100800; x=1730705600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmD4Y6Va5h86h4YozU3etDyKxL8PIyLAaGGMpTw61LM=;
        b=Bz6Zd+SknoB3AK3as/QmeVMSfPYULcIpiLzsdhj3cgJHPM0qu+UPsK4aNw5AqihNp6
         36oH33EHHBmGROWuXx5BzOlkYYNX/79Ld9d/eMcjhxJDho2dSyfee3WAIArjrkJ4AS3s
         /Az0Z9xc3btgKeH7ZHxHHA7UNbBMuYsCplNHIMwvDJ4XBnJDN6iZGB3WlKHupg9cgZuL
         sxwdUIU7O8owWCUlp7RU60TS6fLFfR/pN6iMlLZ9ibPNc9qxGFblGZX43AaAIWzNewvq
         2/VaiHO9403Y4acl9N02H3Eobc0QPc36S/GtQOlEf3v0DyApiwXiS7RSEH2hcbGOPwdj
         UmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730100800; x=1730705600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmD4Y6Va5h86h4YozU3etDyKxL8PIyLAaGGMpTw61LM=;
        b=agb+i/2TNS52JnoEtsQZ8ejN6T2MccUo1jJij7riLDF5hIV9pQ/ovU2YKzy7MdHzrG
         3wzrPQJZVjksIckW3QuSd03nadcuaRDQvOjgAmfD2js6c8scCWg2wcoM+KqANN3qeAfi
         WhPjQtwjlPZ0NB/+VWhnKb0jKXYVRyDvQr3HOV0xzQTLt1kNQ4tj86F2zq0PFoBPmlPv
         jVQSZyV390us+QzxAV7WWA96n+5WzMqiIxEYTt0kSTmnAIzh7nJUP7IzZN597Kvqh9o8
         I3XmWoJaQJadOEqYUnbJ/oNmOjkAMG0uvNYY7rpscmfimZkeAQmA4SUww6hoA/yhdGn/
         VHAA==
X-Forwarded-Encrypted: i=1; AJvYcCUD7CKzCU/dPzPDhAvMCJin1GwxVkrXDgHewm/e57uLAeXJ44+HkCHP17s+fo1bSpG5xsUbxT4u8C2n@vger.kernel.org, AJvYcCUT4C5Yr7IU2Qukg6CJMS2ROR+nTSzkV9HwacyYOWwGQdmBdCARFslON3tJhkc2Umsjyx/Q2RCzjvQoIxjH8vI=@vger.kernel.org, AJvYcCUbF8rLDEX0+UfySXiieYklUpCxj9HT39OTLMVztluGaNRvW0j38bDeKhVBQU9khGTUX6R0ezpvsbpLqA==@vger.kernel.org, AJvYcCVNx4UpMpywMAUAUFI3E2B7viZa7AJRmETEkOIzpPHTlKg+R/CtEVm9pfYbQMTFbwNNq/nYUUUJJ2/u@vger.kernel.org, AJvYcCWL5jEFt6GlOnso7d4G6rkSpxqbZpvJ3qk0zEhU2BWeBBG56u1oIRriLmnwVyAW9TR1HbSe3M47r3S4@vger.kernel.org, AJvYcCWLEQvGuLbbK3zbphkwiAsmXkLBHS0tIgGqGaQX0mR1Tz+ZsUajEsFxdFS8R8PFcGtpC35sv5C/wZ5V0Jlp@vger.kernel.org, AJvYcCWLvS4B6RH49SYc83AjSRPkotR+rHbQ+n6lrvNOvwP5ylXYbz46HUORD/yijJZwb3p6QLweXyjn@vger.kernel.org, AJvYcCX+Krirz/ol0gIQ+S268Sx90+rOrYd9wIMfZQWPavaPFNTpbloB94r6i4n4DJTSe0/zXbq1hitcq2g=@vger.kernel.org, AJvYcCXestpztd0JqOL6KlenZgRiBxQ+uITi9gXLvZVYV70WzUUus4W5VDiJipczL0e/3NZLDTjaKtlN1h+JIMY=@vger.kernel.org, AJvYcCXivYBnulxGzmepTusxdD7LMq4t3uAz
 laax3gv6QCw4AY7fxJkLDmQa9hglx29q/vb5ik3Dfg8z7Us2@vger.kernel.org
X-Gm-Message-State: AOJu0YxOh2B2AriiLxF0zJpAFUtNuETLcAO61D2EYnANwBA74i7EnI5q
	2GtAMApREzraOZsqAGlfHQpM4XHNUlX3h161HG/oi6lU3pJbaYREe7nyQa+FZp9PI5QroT77Z41
	+A3JZ2hhfWHmbcF5mnVIG9Ya3ZmI=
X-Google-Smtp-Source: AGHT+IGWKJrn++YBgDCSaI8RtF5NbSOLRBnLLd6z4rf2/IzbB7PGrSfzjRdpWTjZWr4Bqwzd+4ahYyocYMMp0nS+UFs=
X-Received: by 2002:a05:6902:2101:b0:e29:310a:6878 with SMTP id
 3f1490d57ef6-e3087a46b97mr4570767276.3.1730100799666; Mon, 28 Oct 2024
 00:33:19 -0700 (PDT)
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
In-Reply-To: <20241025-spirited-nocturnal-antelope-ce93dd-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 15:33:08 +0800
Message-ID: <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com>
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

Dear Marc,

Thank you for your comments,

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:24=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 25.10.2024 19:03:55, Ming Yu wrote:
> > Oh! I'm sorry about that I confused the packet size.
> > The NCT6694 bulk maximum packet size is 256 bytes,
> > and USB High speed bulk maximum packet size is 512 bytes.
> >
> > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=
=8825=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:08=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > On 25.10.2024 16:08:10, Ming Yu wrote:
> > > > > > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offs=
et, u16 length,
> > > > > > +                  u8 rd_idx, u8 rd_len, unsigned char *buf)
> > > > >
> > > > > why not make buf a void *?
> > > >
> > > > [Ming] I'll change the type in the next patch.
> > > >
> > > > >
> > > > > > +{
> > > > > > +     struct usb_device *udev =3D nct6694->udev;
> > > > > > +     unsigned char err_status;
> > > > > > +     int len, packet_len, tx_len, rx_len;
> > > > > > +     int i, ret;
> > > > > > +
> > > > > > +     mutex_lock(&nct6694->access_lock);
> > > > > > +
> > > > > > +     /* Send command packet to USB device */
> > > > > > +     nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> > > > > > +     nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> > > > > > +     nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) & =
0xFF;
> > > > > > +     nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_GET;
> > > > > > +     nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xFF;
> > > > > > +     nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8) =
& 0xFF;
> > > > > > +
> > > > > > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT=
_ENDPOINT),
> > > > > > +                        nct6694->cmd_buffer, CMD_PACKET_SZ, &t=
x_len,
> > > > > > +                        nct6694->timeout);
> > > > > > +     if (ret)
> > > > > > +             goto err;
> > > > > > +
> > > > > > +     /* Receive response packet from USB device */
> > > > > > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_=
ENDPOINT),
> > > > > > +                        nct6694->rx_buffer, CMD_PACKET_SZ, &rx=
_len,
> > > > > > +                        nct6694->timeout);
> > > > > > +     if (ret)
> > > > > > +             goto err;
> > > > > > +
> > > > > > +     err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Segmented reception of messages that exceed the size o=
f USB bulk
> > > > > > +      * pipe packets.
> > > > > > +      */
> > > > >
> > > > > The Linux USB stack can receive bulk messages longer than the max=
 packet size.
> > > >
> > > > [Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes for thi=
s MFD device.
> > > > The core will divide packet 256 bytes for high speed USB device, bu=
t
> > > > it is exceeds
> > > > the hardware limitation, so I am dividing it manually.
> > >
> > > You say the endpoint descriptor is correctly reporting it's max packe=
t
> > > size of 128, but the Linux USB will send packets of 256 bytes?
> >
> > [Ming] The endpoint descriptor is correctly reporting it's max packet
> > size of 256, but the Linux USB may send more than 256 (max is 512)
> > https://elixir.bootlin.com/linux/v6.11.5/source/drivers/usb/host/xhci-m=
em.c#L1446
>
> AFAIK according to the USB-2.0 spec the maximum packet size for
> high-speed bulk transfers is fixed set to 512 bytes. Does this mean that
> your device is a non-compliant USB device?

We will reduce the endpoint size of other interfaces to ensure that MFD dev=
ice
meets the USB2.0 spec. In other words, I will remove the code for manual
unpacking in the next patch.

>
> > > > > > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D pack=
et_len) {
> > > > > > +             if (len > nct6694->maxp)
> > > > > > +                     packet_len =3D nct6694->maxp;
> > > > > > +             else
> > > > > > +                     packet_len =3D len;
> > > > > > +
> > > > > > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, =
BULK_IN_ENDPOINT),
> > > > > > +                                nct6694->rx_buffer + nct6694->=
maxp * i,
> > > > > > +                                packet_len, &rx_len, nct6694->=
timeout);
> > > > > > +             if (ret)
> > > > > > +                     goto err;
> > > > > > +     }
> > > > > > +
> > > > > > +     for (i =3D 0; i < rd_len; i++)
> > > > > > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx];
> > > > >
> > > > > memcpy()?
> > > > >
> > > > > Or why don't you directly receive data into the provided buffer? =
Copying
> > > > > of the data doesn't make it faster.
> > > > >
> > > > > On the other hand, receiving directly into the target buffer mean=
s the
> > > > > target buffer must not live on the stack.
> > > >
> > > > [Ming] Okay! I'll change it to memcpy().
> > >
> > > fine!
> > >
> > > > This is my perspective: the data is uniformly received by the rx_bf=
fer held
> > > > by the MFD device. does it need to be changed?
> > >
> > > My question is: Why do you first receive into the nct6694->rx_buffer =
and
> > > then memcpy() to the buffer provided by the caller, why don't you
> > > directly receive into the memory provided by the caller?
> >
> > [Ming] Due to the bulk pipe maximum packet size limitation, I think con=
sistently
> > using the MFD'd dynamically allocated buffer to submit URBs will better
> > manage USB-related operations
>
> The non-compliant max packet size limitation is unrelated to the
> question which RX or TX buffer to use.

I think these two USB functions can be easily called using the buffer
dynamically
allocated by the MFD. However, if they transfer data directly to the
target buffer,
they must ensure that it is not located on the stack.

>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

Ming

