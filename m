Return-Path: <linux-i2c+bounces-3660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0508CDB41
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 22:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9631C215C8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 20:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B5C84D1D;
	Thu, 23 May 2024 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J6p+jnnQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824F184E02
	for <linux-i2c@vger.kernel.org>; Thu, 23 May 2024 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716495540; cv=none; b=ibtli38vIXuZObi5b4+2BlZk841goINuBEZ7qKjJGlR8lPpQY5+S/544rAyNmahnF0/4D42/oFzSaXBC0s6WJjP7fN9td0OQ0x+hTwJPfTz5Y596RduyeR0HfBSmnusO7W4rGYgjdYLvdQSmTwbAuRTzibOT2kusxnZz2ppERUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716495540; c=relaxed/simple;
	bh=EqX0fwckcV+vODDRFZpFypCtRAExNDQJsFxAVlnHGI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glzP32gVYwORgR8JXRe6eYSHdqM9FJU9Vp/kwlginbZCOPUZ3Q8WG43jUPI1l08zC1zFGtOWDZwnxTndqO3Igo05g5CAkebZVd0FlTa8WYieS36v/4GyMFBWl+MmqEBgUyOj/PasakkgL0cK8GO44Afz8ozXE+5hx46y7DCHuPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J6p+jnnQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EqX0
	fwckcV+vODDRFZpFypCtRAExNDQJsFxAVlnHGI8=; b=J6p+jnnQDHChwUiaypq2
	xg+gUXDmKWKtP2qPG8dolMc9S2qSAyMpTe5PNZr8g280Et1DR8Q+kUmi0gH1qyl6
	FGZ6Fh9g9KqUzotSqYPbqWJPCwk/GJR2PydEYbVczRIyLqyuiNEoSdi3Y8i0XIvV
	DJ4+8oFSc32snttcYv0XIwH3sgEP/ZwYBeqBP+1sr9CgNhmsyL5gVn6BQWLm7wLx
	FD0YUX5SkoOKTTJh0evE/irVw8jYcIY9R4gGzGOz1bFPRTlH9FqbXUTalmvMGYBR
	ghMIwrBiq0hssWdAYPEQkU9ajVPGz6ggFPR/2OFPeHWe0+9HahftMgd5dCUYeqlh
	ZQ==
Received: (qmail 1235559 invoked from network); 23 May 2024 22:18:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2024 22:18:51 +0200
X-UD-Smtp-Session: l3s3148p1@BaZiwiQZwOAujntm
Date: Thu, 23 May 2024 22:18:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host changes for v6.10 - pt. 2
Message-ID: <20240523201850.yl253jum4sqnykji@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <2qtn3bk6pat2xkw7qz34pjpgh6zariuz6zjxhmuuo2jcddfpi4@xn6aqqppl3hi>
 <20240523154820.vza7xbdkgqyyth6w@ninjato>
 <fnznf6fb6vzk72b42lkir3jbopb6cog6mmjjr3f44o5ejmyelj@ehkhoevbn6dr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2krkfc3eoaxxbco"
Content-Disposition: inline
In-Reply-To: <fnznf6fb6vzk72b42lkir3jbopb6cog6mmjjr3f44o5ejmyelj@ehkhoevbn6dr>


--r2krkfc3eoaxxbco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Pulled, but I can't send out to Linus because
> > e22e0e483b2c76728ccd119fdcfea81eb176b3a5 (drm/amd/pm: remove deprecated
> > I2C_CLASS_SPD support from newly added SMU_14_0_2) is not in his tree
> > yet, only in next.
>=20
> argh! Good catch! I don't have drm amd in my config.

Me neither, I just checked with 'git grep I2C_CLASS_SPD' :)

> OK that needs to shift to the 6.11 pull request.

Hmm, that gives too much time for new users to appear IMO. If you don't
mind, I'll take over and I'll ping them to apply the drm patch soonish,
so I can apply the removal. Doesn't matter if it becomes rc2 or rc3.


--r2krkfc3eoaxxbco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZPpKYACgkQFA3kzBSg
KbY2bg/+PjyiD4KkdUfvnFmpqinthqrUIuxD/GrwXC2jZzkujeevg85t6HtA8w76
C64QwmoduyB0s8dG5d5oEypAFiozv44084E0AHZvRQrKc6ijyj3LSmA2gGsVP/qo
Q+mOKulbbfCvGLy0y/w/AV5JyZfLIxtMKtHGDoAK5lcHv+PN9lRujhMvkjmJeLao
+gmszDWpCLJ6PlTymjP6FWqG4wYCD2WqW9dnNAeyLg5eRtPASyqVZgAvPPF7t3z5
JmOx0M1vi5cNcMCrlgI8vDzupLi/rrfVcy+aBIURLMoXJ+UHxsyyAsua1DRi50Kv
TuqGwhpifdm0UMqybQhpWF0zZMPVmTfKTe++yXEl9f8K4ad8KXYzfMUYCXcDil7O
czQuOMXjoa9ft2K6faW4jO8GHCc/YB4u8tuxyQdj0kIp/I1Q6X6Pvlp+UG6tCC8z
JreYz+SdNVAUGaF/LoLlkWHunO/u0He80ghV2kiW++ceTju2+1zMPu9zDGPAC5fl
CINF2qqukq9ndt8RGk4XdAtLgynr3WFrEntViY8hBkw3ZpPZ5hbbBa9UASbtGV6D
e87s6qCimOD3fjLokzAi8MJaRBje6CU8y9q1t0FmUV5PVY9hY7s1XGEqV2UfgLRX
nWG4qEzjPt+AYfmRSzVhqQB2UVFpmcd9+979UUP0C7m4YmnuNsc=
=eWC/
-----END PGP SIGNATURE-----

--r2krkfc3eoaxxbco--

