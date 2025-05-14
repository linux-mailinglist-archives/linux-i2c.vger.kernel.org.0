Return-Path: <linux-i2c+bounces-10987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC4AB6EDD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 17:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78F271BA34F6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 15:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9069A1C3BE2;
	Wed, 14 May 2025 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L5vMmYL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD11CCB40
	for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235169; cv=none; b=nzT8L2eKhWniSNqfHgJ7ABEDH6xgG0iBrwiPRt2vF5fGEGxYHTgK8C0dlD7KkGfGXUA15ypmHZFsy32rAvkHp35+2EB7+uRRs/7teXTBmeRDkwxltiTpSBjR+2RJpblscbLZw5TIA2piQKPAmrT24RCJWf5Av68Ua3jRNFElvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235169; c=relaxed/simple;
	bh=fjyMK3Ik4p5smQfx0a/O5B6QIXMbgwHJdG83wA9f8cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hc+N/aGlb/yBJ01W3g22VfJcWigPmRFoQalN9k61IF2kAivdinE9nPS2vp077hyxvAz7k3A1o2AepCvoz7rUMAWhFbivSofa+ST2tvG9zHv6KCjVP96XecvfYKqh5vuFEmnoH41PHgcIbd82v/iEU1nCwRGvfkblCafpr3mgI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L5vMmYL4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fjyM
	K3Ik4p5smQfx0a/O5B6QIXMbgwHJdG83wA9f8cU=; b=L5vMmYL4NM56quje8RDz
	g0PHRZiXgQxqN+KbqDlnTb3PXtis3Axds23xxo5QmtbSaUnptEh70k12OFx5Racg
	PwTwgdNz7wKxGswZlucODAQgF7PkeBaIz8uyE19Lq4UWKkK5sq0SCGYRlYBW5gTS
	dDwykvdACLHu1Tp4Fzcq9z3rtQtYLiOJpZt9lkb9ObAN9FP3kqc0xLxN5ZVfgutp
	DpPNADMxlR9oBZsEcVfHLJ1rOqLHfUcFJYSG9Z2S8Wy+8nNcZL9N1p0U8hDwqGVb
	bKystXnXZ0HCJlycjEiHDHKgSRn5Q6Zqbf7nwOFtGyqGe9jjH/uQeCsaMLoNmxpF
	qQ==
Received: (qmail 712433 invoked from network); 14 May 2025 17:05:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 May 2025 17:05:57 +0200
X-UD-Smtp-Session: l3s3148p1@O3jY4hk17NFtKLK8
Date: Wed, 14 May 2025 17:05:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] drivers/i2c: fix a potential null pointer dereference
Message-ID: <aCSxVFMOAg070xHW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20250513123754.3041911-1-ruc_gongyuanjun@163.com>
 <CACRpkdb6-cjyvXornKcVrYSRqJLE3LqtzotwapHwrYGVm4RNDw@mail.gmail.com>
 <D9VS2G7S3T9Q.26QDCDRTC2S11@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c98qNdZvB1kkRDSt"
Content-Disposition: inline
In-Reply-To: <D9VS2G7S3T9Q.26QDCDRTC2S11@bootlin.com>


--c98qNdZvB1kkRDSt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Also including Theo on this, he is the major industrial user of this dr=
iver now.
>=20
> Thanks for the Cc; I agree with your reading of the code and don't see
> the issue.

Likely a false positive from static code analysis.


--c98qNdZvB1kkRDSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgksVQACgkQFA3kzBSg
Kbbq9w/8D2ZSvoyHilOyIH+QxbNOURmRA0hOLykgfcyqih8H8oIC7H9AqX5iU+RK
H9XDaQzkdP6Q+Mf5c4VfpDcgu1vtGCG+lXghhY774Z8MeoveiASBis2rAy4cm5Dj
DAP63k8gCb2+pS+pMTdoegk6RWxBRKsdWhU7TrJTiaB6EGsUEnZbXcmG77RlfZ2B
GwZsGh7ANgSU+jDz+KFtF54ViEcIn1XY+kAvyTAf6nr5Pd4Wmj5onw50IzWfiurV
WjA3FT3I9bwjYkToCr6eEOKHLJoNn841N8l1WodbkgIDxXDGUY7+yEi07SLGQ7WO
hCzONncDly2DKMSt+Yk3i28SG6jjOg+00itIi0VpescccB3oa1M2LbAKaDTPD5wy
oqhb/vHgNIHWixjvuaqGn3Og+cY8c2CCuXASdtsFAVHKwO+XGgbBL69rHXV2G2O+
LshBUL786dCFd2dSCHGuKg7WZPOsTqUJFaGeT/rYT5RfXzrzzwSfRbN+66MqcMd0
NuXYEPpryVEYVVUg9fLvmWFUISFZXPd5cji5bXdUDTQJkJTCeZePW5LSwlNYJF/p
07N3AvvC88HmHLZA6VRfMbB3OGR+lIGBItUNnoCBHN0sr3KpVl/b2kOmPDN6UlAB
k1hwM/l3cCwJYwOzSJTylBpaLRmR16UsVRbNiOB9TeHSN5r3Jls=
=zZ+O
-----END PGP SIGNATURE-----

--c98qNdZvB1kkRDSt--

