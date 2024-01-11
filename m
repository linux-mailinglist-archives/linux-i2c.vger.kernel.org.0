Return-Path: <linux-i2c+bounces-1264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786A82A997
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 09:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7691C2358C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 08:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5614DFBFC;
	Thu, 11 Jan 2024 08:51:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21814FC10
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jan 2024 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNqmj-0001ht-Ud; Thu, 11 Jan 2024 09:51:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNqmg-001sxL-Vn; Thu, 11 Jan 2024 09:51:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNqmg-00796n-2r;
	Thu, 11 Jan 2024 09:51:30 +0100
Date: Thu, 11 Jan 2024 09:51:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	linux-i2c@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <zac3ukluinnmybdmmkwqbq3zjlha4f5pri4zhxrfg2vfshr7ez@nc25m4uxmroc>
References: <20240110120556.519800-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2noxqvniyazonyh"
Content-Disposition: inline
In-Reply-To: <20240110120556.519800-1-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--j2noxqvniyazonyh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jan 10, 2024 at 01:05:56PM +0100, Alexander Stein wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> Instead of repeatedly calling clk_get_rate for each transfer, register
> a clock notifier to update the cached divider value each time the clock
> rate actually changes.
> A deadlock has been observed while adding tlv320aic32x4 audio codec to
> the system. When this clock provider adds its clock, the clk mutex is
> locked already, it needs to access i2c, which in return needs the mutex
> for clk_get_rate as well.
>=20
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v8:
> * Improved commit message describing an actual observed deadlock
>=20
> Changes in v7:
> * Use dev_err_probe
> * Reworked/Shortened the commit message
>  It is not about saving CPU cycles, but to avoid locking the clk subsystem
>  upon each transfer.
>=20
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 40 +++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 678b30e90492a..3070e605fd8ff 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -5,6 +5,7 @@
>   * Copyright 2016 Freescale Semiconductor, Inc.
>   */
> =20
> +#include <linux/atomic.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> @@ -99,6 +100,8 @@ struct lpi2c_imx_struct {
>  	__u8			*rx_buf;
>  	__u8			*tx_buf;
>  	struct completion	complete;
> +	struct notifier_block	clk_change_nb;
> +	atomic_t		rate_per;
>  	unsigned int		msglen;
>  	unsigned int		delivered;
>  	unsigned int		block_data;
> @@ -197,6 +200,20 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *=
lpi2c_imx)
>  	} while (1);
>  }
> =20
> +static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct clk_notifier_data *ndata =3D data;
> +	struct lpi2c_imx_struct *lpi2c_imx =3D container_of(nb,
> +							  struct lpi2c_imx_struct,
> +							  clk_change_nb);
> +
> +	if (action & POST_RATE_CHANGE)
> +		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
> +
> +	return NOTIFY_OK;
> +}
> +
>  /* CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKHI/=
2 */
>  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  {
> @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *=
lpi2c_imx)
> =20
>  	lpi2c_imx_set_mode(lpi2c_imx);
> =20
> -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> +	clk_rate =3D atomic_read(&lpi2c_imx->rate_per);
>  	if (!clk_rate)
>  		return -EINVAL;
> =20
> @@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return ret;
> =20
> +	lpi2c_imx->clk_change_nb.notifier_call =3D lpi2c_imx_clk_change_cb;
> +	ret =3D devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> +					 &lpi2c_imx->clk_change_nb);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "can't register peripheral clock notifier\n");
> +	/*
> +	 * Lock the clock rate to avoid rate change between clk_get_rate() and
> +	 * atomic_set()
> +	 */
> +	ret =3D clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "can't lock I2C peripheral clock rate\n");
> +
> +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx->clks[0].clk));
> +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> +	if (!atomic_read(&lpi2c_imx->rate_per))
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "can't get I2C peripheral clock rate\n");
> +

If the clkrate isn't expected to actually change, you can just delay the
call to clk_rate_exclusive_put() until driver unbind time and not
register a notifier at all. The result would be more lightweight, you
wouldn't even need an atomic variable for .rate_per.

https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@pengut=
ronix.de/
might be beneficial for that.

Having said that, improving the locking in the clk framework to not
trigger this deadlock would be nice.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--j2noxqvniyazonyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWfrBEACgkQj4D7WH0S
/k5AmAf/X/cJzH5AEbFxQ9KMNhp+kVjtFDmm3H0blDvactJSisu+bxixea+Rirzr
n+eePI9G80hnXDs2WiNXrliT5az39yANHvknKxZ3Eu4FE6EoywiJIKLMaNO4kUFv
viXpuXp+ZBgq8ZU2pZUHjcxMAwR4I0UjiczURj+XMmynK0TRfPXEhKlNvejIuJqE
MNw+wKlAcmCdODnhg+kvoWaAozgjnlQvc94zmy2CLDgBc+GM3FVWbz6NlgDpTJzM
KrX+YHbGpRfpUhpy+/K+NaToOiYTPDGpiux1UKC/dllOSMW85pH3W200PfkCwVMw
NAA2yzbQN5gWk7r/8Kbz4xR5TfzfWw==
=xibz
-----END PGP SIGNATURE-----

--j2noxqvniyazonyh--

