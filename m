Return-Path: <linux-i2c+bounces-7574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B939AFCAF
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D7361C20DB1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926731CF7C9;
	Fri, 25 Oct 2024 08:36:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769B1D1E92
	for <linux-i2c@vger.kernel.org>; Fri, 25 Oct 2024 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845368; cv=none; b=Bn9oRkAGPJDJI99tUmcVAENaMk8gEOq0faEjeBdV+2Tw5dLdOE8s2QFX265lknzXzem+4UOmlOZuWhJfIwpkuoipq4PM8/SImPenbrN373NsDdvu0HkmJ7R3u5M2ChOnHucu/OnzhRL3xSLDSJalCE4/JfpuUiQj0hj6BoWDyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845368; c=relaxed/simple;
	bh=rDNzoAVAQ7d9KvhiOmytKGL5nTR62o+4UNsL3k6X9+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwDcoOwLGzuJzysk6SDptu+MmfOHeW+dFaXeuRXphaEBQZZTTwFSjBo9gwR1Ob3FdePwNTyrkriCjmw7Ci4tEHBxRMQYB0vyCifog5MRBJFKjzIukDbQG6Lal+uy1toUrIlI3hi+Hp9MiUN4b/nbTR6W8TJPCV1BiCSaQ3JS+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t4FnF-0007rX-1Y; Fri, 25 Oct 2024 10:35:37 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t4FnE-000Kpw-1k;
	Fri, 25 Oct 2024 10:35:36 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1313335E80B;
	Fri, 25 Oct 2024 08:35:36 +0000 (UTC)
Date: Fri, 25 Oct 2024 10:35:35 +0200
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
Message-ID: <20241025-sexy-fanatic-snail-a1d2e7-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <20241024-pumpkin-parrot-of-excellence-299c57-mkl@pengutronix.de>
 <CAOoeyxXX2fpHVJ8urLmy+pBjH1aRdYu6qrtwOmwUxTUyQq30DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7vgtm2p2hvbpfjse"
Content-Disposition: inline
In-Reply-To: <CAOoeyxXX2fpHVJ8urLmy+pBjH1aRdYu6qrtwOmwUxTUyQq30DA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--7vgtm2p2hvbpfjse
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 25.10.2024 16:14:03, Ming Yu wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
24=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On 24.10.2024 17:20:57, Marc Kleine-Budde wrote:
> >
> > [...]
> >
> > > > +   nct6694->cmd_buffer =3D devm_kcalloc(dev, CMD_PACKET_SZ,
> > > > +                                      sizeof(unsigned char), GFP_K=
ERNEL);
> > > > +   if (!nct6694->cmd_buffer)
> > > > +           return -ENOMEM;
> > > > +   nct6694->rx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > > > +                                     sizeof(unsigned char), GFP_KE=
RNEL);
> > > > +   if (!nct6694->rx_buffer)
> > > > +           return -ENOMEM;
> > > > +   nct6694->tx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > > > +                                     sizeof(unsigned char), GFP_KE=
RNEL);
> > > > +   if (!nct6694->tx_buffer)
> > > > +           return -ENOMEM;
> > > > +   nct6694->int_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > > > +                                      sizeof(unsigned char), GFP_K=
ERNEL);
> > > > +   if (!nct6694->int_buffer)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > > > +   if (!nct6694->int_in_urb) {
> > > > +           dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
> > > > +           return -ENOMEM;
> > > > +   }
> > > > +
> > > > +   /* Bulk pipe maximum packet for each transaction */
> > > > +   bulk_pipe =3D usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
> > > > +   nct6694->maxp =3D usb_maxpacket(udev, bulk_pipe);
> > > > +
> > > > +   mutex_init(&nct6694->access_lock);
> > > > +   nct6694->udev =3D udev;
> > > > +   nct6694->timeout =3D URB_TIMEOUT; /* Wait until urb complete */
> > > > +
> > > > +   INIT_LIST_HEAD(&nct6694->handler_list);
> > > > +   spin_lock_init(&nct6694->lock);
> > > > +
> > > > +   usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> > > > +                    nct6694->int_buffer, maxp, usb_int_callback,
> > > > +                    nct6694, int_endpoint->bInterval);
> > > > +   ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> > > > +   if (ret)
> > > > +           goto err_urb;
> > > > +
> > > > +   dev_set_drvdata(&udev->dev, nct6694);
> > > > +   usb_set_intfdata(iface, nct6694);
> > > > +
> > > > +   ret =3D mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
> > > > +                                 ARRAY_SIZE(nct6694_dev));
> > > > +   if (ret) {
> > > > +           dev_err(&udev->dev, "Failed to add mfd's child device\n=
");
> > > > +           goto err_mfd;
> > > > +   }
> > > > +
> > > > +   nct6694->async_workqueue =3D alloc_ordered_workqueue("asyn_work=
queue", 0);
> > >
> > > Where is the async_workqueue used?
> >
> > Sorry - it's used in the driver, which live in separate directories -
> > you can ignore this comment.
> >
> > But then the question comes up, it looks racy to _first_ add the devices
> > and _then_ the workqueue.

> Excuse me, I'm a bit confused. Is there anything I need to
> improve on?

It looks racy to _first_ add the devices and _then_ the workqueue.

So the obvious solution is to allocate the worklist first and then add
the devices.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--7vgtm2p2hvbpfjse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcbWFQACgkQKDiiPnot
vG8m/Qf+LrYDKh2wc2OiqqbICoYJhzy3dfrepHuhn4A2ce4XC6Go2FCD3qi85XhM
j4ekvJKYU8XLtLWOHSxPp0nmsWXXHZnIc5sYSon9aTFaAdwmhxtUhsF32XYK71iz
OlLLWNUHqPXhjzU5SBvALysRP7Hmz1wIe+mqTDX3wHS/P51Xxr4h/hEbHs0OeBUa
EttXTFIg9Lkn69Jg9EReMhgXZOhotZ5GpBx/ZXVt89nDUKczGH8ywHy3wX6a4TFD
fHTDr0qHcO/2x9ZzMKwGo8M4vxtp7yoTY9zlD4X+sMBXcYb7/OL7Hdpz/wCBzP+r
GrgqFlm+xuN9eH3oha9j8maht2HgDg==
=1/zE
-----END PGP SIGNATURE-----

--7vgtm2p2hvbpfjse--

