Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB11F2CFBB1
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 16:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgLEPLk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 10:11:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:44142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbgLEO7a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Dec 2020 09:59:30 -0500
Date:   Sat, 5 Dec 2020 14:49:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607176156;
        bh=avTC0vKm+HCnpWOb2l0x6fMZwug0bB+vBnqbMQiiwTM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=NHwXk6MB73OjROTKxa+Ok66U4PLyGi7zDvwEe/EhcXjvgsFs26jY7GG2tzefRPA+e
         IPZBNghbWMUXTKRkHDYEkkt7WEx5yLh5AHgc7Vn+hT0+irGDsaQtLM/+yfc6+t+ppA
         nBY8CNMpa/Grnq2NgDWz8Mk0OhqF/Cr+oK7XYmcnObS8h1YZcQtzpC/EVhAi33kPSq
         OmlDhy04aX2dz5S6ZZlRcJI4m4+y7X4w1JOH8P8qqaA34MRE4flZWcvWsCNp/vtpPX
         N4tJlqMij1fIA1BIHrDciXEwKL6NRGzi0KMY6bKFxdvmbL8G88I5vjg0AV35R3M0eA
         mt6tvgFYHoNrw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Vadim Pasternak <vadimp@mellanox.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mlxbf: select CONFIG_I2C_SLAVE
Message-ID: <20201205134907.GA5761@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201203223311.1251788-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <20201203223311.1251788-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:32:50PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> If this is not enabled, the interfaces used in this driver do not work:
>=20
> drivers/i2c/busses/i2c-mlxbf.c:1888:3: error: implicit declaration of fun=
ction 'i2c_slave_event' [-Werror,-Wimplicit-function-declaration]
>                 i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
>                 ^
> drivers/i2c/busses/i2c-mlxbf.c:1888:26: error: use of undeclared identifi=
er 'I2C_SLAVE_WRITE_REQUESTED'
>                 i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
>                                        ^
> drivers/i2c/busses/i2c-mlxbf.c:1890:32: error: use of undeclared identifi=
er 'I2C_SLAVE_WRITE_RECEIVED'
>                 ret =3D i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED,
>                                              ^
> drivers/i2c/busses/i2c-mlxbf.c:1892:26: error: use of undeclared identifi=
er 'I2C_SLAVE_STOP'
>                 i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>                                        ^
>=20
> Fixes: b5b5b32081cd ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField=
 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-current, thanks!


--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Lj84ACgkQFA3kzBSg
KbY3gQ/9HdDd3tmrX2RSD5pjtUUuQEa0bKb5t41oHP7lnR/WepimCmAWce4QBETd
ugb81HuAUYhX0tbzQn+TRKC6jYobyChPKpdVVAIbtqBCt1ScLSnvXxRIB7Q5VNJI
Uwhj0gqnITyvzNdc5if0wGNXk3CphcKkvp0LgpfjxIku+0BQSt5dyCmYTetB2Yy2
crI6YnBYKu8VbZR3cnTDcTypqDr3tKenE0h2mVqNtbW4H567I6mw5Wi09NBJsANS
F3qlJjrOfHlWvJWd5iqGKUF4xsEw/Hg63977ulrbVvZnFTIVXsCjHQ9JGt03mHr2
i0HB31N46gk0LUjNzGU8Oig2UI4ybUl/IQPitroBxahphGU0D44QF2Kf+aQMo4FD
v3mmnQykUA2+IFAtXucqvKyxrjkHduEi4pcDQVYgOO7LwNEwVuJvqDLJO4mY84JL
cqiHEdcAZp3Gxi81Wn94TTRJ9MRNNzKLB4DmLIWKQNke0p4+AGSMaD6zlQt2WS66
nTE5JcKwU/fDxlO1eO7o7aMAKttufq5/wxgjMNTPdBDLtmDUIILNfcpuzH7AdYOR
Sd6LXCAeOegwog7ipa0yBrWRj9SVRjKtpNP+DmVdWvBxPZOAOqmas/HLeo3yuGHy
0tGIAYWj+icVlmXrFxWifQC3VxPl+NJP9qR2NIcRijm3dD/GDgA=
=OE8V
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
