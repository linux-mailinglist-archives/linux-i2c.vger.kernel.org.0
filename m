Return-Path: <linux-i2c+bounces-8242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB209DA415
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 09:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5681656DB
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB4C188CC6;
	Wed, 27 Nov 2024 08:42:52 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875111114
	for <linux-i2c@vger.kernel.org>; Wed, 27 Nov 2024 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696972; cv=none; b=jFsJ8AvHTvtgHK/ItKh/0y0YmTtOnQX3zrlGD17Yfa6t3zpDTApvcrkwUIQ6boyE6BPE6bFKggsWfoeUkj0dwihx1VVdOMoh7D7ptdhaZdHP6GWg0jFWPUSdcTtNXznf/H7Oszf0CSqnAQQ4phM7Cnp/lUdzZv+0f4m085jXRMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696972; c=relaxed/simple;
	bh=NlYQBbt4vAGGW65taHg686I5E+/mZFReRuNLnbeBtSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O70w6Ah5y+5degRmW2pbzGW7PO7o5xNQVmSA8EK+57YfPcIwmXNQtwdkpRCf5bKoPRt2i9XMRQN1XPiGxY27rfop84yGwPT93ibm0grgovWYAFXDPsJ2gkePoURlOjHLnfFJcddWv8BjRxGPdmfy+IQ8nVQ0OdEBQuMIlLdB7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGDdB-0007ev-U1; Wed, 27 Nov 2024 09:42:41 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGDdA-000Od7-2j;
	Wed, 27 Nov 2024 09:42:41 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4B92637E23A;
	Wed, 27 Nov 2024 08:42:41 +0000 (UTC)
Date: Wed, 27 Nov 2024 09:42:40 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
Message-ID: <20241127-attentive-orthodox-tuna-8f8af0-mkl@pengutronix.de>
References: <20241127083818.2108201-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxqnpspionffusqk"
Content-Disposition: inline
In-Reply-To: <20241127083818.2108201-1-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--pxqnpspionffusqk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 27.11.2024 16:38:18, carlos.song@nxp.com wrote:
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
> Change for V4:
> - Output "Only use PIO mode" log in debug level when no DMA configure.
> Change for V3:
> - According to Marc's comment, remove error print when defer probe.
>   Add info log when DMA has not been enabled and add error log when
>   DMA error, both won't stuck the i2c adapter register, just for remindin=
g,
>   i2c adapter is working only in PIO mode.
> Change for V2:
> - According to Frank's comments, wrap at 75 char and Simplify fix code
>   at i2c_imx_dma_request().
> - Use strict patch check, fix alignment warning at i2c_imx_dma_request()
> ---
>  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..b11d66d56c55 100644
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

Why is this change needed? What's the purpose?

>  	int ret;
> =20
>  	dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);

This means you bind the allocated memory to the parent device, not the
i2c device anymore.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pxqnpspionffusqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdG234ACgkQKDiiPnot
vG8A7gf7B/b0e/ASM4AusSjiFR0rAASfg7BeudhvJ3auw76AlPe6JjyyTodUlfur
xfFTVzsqrCeeuCq7lkJfILu2RPFu4vVhR6PNc3ubUyimyxYJYrJdTJgj3IvCPArd
+xI1QsI5zo/H2TYU1+y8woXHVqnLosva6A8FKH7hnsOxGnk5UXJLmBDiLsThuYdw
oWevSaTDQXAZZH82ImQ+Rwiax/fABhMEomldtCK7uJ72JTG269xmmMNifHYF5749
tn9Vtca6nizXN90og71/kiMnABwotiFD5GGbprEb67i3XAkbN85cewMv/2gFsNUn
v5bcHKwgORbWdRuq3HaPfCbJVwWofw==
=xqso
-----END PGP SIGNATURE-----

--pxqnpspionffusqk--

