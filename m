Return-Path: <linux-i2c+bounces-9627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917CA48096
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 15:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77F9F188509F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC67323815D;
	Thu, 27 Feb 2025 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bpKekfN/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D22376E4;
	Thu, 27 Feb 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664996; cv=none; b=IX/iLoIyv7iVw9/2XD2y/71YMZZ/3XUgRXWXodYk3HQo5hcOsloxEj+h5Xh1Vlyk+/lXG3nTGmN1LNdgkvCn7US6dI4Ir2AH7ChafVFSCp1Ac2XxTzroYdfT6Og9D4+AxGa3zTwHduLIFMQCpld6i0hl8hk3DwP3GnAhGrG4Ips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664996; c=relaxed/simple;
	bh=JLO+r7+iufzO2U2reXscB7TDJvieGJZdLVLiFsAxonw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDV9m3uzoFd1U9mTCFbKlO6LcjL+fOZaPRgE3AjjFnhbvAK2RdvGRMIzv3ut9hhp1l2nxL0dzCijLxyZ+oxLMJdgOduZy22L10g+4CE6sdzzyPuPJfNMyrktGUSMMRSCwG6RQc/nhhZmElKWFtEIGwRSPYhprOIN1JOU7BoMWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bpKekfN/; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDBDB442C4;
	Thu, 27 Feb 2025 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740664992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0WNgqZ5dUPe8U7ULV55+q6IefmukksRnh+jtW8bNVBo=;
	b=bpKekfN/I8165LpdFb/JLvepAsynPSLiGnzyRBAq6fD03Bv9J4cdxN8etNCwX/ZUqQ+/8t
	lqwJrDDAXBMk0H5U8v4eVd5IPeWCYdACqXkd9+G1+HTrQC2XS2yZQYkMvgO8lkNnnPj9ai
	GtoNstE0Q5Df7tlzwp+4hqpXCIyNuSXw0Rdv4wsiwq7azrJiRNxKAqWAH/K/jyppVcFn8K
	sXCU56VcEb5jONIKfTbJvVAf2W5IOyTPsoD6NVy4aFocvk8J1yQ5E1zEH7QjyF+kHMbtXc
	2a4yd7bRWSrxcuXY6cDnURxwNXoNsm82jNV0JQSfQWXf7JQNV5qXnN31WZyVDg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 9/9] i2c: atr: add passthrough flag
Date: Thu, 27 Feb 2025 15:03:11 +0100
Message-ID: <3833744.MHq7AAxBmi@fw-rgant>
In-Reply-To: <20250225113939.49811-10-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-10-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1991169.taCxCBeP46";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart1991169.taCxCBeP46
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 9/9] i2c: atr: add passthrough flag
Date: Thu, 27 Feb 2025 15:03:11 +0100
Message-ID: <3833744.MHq7AAxBmi@fw-rgant>
In-Reply-To: <20250225113939.49811-10-demonsingur@gmail.com>
MIME-Version: 1.0

On mardi 25 f=C3=A9vrier 2025 12:39:37 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
> the child ATRs need to be forwarded as-is if the parent I2C ATR can
> only do static mapping.
>=20
> In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
> address remapping hardware capabilities, but it is able to select which
> GMSL link to talk to, allowing it to change the address of the
> serializer.
>=20
> The child ATRs need to have their alias pools defined in such a way to
> prevent overlapping addresses between them, but there's no way around
> this without orchestration between multiple ATR instances.
>=20
> To allow for this use-case, add a flag that allows unmapped addresses
> to be passed through, since they are already remapped by the child ATRs.
>=20
> There's no case where an address that has not been remapped by the child
> ATR will hit the parent ATR.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c   | 3 +++
>  include/linux/i2c-atr.h | 2 ++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index f7b853f55630..1986fa055f20 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -394,6 +394,9 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan,
> struct i2c_msg *msgs, c2a =3D i2c_atr_get_mapping_by_addr(chan,
> msgs[i].addr);
>=20
>  		if (!c2a) {
> +			if (atr->flags & I2C_ATR_PASSTHROUGH)
> +				continue;

Shouldn't this check also be added to i2c_atr_smbus_xfer?

> +
>  			dev_err(atr->dev, "client 0x%02x not mapped!\n",
>  				msgs[i].addr);
>=20
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 2f79d0d9140f..b3797a930a7a 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -22,9 +22,11 @@ struct i2c_atr;
>   * enum i2c_atr_flags - Flags for an I2C ATR driver
>   *
>   * @I2C_ATR_STATIC: ATR does not support dynamic mapping, use static
> mapping + * @I2C_ATR_PASSTHROUGH: Allow unmapped incoming addresses to pa=
ss
> through */
>  enum i2c_atr_flags {
>  	I2C_ATR_STATIC =3D BIT(0),
> +	I2C_ATR_PASSTHROUGH =3D BIT(1),

As stated for the previous patch, I'd prefer the "I2C_ATR_F_*" naming=20
convention.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart1991169.taCxCBeP46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAcJ8ACgkQ3R9U/FLj
285D1xAAlqUgtz5BOzvP2dOWUz3GDJ3RIS3PLNrs0uwv2T0ZY7RALzyn8XQpIJ9I
mjLLrJYb9dEsTZLx0e1w0w2VlS2lvKT12QymmnmA0/ssjone82Kx76OXhoCBrSLH
ymXq00zn/JRH2/mgtsVXLZzMb0muuiBZvHIBlmn6gw0fuk2HSHh4zlfCvLWfZxFW
hc9GRGjGs/oMQuhIGHH/Fito8lYL1MgWnqYMwB3MHVmK/vSNgdQmJJ/fR9DPzgwR
K5SeE0TIMnUb9s0ip4zVHtCTSSuhGBtNpvJsRvSTiXkh5pGdNosVQTb29a5ATsTK
tG4GY40xcDjgUmYBQbFMK0G++crQYqpILGj84C+UhuAgrgksxnbWMzribadBHB1v
tTXxFuSV/GxALN/4Zseq02kmc6FOKE5TorMd2U1+6NgMGcexkbTgy+KnNn94jm/P
Iuanv9SM/ufZyKKttGct0RTNVt0wfauSo0Bb5QVSt4uwh3g+glyD+JPv9ExtKgbB
+xo6u1aKuKTXBebgQQ02eawSLk6LCHd+ymf+Hy5KxYE3lQidu20/KUBDauT0kL/v
Nx52lywx6frHO8Kx6E6IJISiBsq1Y239IilrIDTVK0jMVHNkq1CPYRT3jUtKxVrv
IWloY+UavJKWi4QGVX7pDaFkQYU2oWq6SCk+xFJxJMXKzxCF5v4=
=1eMY
-----END PGP SIGNATURE-----

--nextPart1991169.taCxCBeP46--




