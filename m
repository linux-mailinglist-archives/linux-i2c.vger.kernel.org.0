Return-Path: <linux-i2c+bounces-9017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34ECA0880F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 07:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AB7D16AB88
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 06:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5660F207A31;
	Fri, 10 Jan 2025 06:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GZKuMT5j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D69207A2D
	for <linux-i2c@vger.kernel.org>; Fri, 10 Jan 2025 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489182; cv=none; b=GSK+cdlIl4ExZrZbCfeNFLG2CKOSlIDWPyJHJdLITeprf+93C8AkNuOW8rAyF2U7FTBv1kGJvsdVIqPicrxPcZj2YfiRdwBvRDXsZ4uNMVSMVFMt7lP+nI+Qn2ZDW/vjFcxgXmg6GsLgpnwOLz4gOSQ/6ASCVUlNRw3WEmXK+YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489182; c=relaxed/simple;
	bh=jkbBVbVNnAhSEJEK6vaJ7IPM0KI4rGDyb6O3bxqMPKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYgiC04GQ1TqrUIC/Mr9p0tQ0koVrMysa4K5I/MIQaDmZZg4dyljlg0wtSOEs+jao42sOx4CAwBevxj0rWbgAwaPRec0z60h94vKoiVfUj3QT9VEmYJJYlLqJiIovfytwlkPk4Rq6Opk3/r+BzMd1e/QitmEbPc1Y2I7mCpsiKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GZKuMT5j; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jkbB
	VbVNnAhSEJEK6vaJ7IPM0KI4rGDyb6O3bxqMPKI=; b=GZKuMT5jbxzUesr6eNxg
	LhhQYdCbon3qApBOAsIYN8oAKFigXEjfFdlhrqiAeIIwI5QQRfgGJB/IxfOACeYy
	Mw2Y1ZN32g4QEvMgArDEN/9gG/TrBW+Ak9ZWIywtv5hh89NarPACKaeA+J8wXUTc
	2ri836EjoT+Mf0i8IytdtKInHkQ2lNaGvsfpWt0vFws7UQ5walcolbarskiYNLmo
	LgnQqs/5WnBanp2I+GpHnJMsKrHhmSY9tkwv5PPvzZENZzbP/PdHHzemysrH6ZxV
	yBq0YjDPt2aLYOtg6aV/CrE/5GHcPBtRIU9J8gjZnOeYpIH/0EqHnDESQ9CmPu49
	mQ==
Received: (qmail 3137913 invoked from network); 10 Jan 2025 07:06:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jan 2025 07:06:10 +0100
X-UD-Smtp-Session: l3s3148p1@3Y8t5FMr8q0ujntM
Date: Fri, 10 Jan 2025 07:06:10 +0100
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
Subject: Re: [PATCH v5] i2c: riic: Introduce a separate variable for IRQ
Message-ID: <Z4C40sbFS0kvh-9K@ninjato>
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
References: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5dKbGl4GlhbAwbhU"
Content-Disposition: inline
In-Reply-To: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--5dKbGl4GlhbAwbhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2025 at 09:12:05PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Refactor the IRQ handling in riic_i2c_probe by introducing a local variab=
le
> `irq` to store IRQ numbers instead of assigning them to `ret`. This change
> improves code readability and clarity.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

If you guys like it... Testing not possible this week anymore.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--5dKbGl4GlhbAwbhU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeAuM4ACgkQFA3kzBSg
KbbfGw/+KY8NuvX/vVRgevMBB7k0H4QyAq90DT6xPSj0NIGmQRpRTZRamE7084n8
spmrixOvqH+tU36Tn4KDOakpaoxxoOZKhWYeygWaZNEeaauDJ91AHLi8zxwp/OkD
sTTvytTLFf2ZRFpLzAuzbtQd8osMSepE3PlgzWnsI2A90s/J2n/hKyC5XwheL2pm
Ii0qQsGkraxmYHgHgz6h9zsFO2BtFn35jnUiT+zjZ/Cqo/oZU2lfvlxksB+JDbiO
7N8mL7iyp6a18sgyxu1ZV6Zp0VN3Ds9yxTff5Lw7BJx6iacwE3YxvkVmM2bFwxma
9cNGcsGS/Mf3vok3EpEF+ZKM8JPLcJh+SxIZBPDQ1yHnfmaMFfgrdXVKRC14GCfn
TWkI8J0cFf5ELk3NSSxEGdSyvFy29VgFjJKA/OwDXDQDUzNl7miGkTSgpRYpSzey
CE9LoBqMzuPJitqB+FG7IUrkq+pYH9iexI+n8WboalX7c8fYreNZ8pVLSPyveoCD
XtOq0TRBgrACO/L+sd6iiDE5I6IoYCOtRDiW/sxgJCF+aFI1c7Kmht+/JzzNYTfU
rWQoPsthQGRLM5E3dYblueT4Uo5ZzZovIgevQHNK5QRfU/Y3yFv2MxOz55p9x6KC
nomVPoZ0I9A64BHZzmuhf5WcZwxrwZK2BzpbQrGnBciXqKRH08E=
=d+ZQ
-----END PGP SIGNATURE-----

--5dKbGl4GlhbAwbhU--

