Return-Path: <linux-i2c+bounces-6796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9397A1FF
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22541C21DCC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D431547F5;
	Mon, 16 Sep 2024 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZK8HU/ap"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A7146A79
	for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488809; cv=none; b=FG71VldDTgKqKxgbn0pmz/4ZcAmeTxDF9Vjicao+9IVYEGvt4I7ESGFNb+pB09r6/KnYtYYZd/Ja/Jvkn/7Ee00UunOF13YdcEqTMo9RpyO5UtiRUkX6WcFe07ItYpVIQwdSXRps4wHTkOu5rlrg/5QFUIpmOZ5ZhR9ojOWo2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488809; c=relaxed/simple;
	bh=PW+k/EhoB4KHPAC0D2TuvOmVmsYZMU5z5lkma8mMlKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF/89qupGNlw6JhD0eJ99Llj9hiJyGHZ7yBYgJMOSmLJW/vprGiqzC1Z7cG35xWcP8XPSpaduRvlaPVL8VJz5ZJmWeyOb1yeRchuBefJvDPCVL3GVW0GB7L/9gn5tdOxOV08KXGPEsXOOcylsqCUSOPOugxBTQV7dLNai347i/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZK8HU/ap; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tN4V
	8kNamZBvSzpo5S5GQJ8I08C4kVv5wj8MjmDqelc=; b=ZK8HU/apCeZ8O4C+qm2B
	qmAO1PA0St1HpMLZ0eMMqvvJvi7JIfbTZVOZ+z8qJFvTNCvTBJzXI7KabyvMan2Z
	dLaDW37DPBF7cnfldgMFQrrt9K0vu0UAfowsjWpLLtwOZTDnDoIqKJlfz3D6uVEy
	6J9wWJLhlAqnwoTFFF6K9BUCoLgBS4XwOaqfFnPsqJPZdGj4htoJ9kA0eYU0v+4A
	Me/1Vr3kPEncZQclVLA2kV7MAN76yp71zgq/Cw2Ce3hXqb54fLK9DC+25gKSgaxn
	Po6U1WutLwHxxoMjdXBxhYBh2bWl1OlYd+ee3q5mHjv6+/bIXpF72ojX2c08wxP9
	4A==
Received: (qmail 1990764 invoked from network); 16 Sep 2024 14:13:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2024 14:13:16 +0200
X-UD-Smtp-Session: l3s3148p1@kNNefzsigte5aIoy
Date: Mon, 16 Sep 2024 14:13:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.11-rc8
Message-ID: <Zugg26oB74biYTwN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <2itivkfhp7s2dzmihtlo67w53wpdiukmmrcf625isex5rrtu23@4naen2rzimxw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftTH2E56lNkaz752"
Content-Disposition: inline
In-Reply-To: <2itivkfhp7s2dzmihtlo67w53wpdiukmmrcf625isex5rrtu23@4naen2rzimxw>


--ftTH2E56lNkaz752
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> Here=E2=80=99s the fixes pull request. It=E2=80=99s funny, after a few we=
eks with
> no fixes, right at the merge window, I=E2=80=99m sending in five!

And sorry for not getting it into 6.11-final. I was on my way to Vienna
to the conferences but the weather conditions made the travel quite
chaotic, so I didn't have enough bandwidth to handle the PR in time.

I will send it to Linus as the first I2C pull request right away. Before
our "main one". Sorry for the troubles!

All the best,

   Wolfram


--ftTH2E56lNkaz752
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmboINcACgkQFA3kzBSg
KbaElBAAkz/W5cHQq/3qpmdMAGME0KRCSv1pmT45O77C+xIq/O3HaAb7ov0KjKWT
59yDBDNTjfkL37sQNveS1IVxfR2vXNhGZFRR4C1FhwHmM5ooBgIrUoYVOL+lUkIz
lf0PENeLyHws8mxnRSmN42h2xUl705c4OUwJ0YF9vHbmXPSgPcLJnaeHpPTTFv19
dEwfOtkm0aAxtG4LbaA1uAaLoal6SSSS0wN9RztsRanrOJLNzYZw5dqy4T3gzZ+d
mVXUziyggEsgZtyQf911vQhQzMroq2wkF56dbnwCBajRYWjL4heehnqDi5HB3N15
aCY8CQaafpn/FZcBkS0YTdXBalvT912Fs1QcWev+1RtEiwaFstHXNDw4Q0FnM+vo
dyPiOLvyZwykPKk8AzHZRe9YwZUMCgjBLETh74nwvLSee46fxpCE03t2OQsCuGke
paXT36IeF5VrWQE1z53xdDaghL+egXa4C3aZq4hqniETFOOQk3nlyJBzTASolkrP
B8he07+n0tjf2Ub3lfFqZmXRNbibkD4d07Ize70Clh+qSIxVSBox1WpcY8lhaa3r
tplDNBomTcubEF2fl4jC0jUDa5ObPXeYYczkO/0MjxGSBGkOYjwt3p3dM6TD+nQ7
WLUju4AnK3zk3MMo0Cto+MHP6UAv5u3rXUKJ3YUvb51cTYYa294=
=3aHV
-----END PGP SIGNATURE-----

--ftTH2E56lNkaz752--

