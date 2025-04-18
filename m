Return-Path: <linux-i2c+bounces-10476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9EA934E6
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 10:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5445D466548
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC5A26F468;
	Fri, 18 Apr 2025 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gl5GH0JR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECA8C0E
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966418; cv=none; b=fnygDeo0hTaNl/6UPigE6AvxgBEH7a2LsDFyJvIfpqQiHhPv2E+7ZmMrzy7eFVR3V/pd8XiPWBY5dQrhlXBFznkgwAPW+NKsulus54ncwYvvEJwRCoS27ug+AuAcnsdB/7QFtPHyWTXETQ3hD9rS/uZ7arwt0q3El5J18+m6ktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966418; c=relaxed/simple;
	bh=qm4MW58veILwB7f8dzjqEcog3i7hkBRAtsCKwvb8XrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHKdOvu/u/CuGGPcBfeCreTQaOfTV6KViRgMvxqsrgdfdiaCmPQnmCAVg50TxPgSjCJsNas7TLL5lGPIEH30UTQnIM7oX/M16x5cQbKZglSjWdDS47fuXYGu4f6U406SGW21vD1PCb4tkVjkPTgcxL+RwHg/3ZrlKWwiKAGbN4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gl5GH0JR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qm4M
	W58veILwB7f8dzjqEcog3i7hkBRAtsCKwvb8XrU=; b=gl5GH0JRK3RMYJAiEheR
	+jHsDHwUaOyhMofic/6Q8K6rgX4rNW906zDIhNufsRRo8vITLAme5WCKPUbzlegZ
	srTLnOms/5zqFd2TqAmkXEx2CodX17HhF6gcWQ4CQwExY9hGLZz7ydx+chnS0k/H
	Llw0qQC2fI5uf7RbQ2dZXknYIYevt90QvU+IEmSulUFIzCQIQxX4sEqpK+byENY5
	GlKV4jMjVtCiu7sIZdnYZ0isZTkZjjxKFboWDnyLNNkZf9uAzczOmBllBYV+hnOg
	fZBMTSt6jy1YYoU1mOiNo5QMFI277JPwivQWScCScKY8SSqhl+cbllMbjVIr3GAA
	8A==
Received: (qmail 1372250 invoked from network); 18 Apr 2025 10:53:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Apr 2025 10:53:26 +0200
X-UD-Smtp-Session: l3s3148p1@ZenDpgkzbLwujnsE
Date: Fri, 18 Apr 2025 10:53:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
Message-ID: <aAITBfrOI0GAhGRA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aAC8f0dAMERD8GjW@shikoro>
 <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
 <aAFgwEB4SdgH-1fQ@shikoro>
 <CA+V-a8tmTqFi4iqGhR3cfUgKw7mxJrm6ixGAHq747ptrL3t2jA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yam72VpGQJnm4f/3"
Content-Disposition: inline
In-Reply-To: <CA+V-a8tmTqFi4iqGhR3cfUgKw7mxJrm6ixGAHq747ptrL3t2jA@mail.gmail.com>


--yam72VpGQJnm4f/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks, that did the trick. The incomplete_write_byte test case is
> passing for me. Now moving onto the incomplete_address_phase case this
> seems to be failing on my side. Did you test this on your side?

Well, frankly, this is the only test I tried and, yes, it did work for
me. Will check 'incomplete_write_byte' later today. I will also check if
I need to run the tests more often. I did not do an endless loop.


--yam72VpGQJnm4f/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgCEwEACgkQFA3kzBSg
KbaiIA//Yrwio7XjPV3sRQkpmuxtSnYx15g1m1r/EaKTI1d4zoSpAZ+xnk/dOySC
yZrQQrPb6btVTxpBRU2ID8/vwWGZjeLNtrMMs1xKBcA+wEKabqypVhAho2OUurYU
EkJMusKGhdlfTga8YkNixE4Mboa81TLveb03iqb7MfSYv5ZoCZBjd8f9e/bT9Z11
BDqNdjz715kgoxN4AHXbIxJqq50T6GS3o4ATWzTh3+9Acw07FSCNGxlAvFFQSxl/
TPSCBrdBnT5vHqEYLfN4+3Si49q6v56chtwNkDj1trKqWqieINvDPI2ZrnI9IMCW
g0eCs5on9J2y+x3HQs4eZyGbVSLff+1e2NTqS7krIaTjB9bsn0/oZ1o+m8oI5CkA
yL5S6ky5v41VnjAJgbtSUehVWRAMv2OgDa4Jlmo/synfq8nPLi6Hbk1L2OwvL1Wo
n97cx4IvTiwH55jnDhQGllqsxTX6hoX2BMBSMUdAEDVbOOejEFPHkl2a/R7Ss+ds
FSfjjHOSIEZepOKK83uSZxRLJgvIP9K8eGnnu7ugrQS3qkHCdI/i2Y+Ov3aisgxa
JLOttz1SCpas4dw4CTZledfCAPN51pWv7elmkiNJ1uJVyM1NmdtxfelQZk/KgdF/
mvfDnoRr/wH/dwFdjtPDA8/fvWdzmc6r8c1GgQr4ns8nu5wIrzc=
=q3e0
-----END PGP SIGNATURE-----

--yam72VpGQJnm4f/3--

