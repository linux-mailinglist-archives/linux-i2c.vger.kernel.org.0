Return-Path: <linux-i2c+bounces-7710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F959B8C1F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 08:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DFF1F21F45
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 07:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6DB1547C9;
	Fri,  1 Nov 2024 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PkZhVVGJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526AC15350B
	for <linux-i2c@vger.kernel.org>; Fri,  1 Nov 2024 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730446588; cv=none; b=tKID3YZmGN5fqL9fygzrqXDKFfSf1ATPm2MfSWBrSaDernRCOTjp3eJvebPxaE+efi3vcZp2+V33GPwdS951MxDHXVf0e4SkZmWa8I3lD2mxZuOmXKuPIq+kAj9DNVQVMC1aDjctuuuSr431GaQ0aegmP+SlDDIQ6IP2IUGR5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730446588; c=relaxed/simple;
	bh=oDOPJ+VepmciKbxX9Qr5owX8dytwQf0AzteCOUUlTfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzL3pOwL/cPgt1Wk1SrcXmvwuJAKg/AyHNa8/vsQNJIjT2pFiIADd37Xt1dZuIRxoO+qFv96MGQ7UBHNV2wVRRjVnjr5e4WuPtTOwWYu0gAdS+yklis9mqHQ8XFl7wYPswVJFilw9VKrr8qOv9by/WHqFXJ1lYsO39VdJVas6Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PkZhVVGJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JS0m
	hz5ooNOYznnjSH+5jS9FnNKajjJKK34Qa5JpJmE=; b=PkZhVVGJwwGwV3BP2TpZ
	R8l/Ux/vWYXW3BBaTe0jxWTyNW5IllIys6dBRiBM73kXEXe/LLue1JP3/jddM2mv
	4eDX3YQbUaNaZQozMsax4KY0Ye7WRsGbOBgBeimlVihAN6AGVgmkfuFS/VNrQzDQ
	HZUIDQvWgn7I7Qyy2ub5rfzzgTCSIBqwt0ONwQHznUpiZSTtnBFeOadGhYTZhase
	+AIV7jSFftsKF2pIKAX6tfMR8oK3zmNTvVFDM5pGhEP5mFZXJtd71heNVSRFUvTr
	fWHoO4GAIFWwXR3ljuNReRepMvQlq5//uPDxfsktc1iplbE9GCpxT2qujVURdnhs
	2Q==
Received: (qmail 3667788 invoked from network); 1 Nov 2024 08:36:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2024 08:36:13 +0100
X-UD-Smtp-Session: l3s3148p1@eYFM/dQlvfTDwPty
Date: Fri, 1 Nov 2024 09:36:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <ZySE7OqlvRRvtyLc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JIBATO5GOT/FKMYT"
Content-Disposition: inline
In-Reply-To: <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>


--JIBATO5GOT/FKMYT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

sorry for the slow response. I am on the road for two weeks now which
doesn't leave a lot of review time.

The good (or bad?) news is that I finally found why I had the feeling of
"something still missing" from this very interesting approach.

> -	/* Tell drivers about this removal */
> -	mutex_lock(&core_lock);
> -	bus_for_each_drv(&i2c_bus_type, NULL, adap,
> -			       __process_removed_adapter);
> -	mutex_unlock(&core_lock);

You remove using the lock here...

> -	i2c_for_each_dev(driver, __process_removed_driver);
> +	/* Satisfy __must_check, function can't fail */
> +	if (driver_for_each_device(&driver->driver, NULL, NULL,

... and here, because i2c_for_each_dev() utilizes the lock as well. This
is, you open a race window for deleting clients via removing the driver
and removing the adapter at the "same" time.

The obvious solution is to use the lock also when removing clients in
i2c_del_adapter(). But this needs careful thinking about potential side
effects.

Makes sense so far?

All the best,

   Wolfram


--JIBATO5GOT/FKMYT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmckhOkACgkQFA3kzBSg
KbaE1BAAn01RMw5YNdcImy3VPuHpWbei0G24OTXZDImF0L1bDAbUaeTsqLltw0G8
kaprihW2drCGd7AlW5EMXsGlZuZO3T3WQAiZ3OYUdkwp2kd4pb6CKmOcL1tjYJmj
j2zSnl1A8YXWaMNmdOib7swRo4Ei989iPcbH3ayJYrm5ud6Js6JAhQoZMuK4XkSi
QadbHuPz+ip1y3TUKvg5Eg4zVBWQqdeqspXlEtwEBVwH16fO1hNiTwH16ziC3JpM
YIbQv4OPkziZkN5VzM1AmSy2I6bWC0jF4VBgEAl2jZjohpXrZ+U7TH6PoSVN/uAf
DgjTzdzePT0FCqQsKhYIXudFVf1U2b2iLtLApB/U6rsWOf7yU/PrbrhSTnb7IidU
ezS3FvVnypO0/oNiVx7K9pog4KmdfHFLnr5BNRo7flOPkYpyT+c+cQyikYXpCPZr
za4px7ichacl0MVN0HytI1dRltllgrYjlsiPZDSD41paD6xN+R/Lt2/ncNVPHpls
N3r4qOC1hYluoVcK/3BgrBZPD3BKyhquFZ2dH6KJmPYFQjE6KGbhTB2MLw52InH2
G/TY74u9fVYWee02h4iAprXxxzdLQ3r/tLYW8j9Zmc7iMl0vUFmQYJ0Z67VCWLnu
EYM1BZ7Sf9u0CKcqKfxw0pjQiJ2TMCHZw1fGy9Shvq+mRssxWV8=
=R107
-----END PGP SIGNATURE-----

--JIBATO5GOT/FKMYT--

