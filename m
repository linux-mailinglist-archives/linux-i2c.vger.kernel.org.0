Return-Path: <linux-i2c+bounces-7633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28089B3292
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 15:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C33871C21E3B
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 14:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F271DB372;
	Mon, 28 Oct 2024 14:07:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7661DB95E
	for <linux-i2c@vger.kernel.org>; Mon, 28 Oct 2024 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124437; cv=none; b=JOIhqyXyUBcPdUn/wjD4VvozJRP96q6sIgS07BB0BUWazNTJDslg+/zaeioe7m85RdcFMwGh0ldksN4yQXbbpk8QWkc0ZY22CcNygtkWsHRZf/sjUK6QFc54yYBklXMuRxuH7DqfrYxxGWT8QQPFwXpQy0OqBBZJNCzc5OPH/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124437; c=relaxed/simple;
	bh=cphWtKkhhPCR0SL0T9ODiGPD3s6cDdHQ8iEsC3GcO3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvxqrLwmq0o/7Jy3nQs9L+8HdI0iYbPL9ClXDFhE6CHtJbO4raPCe4wcVSQWYKEMhcuJ00akstgD8FeyOiSBroBXGLUnSRMzja44zkZ6d4L068/9ogK/oxV6PVYSuH8d4CUQ+aYYAiZapXVy9umgj++Dix6VGiIgDV3NGPpmjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5QOJ-0001De-10; Mon, 28 Oct 2024 15:06:43 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5QOG-000rfn-1t;
	Mon, 28 Oct 2024 15:06:40 +0100
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 174A6360944;
	Mon, 28 Oct 2024 14:06:40 +0000 (UTC)
Date: Mon, 28 Oct 2024 15:06:39 +0100
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
Message-ID: <20241028-observant-gentle-doberman-0a2baa-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <CAOoeyxUhnyYG3p+DQJG-tvU5vc5WYQZLLqCXW=uPcXTjq2gVfw@mail.gmail.com>
 <20241025-truthful-honest-newt-c371c8-mkl@pengutronix.de>
 <CAOoeyxUEf5vjqL67WjR-DbrhE0==2hqHLEyZ5XEBhEfMfQ5pag@mail.gmail.com>
 <20241025-spirited-nocturnal-antelope-ce93dd-mkl@pengutronix.de>
 <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com>
 <20241028-uptight-modest-puffin-0556e7-mkl@pengutronix.de>
 <CAOoeyxU1r3ayhNWrbE_muDhA0imfZYX3-UHxSen9TqsTrSsxyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2vg3oknj3uphvbvf"
Content-Disposition: inline
In-Reply-To: <CAOoeyxU1r3ayhNWrbE_muDhA0imfZYX3-UHxSen9TqsTrSsxyA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--2vg3oknj3uphvbvf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 28.10.2024 16:31:25, Ming Yu wrote:
> > > > > > > > The Linux USB stack can receive bulk messages longer than t=
he max packet size.
> > > > > > >
> > > > > > > [Ming] Since NCT6694's bulk pipe endpoint size is 128 bytes f=
or this MFD device.
> > > > > > > The core will divide packet 256 bytes for high speed USB devi=
ce, but
> > > > > > > it is exceeds
> > > > > > > the hardware limitation, so I am dividing it manually.
> > > > > >
> > > > > > You say the endpoint descriptor is correctly reporting it's max=
 packet
> > > > > > size of 128, but the Linux USB will send packets of 256 bytes?
> > > > >
> > > > > [Ming] The endpoint descriptor is correctly reporting it's max pa=
cket
> > > > > size of 256, but the Linux USB may send more than 256 (max is 512)
> > > > > https://elixir.bootlin.com/linux/v6.11.5/source/drivers/usb/host/=
xhci-mem.c#L1446
> > > >
> > > > AFAIK according to the USB-2.0 spec the maximum packet size for
> > > > high-speed bulk transfers is fixed set to 512 bytes. Does this mean=
 that
> > > > your device is a non-compliant USB device?
> > >
> > > We will reduce the endpoint size of other interfaces to ensure that M=
FD device
> > > meets the USB2.0 spec. In other words, I will remove the code for man=
ual
> > > unpacking in the next patch.
> >
> > I was not talking about the driver, but your USB device. According to
> > the USB2.0 spec, the packet size is fixed to 512 for high-speed bulk
> > transfers. So your device must be able to handle 512 byte transfers or
> > it's a non-compliant USB device.
>=20
> I understand. Therefore, the USB device's firmware will be modified to su=
pport
> bulk pipe size of 512 bytes to comply with the USB 2.0 spec.

Then you don't need manual segmentation of bulk transfers anymore!

> > > > > > > > > +     for (i =3D 0, len =3D length; len > 0; i++, len -=
=3D packet_len) {
> > > > > > > > > +             if (len > nct6694->maxp)
> > > > > > > > > +                     packet_len =3D nct6694->maxp;
> > > > > > > > > +             else
> > > > > > > > > +                     packet_len =3D len;
> > > > > > > > > +
> > > > > > > > > +             ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(=
udev, BULK_IN_ENDPOINT),
> > > > > > > > > +                                nct6694->rx_buffer + nct=
6694->maxp * i,
> > > > > > > > > +                                packet_len, &rx_len, nct=
6694->timeout);
> > > > > > > > > +             if (ret)
> > > > > > > > > +                     goto err;
> > > > > > > > > +     }
> > > > > > > > > +
> > > > > > > > > +     for (i =3D 0; i < rd_len; i++)
> > > > > > > > > +             buf[i] =3D nct6694->rx_buffer[i + rd_idx];
> > > > > > > >
> > > > > > > > memcpy()?
> > > > > > > >
> > > > > > > > Or why don't you directly receive data into the provided bu=
ffer? Copying
> > > > > > > > of the data doesn't make it faster.
> > > > > > > >
> > > > > > > > On the other hand, receiving directly into the target buffe=
r means the
> > > > > > > > target buffer must not live on the stack.
> > > > > > >
> > > > > > > [Ming] Okay! I'll change it to memcpy().
> > > > > >
> > > > > > fine!
> > > > > >
> > > > > > > This is my perspective: the data is uniformly received by the=
 rx_bffer held
> > > > > > > by the MFD device. does it need to be changed?
> > > > > >
> > > > > > My question is: Why do you first receive into the nct6694->rx_b=
uffer and
> > > > > > then memcpy() to the buffer provided by the caller, why don't y=
ou
> > > > > > directly receive into the memory provided by the caller?
> > > > >
> > > > > [Ming] Due to the bulk pipe maximum packet size limitation, I thi=
nk consistently
> > > > > using the MFD'd dynamically allocated buffer to submit URBs will =
better
> > > > > manage USB-related operations
> > > >
> > > > The non-compliant max packet size limitation is unrelated to the
> > > > question which RX or TX buffer to use.
> > >
> > > I think these two USB functions can be easily called using the buffer
> > > dynamically
> > > allocated by the MFD. However, if they transfer data directly to the
> > > target buffer,
> > > they must ensure that it is not located on the stack.
> >
> > You have a high coupling between the MFD driver and the individual
> > drivers anyways, so why not directly use the dynamically allocated
> > buffer provided by the caller and get rid of the memcpy()?
>=20
> Okay! I will provide a function to request and free buffer for child devi=
ces,
> and update the caller's variables to use these two functions in the next =
patch.

I don't see a need to provide dedicated function to allocate and free
the buffers. The caller can allocate them as part of their private data,
or allocate them during probe().

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2vg3oknj3uphvbvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcfmm0ACgkQKDiiPnot
vG/OvQf+OF2IzP8yZ65Ke0Cq9hXkJZCpDCF4vKc3f2pLJQ/RjGNeubOY0v36mFwD
5tZBs5Y7Md645uvjFh9VNg8YzW45+0dnzgzjGC28wj7hZpAW+yxnjNJ0zdpfBOPF
pdwcIa8OLdqZ6exM1yGAyzV/en/klaL3oHu6RB8TmEMig/NQljdIF9nyslaqIAa4
T1f+B7NmyH4nauAdBBhAOheqdJiO+eciscoFtxmOh4U5PQqGqR7VoBhkWrkx3JD1
CqF6D9sNT+SP91/wuNPin6n85l/YDxSFkiKBG59p2do0l/vcwcWQ0denp4PT0dhk
ZBpf0j8jPbNWS+ad8NpEyLE42beDRw==
=o2YF
-----END PGP SIGNATURE-----

--2vg3oknj3uphvbvf--

