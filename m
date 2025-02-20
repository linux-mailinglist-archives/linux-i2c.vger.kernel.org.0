Return-Path: <linux-i2c+bounces-9516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E14A3E10C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 17:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CCAE7A8DA1
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 16:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D9A13A87C;
	Thu, 20 Feb 2025 16:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z1hBa5cC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2920CCC3;
	Thu, 20 Feb 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069623; cv=none; b=bvLIEJXD5Npfymf8qVHAOOLBMElqlbuCP7jdne6qIXCgmjylS7e0EeCOv/GYkYC4VZ45NUXOur3Van/fPWsGYgMsXmmKabVyMa0+jNlDUDiWiR4lqm08EbkgWuIZ09rSDvhyF3ONUykLtfPlTLfAhDBff385SDIu4yqvYww60S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069623; c=relaxed/simple;
	bh=/pEY2pbZ+ePlTQQjsQZio+7TRqK1puqgKhuPQizw+tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHXY2ZuwroaO3Mm3Sh8fjcgw85zxDa5Ps/gJdwljy9mkav/Xo2CMb/geZD+CDdsvpDtRO/rpQRHsbcQqcIm56C1fat6FfHqJfdm14j1873CKWZ3ReXNwDvXoOaa6cFpLIOHlXP/Er5rI6+wo/e9BnZBHn7FcyJQFSRfLQAO/lM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z1hBa5cC; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8668A44400;
	Thu, 20 Feb 2025 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740069619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoC4EhCrV7YwNNF4Th0SR8RDWFklJMXxytRmlEsEeNA=;
	b=Z1hBa5cCtstUzZqEWBsC67fZel86wMGcqg3ZbdtnxVaM/mu860oTNxM3S9VJogGx9SEi4n
	NuEoKFFZYV+RZUnjT9Z4d201to5tbbgZ2uXbpBY/jA4qv4T1KxyGzdpedF5X9VERg9/KiG
	go18hbr5kQyX5f1+oGFn5DHbIFvd85D1/FEvNiH8DxnuLQkzKbYHi6E5MxMgNDhtIBh1Jj
	+ne1AjLIi4BQ5YSg7qA38w6o8p56GdnONsiTdC7Nug/inv/2+zVoiW6cQPyxvPAkN2IFZm
	+Am44ZQIqBnkH2lhxSSw2h7pp0ZjWwqBMih4ovHMlx+M23GLkw1soq92P+9tzg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: atr: add passthrough flag
Date: Thu, 20 Feb 2025 17:40:13 +0100
Message-ID: <2209854.PYKUYFuaPT@fw-rgant>
In-Reply-To: <72a4a706-c673-4f64-b0b4-6d70e2daf621@gmail.com>
References:
 <20250203121629.2027871-1-demonsingur@gmail.com>
 <4414628.ejJDZkT8p0@fw-rgant>
 <72a4a706-c673-4f64-b0b4-6d70e2daf621@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart22817234.EfDdHjke4D";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart22817234.EfDdHjke4D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH 3/3] i2c: atr: add passthrough flag
Date: Thu, 20 Feb 2025 17:40:13 +0100
Message-ID: <2209854.PYKUYFuaPT@fw-rgant>
In-Reply-To: <72a4a706-c673-4f64-b0b4-6d70e2daf621@gmail.com>
MIME-Version: 1.0

On mercredi 19 f=C3=A9vrier 2025 11:22:12 heure normale d=E2=80=99Europe ce=
ntrale Cosmin=20
Tanislav wrote:
> On 2/19/25 11:52 AM, Romain Gantois wrote:
> > Hello Cosmin,
> >=20
> > On lundi 3 f=C3=A9vrier 2025 13:15:17 heure normale d=E2=80=99Europe ce=
ntrale Cosmin
> >=20
> > Tanislav wrote:
> >> Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
> >> the child ATRs need to be forwarded as-is since the parent I2C ATR can
> >> only do address remapping for the direct children.
> >>=20
> >> In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
> >> address remapping hardware capabilities, but it is able to select which
> >> GMSL link to talk to, allowing it to change the address of the
> >> serializer.
> >>=20
> >> The child ATRs need to have their alias pools defined in such a way to
> >> prevent overlapping addresses between them, but there's no way around
> >> this without orchestration between multiple ATR instances.
> >>=20
> >> To allow for this use-case, add a flag that allows unmapped addresses
> >> to be passed through, since they are already remapped by the child ATR=
s,
> >> and disables dynamic remapping, since devices that need passthrough
> >> messages to be forwarded as-is, can only handle remapping for their
> >> direct children.
> >>=20
> >> There's no case where a non-remapped address will hit the parent ATR.
> >=20
> > I'm having trouble understanding this, because it seems like there's a
> >=20
> > contradiction with your previous statement:
> >> add a flag that allows unmapped addresses to be passed through
> >=20
> > Unmapped addresses are "non-remapped" by definition right? And they can
> > hit the parent ATR since we're adding a flag to allow them to pass
> > through...
> Non-remapped address means addresses that have never been remapped, on
> any ATR instance, not on the parent one.
>=20

Ah I see, that makes more sense.

> It's impossible for non-remapped addresses to reach the parent ATR
> since the direct children are remapped by the parent ATR and the
> children of the child ATRs are remapped by the child ATRs.
>=20
> Unampped address means addresses that are not remapped on the current
> ATR instance (the parent one, in this case, since that's where the flag
> is supposed to be used).
>=20
> I agree that my explanation was a bit confusing.
>=20

Well ATR's aren't the most straightforward kind of component anyway, but in=
=20
any case I definitely think that these explanations of the "unmapped" and "=
non-
remapped" terminology should be in the commit log.
=20
> >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> >> ---
> >>=20
> >>   drivers/i2c/i2c-atr.c   | 26 ++++++++++++++++++--------
> >>   include/linux/i2c-atr.h | 20 +++++++++++++++++---
> >>   2 files changed, 35 insertions(+), 11 deletions(-)
> >>=20
> >> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> >> index 13f7e07fd8e87..5f0e8f1cf69f7 100644
> >> --- a/drivers/i2c/i2c-atr.c
> >> +++ b/drivers/i2c/i2c-atr.c
> >> @@ -106,6 +106,7 @@ struct i2c_atr_chan {
> >>=20
> >>    * @lock:      Lock for the I2C bus segment (see &struct
> >>=20
> >> i2c_lock_operations) * @lock_key:  Lock key for @lock
> >>=20
> >>    * @max_adapters: Maximum number of adapters this I2C ATR can have
> >>=20
> >> + * @flags:     Flags for ATR
> >>=20
> >>    * @alias_pool: Optional common pool of available client aliases
> >>    * @i2c_nb:    Notifier for remote client add & del events
> >>    * @adapter:   Array of adapters
> >>=20
> >> @@ -122,6 +123,7 @@ struct i2c_atr {
> >>=20
> >>   	struct mutex lock;
> >>   	struct lock_class_key lock_key;
> >>   	int max_adapters;
> >>=20
> >> +	u32 flags;
> >>=20
> >>   	struct i2c_atr_alias_pool *alias_pool;
> >>=20
> >> @@ -241,7 +243,7 @@ static void i2c_atr_release_alias(struct
> >> i2c_atr_alias_pool *alias_pool, u16 ali
> >>=20
> >>   /* Must be called with alias_pairs_lock held */
> >>   static struct i2c_atr_alias_pair *
> >>=20
> >> -i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> >> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr, bool
> >> new_addr) {
> >=20
> > IMO the "new_addr" naming is quite confusing.
>=20
> Could you suggest a better name? I picked new_addr since when that flag
> is true, we are mapping a new address, the call is coming from
> i2c_atr_attach_addr().

My issue with this terminology is that "new address" could mean a number of=
=20
things, including "an address that the ATR hasn't encountered before". IMO =
the=20
effects of the flag on the function body should be understandable without h=
aving=20
to go through all of the function's call sites.

Rather than renaming the flag however, I'd rather we not handle this logic =
in=20
find_mapping_by_addr() at all. If we just search for mappings in=20
find_mapping_by_addr() and separate out mapping creation into another funct=
ion,=20
we can avoid the need for such a flag altogether.

> When we're mapping a new address, and we are in passthrough mode, we're
> free to reserve a new alias.
> I've since then modified the conditions slightly to cover an edge case.
>=20
> if (!new_addr && (atr->flags & I2C_ATR_PASSTHROUGH))
> 	return NULL;
>=20
> ret =3D i2c_atr_reserve_alias(chan->alias_pool);
> if (ret < 0) {
> 	if (atr->flags & I2C_ATR_PASSTHROUGH)
> 		return NULL;
>=20
> 	...
> }
>=20
> With this change, if we've made it past the section where we look for
> an existing mapping, and we're not adding a new address, and we're in
> passthrough mode, we return NULL. Passthrough mode shouldn't allow
> aliases to be reserved dynamically, since the hardware can only map
> direct children.
>=20
> Also, if we are adding a new address, and we failed to reserve a free
> alias, and we are in passthrough mode, we don't allow replacing an
> existing mapping.
>=20
> > After this patch is applied, the expected behavior is:
> >=20
> > i2c_atr_find_mapping_by_addr() called from i2c_atr_attach_addr():
> >    1. find existing mapping, return it
> >    2. OR find free alias, create mapping and return it
> >    3. OR remap used alias, return mapping
> >    4. OR fail
> >=20
> > i2c_atr_find_mapping_by_addr(), called from anywhere else:
> >     1. find existing mapping, return it
> >     2. OR find free alias, create mapping and return it
> >     3. OR if the ATR has PASSTHROUGH set, fail
> >     4. OR remap used alias, return mapping
> >     5. OR fail
> >=20
> > To me, the proposed code doesn't make it immediately obvious why the
> > PASSTHROUGH flag should have anything to do with not attempting alias
> > remapping.
> >=20
> > Moreover, if we truly want to ignore *all* unmapped addresses, then
> > shouldn't we also give up on step 2.? (the one that tries to map a free
> > alias to the requested address).
> >=20
> > In that case, I think something like this would be clearer:
> >=20
> > in  i2c_atr_smbus_xfer() and i2c_atr_map_msgs():
> >=20
> > ```
> > #never attempts to create a new mapping, only to find an existing one
> > c2a =3D i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
> > if (!c2a) {
> >=20
> > 	if (PASSTHROUGH)
> > =09
> > 		# Since passthrough is set, we ignore unmapped addresses
> > 		goto success or whatever;
> > =09
> > 	c2a =3D i2c_atr_create_mapping(chan, msgs[i].addr);
> > 	if (!c2a)
> > =09
> > 		fail;
> >=20
> > }
> > ```
> >=20
> > in i2c_atr_attach_addr():
> >=20
> > ```
> > c2a =3D i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
> > if (!c2a) {
> >=20
> > 	c2a =3D i2c_atr_create_mapping(chan, msgs[i].addr);
> > 	if (!c2a)
> > =09
> > 		fail;
> >=20
> > }
> > ```
> >=20
> > So what I'm suggesting is to remove all c2a mapping creation logic from
> > find_mapping_by_addr() entirely, and to move it to a separate function.
> >=20
> > Please let me know what you think.
>=20
> In the case of passthrough ATR, mapping creation should only be allowed
> when direct devices are attached, ie: in the call to
> i2c_atr_find_mapping_by_addr() from i2c_atr_attach_addr().
> If i2c_atr_find_mapping_by_addr() cannot find a free alias in that case,
> it should fail.
>=20

I think it would be better if i2c_atr_find_mapping_by_addr() never tried to=
=20
create a new mapping, not even if an alias is available. This would elimina=
te=20
the need for a special flag passed to the function and let=20
i2c_atr_attach_addr() handle it's own logic instead.

> Other calls to i2c_atr_find_mapping_by_addr() should either return an
> existing alias or NULL, and not attempt to create a new one or to
> replace an existing one.
>=20
> Let me know if my explanations made it clearer and what the you think
> about going forward with this patch. In the meantime, I'll try to see
> how the code looks with splitting creating from finding.
>=20

The patch itself looks like a valid idea to me, but indeed I'd really prefe=
r=20
to see a solution where mapping creation and finding are completely separat=
ed,=20
including for cases where a free alias is used to create a mapping.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart22817234.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAme3Wu0ACgkQ3R9U/FLj
287kvA/9HbfCNlcZK1k75XoTGOw71Eb9M+gfzCnZOWGvMppNgb3wNVa7jbi7tfKE
9XHPDP8XiEWV/DuJPT5/rrcIRVthHYPpjJVXafq0dlyNEnwcihbZeRSap4EksJAT
sEkmRu4Cc0D3QAi6IqjoezZlhDHc4EBLCb9I0BzcuDsAS77w9CuG8vnib2l9dbfK
cZ80J0WsKfCngY/SgwiQORX5hNQtnvUeY9IC/YdIZGrXYUC6A+TgSnJwCSDT2FEz
7QuZMtWqtqLlaN4dvXpXfVa9/lJc5qd+7zpIxaya7a0Uv0VHfh8L9RuzyDdW3X1Z
HLjqx5l8HLRnlaPX18VOldbPx7vROi/uwGVB7JrvCkHtHIGDE3ACNg0NJOoB8J0x
dmSEjv95bvVmNEjS5Glgk0i72KuKTAL4d5T4e/yMn2zXL4FUVSCM1guTdfOr/2yl
jgRXEAIhkdkSLdDS+zOZ59MXgN2lRhBcWNTV9cRMODY+SSWd96WR57cMxtnWmBUo
xBylgP1ZNiDnV/dz1b0aWB4+sE/7Ij/BWTimdPyiXhP70hw8Q7KrYZN2xiwQq+X6
WqgDcaxyHYpVxc0kk53Ll5bZOzLToMKjbnEG7y9pCymTntghb1QJDQnP/ZvlYmXv
rbdWVvlnzRRg3/WO2dOtpbmOuwMEWbVKudLYSEF33WB0SYDCLHA=
=G1qL
-----END PGP SIGNATURE-----

--nextPart22817234.EfDdHjke4D--




