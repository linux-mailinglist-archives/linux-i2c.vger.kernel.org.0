Return-Path: <linux-i2c+bounces-11132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD1AC265F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 17:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3630CA22ADA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 15:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E3221FF39;
	Fri, 23 May 2025 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="auBHOO8D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918712DCC08
	for <linux-i2c@vger.kernel.org>; Fri, 23 May 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013972; cv=none; b=o6oiJudQkXS3hISFeHYHy/3HqAuclbktgBPBmRr5qUN3QqFRa6IPFdajKVzVmZZMkT1nE+KiwIYsei/FWnG33yGOSlLlvua3jX+Cix6i9jqj8aT3OvPMvXbVcAYKh54AYm1v4enLoHn5i7O/3JTUnuErZCHXHpRgF4gDZCNFess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013972; c=relaxed/simple;
	bh=hr1699hMAImPxPmb8Wn+4S2v7o5AbKwnfpyiwy4paTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bd6rmcT3luUZ90v51oDoXjEzVrlWLhBLDtOMzmD9J3XbAkr1w+Ovz7pkjRhJHDYvoGQ9i49JC8dZDYSUI0av0pMXSxrTfKhcbpnRSxrwxNw8LDW51cYd7GZHIVq6nzKcMDD/Mryy3+5jBIZrvKavqvlfuT7z+3t5f/dtkgpF91k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=auBHOO8D; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=u1eY
	S+/oL0XlIf0uRa2/vEERx6pzn54tTmRtDBzU1fI=; b=auBHOO8D0G3YphGa8qtb
	rDxIl2UtAvpTcsbA0+oeYei6WOsgH17RTp9SBeCtNmnqib/nUdNtcTHFgx8exW5C
	gICT18jt2TU0LU65ZiPOmi/TCy3ZJ0IXaUbuzjEH5ElqNa86Rs0iOowlpWlJsCql
	psTHjqAQ0loSgNRyT9PlV0XPo6cHNesV0LZ2OoK+4uMhfWXtY/SxsRJGsX6lLRGK
	bzhrKx/uM/wGm4a8MJ2ZC+y11f+ThjC/iZwFZ097vGyD65a+6cgkz0XEPEVBOd13
	FD3zi/68XX96bbwgcqBniAfuu/elyJX9JhuKSwlBlak8odvhW0ru4lFQ800JDojY
	Lw==
Received: (qmail 4088439 invoked from network); 23 May 2025 17:26:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 17:26:08 +0200
X-UD-Smtp-Session: l3s3148p1@cyGgN881NjZtKPAL
Date: Fri, 23 May 2025 17:26:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.16
Message-ID: <aDCTj7y2hfj4Y-Y0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <frzddxvvcax5asrhkwaauxdbjqkgdfyoejkmjgozwlcssq7x7e@ra3a7bxvpzgg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jN0MLYxLoV8uSfPn"
Content-Disposition: inline
In-Reply-To: <frzddxvvcax5asrhkwaauxdbjqkgdfyoejkmjgozwlcssq7x7e@ra3a7bxvpzgg>


--jN0MLYxLoV8uSfPn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Here is a relatively small pull request for 6.16. It mainly
> includes cleanups, refactorings, some driver improvements, new
> bindings and just one new driver.

I don't mind having only one new driver - from my side, we have enough
drivers and the IP cores could just be reused forever ;)

> A few patches intended for this merge window arrived in the past
> couple of weeks, but I chose to leave them out for now. If they
> mature and get enough testing, I may send a part 2 pull request
> next week. Perhaps I am being a bit too cautious, but because I
> have experienced a few build issues this release cycle, I want to
> improve the flow and avoid avoidable mistakes.

That is perfectly OK. Just pass the stuff you trust. If it is not there
yet, it has to wait.

> I wish you a great weekend,

Thank you, have a great one, too!

Pulled.

Happy hacking,

   Wolfram


--jN0MLYxLoV8uSfPn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwk4sACgkQFA3kzBSg
KbaLaQ//TubFNjqIkQLuE8fyREM3CspmfqRZf0IWT8JV/v/6iqxli9aMxi5sZCa5
tEWf4C4Fgf4h4z+CncRcwQyQOdVh4yt+Mcmsm9me97e/+Kly6Rjd5v8D9gp0IB3i
2z3LxyN0L3NssQrrl90uS7adyPzAaPBAlxtKP24RgF3hbmzd9eN6qnywTzeqalYs
kGdYbLCfQXAobZkNX2EaFtaoEIGtLbJDC70FUn5wN8uzAwAjRsMkEyUiZPsrNE5S
q57NySAPclWVV5oetbVIf9nZvFxwstuCcAbuPI0GHkqHAyOkEXd3tARru2DuKOWE
kln1y6/Tn25kZbtRzdCqwCQrRhhnClvQpCuzYLspZly5Eoic+R9JO0ajxywLQw/4
H1gfkIk/Dw0qdXXmA1jTxPlioZMhcC6Mq9ECmud8kZpDRtRU+aI12ez6MFkDWUV/
HMIytvGJTQd+K+o1uHX1G/YctoQb4Q3RvOOeX2cerojQLpxxjEcsoBmzONNeZZJ7
xJ6T6+nGNdWQwubHnt1rIcIqxr5zVEn6PbTcq8g/uycmGj81316XUcZWsopPMLoH
QFpiUH2m6nZXpFP4JyW8CaUCFbQ/93Gu6Rp1iEtGdQ+iI1HN5xg0elyneBIFUt2G
LaaqvZTTqQWGgJIadnJBLxFAwIdXkeO2r92VtedWqn7o8/+4WJ8=
=VVFH
-----END PGP SIGNATURE-----

--jN0MLYxLoV8uSfPn--

