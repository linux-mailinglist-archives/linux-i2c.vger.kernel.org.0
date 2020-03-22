Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD5918EA39
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 17:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgCVQTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 12:19:25 -0400
Received: from sauhun.de ([88.99.104.3]:51408 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgCVQTZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 12:19:25 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id E34CC2C0064;
        Sun, 22 Mar 2020 17:19:23 +0100 (CET)
Date:   Sun, 22 Mar 2020 17:19:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chuhong Yuan <hslester96@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: add clk_disable_unprepare calls
Message-ID: <20200322161923.GC6766@ninjato>
References: <20191102062149.3957-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <20191102062149.3957-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 02:21:49PM +0800, Chuhong Yuan wrote:
> The driver forgets to call clk_disable_unprepare when probe fails
> and remove.
> Add the two calls to fix the problem.
>=20
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---

Dong Aisheng, what do you think of this patch?

> Changes in v2:
>   - Adjust the call order to make it consistent in probe failure and
>     removal.
>=20
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index c92b56485fa6..f964693c0901 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -618,6 +618,7 @@ static int lpi2c_imx_probe(struct platform_device *pd=
ev)
>  	return 0;
> =20
>  rpm_disable:
> +	clk_disable_unprepare(lpi2c_imx->clk);
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> @@ -630,6 +631,7 @@ static int lpi2c_imx_remove(struct platform_device *p=
dev)
>  	struct lpi2c_imx_struct *lpi2c_imx =3D platform_get_drvdata(pdev);
> =20
>  	i2c_del_adapter(&lpi2c_imx->adapter);
> +	clk_disable_unprepare(lpi2c_imx->clk);
> =20
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> --=20
> 2.23.0
>=20

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53kAsACgkQFA3kzBSg
KbbqfBAAr4xo6h3QMRN0UZqEYIpK0gzk/HZOftIiMf9vqWEa/cLiWftCZohgjDOT
jFS4aO+uyYJKdhT9bEDhoX61nuHXaEQVGBsWOS3Rp+JXvfOIo+vtSeTp64O38mqq
0+E7GBrQDsqyOHA7Iw3lhQftzQe4MJwE8EsgN9HzCTaEgtnfhBuCScdXiVYBV2Ad
TmLxHYEtERUnBRD+FiB6+HdrRi3KrrUsKPEZd/Mwe3ENfHi6CTaH8z4OM+f8aHOi
84cIBxJO7JlSl1JkZ0MQZ6IiL5yEC0RC0Nz871VfrJBRvfdUs+f0mHCk8hATepL+
fNtZNJIApBteuEhiA/WJ7A4X+QNNaWp60JZdpIUzhljevvGzjO5wK7GIlBZXHzxR
ApzQcQVDsj2fe054NHSpa2UfK3Z0ZULPa5L/SBZeV8gErQvoBXYXQOhTiucmGM8H
vnVHegYHx1gHeyIAmEAIJExbjNKDiw0qWPU29AQov1kkpFOlYSgu420x7sFaODY9
wT+typO0J5LgmA/YMepI5RMYOkB/pG4CkiNuYDxfCBuPjXxpyGTvHHtibnYInt+4
HV51Rmk5AMcYc8edLM6jrQNPo55fFyAJCgav36h7kf/IiAaL8hvc03MQZt7Tlkqa
Hds0OeOUO75afYoAjJVg9wC15OXww9V/8fUB39zf9zvdcqA7LKw=
=ebsn
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
