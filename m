Return-Path: <linux-i2c+bounces-9626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF0A48045
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 15:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970F1188F054
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366F122DFB9;
	Thu, 27 Feb 2025 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IDR48fTt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A36270052;
	Thu, 27 Feb 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664747; cv=none; b=o4FF50b9rl3PKhoh6T4gVE9wpn3Ya5Vu12APGtCK+3mCLVMXLZ0dVDbZG6Prn1jaU2Paui7PzK0Us4JUfAufGff6QWb97ROXOeOOeClehN23JrNiQKCSws8KaPGY6wCr5ZuWUx206v9a6U8JmBd8CH8XAbgBHHQcZRy2/rLc94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664747; c=relaxed/simple;
	bh=HGh33usQleWjYunFjvp304tr6jXYGv54ojxy6qJicOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5ZcrNz4J3h3nJJKJAycpgc1HpT5QTH8FHrG7BkFnBDqCOdUhYgQlytU23n0YQmChDaR5Mta9G2B2jaw70qMYFuQbe6mpdwy9WSEvqKzhoMlxaETdMKt3IkTHJHFt5ZqVeGhac5KcCov5gABTBZ8Yh4o2Nb1HWAVYxCIvSQX7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IDR48fTt; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B99D44390;
	Thu, 27 Feb 2025 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740664742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+wEXAbiIyJGTapZTN2/j91NsLjEFudw5DUy9jUWLx8=;
	b=IDR48fTtHz1ZTIyI53JuxdYDfS+WRcBKqHk7Ak8bWbjLSvHd3lh9eCc5j+Si9QOh0WGsfY
	+x4AKAfdOWv22brCaMf7iDyC6IRQc7zJeRwCmuDbHr3lUDLrXT9WP650efnq4JVeNaRssu
	BM2qqzZ2XyShFsSqt0baEmdg8YGV0abwDdqovMC1NcMTxzX2WqJdRzar4cN8agUOCarq0n
	Oyqf0LJTEpesYRyzyJTnZE3nXCK97CKUlhRKXm1Kc1RU+ROoJDqVjEQHU733ThfQf5fcZR
	0phrqJ7KOKoFuQoDZge4nphUK/lCRmm4pQulRhoRSsbOzuSjefX/52kxnPFokQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: atr: add static flag
Date: Thu, 27 Feb 2025 14:58:56 +0100
Message-ID: <4439912.ejJDZkT8p0@fw-rgant>
In-Reply-To: <20250225113939.49811-9-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-9-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2253401.Mh6RI2rZIc";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2253401.Mh6RI2rZIc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: atr: add static flag
Date: Thu, 27 Feb 2025 14:58:56 +0100
Message-ID: <4439912.ejJDZkT8p0@fw-rgant>
In-Reply-To: <20250225113939.49811-9-demonsingur@gmail.com>
MIME-Version: 1.0

On mardi 25 f=C3=A9vrier 2025 12:39:36 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> Some I2C ATRs do not support dynamic remapping, only static mapping
> of direct children.
>=20
> Add a new flag that prevents old mappings to be replaced or new mappings
> to be created in the alias finding code paths.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c   | 16 ++++++++++++----
>  include/linux/i2c-atr.h | 20 +++++++++++++++++---
>  2 files changed, 29 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index d8748d71ae15..f7b853f55630 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -106,6 +106,7 @@ struct i2c_atr_chan {
>   * @lock:      Lock for the I2C bus segment (see &struct
> i2c_lock_operations) * @lock_key:  Lock key for @lock
>   * @max_adapters: Maximum number of adapters this I2C ATR can have
> + * @flags:     Flags for ATR
>   * @alias_pool: Optional common pool of available client aliases
>   * @i2c_nb:    Notifier for remote client add & del events
>   * @adapter:   Array of adapters
> @@ -122,6 +123,7 @@ struct i2c_atr {
>  	struct mutex lock;
>  	struct lock_class_key lock_key;
>  	int max_adapters;
> +	u32 flags;
>=20
>  	struct i2c_atr_alias_pool *alias_pool;
>=20
> @@ -339,12 +341,16 @@ i2c_atr_create_mapping_by_addr(struct i2c_atr_chan
> *chan, u16 addr) static struct i2c_atr_alias_pair *
>  i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  {
> +	struct i2c_atr *atr =3D chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
>=20
>  	c2a =3D i2c_atr_find_mapping_by_addr(chan, addr);
>  	if (c2a)
>  		return c2a;
>=20
> +	if (atr->flags & I2C_ATR_STATIC)
> +		return NULL;
> +
>  	c2a =3D i2c_atr_create_mapping_by_addr(chan, addr);
>  	if (c2a)
>  		return c2a;
> @@ -543,7 +549,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter
> *adapter, mutex_lock(&chan->alias_pairs_lock);
>=20
>  	c2a =3D i2c_atr_create_mapping_by_addr(chan, addr);
> -	if (!c2a)
> +	if (!c2a && !(atr->flags & I2C_ATR_STATIC))
>  		c2a =3D i2c_atr_replace_mapping_by_addr(chan, addr);
>=20
>  	if (!c2a) {
> @@ -702,8 +708,9 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *a=
tr)
> return ret;
>  }
>=20
> -struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *d=
ev,
> -			    const struct i2c_atr_ops *ops, int max_adapters)
> +struct i2c_atr *i2c_atr_new_flags(struct i2c_adapter *parent, struct dev=
ice
> *dev, +				  const struct i2c_atr_ops *ops, int=20
max_adapters,
> +				  u32 flags)
>  {
>  	struct i2c_atr *atr;
>  	int ret;
> @@ -725,6 +732,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *paren=
t,
> struct device *dev, atr->dev =3D dev;
>  	atr->ops =3D ops;
>  	atr->max_adapters =3D max_adapters;
> +	atr->flags =3D flags;
>=20
>  	if (parent->algo->master_xfer)
>  		atr->algo.master_xfer =3D i2c_atr_master_xfer;
> @@ -752,7 +760,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *paren=
t,
> struct device *dev,
>=20
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_NS_GPL(i2c_atr_new, "I2C_ATR");
> +EXPORT_SYMBOL_NS_GPL(i2c_atr_new_flags, "I2C_ATR");
>=20
>  void i2c_atr_delete(struct i2c_atr *atr)
>  {
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 1c3a5bcd939f..2f79d0d9140f 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -18,6 +18,15 @@ struct device;
>  struct fwnode_handle;
>  struct i2c_atr;
>=20
> +/**
> + * enum i2c_atr_flags - Flags for an I2C ATR driver
> + *
> + * @I2C_ATR_STATIC: ATR does not support dynamic mapping, use static
> mapping + */
> +enum i2c_atr_flags {
> +	I2C_ATR_STATIC =3D BIT(0),

I'd personally prefer the name I2C_ATR_F_STATIC, which would make it explic=
it=20
that this is a flag.

> +};
> +
>  /**
>   * struct i2c_atr_ops - Callbacks from ATR to the device driver.
>   * @attach_addr: Notify the driver of a new device connected on a child
> @@ -60,11 +69,12 @@ struct i2c_atr_adap_desc {
>  };
>=20
>  /**
> - * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
> + * i2c_atr_new_flags() - Allocate and initialize an I2C ATR helper.
>   * @parent:       The parent (upstream) adapter
>   * @dev:          The device acting as an ATR
>   * @ops:          Driver-specific callbacks
>   * @max_adapters: Maximum number of child adapters
> + * @flags:        Flags for ATR
>   *
>   * The new ATR helper is connected to the parent adapter but has no child
>   * adapters. Call i2c_atr_add_adapter() to add some.
> @@ -73,8 +83,12 @@ struct i2c_atr_adap_desc {
>   *
>   * Return: pointer to the new ATR helper object, or ERR_PTR
>   */
> -struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *d=
ev,
> -			    const struct i2c_atr_ops *ops, int max_adapters);
> +struct i2c_atr *i2c_atr_new_flags(struct i2c_adapter *parent, struct dev=
ice
> *dev, +				  const struct i2c_atr_ops *ops, int=20
max_adapters,
> +				  u32 flags);
> +
> +#define i2c_atr_new(parent, dev, ops, max_adapters) \
> +	i2c_atr_new_flags(parent, dev, ops, max_adapters, 0)

There aren't that many users of i2c_atr_new() yet, so I think it would be=20
preferable to just add the "0" parameter to existing callers (including=20
=46PC202 which this series depends on) rather than adding a layer of=20
indirection.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart2253401.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAb6AACgkQ3R9U/FLj
285XIxAAm4K2/5W9DdbgsIzpeTJE5w0ScVcwqUsrwSTPhgM02vMCyAyw1OTRdLS3
By7kRCadQLfzX6gSkf0aJkUxfVO79fGqBlz5tOpaF4T+aExASPt95IfMREIFN8yf
kdPfqbd2r5Sjhk37Waf2kLIcfXKezcTDV4FQGPG53jZRWMVWJodVvCcrLLZsOcAW
zlh7xvh3WPHKDRsSJC0lBYOfLqez+UDDrmulX3QUj93vEtkIMzZt9gSXpQOPSWe2
ZxttE3+Erj+5bS4/EfnaLyspYVU7D8i6gUeMa9G7FNuTF++z40yLJXXnm8uk4FjN
oKlzIry3kTzctRSVVrkGZnbC/JpRYuvsXbE3pWubh1vnF36SgciqxUuXudssja/h
4pid4Z9lBFk3kNH7SrP5JXK0VEeJjj+bhDkB+ziNqQo63bBEdTp8HWuYIDUP+pOv
1OQsD4D84D3OpEIK4hP3eu4TYBwyThUIqj+H5g/GTnnnhciGK8tdm5rBf7cMz6d0
jcPZzax0HVGFFQkGbjIpm/BpNzHtWGXmLrqoivlWDLlunOjRWujYFu6+GIGYArsJ
bQaFsXQHksxVFtkAWBFhjiiRU/VYmnJBNs4IWTDq083mFsn21N3yzsBMONphSgnW
ZWIuTJ3tRbMO6XUkGXJsa9FHoVJMUhJhtXOAQXZ/HQp2g/qo394=
=7F2i
-----END PGP SIGNATURE-----

--nextPart2253401.Mh6RI2rZIc--




