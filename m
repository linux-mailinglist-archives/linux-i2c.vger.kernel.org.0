Return-Path: <linux-i2c+bounces-11187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C148AC9AC6
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 14:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C119E338E
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 12:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1077239E81;
	Sat, 31 May 2025 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XVfN13Ry"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893B7260A
	for <linux-i2c@vger.kernel.org>; Sat, 31 May 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693277; cv=none; b=rfMUblRnVUABj1C/wm9un0sfoiMcBifu8uOvxL+Kss+GqNnEgnBOxw9KOl254I10L2yeGSMUQOT6rbd0gGzIXepdBVanFfLQZNMUSg3JirG5lbcXn2wGo7S8BWwPqhMEB0sq6H4zyZid9q7iK6mj32JNV5ovYsv8euDY10KCubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693277; c=relaxed/simple;
	bh=gLOQ2DwfSyVePBI9ROyu+NVZLusRuXyZQM6iHg2ADxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2bA22rCpdL7XdtK2jMTOJXgiYqnbHbUhDMd6IHD7UN+CzJqGh8OonQbyB9ZrunsZqI1Fn7oQfWuafpjTHhnGuANoTgNVS3COY2vBfcLyhcYqXZ79/Fj0/YAjyL1twOLYyljIZWKSN5HYrKF96qgvaPkTCZPC4ZZOQLkdyvUiTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XVfN13Ry; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gLOQ
	2DwfSyVePBI9ROyu+NVZLusRuXyZQM6iHg2ADxY=; b=XVfN13RyoO0iXW3iBQDE
	PQcTO8X1CHnDhXGvif4cq0j+6eGV7wIJUmA4nJwmpuAaa260udtRGiCqhL3jUDyR
	GZO3nPS3jsGQaiHeyPqCAKxKWQImidDPgvIKBGmJ/Yfr82wqC/1xABM4TptpVQyb
	4YeHomxLv30+aHuPu312g6D/GXcR841Aq+UeJXlmuHE75fh7sJ7BgbjpK9P2a87S
	MNhoEcgOH8PH65w/5tq5xdZjkFqp+VA9fqkYTwXsVqUHmyh5OtnH9A1FY+X8B3Ok
	XcjPr7oWLVZTMnVzfENCFCscwnRu9muOVZVXWEk39nTZiKJqFoqkTg3bi06luJ2K
	Xw==
Received: (qmail 2657188 invoked from network); 31 May 2025 14:07:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2025 14:07:51 +0200
X-UD-Smtp-Session: l3s3148p1@2pM+YW02a2FtKPEF
Date: Sat, 31 May 2025 14:07:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H
 support
Message-ID: <aDrxFkvydIFa5Ph_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8QgkULBUQ4eMwb6i"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--8QgkULBUQ4eMwb6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:31PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/T2H (R9A09G077) SoC. The RIIC IP on this SoC is similar to that on
> the RZ/V2H(P) SoC but supports fewer interrupts, lacks FM+ support and
> does not require resets. Due to these differences, add a new compatible
> string `renesas,riic-r9a09g077` for the RZ/T2H SoC.
>=20
> Unlike earlier SoCs that use eight distinct interrupts, the RZ/T2H uses
> only four, including a combined error/event interrupt. Update the binding
> schema to reflect this interrupt layout and skip the `resets` property
> check, as it is not required on these SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--8QgkULBUQ4eMwb6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg68RYACgkQFA3kzBSg
Kbb1ZQ//aCSbFLJpI8qGDzC4KOVv3Gjfob3dJHLozemoZZNMsTZNA8SBtKqqKfXk
DH7sNlpuvYLCdXIH853wh2m/JnlxYoXcNMV6rON/bMEu9VIvEOGqEKwh1FasKIZQ
dKqdtQkVWEHBH/tg3Aqb+NamZEVdPMp/6S+EiDY6Hhx1xtJgPYB/0B+VSW1R8K/z
7pe+crv+/qSo2MfqA0S8MjaWV1gynhcEufhh6nviRfAIsJEb485sW0UtF2ts0iZu
dEU/vJsteCT0BbXgzWBBgVZd6k5PB0+Uc9SsuJLlmJed3uwUnt1xJgFB8aGtB+ak
klPp0l7/yxx8GpzLeAOgvMJZjtX64aB47RuSDevOO32G3WesCTZ3kf80JiEUqKCt
xiqxlBzq0jz3ubzwOcQex0JPSzj4FI/pDEwhkjHejpPh7qE03+AX1Ozx3oJt1tRF
fL6fUjvdxYYEgCL/tY3r6Vsh7yT3NoVwHLY8N+HyGdijc4qcZw9UjhHnDcp5NdZM
imsr1NxXw+0A/CuZ9D7hdBuQBdvg1RMxmWVYp0bdaX02hZO5fnugzwCVNHfqMcKE
GJpx6UrGWVfH/AZ0pCsLJ/Jkc20CexG42/3cqi9dIc+mkUMZforGDVOf3KizPMG5
kFovqaIDW21JNYT+1u3TD22GUsKkpJW+3TG5Hg7UAy5sMQfTJGY=
=Q3Jo
-----END PGP SIGNATURE-----

--8QgkULBUQ4eMwb6i--

