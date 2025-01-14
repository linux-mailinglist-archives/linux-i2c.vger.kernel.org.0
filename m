Return-Path: <linux-i2c+bounces-9079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9AA104AF
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53FB3169006
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 10:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5488E22DC48;
	Tue, 14 Jan 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cvVuIOn7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77F22DC44
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852011; cv=none; b=ARnTtdby42LK0lZQjEZVwV8JM4ySRypjYBAlrmm8yLrx9D86ePlEH6iS9cuevjAQs+f540xXI2JNZrWsrMnXTUaeZyQ/Ojs5r4ugI7Kgn5ikoku/Cqrzn7RQPuYUa0YrXIs5yUcCR98XaGXhTHXNL4cNAARZ8yi3EZXbYof7Ack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852011; c=relaxed/simple;
	bh=RlrZV2ZJDFIYbpVyd+PztjS5vIIh2j5loKQkb7natQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvsEae3dEjW/EqAJK+LRqRaF2SxYOhicXC3zPBN8vMTX7puSris0X8eZC+SXVinguJ/bccGGwngKf9ezFNcsdtucQ9ahUYzHpyQCmG8ucF3dR+zZ8MTjxCYA8CBIArEDDezGPM0DBICSSaIPNwhkXTmBp4gaB5CF2Ie15mYnduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cvVuIOn7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RlrZ
	V2ZJDFIYbpVyd+PztjS5vIIh2j5loKQkb7natQw=; b=cvVuIOn7CzZSIIG9J5dO
	6cXr1Gm0DXVj5tYYL5HadfCRuup4qe4F7AMvmUYAYYK3O59Olh51gVYTpy96vF5Q
	kKOGlvnQOA+5K5J1fuRMcL8DyAEqnybwBN76dkcfTnW7eXwZUl4YEnkMIGMjLKh0
	Kdmle2rDjXHTz688LBTBUCzAidC9MBG0dx+vu7GzIEYMH/onD3k/Dxxzn1Qab4qY
	OCceOCD6csT/niGrjZXsF8hfXCHD0hlbkfHmbcrX/lg7CMPB9x7G8b321zDAcH+D
	YFCOva/3UyUHGJE7KqlOfuFFHNd9CcmZXzxljQ4KgRtIeR/d2zum04dRq0X08eUz
	+Q==
Received: (qmail 173398 invoked from network); 14 Jan 2025 11:53:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 11:53:26 +0100
X-UD-Smtp-Session: l3s3148p1@pXPYXqgrGCttKPOy
Date: Tue, 14 Jan 2025 11:53:25 +0100
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 00/10] i2c: riic: Add support for I2C bus recovery,
 along with driver cleanup and improvements
Message-ID: <Z4ZCJYPgvS0Ke39g@shikoro>
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jduWqOtwyT1dPIPT"
Content-Disposition: inline
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--jduWqOtwyT1dPIPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This patch series introduces support for I2C bus recovery in the RIIC
> driver, which is utilized in RZ series SoCs. The addition of bus recovery
> functionality enhances the reliability of the I2C interface by allowing it
> to recover from error conditions that might leave the bus in an unusable
> state.
>=20
> Alongside the bus recovery implementation, the series includes several
> cleanup and improvement patches that simplify and modernize the driver
> code. These include replacing `dev_err` calls with `dev_err_probe`,
> consistent usage of the `BIT` and `GENMASK` macros, leveraging devres
> helpers for reset management, and improving code readability by marking
> static data as `const`.

Applied patches 1-9 to for-next, thank you! Patch 10 needs a separate
look.


--jduWqOtwyT1dPIPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGQiEACgkQFA3kzBSg
KbZHcA/9GL1JkGg4sPAFl5UTnZnz2Hz48IzyISPZdy0xFSy/g2rGB+DdViUhMcr5
sP73J8CZYMd5m5J0M4w70Lx3TXZStt5iINzcaePPYOzxAeREUiUAum7KazwsDzTH
6jsp0PMSXvSyrirOiCTRBELjb9MwUuv1zIfitKiCWIJRIR8qpLJsrljuGu5YpkW+
U4x6ksSh4UoL9r11tmQWUbRTH49M/kLY9zl6rxp1zDDUHKBSo0qOe0f8x6nCr6e8
QVbkVMKKqG2uicJddDwISUTycujMfSYoOLQli5EequiztTjW4bdUY1rn4aANTfsg
dORIeeIPHu/wVrCedJVV0GN0PzDVIBGtEriYf6EameIF7lD8wnLPOArL1vHRg4l7
ca69aKc7yClh+qZvJakMwPcBExAiRN6ctVanxLPLGGEh1zN+4rm698xgjELbRSvR
7X3S3gsbMNE8CMrPtjMVPje6QnZnnALVwmG2FgyjyEdCz5ICt59CaZ5/pUoo7iuf
VtDWba6eKFWJ6RWmMr6xNbp1FL0Wrjqm2z976J9nycb+Aky4OmkcF9abhZ3XBhbc
ikk/w3pPpapaZOdkuZMWADKxV/zbHQ4ro7FVYwbSgjSqsjG4I2d2OeI96nINgf8u
0AxgBOOw5QIuZM2MJJxoq+f/crls5RU98z4ZzFZ5YB0Ov2DQmU8=
=pvrh
-----END PGP SIGNATURE-----

--jduWqOtwyT1dPIPT--

