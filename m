Return-Path: <linux-i2c+bounces-7994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3C9C8841
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 12:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01BD0B23803
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 10:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E811F77AF;
	Thu, 14 Nov 2024 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cPir3y6O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA331D6DDA
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581152; cv=none; b=bHGRKghGpJ+YdFOJkO58sbtC8QmfgruSYsm/gkmnaGhinci4V23NxvW7wLDWxbRF/g1kbWthADSyU/24Td3/+3E+Ldmj4mXIAlXMOQi0DWYYjFwWsVzb5p1b3XLqVB4ABlAZ7ZWqquFD76U1mV32Bd6nwXnoRhPurt5jy+0ry7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581152; c=relaxed/simple;
	bh=UqXji8DLuh/n+9ZPHIZvmcQZjCFCManzLYVJgmcgByU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Az6PHDUx+vNkwPHXguL5dptDZwh5re5ijYhgOl8ibp5TR/KrGbNyIvKX6ygSAO5NK5VoShrFs75RKXIijVDLXWSFetHpazpL3aSAyiyQ83pOr/5Zv5rAKRQMyKA+GMJkL+1JSncRU3tfz7vjugMcE6Xz90PRZPDA3fTSq45onk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cPir3y6O; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MsaL
	xfjnEA/TYEwSTlVA4NzyE4Mnk31leGIDXgqyOMc=; b=cPir3y6OF9r4PFU7Qw5V
	jJYBfRZSfCeIkghEyUqPGxUNUX7eF5zmfYimn7GES+2tkAtYexkpA7y3dJ497arR
	TmvqqWat0qO/0+Ewwau6CuYaTEbtQkkTcYf5F9n4WaN8p4arpnAfH3gToB7GitWq
	HnMj8+cKFM5xbZ7bX8+UvauyUmJBWKCc7lzQOVEJoc/Csxsl9mwJ60gtRHB6DV7L
	LMlY/jFgAoyn5xYF23LV23QNmI4fWj/7rAqA8vDiVppexxRkUnPR0xe2d7/QGg0H
	ZJrsg1GMoexpG6trNUPSSwlhbK9+rUFfelmIOc9hvFMJnzHC2YwM1OV2LO5/ScmK
	iA==
Received: (qmail 3126172 invoked from network); 14 Nov 2024 11:45:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2024 11:45:46 +0100
X-UD-Smtp-Session: l3s3148p1@A/wZJ90m7rJehhtH
Date: Thu, 14 Nov 2024 11:45:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Igor Pylypiv <ipylypiv@google.com>
Cc: Jean Delvare <jdelvare@suse.de>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: dev: Fix memory leak when underlying adapter
 does not support I2C
Message-ID: <ZzXU2YSK56C8bqp4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Igor Pylypiv <ipylypiv@google.com>, Jean Delvare <jdelvare@suse.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20241108001542.255155-1-ipylypiv@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U1oT9AxPTg5ss/I7"
Content-Disposition: inline
In-Reply-To: <20241108001542.255155-1-ipylypiv@google.com>


--U1oT9AxPTg5ss/I7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 12:15:42AM +0000, Igor Pylypiv wrote:
> Early return in i2cdev_ioctl_rdwr() failed to free the memory allocated
> by the caller. Move freeing the memory to the function where it has been
> allocated to prevent similar leaks in the future.
>=20
> Fixes: 97ca843f6ad3 ("i2c: dev: Check for I2C_FUNC_I2C before calling i2c=
_transfer")
> Signed-off-by: Igor Pylypiv <ipylypiv@google.com>

Applied to for-next, thanks!

> +	if (data_ptrs =3D=3D NULL)

I changed this to '!data_ptrs' while here because most of the file does
it like this. And checkpatch and I prefer it, too.


--U1oT9AxPTg5ss/I7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc11NUACgkQFA3kzBSg
KbauihAAmvGka+kv120xNlyx5V3p/3GfjOtBdgr3EtvLPt0YStE65YOWYLgn0xck
FoLuenX6FsL61UEuTjWnrZqibHddkLWvx8YlUVF0/QO+8P88fwguPjaq5sEeLiCn
MzrLLT6ef6AyYxQHvaUO10B6DQIb7Yjc9QFL997o+T/eUeYC8qzPgIDVFVNW6Fbr
5GYQf2OMeWwA7qiKZYO1Djk434yNMd1EFp3XNZK9NtnsZEpoyiW8UE8eXLX9DPkp
WxLZ/yuddfKduVaPk/AmiyIfVCvJEZHM1/l3BZHo55CnkwD6D7MCdcFfNIXxN1Lc
GvQLftTbk+GGYmpavh7PLlmAlUub5XVyskEAXsYLKUimf5ZPkcb4/83ZINbtHOA7
cFUNeBL8F8DSh/mRxiVjwuGkHQvjBg631Em/cM3MGK/MYtv7Mz0WTL4WoDfb2WZO
HNY2ZgwZCGgdCUJe2Bo1iFzsMREl2bTpsr3pgfP66eEqRoPFyzFU6r3BFHT6Ndgx
tJnpmVzO5dS+qqibz4XV/xQKdUgQAE+9LPXg6ZG4uJXKnZ7tVan07w++SNIjHssA
uKwkT7ffllKXj8CB6xkEDNouKqWitVh5IYNXZ8+DkSYGzneScMie/gynGZLQcu+B
+ZQj2JosSsD423KwQLTZD5Hte3gbYYjddD/vb+ZWA2xM38gXDG0=
=LKzC
-----END PGP SIGNATURE-----

--U1oT9AxPTg5ss/I7--

