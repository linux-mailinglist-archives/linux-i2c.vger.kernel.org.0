Return-Path: <linux-i2c+bounces-11859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8778EAFB155
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 12:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 791B17AAE4A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 10:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89201C5D7D;
	Mon,  7 Jul 2025 10:36:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D41DE2DF
	for <linux-i2c@vger.kernel.org>; Mon,  7 Jul 2025 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884616; cv=none; b=hd/9pbW9kkVBBgreBJim6LilzwaBbios7dQ9dzlW2aQ1xrZomqi/G3FczUWiacPjWN85Qe2fe3QiRGz7Ai4/fr6OZEdqDcWO3n19LcvEZLjvav9hCZVxJEgM0iG3rlW98pQRi9R3Dnq4ioaXFtOZlTsGZII0KsREv5eLDtkqQ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884616; c=relaxed/simple;
	bh=G02K2U9rXWifDOXEz/sB1XMHZAqZUmAt5bkKs2nUZG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARRd1y3Rioo2a4N4z8hhvMx1EqAIDzlnihrZMTJX+ZKVwe1PicoYrpPmhSQK4R+4rpluC6gVnRiLAd086PXjx0XjLbEmRaDbqcXvrUwdgduzgNwAU8nJVObSyxf43ZSu3mjE8YfVAbrVjEbSwieTPS/koUicmXE/oYadVFec0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uYjD3-00057V-F6; Mon, 07 Jul 2025 12:36:29 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uYjD2-007EWv-1J;
	Mon, 07 Jul 2025 12:36:28 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BB00443955D;
	Mon, 07 Jul 2025 10:36:27 +0000 (UTC)
Date: Mon, 7 Jul 2025 12:36:25 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Carlos Song <carlos.song@nxp.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "rafael@kernel.org" <rafael@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, Frank Li <frank.li@nxp.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"pavel@kernel.org" <pavel@kernel.org>, Bough Chen <haibo.chen@nxp.com>, 
	"len.brown@intel.com" <len.brown@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	Jun Li <jun.li@nxp.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
Message-ID: <20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250707105816.GF11488@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cndeefjy6bsasobx"
Content-Disposition: inline
In-Reply-To: <20250707105816.GF11488@nxa18884-linux>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--cndeefjy6bsasobx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
MIME-Version: 1.0

On 07.07.2025 18:58:16, Peng Fan wrote:
> On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
> >Hi, All:
> >
> >We met the dead lock issue recently and think it should be common issue =
and not sure how to fix it.
> >
> >We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio is =
one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver enab=
le run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random bloc=
ked when at reboot.
> >
> >The dead lock happen as below call stacks
> >
> >Task 117                                                Task 120
> >
> >schedule()
> >clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wait =
for power.runtime_status exit RPM_SUSPENDING
> >                           ^^^^ A                       ^^^^ B
> >clk_bulk_unprepare()                                    rpm_resume()
> >lpi2c_runtime_suspend()                                 pm_runtime_resum=
e_and_get()
> >...                                                     lpi2c_imx_xfer()
> >                                                        ...
> >rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
> >                           ^^^^ B                       ...
> >                                                        clk_prepare_lock=
() --> hold prepare_lock
> >                                                        ^^^^ A
> >                                                        ...
> >
>=20
> This is a common issue that clk use a big prepare lock which is easy
> to trigger dead lock with runtime pm. I recalled that pengutronix raised
> this, but could not find the information.

Alexander Stein stumbled over this issue some time ago:

| https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl@pe=
ngutronix.de/

I encountered it too, while trying to add a clock provider driver for a
SPI attached CAN controller which uses runtime pm.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cndeefjy6bsasobx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmhroyYACgkQDHRl3/mQ
kZyo1gf/bNfDioyKAk+LhbS/S8WU2c64fWY5vQcbThj413S7TcSnfnR9IlY7RDK3
yyXLR72WESLDt0+ezCYs/G5H8yWdc5vRjEjorcY/LiIyCkCmqeBDZ+LTRHKcCQTj
c1ueWZ8BN9n6tDpBqNG/BZxRn+NnTEB4/f66ioH0poon8ldWYEXBes3WoCPcwU6o
hKSg5Z0ch/66R1veUV42bRYEf1C2WG1lCkhuG0QBugpR6jH74bYwMyjhmjlwE/nG
8r4DabWOZ1peVEUh0BkRnUDp1qwGmviztuN5gOodGiCCoPn5AvarUIraNcS+x43J
EXQzX+sCwlzPYWX1leAA0t0Albln6Q==
=MHn4
-----END PGP SIGNATURE-----

--cndeefjy6bsasobx--

