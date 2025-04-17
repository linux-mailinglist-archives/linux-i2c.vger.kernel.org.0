Return-Path: <linux-i2c+bounces-10452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C372A91679
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 10:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0353BFED0
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283E821ABD4;
	Thu, 17 Apr 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UeL/qWwB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1D1FA14E
	for <linux-i2c@vger.kernel.org>; Thu, 17 Apr 2025 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878734; cv=none; b=PuZL8W+0m45NzteGi3yLyZHt/VsTLHDKwyf6K6X5BnvO918da/z0uDOWbfcvkgMi5i9jXzXUG/D0aC3BWL1cWsRL42FHAg4yZFKmwlV7llymNRrahU+4ftpn+osnGHBITXa3aRzUP/TDsn1wZzVn09rkK4g7crgMnh8CQlPNLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878734; c=relaxed/simple;
	bh=gqE0xc1rYegcSo7HWStN1ftYp7Vosk0cOKSXbGaXXJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKD58kCjNkUijdMXFYJrIxvUGPpf2Q3pqq6xPGwCcHN0mvASUZkTJW6xRYfrLJkbOFIkwngLWJ4zlesFVKe7uLRceUPqErqEo1uB8QstcRcSAwCs1p5/oHIxKHYKlDtn/cBPthBl0/K4xL+bNA+ZdX3WjRevWkC85sREE4vCTUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UeL/qWwB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gqE0
	xc1rYegcSo7HWStN1ftYp7Vosk0cOKSXbGaXXJw=; b=UeL/qWwB3H59mQU8e+bP
	vDXTYy+POGfCfzdljtZi4TFfeHjtQmBpZE8UddEAlyFPVNwTp97TjC2NyAuUceyx
	5nDXZjI7UQtfiQRGLeXRuVo2D+Qxjmx5STOiPghd4240U/ydT8xha4EevG9j/6mn
	/qgcRmLxbgLJJ9/2pOQRvggHrkkGxOkZ9GfeUjakxfuCom2CTJRGYyufwjtiaRu2
	Trh9HjX/bs8kfN+0KvKVZ71ans0MWLdhtJNxAUMEiTT17JzYuqWQz8tMZpZeUl/8
	AubJGfKjr9gG/kXbVayGPbO6oqKKHmoEU2M5Xe5O4BjoC3FOR88NLDSCBYHBCjSB
	HA==
Received: (qmail 1019652 invoked from network); 17 Apr 2025 10:32:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2025 10:32:00 +0200
X-UD-Smtp-Session: l3s3148p1@uQ1LPPUySOIgAwDPXyfYALbiJ46yNPq3
Date: Thu, 17 Apr 2025 10:31:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
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
Message-ID: <aAC8f0dAMERD8GjW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
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
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my8PveaXmdni+pX0"
Content-Disposition: inline
In-Reply-To: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--my8PveaXmdni+pX0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 01:18:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement bus recovery by reinitializing the hardware to reset the bus
> state and generating 9 clock cycles (and a stop condition) to release
> the SDA line.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

As I wrote in the other thread: I took your generic_scl approach and
replaced bus_free() with get_sda(). Works fine here with my G3S:

# echo 0x1a > /sys/kernel/debug/i2c/i2c-2/incomplete_address_phase ; i2cget=
 -f -y 0 0x1a 3
0x0c

And I see 9 pulses in the scope. Can you try this with your setup
please?


--my8PveaXmdni+pX0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgAvHwACgkQFA3kzBSg
KbYArw/+O85cUgxtrUoTEkvDPIZuaeKPeLYh/pH9fWJaCcnwtzZR+belZLsB44Jx
hXkkFt3FilATzXwx/uDlZmAgUcNPYtziHDEEnge1J/l3ibIqd1vco44F8R2vapmc
est/NjSYlU7qiquQTJDZcBK4sj9CuumDc7hPT9FDF5QcXb3JelOeFQlV0xutE7Xp
OfwZ3REHBWPNGkpBzQcbKBQK2yYvgkpQeHzMVgM97xO305tWjBiRHJdQndtD4MZx
ArBZZHdO8TUDSuTpf+dVkWxO7+uAiLObqw4QMc2gGvXIwvS4oLlzEFv5A/9j9Pue
8HFBKxx4iyzKWOiYekeW811lumsMWV9b8Sh1xZKx32gXfBdGe0+ghI60oDufVilw
UjLyMZdghhfE73l+9hERxO+WIthAclmAx3c4KAfSscJrqrEqSnbn4cf1BX3EXW9C
z++fVcal5B1YpDAM3ucjO8vRYb5YCn/aWnBWL8x7xuCcTGN9Hylg+y6BvkayqgGb
ihZso9kGhDjadK2aftbNgi1tiAqW3No2jXjfIeK5ng4Os/zSbq+jdkgG5NqSVGtw
6tAa2EWc/0rQ05TsgWgmHzeyrwRWiAsaKLqlSO6Z9+vPx8f/NfDEUdLWZHr8OFuX
aDDFjh8NHrP7Bh3PuU9bL6pLq5OBd2UEVvMU6EPXEZYYGZOZwrU=
=Ib2a
-----END PGP SIGNATURE-----

--my8PveaXmdni+pX0--

