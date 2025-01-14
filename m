Return-Path: <linux-i2c+bounces-9076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6796EA103DD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9A297A179C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4027024633F;
	Tue, 14 Jan 2025 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JRwaQWRj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CE1ADC70
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849856; cv=none; b=l1tamGoVx/77ijQ/244Yg7RWiJ7JA/2hDeZKwOqAPPJhW1olcWDMIi1LqO7wLy7pePvw/FsAnToAVYTnAhRWB5NBT6XorBoBojPXncsj7Y+tyf/vQxBqGKw4tjUP41csnBrTV+9JQGYTv6c50V7S35cKx9kelVFYmmNvdzBluJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849856; c=relaxed/simple;
	bh=p9FhmEuak2AOj0G3x72jsb8qlhhoblSgTsHoDmwSh7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqjl4UrzBjzrgl513MrJBcXozUrgVicIehBkglqQ2q9eecmHXjf31XwjJzhCZMcId13ZraCtuMFMft7AU9ssEGN9q4Vs4QM0cAadHkJ1hDI19+/4lSJqE1M73SKr7OWcEyMHwnlBBg5PxVpLfsgyuetGgKs8cV642wPpMYm04/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JRwaQWRj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=p9Fh
	mEuak2AOj0G3x72jsb8qlhhoblSgTsHoDmwSh7U=; b=JRwaQWRj51/d7JekyKNx
	NnNX1JIeLK4D9ZBH05PGDqjj4WfMahb4N9IjjHcVtcYQ0UrmqcFMURXZCvnKuIMH
	f8WAu8hjHxNlqwHMuI7SYP9CJAfdEodgLL5RZ5qAswfo5PP0PVWatT6Nx23QyB9u
	A+bxRMbvbqVn2gVl0YkRoVxGtKAwxPSz81vVeOBbIirKqZwVnM06QW2gXXLy/Pji
	1hw6a5GbtiBXdlzlS41XcuoYLj8ae3r3tNNhR/YpFygxghDKCQxoZoY1KY4TNK9S
	U3jX1/GMvCrtUGetyShK+nIE3BYcOvQvWiBnF3maacYITOYUZ4dfPWZLR7WW/eka
	Tg==
Received: (qmail 163356 invoked from network); 14 Jan 2025 11:17:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 11:17:31 +0100
X-UD-Smtp-Session: l3s3148p1@z0Np3qcrTlltKPLS
Date: Tue, 14 Jan 2025 11:17:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 08/10] i2c: riic: Use predefined macro and simplify
 clock tick calculation
Message-ID: <Z4Y5u5ys-w_kD4yC@shikoro>
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
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250113122643.819379-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QJfypmv03LFlQyvp"
Content-Disposition: inline
In-Reply-To: <20250113122643.819379-9-prabhakar.mahadev-lad.rj@bp.renesas.com>


--QJfypmv03LFlQyvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 12:26:41PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace the hardcoded `1000000000` with the predefined `NSEC_PER_SEC`
> macro for clarity. Simplify the code by introducing a `ns_per_tick`
> variable to store `NSEC_PER_SEC / rate`, reducing redundancy and
> improving readability.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--QJfypmv03LFlQyvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGOboACgkQFA3kzBSg
KbYVLg//Ze4fXJfQbPQuzhxzRHjRNkhjzNyR24DnN6opSPoMA9rDLQDV6YK4jpYi
9RpiLKnzQhpVgyw26V164RanJfVz/3M9eoziUZGdS2CFfU3JlzIZ1yo1a6OBoXjX
L1D6c5jUUGIAW5RqPegs6TvqZOn8Uif2aiIKe1SaCqzh9Waq2lZX7NcPkr4NVGZO
TpE4mrZbIEinew/9qXvWv7JEZQpXMuSRrbzfaV2ENuDE1pTx0epjMlq4OKZAaRxJ
UC1WMVgcHDAwow8tGTx27eY+mYYAhghU2p+POeXR6slaaSTA5SptMrlF/MZlqBQA
+n+MfQ7HgNopLAjSFskdJwzLyc+3mFJUuyvPSRSjfOZdu5SaXjorhigTiHyd2M2j
L7INHT4Mxnw6GfXpruCMmQLCh1zNK1GO8/Zl7DuNLYIDjI1ZpCyvkeycvCAVT/Ni
4j402qoCOX0d/GYs6zFuKmqo706NxDbJj5VnFCh+dUizWz11bEq//YSHI6E2lVHy
2sNfyLl8UxkhkrvTNjWwG+Fo80HbllLjjiWWz2RD/ATHShlNwHNlv3QtZGPSJKVj
qFveJUwzEL8hs5aJ3ogZBPbCmhv/fLWO/9I8r5UILQOIaLp0HGunJtXu7sOWxTAF
dggLVLQsbYwaMTayIWNmD/2vj3ZN7hGPt4kbPeL3O1B8nwHPiHg=
=LtyF
-----END PGP SIGNATURE-----

--QJfypmv03LFlQyvp--

