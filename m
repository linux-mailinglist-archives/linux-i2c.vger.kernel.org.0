Return-Path: <linux-i2c+bounces-14457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9709CA76CA
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 12:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA4F3095ABE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 11:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F04329390;
	Fri,  5 Dec 2025 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MLX+UEHg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89902FFFAE
	for <linux-i2c@vger.kernel.org>; Fri,  5 Dec 2025 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934454; cv=none; b=Nz4wG6keTmeyCzR0yk8ItUR4d5c1vOZAvd6uRh4/SaSj2yEh1GWUdYKC21wYLE8wP8bomxByNqV3Y4kBwo9xhqm0J+F1uraWiwa2KG7pBWhhHqpbHKiKlCB9RPk+mA8a3ScRQ3ojDMaZXwcXEGihevcOj6J5W8Q87KiUPD/BB6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934454; c=relaxed/simple;
	bh=sYLE9vX7YLW5uLv6TztiBzQp5HwHQuChB7rW//a4UU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msvmtq0CRoqE8YR9fcjCRhFhXz4xC4aXj9EL3XebOkzz2tjzQdJqCqFLA/s51VvbOiXM+KfePdgQhNj/nXr+dCMKFf495heOdSMEeCliFR2bxKv12AoDI8L6aJjr3aYkub8dn1yVlE3UzDKh27Sylmvsvd/3EQzmSQfvNz/+6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MLX+UEHg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yze3
	YCp0+sBBf56Bnh1eGa/kXUMojVusKYPMxclyawU=; b=MLX+UEHgE2wsqLfg6HIC
	NB5AzJ7FL3gJTwIMLzriDu4Kk1AEC/bEXL3ykWhTBjpPSLIX3PGcysyX/gE8x3HY
	zG4p4hbOMpeq0529L8ZeIIfEhlzPe2jton2Ji3TXcqDBaf4NVDske+/RkUg2f+BU
	L8bQbqcuoBmOhj1J8PwD4kxcwA35F1exN3CK+2YaL/o8lRcQFtUvdQcofhJIHim6
	zApPwG5qQsQyibsWZwbQbHxOZXPy0gtqgtWjeUpnFocJiI5MQC00pKBU7NVKxxSa
	PAesa4HcYEw+hIE0XYV72m9enSkt3PqLe4sBIt4PavbEzzD4B6/iWpBNM1jWX9nH
	Fg==
Received: (qmail 1485678 invoked from network); 5 Dec 2025 12:34:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Dec 2025 12:34:00 +0100
X-UD-Smtp-Session: l3s3148p1@v1M+0jJFoISZ4zxJ
Date: Fri, 5 Dec 2025 20:33:56 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: i2c-host for v6.18
Message-ID: <aTLDJPD-4TLEuRI9@shikoro>
References: <zzuyemsikzpbntvmgxm2fu7p4vs7uwkawyd5rd732p5ralx2fg@wnqvjg2mi7vu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xYX06v+zU457WQoV"
Content-Disposition: inline
In-Reply-To: <zzuyemsikzpbntvmgxm2fu7p4vs7uwkawyd5rd732p5ralx2fg@wnqvjg2mi7vu>


--xYX06v+zU457WQoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> here is the pull request for this cycle. I was hoping it would be
> more substantial, but I ran into a nasty issue with my gpg setup
> that blocked me from pushing to kernel.org for several weeks. The
> kernel.org helpdesk helped me sort it out, but unfortunately a
> bit too late, so this is all I managed to gather in time.

Things happen. Don't worry about this one...

> I am sorry for the disruption. I will set up a backup solution so
> that I can avoid this problem in the future.

Another tree at gitlab maybe?

> The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea4=
49:
>=20
>   Linux 6.18 (2025-11-30 14:42:10 -0800)

Urgs, but this is highly problematic. I can't pull something based on
6.18. Usually, things are based on -rc1 or something early to show Linus
that it has been in -next for a while. He won't pull something that is
less than 48 hours in public and so won't I.

I hope you still have the ref of the branch *before* you rebased to
6.18. Please send a pull request for this old one.

And I am quite sure I said it before: Please *do* *not* rebase branches
you have published which are meant to be consumed! Other people (me!)
depend on their stability and history. In very rare cases, sometimes a
commit needs to be modified or deleted. But the base should really stay
the base. If you need a newer one (also rare), merge it.

Not pulled, sorry.

   Wolfram


--xYX06v+zU457WQoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkywyAACgkQFA3kzBSg
KbbVLRAAjJ2YbR5y7/PuInLtFfS2nmb5N1MsrXOWlaHXTAIgn3hj2UcDxyZi5/Yc
Gvzmbax2WqZN+UxeI85xf7NzWUbp6agO4z2A6f68GstDn8qliBBV+NLUaca03Wow
UNxdfGDxpdz0btJGhICGYYsTrVY3oNR1u2lQT5QovALmmBSXRrgQ8Zla4vFD9WXS
YfNzCjlAE5PMIMNM+GZ+Wj0Rsx4QFBNmbyo2paAXjKlGGYPB99TgA3dw2QVQEyGS
mbc2HQPQ76fF+RBA50pDH2UsBX5ViGLqrVWnvETPIydvJ6mTPhq94JWHcYoVD2D0
IGq8vx8ZPS1uQ6yCJzsx9ltkLPE79HnHUIrKY7tBpFMTTWPvtpO0V7QbYdzoTLre
M8q71VQmwtgPU8UNlQTAfhN3kdUCOhE5f49N7JuhlpoPghFfYujtjlI/bAy6LFZI
fmXguCdOG59Y70akQQjmTyN9iKV8fiY/meqou0LS4+27o66YLIp4jtw+H6eTw/7F
LbgG8ml8Lb+1c/hnuRY30trLk1G8BC1mmcaXUZ6XYg8j+ZpUoZNvtaUAsZjVtZpR
9l+ia0psxVGjyLUcHCLSEUfEeW59aaKhqO9Gihx1LHo7aExzMeAV1UR3bf7ATMHX
gnN8ipesAdcYhFj1B/tfRoU4AYdxf9zXOhiMgDAhthTLuYbI4mo=
=TViW
-----END PGP SIGNATURE-----

--xYX06v+zU457WQoV--

