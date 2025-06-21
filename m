Return-Path: <linux-i2c+bounces-11546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06AAE2C2B
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 22:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684673A9018
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 20:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B0C1F1313;
	Sat, 21 Jun 2025 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B8hadyRy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D71211F
	for <linux-i2c@vger.kernel.org>; Sat, 21 Jun 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750536989; cv=none; b=oTNLiSsMhy661BBmtoDgzQZfN6luUCddJWW1URvrTP3kSYiLRF5lEHNo6S+KZ2E91AljpM0tucAzHcyl1rfsTUFqtbVAx+N22USVpivLyje5YESWCb3ylJizcIvLSsBi2ERXF5ACKvYX6IF4sNFfrC5WObl3h6wjUpFNovm1Aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750536989; c=relaxed/simple;
	bh=ke9U4Cti0uC9mj0+Rmq+zFQgQASUeLq3A28PjKKdDiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iru5MktLZqmNqBkr0mG6QmfXZH42pN4DMdxo+bRzYTSMPZF6shsUg+a/c9af+8SRH6HhSAwcKpLJGnz5jUN9ahEM719C1evmcJzOrUdwjAS0h/QcLlKRHuF8XQrRBRmQCcvmVeLIgd3F6pikZMwSq38Bi/VlkiFcGsXwXehen/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B8hadyRy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zeS+
	qIee4NCMPlUvtBrpNi9v9d85NzTNxC5UTevgIDI=; b=B8hadyRylbkh1vOoo38K
	y7mfBfXm5++to/aLu6ekjiS4s9MOi39ssDjDZDO7JRd7bDbrmoyilZALYbBHJFC/
	Ig4mSEwyMbxnSqi+ffoeLW+P4XPORtLutsE5rbRt2yew2PZVg4hcnYrG54YJ2/c8
	B15KugNLq2SNKettJivLwsFoUU85Vtm3THk4VOHmKxW8LqgKvzXB4MyBPtJiulYu
	79/33wBrLKUl6o+rLFpBGXk1lpjBPLelP/Mp7ngrT868QyVInWYJey+Ct5gzEH2H
	FU4lNtJmiR09BJSk9Jzi6haKuRRFvVlX8bF/kRBWQzsgWKf4VxXZMhLBvxqf/0qJ
	BQ==
Received: (qmail 3213934 invoked from network); 21 Jun 2025 22:16:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2025 22:16:20 +0200
X-UD-Smtp-Session: l3s3148p1@85rcpho4FJSySS9C
Date: Sat, 21 Jun 2025 22:16:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc3
Message-ID: <aFcTE3XBrkdENtgD@shikoro>
References: <rf6vyyocdxdtllhsydpbj5pnaptfjlagsqumblg7ysqby3k44k@mmcwop7nfbqg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NACoSndAyAY0Jvnv"
Content-Disposition: inline
In-Reply-To: <rf6vyyocdxdtllhsydpbj5pnaptfjlagsqumblg7ysqby3k44k@mmcwop7nfbqg>


--NACoSndAyAY0Jvnv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> I've collected one fix for rc3. It=E2=80=99s rebased on top of the latest
> patch you merged from my fixes branch, which in turn is based on
> rc2, so there's no tag for it.

Hmm, rebasing to rc2 was probably a not so good idea. After I pulled
your branch, I now have the Tegra patch from rc1 twice. So, I will
"drop" this pull request and apply the k1 patch myself with your tag.
I think this is the easiest solution...

> I still haven't had the chance to read your naming conversion
> series, last week has been quite packed. If you feel it's ready
> to move forward, please go ahead. Otherwise, if you can give me
> one more week, I'll make sure to review it properly.

Oh, the patch is fine. It is just a scripted search-and-replace,
verified by buildbots. I didn't want a review, just an OK that I am not
interfering with a plan of yours I might be unaware of.

Have a nice weekend, too!

   Wolfram


--NACoSndAyAY0Jvnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhXEw8ACgkQFA3kzBSg
KbazrA//ahXlV51TzNb40wWLYt5JrrLPBbyghwIhlXtOJ8oFygUKfyteja2BvYoq
So83s6BaxDYNaeiZ6SWa1G8UcjqO2SpWb3798iZWH1l/WY9WLV/NN9sxtY/fThbY
uJ1B6ZP6URMr1Gq2m2jYfW2b+RzXArKVy/X0O1ytDG6Kwdh5anIzhUHe/JSSVLbG
+ooQ2WlzgRZd4AORLyzBo8FOhiWtvXB0mEQG5y8QhOp12QhWF4kiFqIFgt0rTPZr
LrxmWDdlpfBuRwN/Pggm1E1PqLeqCLvSFeYBSIhfF+t2K12ZDEaBFGbZV3jvumOP
5VSZE0b7r7cwK5N2K01xG1ooEPBcHOOJtJ0n0ZKfHCnbjN9bWm2yW5tC5s7d8nK+
afgIKStG8MNQpQ/lvySk6n2+zEAqN8hLF/bPz/HDN94tq1xC0A5O57pgOWd1Djqo
7d+XPmih/W5IIIf5wuxEPArYuMO0k1wWZnS8SA9k4tAGY8KlCYBw9UrOIxAJwHxW
IJuC2uitcBFloKTncoZM7kbFJTmYjEHwj8sfOZhcj23vA4uyQyp2XvHzMuUL4vfD
F6LKE/6rlnj67YDTi2SuxQ0IgRF6funyy1lpy8o4kQFliUvt7roTbvfCOjpw6WpS
fl1noJ3uoYv5KXWqlPKeCkXYKVKOq5rxAS5Dy7WTh14ifkLIXA0=
=PgiN
-----END PGP SIGNATURE-----

--NACoSndAyAY0Jvnv--

