Return-Path: <linux-i2c+bounces-14202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B518C76916
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 00:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 450C74E3FBD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 23:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB5D28850D;
	Thu, 20 Nov 2025 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="buEp3LHP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D22737E7
	for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 23:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763679641; cv=none; b=g+b/aLWyVvomIZOmJTspDr51Ix8RPw+yvRwYu9o+Lt6tM+xUCcr1TgJERHV3oPFz6HMjctRoaddbimerls2sr8KR104oIzMra3iTUKGEdXF2LNmFbjWAX6p0NDpqZT4FnmPu1v9Ibu0B9n+OkIXz7Rjj3USuiKJnnZX8oMjJ4+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763679641; c=relaxed/simple;
	bh=x3xVXuI+2BBfRuLXgxY04+hT+VL9KilsXIFqjrkoA8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhTrEj9FXSGiOtp2Wnfg7zWjuKtLv8qitpx/Be8eVx+yL3s3w5KvJgwcPoBKPYuGK+x1+Ro2g1u/c3T98EHp0DWZcAx7zAfvImlL+vH0Fpen9EgMywb+qpV16HGd3k1XdSIIPmT6nVDPicu8jgfsweWjs+AnPEE0t5K47vwXzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=buEp3LHP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x3xV
	XuI+2BBfRuLXgxY04+hT+VL9KilsXIFqjrkoA8Y=; b=buEp3LHPj6bREvtMS/ZP
	JGB4o7WX79eVI37FT/95plauGcjs3m89fiVzA3uLCwCyq21892h1gURsp38m6xef
	JGpPsVLsu3maHGdR4o4ibY4/mQ43Q/rX1WYsLhICATzR7O3YwvEU1lYkr9Q9SnjH
	5YK6MshrjY9G1KcGHyBKmNXqGdfqHVBBGn8L4eA2uym3tXq6CamPZERtn1VY6xBG
	+rsRXdL7LvpIUbBxjvCBLo7Il+MZ0HXW77e6disJYNSamkFfhpgPGZdnAPyiSx14
	yV1PG5aKfS7nXReNuZibaAvUEJPPYQTkV5d7xOY3zrzQPfNTqrVjkFcDBGRsTdwc
	fA==
Received: (qmail 548280 invoked from network); 21 Nov 2025 00:00:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Nov 2025 00:00:35 +0100
X-UD-Smtp-Session: l3s3148p1@6wMmqg5EDOIujnvV
Date: Fri, 21 Nov 2025 00:00:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: lm75 on i2c-elektor.c
Message-ID: <aR-dktlDxOem6mOX@shikoro>
References: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
 <aR-U3kr-IyXlgYdV@shikoro>
 <CA+=Fv5QbDy_2G3KiXF=asX2+61BWMWE70tz3nr9XE8_KhwRNmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyDh4dNlM8wQ3rFO"
Content-Disposition: inline
In-Reply-To: <CA+=Fv5QbDy_2G3KiXF=asX2+61BWMWE70tz3nr9XE8_KhwRNmg@mail.gmail.com>


--uyDh4dNlM8wQ3rFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've been running it for a day or so on my UP2000+ Alpha with an SMP
> kernel and haven't seen any issues (I manually removed the
> BROKEN_ON_SMP from Kconfig). I guess I can keep testing it for a
> while and if everything seems fine I can submit a patch to remove the
> BROKEN_ON_SMP?

Yes. If possible, stress-test I2C communication a bit. But with the
spinlocks, I am optimistic anyhow.


--uyDh4dNlM8wQ3rFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkfnYoACgkQFA3kzBSg
KbbbgQ//a/mOshETZDmezEsCuEL0AOUfgJ+n7oQ30wVEUz716S1AHYIz1F38dE40
cXpsTYu0ftSJ79JCuNF4UwJMiZ0LcWguCCHlG5FSZJnP7F14Y6i+3iNVfBl9B8/V
ebKi71pytxASqhq8nOCkT+6plMGAjDze5gRvLi5Bg5QGxTNVqBYiNta2l5G7VNyv
La6j2GiQIxIjH+sjsjSMKwM42WaX1gm3MwRPnn+YYuIjWutfNuVGrsLWBml6OIJ2
kCrnbosQj+KcFD07a/N52/s5x4XRYbFEUTxzxDxFy78Mf/fRk0w/4jXjj9RCDAm2
xetPKL0y6lySVAKSK7VXfBJ1pMBImYusZ31uaq243bZxcavL0BzhMsB+cU0Er4yr
3e8jDEETs9baC5PR7jSZo2/7sKgn8l5L49HU7N4Vexj7G28S5pAFsn53VmHpgx/s
iDzBs7wKbyW2jCyfT96DXnCG2kuNdhQy5noFFr4+kYNLTm8A8JcG3ghVPplrBCSn
L257Yt/LqMKNA9endB2uA7mSfAJVM6jZc4dKD7ClYCqQGwE2QjHwFfTjgaOBV8KO
3qeDM4xohOSTesgIb+CDG7kimpjPHnslgsxOmB6XERktHSE+0sQlqk/hRgwLDG2c
BV4H+ijY56+j5YHxOYMUshuWnHzPqVKbUP9uJLdId7oWbW1R4nU=
=HJQb
-----END PGP SIGNATURE-----

--uyDh4dNlM8wQ3rFO--

