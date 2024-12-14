Return-Path: <linux-i2c+bounces-8504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FFE9F1DA7
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 10:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0065A16867A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 09:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6630981720;
	Sat, 14 Dec 2024 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RhE1Xmo5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1E42A92
	for <linux-i2c@vger.kernel.org>; Sat, 14 Dec 2024 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734167014; cv=none; b=LqKSIM/RZloMLfVpt7h/E+W8MnaBi/+MdGLuNfAKRwv89PpFgCkHMg/LfxcHawiNFdgMETonVSoK4r4WxEu2VrbEV64gFO5cg8l9lT1FtqucOmn629dPiCXaFzKS1alY+ITG0GAayxqkJsE218p/lb73A7XK2TZPepkOvIaQrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734167014; c=relaxed/simple;
	bh=sj9HMrayUMHTgoGPDL2h+BYum5j5UdQa3R2Nv8KNGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrsHpza+CpkJ8hfnWsxFSX1Ok/N6MLeU55gegiwmvzNOJiJROq3q6zmTdH+DBz93Ovs2NN3zWIHqlMadK9WKIQdeZ2aIvdpXCUhfOadGH6Qrc8aLmAxN+/f5bWKr7y7wQlPAYHbHT2SZwwpSzndm+ZcLbua8ZGZry4ZaDGW3kkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RhE1Xmo5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gRp7
	uckktr6KR9/CC8Oa/hiD3So3uJLaZVYSElvE71w=; b=RhE1Xmo52Omc/aN/Fx7L
	jTIuDx/RS0VMzyELVEaxsV/pdql7AfP5a8oDbFx3Vudu99wsEfTNykiN9Z1DFbK6
	knWUmFmbOWLSNDciie+GGhAJf9bHBMUDtPKA6ByE+g5TC9O61B+YpeyuoLpla3EU
	3oZn5edXjjBlSFAD9aoAHBuQ6Joqyru3Zeix0sa/BuxK9iRKQxIXxKlrmduK/Del
	im/46j99B20mKv5YGD3/0zTWmjM0+g5FfRIynA4vDFZTTz+CK7DY+OhsKc/qUoE9
	gfC02e0OlqAovaEmn7SyYx2Ypx9cWr9FV4a8BPWkIskDt2YHcnbnsLttiSMt/e54
	WQ==
Received: (qmail 3038578 invoked from network); 14 Dec 2024 10:03:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2024 10:03:30 +0100
X-UD-Smtp-Session: l3s3148p1@f72dODcp/tNehhtJ
Date: Sat, 14 Dec 2024 10:03:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.13-rc3
Message-ID: <Z11J4d9Y2N1Rh7EU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <7bg2ioxxplgmmgna5j7a4e5fipg54wq3l4zaxy3gy4uk6ctmi2@ueniip4pkhx5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dMTlckdzwkUf53KU"
Content-Disposition: inline
In-Reply-To: <7bg2ioxxplgmmgna5j7a4e5fipg54wq3l4zaxy3gy4uk6ctmi2@ueniip4pkhx5>


--dMTlckdzwkUf53KU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 05:23:05PM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> three fixes for this week; please find the pull request below.
>=20
> Have a good weekend!
>=20
> Andi
>=20
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dc=
a4:
>=20
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.13-rc3
>=20
> for you to fetch changes up to de6b43798d9043a7c749a0428dbb02d5fff156e5:
>=20
>   i2c: riic: Always round-up when calculating bus period (2024-12-12 12:5=
4:02 +0100)

Thanks, pulled!


--dMTlckdzwkUf53KU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmddSd4ACgkQFA3kzBSg
KbYRjw//TMpZcnpl2vjjNeg984df2SgeP9lTcS0Qd9T1hdR+1ZO0As2IKgcwszwZ
inO3vQDkE2sBvuJHE1YQ2Vgi4pjbcdt226Z1oKGEG4lHdd3zplQ4zfdd8XB40hXF
X+Agilt7slR4oAGkO+9UT5j6kSzzodGB6BMZFDrSNDT0Im+cBFlhkPjpFZC4PU3I
29VgMu0gX43c9D6GOdV2mE1BX2QmZsf9uh60q4FfWSfUHHLRNzFULQmJWjIN8pdt
y+O7ezNitQY1OXToy5NoiOCaF2mTbwUbjc2qcGAbwVwzRCwnOwG89jq3AJy754On
3r6+Jci4967RAbo1LN6kxbfvvmIqKwbwl4ZDP350JC3cf4IC2h3UCcTJsyZkTtxk
T4yKuB53RM3Qg8mbr/3FLMe1isYBZtUkZqUBPQImlI0oAJlg3M5CqmjSbO/8XWYu
dheob7mBdvrKjg3oQ+e5SdwDdBDeS49VlVw9G1VljUJJOA3I+SMtaPhPYs/4i1hX
vIBpJg9Sdw3Qon8x9tExTW6NlPhwrI1Tst3FJELlah3dpFRmSTDN1AuvCmAk+JmE
OAnHVw2p/4AIh8c5nskGHjXuYjbaR4XTgp02rFi0UGtMFi/mnL6z/HjQ1cTRUA8P
BGRp0jeEcmgVRHGSQNvWYN0HIXKF+HEMcYA9FuePUOiLBdVtacs=
=F9NX
-----END PGP SIGNATURE-----

--dMTlckdzwkUf53KU--

