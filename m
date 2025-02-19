Return-Path: <linux-i2c+bounces-9494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EACA3BAD6
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 10:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F69188208A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 09:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD7A1C700B;
	Wed, 19 Feb 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i9udF2Md"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B513DBB1;
	Wed, 19 Feb 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958775; cv=none; b=m1Fb1wXvPlgkGvPvSI9YRfwt+EDRUqqGb9gfOzwF9c3En4XSwWPsoJzDf+JPmIhizpFqHHZi7vbHkokK/7DJ/uOv9td9RL/0RDygNbhpIBSL1OYLSKWB2b4tIOZfaBjVwQ3GKh0vBp/I7QSXIT0cca9h3ANnCSk5EfD3oosdZJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958775; c=relaxed/simple;
	bh=VVmZ1t94laSDb1CDj+NkVnD18G2v8/iV64a8CkCO9Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLKuIP1voFtFbBQnwu+LN0jECqBlbVN38Z3w+z/bYrO+fyYxtVTy5sapvgSdBKrJDnZF/KWXx9nUaUXcLv9C93zEb/P9KqktDDaf3JFaG2dZ/QIn9QdWgaUNvouEhL/wfnAKOXKOrZ140sbnU1VQOpiLBDIq98aFg05jb9IOaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i9udF2Md; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0A8643150;
	Wed, 19 Feb 2025 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739958770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgcOqReuoYi9+3dGbbBaAaBh7Ej+UAFa0etXWozInys=;
	b=i9udF2MdXMUwtO4mfxc6EUU1lVvvQltZc+A3e6Rh55jEG0BMVnERamffwMuYDkM3/fbkPZ
	dt38YezlaK6LtYHoYDR9hZ2ZId0VmkCV/bLETIUXsPq71eZYMt96CAlDu6wy7F0ObLz/gd
	gMYEDpGZ+w+4DB378O4wl5wcdLqly/wOSwqP5t15IA42nQPzUooqva1Fh0jaoOv7zBdJnn
	hwbgcXHRDgr3/DF0wUHoHjsddcWCHTuHVJAAqvKLtBBvGoKL6dKP1MDuBLboSPNISDWewR
	BsfQZoVp1GjHZI8Zmb9uLB8T38Rd7CllXkM5ug40VamEAMBPhGJfN1UyceTBlQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH 3/3] i2c: atr: add passthrough flag
Date: Wed, 19 Feb 2025 10:52:44 +0100
Message-ID: <4414628.ejJDZkT8p0@fw-rgant>
In-Reply-To: <20250203121629.2027871-4-demonsingur@gmail.com>
References:
 <20250203121629.2027871-1-demonsingur@gmail.com>
 <20250203121629.2027871-4-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2229005.Mh6RI2rZIc";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2229005.Mh6RI2rZIc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH 3/3] i2c: atr: add passthrough flag
Date: Wed, 19 Feb 2025 10:52:44 +0100
Message-ID: <4414628.ejJDZkT8p0@fw-rgant>
In-Reply-To: <20250203121629.2027871-4-demonsingur@gmail.com>
MIME-Version: 1.0

Hello Cosmin,

On lundi 3 f=C3=A9vrier 2025 13:15:17 heure normale d=E2=80=99Europe centra=
le Cosmin=20
Tanislav wrote:
> Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
> the child ATRs need to be forwarded as-is since the parent I2C ATR can
> only do address remapping for the direct children.
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
> to be passed through, since they are already remapped by the child ATRs,
> and disables dynamic remapping, since devices that need passthrough
> messages to be forwarded as-is, can only handle remapping for their
> direct children.
>=20
> There's no case where a non-remapped address will hit the parent ATR.

I'm having trouble understanding this, because it seems like there's a=20
contradiction with your previous statement:

> add a flag that allows unmapped addresses to be passed through

Unmapped addresses are "non-remapped" by definition right? And they can hit=
 the=20
parent ATR since we're adding a flag to allow them to pass through...

>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c   | 26 ++++++++++++++++++--------
>  include/linux/i2c-atr.h | 20 +++++++++++++++++---
>  2 files changed, 35 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 13f7e07fd8e87..5f0e8f1cf69f7 100644
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
> @@ -241,7 +243,7 @@ static void i2c_atr_release_alias(struct
> i2c_atr_alias_pool *alias_pool, u16 ali
>=20
>  /* Must be called with alias_pairs_lock held */
>  static struct i2c_atr_alias_pair *
> -i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr, bool
> new_addr) {

IMO the "new_addr" naming is quite confusing.

After this patch is applied, the expected behavior is:

i2c_atr_find_mapping_by_addr() called from i2c_atr_attach_addr():
  1. find existing mapping, return it
  2. OR find free alias, create mapping and return it
  3. OR remap used alias, return mapping
  4. OR fail

i2c_atr_find_mapping_by_addr(), called from anywhere else:
   1. find existing mapping, return it
   2. OR find free alias, create mapping and return it
   3. OR if the ATR has PASSTHROUGH set, fail
   4. OR remap used alias, return mapping
   5. OR fail

To me, the proposed code doesn't make it immediately obvious why the=20
PASSTHROUGH flag should have anything to do with not attempting alias=20
remapping.

Moreover, if we truly want to ignore *all* unmapped addresses, then shouldn=
't=20
we also give up on step 2.? (the one that tries to map a free alias to the=
=20
requested address).

In that case, I think something like this would be clearer:

in  i2c_atr_smbus_xfer() and i2c_atr_map_msgs():

```
#never attempts to create a new mapping, only to find an existing one
c2a =3D i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
if (!c2a) {
	if (PASSTHROUGH)
		# Since passthrough is set, we ignore unmapped addresses
		goto success or whatever;

	c2a =3D i2c_atr_create_mapping(chan, msgs[i].addr);
	if (!c2a)
		fail;
}
```

in i2c_atr_attach_addr():

```
c2a =3D i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
if (!c2a) {
	c2a =3D i2c_atr_create_mapping(chan, msgs[i].addr);
	if (!c2a)
		fail;
}
```

So what I'm suggesting is to remove all c2a mapping creation logic from
find_mapping_by_addr() entirely, and to move it to a separate function.

Please let me know what you think.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart2229005.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAme1qewACgkQ3R9U/FLj
2870hxAAmaH5ckqAaNlmDNpqprewOBmKb/d7BWmT3ND1a1xNo0QyZBtVPQeHFCu2
iYUpgsfN2U7klc5aUi6FUXLxHR4gUhH6pjFk/CDTG1yPgJvit1Dg42PiUM3r7gmb
uEA5U9tCkK6ku+ZD+2dvAz7+S6q0J6WA2aD4Kjs4hLzXqunw1WkhZ6Zx4PxI2eiV
EOw62FobCosbkwWz7Pa3q5+ozsu/WmoUeP0MkVdZOaWDzvKYdxAag5aJZTYrGNQa
82+6a0tSSoa1gpk0wQC5wFgtj7p8vpKAG1yofhIJDYik9oILfsaTTah6ZtDSN6qE
ym3qKTZe0jrKrKnbdcDyyieY/jLMQyaDuP1iqX3L/nkUVvxuNwUTTaUSQC0wS5oa
A279awso+p1lzgX46WtcgRSUrYjG6M9sP6INpRSg5XF5stNoySnvvelkp4xCMMx0
cnUnnNb32bkPz4hx0Oy++qniHBOJ+HzfHE2GqvJrsiNUKzguO+SCXK86kGEh2nwA
xmkRNm2U7+m+zRZvzbN/MLgBwbc2mk5bWWXkc0odO9FQuH0eZqN2hJ00/Eu8jZLG
xieG8HiPOLbB8KGDAsya6xsQFhjW7LIo78zmrXmH6VCcTzJg5BVp3z4+lZ00kZ7z
hevpxBZCXXgKaEHUspN9eykexwBCjegMzrIF0VKXAeQ9b6LUiPU=
=mEhX
-----END PGP SIGNATURE-----

--nextPart2229005.Mh6RI2rZIc--




