Return-Path: <linux-i2c+bounces-9530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA816A406F6
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 10:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B29A3B9DA9
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 09:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A332066F8;
	Sat, 22 Feb 2025 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="afiDs5l+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9DC207E15
	for <linux-i2c@vger.kernel.org>; Sat, 22 Feb 2025 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216744; cv=none; b=XOymKwcRYEA+RqcDMuu4wvQy+BHiB8V/wWLXI5/Qa3Ol20gIq222paUYAnDKvE22EMGg44514vCMaecOrYTuuUpSIzGNfeCLQeq4z9yfDQ+CruiK1TjEvgTPpTvIFYv/E6yEzuBsZs2CsOO64/6nAedrAk85ydZoQah4rkwsLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216744; c=relaxed/simple;
	bh=59P/xNLgeqH/Fa7+BuJx7qMLGVZbgC6bcP+O5TK4OgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyvyxZRKZ0ifW3FDB9UKz94vT/fI9nB/UTp0AoD1ZypI7T0iouKEZFnro9LL6QLRzGiibm0mSLuiA82Uk5O9sJjUPHNcXBkka8Kgs6RsqOjuqGnQ22NBI3CQQJ0ChJ/XhnjJbgXs2IE8u05vTDwjUgg0JlSzGQf8br1IohYAIKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=afiDs5l+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uLt9
	Z91YNx6dOCP+Pak2OdUGCinRlgoCNVTF+11hRL4=; b=afiDs5l+L4btrSWZIruA
	kIMIjjXD+JHuaLzQ0NqbX/aOMIDsMTfuS+W9ll/dXsrM78tucX82SSRs3QW4FizD
	H2xy6sknjyQB4kwQe9uyr+DzU5nu3l/8n8HvG7Mud4aBA3YAfYMkf/3qrv+0Xy1S
	XKW8pv0pEg+YImYe1ZakqeXoXI9ICQojEGV3fwfAQetLKKeSY+49PIhSyRiCMLnt
	lL4ToFbiE4JJ5/NxEomjRCvGQpCPbWZ4tAUep2XPI7+fXjdbeV4Yp7uZLT3wPWju
	AQGEJ5Y7ZCEUuqeHL6WpxVgghw1fRPWvg7fma5Lyanj8yvHDJEIqXuaAg9cEsg4Q
	aA==
Received: (qmail 1533020 invoked from network); 22 Feb 2025 10:32:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2025 10:32:20 +0100
X-UD-Smtp-Session: l3s3148p1@aoCcyLcufG1tKPLt
Date: Sat, 22 Feb 2025 10:32:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "i2c: core: Allocate temp client on the stack in
 i2c_detect"
Message-ID: <Z7mZo7k3p1Po3hD5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250221205449.3838714-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="79IIhFRijrqxi5Of"
Content-Disposition: inline
In-Reply-To: <20250221205449.3838714-1-arnd@kernel.org>


--79IIhFRijrqxi5Of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 09:54:40PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> struct i2c_client is way too large to be put on the kernel stack, and dep=
ending
> on the kernel configuration, this can exceed the compile-time warning lim=
it:
>=20
> drivers/i2c/i2c-core-base.c:1420:12: error: stack frame size (1040) excee=
ds limit (1024) in 'i2c_do_add_adapter' [-Werror,-Wframe-larger-than]
>  1420 | static int i2c_do_add_adapter(struct i2c_driver *driver,
>       |            ^
>=20
> The current version is the result of a cleanup patch that does not appear
> to be a requirement for anything else, so address the problem through a
> simple revert.
>=20
> Fixes: 735668f8e5c9 ("i2c: core: Allocate temp client on the stack in i2c=
_detect")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you, yet Geert was faster and fixed a checkpatch check:

https://lore.kernel.org/r/f9aa39362e918b62aec0567f899b37d8d3c44710.17400641=
76.git.geert+renesas@glider.be


--79IIhFRijrqxi5Of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme5maMACgkQFA3kzBSg
KbZIXQ/+LcL/GhbuIVhLeiabnbpfkwD8FHDAB/oSQMGGXbdICyx5t1Qsv9Twjiec
4R96QaESqFWK+4c7k1+rSMHOG/k29S0Ebl5RxeZ5c96IkErhuMCQdeMrLfa/CkAQ
RerC+EH0n6ZBIB2QESWLW3FCx3HHOggXQu3jMPLRKovQ7dN3alJ5EXXxMzl4vBGi
04cAf2VYXyahI+z+5/HnVZDZdtiMHs24TY5EhbMfdZSxbT7yMuVDTUA2l+qI1wCk
rIJnqsbgMh92kc8C7E1RVNyvCDjmRJYtyVaMrD/rwOHAFd48DsfDiXwDUikMNhGF
I+swk++KPk0riBghSaoYoi15VPAWUIeUEL+XENmQP/+mmty3T990nNN1i+jCQpAo
4nwSX266GGHEBrMnPLRX2/gZ4gh2bIQvQuyswc53lxD4JXCyL1Iux1EatO4vcrc/
XTcT5n5i4CXIXwRCTYS6elexMD/cX7THulOSO3c4HoufRxTaY9Lv1KifKJkLbZXg
x5YofsEbvNyi9ZdzoY2iUjzxDYdQCT4Knn+bfh01c8KCrZjq5I6z+qa2FOPOzL12
rDra7y5Oy1j1cYnzL4OAajbmcsQxUw7eQnm0s7QQcauIuF41kjLHbcTd5aEBoLrE
fLUbYnp28UTguXQKNO/mVU73gR3UeMLqvn0zFr64WUwAkX9XTSA=
=bd07
-----END PGP SIGNATURE-----

--79IIhFRijrqxi5Of--

