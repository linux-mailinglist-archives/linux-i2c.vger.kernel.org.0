Return-Path: <linux-i2c+bounces-3783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931C8FACFC
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 10:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16AF1F276A1
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 08:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6901420C6;
	Tue,  4 Jun 2024 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K+hP4aPF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A7446CF
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488009; cv=none; b=iEzLw/I9dU9AW/0jqMiwh6IclfA4LusxhQ8UJ0SM5U/9mWDoN2aftImeOAuabq33toAtkd8hONuYvsCygj4kEg/hEdtQ4OOdQ7WRplMGEDEr6X1Zhlu4xIw1hogSExh9TlcecmMmwigeQIfMwp7P69i8q9VIQhqQZQ6NqY57o10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488009; c=relaxed/simple;
	bh=2FwahE66ZXIwspaC/JRsBaR02QEmRxDVlA8r/UgHIEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5eSzR7aBbpMS0oYoDdhDPf5Z6dZziel9zbQNrgUotaSxpeUlOJoVW3DP4NGNtf0h4Hm/hYapzr0mpCFjQiGBrdQWDwVMv00VETQiFGD7/5AoHOSft42ZmcrPZhIv4fE8zEC4TTnhBLBE0HzrWcAlUn+pWDHCvE3eu5UNUuLYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K+hP4aPF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2Fwa
	hE66ZXIwspaC/JRsBaR02QEmRxDVlA8r/UgHIEo=; b=K+hP4aPFlCRH0h5xXLEU
	/9kHCA592KKdKg2kYjOpCrj2AGOjxuI4HbrrWY65K8A21X4TsoEzevkLMrIjB72W
	spvmeNCHEThU1Rv+8ov/Xw2KWy3c5V+V1M2YjUBkwl+L3OmU6844eIIYs/YGdCj9
	GqG9VW6VFpUe0gAjGdTv7sXWUOsX7gQ03PwDMiHNmqT+2YbgN3i7PenBiygglTVP
	OjKhK4Awt5pZpTz55ic35oXH7SjG399geGItpv1GWADy+lf9P13r/IDJxRjOw2tN
	6dVyQ8LDjbn7EPHEBtFHGxl313eAl4t4kulHNSkXgcPie33QQiLCU9fjGLt+x2h1
	HQ==
Received: (qmail 2214748 invoked from network); 4 Jun 2024 10:00:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 10:00:05 +0200
X-UD-Smtp-Session: l3s3148p1@Lttt1gsaVscgAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 10:00:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Hans Hu <hanshu@zhaoxin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Wentong Wu <wentong.wu@intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: viai2c: turn common code into a proper module
Message-ID: <bi3lwgeh5egvd4g6aspwvefibk3cviwuzinvgkmnwy4f3bvua4@nf5a6w77cr7v>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Hans Hu <hanshu@zhaoxin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Wentong Wu <wentong.wu@intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240528120710.3433792-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzrqra7phcm27hy4"
Content-Disposition: inline
In-Reply-To: <20240528120710.3433792-1-arnd@kernel.org>


--hzrqra7phcm27hy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 02:06:30PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The i2c-viai2c-common.c file is used by two drivers, but is not a proper
> abstraction and can get linked into both modules in the same configuratio=
n,
> which results in a warning:
>=20
> scripts/Makefile.build:236: drivers/i2c/busses/Makefile: i2c-viai2c-commo=
n.o is added to multiple modules: i2c-wmt i2c-zhaoxin
>=20
> The other problems with this include the incorrect use of a __weak functi=
on
> when both are built-in, and the fact that the "common" module is sprinked
> with 'if (i2c->plat =3D=3D ...)' checks that have knowledge about the dif=
ferences
> between the drivers using it.
>=20
> Avoid the link time warning by making the common driver a proper module
> with MODULE_LICENCE()/MODULE_AUTHOR() tags, and remove the __weak function
> by slightly rearranging the code.
>=20
> This adds a little more duplication between the two main drivers, but
> those versions get more readable in the process.
>=20
> Fixes: a06b80e83011 ("i2c: add zhaoxin i2c controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Andi, I am tempted to include this in my for-current pull request this
week. Are you okay with this or do you want to review it more closely?


--hzrqra7phcm27hy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZeyYQACgkQFA3kzBSg
KbYxrhAAjGLtahAsSRKZR0KV4UQzJCnGB4IHLqh5jGCTvKMNxQxfdvTSUg23MCi/
4MmtcLezzjSmCbd6Z6Apk4za6PxzLRyeSw+rpp7imXh6RSII2QkWAodG7wyU7jir
szjfA58A2pHdCIFcGcNziygwVx+W8kNcn2GRVNMn2NJP2EuyXS+hkMvYh6CdjOVK
VYwkh5jeRjlUt8c2jQ5uMufQvsFF0tuYI87awEiRUSSUU1TjrJDdMfo3+L4wTusi
9y+fNVGfaA4Bsd1bdB3Ex7K/tUCkqh+1QsStMWKiLEr/kfmvTtG7p3wsFZOvU+Rd
dvJ5jYJ34j2aN8XsrFlf7huuNd3TFdDbAPjUV2+ty+ZznqsRi+YCmsjWticWCFs3
nna9B05vIHjcM/4ZU2WRR3NbHJAzhtxjnxOg2HVRvE0RRPVhlTy6C86H1bUnaatK
4KKKT7Xeh/Ounx1XenE0PAsWkOYyoLGM/TDJI67SQI3KS1rL7P2I5wycEc26CfOx
YzRr8d7UZ0gi0jYXvEFsuNUw/kW59PcBUspGAOfqZ7gmuUafWjsAQeFHBCe6iQ0Z
xVR/1O48JqD6neGR8VM6aNhvhSuNzTb5C9APPSAqzut2nJbY29Bj/gtvbodlejUQ
neZtHetUCiGwmXiIW0t1xz+w3FPvD1JgwcCVYz4dfznJmZHmz14=
=mOV+
-----END PGP SIGNATURE-----

--hzrqra7phcm27hy4--

