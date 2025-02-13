Return-Path: <linux-i2c+bounces-9439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A916A348BB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BED863AB92E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4841FFC59;
	Thu, 13 Feb 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Rq3SvIkI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F218A6C4
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739461909; cv=none; b=cavnhyH8Ma8uaBTs1H9GfJiSIWrQiik+HS/5c2ahsCJwT8FHLePuasar8AU+3lZuAP/MR6VVlI9t8UUwvqnGvktPa0hqKaX1HrB0yMp4rEj9ktar3aItlRfJRMx/Igj5WMgYU1bWrIhcySQ4k010TetAlbEENIs9iCBVauf2Wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739461909; c=relaxed/simple;
	bh=iFe3o+gFbgY9eNuJ3H/JV+PUoqdwMD86enO8K+At3pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJB1gELCdvn3nbHTVcFpiXQTmsg6rspAAUgv9Hf/4CFETHD6hHSy+vS4W9M1IEePUvJOnjG7MLDOTIRQNt5beJzpE8ynA/1lI9q79sNY7mqT4ZR6ZapphGAQDvQdc3IOrYi4ujPX/CHmYwLWBbRgVIG5T7T03i3lVHHzcjmuEJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Rq3SvIkI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iFe3
	o+gFbgY9eNuJ3H/JV+PUoqdwMD86enO8K+At3pI=; b=Rq3SvIkIj/0MiEkBXx0K
	R2KWriFUngQ0qdxNydHjkIcYQISLKw8LpEehUDS+S2ZDmrT6dVksbesh98FUx/go
	UThRJtMjUUirSRepepoxIjIj2l/v1KPtEkwbD6vVx9UfyGbS1dkvVgFeH0vYHLv9
	SLrfiExZcby3k3O7aP+t/bF9kyR/QSnljm1ZmrI2zF4vq0L6zI6HVHc0IM+3Whu4
	HA0wz5L2/ge06hXX51AwP1ZZCnSSyBUPuanxCGQ8iqXqxy2npbraTrxAtvt+M20S
	wKrGDjzuydDw/WIulch9DuhMDnglynR+GYcAH1V8AUwmqC+Irp6MfWDOnQA1VOdO
	jw==
Received: (qmail 1932260 invoked from network); 13 Feb 2025 16:51:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 16:51:45 +0100
X-UD-Smtp-Session: l3s3148p1@uVX0CAgu0Jlehh99
Date: Thu, 13 Feb 2025 16:51:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: Unexport i2c_of_match_device()
Message-ID: <Z64VEXs7JNtr2JC7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>
References: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
 <20250213114613.2646933-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UdmvLfBUWaZkYshi"
Content-Disposition: inline
In-Reply-To: <20250213114613.2646933-3-andriy.shevchenko@linux.intel.com>


--UdmvLfBUWaZkYshi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 01:45:05PM +0200, Andy Shevchenko wrote:
> i2c_of_match_device() is not used anymore outside of I=C2=B2C framework,
> unexport it.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Applied to for-next, thanks!


--UdmvLfBUWaZkYshi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeuFRAACgkQFA3kzBSg
KbbxXxAAtd8h9kQbwkz3k/y+6Y8k3lJinHEzzk045fbFvpU0U+vv34dqI1PS34Ey
nmV1f/qjI6D3wJ7NO4jfTiXYp/puXBbb6tellLANWaP/MyzU6S0sE5k6J/aJeHyw
3mYyQpe1e1NbW5Q7Rom9FTrxVqvA5K64lcYeCj/3eZhrLPYwxWP7C34DDN5fRIzu
Poeme2rfC5SeIGxz4xxm5igPosYxi0BMBQjEy3mSWR/anLttjvHFQh23JwQl2U5P
xg6UV4xUO34VQpDDAW7VZNM/MCkfnVdcDNIYj4/zbi0WijnUUy3NQtj7rBHpLGVA
mygwJ2Rd6ak2IQHwnXjBOlAT62VkooG7K2frg8u4Rl3dcY+wa3XniESPZF6bO0N2
V4Sv/GSWrGiTnmuHV04F8MVr0V+BjQF/R0l6O56j40BLbU9tmcN0ox0VUhJ22GWI
90atrFM4skghWK6ShBaIeITTMJ2bDYPl30KXLB34vDqKtRUYHmkSXgVTqrP/7Mvx
9fldIo7XP/R+GbA6/kXJbUFdpBCv1MhqIQAw50YNRnlj4Ttf71uDUWmg5SiNFwZK
T5WViWNZmWF9jZZn2tPxd3fPfbjjThR1PMf54SgHdUZzmNWYYg/P4UBNcGueMptI
f230iGyO0cpWut2QqTyTQaUGtHwdYjsvnR9mgmZ3nkUK0azmuXI=
=KQxB
-----END PGP SIGNATURE-----

--UdmvLfBUWaZkYshi--

