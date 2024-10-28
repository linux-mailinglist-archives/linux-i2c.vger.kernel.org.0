Return-Path: <linux-i2c+bounces-7625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF69B29AA
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A8701F25F38
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BB01D7E37;
	Mon, 28 Oct 2024 07:53:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABD1D6DA9
	for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102001; cv=none; b=GR7QYLNAm2199SvF4Mtjw3oR0fUy11FgJgvMSvoE9jXA/BLOfokJ5g1H0nIw+XopYtJ1d3QscJuLv1HRF2HC/MHx1r+R8D93pzdXI8zxrkc9huFmLK9ORRUyYRxCJMZWEV+nsoyjKsnvJ27CpanAN5Fch26Zphqrp1oIcnmovLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102001; c=relaxed/simple;
	bh=uRuNcgciLN6H+LUSfpnVD0oiRB6Y+NvdwzjW+sz/xB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uErAEIO7ph+4EHVrPyhF7coYJRsNWew9h/ywoAeNgGroDsNKOptXiGPrQ4ReVK4pK+TgvE7LKk37su7yae48JrherCDHcbNcdBRI912zieHeobXa22/+Y5mEbEONdQ5SZXSOYSdz5QH23/UfA6cbyII9TbsYNKmpJ2tkD4Ya1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5KYG-0005Tu-Lj; Mon, 28 Oct 2024 08:52:36 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5KYD-000oSF-2f;
	Mon, 28 Oct 2024 08:52:33 +0100
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 3D537360476;
	Mon, 28 Oct 2024 07:52:33 +0000 (UTC)
Date: Mon, 28 Oct 2024 08:52:31 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20241028-uptight-modest-puffin-0556e7-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <CAOoeyxUhnyYG3p+DQJG-tvU5vc5WYQZLLqCXW=uPcXTjq2gVfw@mail.gmail.com>
 <20241025-truthful-honest-newt-c371c8-mkl@pengutronix.de>
 <CAOoeyxUEf5vjqL67WjR-DbrhE0==2hqHLEyZ5XEBhEfMfQ5pag@mail.gmail.com>
 <20241025-spirited-nocturnal-antelope-ce93dd-mkl@pengutronix.de>
 <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tgqj5lxpl3ykc3a6"
Content-Disposition: inline
In-Reply-To: <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--tgqj5lxpl3ykc3a6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 28.10.2024 15:33:08, Ming Yu wrote:
> Dear Marc,
>=20
> Thank you for your comments,
>=20
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
25=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:24=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On 25.10.2024 19:03:55, Ming Yu wrote:
> > > Oh! I'm sorry about that I confused the packet size.
> > > The NCT6694 bulk maximum packet size is 256 bytes,
> > > and USB High speed bulk maximum packet size is 512 bytes.
> > >
> > > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=
=9C=8825=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:08=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > >
> > > > On 25.10.2024 16:08:10, Ming Yu wrote:
> > > > > > > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 of=
fset, u16 length,
> > > > > > > +                  u8 rd_idx, u8 rd_len, unsigned char *buf)
> > > > > >
> > > > > > why not make buf a void *?
> > > > >
> > > > > [Ming] I'll change the type in the next patch.
> > > > >
> > > > > >
> > > > > > > +{
> > > > > > > +     struct usb_device *udev =3D nct6694->udev;
> > > > > > > +     unsigned char err_status;
> > > > > > > +     int len, packet_len, tx_len, rx_len;
> > > > > > > +     int i, ret;
> > > > > > > +
> > > > > > > +     mutex_lock(&nct6694->access_lock);
> > > > > > > +
> > > > > > > +     /* Send command packet to USB device */
> > > > > > > +     nct6694->cmd_buffer[REQUEST_MOD_IDX] =3D mod;
> > > > > > > +     nct6694->cmd_buffer[REQUEST_CMD_IDX] =3D offset & 0xFF;
> > > > > > > +     nct6694->cmd_buffer[REQUEST_SEL_IDX] =3D (offset >> 8) =
& 0xFF;
> > > > > > > +     nct6694->cmd_buffer[REQUEST_HCTRL_IDX] =3D HCTRL_GET;
> > > > > > > +     nct6694->cmd_buffer[REQUEST_LEN_L_IDX] =3D length & 0xF=
F;
> > > > > > > +     nct6694->cmd_buffer[REQUEST_LEN_H_IDX] =3D (length >> 8=
) & 0xFF;
> > > > > > > +
> > > > > > > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, BULK_O=
UT_ENDPOINT),
> > > > > > > +                        nct6694->cmd_buffer, CMD_PACKET_SZ, =
&tx_len,
> > > > > > > +                        nct6694->timeout);
> > > > > > > +     if (ret)
> > > > > > > +             goto err;
> > > > > > > +
> > > > > > > +     /* Receive response packet from USB device */
> > > > > > > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, BULK_I=
N_ENDPOINT),
> > > > > > > +                        nct6694->rx_buffer, CMD_PACKET_SZ, &=
rx_len,
> > > > > > > +                        nct6694->timeout);
> > > > > > > +     if (ret)
> > > > > > > +             goto err;
> > > > > > > +
> > > > > > > +     err_status =3D nct6694->rx_buffer[RESPONSE_STS_IDX];
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * Segmented reception of messages that exceed the size=
 of USB bulk
> > > > > > > +      * pipe packets.
> > > > > > > +      */
> > > > > >
> > > > > > The Linux USB stack can receive bulk messages longer than the m=
ax packet size.
> > > > >
> > > > > [Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes for t=
his MFD device.
> > > > > The core will divide packet 256 bytes for high speed USB device, =
but
> > > > > it is exceeds
> > > > > the hardware limitation, so I am dividing it manually.
> > > >
> > > > You say the endpoint descriptor is correctly reporting it's max pac=
ket
> > > > size of 128, but the Linux USB will send packets of 256 bytes?
> > >
> > > [Ming] The endpoint descriptor is correctly reporting it's max packet
> > > size of 256, but the Linux USB may send more than 256 (max is 512)
> > > https://elixir.bootlin.com/linux/v6.11.5/source/drivers/usb/host/xhci=
-mem.c#L1446
> >
> > AFAIK according to the USB-2.0 spec the maximum packet size for
> > high-speed bulk transfers is fixed set to 512 bytes. Does this mean that
> > your device is a non-compliant USB device?
>=20
> We will reduce the endpoint size of other interfaces to ensure that MFD d=
evice
> meets the USB2.0 spec. In other words, I will remove the code for manual
> unpacking in the next patch.

I was not talking about the driver, but your USB device. According to
the USB2.0 spec, the packet size is fixed to 512 for high-speed bulk
transfers. So your device must be able to handle 512 byte transfers or
it's a non-compliant USB device.

> > > > > > > +     for (i =3D 0, len =3D length; len > 0; i++, len -=3D pa=
cket_len) {
> > > > > > > +             if (len > nct6694->maxp)
> > > > > > > +                     packet_len =3D nct6694->maxp;
> > > > > > > +             else
> > > > > > > +                     packet_len =3D len;
> > > > > > > +
> > > > > > > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev=
, BULK_IN_ENDPOINT),
> > > > > > > +                                nct6694->rx_buffer + nct6694=
->maxp * i,
> > > > > > > +                                packet_len, &rx_len, nct6694=
->timeout);
> > > > > > > +             if (ret)
> > > > > > > +                     goto err;
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     for (i =3D 0; i < rd_len; i++)
> > > > > > > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx];
> > > > > >
> > > > > > memcpy()?
> > > > > >
> > > > > > Or why don't you directly receive data into the provided buffer=
? Copying
> > > > > > of the data doesn't make it faster.
> > > > > >
> > > > > > On the other hand, receiving directly into the target buffer me=
ans the
> > > > > > target buffer must not live on the stack.
> > > > >
> > > > > [Ming] Okay! I'll change it to memcpy().
> > > >
> > > > fine!
> > > >
> > > > > This is my perspective: the data is uniformly received by the rx_=
bffer held
> > > > > by the MFD device. does it need to be changed?
> > > >
> > > > My question is: Why do you first receive into the nct6694->rx_buffe=
r and
> > > > then memcpy() to the buffer provided by the caller, why don't you
> > > > directly receive into the memory provided by the caller?
> > >
> > > [Ming] Due to the bulk pipe maximum packet size limitation, I think c=
onsistently
> > > using the MFD'd dynamically allocated buffer to submit URBs will bett=
er
> > > manage USB-related operations
> >
> > The non-compliant max packet size limitation is unrelated to the
> > question which RX or TX buffer to use.
>=20
> I think these two USB functions can be easily called using the buffer
> dynamically
> allocated by the MFD. However, if they transfer data directly to the
> target buffer,
> they must ensure that it is not located on the stack.

You have a high coupling between the MFD driver and the individual
drivers anyways, so why not directly use the dynamically allocated
buffer provided by the caller and get rid of the memcpy()?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tgqj5lxpl3ykc3a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcfQrsACgkQKDiiPnot
vG+y6Qf+LsUrLN3ZvfGpaVYBscZ/y3t/PN8lGzDrq/pCLCmcuTPJn5gsoyn0J2UB
zkBbPchIYFx2OlRMWmJgziUbB++9kHaSadv2CGianvW8UhijPyvaynRxAPdZsODt
P8Dp7k8+YTg0iPRulvx2iqnKDz6mbEU1jrDrA3fNFuwXD/CDbmYdH2K+jhtJkjte
INduFkcgnxYebzh/zEV8In9IKRWySxehjKYOSg39/a+qUSzVBJt5tfj4wKlrbNwy
2RFUThOMzwK0L6GQ8SclmjK1QukGRj0b2zHtD9QdwjQG7nk4yjQP26Ekz74hIQ24
t24XPUTH38rcDKJrmqkUnqe7aqP6CA==
=biVA
-----END PGP SIGNATURE-----

--tgqj5lxpl3ykc3a6--

