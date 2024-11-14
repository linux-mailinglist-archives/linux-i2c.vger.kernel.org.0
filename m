Return-Path: <linux-i2c+bounces-7985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A90CC9C8684
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 10:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 550151F22800
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 09:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C791F77A8;
	Thu, 14 Nov 2024 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="csIyX3Jq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49251F755A
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731578047; cv=none; b=LCRStQlJ3kKrDFDx77S2ToQvnQ1KjZHQBq82UpAk7UZQ38fkXuYwRReGJMTJnhDCcb9qaFPU9y1j20a/YHIkS9E/rlb76tSYJ4P6WujzCJfOzfiBTfs9zjIXiVh7KSGzsCSzxjOh46Kx79o6Qmbv1hHsc9h1qefJppvWq/7EIH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731578047; c=relaxed/simple;
	bh=Q/GTTGPYb1m0sh/Mq/dH+KNlAR4VxZQ091w3NplHxcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVfqpe82dBopvbzAwg+4EYqoN88Ye1g4+riZK5zzMm8l5BulLJQka7Z2MRCG9uENiWgBRj51B6iNFq43UYaf6qaN8/NYikqWXwoB4QLBqRiNohV6pR+0HAJr4VYwmRAi2mnIFjhX+W7vWtrJjrN6/Xdvb63Vc3M78ddtOBiE+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=csIyX3Jq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ucIt
	3NYVecjegCWNd6yqlVVS31Amd1yqB9dRdqeZ2Mo=; b=csIyX3JqtNxpV2Y0okvI
	R+9MPoHeg/hytQKKLRKFc3dbh7qVIe3TZ1aJqPBOvVChDQyE2cNnxBlHsi6JQDL0
	3LDT8Gku2F/zM9dSRbi0y4DOB04laqFARxGddjNGtAPFqt3j94K2qzbPAP+j/x2d
	xMNoj7cv6rt1ze2R3dJROLvwalTQgnhbVYuZMO153pxtcjI6K7un+w1RTLqZo7bj
	0aMguhYSGe8Gjy18xrOHOThUHZFgjj05I43Yk3HTBPnx3+OSlbX9nh2h0ThgkOWw
	DEgxI357rvR/ty61roy9SppI6M7SmtE46vYHBvtncHzt351UfjfPe7ZL9ddZgjoq
	Tw==
Received: (qmail 3111350 invoked from network); 14 Nov 2024 10:54:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2024 10:54:02 +0100
X-UD-Smtp-Session: l3s3148p1@uwAfbtwmyK5ehhtH
Date: Thu, 14 Nov 2024 10:54:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue
Message-ID: <ZzXIuidycjx8JsiU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Zuiderhoek <zuiderhoekl@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <ad659d817d2003d7e6309203c5982bf645f9c25c.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uES+0unqC75D4Z1t"
Content-Disposition: inline
In-Reply-To: <ad659d817d2003d7e6309203c5982bf645f9c25c.camel@gmail.com>


--uES+0unqC75D4Z1t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 12:14:54PM +0100, Liam Zuiderhoek wrote:
> From 214adebf7cf37be941f208124fac9ea6bec0f1d2 Mon Sep 17 00:00:00 2001
> From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
> Date: Tue, 22 Oct 2024 20:46:59 +0200
> Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue
>=20
> Fixing a coding style issue.
>=20
> Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
> ---
>  drivers/i2c/i2c-core-smbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-
> smbus.c
> index e3b96fc53b5c..6829def15933 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -122,7 +122,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
>  s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
>  {
>  	return i2c_smbus_xfer(client->adapter, client->addr, client-
> >flags,
> -	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE,
> NULL);
> +				I2C_SMBUS_WRITE, value,
> I2C_SMBUS_BYTE, NULL);
>  }
>  EXPORT_SYMBOL(i2c_smbus_write_byte);

The patch got broken while sending. I assume you sent it via gmail
webmail? Please read Documentation/process/email-clients.rst to make
sure it arrives correctly.


--uES+0unqC75D4Z1t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc1yLoACgkQFA3kzBSg
KbaY+w//UmB6aME+iJN2+YbCjL9U3670ROP32F3001YfuTPhitI9QH2Ugkuvi4vo
ZPHfHq1xLlZQ9aSXEApHMYMH+D/dXUvdFpaXPr1Vqi4FAYlOSTSdnT5nbVZknCww
8kcvDBC/rm87iGroQFAvTOsJ+jddexinPoyB9KscXZDKXfm2jV7q+7PYeOrMLK6h
SSbumEuQydmEX3f/E7eo4iVaxeMRp2YejWwxM0HPR2UjUPBC5E864be1lobJD7zU
1RUA+zQdu1tlXGp9Bv7WqaG6jtnztEPUptGYaUG42ZDQzEoq3dCNzNV1skAoSf2x
WsvD1c1DT7Y+UN4F0pcNonaslSt9p2xi1I6ApfH4sRy8cmPuHEvMnPaFmUXYhD/+
wr85XEJ9MsfL6bRY20VKl4gci7mPBekWWYgjx83mbH9BA9dKsziJITrXbXVywvvp
hCOAaWiqdd+8+7r6tuM3t+V9OBeV+2j3f5NZSqn+eNaQwqqzGt8G6rCoPmsQsFLw
mVjIys8BSEo31MJCpnlJHR5oiwY4yPwU1y4Nx5u8XDIsw3dzjU5q6LVJNeADU300
Dp+ZxAoVI5DpQmlZitYB5jn5pKwidwZyPp9XwG+GurWVXcL/aZL8NNMgO+Jjv1dF
8wG7TqWYQJPV64OgfswcFWukZhOaevoKcs37KoFYYnhEwpfU16s=
=Btu6
-----END PGP SIGNATURE-----

--uES+0unqC75D4Z1t--

