Return-Path: <linux-i2c+bounces-5972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9B967347
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2024 22:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 434C1B21F9F
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2024 20:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B817B180A76;
	Sat, 31 Aug 2024 20:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QRR6qaVU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF118139D1B
	for <linux-i2c@vger.kernel.org>; Sat, 31 Aug 2024 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725137881; cv=none; b=NiyMJHDiz9f0xtUP69oTCPjr+zdUUaQ4i9EI7z69i92xPQ3DFuScjHIcFYzHelMsYh5pEs6jQYX8RJwnnyru+DGJ7Mc8axONOaY1O6DatgpPB5pfNZGFu7HBu1uZwTH+DU2xfErBgiCUan5ar746kqBHSYn2Wwf/7nRAoMjJeN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725137881; c=relaxed/simple;
	bh=7BY3vgw7y2pxfquuUqGKMij85qoe+ckABSP0pZ/Y8WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeLmTwY8N7IJjzXv8DZ1COunESC30xKHXg1uxJAt0IFC8PGuoY5YZXAoXONWNpJ99/APE66ncHfC6beWhl2dW3m2G/e8IMIoOtUlaXrcwgxa3yv13byOJxJDi+hJWvuDDEFzENYORXxqaDpJ8b7+UJ/tl6bKSE6hwFFHjntwiSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QRR6qaVU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zNLm
	AJnyx71Pfq582arlmL8j4PFld3o+5DDO21ix+4Y=; b=QRR6qaVUCK9erdhPo/Kn
	RM4MzI8VO1I5PIhMNETeU36cX7bmnK3ex8VQVNcx1YJirWFENkhTy/kkHs1oZfdq
	xJDpjgfENgK7e0KZsUobD0Z4TL/EicgbE9lngHrinfNy72RKisf4crSE+9Hec9jY
	dt3pJcNXldbjhL6rKMlug5rkW1pCat7yh3hfkoaFbfnFWc46CxzyRV0D90rGH1ju
	3nOx4C6NiM76+vUp1/eoScCerB2ro1m6bpO7fyzC38UDvcKRSkXR0h3lDzAX0dNP
	kPNI+wDnc7P9fjWA5xRdfqR5/gdS5bkfSGw+obJxiEN4uigZ1Yg0+d8lQyuJXObC
	Vw==
Received: (qmail 3635973 invoked from network); 31 Aug 2024 22:57:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Aug 2024 22:57:53 +0200
X-UD-Smtp-Session: l3s3148p1@KE0j9gAh43xtKnBL
Date: Sat, 31 Aug 2024 22:57:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Message-ID: <ZtOD0e3ZBnabdK34@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dpR/Rm59Kxtb9gux"
Content-Disposition: inline
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>


--dpR/Rm59Kxtb9gux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 25, 2024 at 03:27:48PM +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which an amc6821 and devices that are reachable through an I2C-mux.
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821 reg 0xff).
>=20
> This driver is expected to be probed as a platform device with amc6821
> as its parent i2c device.
>=20
> Add support for the mule-i2c-mux platform driver. The amc6821 driver
> support for the mux will be added in a later commit.

Seems like DT maintainers are happy with the approach. From the I2C
perspective, this seems suitable as well. Just a few minor comments. Can
be fixed incrementally, from my POV. But basically:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


> +static inline int __mux_select(struct regmap *regmap, u32 dev)
> +{
> +	return regmap_write(regmap, MUX_CONFIG_REG, dev);
> +}

Does this really need to be a seperate function? I'd vote for merging it
into 'mux_select'. Also the __-prefix often means unlocked versions of
some call, so it is also a bit misleading.

> +static int mule_i2c_mux_probe(struct platform_device *pdev)
> +{
> +	struct device *mux_dev =3D &pdev->dev;
> +	struct mule_i2c_reg_mux *priv;
> +	struct i2c_client *client;
> +	struct i2c_mux_core *muxc;
> +	struct device_node *dev;
> +	unsigned int readback;
> +	int ndev, ret;
> +	bool old_fw;
> +
> +	/* Count devices on the mux */
> +	ndev =3D of_get_child_count(mux_dev->of_node);
> +	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
> +
> +	client =3D to_i2c_client(mux_dev->parent);
> +
> +	muxc =3D i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
> +			     I2C_MUX_LOCKED, mux_select, mux_deselect);
> +	if (!muxc)
> +		return dev_err_probe(mux_dev, -ENOMEM,
> +				     "Failed to allocate mux struct\n");

alloc_functions usually print something when failing.

> +		ret =3D i2c_mux_add_adapter(muxc, 0, reg);
> +		if (ret)
> +			return dev_err_probe(mux_dev, ret,
> +					     "Failed to add i2c mux adapter %d\n", reg);

The 'add_adapter' functions for sure print something when failing.

Thanks!

   Wolfram


--dpR/Rm59Kxtb9gux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbTg8kACgkQFA3kzBSg
Kbal7A/+PM4jZgxWTav2ZDGWds/ujnuVdXWpyfQu+IY/MpQVfmm2dqNa8Ru9RZW8
+RWhVE9EGt18HBsFki7E701Xv9ZwIy925OBGEk/UZEY4z5cjCPpQwCbKTjAy2+LR
LzDJQ3a1lMShSYyjUHFPdmglAOKcVbk1sBBXUnRVAYrgyXpzmn2XHpro+qLc7VPP
Xz+qyZfh4hgMFzThbY++4zk6PhH9fz34KDrDOJX8oToWLr84D+ItcXH2hFg2+fi8
Du0jIGP+zuhbXvaIkldW7yEjQllEXZXySUoVirgx1IRM9eO4Kgrmu35aUrKCMyOp
2KhKskdPlXDhL0IMYmUtdK3BFo3gqFC0KXNEFaSswdNCt8776BDKQnpCV+78mpTu
UOIHvYSLrSH2iWGlVJxsMwbT8Y22ty6/XmiRt0kVl2TqbfYIth42zQFjq26XPAOi
Ku6eQteE5AJs/098KcZpCICiJgOW/AfvuwGwRHu/5G3lUcHSr0EHGhk9TKrewA7w
n6li/coMHaRt3v5UORaTJ9MopLSW/HNsWg/vm0IKMbQV7KElKd/hELnb7t6PY+46
i3dIgp3DTSAqjJIJA3VpQCqI6ZptLBt7Me0yhQe50uznOp2jykz+1bfVat5eCuZ9
r9tgtViUP8BXvjc+yqvaXtnF73dhazVyP4vUasuyhghGYbMwHG0=
=ems9
-----END PGP SIGNATURE-----

--dpR/Rm59Kxtb9gux--

