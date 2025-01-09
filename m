Return-Path: <linux-i2c+bounces-8988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF1A0718E
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECC631889FFB
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640702153DC;
	Thu,  9 Jan 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BnTUW8uL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278512153C9
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415372; cv=none; b=mGU2tA2VHVi708Kb9/caMeKQI4ibp81zCxkwjLtEcs8+r0FAuVoGZvxBvvS+iIf548SV2XhSMO6HUPEzc9e43CSwYGLqs8IAOzTD5LJ6iK7tegS76hgXYXWKZj0x4NJTl0tMVc6BvMtcdtXXQfPeyzWGROAWdM4FCAAMlGM8eNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415372; c=relaxed/simple;
	bh=AN72JnqIoww0+UNCFKmbnailjgT+hMF2BivOAJQ8dG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYTvGZi8Y4BkN2U8IxvJIB+y0Orn2rVMHy8W6/hWWJiniJsz/Pfbu+FXTDdwFUsr9cvD6F3p9tiXs/RRIHV2fRHCbFVWE1lgklKsQNo1F5wMaeoW/ljndn1DmwRzumOGQgp6Omcx3PW7D2EQQGLLsa/trFUGv/b4ANjfnJNPEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BnTUW8uL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AN72
	JnqIoww0+UNCFKmbnailjgT+hMF2BivOAJQ8dG8=; b=BnTUW8uLqoWYfQBIXkiW
	ldYnGuE70abyGytScVX3Dfi2cAFfsicwPzNtGT0Ur7A9q3EjhXWs6L1NalR13HrY
	PQTVXDU+Lc+VGFFu8NlkbAmjMS6Z3hL4YoXQc92/qutrnmsG2D5rhQKokb6R9kaC
	crUFcGgGbtTzViyFtSmBRnk6ATo76Oaue58OkiX4kAcjN+KUIV/RtUvcR2j9vDER
	j90onV10TaEscAFFul5P6wsU6s8QnTFObjBxO/fODjQms4pzGvug+kXArEBXxe0x
	ToDPH4LhYOxd961DS7uZE2JjovhUV88iWqcZcRsdWHFN8yR1wERrrFdoB2iAIvS/
	Tw==
Received: (qmail 2854001 invoked from network); 9 Jan 2025 10:36:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 10:36:07 +0100
X-UD-Smtp-Session: l3s3148p1@9g8etUIrSK0gAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 10:36:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 6/9] i2c: riic: Make use of devres helper to request
 deasserted reset line
Message-ID: <Z3-Yhg18VKreoOOi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0lXB0H7QkhmkNsQ0"
Content-Disposition: inline
In-Reply-To: <20250103091900.428729-7-prabhakar.mahadev-lad.rj@bp.renesas.com>


--0lXB0H7QkhmkNsQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2025 at 09:18:57AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Simplify the `riic_i2c_probe()` function by using the
> `devm_reset_control_get_optional_exclusive_deasserted()` API to request a
> deasserted reset line. This eliminates the need to manually deassert the
> reset control and the additional cleanup.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Missed to give my tag here:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--0lXB0H7QkhmkNsQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/mIYACgkQFA3kzBSg
Kba10Q//UDOySENe6mL+lpRSfzb4yyORheMlHaKXlTNLWGKxJBoiQHYgl95w0yQI
SeSzS31EJ0CBPzpcPXcr1xXZaUxiCItP1Jd7+hRcD+FI2A91fT5cHda2ceTSXB3z
J/oYNPHRTLdhMvphVZMQgcnbOgeijjwXIUpI9VPc1tYhpo68ds8+4Uu5PNGkpboh
U8NaEUwA2f5dul298RtHPqvBP0ceMX6gQu/xaViAWHOCFgRtWv8ZPpOeKeT/YroY
xIxwesSEQdOpeuMkrbvRK6MY0/JlY7q/lbfkIRMO07uSyl6kqd4TVbELQWfoIn3U
li28BFjnJl33JbHnS1dLyF1/yM+CFdtcicfXSgvJVSlusKNR9VOsq3xjap2nU4zX
a1JcQyWMb8gi3joWZBuxVGfdmIzYVrHZSQVH8kneQ5bx1yuMU3BHFRwNOabUZNqS
nnH+MmI1lcg3oMUydVbJKODc3ki6gj961jf4Uu9dhRe+3ceKkxpPtv1KkyaemQl4
M2/RqMdb5eFRkj9HZc8mvlG1erf8eioN6NVuY50wQxHSrkPMjx0NCo1dga1InWC4
VDoYkh47PXDVvbr7gox9Ih9lMj91mhmzX0fSMPRAtAeuvh2QCXdewIu/60H3mtXU
NwmQQ6gOT9h4BBxzbghcul/qfX7zmA/fyCOtJfsWXQO3UVt9B6c=
=7jwK
-----END PGP SIGNATURE-----

--0lXB0H7QkhmkNsQ0--

