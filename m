Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BB01CFAB3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 18:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgELQaE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 12:30:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:42314 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgELQaE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 12:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZEn71GyZmnBopDm0mdphrGZcrfFu
        4JxViUbqVQHn+zg=; b=0zqyt507wiwSqlBNOG7Ks7A8T+X6tFdMttz+mbQ231eR
        VaPNreFXkESgcHk4dXekFaNYyMTSirRHtjMF4u0T6dm6AcfqnbADXphrxaOMkgnG
        mUZtdsMgYjbFWFlSxHoz/oRAMLVr4jwvbqhaIf8M7cT4nUsMBpCc7uJVHAYPxe0=
Received: (qmail 3010584 invoked from network); 12 May 2020 18:30:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2020 18:30:01 +0200
X-UD-Smtp-Session: l3s3148p1@ByWm+XWlasggAwDPXw2aAE67cgFBY+HL
Date:   Tue, 12 May 2020 18:30:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] char: ipmi: convert to use i2c_new_client_device()
Message-ID: <20200512163001.GK13516@ninjato>
References: <20200326210958.13051-1-wsa+renesas@sang-engineering.com>
 <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vbzKE9fGfpHIBC6T"
Content-Disposition: inline
In-Reply-To: <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vbzKE9fGfpHIBC6T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 10:09:58PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Can we have this now so I can remove the old API in the next merge
window?

> ---
>  drivers/char/ipmi/ipmi_ssif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 8ac390c2b514..2791b799e33d 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1945,8 +1945,8 @@ static int ssif_adapter_handler(struct device *adev=
, void *opaque)
>  	if (adev->type !=3D &i2c_adapter_type)
>  		return 0;
> =20
> -	addr_info->added_client =3D i2c_new_device(to_i2c_adapter(adev),
> -						 &addr_info->binfo);
> +	addr_info->added_client =3D i2c_new_client_device(to_i2c_adapter(adev),
> +							&addr_info->binfo);
> =20
>  	if (!addr_info->adapter_name)
>  		return 1; /* Only try the first I2C adapter by default. */
> --=20
> 2.20.1
>=20

--vbzKE9fGfpHIBC6T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66zwkACgkQFA3kzBSg
KbatIw/+OpAxWxUj4YPEB3LAqKA+xbgSQfEbbrzasZv8QBjMW+phFfWh9Y/6USBE
NeQFaWWmEfWp4JvIoBL7HxryaCblQBbJ5UxIHhhSMv1BQ+4m+98L3hD1Ji0mlpx/
LZzoXVyFvGKFQEGAFNsJ3WpP8wU8h/zFInPOqFrv5/CLQZjp6te+9hTs79ytzump
f/4ET0MemMhSTpj4oU2soHmh2pBuZ76Gxf7ZAlASDFp+ZvHhvfx9izFRuqf2Jg9x
txTVPh82URkPdsCWp/ngF7qRUmBOaPciGFrelfHNSHRa+n8whZIvx3LjCNFkT+8K
mStygJj091Z6eqe1MWYhQtfVonXOQ9WUjrE3hOwRO5s+Nw7xVkV/VkjgMyVLKAFU
/2FDkB3PVTzxXvXppVIHRzltT85C+9JxTi6wsnKGWin+YpoPvUw1RN7Me3VAuJO1
1hRDZBk6tdzHQCYSN+BTT7hX2EblOOwWR/ne0nXlvz7THXqxUKlBtPxhhObMuP10
NAfdSxloR7cTtWQUt6q1Xp+I+ZYTjm1xWusiwVyxXcgTN9YfJpiryo3hWOwvjm10
yO0TDmN1Y1mWqDU49AjeNuxbIMRgNdPsX4HPXTVzMCeTBqtLbNDutPBDe6Ixxv4T
y0DfhOcxrZt1dYu8raQQzmtbpcwq8XMxffNyl4Y6cn609p4Xbhg=
=Dv+v
-----END PGP SIGNATURE-----

--vbzKE9fGfpHIBC6T--
