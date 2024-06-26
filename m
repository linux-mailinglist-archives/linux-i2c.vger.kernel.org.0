Return-Path: <linux-i2c+bounces-4372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA6917E3E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 12:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12600286FFF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1852422083;
	Wed, 26 Jun 2024 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Eifj/738"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1451A17B433
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398051; cv=none; b=pSZob2rvGu4taqkQ5pr71RJh9IjU55K6RrOysiXD8YP44KLY8wZQh84E1Vfxf4DrSvP4OGmjqJhhhcrYvmt7N6NxmKf+ZHaCRrB8mOUqjSW7LV6z0n0tdP6FaOlkUGlkk7VIhFdAgjbWcvddJvspW1HWgrD5wTHvarKnZ7dRMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398051; c=relaxed/simple;
	bh=O9UKWhxPFjvnOoPlX4mqge7XPSJmImHNaUkDxGx8WIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ0WFs/KxI9swkkg6pshKJAv/jSUzYn6LEf7bkDkorF2vNHkhOKyPF/28jH3RLk4t97u2i538/EcbjtLqt0+Vm3/ZVoHc4i4/8Zfs+9VM9ZrpOT0uCFBNM3UsF313waVQxT/f2BrpesRemM232fZur+ayVQeimiwRFtXDeabJUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Eifj/738; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PQ/K
	QGXfKTAIoE9fLNLT4e3BeowYxs0SWQgc+ayl9YI=; b=Eifj/738eXzVWHCHK+he
	MbIfMSsBIAcoFTrCf2IK5Qr1CgNvX6Nnp2ChQ3lSmzDZJX2Nh5WgC3ddt8WqNKXg
	VUve0nqZCeGdWQa1xGyEsyuzIhJ9MN0i/I0Mb2hRfrxu/E3cPip7cM0xbbRdJQGm
	EkfC3Foexn7mRM1qO+y1c+z/KUTGJR4C94C8KgRVKYeCkY12dn0nF15NpIdOfbTb
	bs8wSQEUIp78jBwD/DYDQNGGVSsRp4eMmKZDHttTKvw53dpHp3dPtM3eHuRdPX2h
	OnQBnBH/A/rcwZrKsB4qRasdTrSg3uME/ifzB6aKAdaezqAw+Y/oO8K0fSKIiSwO
	eQ==
Received: (qmail 537199 invoked from network); 26 Jun 2024 12:34:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 12:34:06 +0200
X-UD-Smtp-Session: l3s3148p1@yyDBjcgb9p4gAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 12:34:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <siwnljn7t22tsqybv6w3dndhuiynhvudtshkmyh67q6kyxjl6j@wuisjuqlovyg>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
References: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
 <rb2fmtnhaqicg2behqfijfypfsvkqatud4h6klal77u6scw2gp@cznyn5vof4x4>
 <pja67neo74zw6rqpv5n7ekivlhejbmpuge6umtuatwhgjbmcwr@7u7f7vhpnwtt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o453t2k6x3krfhvq"
Content-Disposition: inline
In-Reply-To: <pja67neo74zw6rqpv5n7ekivlhejbmpuge6umtuatwhgjbmcwr@7u7f7vhpnwtt>


--o453t2k6x3krfhvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

> There is an inconsistency in the different *_device_id structures. Some
> have a kernel_ulong_t for driver private data, others have a void*.
> Depending on how it's used in the drivers, one or the other is better.
> To get the best from both the idea is to do
>=20
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 4338b1b4ac44..594c5ace303a 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -477,7 +477,10 @@ struct rpmsg_device_id {
> =20
>  struct i2c_device_id {
>  	char name[I2C_NAME_SIZE];
> -	kernel_ulong_t driver_data;	/* Data private to the driver */
> +	union {
> +		kernel_ulong_t driver_data;	/* Data private to the driver */
> +		const void *data;
> +	};
>  };
> =20
>  /* pci_epf */
>=20
> which then allows to drop quite a few casts, e.g.

I personally could live with the casts, even though the above looks
clearer, of course. On suggestion, though, can we please have:

 +		const void *data_ptr;

There is no obvious difference between 'driver_data' and 'data' to
determine what is the ulong type and what is void*. 'data_ptr' makes
this instantly recognizable IMO.

Happy hacking,

   Wolfram


--o453t2k6x3krfhvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ77pkACgkQFA3kzBSg
Kbb64A/9HS/mbkPgFprwstW6xsV3F9/mlG9A2IsM0hHO9NP/KWIUj5Eo1xEE1HzZ
WogIgPxjsd4jZw8oR7DIvo4r2+K+Rd+YvvB1J5AVTKxDiqsBOdVhqgk0rjSoZv7P
lNDv/o3uVHBY9Eb0kOCjeh3MooyGrxfSYiKmn8sEh0ZvZGtUejWpbFLnTc6bq11F
QEbUsN45Wctb58hDMmy4epJms9Bzk83t2t5gqwvhdrPrcsDymSD1btQCAXdu4sdM
8PS5f2t9+2v4jGt4udueve9Cm0+i0c0hbkUYepBmzerlzEU/zWjcabLoq2wGmZtM
tpMdRhWa7nIF7o6HqJRtSg7KTt8MloFYeJ/QZzjJ9NM7UYRZKurOX2+rGzAbsfOn
xvh9FMo5KW78hZaQSKPwX12T4iyQngkcpy8LrgzpxoPYe1J8n66b5aQAINeAGwHW
eNjJjELRqmepL4qRvqnSjUWrj+UJQQSInBFHw/E7pKejvjXAjV6dRlf6PMlElUT0
dxfbnmdRqd7h/bYd3aUe/DZ8c5Xzt2Oya83Vom1q4EnLnDdV6sFcPFL+qo5NIhJ5
K5SWjLkJYP2+QjXm6e144386aWtZ5vuJGNzv7eW6jP6QYVh2SRTta+PAGnuDV5af
X3KTbwviS5rzq8dAx/84XOnnNHDkL2X0+4yWMZsFfwI3yrEIFfE=
=lCoO
-----END PGP SIGNATURE-----

--o453t2k6x3krfhvq--

