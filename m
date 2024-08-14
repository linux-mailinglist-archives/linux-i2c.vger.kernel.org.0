Return-Path: <linux-i2c+bounces-5397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B359521C7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82E51F21D48
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BB01BBBDC;
	Wed, 14 Aug 2024 18:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="frb8haZL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E311B373D
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658636; cv=none; b=gQ9iWqemvpuVaBkwrw1tZ/E8Sf3e2euU6mO/DASG3L8mBUzZM2hFm2xV+mswfVEFb6sQ+AZRjXy+spx/51n1kD7PCksG3zXaqRx5Gt/gab5f7pbVNShym4h7Dcsgq3cUhT34DfvQcx0KrnB4pgBbHi6QRffBblPtVurEsa4XmpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658636; c=relaxed/simple;
	bh=lMIkfTxyOcUhAokPxb6VyFUM3OhXSMsVs8PptssC7wI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3j+wnJOPAGoV2NkBUcNvtrCpUn/8YA1RlHvGUv6ca1KfDcNfy/SgochjGNTydObsh05XeoF63OlsQutgUWH3De0YnrzCPr4AUlT1dhcmumxvaU2uVE5njSu3X/PUhBwq1lYmRg1gFZTOAyQ/10H+5I9TlDboD+qB+VIimSKtC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=frb8haZL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lMIk
	fTxyOcUhAokPxb6VyFUM3OhXSMsVs8PptssC7wI=; b=frb8haZLjcHySb7JCzPW
	LNCB1QrXDoYqahpoSfiIpQBmsPFpDHISpxQ4TOj7URAzsqNa8Octibcf4mMFdOs6
	3IxL+CiTNm7BXcm8ex0CWhK2wy2gXnTYhx+3SWy0+xpPmzYHBXvEBsyVcgXK9YXt
	53DnMsEhDo/WTvek20acNzCBAIYJhphoUbV8uta8t5mllN20SRFgLxqPv63l7uqp
	hahFwV5wPaYmRgKE/IDt0m7dDJqJ9iJfwBL9kTci+sKjXKKGxuN138GPzmaQvqrO
	CGQfL43JIoI/yXd5hbJX4gHaWJPCuDUIWz/3uwMtuuQTJv/Eco2PJ27o2zwXJN2X
	LA==
Received: (qmail 2061633 invoked from network); 14 Aug 2024 20:03:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:03:51 +0200
X-UD-Smtp-Session: l3s3148p1@eyR0jKgfhqMgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 20:03:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools 1/2] i2cget: printing help is not an error
Message-ID: <Zrzxh4f-jQDIegtg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
References: <20240811093411.5694-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gO10OcM7OC/J44hn"
Content-Disposition: inline
In-Reply-To: <20240811093411.5694-1-wsa+renesas@sang-engineering.com>


--gO10OcM7OC/J44hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:34:10AM +0200, Wolfram Sang wrote:
> The check distinguishing the 'h' and '?' parameters is dead code. Found
> by cppcheck:
>=20
> i2cget.c:193:4: warning: Statements following noreturn function 'help()' =
will never be executed. [unreachableCode]
>=20
> Add a parameter to help saying how it should exit. Remove a forward
> declaration while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Pushed to master.


--gO10OcM7OC/J44hn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88YcACgkQFA3kzBSg
KbahOA//Xu+oN+ftsE0ZVjEUYHO2mq39xsa9m+sFYbINZKbwDVbqpBJClMCjq/Wx
0EkmKshKZj3QdexjkoOW6Fvc5mWD8MVovTxSc/5TFGWL9bu8+LlGQIgv61UEiZb1
kR8595reF7F5QUE3MajHpOGjJezyWlFr9OFDLoJ7+jmehd7kIX7tW5y45Roc2dbY
Sz0gYkkH50ErgXQwrUGN6zH4DkYDKj612vyDRYj1TucC0/Mwixtr95adjd71+z1w
HHHkPKL3LAG16bgTnNhGhUjUnGCQFZJsphGHJ28jw2Ifqoww8E9KFQHSBBKlIWJ2
JiC2vUg6drHM3j0IPA3KNxpV6+j6JNwWrTgN9+UKs1n4QEHd1qsbU1sntETR2SVm
V8MgIYGSZp1HusM2VXS1A6XJbZfu7ZYlt4wefnUF2ugFWuDkZ6/xGT5y9C0wKAAj
JDYby5xV44MyM1DI3tBqErMi4zSlP3B8BvhVGOaFGDS9fuAy3ka8hV5w9d32Lr6B
utPu3ybgxOVTb7wVCyR8Anp6VEpiRIA0urIL9vHIFNWltZCi9KFj/jPKg08FGu9Y
vSPZI8c6xf2GPlfQUy0gwKvKd+LbLJo708Lyx+ar6hmMpuWAr6NQ4ZJX8T/akx/g
8Uzv4Vi2AornBIwftJiegpz3aR2GljYlJ1kd389Q/obZd6k+2K8=
=RxeM
-----END PGP SIGNATURE-----

--gO10OcM7OC/J44hn--

