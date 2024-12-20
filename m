Return-Path: <linux-i2c+bounces-8672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 100CB9F9BC7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297D11885C71
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5CA2210C0;
	Fri, 20 Dec 2024 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DldQGfo8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B041A7044
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729495; cv=none; b=SP8ovrzF9CFVJFp02ltOHTIwE7bxUuIMO4+nKJKcrrok4ISKSf8sDoRWajH/Zco/dlI2o6v568B4nRXL4OpIC6Q1WrsNwb1tjj9Ua1pLmPRNugUWDq/HicdN/v8xTsnrmnAX0wZ5lPKqId9CcFopv52anl+J/dOITVV9b/ijeo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729495; c=relaxed/simple;
	bh=/bdwIroeSIXffjxeOP+xn4MLxu+v7i5wZHsswUR2U7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nASY3Vvr0fs/ne3/ileHF7AwoxdfSEe1mDLG+ytAGkOPhfzshYu1wVMdl5H0XftulELJvVemcV1ooKP6u029drk0qWn8x5cwvEl/MDQk5SvX8kNnx7IRCdQILUfph7OWgxWoLyLZAFI8GjFTBUQY0GLz+DnjOPoONJMwPuKMunk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DldQGfo8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/bdw
	IroeSIXffjxeOP+xn4MLxu+v7i5wZHsswUR2U7Y=; b=DldQGfo82naTFduHL03n
	aJoYpQXU2Mx1d5vcZPmb2AH4LaHctWle8XvOBKfOJnGm1Ros6eWiFrPo8ASy1dNC
	da73GselLULGas1CXCm6uLP7fIUEJrZPSKERr2kzrO+9OQrpKwnEBmIjE6QICb6z
	j0qhiMxeBG64RPrfMA0VBHW3bZGcr5jSJF8xTGK68wveuabtew4sH+HLf65f98xM
	x4AIaYAZK0joCQXLEC7fjhQHBLhYOCzlkhugXWDrYTfDoYyucBAz1IfYK+iYiUsG
	iliyQ3Uf3UqrnKTFhp1AV04hsna7BWJGiCSd8n9sO8TYjB+0AbhGfoZ5Iv/EQqKj
	gg==
Received: (qmail 1126414 invoked from network); 20 Dec 2024 22:18:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:18:11 +0100
X-UD-Smtp-Session: l3s3148p1@UZIVL7opiI8ujnsY
Date: Fri, 20 Dec 2024 22:18:10 +0100
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
Subject: Re: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in
 `dev_err_probe()`
Message-ID: <Z2XfEuhn5kVWmsGl@ninjato>
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
 <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iLnjocr+yMnUOo/E"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--iLnjocr+yMnUOo/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:11AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Update the `riic_init_hw()` function to use the local `dev` pointer in
> calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
> `riic->adapter.dev` in error reporting. Since this function is invoked
> during the probe phase, the I2C adapter is not yet initialized, leading to
> `(null) ...` being printed in error messages. This patch fixes the issue =
by
> consistently using the local `dev` pointer, which points to
> `riic->adapter.dev.parent`.
>=20
> Additionally, replace `dev_err()` with `dev_err_probe()` throughout
> `riic_init_hw()` for consistency.
>=20
> Fixes: d982d66514192 ("i2c: riic: remove clock and frequency restrictions=
")
> Fixes: 71dacb2565ed (i2c: riic: Simplify unsupported bus speed handling")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Maybe patches 1+2 can be squashed, but I leave this to Andi.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--iLnjocr+yMnUOo/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl3xIACgkQFA3kzBSg
KbaoRBAAgeKs0zVD0F1XgfTAhe6aifWyviEHCD+qTokGVJotWsOPsmeZScH9yRhf
329TfLWiCPbHaZtyOgvOQ0A1CuGFL843uoDCxroZOzDY9Uv7Kzmegqd6HsWdsK4o
ArjtsVw6uxY9fBqtesRRekFbYnyPa+7uRfkPPuHRZ5kGdMMrK10r0fCOayXpb7WO
jmFZisb1+T0bYKaDSQtjavLx8gQ50n7RcqH/OtPusZCKf0YHvRWEBeXmqwA7Vuf4
ie/ibK/K05dnPC48PRUUN1tjp/CVgpZM0fTr0oJHeeIp0oD9X1dekFT8gUkEblDz
szQpupUL+8CsYd0SGOMl6zHgOOWdrZfFSE/bq4dpFjb5GRHuBiRn8xvC/IHT+aTt
xC9KkVVCFDNkn0g0Y3jaxeBFJWP1Cj0+k8qoaDERlUhGZH6rs2YPYkA0cp55CcWe
Hp94L70vqoMx8EfufFi4xBG5P5oLQ9xoWis1q9/DseklIga/hjZN8H/7QiogavT5
qefXsX/uygn76QdNcpNAwsRIht/fIMThGsnKfBKBFGmagn/qQaSZbwJ/FobaFDd1
fokEu3Le1VC5klcdI3waylj8pftjGGbczrmaC0UQfulQAXxpetGDIZxXAn9tB1+9
wvuccjcHVwxxqXD8PdeQz44wozGV1O/tIGW1ut8t4A2e94I1Xjs=
=XJ/V
-----END PGP SIGNATURE-----

--iLnjocr+yMnUOo/E--

