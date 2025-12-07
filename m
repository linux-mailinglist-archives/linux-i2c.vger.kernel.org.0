Return-Path: <linux-i2c+bounces-14467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C9CAB58F
	for <lists+linux-i2c@lfdr.de>; Sun, 07 Dec 2025 14:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2870E30532B5
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Dec 2025 13:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5C62EB5A1;
	Sun,  7 Dec 2025 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CtJuLWOg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5A2F5307
	for <linux-i2c@vger.kernel.org>; Sun,  7 Dec 2025 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765114910; cv=none; b=W+6aswwfRVWQDRuSkwgO10xl1pUDGGfy6yagBNXFwQgRZ73LC/8DLuyaQqc1Ss7nrBQGxUmUMPe9Ak2JROQaY8ucD4My+9nrJGPbbzqOa5gpkh22xU79NECSyfA3cYcHE6vwlbtEZecnrRhbCXxKX3jaxxo9K2Of0//mW676vmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765114910; c=relaxed/simple;
	bh=mDdNs2hfEH2c18qWweBlk6scjov0/QJQumMNMdkZVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWGb/PRuU/TQfsCYiSzSexO7iUlrzOqrnkPQV3PSvueyJXTSlXrsZ1F5hRiGhHL8oXlb8xaUpznJdXIR8la7v3c+ELlL63HM0j6B02Ek7bLjLmfWky75GemdYQRla51vtw1/33Iw2x5T8iOsfidTRpwO2mCI6+CBu23poMYc/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CtJuLWOg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mDdN
	s2hfEH2c18qWweBlk6scjov0/QJQumMNMdkZVYg=; b=CtJuLWOgjkJix37grBot
	Wb5e2g4NwnfXf6KWa4bhFp3NybkkohP9tT4UL8ot6f1kksKyLuUjDfc2jyOIGKQ8
	Hju8Y4FhIPaz7+4X3JTDZF7Q6RZPFRf+vUHEbvU7fuDVURDgZc0e8Z4sX0F0fbJI
	nVAuEej5cYMxTEqZKhVvbV+7Qf//XwJpi9MkuM+pW6sz2g4IsLfJQNy6Oz9jC8YL
	m4tIEpXxR+Gfiz5e/4N9ttLZQqojbj+5vr7koUiqB8R9pebl40P5CgQcIa5OiNE1
	22EDs+uz2bVJ4Nb152GV7+/16WYXg0v4jDZiHOq+xAsZFerDkI4cPqJsWvdnUiHn
	yQ==
Received: (qmail 2189451 invoked from network); 7 Dec 2025 14:41:37 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Dec 2025 14:41:37 +0100
X-UD-Smtp-Session: l3s3148p1@rMNM1lxFBM8gAQ9wBwAkACQ4Xrn/InjS
Date: Sun, 7 Dec 2025 22:41:34 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: i2c-host for v6.18
Message-ID: <aTWEDvlMo_Mghlim@shikoro>
References: <zzuyemsikzpbntvmgxm2fu7p4vs7uwkawyd5rd732p5ralx2fg@wnqvjg2mi7vu>
 <aTLDJPD-4TLEuRI9@shikoro>
 <5sisddiomyxmkvm744h5luphomyadnenpjk5pf5kemqw7tcok3@qzmbc2cr42vw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XZ731Wa6vAvUl0pY"
Content-Disposition: inline
In-Reply-To: <5sisddiomyxmkvm744h5luphomyadnenpjk5pf5kemqw7tcok3@qzmbc2cr42vw>


--XZ731Wa6vAvUl0pY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Urgs, but this is highly problematic. I can't pull something based on
> > 6.18. Usually, things are based on -rc1 or something early to show Linus
> > that it has been in -next for a while. He won't pull something that is
> > less than 48 hours in public and so won't I.
>=20
> Just a note that I merged the last few patches on Wednesday. So,
> if the 48 hour window applies, we are well within it.

Well, it is not strictly about 48 hours... I just picked the number
because all of the rebased patches were ~2 days old at the time I looked
at them.

> As I mentioned privately, I can split this into two pull requests
> and use the older reference for the earlier patches if that
> helps. To me it feels more like a formality, since those patches
> have already been in -next for a few weeks and were only rebased
> on top of v6.18.

But this is the key point: after rebasing, no one can see how long they
have been in -next. Especially not the person you ask to pull. This
doesn't look trustworthy. If you hadn't rebased, then one can easily see
that most patches have been in -next for weeks. And if then there are
some new patches on top which are simple enough (like adding an ID),
then the whole pull request probably still looks trustworthy.

> But I am happy to do whatever you prefer.

I prefer one pull request using the ref before the 6.18 rebase.


--XZ731Wa6vAvUl0pY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmk1hA4ACgkQFA3kzBSg
KbauWw//VG0Kk7Fd/H9rrs2Yi+4D80cB8hP44TomQJ+BHPVYr12fBj5IJDmN3rNF
kLYIxNxfX4GpWd9+KZvwhW4oxKKURDbGAKCszoPoUHn6pAhFrxwkQbI5LF3w9ZEb
TLPNGf1KCXv2JGdSUB7Gdur2sf8wQ7AFxQsxOpJxgTNz6ih3W9zb82w6TR3aVSx7
sv4hMbxdwtUDIWElNhvfIlFZus/sYK1R1nSApd33VyAylK5Aw2vUN3Kp4W6KwzHA
i8W1suuMW1Y/ek+PGidFPmkAT84GxbruoyK+8LtBTsBLTvpHrt1PZcGLvszjvpJo
wLonfHkJfnfwo2Ok7hqDpKsr64rAJS9USCeS7bIC/p1p9hA0Bq+/zxIXJ3Y7xl1g
VugO6ceM4EdwYXLq2b2fwcmRnkf1QFJoUOwcDT70aSd5x9FI91XAPJzl4Py27TEb
CpXfJuzMP5O9gEsyIuBCTT+UtAQnMuMYFcdwn3XWprawSrtrritsJi/tJXhAMFHk
d2GhTT1E0UL4Hy65Z/Qeyj1vRhIIv9+Bnax4tXN0M1mraVV7Pej5t3Hqdc++tBJL
QGSzFDwcNKWI3C10nsPmCjsjkLVvWC1E4ws6UtgwgMt16t48NnqrXo0x1FVtQj5C
V9edJo+QmAqWFs+VlCDr4p3FcCefpEKEP5rGJepJFyHSpe/aJBY=
=icdt
-----END PGP SIGNATURE-----

--XZ731Wa6vAvUl0pY--

