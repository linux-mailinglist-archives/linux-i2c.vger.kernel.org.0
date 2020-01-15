Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E3B13CB37
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgAORnj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:43:39 -0500
Received: from sauhun.de ([88.99.104.3]:39014 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgAORnj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:43:39 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id D0E572C0742;
        Wed, 15 Jan 2020 18:43:37 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:43:37 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2 3/4] i2c: highlander: Use proper printk format for
 iomem pointer
Message-ID: <20200115174337.GH1239@ninjato>
References: <1578992765-1418-1-git-send-email-krzk@kernel.org>
 <1578992765-1418-3-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline
In-Reply-To: <1578992765-1418-3-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 10:06:04AM +0100, Krzysztof Kozlowski wrote:
> iomem pointers should be printed with pointer format to hide the
> actual value and fix warnings when compiling on 64-bit platform (e.g. with
> COMPILE_TEST):
>=20
>     drivers/i2c/busses/i2c-highlander.c: In function =E2=80=98highlander_=
i2c_smbus_xfer=E2=80=99:
>     drivers/i2c/busses/i2c-highlander.c:325:22: warning:
>         format =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=
=E2=80=99,
>         but argument 3 has type =E2=80=98size_t {aka long unsigned int}=
=E2=80=99 [-Wformat=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Wrong commit message. buf_len is size_t and not an iomem pointer.

> ---
>=20
> Changes since v1:
> 1. None
> ---
>  drivers/i2c/busses/i2c-highlander.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c=
-highlander.c
> index abfe3094c047..803dad70e2a7 100644
> --- a/drivers/i2c/busses/i2c-highlander.c
> +++ b/drivers/i2c/busses/i2c-highlander.c
> @@ -322,7 +322,7 @@ static int highlander_i2c_smbus_xfer(struct i2c_adapt=
er *adap, u16 addr,
>  		tmp |=3D (SMMR_MODE0 | SMMR_MODE1);
>  		break;
>  	default:
> -		dev_err(dev->dev, "unsupported xfer size %d\n", dev->buf_len);
> +		dev_err(dev->dev, "unsupported xfer size %zu\n", dev->buf_len);
>  		return -EINVAL;
>  	}
> =20
> --=20
> 2.7.4
>=20

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fT0kACgkQFA3kzBSg
KbbwjhAAk6+rX4a8YIXUi9hKqaLS8QYdLjBJt8KuuQUFUjDSZVwgkuGtOu60Y+ru
AB+/Io9mdeCkPFmL1PNn1kTrQMLmYiu8yuZL1Ppe4PgZN4J5ZAXaqqM8YbYCl7Wn
F+eY2OIgWJakkMSEb6wsEDFtD1OzydFut/0LKNY83IxkL+VNR4WI8IfPLZtTlTWE
Pa1fnN4AuXlfTB6LIWE9J4LWnDOCYjtiJvYu1PePASrFadtm/Al5PBILzYML5ZsM
S3B8kDMYA1k9E0IkPzx1qF0NTlUfrKZ4+QE+9GV5t3ONGIfRXqvsEWCB9BqKqkS1
1gd2cnEbDMDaMBzL1rDrMFE6Kb/E3cMhIxHIxyzx946BHN26RH+ZW7+5+BZ7S0bN
22kOrhei2l5OByVh/8gwftYg2S//DlDX5NnDloaKMlMp4mqcF868okMj0QKlwzTn
jCgrwjXCEiex0aynBAchp87UWCOOjnbdbxm81jw0sAVEASvvydR5wwBxzXYEOkcf
0OfICAwJsusdZEdznYT3jQF8z/mqp87iB1t+ZtdDYbXd7CG+gC6Z6sz1d4yDeIc/
jYkxDykxfklxP04MluX4vcp/btcpZLek1BDZcHeKFz8RY0betjQUSrDd9ybVMO/+
QhmI0MXmKYK8pDo7UMGHAESg43lOKEv168eree4Qido50G0TzFU=
=Z5e7
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
