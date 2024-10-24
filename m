Return-Path: <linux-i2c+bounces-7540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF39AE43B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 13:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8829A1C21975
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2E01D049D;
	Thu, 24 Oct 2024 11:57:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E11C2301
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771065; cv=none; b=SXQpgt9e6/SSlNbnuPy7XQfrXv0FfYN/pGqSjQYXvRy43oROQHxK9xOGKos1Jp2KCmAkLqqaxHJcz7rLHpXAxlqFzVCb0O1SuI20G/FxNmHUDaxRNEMfJ36Sr7VxhJcObqHgY3StQ2w0K2K1BxXUDiXCQSMRuTlHN8WywSuw0iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771065; c=relaxed/simple;
	bh=xQYxe7sjyZTc37ZPzLZnD6uz/KCg9q/JpxCVwCz3ijM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk4h6lK4uoC+1whcHP+O5HfW+PqaM1u5YzoZ59sUuXFSjFqJ+Jx291My6PS+h7XjRv08SC+sa6CjrifgpDP6LTjA28WAL7FZVTxsdKCidmnqEBkOSqnS0nEhUOFHliVFkpkB7WEkt0fOOiFWWWapMUqfnOPBr9M0mD2wVMgtD8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3wSl-0003oy-3Z; Thu, 24 Oct 2024 13:57:11 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3wSi-000BqW-1C;
	Thu, 24 Oct 2024 13:57:08 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E7B1635DAA6;
	Thu, 24 Oct 2024 11:57:07 +0000 (UTC)
Date: Thu, 24 Oct 2024 13:57:07 +0200
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
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
Message-ID: <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="blu56gx3jhnaziml"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-1-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--blu56gx3jhnaziml
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
MIME-Version: 1.0

On 24.10.2024 16:59:13, Ming Yu wrote:
> This patch series introduces support for Nuvoton NCT6694, a peripheral
> expander based on USB interface. It models the chip as an MFD driver
> (1/9), GPIO driver(2/9), I2C Adapter driver(3/9), CANfd driver(4/9),
> WDT driver(5/9), HWMON driver(6/9), IIO driver(7/9), PWM driver(8/9),
> and RTC driver(9/9).
>=20
> The MFD driver implements USB device functionality to issue
> custom-define USB bulk pipe packets for NCT6694. Each child device can
> use the USB functions nct6694_read_msg() and nct6694_write_msg() to issue
> a command. They can also register a handler function that will be called
> when the USB device receives its interrupt pipe.

What about implementing a proper IRQ demux handler instead?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--blu56gx3jhnaziml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaNhAACgkQKDiiPnot
vG87/wf9FJMF3SXXDzY25O6vuNVJyis/VDnwW4GtX0mAzuSYUFfRD/6oWOr7tJbT
C7JyM5vxh7TVTcs1oLrKz4ufgFBzB9UtRZxOZ8WezObY5mrL51ZMVGKnACPeVwSL
S76wiGoGTk82k+K7kH7i1mKJ4vfo9X9W6buVqbALyeVxwmkAKG3tZV6s0e7vh26E
NFaYMTOQ9APdNH5s8UNA5xLkkJ7YzbEfPvaXPj7fobf7wRtrO1LnP7LoQQ83f1M1
zCEbqXF8onDNWc2EIheF91B0zIQMdLoYwEY/LOr5hvPedIKHv/9o5LjJ3F1KRG8u
omjKBgvpX105+g3z8BZzSRTe7PPBVg==
=Qdfl
-----END PGP SIGNATURE-----

--blu56gx3jhnaziml--

