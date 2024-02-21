Return-Path: <linux-i2c+bounces-1889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF785D7FB
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521BC1C22710
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DA36996B;
	Wed, 21 Feb 2024 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6af4X2r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C469964
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519074; cv=none; b=HvkfEjsoaXKFOyyl9pVWS99PzLELTySk+uRbABFlfmJFQdnzTVTGJPFcgsOa0ZZknUKDMgBhJr7UjD7DrbF9bIqb7cLv+X+eJb1R4s4K7JpqB9ylTZsZcNiYhA/zMpOLPqSn7OCaiCZa2gaB0IDU1XHs0Ma5JqLGtE1fDkYv8ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519074; c=relaxed/simple;
	bh=0jP66+NHQTiXegThjC6nriiaDrt5wl0/zddnAu7rOZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HySl4iI03TfhlgJn9wkstSyjH1avl8YjcjbcWFhSuEHKNMHa+f1ZtgrIuGXKjHVbKbcgckVeKoiMsyH0aClZkhSHlwUuSk3PSOhYPwguG46q2IzrKjx33ChmlaRWzSlU6I3Tp8MvFgoODg7vYWW6X4YKPP7D2qSRUWBcZiKMVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6af4X2r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DF9C433C7;
	Wed, 21 Feb 2024 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708519073;
	bh=0jP66+NHQTiXegThjC6nriiaDrt5wl0/zddnAu7rOZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6af4X2rPlepPa0yg9NnUKhhEpJJVyXHQgGQk0vO71iXIZb48Y2AeELip3lZomOda
	 kmvKopSIdMnlEmq8dOQfi6m0Pvv1dj9XwEEjesym67ci1oWg2d3Vxd7C9wMqg21g0b
	 eRaC7kvTJ40h7z3lz0/9P6fHKfrqSwE5hrAQJoJfJjGD33l/O/ZqFaafLApxApJNz7
	 +rIOGmvH0F3MSWNc+hoMWj+KwtO1fz2XiGalKwgdzHGyNZdpjEhAka+yNbCHA+e19G
	 msd5/yx6MWJbV3zFlJYVMJjV+cd3zkMnZGYraj602vMB57G0Cs4rLYVtY0SkmBevOa
	 RLINGPlMU4oDg==
Date: Wed, 21 Feb 2024 13:37:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <ZdXunlc5KQ5JlCA7@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lFD+1A81FGqaegq7"
Content-Disposition: inline
In-Reply-To: <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>


--lFD+1A81FGqaegq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 05, 2024 at 03:51:47PM +0800, Hans Hu wrote:
> v6->v7:
> 	1. some dirty patches were removed
> 	2. rename structure member 'to/ti' to 't1/t2'
> 	   to make it easier to understand.
> 	3. add a comment about arbitration.
> 	Link: https://lore.kernel.org/all/b0f284621b6763c32133d39be83f05f1184b36=
35.1703830854.git.hanshu-oc@zhaoxin.com/
>=20
> During each byte access, the host performs clock stretching.
> In this case, the thread may be interrupted by preemption,
> resulting in a long stretching time.
>=20
> However, some touchpad can only tolerate host clock stretching
> of no more than 200 ms. We reduce the impact of this through
> a retransmission mechanism.
>=20
> Since __i2c_lock_bus_helper() is used to ensure that the
> current access will not be interrupted by the other access,
> We don't need to worry about arbitration anymore.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Uh oh, NACK. We shouldn't limit clock stretching because some touchpad
controllers can't handle it.

The first thing I suggest is to move more handling to the interrupt
context, like filling the next byte after the previous has been
processed. Then, you are not interruptible anymore.

If this all fails, we need to determine a bus specific property, but I
am quite sure the above conversion will be enough.

Maybe it is an idea to first get the driver converted to support your
platform, and afterwards the conversion to more handling in interrupt.

Kind regards,

   Wolfram


--lFD+1A81FGqaegq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXV7p4ACgkQFA3kzBSg
KbZkXQ//T6mnCijUk00Hud/CHy1lxNl7oPKAGscpDo27kPnrF6hjlNFcKEIpyjpv
xU2xbabHV5voCmjYRmXvGThDL4k2O8USb8JnENO7B+g0pTGXUbRJ47K/Kb1euRM1
HrcL+topKd89kYYajCt98hb77dF3K9qY6X//DTHjiW7Y0zvYELuAUH5EvrFfctbZ
GK6KQ4iAgAQiS0JWl2SeIhHNARJb4VuAGJRie71Y6DaihuK2PWxalc2ypfEiFIKg
k2T0UtzrD5EpKRxeZdS9kbvNxLxDqEyAZo/zujmoT0G5VOl7oFgnYTmnddZZhGRA
kH+OcOyNmcLtTbKa0JqmNId//In//11CASBps4ke2FqRJo3p2rRbmfzTBt0RSB7m
rhjx5zbeTU+hgLucqRzqqdonxdB+UOJiuHZW3XGHLyVjYedvKEAQaPMCGkrzzQEg
XTdpvgnhVjZH2owuwtVdaFXmYb6Z7L75IlDE8JqpqGGQDqn03OmB12QVXq5p7QkV
UwaDxu3ipLtBmJKcL/r0vpb77HC2lUZIK0i9jM3q3YDFUTKyX0B6JcWjPZgSqOD+
l5i8InRuUPwvVMowbjENu6KxBR2+fHiuEuLCH+QB9lPkmeiaayGPHu0/LpO/Rkiq
n4wR8ca5nWnAJMDPvsC+rRODC9CeANi5dOi+mS3pNDEbMCyVi/s=
=uXtD
-----END PGP SIGNATURE-----

--lFD+1A81FGqaegq7--

