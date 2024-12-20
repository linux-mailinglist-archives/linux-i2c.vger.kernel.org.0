Return-Path: <linux-i2c+bounces-8663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846B9F91E5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 13:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77F5916C6C8
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 12:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D431C5F31;
	Fri, 20 Dec 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S0ewAtjQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B763B1C5F36
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696176; cv=none; b=A/UmIh0ihfh0oWPFNV7MgQuBu7kpCIVcPndLBRGyK7co3g0LIFOWOs8dJXAIyI98quJVnZ/E5tSwgbXwa6pCDWHFqitDHWYPPS1xp7o/QvlSuPhTOe3VLKCN51RAQ14+Q4NUgcSBuPsvtZAeWdHKv0ulw/vsgoFY9ZzLZwBoZ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696176; c=relaxed/simple;
	bh=XusNw49e0lceOwLFdgDeOV6klV2YgVaHYcKXPwyT9+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThQb5WoKbocbS0Z8AmvBOojp2fajGiPJM4/6WsV4GBfW5GHe7UI3tPKLJTDv25BNkLCbdmFG+qgRDhhIzssKRcyKXfvIVNcY1Ems1sn6nMt9RvNSOZOgX6aoPNj6DASpZcCWNzPRel0iEpNU2c8UWRVWcj6d97YEA+oB6PI9EWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S0ewAtjQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XusN
	w49e0lceOwLFdgDeOV6klV2YgVaHYcKXPwyT9+w=; b=S0ewAtjQaNwcOTfy/2Vh
	qvoJc2JVn9odOsKyKLsjkYxP7e8IdS8fHrWZYve6Plap9ayxXgu8Id3xGqMeeKYk
	UGUD7V9UmPGzWnTcleK58GVSuAsO8lw/bZDSE9AkpU0aqKMZzN2o5Mmp0mMUcmOg
	BRIQ8kdL2jzljvBik9M7CZmDt8HhXGqgZxfayKl9XGlRPF6sb4e7IXMcjIITfIcF
	RVM7Bnr/zTAGKS1cVpQU1O+BDw/xvLsogwvWRGbMYkC1zQ77lgY2nItu+4XbfbDQ
	tHzVJJPleXwREC2zEheIr6BJezCzFmWbvzXZfEAE2B0dckI7tqvXIKEBbyukMVwQ
	1A==
Received: (qmail 998727 invoked from network); 20 Dec 2024 13:02:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 13:02:51 +0100
X-UD-Smtp-Session: l3s3148p1@ldsUbbIp6NgujnsY
Date: Fri, 20 Dec 2024 13:02:51 +0100
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
Subject: Re: [PATCH v2 0/9] Add support for I2C bus recovery for riic driver
Message-ID: <Z2Vc61czIYHHNMI_@ninjato>
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
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aJ7NNRgyWjyNN0Ov"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--aJ7NNRgyWjyNN0Ov
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

I am planning to review and test this series later today.


--aJ7NNRgyWjyNN0Ov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdlXOcACgkQFA3kzBSg
KbY33BAArKZKPs3wJdE1WyI9mcpwMYYJ0cc/5q3CyKMS+YoEAkIvOA2FELkm7fBI
y4Q3wHP/vZJ5jNXo4iUgIv/XCOml50a64yR5IkJbEkGSGNab4uB8Q/CrgqLXBMnM
dVXULiVA7tUcvlJRftDIV5pg7LWxiT6n+ew+kvyKD096Cg6zHKJaHhs6r9VOUQfZ
bRSx7UGVQ5HKZULRNy90SuZL0ctIzy236GV7ndZfCXKMQZMoykXkuYRGPUdSZunU
iW7ztalIZ50Qd1bXa1VvA4z0hrwkPNOU2eIr/xRVGXHEPzoGQ5rXHsEsIti7Envj
zARIlsjAteX3/eyOZ1ZkfxnktJwe9adDL2AiRRNEXDQtE+B5H5tfBjDAPEw3Ncoy
GOhJOwlY5uvGntCaTlIBIqLzGiBZ/pYAyuFsx8p96wQBQskJMW0TB94j773dkvu7
0fsaJfhia0EjLS0iRGS7hrvBnMMImr7HkWk/n9Bvx9VrndW0M2A6btfRDsDumjXU
MYSNAzBB8xeraGcjtcmgwx88gkX5PDUutiPW0xfLjB4X7BQa3lZCSWx7QQ+vsuIF
KFOXS1++svsCQHhIuVs9mauk8H1az4iCLV9KGb79LCH+6p4X/QakHnhQmiEGSNU5
CZbagcfXX12hCT6Kywca9uF4LN47dmzQ61cWgM7lyVjII1vxSu0=
=cxOA
-----END PGP SIGNATURE-----

--aJ7NNRgyWjyNN0Ov--

