Return-Path: <linux-i2c+bounces-3953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BA9024A8
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 898EA1C213DA
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EE2135A67;
	Mon, 10 Jun 2024 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="d4zWkYep"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9012D13212C
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031134; cv=none; b=M+7p9e8+yLOvjuRmbaukfB4uQaNwmmSy+qO7bBa6ZlCD9K6I70W0DiFE80BDqR7dO03+kb/3bzF4tRcQbE/CaERKLEjQ800oStH1pdXjwWh940wC4w+4NFP28wcPG8C5UZTRPk0jQwbqtmSkoeAzLz/w0QKE2K3fRLu5t8ly6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031134; c=relaxed/simple;
	bh=E2HQbsSnQv1NAWLSazPsobYPagl89ZHk8gty30LFT8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jw4xBuAb6xkloHatqhUUJFXTU1GStp9+oyeH6Mlsl+IuU9rprU4lSAvAMRf7CUEHRqKa8rPNUDDC9lbjlN3JWiBz8PkUYXkdtdUUBDQg/mQopyryR54zcVLeXj9027AH2naz4tFD1MFlkoFWr50ZTQZJliZ9INqOeCwJ7mEj3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=d4zWkYep; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E2HQ
	bsSnQv1NAWLSazPsobYPagl89ZHk8gty30LFT8A=; b=d4zWkYepw1L59YjYCclC
	OGk56VUe/PXDkmld9ElKcGn+OoEGLKgltvjpHt0KslE7l0WkErQSrFvenC0+l/RJ
	ccxgzTgLc2zDMdd3Bv016N48vtXjZWkwE/VPUKNVhHT33NkM9Y0hvvFoKPZLg+Ig
	i+G6Y1DVuOBXMOGDC+tbWDdPbOQEb0FOXkOqVzYld2TWkI6Wa02l8avRmz2iA+m4
	XF078bxpWmg/R7O3FxuEjGYiwVQdnbtoU4WZk5WTodCNWWQa2Q1vZyBKv6d/A4CH
	ebuuMi29nV0P7Nd6yACeyYyxrK89b5uXhmaW4zIvIx0S4z60y+YZlb84cegdu6ql
	vA==
Received: (qmail 114505 invoked from network); 10 Jun 2024 16:52:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 16:52:10 +0200
X-UD-Smtp-Session: l3s3148p1@deU7S4oajsdehhrL
Date: Mon, 10 Jun 2024 16:52:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Message-ID: <ib6p4ivqdn56l3jzzarsoeijjhwak33bmqvj2qiddbhxdqzchk@txl4gdslx4gq>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
 <txliuvufu6muqucno2uex2q6xvnveozpjzahx7zryqlvvvzrs7@flv2zztine6r>
 <a7e38754-ff1a-4e15-99b2-4785827efc83@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rattkjvt6utwtjjr"
Content-Disposition: inline
In-Reply-To: <a7e38754-ff1a-4e15-99b2-4785827efc83@roeck-us.net>


--rattkjvt6utwtjjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Yes, maybe this could be simplified to "(LP)DDR memory types"
> >=20
>=20
> I rephrased it to "Only works for (LP)DDR memory types up to DDR5".

Thanks!

> How about "Only works on systems with 1 to 8 memory slots" ?

This is a question for Heiner. I'd think it is is still correct, but I
don't know exactly.


--rattkjvt6utwtjjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZnExoACgkQFA3kzBSg
KbaxABAAsGxt1eag/HfnW/0hV33xFptPPymUBAT3PapnvXT60J9O8177ST0yWg6F
Ysh25IjEHuyp0l5ATNYPvUY55hk23roQNp0lZ37UGJvNfD4NdmK+UF40rCV4ZzXf
vXDvsTQF/gVkCEDHsmLIk3/vmMIXQEjs7G0/gq/EbLW1m8uIxWvl1BztKv5u7UMw
F2aPk3bAOtyWHgHHghAeOhVMZd5zoTj8N1tO9e+DdpP9UHeraORBGb3wAJXIaH7V
y94rIK8uRKnTj4A24r8oFDttKOtlUbNq++iDpgFsUrGs1R89WcJtMTfbgbrfWSok
rBXZ42n1WD4ToDVl/l9St7ztkr58cUV/T17YlHOyL5b+KclAQoj6EE6vYC8viQ9A
qNYYv6CQZOsAXb/cVBrNDvQQRl+JBgrR62IOVUcdwCb/wF+6zPznKVsRdZil1g+e
u7zImviJAKg2dj9VDzoIa/dyJS2At1svKfp45RHVMvHRT2R/XRyUM8PoQ8gUVemG
55N0sBbnI+kzQflCqyg4NfLkFODB2TlQ/6YWcLV7qLgJHvLZt+9N2EPzEnsyGvv7
JT+q6mxVMvfRvMSlXn4oMOoEcDA/WlXccjlAXhZbHfh8+zdkhiidtD5OU/3LmxJW
LVhqTZrmp2ZNCL3amiQYy4T/mejyQJ663YRA5QTx8/nt2tt1t6I=
=IWix
-----END PGP SIGNATURE-----

--rattkjvt6utwtjjr--

