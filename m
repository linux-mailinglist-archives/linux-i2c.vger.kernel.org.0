Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14162A725F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfICSPD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:15:03 -0400
Received: from sauhun.de ([88.99.104.3]:56878 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbfICSPD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 14:15:03 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id DCF292C4F2F;
        Tue,  3 Sep 2019 20:15:01 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:15:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     eajames@linux.ibm.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
Message-ID: <20190903181501.GJ2171@ninjato>
References: <20190706131911.3068-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Content-Disposition: inline
In-Reply-To: <20190706131911.3068-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2019 at 06:49:11PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_available_childe_of_node puts the previous
> node, but in the case of a break from the middle of the loop, there
> is no put, thus causing a memory leak. Add an of_node_put before the
> break.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Eddie, are you okay with this change?

>  drivers/i2c/busses/i2c-fsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 1e2be2219a60..5e01875082c3 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -685,8 +685,10 @@ static int fsi_i2c_probe(struct device *dev)
>  			continue;
> =20
>  		port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> -		if (!port)
> +		if (!port) {
> +			of_node_put(np);
>  			break;
> +		}
> =20
>  		port->master =3D i2c;
>  		port->port =3D port_no;
> --=20
> 2.19.1
>=20

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uraUACgkQFA3kzBSg
KbbaZw/9HvM1QaU6GP2vT0EQAW16qI65FbRIK0+0hZCYchNp6c6qsgQfyMMPx8oO
RHqKzSup52s7rgBkwyRIR3ANb/IjoSQgGr3kKeJef/Bl0HHCrMHEeJM6bxzu7UyA
npYFI5Q6zJJwGGMDdIk+gNRnp+yc6kFqeVUaU54ge0DI3ffn/8jYgg0UT/JUJpcE
C8OU3ykrvjLLpKBYXWd8ca2aYQXlLgn4Wxtqj6xU4IHZ4SAwPkQewjFDtCCKoF6h
BfTUoN/K3spk4yUEK5pXqKJgNBeGDaEdVz58XWNx3FNyaf7MF+yMpo+fstApYID5
9SwFdWfyUnQ081RnRBe9mrNEnxYzk18GeFQ8WEjmFrwwGh8ntZMWYCWM734S6Rr1
/d+WIu3WOkXYf84qBmHPFiO8NZGtE4PWX8GNbJ9s2MhYK0ZwMrDdni8Z+I3p6uhp
WQe8pufw7DFCvEkyYILcMm8oTHl+xhw8ErvrlGi17rTnSqnGRWRJqIuYiYqsf0R0
FvcttMVDJNqjeRs4BEuqIdb44jr+hFSmRVTs6gYYfnjTADSE/6TPZwO8i8DLWUjR
Io8LQ63Qk57j68FTet6+FJwUF5VQSExgz8xYC+EoBfYagkPAd1+XJJrOLaGZm1+p
WW+berifhiKEEvn5UHJz05Dd4qKOC+AcfS3TKjViMCjp8xMAoqg=
=9gpV
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--
