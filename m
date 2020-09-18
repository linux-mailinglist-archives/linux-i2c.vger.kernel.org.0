Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A8926F912
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 11:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgIRJVK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 05:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRJVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Sep 2020 05:21:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123BAC06174A
        for <linux-i2c@vger.kernel.org>; Fri, 18 Sep 2020 02:21:10 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kJCZc-0008UV-3v; Fri, 18 Sep 2020 11:20:56 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kJCZb-0007QV-Po; Fri, 18 Sep 2020 11:20:55 +0200
Date:   Fri, 18 Sep 2020 11:20:55 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wang ShaoBo <bobo.shaobowang@huawei.com>
Cc:     cj.chengjian@huawei.com, huawei.libin@huawei.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] i2c: efm32: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20200918092055.aphwrsmkbxmllx4e@pengutronix.de>
References: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dssoutfxliuy4moi"
Content-Disposition: inline
In-Reply-To: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dssoutfxliuy4moi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 04:25:08PM +0800, Wang ShaoBo wrote:
> Make use of devm_platform_get_and_ioremap_resource() provided by
> driver core platform instead of duplicated analogue. dev_err() is
> removed because it has been done in devm_ioremap_resource().
>=20
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> ---
>  drivers/i2c/busses/i2c-efm32.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm3=
2.c
> index 838ce0947191..f6e13ceeb2b3 100644
> --- a/drivers/i2c/busses/i2c-efm32.c
> +++ b/drivers/i2c/busses/i2c-efm32.c
> @@ -332,21 +332,15 @@ static int efm32_i2c_probe(struct platform_device *=
pdev)
>  		return ret;
>  	}
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "failed to determine base address\n");
> -		return -ENODEV;
> -	}
> +	ddata->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(ddata->base))
> +		return PTR_ERR(ddata->base);
> =20
>  	if (resource_size(res) < 0x42) {
>  		dev_err(&pdev->dev, "memory resource too small\n");
>  		return -EINVAL;
>  	}
> =20
> -	ddata->base =3D devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(ddata->base))
> -		return PTR_ERR(ddata->base);
> -
>  	ret =3D platform_get_irq(pdev, 0);
>  	if (ret <=3D 0) {
>  		if (!ret)

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dssoutfxliuy4moi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl9ke/QACgkQwfwUeK3K
7AnEOAf/e46Zv1YK4Q5R9JgfPtyZBjfk2Q4ZHkRr7NszYTf9S8upC6Y4wse6Z5sn
84A/mPo/QEBbdY4LyDhIF8vgwBkPV8aFeI3OX5uP/ZrQmVvjCXNcIrxpYz5FPi1j
GzS/G+XTT0EoZX98Blc6zFettmaYLQih4jBWNVMGSLj8iT56zKKiI0JwCaJN1Se1
aI1v4xvKQpPpulLbbr18lzobOwfyDuh1y3fRcAIgZGY8PtXDR7LwpRVGmnw8z4Hd
GHjVndQ9xsHFScU8Pf/+PFOmLMyr7TJqN1TysOIVJ5hoLCEC4kNwcRGUs2RPo/jQ
88kcjKu5gzncKirHAHstfxlwTPegNw==
=8fV/
-----END PGP SIGNATURE-----

--dssoutfxliuy4moi--
