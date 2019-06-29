Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D22A65AA4B
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 12:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfF2K5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 06:57:53 -0400
Received: from sauhun.de ([88.99.104.3]:60668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfF2K5x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 06:57:53 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id EB8862C047A;
        Sat, 29 Jun 2019 12:57:49 +0200 (CEST)
Date:   Sat, 29 Jun 2019 12:57:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andreas Werner <andreas.werner@men.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Jim Cromie <jim.cromie@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: i2c: convert to ReST and add to driver-api
 bookset
Message-ID: <20190629105749.GA1685@kunai>
References: <cover.1561756511.git.mchehab+samsung@kernel.org>
 <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 06:23:14PM -0300, Mauro Carvalho Chehab wrote:
> Convert each file at I2C subsystem, renaming them to .rst and
> adding to the driver-api book.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

I glimpsed over it and it looks basically OK. I won't have time to
actually review all of this. But I trust you and we can fix things
later. So:

Acked-by: Wolfram Sang <wsa@the-dreams.de>

I assume this goes in via your or doc-tree?

>  Next/merge.log                                |   6 +-

This file doesn't exist upstream, though.


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XRCkACgkQFA3kzBSg
KbaLuBAAhCf3TNn+xCMcOgGyyRchSfnkRlEbd1ptubc40pHEy7Qw7R8spyI7CKjK
S8R50Cj2tH4i6DPbAjQeGi5ofxQZ1RABHJ9iW6nphOdpGtsmfpyabgu85Q40Atqp
kvu0OAkfeei37NPiNhIbCS7kRfjUtKgihy5V9gkcqlil3VTsUwF1nCyFOGuCxnfO
D01UaoItfPqPDOSrXRsRvDUGe4CR4jStuUd5SADKrvewvfky7ZpK36oMBfyRBwH9
sCLErIk3Dvpf538qcBQFklQ/wipy/d2ubulNtrAYuTn1IBKMrV03126mhAj+LZru
lOEuBxq/Xpq7P4WaQr/BuZHJtQnW9D8m4f1jlWMZsUFEdUzTl+oaAEiZkuFY8pvB
XjNYuYcOdRnKOcD4IiRnZxyoKc/9tuInVjugogRrbafOfg1u45wF9uL+T6y051NC
6+v4wBEm6IFaw2BMRa0rk92wFmEmejeRzIofSS/qxBJR1TAS9r1cvOb+yaJYaDSg
1hH5B0qXKYK+g1fNeaiSD1dtRnEhNKw5mXGrj74R637xFE9tOO3hAoWUnb9M72b3
N+9e//Ry4PhsL/bK/p2T0jHYL5dSX7UYPdYJLAnxvaDv8EdCZc5+VbhGXmYsUB5p
+YA9xi1SfGk3kHnJm7JMKAO94RpOmAAiON8FhApNx/kzLO1FNlA=
=5j5T
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
