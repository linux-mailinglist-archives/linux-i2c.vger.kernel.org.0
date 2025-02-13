Return-Path: <linux-i2c+bounces-9413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294FA33BEB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC021883A7E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 10:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7806121128A;
	Thu, 13 Feb 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lJ3Ixv9P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76F20DD5C
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739440980; cv=none; b=j7K1NbXQypmRY6mqF7Xe2OJcqFmpwk3mdG+8Jgf3CnR1MGvd5sEMl2oKom7akaWkTVQZDwVHLchyTIcDwzteS3V9MXnZwz0KQorX7MDT0plNw++QkJJeohJp7lH8xHL+M1Mrn/CbxsU1tjNMFl4RR1dj1z12T177cVYcl0XyKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739440980; c=relaxed/simple;
	bh=UnlssmYuhIn+vcCNx5MG2qEpYo19Mi6vK6bTbOK52kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVe3m5kePwirvjm1GWxgF0fiyrQHFI30oM2yGm4kKa3dY7QH3tZ3Xv6NOLWIM3XIjFQKGCZN6rxkXrjjBQyz97tozlKgkd+hIJnNU6/TnszDRXCiOJxA//AdaWsnFFe6fKmOVFTvEG543zhY2kJkzc6trHj76Fg3u9B5WCCEMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lJ3Ixv9P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Unls
	smYuhIn+vcCNx5MG2qEpYo19Mi6vK6bTbOK52kg=; b=lJ3Ixv9PpDUPZy+veSDx
	ziTRqgIsOzwTnHddIoiDBXPFEseEJoG1keRyAs9yKz58AyHx+dto1xstv6SsJBlD
	cHh0saavR8n2B+kcgw2b0pnrG2gzY/ztdM/09hWnqBLizcPgmLQUbecXC5SKKpDU
	0lBVwBH+NU21FsEcURx5TU51xG56lNRQ4cYcGyd1Zj7giHXpsot/m1SaWaseV37U
	rZSXdttsmML8+ouc7rvSRfjF8fBgpYLVdnGE27n8N1qseFjWwd81RvoT8HYywvDD
	wJePDoyrx4FO03lPiva4MOrX0sVKdZbaUOFD7RS0GpCP7NkQznf4wpdyC7ZIKbZU
	0g==
Received: (qmail 1823272 invoked from network); 13 Feb 2025 11:02:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 11:02:55 +0100
X-UD-Smtp-Session: l3s3148p1@JVB1KQMusMxehh99
Date: Thu, 13 Feb 2025 11:02:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z63DT_XdzEWrP4eR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knIGSBLjShPS7lvY"
Content-Disposition: inline
In-Reply-To: <Z6zwqbzd5evG0H2z@smile.fi.intel.com>


--knIGSBLjShPS7lvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Just a generic comment: please don't spend too much energy on 10-bit
support. I have never seen it used in the wild. It seems more like an
academic excercise.


--knIGSBLjShPS7lvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmetw0sACgkQFA3kzBSg
Kba7ew/+Kqcp2Fze4DeH75uP2OB/QbNpx80sb7qHDvTBoOdL9TX6daJGbx9NejYD
4cXfgTJtWcAuiwn1QkGFPTMUqUzpc/0KOK3GC6OAGvm5ey4/HDXKzBiue8zKbiOa
da195dsvzjs7f9kMARVNMzzqXYr3NZXcLAZDPlR2ifCiFGVnK3xYkUPACWjZEWzI
fy15U37jiPuCE/3TSHBc+1/q8p2T/vQ2h0AApKD8NgpsnORqYx5oeXMf/ztjI+RM
vfzNPKvxb6Y2ppaPZWx6teAZfCA52Bn2twzmbwQBpsRdR8s8lUp00IO9aX/xZGQi
zCVMD74Kz7B0lvmAvJHv/23vHofoRiZmIATiL0zl6u2wm1zlzsTv0zFk0PVqBLGZ
ZZ3DEOORzPNpfx/csYx9U1J0L1OIoqgc+/y2FnfQIIXmTOvnwHNJb9AD5pTr7b1u
YjfwprDAc9yJI/ps63zcYwioTc6CjTENNLeHwTSFgmjdvPn2KJTLNiG5GHB8zY5T
QrOPvOGOI2hLs6LbWrCxQnRcrItIsjAV8ClxwlTRIllAXeqMZAc+2W6KhmukwsOs
Uin3nyrmWNw1vx50tN/mJ+BeN7A5Kh9vhwLp1+40Auz5CUErrJtyfuPV8kNzH8wz
5zooWxoWZMwZ2x2SFgTy1iVtPJZ9m0ytQi6P+Yv6Xu8uqDgy+Q0=
=+YyW
-----END PGP SIGNATURE-----

--knIGSBLjShPS7lvY--

