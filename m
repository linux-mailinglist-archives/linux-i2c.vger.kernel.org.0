Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A043BB817
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 09:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhGEHrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 03:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhGEHrW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 03:47:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997B2C061574
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 00:44:45 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m0JGy-0006Vy-Ah; Mon, 05 Jul 2021 09:44:08 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m0JGv-0007oU-K0; Mon, 05 Jul 2021 09:44:05 +0200
Date:   Mon, 5 Jul 2021 09:44:05 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     cl@rock-chips.com, thierry.reding@gmail.com, robh+dt@kernel.org,
        heiko@sntech.de, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/4] dt-bindings: pwm: rockchip: add
 description for rk3568
Message-ID: <20210705074405.uj62h4evd6htftf3@pengutronix.de>
References: <20210622020517.13100-1-cl@rock-chips.com>
 <20210623021303.28015-1-cl@rock-chips.com>
 <20210705064914.o2neaiwqndjfdyqd@pengutronix.de>
 <YOK1+pMy+N64eR75@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e56be3gekkps4fdv"
Content-Disposition: inline
In-Reply-To: <YOK1+pMy+N64eR75@dell>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e56be3gekkps4fdv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Mon, Jul 05, 2021 at 08:34:18AM +0100, Lee Jones wrote:
> On Mon, 05 Jul 2021, Uwe Kleine-K=F6nig wrote:
> > On Wed, Jun 23, 2021 at 10:13:03AM +0800, cl@rock-chips.com wrote:
> > > From: Liang Chen <cl@rock-chips.com>
> > >=20
> > > add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> > > a rk3568 platform to pwm-rockchip.yaml.
> >=20
> > [...]
> >=20
> > Who is supposed to apply this patch? Does this need blessing by Rob?
>=20
> There is no standard. [...]

I'm aware of that. That's why I asked to prevent that everybody thinks
some other maintainer will care for it.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--e56be3gekkps4fdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDiuEIACgkQwfwUeK3K
7AkNrQf9FZHop8yLEFhUvrK0kVFAxxxvzzeTxbeluI3vqxKf7NEpfSi9f/GWjAn+
oWZMKeL5yq8VOLUpyRVPhG0qMniFktzjagpfSajAYWhAZOhlQA8QGshrDoJ0wzkk
62P3GDHORCli54O+jMDmrQHpv5ZuoOflAnQlJJdrIw3K26fLDw/jtp4wY8Q9S0Mg
7A+8SsowcLPLcm/Z/LU4SrH7qAE27vUizpDwKDCWSf38dm5/yMIJZKXWJE8SxylA
VyUTM7rASnKb8FbPFCpXd4dLrJKZftRnXZY1ObxaZjlSxI3KsiGAJqgWZYlBKg03
kMCxLi0Hr3xVdIHSffZ6uSRGT7vCLg==
=6Q0n
-----END PGP SIGNATURE-----

--e56be3gekkps4fdv--
