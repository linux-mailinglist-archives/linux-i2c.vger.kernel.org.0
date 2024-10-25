Return-Path: <linux-i2c+bounces-7580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9809B00D2
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 13:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73E71F2618E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 11:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E321FAF17;
	Fri, 25 Oct 2024 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnBbxL9Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF44D18F2F7;
	Fri, 25 Oct 2024 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729854250; cv=none; b=lqFeSKjkDh9P2PWVFsPRHVht4/jXrgg1gIgkQNU15zjC6E+AJM6QRzLdnleHK2X7CUXWSA4UzE+XeX7/91mr7fwGCNoE4SNtiSLy8k+U2/sYK5VMh86nj7PwYwZ/927hl1rOQ/QEAD8ck0Ist7jq6XzaJoQHMD3YvsIoW1+WPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729854250; c=relaxed/simple;
	bh=l8EQXAQI7ujXOwIFT3aw6gviWUbOrsdN5NE8KtC1dys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWWeRoMtpgpLA+54AlERQSuVbxuNYh860WbOAoM8oEmfQXescQWXFYdVN3jlyXPSb464VL5eSAEAibeoJYel5wvJmScMeG0uM/685XDdKDv6/rSHBIMjhAKohtedyMRrSRVLBZVQgPDaoOtEXkUndl56FiZ8ddQRCp2cxjqUpak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnBbxL9Z; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2918664a3fso1772768276.0;
        Fri, 25 Oct 2024 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729854246; x=1730459046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V50wE1iFCHdbnj6unCESWwvx04Dw56wN4cPix727VI=;
        b=FnBbxL9ZU6r60Doomh7ZJeXNUysTK+4LvylY/IXIgKGduQqvd4PgwZ93AXB/mc1MLX
         EeaGOS2AjSkvtYkMOO/5QIkf6JBFuCz5eKyapbprwzlMfwnJ1iS35OEK+gocLmmpJu7V
         LbpFvOxrb4mJ1UmIOguf2ZEOmiLDpTtwBlxr8n1Qfyk6b/gZ5j59l1OBJha1g2pgylfO
         Oe4yZt6ewREls5EXOBfNQCSvyDe/CG2/s23jwGF5DCVc7djdUtJwrswO999bhLSdUSce
         m+ETfJoIanf6Zr6X8QkdnY7vQAbrrA4qYHVLLpx5ASasA4risOMMxvAT+HkNWHScKKec
         fRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854246; x=1730459046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V50wE1iFCHdbnj6unCESWwvx04Dw56wN4cPix727VI=;
        b=i96P7LfjWLVDtUhvr5m1GopCWW+cLjityeX8DuJAAygJGc01xlqXkB2qgQzvsN0pnV
         ZkfKKwalB2eh7nBBqTn9YaylnuSjcDCoFmWEmBj1KcTs5Uf4sPgkr5VeJ5fnAx+lofgL
         6SZQOLrM7L/O5rWrA64PjrdThwlQolYvvUBExNhqXPrg0VDH8YaziZ2cu6NQj3mZ3JTL
         RT/4MmvBjMqL6uZA7r+D8nlr/bP4cKlqmL+1m97Uy1UKmq5CluNoAflFRlNsGwFUvwXc
         kaVyMDhex5NA3elbSK5lgrdSCQkGkt7JWM/821BByghPFBwUUNfvX3GSEW92Tyva8I6l
         M+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCU+st3GLH1rsXwL6dArRBxnGifT9KrxICQC1k/N36YRZ2uT889OWVB0PvNbinC2DqjkQQPJmM6kTTA=@vger.kernel.org, AJvYcCVC8JDU3a/OKplQ6f5mK1NOLSw63PcCERtsn4LevHjlX2TRGqyZecpz4oZFrUMdpM2S5OKDV28U1WLziw==@vger.kernel.org, AJvYcCWFvdkWHvVsOR6MXMxEemRCYomIwki3EPcwY0yLGpVwGsXkKJ5GQkzItdkJskhGcJIfWzWG8XinB2OV4jk=@vger.kernel.org, AJvYcCWL93t+D2jBDT9RmAvP1zvy4bbe9Qk9YkDBPJuuy/GwlPYwXPY+nR9hhn1XigqAc32Z/jeveGCqHLyD@vger.kernel.org, AJvYcCWNfql0vBD5NwOII2o7/qD97w7HE71CI6klGMd9IWheJharpGr6jJMB4TpQZjc4a1StbsdxUVeMYzUn@vger.kernel.org, AJvYcCWk5Lzbn0+jWn8abITO9lJ1UucARq2KuyPkmV0bcYct5dXNAQumdU2OzRcyizaUefHO+mSCIIRfyEJY@vger.kernel.org, AJvYcCWkxTaRFgaNQrevjVawqKDfFBXxWKrXxJlldonmzkVS8OWCvrzJSzuoQ8v7ji3Z1vOd+OJoN5Y1@vger.kernel.org, AJvYcCWmvyFJa+8sA3QsRJFfuc+dlhiqRqNJa9AsQ57VwliZKkBxewI83AKT5aMMrIjnTJzCVfqoOGRd67Q+FQK7Wr0=@vger.kernel.org, AJvYcCWpNrmejnt2GmJrF2XwCcIpoKvaWCZSQzlH2pbUGforkjyGE2J64Aaq9pD4ozc/lKZnNPgpevYUOfim@vger.kernel.org, AJvYcCX48nT0/CueBnJOCCqupc2xzev60sPIAJOS
 A278XPvrZNB1XulnYUWYJjsT32lzAMd/N9vJVGt/1qEXDfUL@vger.kernel.org
X-Gm-Message-State: AOJu0YzRCoP8RbYkwFCy7LNQWVhcsdBRZNsCAVLj9QsTAxBxlO/JKxyt
	HRgC6zstKeBww8RSdwL4wq2Le4BEZLMYyXKPB9KHzrGpdylKjxI80TBBF6mqZclNsgs+24GjFkC
	J2I0hRh0oz4SaE4Ge4Qvcja5L3q4=
X-Google-Smtp-Source: AGHT+IGxowdXgRZQzyf3hYzU1GeD5gWw/fSr+Lc/V+x36oSGKW+Vz5bn+lGvWuDmcvJCJdT/8o+ftWwey9LmoAKe3Qc=
X-Received: by 2002:a05:6902:2493:b0:e29:2560:914c with SMTP id
 3f1490d57ef6-e2ea8a41c3emr3487379276.9.1729854246550; Fri, 25 Oct 2024
 04:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <CAOoeyxUhnyYG3p+DQJG-tvU5vc5WYQZLLqCXW=uPcXTjq2gVfw@mail.gmail.com> <20241025-truthful-honest-newt-c371c8-mkl@pengutronix.de>
In-Reply-To: <20241025-truthful-honest-newt-c371c8-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 19:03:55 +0800
Message-ID: <CAOoeyxUEf5vjqL67WjR-DbrhE0==2hqHLEyZ5XEBhEfMfQ5pag@mail.gmail.com>
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

Oh! I'm sorry about that I confused the packet size.
The NCT6694 bulk maximum packet size is 256 bytes,
and USB High speed bulk maximum packet size is 512 bytes.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:08=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 25.10.2024 16:08:10, Ming Yu wrote:
> > > > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset, =
u16 length,
> > > > +                  u8 rd_idx, u8 rd_len, unsigned char *buf)
> > >
> > > why not make buf a void *?
> >
> > [Ming] I'll change the type in the next patch.
> >
> > >
> > > > +{
> > > > +     struct usb_device *udev =3D nct6694->udev;
> > > > +     unsigned char err_status;
> > > > +     int len, packet_len, tx_len, rx_len;
> > > > +     int i, ret;
> > > > +
> > > > +     mutex_lock(&nct6694->access_lock);
> > > > +
> > > > +     /* Send command packet to USB device */
> > > > +     nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> > > > +     nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> > > > +     nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) & 0xFF=
;
> > > > +     nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_GET;
> > > > +     nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xFF;
> > > > +     nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8) & 0x=
FF;
> > > > +
> > > > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_OUT_END=
POINT),
> > > > +                        nct6694->cmd_buffer, CMD_PACKET_SZ, &tx_le=
n,
> > > > +                        nct6694->timeout);
> > > > +     if (ret)
> > > > +             goto err;
> > > > +
> > > > +     /* Receive response packet from USB device */
> > > > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_IN_ENDP=
OINT),
> > > > +                        nct6694->rx_buffer, CMD_PACKET_SZ, &rx_len=
,
> > > > +                        nct6694->timeout);
> > > > +     if (ret)
> > > > +             goto err;
> > > > +
> > > > +     err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> > > > +
> > > > +     /*
> > > > +      * Segmented reception of messages that exceed the size of US=
B bulk
> > > > +      * pipe packets.
> > > > +      */
> > >
> > > The Linux USB stack can receive bulk messages longer than the max pac=
ket size.
> >
> > [Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes for this MF=
D device.
> > The core will divide packet 256 bytes for high speed USB device, but
> > it is exceeds
> > the hardware limitation, so I am dividing it manually.
>
> You say the endpoint descriptor is correctly reporting it's max packet
> size of 128, but the Linux USB will send packets of 256 bytes?

[Ming] The endpoint descriptor is correctly reporting it's max packet
size of 256, but the Linux USB may send more than 256 (max is 512)
https://elixir.bootlin.com/linux/v6.11.5/source/drivers/usb/host/xhci-mem.c=
#L1446

>
> >
> > >
> > > > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D packet_l=
en) {
> > > > +             if (len > nct6694->maxp)
> > > > +                     packet_len =3D nct6694->maxp;
> > > > +             else
> > > > +                     packet_len =3D len;
> > > > +
> > > > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK=
_IN_ENDPOINT),
> > > > +                                nct6694->rx_buffer + nct6694->maxp=
 * i,
> > > > +                                packet_len, &rx_len, nct6694->time=
out);
> > > > +             if (ret)
> > > > +                     goto err;
> > > > +     }
> > > > +
> > > > +     for (i =3D 0; i < rd_len; i++)
> > > > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx];
> > >
> > > memcpy()?
> > >
> > > Or why don't you directly receive data into the provided buffer? Copy=
ing
> > > of the data doesn't make it faster.
> > >
> > > On the other hand, receiving directly into the target buffer means th=
e
> > > target buffer must not live on the stack.
> >
> > [Ming] Okay! I'll change it to memcpy().
>
> fine!
>
> > This is my perspective: the data is uniformly received by the rx_bffer =
held
> > by the MFD device. does it need to be changed?
>
> My question is: Why do you first receive into the nct6694->rx_buffer and
> then memcpy() to the buffer provided by the caller, why don't you
> directly receive into the memory provided by the caller?

[Ming] Due to the bulk pipe maximum packet size limitation, I think consist=
ently
using the MFD'd dynamically allocated buffer to submit URBs will better
manage USB-related operations

>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

