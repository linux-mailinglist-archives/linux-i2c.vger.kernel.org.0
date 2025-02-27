Return-Path: <linux-i2c+bounces-9623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600CA47F62
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4531B1713AF
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915A222D7B3;
	Thu, 27 Feb 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OE7nSJFO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCF6221574;
	Thu, 27 Feb 2025 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663382; cv=none; b=hWJ/eHdA8lamEHDM94BkbY9wkXhwznQZ7jNatdrwdefgW4yK/QiuV+gg78T9k4r6sdaIRmdpbPeImlLaMUUK1vI+4qQ7AyChFwe0vCUpMoWVNTUWDJXIFRkWp2X090DrpbQiCdVaYDwiXbtmt5qzg/rkySF1ogvuWvA61NUVce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663382; c=relaxed/simple;
	bh=aab2/SyQEGBUyaPseIJICjiOfGbAWP2jtmSGkYZMjyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVFppxvKku+prDK3XCBXWOjXaARbYQsHL0y29aFDihAHC3rGKER2Z4VJkdawAIQr5V5fYHlURzGJX+eA6W6PwPWRXEKHR9etphVIyy9G9DGBop6Auff20ByAK+LlIM4Ajanampe3f/1sTZ256T/WA6ln69eVp7s1fgrflST1bCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OE7nSJFO; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 309D944178;
	Thu, 27 Feb 2025 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740663378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cvfHkogpXmJPGabzvRVQY6bYL/xdH6T/pSVAZSPolY=;
	b=OE7nSJFO6AVAU7nKQEMLpFhSc0IPmxb8TaiyUlNSPkYWqxCSRQxZnHxlvrZPawuHbUx0Ox
	+fVhVhvrWMYpoVQoT5VAMLl2aG1fsL1X2eq7Dnuc2ArO721sADNrTL9WIUixr2E6B+E70n
	H8OQcuT+H0D890rQZpN0Ge4BD2E+NjBaGNjx0nd0HfDqDuiytoYaDP0PjIz/RIdpgY5QU/
	dI3uQoOEwJJCzisnazsqHBniFWyWx9/gdMIHqIrSedPkEnIFhDnx33nfU57wXxPYcx2EFR
	TstUZ5m4T9LXVVzp2puiJ8x0BejpPmGR/fwm2NXGuMmDYtIKJlgMItYrymvbXQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 6/9] i2c: atr: deduplicate logic in attach_addr()
Date: Thu, 27 Feb 2025 14:36:17 +0100
Message-ID: <3644500.iIbC2pHGDl@fw-rgant>
In-Reply-To: <20250225113939.49811-7-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-7-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9442157.CDJkKcVGEf";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart9442157.CDJkKcVGEf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Date: Thu, 27 Feb 2025 14:36:17 +0100
Message-ID: <3644500.iIbC2pHGDl@fw-rgant>
In-Reply-To: <20250225113939.49811-7-demonsingur@gmail.com>
MIME-Version: 1.0

On mardi 25 f=C3=A9vrier 2025 12:39:34 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> This is the same logic as in i2c_atr_create_mapping_by_addr().
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index b62aa6ae452e..5b53eaee0408 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -538,38 +538,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter
> *adapter, struct i2c_atr_chan *chan =3D adapter->algo_data;
>  	struct i2c_atr *atr =3D chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
> -	u16 alias;
> -	int ret;
> -
> -	ret =3D i2c_atr_reserve_alias(chan->alias_pool);
> -	if (ret < 0) {
> -		dev_err(atr->dev, "failed to find a free alias\n");
> -		return ret;
> -	}
> -
> -	alias =3D ret;
> +	int ret =3D 0;
>=20
>  	mutex_lock(&chan->alias_pairs_lock);

A mutex guard could be used here.

>=20
> -	c2a =3D i2c_atr_create_c2a(chan, alias, addr);
> +	c2a =3D i2c_atr_create_mapping_by_addr(chan, addr);
>  	if (!c2a) {
> -		ret =3D -ENOMEM;
> -		goto err_release_alias;
> +		dev_err(atr->dev, "failed to find a free alias\n");
> +		ret =3D -EBUSY;
> +		goto out_unlock;
>  	}
>=20
> -	ret =3D atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
> -	if (ret)
> -		goto err_del_c2a;
> -
>  	dev_dbg(atr->dev, "chan%u: using alias 0x%02x for addr 0x%02x\n",
> -		chan->chan_id, alias, addr);
> +		chan->chan_id, c2a->alias, addr);
>=20
> -	goto out_unlock;
> -
> -err_del_c2a:
> -	i2c_atr_destroy_c2a(&c2a);
> -err_release_alias:
> -	i2c_atr_release_alias(chan->alias_pool, alias);
>  out_unlock:
>  	mutex_unlock(&chan->alias_pairs_lock);
>  	return ret;

Best Regards,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart9442157.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAalEACgkQ3R9U/FLj
28608xAAi5fpoO6caP1MOe8d0s7ygUrw8YJUE6Pgx/wd7sK2psG9f8GmG/w/+qoU
jw1wPF5zSu+YDCGcnI3JPcXlAGOCx2vBqfqpmLNp9knq8Ixlh+bV+CDA/pM2/fs4
iBKV9PhMM570wasfgORjKeWGf1yWIHp7sVSY/ypBZo/NtACTTNC9bFTpUWbOG2mc
2lZZWf9bKt4GUeXCeaez9fbxf6au5GJb0qm/Z345UQD7Qqbn3DAcwqVe2N5zREWB
lfvox53EYxzPYaaUGgBPUozT1Wm/4boo9SxX9FHjViwkFb44WqZoFfkxRn9ybkBT
bCVFXgLdqfMSi8PjxfqY1gvntzC2DekoSK39XPCg7vCiWNeBI8JY6hEEt6ps/mX6
x+raY5BrisxALQqhmQBhi9xYAIILc4vOK3WB5S/15n77gmw6O1TSafn7Q2UXJQ15
HsvMfzYkLd8XHUHJV83wApmFH08ohTixU7F6wK6461bRALfoq7wxrONHQd/Qnx7V
iX6dZmyyha6gs+gYxMHpU/0D7MdJAr0N6gVe/vMa5Y2CZYazvAF23R8xctnahjEK
jQXZ/6WDAYM/iDADOcdgPCxEX1RhW5cCI/3ythcN1UDd9OK2oh71PPwSffbqRL35
gRwlNrh5IY3r2cwKby35E/6SdvuXLPNjRDM12UZEiV6LwuOxrAk=
=ZSY0
-----END PGP SIGNATURE-----

--nextPart9442157.CDJkKcVGEf--




