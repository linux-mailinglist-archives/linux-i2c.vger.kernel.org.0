Return-Path: <linux-i2c+bounces-15150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FBD1D95F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 10:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0345302350F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C543876B1;
	Wed, 14 Jan 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gPUGJx7F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C23803CF
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383312; cv=none; b=VblCG6lAmSI3wwlacR+UcKWq9clue8INTyE5LMn48G9yAOYLdU/NLlFQJLmq4cQa4+2VVYY/4kS8gImooZEFV5PKeVaWPIm0VWqMpU0oQRzQwMHRZnUcIPimYI8MdV3OrMUfqPkGxZkR5edwwxIzE5SVcbbwLVKavohGXwjnp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383312; c=relaxed/simple;
	bh=2vPacHpYMnfR54LllQCxqQpy7/J2KHhBeWvY65hiPho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEHWmRRwRF1t2iGCXM1CqVKHmjawNrv4/Odo96jj4cy1THtscq0qw7b/ue+wauD4gLYICpYPMx23YJYKCsp46R5mSGkO0x7gzc3rQWLeztgYDWVNrruFPoMvfhvSWWRETdiZJyE55nagQFjYbxJ3mIqi9z92YvO3gHx0kaiiDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gPUGJx7F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R7rt
	HOgU7ZjoLQrdMm2TvqWYN5h2Pmk/L/n1E1vlqmU=; b=gPUGJx7F66WvwG69Bl1X
	+ePm+u0vHDWIM6SHodlWLY3WQZWOZORnK/+Nttnc5JI+Z+DygO3uAezuNiQB9F9B
	Q4PA9VAmtgbElBNzQRL5Y7nN4r6O16N4HSAQ0iVhhFHOEx2hlsGSaj5sgkzw3vHH
	4nDN96/9jASL4JlZl5RZOWyz0ODgpI15MFcysoI0zDCNBEBwtFKHXnD07oZA2fIK
	W8+k1L0TNDFXk5g/BdqzEuvdIbsGzbhCWhsZEHqrYun7SmYtSmlyCS5bYY3a49c9
	Uu2k2JbnrAz4JfvbaTkl9/307HHSH9sDaxZEFULqM1NQjyuIfQFrp90+yTEtU/x0
	pw==
Received: (qmail 2063523 invoked from network); 14 Jan 2026 10:34:59 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 10:34:59 +0100
X-UD-Smtp-Session: l3s3148p1@cOlm0lVIPJEujnsM
Date: Wed, 14 Jan 2026 10:34:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
Message-ID: <aWdjQ1mubxk3m0JY@ninjato>
References: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
 <aWZCT0JQfvX1LAMC@ninjato>
 <f428f437-80ec-4587-9f6a-7508a8153e79@lunn.ch>
 <5c535725c5e4761e6f16ff4016affe8ddcc79d88.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F2xeV0/mYIOnPv8a"
Content-Disposition: inline
In-Reply-To: <5c535725c5e4761e6f16ff4016affe8ddcc79d88.camel@ew.tq-group.com>


--F2xeV0/mYIOnPv8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthias,

> This code does not have interrupts disabled, we could not fall back from
> read_poll_timeout_atomic() to read_poll_timeout() otherwise.

Yes, that's what I thought as well.

> that a sleeping wait would make it more likely for a switch to a different task
> to happen after every byte, negatively impacting I2C performance; this is not
> something I have verified however.

Quite some prominent controller drivers use readX_poll_timeout(), so it
really seems there is no huge penalty in practice. Especially not with
cores so fast these days that tasks can be served even in 100us.

> It is spinning for 1ms because that's what the old code did (which only spun
> without fallback to sleeping).

I understand. Yet, I think the spinning is legacy behaviour and I would
prefer plain readX_poll_timeout(). Unless there is something I
overlooked. Makes the code simpler and easier to maintain.

Thanks and happy hacking,

   Wolfram


--F2xeV0/mYIOnPv8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnYz8ACgkQFA3kzBSg
KbaEKg/+NDoMeg1qZgg/7HXZ6AyZ7+baCa9O85W9Pt2hMxV3GIo+mKJkn1nyR8Uy
8klB9UN7oKmJap8GbxbS+qamYPYn4SWofaxoD2ZBhZRXWjzlIFWWIol/hKvWBnzb
pCunyYM0zKSg6nt/BhErvOJYDoA+2Qi7Fr+mkihQTCCiDu1zwbytcuajIgZJBmme
iCVmUR03vtWXJoTT3xDALPqUzWsK6mF2rb+Hpg1CA9/XPl75RKgmpWQJl47gPxxy
hjfnvahn6I1tlUx2I8LuJi3X3yVsKZEx9V72oM7m5DHEHh3PVIAdc1zl/CgrPSuB
83Ar1XNDVwGLZ5BaM9WRm1UGwObDzSP+8snEm4H2jUOBQgPvdZ4Hk+IvgA1JiErg
51o3mYY1bo6mAeMdER/3faVuOEWwfkNnlUZWVY2PBzi+5AUKSIuaJykptn8eafOF
tFz2ntz5PRSKwi8/e0lyGrdASF3yBMKshxygjstdn1G1qPaJusDLSXkTb/NE0iUb
35rkVROKT3RxscaCxinB0TcVIEMJWPW5tupDbYMtIPokNoiarFI9etS7I2jJu3Fe
RWgMjD3N4SaDAMDbDsD3+Nb02Ty+FHWgf/EeqzJWObzpH1XLHVicelj6UIAo/0Sk
RWP8yWic6x31QI5WYEpKY14tpGdy69xb7dW0pQeocydeqHz7qS0=
=P7Qe
-----END PGP SIGNATURE-----

--F2xeV0/mYIOnPv8a--

