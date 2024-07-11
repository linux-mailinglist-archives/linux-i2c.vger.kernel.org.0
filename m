Return-Path: <linux-i2c+bounces-4941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E292F0FB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 23:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 526321C22A2B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 21:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3837C19FA87;
	Thu, 11 Jul 2024 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hAoUEAEy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1EA19FA65
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720732672; cv=none; b=ijUoZVwfE5GsvWAFYUawgkp+Bed2iD10l1Q3If1tw42f0Fa/7pZMB0pR1yvH6wvOYm+eA+fLNd+M8G4cRIFMK5Txn33DdhothHPZrMsmLk1GALS2/K4DStOFU1uwGEV1aT7IS1yUUAf8hzmfZt1TLRSf0EgMvsU/b2Afe2FfIss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720732672; c=relaxed/simple;
	bh=T0pMyu+dEeOOHsmMaRtnW/KHBfIg6LHAAXQX3YROcGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSkqOwtuGyFHz5pOqDsqKRSxvXnyf83ZpFMLSr89FOAUgONQbe6I5mc+/xvdbqsYbZiBvIEmaL/nVfa4lBY1rt8u5WvkXu7ArvD+aqdecXnUYtjgOUYOuvfUB7jr1Bj3l3ZvQpUXOef8ryNiRwjE5s8dCAlla4kkDLT6Ovd9Fh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hAoUEAEy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1Cnf
	7pWFKheCtd3q1iTzsFDAeHD0a9e5vdpFCoy3tcg=; b=hAoUEAEyd/lZBSbtIZm5
	XvC73OWHJyrxHMbEwCAjxDXcWayhcVFAhvbliAjIddspGhoycFLpY8hRpautD/V/
	Jy8OA6SyN76pWawnCOuPx+hUxpCkzSKkKyMvhoG9I3YhoearreERQrMkOPcJCY+9
	4HSbIqKjpwTm+tRKzmgvaxLBKyGQegnUJtZXwZAf3lj0UWviDJeNtrWeLDrO2Kil
	OU5+Mih2ePtH4W6EbR4tMmoelKX5ZI4UUpJVQdtGxhOhkILuGB3yQXq2HD+3Mv/e
	6WqFriZaCAIz1DmGH/44Yd+GR8ZSU4m9xSzPF511Kx+rtzZiAIo/jsr4U/HkKT9h
	6Q==
Received: (qmail 957054 invoked from network); 11 Jul 2024 23:17:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 23:17:43 +0200
X-UD-Smtp-Session: l3s3148p1@g/orS/8c7MZehhtW
Date: Thu, 11 Jul 2024 23:17:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: ensure Gen3+ reset does not disturb local
 targets
Message-ID: <ZpBL90Ko-B9oxCLK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240711083043.8334-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UtqE6BQ8LQL5xqzI"
Content-Disposition: inline
In-Reply-To: <20240711083043.8334-2-wsa+renesas@sang-engineering.com>


--UtqE6BQ8LQL5xqzI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 10:30:44AM +0200, Wolfram Sang wrote:
> R-Car Gen3+ needs a reset before every controller transfer. That erases
> configuration of a potentially in parallel running local target
> instance. To avoid this disruption, avoid controller transfers if a
> local target is running. Also, disable SMBusHostNotify because it
> requires being a controller and local target at the same time.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: 3b770017b03a ("i2c: rcar: handle RXDMA HW behaviour on Gen3")

> ---
>  drivers/i2c/busses/i2c-rcar.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 8f2ede534f30..29cbeda59f3e 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -884,6 +884,10 @@ static int rcar_i2c_do_reset(struct rcar_i2c_priv *p=
riv)
>  {
>  	int ret;
> =20
> +	/* Don't reset if a slave instance is currently running */
> +	if (priv->slave)
> +		return -EISCONN;
> +
>  	ret =3D reset_control_reset(priv->rstc);
>  	if (ret)
>  		return ret;
> @@ -1176,6 +1180,7 @@ static int rcar_i2c_probe(struct platform_device *p=
dev)
>  	if (of_property_read_bool(dev->of_node, "smbus"))
>  		priv->flags |=3D ID_P_HOST_NOTIFY;
> =20
> +	/* R-Car Gen3+ needs a reset before every transfer */
>  	if (priv->devtype >=3D I2C_RCAR_GEN3) {
>  		priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  		if (IS_ERR(priv->rstc)) {
> @@ -1186,6 +1191,9 @@ static int rcar_i2c_probe(struct platform_device *p=
dev)
>  		ret =3D reset_control_status(priv->rstc);
>  		if (ret < 0)
>  			goto out_pm_put;
> +
> +		/* hard reset disturbs HostNotify local target, so disable it */
> +		priv->flags &=3D ~ID_P_HOST_NOTIFY;
>  	}
> =20
>  	ret =3D platform_get_irq(pdev, 0);
> --=20
> 2.43.0
>=20

--UtqE6BQ8LQL5xqzI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQS/IACgkQFA3kzBSg
KbY8HRAAg0U/3YGhBJzi0l9c7UC5yk6ZMjujDKLwjnye2S6Fs2cdhBR7gFM2JlUQ
/Cuocm1+bzG6YJdUl5sa/ZMnGOyACaPpj9lqNA1Uc8zoKkYHaLA3CxQ2nsILvuKf
E8scAHyeJbRrpbodbi1Pjx7QegDy9bG1kTLmlX/kSLmR2dFtMnwk/0yCVKr5swUU
3kb+ZRQx4B0qig77JWJibnESJdqsDSpNZ6H3I5f210QtnfQZc0pYNOOEY7BPkPwC
l7c4lkXcX+86KbYasWe6TmX5yeATlgmOt7nC+smd8AsBjIeNHBk8YJUGNWjj/7W2
MEFKdR9gAPXkOrB5d+iaUfV9hZQwE8fSVBYOVVKpyhZwMWcH4Vh/2MWZ7ICfR9SF
I2zDXIDVbkCHUabwvJ1HpBIt1QRaLzTZ/5Zn6JOhL28OC79jGtLD9eRSA6aOSNJf
mxo9ldIhu/Pd0RCdATZ3Hsk3E3blBGR/IjpqS/DSTaB0PTvo7FrSvZ9xgwI14beR
qJf7K1Ld+YSzqp5dhX6/2UqP4o7DO8Y2e/xQ5IeLYLIW09XoNeoMR8aYXQ4OMyGW
lJFKs3ZG1+PoqyaWgZuU/6JbD+U6u5gviDdF1sMJysbGwzdWy/Ne+ndExwHj+Z8x
rz+ws70gY5gUZx4d/MMy7xJ5m8esaz29rRQlzIX3pKMlKf6SjJ8=
=1ESC
-----END PGP SIGNATURE-----

--UtqE6BQ8LQL5xqzI--

