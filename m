Return-Path: <linux-i2c+bounces-567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61B7FF3F6
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 16:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFF24B20D73
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 15:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F753524A3;
	Thu, 30 Nov 2023 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A7310C2
	for <linux-i2c@vger.kernel.org>; Thu, 30 Nov 2023 07:51:17 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8jJm-0001Ug-Dv; Thu, 30 Nov 2023 16:51:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8jJl-00CfBD-Gz; Thu, 30 Nov 2023 16:51:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8jJl-00Bd98-7e; Thu, 30 Nov 2023 16:51:09 +0100
Date: Thu, 30 Nov 2023 16:51:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: imx: Make SDA actually optional for bus
 recovering
Message-ID: <20231130155109.7z33qugys4bavq6h@pengutronix.de>
References: <20231130095751.65773-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="siqmuumtigl4lxaw"
Content-Disposition: inline
In-Reply-To: <20231130095751.65773-1-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--siqmuumtigl4lxaw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:57:51AM +0100, Alexander Stein wrote:
> Both i2c_generic_scl_recovery() and the debug output indicate that SDA is
> purely optional for bus recovery. But devm_gpiod_get() never returns NULL
> making it mandatory. Fix this my calling devm_gpiod_get_optional instead.

s/my/by/

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--siqmuumtigl4lxaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVor2wACgkQj4D7WH0S
/k41iQgAjkaf6D+9sz710ct3SHcnRumOZ0P3flbGCIgI9Djk4TV+RWp87MikUL2l
9oxqosDB8HLcnI87zdtbWwSujBHZFk69ByGDI2jq+S3fNR9ven6dVQRiGEN+L0aO
Y7PDjycQW9/kF5lqDlhjkE+E5/FDxW/9dFARD8Bz0uhOMKyQhWhkF5M+0yL9emyg
RAnePo/W9Q5xl+bAHO5snlf8vH7sGyBxvTxLuJugdxxRnv0SqoWh+lNew1cLvsIz
d8bTvYBVE0AXMBfQmAJknY/2IEnEis0BHS6m+bowYRBEcQNX9P8/P9pJK4wXpaWB
OhAkJDFL82U+qrg89/OjDIl2j/n3ZA==
=HK4V
-----END PGP SIGNATURE-----

--siqmuumtigl4lxaw--

