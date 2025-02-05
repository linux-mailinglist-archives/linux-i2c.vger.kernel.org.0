Return-Path: <linux-i2c+bounces-9309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24419A28C9A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 829053A2955
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54592146A63;
	Wed,  5 Feb 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BXyluM3z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293B0142E86
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763503; cv=none; b=R/l0/qonxSpR8vqNZZZzzLWCokFDiotv18rFWUVDgUJbXfOg/pAAYTju5EdSf5qaleXX6zAlqya2LtIUKU4Se2UHsnjlLh/iOSblg4cMLhACpnmLf5GFG0WSh/PV+6uGUGiRlQsYcF7bvlCZ8wyMTZtwbjGJ8ufQo7KETpIC9JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763503; c=relaxed/simple;
	bh=GjhbVcvXu7IUz8MQiYjQEHwsXBYmRRZE8XalN9RW9y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0cRqTC29/G87L9NVVjF0e2g+aCMRnEhKG1OpLTFslfisQwQB6dLLn3d2NWlmFtzzDAcRzfH9+xH6SsKUSN70lG9ijXKsM5iha7aHjQofditNa8P0a9aWpl0VYXHGYaefpuphPObR33+WAhsWf9U0VjPvFbEspAhe+gY06Qbz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BXyluM3z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2uYu
	KJZcPI1jg720mecPVz1tK9CPRFULTZX2Eeevk0U=; b=BXyluM3ze+G4YQnotKqp
	JLQKmawngI+HSemXiulWaaDxzpovndV9HZONfRTy7u7GXaEcDKSycfhHb0497Dxd
	KoxTD+gBTQku89MEI25aee91PDhMTIWzVD195Nqixy34R3kY2UTaJJlcnAn8UDPI
	FJj0RyxbeoirzDj5QyWzhH3cXUU1bBw4MLuXDQmvmmW8AuaFrqFLTBmVE9NjhF08
	pt8fBBooU0hxmpChlg7FFZ6tugxFfWKMEkhxocNTQQMOaXgVk+CRYGzCBkdGkDPc
	qnTMFwJvQzvMvKNOqXMGesgGvlgnxd0YYrkcScKYSFCyA1Z7JfuGzBCaOOGcGzqP
	JA==
Received: (qmail 3409781 invoked from network); 5 Feb 2025 14:51:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 14:51:38 +0100
X-UD-Smtp-Session: l3s3148p1@dcCfbGUtnrttK/OC
Date: Wed, 5 Feb 2025 14:51:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC] i2c: Fix deadlock on adapter removal
Message-ID: <Z6Ns6cFACV4sQi8H@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <71a49125-54a7-4705-b54a-a5e7cc54a78b@gmail.com>
 <20250205090737.3b93ab14@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="97iBYWcEShYr0wOf"
Content-Disposition: inline
In-Reply-To: <20250205090737.3b93ab14@bootlin.com>


--97iBYWcEShYr0wOf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

> Cc Luca and Thomas (they are interested in the issue).

Thank you for this interest.

> I tested the patch.
>=20
> The deadlock is no more present but I have this new issue using the exact
> same command as the one I used to detect the deadlock:

As this seems to be a more complicated issue, I sent out reverts for the
original patches now. This removes the stress of finding a solution
soonish. We now have time to find something proper, test it thoroughly,
etc...

I hope you guys will still help Heiner with tests?

Happy hacking,

   Wolfram


--97iBYWcEShYr0wOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmejbOUACgkQFA3kzBSg
KbaLAw/+JcwLmYhednEfmiKxyQPcjMmLDcoJmbPhccq/QKOJvNGcKLTKXpUCeAKn
vhPoTTA8LmPYsxBKzbRFU889Z+Gw5TccGdxO9eqRWgizJguW9r1PIZnvJR3HrDFQ
qethg9IHDtwM3HVIJYrbjwUvq1DRyH3bfaBiWk1ktOw+eoKv+EIzNDL3+ESNhpV0
lvWkvCaZ2LQmYhe7mLgkgCOOjts2tfPhkVDO2XT9X3Ny6TEalIqCsFNnt2hejhoZ
1NaCoxhYMhLdZKAJy/qsG4hB+IJE9qfWxzxRxXF8tEiip8L+6MumKObCXURh4Xna
/nl0KNcKjpkyP8NE+Wl/6JSBkn2Vao9Z2u64U0lsLK1UEGCtTXJetK2pqV+HhjIq
Psd/shlENx2YB+UHFt9PAR2996mmwc27JPnG2dHqVQKVEzRF5GCVdT/pfDbhQxya
hjIdcxpqkufZs3fVaJO6VAs3AZTep3jpYAiragCsuEhVHaf5rO7/7QfJjsL49c1P
b7M13gaMRJTrOAvJ5FopBr1U4IP2M1zZ/Ti9s/AS9i3I+YHbdWEsLGJ4Ob8n0fXC
pJbWgf6CUTIszXa3ntbWqLyI3Hdk5gcmRM3p49rwi6/A34TNiaRWZb3XMY4fnR8Q
nO/7ZFjYx9TJutf6+HYxjTXVs4nscwdGxOP1VFyVRHzULN2Vb2w=
=3SeG
-----END PGP SIGNATURE-----

--97iBYWcEShYr0wOf--

