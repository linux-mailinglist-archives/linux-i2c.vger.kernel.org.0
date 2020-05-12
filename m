Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCFE1CFA9E
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 18:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgELQ1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 12:27:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:41336 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728102AbgELQ1Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 12:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=HOkGV9ZQq1hEjxBKXjNAGGrru8Hs
        mXQHDos4mfRW9KI=; b=T3Vy3AZGIYU0yk4ZbnUQcLa/vLg21UrdmxMnZ/FTVyw4
        2WgDdpym5hAhaED2RYGMAuHcexcEH1VoZnDtIW42Fyid46pOL7oudu4KvYRy4ray
        PxEqwZ02dB9eMU4EQNEV28+MaH6RDzNNB1uNXHZSQYJWL+MiMYJXlKyJOlGm9Fk=
Received: (qmail 3009713 invoked from network); 12 May 2020 18:27:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2020 18:27:23 +0200
X-UD-Smtp-Session: l3s3148p1@+bc78HWlZsggAwDPXw2aAE67cgFBY+HL
Date:   Tue, 12 May 2020 18:27:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] power: supply: bq24190_charger: convert to use
 i2c_new_client_device()
Message-ID: <20200512162723.GI13516@ninjato>
References: <20200326210954.12931-1-wsa+renesas@sang-engineering.com>
 <20200326210954.12931-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lqaZmxkhekPBfBzr"
Content-Disposition: inline
In-Reply-To: <20200326210954.12931-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lqaZmxkhekPBfBzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 10:09:54PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API in this comment.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Can we have this now so I can remove the old API in the next merge
window?

> ---
>  drivers/power/supply/bq24190_charger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/suppl=
y/bq24190_charger.c
> index 453d6332d43a..4540e913057f 100644
> --- a/drivers/power/supply/bq24190_charger.c
> +++ b/drivers/power/supply/bq24190_charger.c
> @@ -673,7 +673,7 @@ static int bq24190_register_reset(struct bq24190_dev_=
info *bdi)
>  	 *   { .type =3D "bq24190", .addr =3D 0x6b, .properties =3D pe, .irq =
=3D irq };
>  	 * struct i2c_adapter ad =3D { ... };
>  	 * i2c_add_adapter(&ad);
> -	 * i2c_new_device(&ad, &bi);
> +	 * i2c_new_client_device(&ad, &bi);
>  	 */
>  	if (device_property_read_bool(bdi->dev, "disable-reset"))
>  		return 0;
> --=20
> 2.20.1
>=20

--lqaZmxkhekPBfBzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66zmsACgkQFA3kzBSg
KbakUw//aWhElrgSTmvOdYqp/rtKFOvF1FbnmBJVqHt/1xHGHw3DgFru2UQIo7gW
6Q5ByT4uW9ZcwKWVKXalKLeRfBr/QY5H30s33GwFFgzY6ky+V3p/oNoQWtPN5xMT
+1TrA1qXB/LojQQqWPBte+PQucQJqo2FdzNDyknmOlBUtbiTFiXvfOwUrnceAXOM
XVNi2xk1r8YN2NtDQA+ZW1Vxlck2R54qMZczBGxdfEFoy8nvQBdbSN3KqXyZU7FJ
Grspvsthjd/4mq+F4ZrgJV0w8NREf8LyUu+E5SJtK8gIqjvZWjcnSMTbB4TgWhM0
MO4KSqp454euHg4MVHW0xIO7g9p/pyxq6LP21oB5o5Mgb9bVkrDYfjSyJ//F9VUa
eVDgnMTzvrPowJIL5Tde5GGA3hD71PwJf8EGu7pj3x0+0vDUmh+Zd9IGkSv9zlYz
+k5U3YYnb1pIdkG53IeJTH7Td5ALatxZfzwsMLXTyzwNzUcL9Q9zWQFOVi23xfXs
nVaavHOHS1Sit+kSvNekKD881aRgMEjhnO7bAtdNoR97MeqF3AXrHeM+Qwmpcoh3
4qhUxFENZ4kz1zc3D9Z0ZpH7oMx7yyMNgHwrmBJY6Iw43gY3wBrIzttsiCKQRGvI
N6lv0xH5NzBs6xLxbkKx+CEwQy/lURzjC+xbY5pwnPID4mWBwdU=
=XYzx
-----END PGP SIGNATURE-----

--lqaZmxkhekPBfBzr--
