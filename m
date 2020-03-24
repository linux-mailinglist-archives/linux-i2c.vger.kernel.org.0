Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97192191BBD
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgCXVJb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:09:31 -0400
Received: from sauhun.de ([88.99.104.3]:55112 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgCXVJb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:09:31 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 75EA12C08EF;
        Tue, 24 Mar 2020 22:09:29 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:09:29 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 1/6] i2c: core: Provide generic definitions for bus
 frequencies
Message-ID: <20200324210929.GB7641@ninjato>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 02:32:11PM +0200, Andy Shevchenko wrote:
> There are few maximum bus frequencies being used in the I=C2=B2C core cod=
e.
> Provide generic definitions for bus frequencies and use them in the core.
>=20
> The drivers may use predefined constants where it is appropriate.
> Some of them are already using these under slightly different names.
> We will convert them later to use newly introduced defines.
>=20
> Note, the name of modes are chosen to follow well established naming
> scheme [1].
>=20
> These definitions will also help to avoid typos in the numbers that
> may lead to subtle errors.
>=20
> [1]: https://en.wikipedia.org/wiki/I%C2%B2C#Differences_between_modes
>=20
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56dwgACgkQFA3kzBSg
KbbTRA/8DiL8b/xtrRSrXFUjBR2im8oXX3QC2PlLZWGdORKM0wPhjGidIVbEQDS9
L/uDl+bTurkTJ5j20dSnaSqU0X28y80yq5dWpxmZ7+aJtYHYXJsbVkb039TZ1QGJ
4UrcmVa+jN6t/6UFmgbVnPHY4kPEXfYFzuPEOYJY6q+K5tXUZBTAJ0uDbzY3Eifd
FfvvX6DxUW6q1F3WGXeWDMm5meqhSirKXatxNiyArRf75Hpx2dNuKwtOBYm4Izb+
VRihO7ySsNprX1ZFrVvvSTuyOwuqhpARWSR3z/hdZJU1/pmrgh1pePDWPgnA4pNi
9OgVilxEDSx8mbE3ibRV8get5UySmseLGAoqt909aoamo0fwIQd8ChMXuv8whzH0
/Z3w4BcKG1LRSpLihRxbuBMJijUVoeaOtWCyVNjgezL1nGUqo08vEttC4LZswgqS
tjhvV7YLK6wH7HCMlbczKPK78EuHzC2InUCqRx7ES/TC7G0wXwNzvlV5RfZXURRI
Bv2gQpDGh+2yOd3E+d/jlyfLzydysmku21qWFamPaIVVS98v+7fLXwvzywkzSFR4
N1WbAzXRhfMh2/3qzjOBjrEU6HVCwPBvTiIWTcTRoEshqODKWKZ/79Y2Hu3HuU0T
wylxlBzaiN58vdfGF1wBDTqibLNGu/cCeb2tjG3h9+KwZgIfGmM=
=/3yv
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
