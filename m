Return-Path: <linux-i2c+bounces-10090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CFA79F9B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 11:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E6B1661F7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 09:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6903824397B;
	Thu,  3 Apr 2025 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YOKoqQ16"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42C245018
	for <linux-i2c@vger.kernel.org>; Thu,  3 Apr 2025 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671018; cv=none; b=eyzzdV9LiYJD905Sozjau358e2LkxdTLnr14WmOpd2I6C51aoE/EVuOqOIu+WDNfWLIkR0dwCFToYHB1WYHF8wulavXmaBZTTUJWhQH318tNy9oLcm8+e73WIhEJ/ETPLPrRCIKThHuKgAwY/Z/YaRbeqfhSvah3+nW2fdXQYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671018; c=relaxed/simple;
	bh=qpQuP7aJIpBc+ziv8rKOH8KUF+cK15F9uJSNbo1YcKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoGOx3sGNOcmahZkBM0U5HpimL0+/pkIzxehKhgx0ysLoJQWTyQIcrw7qIPWXHw9m0RQ3UwWpnnX4n3dSt9DICArvBHZuNxIINIc2LXfr6R7jJbFeXio49PHDECB6m3kNqkpQxA00Yo+8GRIV0ckrFqse4HKIaAvqMZED8aCXrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YOKoqQ16; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3h+3
	XYPl+tcNEfQHM9GEv4E2JWrUtW/fBGgb/yLhisg=; b=YOKoqQ16rBBcIkqTQBWK
	qAYr07P0UM9F8ETKKwFDodhdAd9vfnebEJlUIDDoUaR8xMnpNSmZb1XNKD538PfM
	v5T2ookcaEQwVIVbH06TYzSEi1BcWslQtSEhB+q3o7+wNQXQrUeabsjQVgoioSSb
	loBRJPY+8abrGZ8cL5gTS001jYrloSwiubOly7cRNcWpUZ5YQWPEqUalud/RBm/r
	Azb0xtRC7X9dSHLe28z21FE/c1KeTY3BR0dAlZAYkBVbrXTtkRLH7zPWR+DmayAG
	h8QWZaAcCDqabVmbLc76EYIM5kJd9d0DN6KH+Eln63PLpzuw/efZfHTeF4a2Zg/N
	8g==
Received: (qmail 2310687 invoked from network); 3 Apr 2025 11:03:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Apr 2025 11:03:28 +0200
X-UD-Smtp-Session: l3s3148p1@VGsHC9wxFMYgAwDPXwaqAEtIN5mYkFJw
Date: Thu, 3 Apr 2025 11:03:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 1/3] i2c: core: Follow i2c-parent when retrieving an
 adapter from node
Message-ID: <Z-5O3-FSsHbn27lW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
 <20250205173918.600037-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U3h06jO4XCyQwGmf"
Content-Disposition: inline
In-Reply-To: <20250205173918.600037-2-herve.codina@bootlin.com>


--U3h06jO4XCyQwGmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Extend i2c_find_adapter_by_fwnode() to perform the walking from the
> given fwnode through i2c-parent references up to the adapter.

Even with the review of the schema going on, here are some comments
already.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/i2c/i2c-core-base.c | 43 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5546184df05f..cb7adc5c1285 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1827,14 +1827,55 @@ static int i2c_dev_or_parent_fwnode_match(struct =
device *dev, const void *data)
>   */
>  struct i2c_adapter *i2c_find_adapter_by_fwnode(struct fwnode_handle *fwn=
ode)
>  {
> +	struct fwnode_reference_args args;
> +	struct fwnode_handle *adap_fwnode;
>  	struct i2c_adapter *adapter;
>  	struct device *dev;
> +	int err;
> =20
>  	if (!fwnode)
>  		return NULL;
> =20
> -	dev =3D bus_find_device(&i2c_bus_type, NULL, fwnode,
> +	adap_fwnode =3D fwnode_handle_get(fwnode);
> +
> +	/* Walk extension busses (through i2c-parent) up to the adapter node */
> +	while (fwnode_property_present(adap_fwnode, "i2c-parent")) {
> +		/*
> +		 * A specific case exists for the i2c demux pinctrl. The i2c bus
> +		 * node related this component (the i2c demux pinctrl node
> +		 * itself) has an i2c-parent property set. This property is used
> +		 * by the i2c demux pinctrl component for the demuxing purpose
> +		 * and is not related to the extension bus feature.
> +		 *
> +		 * In this current i2c-parent walking, the i2c demux pinctrl
> +		 * node has to be considered as an adapter node and so, if
> +		 * the adap_fwnode node is an i2c demux pinctrl node, simply
> +		 * stop the i2c-parent walking.
> +		 */
> +		if (fwnode_property_match_string(adap_fwnode, "compatible",
> +						 "i2c-demux-pinctrl") >=3D 0)
> +			break;

I understand the unlikeliness of another demux driver showing up, yet
relying on compatible-values here is too easy to get stale. What about
checking if the i2c-parent property has more than one entry? That should
be only true for demuxers.

> +
> +		/*
> +		 * i2c-parent property available in a i2c bus node means that
> +		 * this node is an extension bus node. In that case,
> +		 * continue i2c-parent walking up to the adapter node.
> +		 */
> +		err =3D fwnode_property_get_reference_args(adap_fwnode, "i2c-parent",
> +							 NULL, 0, 0, &args);
> +		if (err)
> +			break;
> +
> +		pr_debug("Find adapter for %pfw, use parent: %pfw\n", fwnode,
> +			 args.fwnode);

Is this useful when creating the overlays? I tend to ask you to remove
it one RFC phase is over. If it is useful, it should be at least
dev_dbg?

> +
> +		fwnode_handle_put(adap_fwnode);
> +		adap_fwnode =3D args.fwnode;
> +	}
> +
> +	dev =3D bus_find_device(&i2c_bus_type, NULL, adap_fwnode,
>  			      i2c_dev_or_parent_fwnode_match);
> +	fwnode_handle_put(adap_fwnode);
>  	if (!dev)
>  		return NULL;
> =20
> --=20
> 2.47.1
>=20

--U3h06jO4XCyQwGmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfuTtsACgkQFA3kzBSg
KbYfVQ/9G27Iyj9jcvQ3xDFK3Bn1ABTFAiX24F9Tgio5mv2gijX1Z/uTDv5+0ZPJ
iHWRA+UYz38UnirzIoTdq+0Xb4wdjaLS8oC1N17yitM6fgvmXXrpNTYWM4/qThMP
3twQOfu5tD3g6KICVKjaxG+iuJNz3m4E2YpiltALvjo2mrIOa0eBAH3FZJH8whUr
KJF+q6umhJ8QQCw/+xpj2F9PWEhW9l2lotwfpVZr5cjWpXt4nrdT7DHh1YSTChC6
srL6TZdcIXgNiKZEqlTlU2DAPcKUpBhWuvBCnuRFnF+DVYeCgwZJvv6LoQXYJSFm
PzuuoOTKLMHmThPBfQqb+Dq/GLuLRz0pANiie/bXX9NQkGyET3rpVxKZ382s4I41
du6Yufi/lYsTMgdk8D1JtMrafgjzbT2EKkO9HLlBgjPUnnFvjVgKjYMZrOrUcyYk
6Y0vXNmODy4belvRWIeIfokp7+gHLqAFTHSrePILn7s69cm61lPxxYI9Ml9wC70z
/Q0yVL9DYrsEIk3F36dvXZ8MspeRYROourZJXMMR2dt2DAL8ifAeG+kumX9/LYgz
aO602J8xtSIG8wi53tgICILdYKgtcKPIms2IzamGncj7WSpEy3NqK9StWH61glNK
lo4Uu+PacwVVcRWJsFyRPW/LxlXGbIkRQNTT2I8nvVGKXR13+8c=
=Eryw
-----END PGP SIGNATURE-----

--U3h06jO4XCyQwGmf--

