Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43123EF322
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbhHQUNn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:13:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233954AbhHQUNn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:13:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 311DA60EB9;
        Tue, 17 Aug 2021 20:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629231189;
        bh=GzbIF40gGD5cOzj1OatiZzR2+btynDaPqE1kuglJ3hM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VoOWYs5+2yzBmUxVO09uJUQ69S8+tRamDed5BjdUa2qqpR1HOX8LnVYhLOxyY8SH9
         Dvgde4F4N4+jWbG7nn/FkgmGJVUsrGmTILyRK+h/P2PKugbFPURA+4bb4Y7ZkBSdP/
         2jmRi71zn9qfzTYYtqFV9XtQdnjbRgDpN/neUvhDv/Rqptcqgsyk1sC/Z3E9tUiYOa
         CxcYcFE2GnHmco/7hoTdVmglCf75p17qeViLjpYUiS3AVhk/60Jobe24p9jERUOZoB
         7l1pEAJG2/kPOk3rA3VidWx9tdEnODrnIdVEVMTrC9+bMhK3VQNDbk4DEI04QkogkX
         KW3uktq+jyEJQ==
Date:   Tue, 17 Aug 2021 22:13:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, George Cherian <gcherian@marvell.com>
Subject: Re: [PATCH v2 5/5] i2c: xlp9xx: fix main IRQ check
Message-ID: <YRwYUtCqaIwaPHIM@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        George Cherian <gcherian@marvell.com>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <88b0915b-de45-1ef3-0b03-ec9c2ff3ce88@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cwREzseX9g0SrJRt"
Content-Disposition: inline
In-Reply-To: <88b0915b-de45-1ef3-0b03-ec9c2ff3ce88@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cwREzseX9g0SrJRt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:47:54PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0 for the main IRQ, the driver's probe()
> method will return 0 early (as if the method's call was successful).
> Let's consider IRQ0 valid for simplicity -- devm_request_irq() can always
> override that decision...
>=20
> Fixes: 2bbd681ba2b ("i2c: xlp9xx: Driver for Netlogic XLP9XX/5XX I2C cont=
roller")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20

George, do you like this patch?

> ---
>  drivers/i2c/busses/i2c-xlp9xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Index: linux/drivers/i2c/busses/i2c-xlp9xx.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/i2c/busses/i2c-xlp9xx.c
> +++ linux/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -517,7 +517,7 @@ static int xlp9xx_i2c_probe(struct platf
>  		return PTR_ERR(priv->base);
> =20
>  	priv->irq =3D platform_get_irq(pdev, 0);
> -	if (priv->irq <=3D 0)
> +	if (priv->irq < 0)
>  		return priv->irq;
>  	/* SMBAlert irq */
>  	priv->alert_data.irq =3D platform_get_irq(pdev, 1);

--cwREzseX9g0SrJRt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcGFIACgkQFA3kzBSg
KbZxYRAAjzebZ+FOMF7dnFTiACHb3d3lzeSwGkOQhlloyfXTLJ+jtyA7mlr+A+Qc
KlAAh6O7UzFn8NF5WjKIedibjOlTu7qiXRQDf9ZieVv8s0GwJmN0+VPBRvxFoPJ3
0TD0PR8SmaA6I2HiZKrXd7I7L0AWIS//4trW4NfhmrR9ipG0MVu0xGr35Rx1Iqso
z1gY2oWQkVOGt5T5kgvUI1DYXnSogzqPYrt0GS35THIZ+606y38dulUChX3B1hca
+80FnDr2ew2mdbXXuehobI8jSN90gtBsB2p+nQVo0uaFSV5QI8SRZY01KTcxBFQe
II1XMOwKkBdrSQGTyGGoxcZB4O7Zsxnp1sw5CWu566wYC5c3GagaVfwdu91ORyKh
O6YwDDYpPQkB+DUPj1c9MxHmOggdmJVKyXEicpgnBr1kf54PPrf2QUH8LqknyPIn
fTtSuIrpDNUKzZQte5bV9NJLUWZPumLu6mSalqWlJeCy4xeW4Jw3KhZkRy6zLM35
i4F6T7WWki6voN6/NND3uGrxqoF1EPxxhAiySG7ML4Bg9tZC9FZ9EBHl/L33abbH
iNHZ4EBmPvQXZE+I546Syu+F2Mvv27r48oTt304VWadqtn+buVSeTArJgJHrTIwD
Ira6cy6Zwcs4eRaNrBR+xuJ1BS6RzogF7iv8ASp8dSY4xaK6HX4=
=U3V3
-----END PGP SIGNATURE-----

--cwREzseX9g0SrJRt--
