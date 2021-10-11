Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB615429841
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 22:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhJKUot (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 16:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235002AbhJKUos (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 16:44:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FDCC06161C
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 13:42:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ma27j-0006Dn-4t; Mon, 11 Oct 2021 22:42:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ma27c-0003x4-Pt; Mon, 11 Oct 2021 22:42:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ma27c-0001bN-Nd; Mon, 11 Oct 2021 22:42:08 +0200
Date:   Mon, 11 Oct 2021 22:42:07 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc:     linux-hwmon@vger.kernel.org, linux-serial@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        "Jason Gunthorpe linux-integrity @ vger . kernel . org" 
        <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/13] Make some spi device drivers return zero in
 .remove()
Message-ID: <20211011204207.zfmofwf4d6ga45ao@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4crg6rmgkslx3kie"
Content-Disposition: inline
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4crg6rmgkslx3kie
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Oct 11, 2021 at 03:27:41PM +0200, Uwe Kleine-K=F6nig wrote:
> this series is part of my new quest to make spi remove callbacks return
> void. Today they return an int, but the only result of returning a
> non-zero value is a warning message. So it's a bad idea to return an
> error code in the expectation that not freeing some resources is ok
> then. The same holds true for i2c and platform devices which benefit en
> passant for a few drivers.
>=20
> The patches in this series address some of the spi drivers that might
> return non-zero and adapt them accordingly to return zero instead. For
> most drivers it's just about not hiding the fact that they already
> return zero.
>=20
> Given that there are quite some more patches of this type to create
> before I can change the spi remove callback, I suggest the respecive
> subsystem maintainers pick up these patches. There are no
> interdependencies in this series.
>=20
> Uwe Kleine-K=F6nig (13):
>   drm/panel: s6e63m0: Make s6e63m0_remove() return void
>   hwmon: adt7x10: Make adt7x10_remove() return void
>   hwmon: max31722: Warn about failure to put device in stand-by in
>     .remove()
>   input: adxl34xx: Make adxl34x_remove() return void
>   input: touchscreen: tsc200x: Make tsc200x_remove() return void
>   media: cxd2880: Eliminate dead code
>   mfd: mc13xxx: Make mc13xxx_common_exit() return void
>   mfd: stmpe: Make stmpe_remove() return void
>   mfd: tps65912: Make tps65912_device_exit() return void
>   serial: max310x: Make max310x_remove() return void
>   serial: sc16is7xx: Make sc16is7xx_remove() return void
>   staging: fbtft: Make fbtft_remove_common() return void
>   tpm: st33zp24: Make st33zp24_remove() return void

I thought I would be a good enough programmer to not need build tests.
Obviously I was wrong and introduced build problems with the following
patches:

	input: touchscreen: tsc200x: Make tsc200x_remove() return void
	mfd: mc13xxx: Make mc13xxx_common_exit() return void
	serial: max310x: Make max310x_remove() return void
	serial: sc16is7xx: Make sc16is7xx_remove() return void

Please don't apply these (unless you also fix the trivial problems in
them). I will prepare a v2 soon.

Best regards and sorry for the inconvenience,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4crg6rmgkslx3kie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkoZsACgkQwfwUeK3K
7AkTugf9FW8u+Q+uOdqyv/dig5mZMoKZ01YqhMcNB1hLm+NpjtUVPs0yR3CgUTq2
lhQH+cy+0zeuFQEuyDRBXSLYHuSJJKVES8CBrpN960wFh6WaLLKLet8ri0sBJRe3
gakaZ/TcwPP4RwY/f1V4w/APWuU3or8dviF7hasfFR+D8tIMK+Wgi0LbdWMQIRHf
P9T60rK5sOnHH33Kksf5stqLxdk06MBHzwJV15PhzWc0TUQAmO+oG0FDfxq+C8tQ
8lXq6dtxtEMlzLhtLsBBHoUegGR/XbnKUmxT6kC0nO+G88xCYTO+BBjIGacAxhmQ
2mK/fRgMytsTSX41qXejUgp6TuoW+Q==
=mP11
-----END PGP SIGNATURE-----

--4crg6rmgkslx3kie--
