Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926451C59CC
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 16:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729812AbgEEOhm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 10:37:42 -0400
Received: from sauhun.de ([88.99.104.3]:33898 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729259AbgEEOhm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 10:37:42 -0400
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
        by pokefinder.org (Postfix) with ESMTPSA id 1C0DE2C0892;
        Tue,  5 May 2020 16:37:40 +0200 (CEST)
Date:   Tue, 5 May 2020 16:37:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org, peda@axentia.se,
        linux@armlinux.org.uk
Subject: Re: [PATCH v4 1/4] i2c: at91: Send bus clear command if SDA is down
Message-ID: <20200505143739.GE2468@ninjato>
References: <20200225155012.22764-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <20200225155012.22764-1-codrin.ciubotariu@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 05:50:09PM +0200, Codrin Ciubotariu wrote:
> After a transfer timeout, some faulty I2C slave devices might hold down
> the SDA pin. We can generate a bus clear command, hoping that the slave
> might release the pins.
> If the CLEAR command is not supported, we will use gpio recovery, if
> available, to reset the bus.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-next, thanks!


--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xejMACgkQFA3kzBSg
Kba7ng//aczcnwIHXEHGSAGdX7AjPZp/niO98R7pHZFfdm2mzqMTZ033SOgF6hSt
dCiYvgUUkCfo5gnOaIgJgBX/l/H6JY8MsScJi/zZQKZJgj4RR1b0xJgtcxjIMbb0
C/WHo29TSP7tutQph38nJa9S1T9hx9AulHgb0Xrmb2s7Qo3iLyame1VxP1pmWreO
U7KID0sB34vmdXKI9aC9T8Uh9eA2xwkceqZedr3+Cp68S0ljLhYnir1p3jnXEb0P
49+yIOBRDdTc5OImkGheeySqoIZ/pHl/6HtKkNXFpx9mrt/chhAWoDKMAb35tDtD
ZrC/8lTTc19r6WxqrSg1LeI9SwXAlYCY8SHNNsx5vUZxKmOQWoTAdZbOz4v/+NRe
LBlgO6BTKre2//N2qzgQm5ZeEqsDYeCLat5EK6l+EJQ0v4SyKHsC8UM2jyq0UY6g
Uiu9ursq22CUDwuUOSDjeJEQ5BFJOjF3dgJCKq+L7FzdunQGVr5usvf6MtiX+Y7h
bDP913w76vEvPvj7QhSwXK6qazZ3v3Q9Mz74cMmFXOczxe9GHgSouqBrbxYgjU3k
kV4hEaDLfHUrsE4FwFkt/Suq4Cn9UHBpG4ZgTbnKIjIxNrYb6oQqT915kA1GjTRf
+KW8m5gpTU6zdVRHgHX9FYSBzYvG+BsYk+W2c88teSd1HBpzn8A=
=vY/v
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
