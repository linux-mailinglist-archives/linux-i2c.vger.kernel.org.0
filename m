Return-Path: <linux-i2c+bounces-8991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB85A071EC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B97637A3A7C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 09:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F44F215762;
	Thu,  9 Jan 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P/3d/J3Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54286215F63
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415915; cv=none; b=Ic8LxZOf7Ld2vTGLit32R6lj/pZXDa/9tPVSRIsB8YdTEOJTqWHsu0Ad8m78sXMkewmUrk3nQZtsuMrqMRVKILxeSHcITEGUkBD7DFXmDe4IDzbaWKdJl6kjibH4YA7WmVNFsw2bvpSIjOd+9k0vOKjiF8V5gxX/sOa9XghdUhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415915; c=relaxed/simple;
	bh=t+W0TdBs6sKIXRIodCAZzb9gJI7Y52ISSboStbz692c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6OiyI77/8uWJu1XXHjFny7MdglZLX5f33hpj+ycCtIQKhFvsgcDLUsTwqNHKd8C5hYGUEWAPYPkik6rIa8sMNmpUe7kCdRtYu6xkWReQTShuVmoEwrNFK27vcG169zU/FYSPNT1LSoEulXyfjSo6pzzpRN02tRjT5rod0JWMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P/3d/J3Y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=t+W0
	TdBs6sKIXRIodCAZzb9gJI7Y52ISSboStbz692c=; b=P/3d/J3YVYlb4OT/RNd1
	bfiJ9HzMlCzvtVz3nWkusrmqjUa3f7hr+hhgNZ3E9wAYP5GNcKEHUAKU2D6tQJmO
	2vG5sf2Tv2+no9dXBH9AWGjhGuj0KxPBS+w5UddGHMzOZ9uOTM/7oCRiy9NmgvPM
	Ql3ig1wKDN6r5C6pJmJRf1evHQlcvAHliOVbOh38RAQbxDXpfQRxehBSJX/qySJg
	DLJSl4IGpsrKFh+xFsxsvsM9xMppxuvYVAXrPjRXgHIKCIM2YfAL4+BJkQtaPMVv
	hGks6Q4ilV0dK0poKHS/dxOtY4SgzSpVgsr1ZR5Tkv/wiYSuc5NUDLTySF+f8QZh
	2A==
Received: (qmail 2856836 invoked from network); 9 Jan 2025 10:45:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 10:45:10 +0100
X-UD-Smtp-Session: l3s3148p1@mlJ81UIrmpUgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 10:45:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 8/9] i2c: riic: Use predefined macro and simplify
 clock tick calculation
Message-ID: <Z3-apetjnHXYLtHc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z3-ZsKyZ7aGnpjuQ@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9p2/appX10p53Nm1"
Content-Disposition: inline
In-Reply-To: <Z3-ZsKyZ7aGnpjuQ@shikoro>


--9p2/appX10p53Nm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2025 at 10:41:04AM +0100, Wolfram Sang wrote:
>=20
> > +#include <vdso/time64.h>
>=20
> Hmmm, what about using 'linux/time.h' instead and relying that it does
> the right thing?
>=20
> Nice cleanup otherwise!

Besides:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9p2/appX10p53Nm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/mqUACgkQFA3kzBSg
KbY21xAAhcjRuqxhu3TjXZ4FKkqJhU2n3tUWoMEw2dJhILj4d2QZ6UySTdUkzZ/b
ZjeMqhe03epP6izTh92yty0SYTxyE86wpdGvszr2QXbA7YiyUxpARAcdMcHcuBhy
VemdDLM+xgoifGbhEKMeHq9oaEZnAu6fJ1tDOvlGCY32oMivIN5SPprfExtVlape
0ot8VZtXyq9OIYvmBfOywxF/HVclqCs61Oks35xpBJ+zRAIHHZ2J05B9eXsqK/I2
vPpf9nsBoY49oEVi+mZL7MxtIxn1AwzUSw53bU0MLM3G2US8O+DSG2TSZ2bU43VH
a8PJsehl+NFfT8SEuWTUYEyCBJM3AyPhT9SJAEotr1aE4NGHuntBDQPZkse86DwL
x5iRJiMnF0b+8CXXogVTLdh1zvBv2CPUKA5vctqRSzB4kjmnaQRRYZ/uHuJIMCJ9
pH5AN7E+FFto2DN+vduxlyFZBRFyVDBW3R3u7HOO/xTp20loCniGCdcReHIX08xK
psP7TvfoI+lyCLeYues/SDDjQbaJt67NwdH5/kWRsy7zxM5mBwDRf5dAhP3bjsvB
MJAcRr/Gms+406jiX/tET3rQJnKPN1h0hnQuxXWudmG+3wLOutnNhFK+61vI9FOh
fkYSkV0KnQB4mQSu5/5qe7u1BqA5GBYLuMoUEzLJos9dNCSzy1Q=
=M+Hf
-----END PGP SIGNATURE-----

--9p2/appX10p53Nm1--

