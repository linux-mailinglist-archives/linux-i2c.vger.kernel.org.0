Return-Path: <linux-i2c+bounces-9622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4184A47F59
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0099176298
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C39F22DF8E;
	Thu, 27 Feb 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GqLLwQZS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA5622D4F3;
	Thu, 27 Feb 2025 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663225; cv=none; b=tZ051pklCFz7d1R8bsxqlOvpHOnivb8CaaADpPfCDA7WaAsTZOoNvRgXJz2LijHlf1WLndq4fRo5wN1f2S7lwpvHUVX9HasdIpwZOgl2uMJlMSY7pZwlpyI8+Gl/BdL9QWyx0EJrEnVoPsq0qa98ossgOnVe3IJ1p84we8/to9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663225; c=relaxed/simple;
	bh=YYaX4fM8y0aSrz9ljeSJ81PqES4t67efi7fD90W/cwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5Ta1S5JybdZgoooG0aPUwSVpWtR5DVg+gXdQ5bBYGSwdyyMUDUPlAY7VTFiPK+lPKumuNKXAlmiBrVGM2zo23CvHzxRVahs0WjWmUNaJoG5uIEK4LVYDTZPakJEXBfYpQcBBIlzoHL6q12uVEpm4NUO7TNabh5zEmvAtP+d8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GqLLwQZS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B9144315F;
	Thu, 27 Feb 2025 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740663214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JgblnwuWUmY5kYn4D0OU89iAmcNF5Q3maN2KDHlkwQA=;
	b=GqLLwQZSv4d5ulqOy3pstT9rxElvXDP2uegomLTxMFiF2VRZW17V/k+Ckfw4f5OpxspCFp
	8G52nko8AqA//4gXBsq8JPrtehWqccsq+9o/3oqsZC2J2JkzuTNzgr9zrJn94enMLKrT71
	XCjdDDs+S81X47m+bcnqNVjRJ9DdrXDmoTnnnrEzQCDQp3WlrCMbqiVbyD9e+hE4J1+I4O
	A5ORZ13NClw4WJWNn75Tq9+YNEGEleK6kRYagFqkBBPuc8dlAG+iIXMyQ59NAoKDTvQ30d
	L6oCpyumBNJDoWOk2LmX85r66DlIGKWsNEPzaifI3nMID3m6DdHKOg4lrDU46g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 5/9] i2c: atr: do not create mapping in detach_addr()
Date: Thu, 27 Feb 2025 14:33:34 +0100
Message-ID: <22639181.EfDdHjke4D@fw-rgant>
In-Reply-To: <20250225113939.49811-6-demonsingur@gmail.com>
References:
 <20250225113939.49811-1-demonsingur@gmail.com>
 <20250225113939.49811-6-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7803983.EvYhyI6sBW";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekkeffvdeugfekjeegfefhvdetuefhtdelieduheeileduledvteelgefgffffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdpr
 hgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart7803983.EvYhyI6sBW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Date: Thu, 27 Feb 2025 14:33:34 +0100
Message-ID: <22639181.EfDdHjke4D@fw-rgant>
In-Reply-To: <20250225113939.49811-6-demonsingur@gmail.com>
MIME-Version: 1.0

On mardi 25 f=C3=A9vrier 2025 12:39:33 heure normale d=E2=80=99Europe centr=
ale Cosmin=20
Tanislav wrote:
> It is useless to create a new mapping just to detach it immediately.
>=20
> Use the newly added i2c_atr_find_mapping_by_addr() function to avoid it,
> and exit without logging an error if not found.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 9c4e9e8ec802..b62aa6ae452e 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -586,10 +586,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter
> *adapter,
>=20
>  	mutex_lock(&chan->alias_pairs_lock);
>=20
> -	c2a =3D i2c_atr_get_mapping_by_addr(chan, addr);
> +	c2a =3D i2c_atr_find_mapping_by_addr(chan, addr);
>  	if (!c2a) {
> -		 /* This should never happen */
> -		dev_warn(atr->dev, "Unable to find address mapping\n");
>  		mutex_unlock(&chan->alias_pairs_lock);
>  		return;
>  	}

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPart7803983.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAaa4ACgkQ3R9U/FLj
287EsQ//XJuLkXvmscKzQkTBc4Nd3AwLM956yv31y1jrLCaTUTdbuWQvk58nRsmw
IKSbf511Rq1prbRdfA6URx3+jejl1gI3WI/2kFW+Tr/CBUH5+c2htskd30mufy/1
WjO9ZzhUnv1EEO1O14RHgD1BsZshZMF7S6gvVjxh+CRxSC1Gy78KfN/N1w2SafEX
FoEKm0hW5ssITw6ldgDXqC6BVzK/90GWntCYl9Y+wztlxINbsSVTzQ+nhkY46diB
w8+JQYWru/M/oiu3t3+ZSTiYxsyusDAKg3zxMsMIgb7CPBOivOHyYdhgFertc7Af
LFzMSw9UCdyMQwD8IrwgKvuKy1vnjTMcCjEbw1R/aS9AnyWcDoCTLQkHLqFRxU+b
EELd8My9BMDdZwVSP7LxD1oOy55c53yL8imxIcE2kSHB3/tflauOntMmldq/nDXw
dkXWTVYYhVrRzR23W7ktQxQ92XlHhd4uZI8LDKjnszFKLLgJ2sMkB+OStPCPuqyQ
wWdlKMXBEYGnv4OYkjQj/KERUffPzBxDDD8V8pB7wLeuv01u+GyJ4Swcp+otJR8P
FZtb7kFKIS9rM/XKm/0BCNHuwIOfPRLnEAvnpr2E3APPxhOiaBDsBipJIPfRkRq9
7RFjDfPl2fN5D3aH2oN//wFWyntLCVEVOulAgq0T1FU6Dl/KrPs=
=5pJH
-----END PGP SIGNATURE-----

--nextPart7803983.EvYhyI6sBW--




