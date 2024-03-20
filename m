Return-Path: <linux-i2c+bounces-2438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D64B880D26
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 09:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1733E285143
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 08:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185AC32C60;
	Wed, 20 Mar 2024 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQ3Nv+RW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF16282F7;
	Wed, 20 Mar 2024 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923774; cv=none; b=qBByNMu+BxoF6PyiIO2ROCst4MIKiTSny3QxPeOq4P3VRSkpsNRSyRUUDiYepRuOZaT+4jc0e9B10tJCuIwmY84wgXQjzILoP7rRRZiCgpfm04nMPJNHut8re02OKFZ/BF+yBy/kDOmQ2/S90T6j09anR1Wx/RqxS0H5/1AmYPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923774; c=relaxed/simple;
	bh=BsJ+dxxh982yw2l5lgbwqWd9Y4Ton6lBnFdvfnkwBvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXa0R6hbY6vPbOfQZ39lts4PJ7F5ZqDwaiMN2NO9dAGNYG1cMnxmJ0YoSPhv6vpgnM/zvoHvA1WO7/C1XP7S+sgpiZgVFSiL17gzRR/1UKDkqpn+U6LNIZmfQLb76r1tLQfKAY8N6IC414J3jszJsIXG6jIeP6cbm49HHMGlXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQ3Nv+RW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5013C433C7;
	Wed, 20 Mar 2024 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710923774;
	bh=BsJ+dxxh982yw2l5lgbwqWd9Y4Ton6lBnFdvfnkwBvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQ3Nv+RWH+wQcWwdP6fT/+5NIZEu9mLXSEhaSaJX1c+45aev45euIgFX4LnkC6JP5
	 4oTYGVb8lb8r24JiMD9Oua6rwmLqpz9r9b3bepU1trQiYeta0gpZbQvO9zAuYr7iq4
	 /o8C7EOQE7aTBmDw9JdOEiNwcXGBdu9JvOGJioyytWsXhMYKriMvGy9j2qU+edDQo3
	 MMIh1w1s44ujInkX9MG7ZCKVJGMhbYwsmTcgUKZEAYezSraI7nnmU7Y3Hav7W3RcIf
	 xWIzcWEpfYbdZMq3KRdj3sCFuzxU81cUze0U5Z8w40Y22nScVhF7mDef+Rg3vcMFvH
	 HjsuYvyW7g2tA==
Date: Wed, 20 Mar 2024 09:36:11 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [GIT PULL] i2c-host changes for v6.9 - part 2
Message-ID: <Zfqf--4NRpshpWTz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
References: <xhohtljc7lvguz6inuqgwwzw7b752q3noa3umiqebfraxedco7@3yw2ea2eibjo>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4aMutjG0S9KwZMKL"
Content-Disposition: inline
In-Reply-To: <xhohtljc7lvguz6inuqgwwzw7b752q3noa3umiqebfraxedco7@3yw2ea2eibjo>


--4aMutjG0S9KwZMKL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The following changes since commit 06d0cb6c824c7df736e66060b8c63b0100259d=
3f:
>=20
>   i2c: sprd: Convert to platform remove callback returning void (2024-03-=
08 08:02:47 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-6.9-part2
>=20
> for you to fetch changes up to bb271301b80410592cbe0170b9f6d2f677f68171:
>=20
>   i2c: nomadik: sort includes (2024-03-12 11:50:45 +0100)

Pulled, thanks!


--4aMutjG0S9KwZMKL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6n/sACgkQFA3kzBSg
Kbbqmg//Xxtv7CaIsDLLCtyAhIYA6yQRPo3kSDfrBaPI45QhJfBUUOImSdIu0mmZ
gOzJgPF3opRN+RHrNSbFbj67CieE9ZJsdIQxosmRN0f8lADL+1SkyThIU/RjytB8
shg3pERTkpjIvi62MtZy9CtRS7dd+UIO0V3LCut+ew1E+QzRbFLvebemyxiuVQZc
kTR9MM3a804tPjHbTyrqjpIvUZ0WMsUZTVSqCsaItFYfnVDYkRQ/3xEjioiKswpV
eRUiH5ONmOTLMdFQA7yhfwZm2FQSSCcbYg40dDuTT6Dq7M7CcoOaCHfNMOKWW4n4
/GQbDz1SoCzNQF0LKcKeMm82x0WFQHXNJHtkEn0xZlpmDPQ5Z8UqfOg6EO8ebzrd
7i4qiCsC3uxcrne0KgS9uJaPNn8sXffGUjAXsU2tOaWGuW420fEiDPkx749rtr/F
1TQBG3SH1I6dMc0AmaQmHdJgWPtrACSruklE9mtF0z9lddOvqexcIBJXc+b1CGYe
brMRxDpd9Z3F4aZunHkbTce4ax9icNinuxIhZknSQewGAQSpATjErCEBLhgJX+Hi
0VJXaBYz4279vx+ow7nFQmOoLp/HxGJrcOr+YD3o8H6QeGJipK8p6G5WgqI2mdqs
mwgDv67lDCWgUN61id3sXARrcB87xeC/TR6Zlw/afXSU7a4Jyd0=
=aNVo
-----END PGP SIGNATURE-----

--4aMutjG0S9KwZMKL--

