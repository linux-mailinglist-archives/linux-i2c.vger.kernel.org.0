Return-Path: <linux-i2c+bounces-8989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C461A07197
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70A79188A0B9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 09:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0C82153D4;
	Thu,  9 Jan 2025 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QptHtE85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D42153CB
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415409; cv=none; b=ltij+s7BAXO6gvsy6z75hixP2gr7cg/NRKeFjFUQb+VTktCZdzxshGZd6JCer5vyxgkBjazNsUuv3oNMlbfjymplSplUd6pEkrZjSX7VjvpamxioD7SSuPaJZVckbSZgP7bHeOCoe6qXRpg/ISR/C9bzIWk4mmURIr2MFGFNWMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415409; c=relaxed/simple;
	bh=eK//A0ujM4IjGFEkFOQA3uuF5Spd7TQ3J6hiceKxBI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXJMkCgWiOnP0txTPtKkjRcm7HRIWAhi+az10UW1W9pTZRwEv0hzPBErktPIuhLFKn3Hg5eCwxtqXLqXeHLoMVJK8U6wREntvbpiLG2OSfVbj28bfRARCGdslTqdClpi26IUkvE4BzIHHxsynRfPCbXgnrHShnuC9YT0zsCgBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QptHtE85; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eK//
	A0ujM4IjGFEkFOQA3uuF5Spd7TQ3J6hiceKxBI4=; b=QptHtE85YriPXHZsniHQ
	+R/7pALC29X30CRjzXPvQwo1TtjzdOYjdRVkhBpmn9BuqxeQvVvviFV0qnqIWOxX
	+uS4hu8mDKPmD8bY7QwImxTCP6eQ0dy0HefThP6SLXNp+m70PH0Ayk34stNsYRMh
	gZ0Y7Pc5AM7clPLOzosGaRePlS05FJdOCbHvYotqSvQqeRg0rrOWqG7ef2gXXYZt
	K4BBh42DZ+XoQs8GayI0dJa71IwarHqP3iAFZF64N2R6KLd7udFJvsdeDc91+KSB
	hxcFRFlsWnPqvvvtSaHaxLuVP1w5Xaeb/YrwnzUDKogyx/h+YzYc/a9JHnJxfcI9
	Qw==
Received: (qmail 2854345 invoked from network); 9 Jan 2025 10:36:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 10:36:45 +0100
X-UD-Smtp-Session: l3s3148p1@O0Bst0IrlsEgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 10:36:45 +0100
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
Subject: Re: [PATCH v4 7/9] i2c: riic: Mark riic_irqs array as const
Message-ID: <Z3-YrZBA75gABp53@shikoro>
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
 <20250103091900.428729-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oLGtTo657kncCh8J"
Content-Disposition: inline
In-Reply-To: <20250103091900.428729-8-prabhakar.mahadev-lad.rj@bp.renesas.com>


--oLGtTo657kncCh8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2025 at 09:18:58AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The riic_irqs array describes the supported IRQs by the RIIC driver and
> does not change at runtime.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--oLGtTo657kncCh8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/mK0ACgkQFA3kzBSg
KbanFA//Q4wvCScCXtCBC01+ogd4eSyG0Bm7PfQtVOtPJmwHfmIMY8keachRPHQq
0dsy+UiddU7XMOLatn+iaoaILB/E7IzKlRMBYYoK3AIjgp/wuuwypaUzOdnCm3lS
F165ATP26kRavIN00OYUNzeUxmUEQ3K9Z1BXomNBySb6O+uQvkDhp+x6I2YH87YM
pfATUC+Nd4OCMZX/DtzzbOZHTwhjLj/Vot59LeczR6ahFJY0+paVKAARV6FLtRlQ
/88GfzHbtP1vPGaxoC7B4AjeogeYJMmcI/fEOjn4NYP/+XPU5Rt9aWhsJWI+zkDh
ZlKkCHZVXgUEtu4smcxDcraf43dBdwx4JpUR7okKu4WFRDE7fdmfA9JihBdUfiQ7
3ACxxhXnhOeMmnkxdQTkJbdK0NqcR+x0prmcrCb5wCAPISJnuQxa8JCZAgm8PWn6
NDq9eWYxMtS8KNwjdh+L+gZifNq9NOtzQlwVhbd5REZJsTrK+8Qt5wAoVEdpv53Y
KZ8wRWb6bb6C6VYEdRpqwxtjEPAs+jjAGr+R2jrs5/3UHDlRgRO5gt+c1Is7p+Fs
+uffnGSK9YXMQvYCNTtDDOU+t1OH0JprgCPX6Hsjt99nzF8gtjaOnEFtpdl1CzIt
H9QEO7bl83DpOdXKigzD3zjZ9mOtQrOD2PY89ACXszyBptQ3lpI=
=J3N+
-----END PGP SIGNATURE-----

--oLGtTo657kncCh8J--

