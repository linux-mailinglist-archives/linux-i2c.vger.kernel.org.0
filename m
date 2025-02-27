Return-Path: <linux-i2c+bounces-9624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B86A47FDC
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7576218924F6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E010F234987;
	Thu, 27 Feb 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="anFzPdUQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AF523315A;
	Thu, 27 Feb 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663843; cv=none; b=W+an3o99aZzuetSfn8g08ADau9buY4a8YCwsogNJ31919mLZg0eTToFaa9NZbzyAk98CKlu28FOP0+0rFPX2C7TUrPvIU1o7AoCuCa90s22WCKhn0bv1PeU7c3A3Z+VjbCzjVqt3d4I7vH3+fKTUKUvl0C5Dy3AkL9f18agwnjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663843; c=relaxed/simple;
	bh=E1tItyhsdyHVm7O80WpksBei03ebvO569NYx/R7zPUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGtwEEGNtluGOGDDQR5ketZIWpymUXITuVY8X1Y8i9GK3vlTzmKHjMHSemGikdHGkzr/Ti1jxoWIzVL2RgI0n29Cg2R1iBB/KZkyJALfEzEGPF0fFgeKUChNTGsXF3bJvTaVqqoFATJVOaNTu6CMNDSoF1UJcSrH3LyZen1M+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=anFzPdUQ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 928514417E;
	Thu, 27 Feb 2025 13:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740663839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lhlR+7f2JUXzhLMWN3jt/w5we+Qtj74Pupwkai953Cs=;
	b=anFzPdUQ5hWO/UtFrlmX98ISSK9yulAbQK5tkN0Zeerwn/0bENTCl7g67V9t4p0nNwWGvK
	eHpfzl7L8CG3cVHN7kuymK3x/obkDi7tdkq2Mt4wFHijRSAdNVNw96s8vVXZp2OHAY3HYX
	JElTnW721xXhfPsm0+nt7CAGISQvfRxaMX1gyWmtDGcWqamM5/RpGnpLm0EyAex6ofleHF
	EnvnCR2ZsAHMNnONqRNSJhtBdmgOCUrais2QMITR14JDmLVwJ2p/K0d1m6JvRjc2zH4WtR
	Tj9ZKmJFapraKpmcMKgfwt/hlaCkAa0sZfBudE78StqszCof1RZF3k79GWwjcA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v2 4/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Date: Thu, 27 Feb 2025 14:43:59 +0100
Message-ID: <6056224.MhkbZ0Pkbq@fw-rgant>
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
Content-Type: multipart/signed; boundary="nextPart1848248.VLH7GnMWUR";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart1848248.VLH7GnMWUR
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Date: Thu, 27 Feb 2025 14:43:59 +0100
Message-ID: <6056224.MhkbZ0Pkbq@fw-rgant>
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
=2E..
> +	i2c_atr_destroy_c2a(&c2a);
> +	i2c_atr_release_alias(chan->alias_pool, alias);
> +	return NULL;
> +}
> +
> +static struct i2c_atr_alias_pair *
> +i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +{

I've missed this on my first review of this patch, but shouldn't=20
i2c_atr_create_mapping_by_addr() also get a lockdep annotation, just like t=
he=20
other two mapping functions?

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart1848248.VLH7GnMWUR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmfAbB8ACgkQ3R9U/FLj
284/Ag/7BpI8uRhcHuXyBUlz7P3cfv+AcNDmKU9srWmCJkPO1bUWvxUAHhTH2osS
JTncTkEDPVxaSUv40ZW/QV8bV3Q2fPo7SeeGdOCFbxbF430zBvnmWgLTDc+OwXCh
GqJzL1uIArOwfsjNJT0XdsZS3qhQzJJk2XhxWkctAuypeNyHxdM+OMiLBQ/ypK9Q
eIDRAPa2PtutpvJ6akIxQBV8+wPsZJve8MVy3ij1KqKMEAFW+q9fuoZT8qh6HyGL
aiPltdPEqKkIHUxcYWFpOWvA0iBPtw+U7i/3mEJA1dYiIMbjTuxbB+eOgigCOG4v
2c4I+eRp/o+gBninEkQHmjnwiIrkLSOoF+ME2h7/1q2bHDXaJJOdV7VKb+/tW0U6
yYf9X6GzlY8WsOyM11qwgXF/cLEYxew5NMmA3KZ+uM/T6vjZp1w7VsD3a1ux694P
M9NRAu4dbXSDV8jM3IcJmdcuctpvWeL+P9da35Mqdy/lTN8vp5wCiyxKE6g3oT9V
5oFVneC4daw2k+ChPfWuxtX9cZhAR5m+yrsG2mp9JvQhfIcH2fETOqSLXK5XeKJa
jtu/TAxZVA7jTYsmYyGfDRAo1A5FLSrtcoPSuHtY2H/bfskFDgpXn+gi2y5vPmsD
FO1AptS+1k0n+Fe84E0DjzKmGZC8HlA6gKtf0nMXONa4RlkVuZc=
=vAIB
-----END PGP SIGNATURE-----

--nextPart1848248.VLH7GnMWUR--




