Return-Path: <linux-i2c+bounces-12933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916BB5592B
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC23416A102
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D780D27D771;
	Fri, 12 Sep 2025 22:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xm+3mahz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FC27587C
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716107; cv=none; b=st4wvdmHeqAGgjlqNSFmfsojx7SE9tYmLiAUgM5O9Inih2ubaHuEPHmNsSy9NTkUak5NJeF6HX5YVDc5nQ66Uu5b+AG90LWEF5gxzadCqkmsv+Tuj5D21oEhQ2YOunD4zUAqM5VUI8bAtI63cezdTiUubJGwS2j2nkGoqgMmWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716107; c=relaxed/simple;
	bh=e6mzgxhiG8kK8Y1Gmfux4Bc513Ya67T9ITtiJe4Ehs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKruMd5oyKydVHM4INSOTHkDN5ykPbkQC4HZLZD6GjaqWWnbqHkne8UMK0PUU4VqDtsD/bsBnVGLabitN45sRPaTPcmFkiglmdQ8QRT/Y4UJ1PTvgv2w0pawVzr/pFC18NKj8GzbR3IZKKx/G3fjOCo2Sf8X3zFEM2NYAKTt5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xm+3mahz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=e6mz
	gxhiG8kK8Y1Gmfux4Bc513Ya67T9ITtiJe4Ehs0=; b=Xm+3mahzWOOxiVVIAga+
	iSHfGVRqvJ5PFCGLaL/GzUjX4YNb/hPFuCvnTGNl0HAzseT3fxq608VUQlaaTqct
	b21GFfV8Ea6MzDTHNNNQUJg/QZaOotINmZHSrFAdd1BNxqFatFklS+1N9Ho9+FDJ
	+ZtHsX6GPNPO4SUmj8PEl/u+02gQb3a8GGbXsDGQc0ZieTKmFBFhZ52rDM5+Mxcv
	60kivSuurKFEu1qkK6+nXimSBJ3KWgMDIMHiK2aNHbJr5fok49a8dljDiqbTRjBn
	Q/y7ceiHzl1FeKhkdQovn69mZ3McAOecvIldHVzAyJm/qfuulrt+slQKkXfwc7tA
	0Q==
Received: (qmail 1504370 invoked from network); 13 Sep 2025 00:28:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:28:23 +0200
X-UD-Smtp-Session: l3s3148p1@UR/rK6I+npcgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:28:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aMSehiADcCEpfJUa@shikoro>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
 <aLlgpUlHp7t8P4dQ@shikoro>
 <aLljGIcjAjQhC2uS@smile.fi.intel.com>
 <aMF0xW9rBrSK--Cl@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QSvRZOkrwrDINmRa"
Content-Disposition: inline
In-Reply-To: <aMF0xW9rBrSK--Cl@shikoro>


--QSvRZOkrwrDINmRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Andi,

> > > > It might be good to have an immutable branch for me from i2c core.
> > > > Wolfram, can you provide a such if no objections?
> > >=20
> > > Sure thing, I can do that. But there is still discussion on patch 1, =
so
> > > I will wait for an outcome there.
> >=20
> > But it seems that the discussion can be implemented in a followup?
> > I think we are not in hurry anyway, so let see if it settles down soon.
>=20
> I pushed out an immutable branch now:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/immutable=
/scoped_fwnode_child
>=20
> Please have a look if I got the tags correct. Once confirmed, I will
> merge it into i2c/for-mergewindow and Andy can pull it as well.

Andy, did you pull this immutable branch already?


--QSvRZOkrwrDINmRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjEnoYACgkQFA3kzBSg
Kbb9Og//ZzoS9CwadDc/npU9PDNiW9zqCCQ0/ib6AkExeYbcn84OVIPDIBvWrJgN
od9fKs7x0Uxe1RRrxRQzqnk8LEdktydGxj0kA53M95QfBKzYFQHhVSeltDQdVvEq
zIeaz1Hwsu4OdPqDHxOZ1eTB5I1LNcIVMPV19zb9qCdu7dcOwD3/ApFKZfmiJAb/
ZOR9yfuLQXsvzfOj1HJFG38l5SXjRkjh0RPqMWYEXhTv1Tw2Vx6mI5fuIuI2/q0L
SrsfTZGeLlNEmxPJZpCUspA7wgXc6Q4O7Y+RNkPT9MY8nKTtsgRBopCBHzi9OvRo
JiOYhLIGdL7bNTSx/In9k9fCvDm/hFxRn4s8beWjSocNyaVyHLAEf1i5lQtz8r8l
/gZgeeupR1iAEigDzhzodNoLmU5LXNZ62Z0PIq7cGQ4hXDq+Ekp2vkEZtE6GrdcO
HcJtlLDcO+iDJZmohNm9tJ3uBibt7Qg0pajdGTDQ+J4ZosXmoCD5xmD8qVWy8mzw
YPG8EC4A0l4LMlPGS20K4uLyeGx+tVovPf3VPMAdF5E78A1YeWss93FsNV2XGivl
ZWJc4kQ+jXriQREkIGzvCsvyRupFBSedhZ3t1Gq2JE6nNgpA/5G/dwnmXhzkng6w
D1WG2+UZ086rV5p/8ZbPKHoWZ1fZ3dyswq1VmkgJLZXK0q5xqes=
=fqwy
-----END PGP SIGNATURE-----

--QSvRZOkrwrDINmRa--

