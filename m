Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCDC5A7233
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfICSFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:05:17 -0400
Received: from sauhun.de ([88.99.104.3]:56726 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726973AbfICSFQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 14:05:16 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 1C1082C4F2F;
        Tue,  3 Sep 2019 20:05:15 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:05:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     ard.biesheuvel@linaro.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: synquacer: Make synquacer_i2c_ops constant
Message-ID: <20190903180514.GH2171@ninjato>
References: <20190819075854.1960-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZYOWEO2dMm2Af3e3"
Content-Disposition: inline
In-Reply-To: <20190819075854.1960-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZYOWEO2dMm2Af3e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:28:54PM +0530, Nishka Dasgupta wrote:
> Static structure synquacer_i2c_ops, of type i2c_adapter, is only used
> when it is copied into a field of another structure. It is not itself
> modified. Hence make it const to protect it from unintended
> modification.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Ard, are you okay with this patch?

>  drivers/i2c/busses/i2c-synquacer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-=
synquacer.c
> index f724c8e6b360..39762f0611b1 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -526,7 +526,7 @@ static const struct i2c_algorithm synquacer_i2c_algo =
=3D {
>  	.functionality	=3D synquacer_i2c_functionality,
>  };
> =20
> -static struct i2c_adapter synquacer_i2c_ops =3D {
> +static const struct i2c_adapter synquacer_i2c_ops =3D {
>  	.owner		=3D THIS_MODULE,
>  	.name		=3D "synquacer_i2c-adapter",
>  	.algo		=3D &synquacer_i2c_algo,
> --=20
> 2.19.1
>=20

--ZYOWEO2dMm2Af3e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uq1YACgkQFA3kzBSg
KbbW9RAAtK3efBI4dsyIiGgo98mlMqu4ydrvEe+eIXNYDL+Y8kNiov/Tx50pSsjB
fGC+wl4Yir8JmyaL826D46AXO4/mZtcE/XCBvmRdm59pPHvPqNcyl2GoTXAZG1iy
YWq9+pDpCTzalCpxn9Cm+2Cg+LxACsgyu4IeCP3mj86iXnecM/+06bUntYaoRNPh
m50qxSuBCpNbPtY37U5uIA7NX2QmpL1cXswiJeGW1fRGOGDNl+claVhqYBX/njej
KtUe1qqo/8sk/Vq7F4DK+6gjB02+l2o8ZNnAwktqvQerYhBi6cXTzMALRazNqleS
FHat0rMx2tEK/82UAYXjpuZtZZA+nINYIrV9bv3pRM74bMaweE7t8wADkGyVHWMO
G4zBun6mjbEYdmo85/y0hj1F9K/Ihthp+MrDHzMIsnTjroNvSJdDiFp5jihZdsaM
acd8PCrAm6jLfFQOPMVY4ICqNX+f+5HJ12eKVWta6fqKohobrJfolECG9nKM1gRG
N3Se9yDvkNvOnpgYA2xAjip9RLmPLLz/mUeIgtEIUBrcQDGL4EV3Q4vR3oMDT7dU
ZEoVqfkHElqQwN8bzP0cW626bDDdDS25Bj+q3m0lQuQ+7BWbEe6I6vdr92yzqg/H
YtEQhVJTQHPmrg+9a8GoKNyczuKxAS2I2cfcxNdwdRvkNN3iros=
=Gw0I
-----END PGP SIGNATURE-----

--ZYOWEO2dMm2Af3e3--
