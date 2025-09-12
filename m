Return-Path: <linux-i2c+bounces-12931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819FB5590E
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86BC3A4795
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344F4274FD1;
	Fri, 12 Sep 2025 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tyh5Qq1y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370CF24A046
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757715547; cv=none; b=BHvm3q52uFRLBBhWlrd1ITKu9pzX7LxVK36lMosu724Cm3xgf92qqgL/vxkga+b3H9avf3/LcmR4A5EtrKSQxaoP/Fi5b9x7TfJE7X5+vSImjyTsk5S3buM0nrpJd3tg3bTWHIBk/c0mZ8p/NvRCEsUEj1gPJ7baHzgDSb4Pnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757715547; c=relaxed/simple;
	bh=mGnkv1Ggi0G/Tt0DcRcDcxHZ/dC/XAo+d/7Khy1qh+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLMAwIwCSZcOXTc75mgqBMavJlDewblnhTvikz7AWhtrZoAmMhT7XETF1/IKJbQ04+fkLMfPLokjeLyr7/jBGUjErXaamh9Y/bHRTVSplMGU+xuz0/Lt0oQTqbXrmwHbmUZyoaKlvkVQn3JSgEavvkt5zNPB/t+xCgGwKkCOwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tyh5Qq1y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mGnk
	v1Ggi0G/Tt0DcRcDcxHZ/dC/XAo+d/7Khy1qh+s=; b=Tyh5Qq1yxZ9ALd98vU1Y
	1sze6hTZRUvpoTG9+/13sCJLzL8UCOOijonmKpkGOZGyJcywBo3OZpza6a9RiTaO
	PZyHuRtfaMfpkrm88EBSb5ik+BUwqeBHhFnYyX/XYeT/5PnvIVLrtEgfdRL67DqK
	+LpSVVS43LPD5jkaBYWvpjQzSAFOS9NaId8FIb2hDYeeUo9bZrWMMupurbS+a8Rg
	ynR/W48LQmvbdnGmvkSaMZEHYKut9FI1uftNA0eAk1v1KpBPD2emgAB/inejjH4V
	oIZntFuZnjpUf6GF8Jp4ujX3lVP6izWcTfIfRXLqohw/ARUfkK+OSHdisNqKFcyt
	PQ==
Received: (qmail 1502661 invoked from network); 13 Sep 2025 00:19:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:19:03 +0200
X-UD-Smtp-Session: l3s3148p1@uAyMCqI+QOIgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:19:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, peda@axentia.se,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH V2] PCA9541: Use I2C adapter timeout value for
 arbitration timeout
Message-ID: <aMScVqROiLAu0nXY@shikoro>
References: <20250731125535.22598-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bMOHwqBxX3RVfEIG"
Content-Disposition: inline
In-Reply-To: <20250731125535.22598-1-manikanta.guntupalli@amd.com>


--bMOHwqBxX3RVfEIG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 06:25:35PM +0530, Manikanta Guntupalli wrote:
> Remove existing arbitration timeout macros and use I2C adapter timeout
> value for arbitration timeout and forceful bus ownership.
>=20
> I2C adapter timeout can be configurable from user space, so using it
> for arbitration timeout helps in configuring the arbitration timeout
> from user space depending on the use case.
>=20
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

Please use 'git log' to check proper prefix for subject like "i2c: mux:
pca9541". Fixed it for you this time.

Applied to for-next, thanks!


--bMOHwqBxX3RVfEIG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjEnFYACgkQFA3kzBSg
KbavOg//Row2KDcOyIMosTMHAuamih19cesmnCJafq9A5ZTXNvSQzFZyVpiZ0QkM
lyRtaNAQotjqlOOG7aULQvpuhx4fPVF34lmeiSm5ebi7AvuX2At/3FVbyLP4Y89/
fFwogbT/Sn5DEThqqnlnP967xRysBi7kqppIKh466TTllH0BR2/sTjJ3RY5lYBIz
4VGIDLzGLfN/G1srsBeA2cYsRirb7rbK+G840TppDgP7OakYEXi+412zdteg6n97
nC/wnt1CNoC9tQDXd2W8zW/9p35vYhCebFaqAIJMr5c58QvKYD6xL6i6nKNxf4Y3
7BgbHEv1BJ7mcfa/SvfjKD88LRHyr885eqNP6cYGh6Sa2dOygNYnbGxBAwO7O1mn
J/WWiGOmpPP+WwPEHeSMOSWzWLNLyD+Ep5Wb5UKb0uYoO0hjEvGyb9tuEjx5zAVj
SyDuDF+f+SBaZJGWhZdI57kB5O4eVJ9TAttTOOk7BzbX926hHV5beNA0fFvxYwVq
237Rd8JZO+VNcy1hPgVSCC6TjfLv9xD1QYgsNFpScKDIUrIN1E70QF7t0wNy2zf9
4ww3V+OjrJxeHIwckd7YwzNeMrmfQsYMgNvA8nF2I/3VYF+ewyL8NMZHcM3ZeaYJ
OS7nGUB2fpx9aNpkosaoVC67kg6nHc/WvqkQd8RKYIuWE+r0OY0=
=44Ph
-----END PGP SIGNATURE-----

--bMOHwqBxX3RVfEIG--

