Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D1F1DB947
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 18:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgETQ11 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 12:27:27 -0400
Received: from sauhun.de ([88.99.104.3]:39468 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbgETQ11 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 12:27:27 -0400
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
        by pokefinder.org (Postfix) with ESMTPSA id 9119C2C1FD1;
        Wed, 20 May 2020 18:27:24 +0200 (CEST)
Date:   Wed, 20 May 2020 18:27:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Codrin.Ciubotariu@microchip.com
Cc:     linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, kamel.bouhara@bootlin.com,
        linux@armlinux.org.uk, linus.walleij@linaro.org, alan@softiron.com
Subject: Re: Re: [RFC PATCH] i2c: at91: Fix pinmux after devm_gpiod_get() for
 bus recovery
Message-ID: <20200520162724.GG5759@ninjato>
References: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
 <20200505151256.GF2468@ninjato>
 <c7a35978-03dd-3c73-6e7d-15ed40b5c57c@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DWg365Y4B18r8evw"
Content-Disposition: inline
In-Reply-To: <c7a35978-03dd-3c73-6e7d-15ed40b5c57c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DWg365Y4B18r8evw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This will do for 5.7. For 5.8 or 5.9, I can imagine to take the two
> > pinctrl_state pointers into bus_recovery_info and handle all this in the
> > core. I will try this later this week if noone is super-eager to try it
> > out before.
> >=20
>=20
> By 'all this' you mean to move the entire function in the core, right?=20
> Having just these two pointers bus_recinovery_info won't help much. I=20
> can try it, if you haven't already started...

I mean to add those two pointers to bus_recinovery_info and if they are
populated, then the I2C core is doing the necessary magic (or maybe just
the pinctrl handle and assume the states have fixed names?). Russell
just sent patches to add it to the PXA driver, so we could now double
check how much could be factored out.

I haven't started yet, let's keep in touch who started first :)


--DWg365Y4B18r8evw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FWmgACgkQFA3kzBSg
KbYxwRAAmUjg/PPDIGnjUCza3uhJUYZsY2bgkfy5OcjxXVotYkKYSBhrtw26GG33
DU2gPBQzDKZWB3T0kZo54GA6ZvzxRGuLKhfWLvLhbDdzz/hy94jX+DpoNJQ8mzr5
VPpn61UjFAd8/+W+DkpYzovXAQP78o2luuhnFuoqNZbhyEGJ4yWfHY+qICUJd1Ac
bdtL8oikCf653etM0rtpUPQQ6x/iw1cMH4u6xmtFSFi56jzdVnZB0MJKnc//t7VT
HfCkBiuOBu78HE007oPG0ylKU7TL8f5a2QCd0cLt87oDr2frfHTTVpLj+n7m8BAY
VEqc4bchKi58nHL8nD3h1kqFFjSxN08AFRcd6gWeUxyfVUTeuNhhxrzHnGObWJVp
ZKXcCnS6dgfKm2o/589Qo6I5H6VzYPTGUSwNLrSwUizT8sdqPawhQaKE3CE5sLYs
8OC7B/QmHT3+jk7Zlz0rQDT9w5mmvyP600CczkK+6ZXNFMuKjDz67X8IERmWoH6e
lp/7qtxPKxAXSPJ4qTNa3oIW2LIWNJ2dZJVSHGXPi/CuKwJMvJZs8HnXAY6BIWFj
MEFg1qbTxQ8fn3DNyRwf2iFkmS20RHoh2m80TsNcv71LYoq0ioASu/U4swiPh249
KnaM3i59M9VIN8cvqnpiAQCmgNJv+hzJifmd8tVpfswSfprOJgk=
=IUMo
-----END PGP SIGNATURE-----

--DWg365Y4B18r8evw--
