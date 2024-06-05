Return-Path: <linux-i2c+bounces-3814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA28FD0A8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 16:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668321C23384
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 14:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE102575A;
	Wed,  5 Jun 2024 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J+WOyC1K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED406FB0
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717597122; cv=none; b=oOkWl+ewxdx7pyLTyEkgohOP5RhiNh7PilJM3FYhbBuYIDWaSXyumG/N/JtXfLt/rTl0OdMyEikQ0hTuLXcuMfdlTky4YzXJZiGVw6SZWUoRPX78YmLf9twb17hoq5rpA0RI0s3zSYu/6oRXzermrEQ4/sy94/5mBCrXz/cPfr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717597122; c=relaxed/simple;
	bh=GEig3CCtNoQCO1ekfhkmoL1iRKUsXXT9j4O1uNY3NT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZv4g/0gGMWb0IpBv0DlmJ2SJeutD27UbBDj0bc4Pb4kO6iXoZ7g3ZTLXtqog6vhnE5HxOw/6w8YAJO3PA2xcGJjBU/idTXSpBLUDlVD5dMdKTM89FUy+O/mjyJb5BoNbJFPpdcGLm8v7fyaHpiKg8Vc3qq6MZT4AqBxqGQM2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J+WOyC1K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AQOe
	lOEoaRKWjJTZbiBU6ZQJIrNkC2aKZZR/3vOC9Mg=; b=J+WOyC1KRzJlFR31liXI
	OtytNq6jx2xrlKD2CyxHGQz8AA4H0LKjg/NbyF75l0K8Pgje1x84mczNek1B/0r8
	1AwMIySJEzVafJ7f2AWZfUNazHtTI/7IMnH9cjQ5JNtPKo2802mQBL+eIs0eaUuu
	z+u7YeCAz0Mw5MPKHCM/5YBoqP1F4z+Eg1VzbSVvm9SnqnKEXjaI/HP8UNAA7p8N
	ex28goAswuIsHJwYErSqSWFPD3EoSqIREUhq1UdESO46Jf35WWxv6kaloLgNSkPV
	lgfr5lExn0QtPua7Gf6XXeKb2YmZPjFUmsEbLz9ATKI9rGIMiBe0T+SPMUGof0U4
	+g==
Received: (qmail 2695816 invoked from network); 5 Jun 2024 16:18:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2024 16:18:31 +0200
X-UD-Smtp-Session: l3s3148p1@cMazPSUaeg5tKPMx
Date: Wed, 5 Jun 2024 16:18:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc3
Message-ID: <ckglrvpcemoff55qlhj3naiyclsipujqumincgrxrfr4wlxiyt@ivvgtko2vmvj>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <ZmARnWliAuHLbwOy@shikoro>
 <xa6xj6rpt5uuyxq4psm26qs5ptjn3n2krpdhcevh2kv2tz6eft@4t2undxir6un>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cuxlkvf7ntt2ulxt"
Content-Disposition: inline
In-Reply-To: <xa6xj6rpt5uuyxq4psm26qs5ptjn3n2krpdhcevh2kv2tz6eft@4t2undxir6un>


--cuxlkvf7ntt2ulxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> I have a few fixes more for rc3, though that I'm planning to send
> you tomorrow.

I see. If they are urgent, I will send a second PR. If not so much we
can wait for rc4. But I really wanted to get rid of I2C_CLASS_SPD as
soon as possible before new "users" (copy & pasting code) show up.

Happy hacking,

   Wolfram


--cuxlkvf7ntt2ulxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZgc7MACgkQFA3kzBSg
KbaWsA//VA6o0YQvpdetTAANhIgU3KtY4EU0pajWS6/BFHyYzwLGdM+q7HCU8E2J
9hbopaJpj5rx583JslDN90ERhaurzpdvmxd8UBG5WpuT3xhv3cixIeZl/mVtGZvM
aSvC2/f0O2hsLIikhjExYTu1Gw2T3+KGBsWKW+++qtN2YtD3v+fdhlP2lXvewGE7
tGv2LtoIZdhire3IOx3OEWsSbJOW9tvC7ALVnJSFCOimK5lrFDCfsnQ2kgFZPcrJ
I0qKliQa/Ioop0O2vVmka0+hnKEqFm8Jh5Xxuwow+/WVFCdlKiCZNQNiqWc45/fG
A+ofkfYgPbo+yG+tUqeM2DkW0C29ZEyZQwmgQPeqcWEojWjXN/qtBH9RekZLlkfN
NhyYuPUumnYzyPqr+VwvMxEZargB69zAJuQL/UvyL67E9lfiiCeIPY9XHQDpXNuw
T5xcwgL4T6BzCwnVKlgPu3/k25rO+8+4DPRjsHEe01VvZSRMR795DmekoV1XtJ95
gd/799si6pGvDIkRu2qViuZFuXYpdWQvvIrZ/BYNwVbu+M6v21rIO58phX41SJHi
au6IfCMuhQPHAtuRwct8Bgqx0J4cZHZky3hQe3xDjpd8NtsanFGOx1LbqFNyQdgz
dP2Cjg/kfUHzqhh60ryXgnuc3a9WD8KMk7xHeM31nnz/FkDLE2s=
=VJ1y
-----END PGP SIGNATURE-----

--cuxlkvf7ntt2ulxt--

