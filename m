Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454454403D1
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 22:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhJ2UKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 16:10:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:39908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhJ2UKZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 16:10:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA1DF603E5;
        Fri, 29 Oct 2021 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635538076;
        bh=JWNtTtZlxxStPFFK9YVHU96GPvygUXlX9vi+gf6rdT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fqhDha9Gy8xEL5TPhe5gn5OQSU07xsXUub+8fvEkKQQMHgnfou9nBUCfxq7luxlB4
         Qi6hUHtyfemei9t8bVGFvRxiFek2KvDF+dF0wHJR8y9S/IdhyH7oKSATgYa9HYZqtK
         A2cCCiWYlYktYN4yE7sAuJ+joFw4Jk/1P+Z46TeofuoXcEsu3vwIINoBEw6eoIE5Wq
         u5VjiTF9lwpupE4rU9WXAxnIx8XfrtJwZEYc+7NCSjCRZ3FgRBDeqtqnBp4D8IQTmr
         xT2d5WHGOnK+MwGbZAIFHovevQCJU5Y/3yVTbzFCqHYYn3NbAyBjtY/kSEzbJWHcAG
         EbGeYE7g09Wyg==
Date:   Fri, 29 Oct 2021 22:07:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, krzk@kernel.org, stefan.wahren@i2se.com,
        nh6z@nh6z.net, eric@anholt.net, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Fix the error handling in
 'bcm2835_i2c_probe()'
Message-ID: <YXxUmXtXBR3Oy0C3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, krzk@kernel.org, stefan.wahren@i2se.com,
        nh6z@nh6z.net, eric@anholt.net, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <338008c444af4785a07fb5a402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vErO5tT5H1S1DPMw"
Content-Disposition: inline
In-Reply-To: <338008c444af4785a07fb5a402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vErO5tT5H1S1DPMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 08:43:33PM +0200, Christophe JAILLET wrote:
> Some resource should be released if an error occurs in
> 'bcm2835_i2c_probe()'.
> Add an error handling path and the needed 'clk_disable_unprepare()' and
> 'clk_rate_exclusive_put()' calls.
>=20
> While at it, rework the bottom of the function to use this newly added
> error handling path and have an explicit and more standard "return 0;" at
> the end of the normal path.
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Could someone from the BCM community kindly test/approve this change?

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bc=
m2835.c
> index 37443edbf754..a2f19b4c2402 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -449,13 +449,14 @@ static int bcm2835_i2c_probe(struct platform_device=
 *pdev)
>  	ret =3D clk_prepare_enable(i2c_dev->bus_clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Couldn't prepare clock");
> -		return ret;
> +		goto err_put_exclusive_rate;
>  	}
> =20
>  	irq =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>  	if (!irq) {
>  		dev_err(&pdev->dev, "No IRQ resource\n");
> -		return -ENODEV;
> +		ret =3D -ENODEV;
> +		goto err_disable_unprepare_clk;
>  	}
>  	i2c_dev->irq =3D irq->start;
> =20
> @@ -463,7 +464,7 @@ static int bcm2835_i2c_probe(struct platform_device *=
pdev)
>  			  dev_name(&pdev->dev), i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not request IRQ\n");
> -		return -ENODEV;
> +		goto err_disable_unprepare_clk;
>  	}
> =20
>  	adap =3D &i2c_dev->adapter;
> @@ -481,7 +482,16 @@ static int bcm2835_i2c_probe(struct platform_device =
*pdev)
> =20
>  	ret =3D i2c_add_adapter(adap);
>  	if (ret)
> -		free_irq(i2c_dev->irq, i2c_dev);
> +		goto err_free_irq;
> +
> +	return 0;
> +
> +err_free_irq:
> +	free_irq(i2c_dev->irq, i2c_dev);
> +err_disable_unprepare_clk:
> +	clk_disable_unprepare(i2c_dev->bus_clk);
> +err_put_exclusive_rate:
> +	clk_rate_exclusive_put(i2c_dev->bus_clk);
> =20
>  	return ret;
>  }
> --=20
> 2.30.2
>=20

--vErO5tT5H1S1DPMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8VJkACgkQFA3kzBSg
KbaJ9Q//fa5saV/r7SzxO3K6INdB08qy4jv7WsqQcvKqjd+v6nkAkKVDFH8hxhPB
prBzqeWlhaC1JrLZgptjkhFw6q2N1YFJ99OqGs0mJWi4PpNq9myxA7OjWKD64oPD
sregXrpVzM5E79a9n7GbduJkt5PDHRmBqeZtXRrFyzbLYPVCh3leimqY5p20EMXI
Z48PQvJgzbb5mlA3QCaL9pmZVjrnTk2WSAMCbTt80ufad72SNPvWFaqfWqdpANt6
uYPSBkpGf1jqBo/XxS1GVhdRw2YAipvbOhgXYwjLECd+MAVttxYcOKwaowY766do
Whe1JpunWvSbU4W4pH2hyiEElc2s5z8dttNGBbZwLJ9wqLnNSdTIGz9xLznjekoL
afXl1kRQvPSkNOQqazn7rwIGpKwVwH64fPBbuaCQ5tnCXVU1THM/8U1yl+QQyJzG
XlI/bP1CZbKkA4bd4BzGHCP3+RP2jrrpshyVjIV1uuu1stpNVdL/DV26reo3wgzf
w2zs00f9WGlEj2iNBbYdqZN2cEh8KV/oWuwI52nmXgkAaLvsiRWaWKrfqikYaAZG
SO3k06Xdg2Xf+wgHU1HBFHRhhIlCFBzr087FdR67aisx8xOrUP8iYs83VdETaJGe
g28ReVnmVU1oafs5p5UMt0j09Wd+lA87k0RMQek/LuvYWS9t2pM=
=fkVz
-----END PGP SIGNATURE-----

--vErO5tT5H1S1DPMw--
