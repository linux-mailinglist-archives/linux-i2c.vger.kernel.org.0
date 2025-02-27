Return-Path: <linux-i2c+bounces-9621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD97A47F38
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22CC4188BD3F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A14F22FAE2;
	Thu, 27 Feb 2025 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MMwtKBoS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D021348;
	Thu, 27 Feb 2025 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662992; cv=none; b=ekAos5oRcr+TLpVn7U7E3JPRTnzdcwWT+rcyJQxXmX6ia7mGW3WJ3xrfQO5nHGq38CkTbqIwX9QY20rIPOcd4U8HHVew+hf2yUlqLpgW+3SUixkiVM4DYQ0LgblkQvhmjGd9Jn/bddNrRKslZn6ixojiX2alwrcmeeBWsOoPjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662992; c=relaxed/simple;
	bh=Nwhd4OZtliqZsAoZoDMXDvhhUpF+FtLEIJOBMqh1slw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcyuQV04jH9K8IPZprcGcg6lIX+OysXb19YQdsI6f/ZYD2qu2l8hRhO0kkp0KYKHlNtJLF2BBsYz+iqNE19qa1eodL2iPCXqZ2qlt2UIUIxNSLcEsH8VXNx0U6h+4BAexA6Zoej1ykfZwmkudRnEw6Vt3doDto4LOzlVGAwvxOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MMwtKBoS; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CAFE44314;
	Thu, 27 Feb 2025 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740662988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vZlQ+L0d9woraUT0imE1qtr7t7bPWyUh+8fZi7cUQUY=;
	b=MMwtKBoSR+2JjU1AgBq6gnJYrszp6p4JwR696n0HgF+uPU3cZSfsyZv/C30DtMfVOCd8Ww
	JfMzHH9SxTq+Rwu3iT5nhRvxBn9XaOAQ7YCuAfKMV4bfE5ipDzBkqkRwwsEIZIZu2NbIql
	0k8mlfPsw1Fn55IpEzHbuKSKVgrfRfMUh39nYbGyB70+l4GJoGFKsey04fSgt3Ki0Xeb78
	+VJXKBId0DGZzzoVexdhTG25JDRGBNq6zh+s9iT6n/Z8gXCMh99ocpyH7htYwDEden9frO
	tapf8dHw7/E4zLngOtFLpR91dVD+YyAu0BPmXArku901s5uDEyV2LEYBsF3Jvg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 4/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Date: Thu, 27 Feb 2025 14:29:47 +0100
Message-ID: <10646964.nUPlyArG6x@fw-rgant>
In-Reply-To: <20250225113939.49811-5-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-5-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2329555.iZASKD2KPV";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2329555.iZASKD2KPV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Date: Thu, 27 Feb 2025 14:29:47 +0100
Message-ID: <10646964.nUPlyArG6x@fw-rgant>
In-Reply-To: <20250225113939.49811-5-demonsingur@gmail.com>
MIME-Version: 1.0

On mardi 25 f=C3=A9vrier 2025 12:39:32 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> The i2c_atr_get_mapping_by_addr() function handles three separate
> usecases: finding an existing mapping, creating a new mapping, or
> replacing an existing mapping if a new mapping cannot be created
> because there aren't enough aliases available.
>=20
> Split up the function into three different functions handling its
> individual usecases to prepare for better usage of each one.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c | 108 ++++++++++++++++++++++++++++++------------
>  1 file changed, 79 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index f2485d1670a2..9c4e9e8ec802 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -239,9 +239,26 @@ static void i2c_atr_release_alias(struct
> i2c_atr_alias_pool *alias_pool, u16 ali spin_unlock(&alias_pool->lock);
>  }
>=20
> -/* Must be called with alias_pairs_lock held */
>  static struct i2c_atr_alias_pair *
> -i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +{
> +	struct i2c_atr_alias_pair *c2a;
> +	struct list_head *alias_pairs;
> +
> +	lockdep_assert_held(&chan->alias_pairs_lock);
> +
> +	alias_pairs =3D &chan->alias_pairs;

This variable isn't really needed since it's only being used once.

> +
> +	list_for_each_entry(c2a, alias_pairs, node) {
> +		if (c2a->addr =3D=3D addr)
> +			return c2a;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct i2c_atr_alias_pair *
> +i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  {
>  	struct i2c_atr *atr =3D chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
> @@ -253,38 +270,55 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *ch=
an,
> u16 addr)
>=20
>  	alias_pairs =3D &chan->alias_pairs;
>=20
> -	list_for_each_entry(c2a, alias_pairs, node) {
> -		if (c2a->addr =3D=3D addr)
> -			return c2a;
> +	if (unlikely(list_empty(alias_pairs)))
> +		return NULL;
> +
> +	list_for_each_entry_reverse(c2a, alias_pairs, node)
> +		if (!c2a->fixed)
> +			break;
> +
> +	if (c2a->fixed)
> +		return NULL;
> +
> +	atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
> +	c2a->addr =3D addr;
> +
> +	list_move(&c2a->node, alias_pairs);
> +
> +	alias =3D c2a->alias;
> +
> +	ret =3D atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a-
>alias);
> +	if (ret) {
> +		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err=20
%d\n",
> +			addr, chan->chan_id, ret);
> +		goto err_del_c2a;

I think this goto should be removed, the corresponding label code is only u=
sed=20
here anyway.

>  	}
>=20
> +	return c2a;
> +
> +err_del_c2a:
> +	i2c_atr_destroy_c2a(&c2a);
> +	i2c_atr_release_alias(chan->alias_pool, alias);
> +	return NULL;
> +}
> +
> +static struct i2c_atr_alias_pair *
> +i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +{
> +	struct i2c_atr *atr =3D chan->atr;
> +	struct i2c_atr_alias_pair *c2a;
> +	u16 alias;
> +	int ret;
> +
>  	ret =3D i2c_atr_reserve_alias(chan->alias_pool);
> -	if (ret < 0) {
> -		// If no free aliases are left, replace an existing one
> -		if (unlikely(list_empty(alias_pairs)))
> -			return NULL;
> +	if (ret < 0)
> +		return NULL;
>=20
> -		list_for_each_entry_reverse(c2a, alias_pairs, node)
> -			if (!c2a->fixed)
> -				break;
> +	alias =3D ret;
>=20
> -		if (c2a->fixed)
> -			return NULL;
> -
> -		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
> -		c2a->addr =3D addr;
> -
> -		// Move updated entry to beginning of list
> -		list_move(&c2a->node, alias_pairs);
> -
> -		alias =3D c2a->alias;
> -	} else {
> -		alias =3D ret;
> -
> -		c2a =3D i2c_atr_create_c2a(chan, alias, addr);
> -		if (!c2a)
> -			goto err_release_alias;
> -	}
> +	c2a =3D i2c_atr_create_c2a(chan, alias, addr);
> +	if (!c2a)
> +		goto err_release_alias;
>=20
>  	ret =3D atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a-
>alias);
>  	if (ret) {
> @@ -302,6 +336,22 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *cha=
n,
> u16 addr) return NULL;
>  }
>=20
> +static struct i2c_atr_alias_pair *
> +i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +{
> +	struct i2c_atr_alias_pair *c2a;
> +
> +	c2a =3D i2c_atr_find_mapping_by_addr(chan, addr);
> +	if (c2a)
> +		return c2a;
> +
> +	c2a =3D i2c_atr_create_mapping_by_addr(chan, addr);
> +	if (c2a)
> +		return c2a;
> +
> +	return i2c_atr_replace_mapping_by_addr(chan, addr);
> +}
> +
>  /*
>   * Replace all message addresses with their aliases, saving the original
>   * addresses.

Best Regards,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart2329555.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAaMsACgkQ3R9U/FLj
287beQ//RFRkvUD2l4X3nOlxmKte3t1r4REEN3KBLfasBZO06e779IZR7COzhW4W
dO3ZCvtTHJgVeQzqie6mvlra1cQ2XUoImIgBrWUC/pOyADLZGMW1hcuHa+TsUXpp
OoHFAQQhVbaaNyFC2X0VPFAuvb0lZGFieLPGAK1yG6faTfVyVBw06Z17vquirdsY
RkUOGnnT1gIbhNrIq/+HtvjpGe7jF0MtN9P+j0j/P81wMxsj6nTH8e36gDrMH8bx
Xotwk5wueRjl1DwB+KQXZQv57qi4lNXxJvJZeaIl2Ho7xlwkCFuyGXDM4iu+RH8j
mKJj8TY8RGVZgBrtvGhjQ1xv2uU2kOpXF73g8BU3dFMQoUMhInS2FqzXNcUnnKD9
avb5B6iNen9dX+lg7c98YBtrdPbf4xxlMi/d44gY2HNk/a4GJp9DqCW/3H7blEu8
C5DhjfXW2PyY3OhmDFmnaB1A6UcITuQ95Z3O7UJj9WxzCc1U2vrFe12ePFtaA6pN
1aPi62CFySX2PtnDhTCuCvtQo5Wq5b98emSs50Dz9enym5f1oBBx+MepuEsynIwM
1mP9GCLSdKGf4RqPV2Dytj8EnMH5jUlajnlAt5ATyH+5MVH9QgS5F3SVZrCw+8l0
CcTJver7/eNZq1jWPUmlh/EYaMXaTowL4RPJ1GFnFfIZnwADX08=
=bDbB
-----END PGP SIGNATURE-----

--nextPart2329555.iZASKD2KPV--




