Return-Path: <linux-i2c+bounces-4970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A8930498
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 10:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8299A1F22968
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 08:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E174246558;
	Sat, 13 Jul 2024 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EadJ3o/P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F6B10A22
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jul 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720860810; cv=none; b=hSkK3em06cyR2hXNBtvqRWY2mX9bHRrTcucNcgFO4H1rGahPNvIzkZ9AhnaO+qsxJ2OzT2NhJ0Nn1W/0+iY6r39zlhhycMd8pyI+ZgHF3LL8FXz8kER8rGRVxGBkNDTX+yO4xeDWrmV6TfKxjARtzo41lV7QI9ijLHFn9Vz4EUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720860810; c=relaxed/simple;
	bh=I/5mM7Ozs4rrTgQhd5TfrE9gxxG0RMf13IWKvDKcgyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+kYCEq4548xgGwLH4bnWSplAHBAAMIFDMUFEipXIDn/yHLK5tj/PIYbm/mnzov+PLADWJ7ZBFgey86Zy63mj8wFm8WQKa6iT8eAB43wHjODmquFCQUdpB/yJkGWR9zgl559wxbjD7vI3N3h7c6AtqyCcDhtxoIaQyKzA/4+YmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EadJ3o/P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oWNe
	o+Jy+DPDIJgEbohnnyCRuMJO2VEbdD8Sl6rq8DA=; b=EadJ3o/PMVueUQxWzooi
	71g0pb+M77iLzZWOemPU4g20tOk5I4wuvCrVM7lZyh1saKFq75pdsvlY5/B8sUem
	JIfBijB/tEH/p02Mw1EZ1N64a3fLZE/hv+RzSU9qL7L9tcESXYozqdDSpnLd5UP8
	UxwijAyABsrMES9ZYBSPU+/hAeeio0vXcdO4IRhKdNokvFH69253C97Q+/9p0Azk
	zpdrgxaTCcF+JeI6YwlpHrYSfX/Zna9zbOWWzqPAibfCYCZrSThboNaXw+D7n21D
	QMADSCJt4uZqztHO8rqqblnluIZ/93eftr8FnNTuj8YMaiCSLPY0tkQrVNz3GXiF
	uQ==
Received: (qmail 1384338 invoked from network); 13 Jul 2024 10:53:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2024 10:53:23 +0200
X-UD-Smtp-Session: l3s3148p1@JgXZIB0d8uxehhtW
Date: Sat, 13 Jul 2024 10:53:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.10-rc8
Message-ID: <ZpJAgnW2E8rE6PxC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <jxy6dh7o3adkh7bdwakiukrlnb3i3gakl3txx3eijvybdnj2qg@irq36xe2cdwn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N2QKhrQenIPs6Crb"
Content-Disposition: inline
In-Reply-To: <jxy6dh7o3adkh7bdwakiukrlnb3i3gakl3txx3eijvybdnj2qg@irq36xe2cdwn>


--N2QKhrQenIPs6Crb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2024 at 09:38:42AM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> Three fixes from you in this pull request, you definitely don't
> need an introduction to them :-)
>=20
> Thanks,
> Andi
>=20
> The following changes since commit 256abd8e550ce977b728be79a74e1729438b49=
48:
>=20
>   Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.10-rc8
>=20
> for you to fetch changes up to ea5ea84c9d3570dc06e8fc5ee2273eaa584aa3ac:
>=20
>   i2c: rcar: ensure Gen3+ reset does not disturb local targets (2024-07-1=
2 01:45:08 +0200)

Thanks, pulled!


--N2QKhrQenIPs6Crb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaSQH4ACgkQFA3kzBSg
KbbY1A//fW/aHAPQtRSli+e4aaaKm5Y+eqwFbKQOolfZ/4LwGC4D4E/HJmlWDaEj
4I7Jipw4wu9iRGFh1vLOG50OfNJDFU3UlX+UKcd9xg5pEC37N6C4Ga/4psqOMbFS
9Ad7A1N1yQkJI7VwsFjBd/bePC1rw2rF0m3CLh0AzTDiNO8KM+IQOrKn0ycAaTws
xdRPfJlJQbPTiSCMEDIdeoD8xoeZw5XA8vaQrbujvw7Gi8kKwjLXb1p4yBY5UYSQ
jLjJWl2gn+ZY7wIrzPx9b7VcmsLbrYjd8GQkQH44WqIjUX7LkcxUJ1ZJWvuGp/dQ
o8bY11hY2Do2lTkXFAlQg7Kb32nFsXauovUd3Cc9jCsoqEO38y6lI3wfjLE08jUh
WcEypeY07iWSVrF0OZK2MrrABzWkUEJkvZu65IpDJmHp9BBH4cKH3pneoa+4KBup
pAbarxgPxaGREZ1OCxnmuuj37xFhwAuCtD38QbU1ldASeDcAzisAsQZ7oPgeJEmI
I7t+bn8Jq9Zi41d//lVrHgmwP4tkF7VWD0mjLjM1ifSXvo0WN9TdoKA9M70tA/85
HQiw41GHOoHgRnBZv9qTQgon58QtIz3VEp02pPzGSly6f5PiSnpFtzJAMnmesc9O
emHEUjGzOnTQXkDRlw5ZmsmjC9789ulYvEY157SaG+b+V0Eq5mY=
=atho
-----END PGP SIGNATURE-----

--N2QKhrQenIPs6Crb--

