Return-Path: <linux-i2c+bounces-11006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5DABA8DA
	for <lists+linux-i2c@lfdr.de>; Sat, 17 May 2025 10:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A32C73ABD15
	for <lists+linux-i2c@lfdr.de>; Sat, 17 May 2025 08:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC221922FA;
	Sat, 17 May 2025 08:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l9H2P+vJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE921CCB4B
	for <linux-i2c@vger.kernel.org>; Sat, 17 May 2025 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747470248; cv=none; b=DHSsjmHf6JpmkzuW2l0DSZJMmhgWMLsImZ+ZWj2AZrjEPoJT6GLpTuigtwVYiENRp2Gaefi60G2HRueG3OxxIsF0H6a7z9GVzuVgdCNGPswJQvTJF2sNGaV3P4ZvsyEl/yJwA/53htrI9Q0LASNLg124l22sxrG2zhf6aIztSBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747470248; c=relaxed/simple;
	bh=s1nTQGBD31+KHbF5SOweT37umasqo4MTw7szvhBcfy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PK8i9OgR52C9v8X9u2wqogNTAu5hsACAKHzolzJtlUPXO3h3N2gA/qKKNL91xDGbfX0UiaojAsSE/vbbq/Tt32xdMOBtpn58geo0Gb7ykmS1KKcYccAFDUaUUikqRWIePyYDHlkVTSWA3/KqcxvY3gAbfRjkMTRW0uZxewU6GOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l9H2P+vJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+1XD
	rmDz5vIlLyH8vVVp1fHDNWZ4Hdbcl0x7tpFLbVk=; b=l9H2P+vJWCmpdDdrDl99
	Pkxoj3oviBiWX+9/4UymGTvRT0bQeca3GBf3RxqXRr10kO5Ye4KbnS/PO9Ip9ccH
	JHBJCXtTuIYY+1djez4f8W3xjsqt1F/HN9k1avMw194vz5xkAz6pV5LiJiqQ8/N4
	dqfli1qi+D5m4VO6BhLYqc6U0bJRCSVtLt/EgZSz4off0EEdp83tMkiNv9K2qlvG
	XP4obv/TeOurDUCwgbE5IOD9hMmCFRObkalni9JgsXeAsMRlo7CMX0njUeseNM6H
	A5PJ7MX83D0qaJ6Gq6yUTbuXu0DhgLG6Pu6D9ubdQhMNkhca1KuTaGQ4Z1sSeJcj
	GQ==
Received: (qmail 1685043 invoked from network); 17 May 2025 10:23:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 May 2025 10:23:55 +0200
X-UD-Smtp-Session: l3s3148p1@koWVnlA1/LVbRaAl
Date: Sat, 17 May 2025 10:23:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.15-rc7
Message-ID: <aChHmtqCuYKF1yox@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <v2tjgz5opkfbnlwsl4ptiauqq3bcahgxjfwx6edk6c6lhyhzm2@nlcpfl6lse6b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="72Lqpmoi9spjJbkk"
Content-Disposition: inline
In-Reply-To: <v2tjgz5opkfbnlwsl4ptiauqq3bcahgxjfwx6edk6c6lhyhzm2@nlcpfl6lse6b>


--72Lqpmoi9spjJbkk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 10:59:14AM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> I could have delivered this pull request personally, printed on a
> roll of paper and handed over with a big bow :-)
>=20
> From sunny Nice, here's this week's pull request. Now, time for a
> dip in the water.
>=20
> Andi
>=20
> The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fe=
c3:
>=20
>   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.15-rc7
>=20
> for you to fetch changes up to 1cfe51ef07ca3286581d612debfb0430eeccbb65:
>=20
>   i2c: designware: Fix an error handling path in i2c_dw_pci_probe() (2025=
-05-14 17:28:24 +0200)

Thanks, pulled!


--72Lqpmoi9spjJbkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgoR5YACgkQFA3kzBSg
KbbBjg/9EBJjSwBYHhgj+p+IpfIOo0+j7w0v9/Wmn3NqePBcR4xf/M9NT7BVXVvl
UFE6WX3uCvGYOYCKpolVYyobNGZAGceSUUPG42bTmq8idk5/caVATYCTwrB9eTPE
Bez1zGXjw2z6xR2hsZWzNcp0n3J93Tz1d5sKIxjMyrA3kD3szoWLdogQ85C8LchH
kwLmfk6uN4wDF99n4VbTJfeV0Zh9OwMK/eYgdQtJ2XA2aqrhjc/p7tl57ikL6eSD
kpyZRmCFHZWmEXZPVINeSUlgN5xzXW/4zyWr2xooY1y524IzVZBDAezdCD8FkqK1
lihJBr2Ac6ajp1En4FpXS5+76m/wktmaV7oTorVu4IFOGIIokElf5QuZbS5NWhKD
fOApx5MItmBSVhbYDEVX+7/zci6LaQ6h50Mhv5BGTCRUgjM14S6yrRU1MHDmFhGG
1aPmMzaMuRJTj862rYDDPoHzFfL7IElFq1GxZOrifBZV83kjawps6DAYuQrotecm
o+m5M1jQcWYg3kpbtPkHIQGVxqnNmCFXKQCJe8yAJJTdLHJk9mibMxF6KTnTm/bm
ez/S67mttp5fTeKAwMdLjado4sTyjgwxKM6SrFHTXcak9aG8jUczScmVace2zYtn
Jzf0LVGqosutbBZv8eyZwJvyZ6CPv0Fkwt1wI+5kgw1/aG18LEM=
=YrZN
-----END PGP SIGNATURE-----

--72Lqpmoi9spjJbkk--

