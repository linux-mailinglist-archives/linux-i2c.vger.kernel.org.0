Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7BF22CEDC
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgGXTrV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:47:21 -0400
Received: from www.zeus03.de ([194.117.254.33]:58138 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgGXTrV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=zc22iFyoM2hojJ/o5N6EgD+r/Nzw
        B+TegbobvFvjups=; b=Sx/yPkY2lH3I2VHxfSK38D3MWsWgke86r8T31I+Uixmz
        JpOcA0seEOb2u2/OvJ4mCUblDUtVEZFLlkroWkEZCjX6fwkC/7C4RmzkKT7145xv
        qYMSfhreWjvYuiltbyJkXAkGOy57YKX0Pfdpbd5xDmTVrcB6OhnwnuTr7tT/XFE=
Received: (qmail 3785962 invoked from network); 24 Jul 2020 21:47:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2020 21:47:20 +0200
X-UD-Smtp-Session: l3s3148p1@JNetPTWrFJ8gAwDPXwcRAJKYSnl1dekZ
Date:   Fri, 24 Jul 2020 21:47:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] i2c: core: do not use logical device when creating irq
 domain
Message-ID: <20200724194719.GF1227@ninjato>
References: <20200701082318.11174-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Content-Disposition: inline
In-Reply-To: <20200701082318.11174-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 10:23:18AM +0200, Wolfram Sang wrote:
> Let's rather use its physical parent device to give proper namings and
> connections in debugfs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> This turns the name from "unknown-1" to ":soc:i2c@e6540000" in debugfs
> for my use case.
>=20
> @Benjamin: I am not aware of any other side effects or regression
> possibilites. Do you see any?

Last call for opinions before I apply it ;)

>=20
>  drivers/i2c/i2c-core-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index dc43242a85ba..69217d2193da 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1227,7 +1227,7 @@ static int i2c_setup_host_notify_irq_domain(struct =
i2c_adapter *adap)
>  	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_HOST_NOTIFY))
>  		return 0;
> =20
> -	domain =3D irq_domain_create_linear(adap->dev.fwnode,
> +	domain =3D irq_domain_create_linear(adap->dev.parent->fwnode,
>  					  I2C_ADDR_7BITS_COUNT,
>  					  &i2c_host_notify_irq_ops, adap);
>  	if (!domain)
> --=20
> 2.20.1
>=20

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bOsMACgkQFA3kzBSg
KbbLlA/4uSnHZ00rVZzymu5m4uBjY8/HalvvOJ3ehxnMh4jOKJqEJFQGBgQEZhR6
JzgEioEaZpxqSy76ilX5Zt3//+iQCpy8X+x8VgtycZ/HZW2YAuO2Vl4KVGr/my3U
2mrzFV7FWv8dBeFtBAUEjOUDs3ot6BdgiEYa7E6VhHaP/O95FuwQBwAqHNQpqlJz
xzMvb921J33v5RGXr5+qiAFEBt4o7c+w7tmqoVnS+Q78NwHgy0ZGA3RIN8oiXfXV
mb2T8vOjA9jdi9/vjZhJo0nZPjOAL4JPqYHSBprlnnwKPRdQJvu7F+pZHMMh6Ba/
YGzn17odYqAlMtW0m+p9wzKvhIZmUxW/+x3mGLUEz7zYJiqbeNcxJoViSiUOK8+b
lOnrbKUGJgo0AP36YppE+JIB4oPomSYkq+bbNURt13cFfW8t9D2ARerl8NWmhZNZ
tSTXsd4D1xAzf7gMxYbp11vET0Nsb0caRf3grnoI3Kj6BE3839HkGg9mU8OfzOoR
F+NGY/gGVX281ZtHOI6PWimnxU7WOrXy9R5DMxZEmNOmiDp5YycMMM8V1NG46Zwq
sW2MblPrkehRQHkCRftnXqqu7QDqTo5rs3UAjZLx2TDaAXIdvb0iiDe18DABo3hc
T/z49bdPhRxeJNDB7LmWA2pNmOwzHWiEIuN5rS3dHkvxukh0BA==
=ucaE
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
