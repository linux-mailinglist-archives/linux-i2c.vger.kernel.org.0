Return-Path: <linux-i2c+bounces-8671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D99F9BC5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A55C16CB76
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D197E218E87;
	Fri, 20 Dec 2024 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BCb1KMes"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6301A3BC8
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729450; cv=none; b=pwBhETh7ZvtmI+xWykzgUAhupmtqkLCRl8y71ALkbEccKaEQ8W7pzxIN8jerjDN1sDS54t15mSHLlDcuHvk7kbw9tMmWil7y0hM3U6zQhyta+tY4SvB2DYLBBZlR+Lj0eIefmYCf/rDeiiPVz6a6vlP1rwc6k0IBeo1b5mgXX5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729450; c=relaxed/simple;
	bh=RsxOMCY4nFOSccBt+net6BW50Y5gQ4neS3k53v7oT60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBZuATxFhtNMuwuXIwHR5JZikdZzgKolc2LyTaRbjhbiMZdMMMTYGTyUmO7QVrmEKnmudcYmXZoWUdsAVo86mc7oa0ybcZSRcsF3u89n246koP6HgjfqTZIYCTOTW3l8Zcig1zhoDSEfOgu3UR4g/xW46+BdmjDBWM+M8LLie/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BCb1KMes; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RsxO
	MCY4nFOSccBt+net6BW50Y5gQ4neS3k53v7oT60=; b=BCb1KMes5FHM0BMHmjkd
	L9R7iv11AhPdhSpv1YptHiQ/R5kt0dMOBRSn4Me9lf4/Tgpaf7rYocvSRU4nNEO9
	7sTRbn748Qu1aBoee4IivF5GqfHnZTCpG/Lsz8f6KD0Kpu3K3C8mqrbHmRpspIQC
	rWrhRX1mX6FG3nRdQqftDe4zvxZcN9STVv3s1OzUoT+M3TkwzoMZ3PaLAYiY6+B0
	AzNh2nFmxsViasdokjQrhJLGZ+J8laTZ7FSliL+muc3LaxmYYU4rTYLRCo/bLOqB
	pTR5CpyF/2FE8562TNNFZu2CswwOrms3GvTm8xr0mNcq9Xc3o8H5rBVcnq7Gx0Jo
	+w==
Received: (qmail 1126195 invoked from network); 20 Dec 2024 22:17:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:17:26 +0100
X-UD-Smtp-Session: l3s3148p1@jq5lLLopOqkujnsY
Date: Fri, 20 Dec 2024 22:17:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/9] i2c: riic: Replace dev_err with dev_err_probe in
 probe function
Message-ID: <Z2Xe5Z5cNBHsqWz_@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YY7Qar6zzsSKlpQQ"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--YY7Qar6zzsSKlpQQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:10AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Refactor error handling in the riic_i2c_probe() function by replacing
> multiple dev_err() calls with dev_err_probe().
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--YY7Qar6zzsSKlpQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl3uQACgkQFA3kzBSg
KbbbGxAAm0ttrIoiEnfYvR3m3gGH0fLnY4WbrJcuARctnm9yZ2CRwizrAUYmob3h
ZYIDI8S20JO4VRnPdvQ8L46Vza8ATUlhKArqwY0GFhq92RWZsq+ONNFX8zmSW7ZD
FGURRB9gYHhCg0AS+vdCN2LdUFlPL7c7bpGjTDRg8AcEcmZqzMYPxVBpqSf0F3lb
E+zbfnesdHygBDfbPpT/Eojost54Dh+b3ZDpsC/Br8gMrI9MTlgwLnYyPyvApYJe
Evj61LQJHDtU979gUsoykR9P6z6q3C+hNImq/ZCCMKIQGgtFKYdeYcG3zI1OCVD9
1zEXIfuA2FgqzlJSZclBXxyvcghBcSXbu9EL4/gbyVPVjuPAM8ay0+av4rEfD6Uc
FnrzYG7tbWd9c3WTFKodnmD5kOq1fduerIis2S0+YtNWG3mwo1DnfzWx/UfaXJIe
WI070sxAsG/NHqKDvPTwBMFg5l2bB8y/BQN2XJRQsqm1CS1YHUnJezuaXqLKeklL
jzNRSxShJ0e8xTpumEKeSNgi4vkchDZk79zXjg0QfPDdpp9cNr4tua2BIaKbWzHz
Dm9HwKBjJKatMAo8J+zvwgQDjqQgWjiSj7lVTLdkDipnYCuWCV35kNQ6iG/zA5/D
ZvGdfG13Ti76GKPjfnksaZylkdUQLnnvp4+F+9wSwb7VlbQsGwc=
=wYvT
-----END PGP SIGNATURE-----

--YY7Qar6zzsSKlpQQ--

