Return-Path: <linux-i2c+bounces-4743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A734E92978C
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 13:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A9621F21453
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 11:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB98C1BF37;
	Sun,  7 Jul 2024 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XgUuU4av"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BBD18E28
	for <linux-i2c@vger.kernel.org>; Sun,  7 Jul 2024 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720350403; cv=none; b=Uwq+/DaoKM7zNkb5yUFbX2j0Bu/8R0regrWNvOMND3FFHm/Fnxd5IVuuu0JHtg4FDXtvNvArQx3luMr0KCNlLpQhPHJIvKEdTRzB1rXrP88zr8owfMGSohkD2YE0LSv5F8KV3b2VIORdLY3RU8feBjTLvgjly5benu/sY2cWW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720350403; c=relaxed/simple;
	bh=qcdakLSQnrrjFFUgrSUQQba4I6Er/xiv67DBi6NE6aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZA5WOVbGTvvuhUUDmSsgfvrQ1J3hPvpJdgCSlzLxcGdX+G2QAxTvB3U9Vb9761y5F94/RmJ3LO7vmkx42r8qNpF/lg6PM5NXB6FSzQEuiHLGRNbr+jdAcOEdvFox9Et9xAhlD0NHLjW3lbluwqbzsSmsSM7G9uas4PZ+IeMA/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XgUuU4av; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=87n/
	1dTva8J7QRivoWNaqXOhncR6aueYQkpii/siNgs=; b=XgUuU4avjgtPSh/Ti6MX
	nGPpXJ/3s7OjGlmtYvlwpGMBDD6d0VlGCzmrOGGZdEWbAGLWhMvx3JLdbEC+YYdN
	GoTLZvxpV6jQWOsz2M6ZNG1GWCZdorQMvd2yjS/U306TXL2tN1oZPFb4T59zW7ee
	7VVJafVuc9gTtTdT0IRvkCO1MW6JOgbaJYZf3IHDPU21lBp+fuolRm9u0BFosTg7
	cY37cmS36Q5ehjhMJykfmNR5xkypfbNMGveHP6umFDx6VFgvh18SUt/CVrh57fuf
	SQcSPZb9NSxsHJdPOy/uW0hXfsp6w3BlJ+iL2Cmy5g0XgFLJ4nSI4x65FvfcXMQv
	1A==
Received: (qmail 4076470 invoked from network); 7 Jul 2024 13:06:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2024 13:06:37 +0200
X-UD-Smtp-Session: l3s3148p1@SclJSqYcKtNQT+F6
Date: Sun, 7 Jul 2024 13:06:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Message-ID: <Zop2vNCrzDmEKKiO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
References: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
 <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MaVWlVIGH0PKR6c9"
Content-Disposition: inline
In-Reply-To: <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>


--MaVWlVIGH0PKR6c9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 07, 2024 at 12:34:36PM +0200, Markus Elfring wrote:
> > A newline was missing and closing braces of functions do not need a
> > semicolon.
>=20
> Can there be a need to offer such changes by separate update steps?

That would be too fine grained in my book.

> >  	return !!(rcar_i2c_read(priv, ICMCR) & FSCL);
> >
> > -};
> > +}
> =E2=80=A6
>=20
> How do you think about to omit any blank lines at such source code places?

Oh yes, that newline should go as well. Thanks!


--MaVWlVIGH0PKR6c9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaKdrYACgkQFA3kzBSg
Kba++g/8C4HdtvgGqE6iJDckRHQ6qUgQL/PPoZEFrivN+umIhSd4wRljIJsRAV3r
OQ7NUJlnXi0BKnHNAUdDIOinrs5+k/AOUv1VMe+rWiGQooPBM0hp8VbrQ2EGUXoy
0OyUw64tbOPEpBwdMoYg9++t8YdIaO8pMB99bmLZkQvHLjq/W6K6HXMCYPCL6jjh
7xBXFKdVa4ARXs35SYwhMGBDwBBox6TwuhJK4b84Bf4idTapim7GyknXZUHYf5EG
9BC8mk0OzR0W9m7Q1StkyGqSUFbOehz6WsntmF99StuvESzV+aoWcMDlbHO/Ow2o
rErAz5R0YhlWR4jwKI5Cf8jMbgz4LQH+UpeaPUuGtyy47QOosbhatsDY5/fwGpAy
WifHlt4OZL8mQLEbHsF36c0xZehCfcsCUt7e6Zj9lD+kyUjfKCSsgG07oDSdw3ka
wRQ/l6oYOfzWbs1avWVD90Hl9AbpLFONxJJHahKli1lwV5BsX5PZwEBAusBsneBe
Hnik5DkiUQg1yF1HYxXAMTNx/uA4LVMXkBcWoPc4g2Yu7byEstltVFkU3o2J2j2G
TQv7WfFfhWMPZDdOy26GlJxcDAENrxHbLY8zLz1NXi6QOxRNvJvfnwsrx8JT1ubA
AjXCXCascdIkfKxWreuG8SE8ONU6Zx/pytBlhe05Hi9AWn38MrA=
=Qt7Q
-----END PGP SIGNATURE-----

--MaVWlVIGH0PKR6c9--

