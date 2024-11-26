Return-Path: <linux-i2c+bounces-8223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 398AC9D939D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88918B224D6
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7668B1ABEBB;
	Tue, 26 Nov 2024 08:55:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF113C3F6
	for <linux-i2c@vger.kernel.org>; Tue, 26 Nov 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611354; cv=none; b=R3EgaT1ybyvLQm30xVKKSYawDxa9CxP0Zh9XTnTsz6q9JOjEjUWg5QR4blICNBuhugcRkXrjgo/0JG2+OTo8qfs4IHomZ89gFafzmvjGL2MCS1CKY81aA37M4eVQ5y1zbRbRdeRYCjknRIbNuca7sFjUtd+yvMayU9efDiFSyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611354; c=relaxed/simple;
	bh=Nop+Fg8GS/0NpREEDIYBgHXxXm3xMK8uqkpjtLrbD+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4POB5B5ss7FB/zUHPQh3qjaBPW2YtkjrF2wtvoQJ4MAPpmWc9ORK01ClqV3EkPF/yNWMU12F+PQclsqxYm4Lal2g032YD5JgsOHmDtXbMUy3L7zQ4yyT+YyEV5yS5EpWuaeIbcqhboIspBlS4L0jm+k58RpNdjZ7mUTk0COfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFrME-0002WF-HB; Tue, 26 Nov 2024 09:55:42 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFrMD-000Der-0E;
	Tue, 26 Nov 2024 09:55:41 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6F55437D766;
	Tue, 26 Nov 2024 08:55:41 +0000 (UTC)
Date: Tue, 26 Nov 2024 09:55:41 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Message-ID: <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idutayp4iw5aar47"
Content-Disposition: inline
In-Reply-To: <20241126082535.1878554-1-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--idutayp4iw5aar47
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 26.11.2024 16:25:35, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>=20
> Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
> have not ready yet.
>=20
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
>=20
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.
>=20
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> Change for V2:
> - According to Frank's comments, wrap at 75 char and Simplify fix code
>   at i2c_imx_dma_request().
> - Use strict patch check, fix alignment warning at i2c_imx_dma_request()
> ---
>  drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..4e5633166a1e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struc=
t *i2c_imx)
>  }
> =20
>  /* Functions for DMA support */
> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> -						dma_addr_t phy_addr)
> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_=
t phy_addr)
>  {
>  	struct imx_i2c_dma *dma;
>  	struct dma_slave_config dma_sconfig;
> -	struct device *dev =3D &i2c_imx->adapter.dev;
> +	struct device *dev =3D i2c_imx->adapter.dev.parent;
>  	int ret;
> =20
>  	dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>  	if (!dma)
> -		return;
> +		return -ENOMEM;
> =20
>  	dma->chan_tx =3D dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct=
 *i2c_imx,
>  	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
>  		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
> =20
> -	return;
> +	return 0;
> =20
>  fail_rx:
>  	dma_release_channel(dma->chan_rx);
> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct=
 *i2c_imx,
>  	dma_release_channel(dma->chan_tx);
>  fail_al:
>  	devm_kfree(dev, dma);
> +
> +	return ret;
>  }
> =20
>  static void i2c_imx_dma_callback(void *arg)
> @@ -1803,6 +1804,13 @@ static int i2c_imx_probe(struct platform_device *p=
dev)
>  	if (ret =3D=3D -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
> =20
> +	/* Init DMA config if supported */
> +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret =3D=3D -EPROBE_DEFER) {
> +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> +		goto clk_notifier_unregister;
> +	}

Don't spam the logs if the driver defers probing, it's not a error. And
it looks strange to ignore all other errors here. Either add a comment
here, something like "continue without DMA", or let the function return
0 in case the driver should continue and propagate the error if the
caller should take care of it.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--idutayp4iw5aar47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFjQoACgkQKDiiPnot
vG9yIgf+KeMn1/k836gXtD2Zg1FuuWGbO2RIaxvsdEJjgPTk0/uKBRn6hl6dcD6E
WLeR88F/j/GCTj5kOuFWCDaUlTyIsnWvSHpy/Rj9BebzsAL6dbiUWQ7a8CGvvA6L
PLtCoNC5JcooBTmqGXIRjRdBbpFnNo+BHPmwoeseFIbsTitjuESVjvsG6m8gDoAn
w1zieedbBsvAhpiukgxVFav5PDe2wdrXtTBdwNYvynBhnbVNjxxrxhz3k5eaaBWq
BSutaHC/ObVAMb8UqORr8TqQqlwZBuiPSxghHXdRl/7IMFhs6F3QdKIjlMZQPsoI
YJcLA6tWs00i/VanuDHWa8WA2RMyWg==
=Wvyt
-----END PGP SIGNATURE-----

--idutayp4iw5aar47--

