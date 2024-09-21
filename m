Return-Path: <linux-i2c+bounces-6916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BD97DCDE
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Sep 2024 12:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11C6D1C20AE5
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Sep 2024 10:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A524CB36;
	Sat, 21 Sep 2024 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UL1ooa6q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD451BDDF
	for <linux-i2c@vger.kernel.org>; Sat, 21 Sep 2024 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726915717; cv=none; b=ej2k+z/csD7meo9Lf2m1zje6JQMsUnOVawdx5gJj3YJ4u6MS6yK3apfCZE9a+Wh2sJYolE2/YuWLkvKJDNpiJSEs7oeZwrQue8U4CNqCD+rDp596MFJ7RhqB0EtvSTAQVd7LiANmPYbXtFJYrBaHr4mgqX3LVuKRBH/tyt/azK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726915717; c=relaxed/simple;
	bh=g9kiHrXkqsfI/28vZba8ulLy2ta3fAcyD9NpsM9ZGXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDVJHSOH2VTgueynJPa0Tw9Ejvx0cave9A+TCXiE1aly23PBWtsoqzso9gtr7naBkTOlqU7IlKtAOUgZylkkh5QB1/PQ8vGfKPIZE4GgMvZDCqiO+sjoq2ctTffvDgyO1C02sjBmIiYb5lQiy6ozHESfBHh5/WeLKcwYt1hJCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UL1ooa6q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=P3bv
	kYNnKt6ZkBdvSojIEb4FdcCH6jNXKKsInk9U00E=; b=UL1ooa6qroHiGVwOaTjq
	DMsRWfFs/ZMXjU/DQHVwHEmNcXoC/uSLuCw0jyvplAS7tBbe0nKAhf/EpH1O+pRH
	NRxR2ZIkMKlxwClKd1tz6xwW+9ysiHUzS8HN0O7wn5iZqv786EFDgxjkRugiivtf
	heAgqXBYQyNyb015QB4vhJYORe567JxoJNxvOlRNtKvttOhWn0EpWJWlRQuV2zqn
	Wp89aJy2tiGBpx74hx6+v2l/tPjQmj0unIqxCXKN2E2OhRZ0d6n+uYi2wn5k83WP
	zymeymXAwkg0jZugpVz6VPfloXnfPo+llfiHH7pjVr75VUCjREJ6uslXjR7CIpMP
	Ag==
Received: (qmail 3638682 invoked from network); 21 Sep 2024 12:48:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2024 12:48:24 +0200
X-UD-Smtp-Session: l3s3148p1@gUAX5Z4iwIYgAwDwn0Nz2qARpwvTE8dN
Date: Sat, 21 Sep 2024 12:48:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.12
Message-ID: <Zu6kd12bDlNNGxZj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <ihephcck34arr3hvxj3pjtmk3p4dobyrblhawhsf4wi42h3344@zkelbpeexnbg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5e470Z/EQlzL7dwa"
Content-Disposition: inline
In-Reply-To: <ihephcck34arr3hvxj3pjtmk3p4dobyrblhawhsf4wi42h3344@zkelbpeexnbg>


--5e470Z/EQlzL7dwa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 01:20:01PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> This turned out to be a fairly loaded pull request, covering a
> variety of topics. There are four new platforms added, but the
> bulk of it consists of cleanups and refactors.
>=20
> I didn=E2=80=99t plan to have a second pull request during this merge
> window. Everything that was submitted is included in this one.
>=20
> Wishing you a great weekend and a fantastic conference week,
> which I=E2=80=99m sorry to miss!
>=20
> Andi
>=20
> The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b=
63:
>=20
>   Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-6.12
>=20
> for you to fetch changes up to f56f4ba2fc1dbefd3242946f2fad35338a60e3bc:
>=20
>   i2c: designware: Use pci_get_drvdata() (2024-09-11 12:52:46 +0200)

Thanks, pulled!


--5e470Z/EQlzL7dwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbupHIACgkQFA3kzBSg
KbaQPRAAll8ZCqWdTbc5W7PgMalyxIAEeeZ37hraYLsElpZpCnbg9E48eVlgtroi
15a50xdMOGlon91Yea3oZ3XZTNFmHhg/prypHXoR3PLZvosP0CF8/96PZNkzXfng
pE02aObW40R5Gp+lnUvy2Dh6e8dBscRIVyAsFM2kWDIQYwqLMzVYVBWxiN/15IaM
QmScryHLK+quvCrodVveRlrwZimN8tA+Gy6IS5AvjCVbpvz8ZlYfybQ99lqXhpmT
ZwNa3KLSi4L4pUFyX8aN7toB8K7g1KJNjEStj61ADOK1kDpxA6jJ7+8tGOpzgwNv
CS/ufLgqZ609sRvq6Cg/6QO+eGwkPxa+WasgmwMLPYoQbSkipLpblQpIRGjMZIZm
RJIW0TVJmSsvq13rfwf+EwqnoaRhe1atTclrWyvdyxtWd/mDlKD6ClE6060LSOxx
3GcWoYsKjfx6ahtRIunmwOjEw1wg4oVpaXEVBNu99Bqc7zLconS/AqJldJFNcdiI
d+L4yqRDanWx2drtrZzAP6z4QOH54w+FcMsy9YxfmRnX5sSVtR1dFC2FaU0IzmbS
1cgnqJ4ZXN7vQwU0uZ0b3kqRTVYzAE3OOBM9QGodIW3dDGb/vjSL32Rjpq962yMX
+3j7adruq3xrbYuQ/7KYbiaT/qumo6MbpOVNT4QzCOyIV2I/FSM=
=VUJp
-----END PGP SIGNATURE-----

--5e470Z/EQlzL7dwa--

