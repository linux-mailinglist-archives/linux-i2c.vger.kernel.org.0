Return-Path: <linux-i2c+bounces-10057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A66A74611
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 10:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAEF47A7029
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 09:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A475D213255;
	Fri, 28 Mar 2025 09:11:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCD21147B
	for <linux-i2c@vger.kernel.org>; Fri, 28 Mar 2025 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153113; cv=none; b=t7Oy4fVppKn/FjeRpqZtYdST51kzq4PEANXcCScpMO9SmSCuXokMVbdy3o84SgO7zT/Q3IccVJbbLQazab3QYx56KC+6oWZ9hMvlD521L9c05O5JUHkUNxLQX6hbjP8Sn+evVMLkWPnh+5pumURmmnwnir60i5zi3evTGRn2jRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153113; c=relaxed/simple;
	bh=pbIVsVcuNi+0DDbMVyNw26SOB82vpubAP8F0r7NBXg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tD5+pzu+BB23PZmh1xEgGU5jfsJOWOcKDIRDj60N2NZuNqkoC1usUQb4IHDZCM0KXkfV/msyJFn2HtHp0mwLjjWdE39x07o9+vm5fH7Vt1uXenvj5slVZipSf820x5lefc2zCHxvZQsnuJZrVEcNOIASuTsZEyobJDYa0llebU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ty5kJ-0005uZ-G0; Fri, 28 Mar 2025 10:11:23 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ty5kG-0024gm-2N;
	Fri, 28 Mar 2025 10:11:20 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 5804A3E86D3;
	Fri, 28 Mar 2025 09:11:20 +0000 (UTC)
Date: Fri, 28 Mar 2025 10:11:19 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250328-gentle-dangerous-raptor-2b66fa-mkl@pengutronix.de>
References: <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
 <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
 <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
 <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
 <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com>
 <20250327-awesome-mutant-cuscus-0f0314-mkl@pengutronix.de>
 <CAOoeyxWa5sB+YS6W=oG7xUeizXxigkdw3b=7w9aGftCWzWsw2A@mail.gmail.com>
 <20250328-smart-thundering-asp-2536b0-mkl@pengutronix.de>
 <CAOoeyxWy7n32iD03sr+8jPwf5OpHaCe_itkRnzOQK8GC32A9+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tzr33nw7euhn5lwq"
Content-Disposition: inline
In-Reply-To: <CAOoeyxWy7n32iD03sr+8jPwf5OpHaCe_itkRnzOQK8GC32A9+A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--tzr33nw7euhn5lwq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 28.03.2025 16:57:46, Ming Yu wrote:
> > > > Does your device support CAN-CC only mode?
> > >
> > > It can dynamically switch between CAN-CC and CAN-FD mode when
> > > trasmitting or receiving, depending on whether the nct6694_can_frame
> > > passs the flag with NCT6694_CAN_FRAME_FLAG_FD.
> >
> > Ok, but what about the receive path? Does the device support CAN-CC only
> > mode? Will it throw an error, if it receives a CAN-FD frame?
>=20
> No, it can receive both CAN-CC and CAN-FD frames, if the hardware
> receives a CAN-FD frame, the firmware will set the
> NCT6694_CAN_FRAME_FLAG_FD flag.

Ok, then set the CAN-FD ctrl mode static.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tzr33nw7euhn5lwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfmZ7UACgkQDHRl3/mQ
kZwYtQf/c7cT0KfIOS3YnlbxRmDPcKbxtcH25rhCTmL7CvrAnktrR9i0DzB+7vkt
BwE/PZmyu3XSHeCbvfd/Di0Zddu9NxXyFTe32yXpA3s7uV0UFwWEyi7y20ZT19aL
r5PeInCTNFIQG88kHekGt/bAO+afweWxvb+iphZpcLZj3PGQlE24S0SSgUqo0tHZ
oqTgFKC4v/YvEV2qmLQ5966R+L/7cKSRf5QlJfQl/v0pfk+IJ+QuhQhcG4YjQOVQ
NFBM2ncTGmQWGFeKqJiB5IuvhInT2DukqwaChLbEaqhPFS9PmRvb+YXGxTnd4b4H
Iob/zMnIE/RmFXwHANoSF/2Sely55Q==
=2tPP
-----END PGP SIGNATURE-----

--tzr33nw7euhn5lwq--

