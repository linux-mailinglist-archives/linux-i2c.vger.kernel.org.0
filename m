Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EF042319
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407913AbfFLK4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:56:15 -0400
Received: from sauhun.de ([88.99.104.3]:58520 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406068AbfFLK4P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:56:15 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id DD3D72C54BC;
        Wed, 12 Jun 2019 12:56:13 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:56:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] i2c: pca: Fix GPIO lookup code
Message-ID: <20190612105613.o7e5tp3hcuepedgp@ninjato>
References: <20190530202424.13937-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pdlpdmhdjn6y7xsb"
Content-Disposition: inline
In-Reply-To: <20190530202424.13937-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pdlpdmhdjn6y7xsb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 10:24:24PM +0200, Linus Walleij wrote:
> The devm_gpiod_request_gpiod() call will add "-gpios" to
> any passed connection ID before looking it up.
>=20
> I do not think the reset GPIO on this platform is named
> "reset-gpios-gpios" but rather "reset-gpios" in the device
> tree, so fix this up so that we get a proper reset GPIO
> handle.
>=20
> Also drop the inclusion of the legacy GPIO header.
>=20
> Fixes: 0e8ce93bdceb ("i2c: pca-platform: add devicetree awareness")
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to for-current, thanks!


--pdlpdmhdjn6y7xsb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A2k0ACgkQFA3kzBSg
Kbb1sw/9G+STDAsBIJFaOPkT1WpYhfZi0DoSVZThqIo3FHHLmcYJNgxUXdgCurA/
+4+FsSQf2+b1RvR5bUwUKBVGeYx/tFYiPwwtCI4fh81K3tsH5uzJzjOzFYCawVF1
Rw7oACJ2GvpkjYwsj0TmijTVN9FqYlkwECuPJ6V6MPP42MU0dVhmwJNHDfp9AR1C
XtKV9nyBr9KbMShIC+iIy8erSMkrrY/HpDqYhqckXUYaV/saRpTbh4APq5hrF6aw
l6jx9AUIwlUG5EaFv8/yPGsYokaOpCq7Nr+StfDL8AdpHkK0+GyEuBSoRuADpm21
YX+PIHC3h1QGDebVpFF7AXImVkEzOS8zPzRWMxY3BZVpL5swzTAPUhpHuJGI+RWp
wysb2Kkh1QeX8Kvb2tsl4dJaPAbXJ3IjW/AJrrbBOU0HzQFTjwaLhZPaOkwGcFKC
pAllbKiyVmPyc/WEp8YrzNEAZ2s/Gktz5rYctdI/qCByGDEzwFlfG7CTh5ZW2BHi
Eq7VkOjEO3x2yJuli+2q0BNNN5ySZxl2TME6g48JSYPO4gvtPlQzmqAd3TAH9WI+
gbQEC5lWwvrA4wRB9P0OqMlB16C0BfFIDYbVo5DzsG614uqop1kDToudm7OlfJZS
0KM3rEfuDH/ivnsyi46fkxK6WAgwkibpbeaNU6iz+rVePhcjg0M=
=ZeyW
-----END PGP SIGNATURE-----

--pdlpdmhdjn6y7xsb--
