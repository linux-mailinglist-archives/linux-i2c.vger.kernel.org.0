Return-Path: <linux-i2c+bounces-9620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6803A47F2E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE0E18951E4
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780402343AE;
	Thu, 27 Feb 2025 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Viqxhn1T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176222F38C;
	Thu, 27 Feb 2025 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662754; cv=none; b=mHL3+EvCl0mwYpeX12tZ4ibsYExJodyDrLPegwyvYGzTSAtkhXMkhwAQ5rjjbKz87Uwu9OHmC6P5Eb6JbfpXD7ArX84Eh0zidEzFgEKSpX4d2/g+2MsYQMftd0lwC6mJUZTxcJozFKgz7JuLyJi8mhATMU07CVJE6uKGPbLvEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662754; c=relaxed/simple;
	bh=xhIbnn19xYJykk9ajpzhPJWiLKMhdCbhFzYt9+0wUzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5QJVdO9F3KcD61clHsR8lZumuIJgpgCXH1xAIYAWWWp/jdGeh15LSxozfU6fUxmddmxmez7Ku9lYnOf5bakh5blR8gmiou5oHS77wpb86QO8AR8Yr4XkvO+ymWHbM17nALsIZYfRMhv+jtErRm9EHb/qjd3DhTkHgvujnMsfcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Viqxhn1T; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 264BE433D6;
	Thu, 27 Feb 2025 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740662750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/TdedDa3vdjABWC4gCUJO3yynX77VFd8JSQhuT9S5yY=;
	b=Viqxhn1TBC3XzKkMKtp9KDDaZB3ys1TiHV4zLbQ9dCQleTP7pQGH4xi/lfX7zrYh1cf0i3
	Zy+I/to2IlIRMJn8ZF2PKFE2WaHM8luzsSJ7pUQQIWiL0BxYIKf1eMqELE0Ath3hWoFGgw
	QIgzlaanBSEfvJP7L+Ad6zUJB2jqMQ3ayhi4tXX1a1+ec6Bc3FwuWVYH4RWLLW539h9mTr
	tOOipMGmIditZEZB+/fFJRIHwbgYSPv8uDB1Whi8n17vkqeUd2gvgmrOGJB6zXWB+6ItXU
	vF2eU591x2cSmlQeX+ntetxAMh5xE0gjwdxGbTwX3p5NBlvK+NM2DxtGcoSaoQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 3/9] i2c: atr: find_mapping() -> get_mapping()
Date: Thu, 27 Feb 2025 14:25:45 +0100
Message-ID: <3008657.e9J7NaK4W3@fw-rgant>
In-Reply-To: <20250225113939.49811-4-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-4-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3367768.aeNJFYEL58";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekkeffvdeugfekjeegfefhvdetuefhtdelieduheeileduledvteelgefgffffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdpr
 hgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3367768.aeNJFYEL58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 3/9] i2c: atr: find_mapping() -> get_mapping()
Date: Thu, 27 Feb 2025 14:25:45 +0100
Message-ID: <3008657.e9J7NaK4W3@fw-rgant>
In-Reply-To: <20250225113939.49811-4-demonsingur@gmail.com>
MIME-Version: 1.0

On mardi 25 f=C3=A9vrier 2025 12:39:31 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> A find operation implies that a null result is not an error.
>=20
> Use get naming to clarify things and to prepare for splitting up the
> logic inside this function.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index f6033c99f474..f2485d1670a2 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -241,7 +241,7 @@ static void i2c_atr_release_alias(struct
> i2c_atr_alias_pool *alias_pool, u16 ali
>=20
>  /* Must be called with alias_pairs_lock held */
>  static struct i2c_atr_alias_pair *
> -i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  {
>  	struct i2c_atr *atr =3D chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
> @@ -335,7 +335,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan,
> struct i2c_msg *msgs, for (i =3D 0; i < num; i++) {
>  		chan->orig_addrs[i] =3D msgs[i].addr;
>=20
> -		c2a =3D i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
> +		c2a =3D i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
>=20
>  		if (!c2a) {
>  			dev_err(atr->dev, "client 0x%02x not mapped!\n",
> @@ -428,7 +428,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *ada=
p,
> u16 addr,
>=20
>  	mutex_lock(&chan->alias_pairs_lock);
>=20
> -	c2a =3D i2c_atr_find_mapping_by_addr(chan, addr);
> +	c2a =3D i2c_atr_get_mapping_by_addr(chan, addr);
>=20
>  	if (!c2a) {
>  		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
> @@ -536,7 +536,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter
> *adapter,
>=20
>  	mutex_lock(&chan->alias_pairs_lock);
>=20
> -	c2a =3D i2c_atr_find_mapping_by_addr(chan, addr);
> +	c2a =3D i2c_atr_get_mapping_by_addr(chan, addr);
>  	if (!c2a) {
>  		 /* This should never happen */
>  		dev_warn(atr->dev, "Unable to find address mapping\n");

Looks good to me. This is more of a preparation/improvement patch rather th=
an=20
a fix so I think it's okay to leave it in your series.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart3367768.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAZ9kACgkQ3R9U/FLj
285C5Q/7B6+cggNuHY6tdArMV371AqqVTkom8lS/9Yu0c9VxAyJ5WE/z0vPCcTur
E3XJkwCQGueUYwfvUbe3updmRTqnDdam7XZgv0h4ihpQOy7lAwhe7pNkYIL+19CG
yNL2x9zXgiP2cat/BiNj22xTrCd76faA8CIrtFPQDNQE46PslZ7TbBlPvIWO9l1w
KsS6ZCW4GGkJuXUFIx7u9t4axDEnfRa13zL8EbTlXjGRwVqcq6nuUCYQnvYlp3v3
iNrazLf3KSH519hNbfZeTL5woGZ4PVGP+tWggkamImQ90jg/ORc7LgWtlhZls5m/
two1OGvfgwAs83hk18SHqKzFsPGLH2yx0qdXsnrNOWUSbKZ8zIclIyz+yxQGdv+Y
KzCvK6jMTtygvOqtmJpkXvQbUgL3RoiRKGR7AZQMsbe16Yh28jMmznQuBjI0K4PE
hbj8SjF2bIR/t/nHNG6RUk1qKOivAJTXkUm8aimkJzgPJf/u0yfmEb6EKSGozmpD
7kyruQYpYIbTjOFwhF3JT1nTF847xPKuYsep0xCOE259VQcyGySsrGQqu8VMmtah
P1j+5/+hdGptqzwWo8x5CO+GiCYa9Ui15ElLuDDb78hfS7kgOIRARK0YKE0PdXXR
+FGB16w/5UZq0XHhyHkwd9pMsHWhZAlcl3te3SiPKVapAjZOSo8=
=ZN+t
-----END PGP SIGNATURE-----

--nextPart3367768.aeNJFYEL58--




