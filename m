Return-Path: <linux-i2c+bounces-8262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D49DC329
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 12:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CCC4163E70
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 11:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28D4199FDE;
	Fri, 29 Nov 2024 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HzmXzuTb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F233C5
	for <linux-i2c@vger.kernel.org>; Fri, 29 Nov 2024 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732881383; cv=none; b=DPCHuLxRURmbNc6mrwvXDX2YZIpY0vFCS+NqZSeWBlJDZ8rPBfrLICj8MlT+GHXmlJ4STdT58MZPDN2vqTJZEecf7cHdzhQxK/YbjTbcHy0C84cS0wDvowsykGDZQ852XAzKkA4A2kGq7pqisbSg2S9WkBLYmiX7cEb08Zs+8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732881383; c=relaxed/simple;
	bh=BRdQq1d646B38q0Lh5kk9wKgLFcCeeNgaOzA4wBFSYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu9JU1zXdFyF+EeJDIsOIzT9+DMWcIX4J1BIE00Jjg9403dQZZSJURzPQQhGmg4mlnAdJM2vgeG0RUfXHcSsAfPiyStbDM4Yw7C7VA0lvO+cRfzDTe4PINI9kQV+YldY6EogePm2BQohwFqy2eb35S2lYYDeOwqFgqQEyEZMCYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HzmXzuTb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BRdQ
	q1d646B38q0Lh5kk9wKgLFcCeeNgaOzA4wBFSYs=; b=HzmXzuTbPF/4uDarEdbY
	oMBibca0fqng0poVkkQP+vUFIM1sfz/nke4hLYjX6vS+OWNDBRQKXaeLpodoVbZc
	Y2rMkOzItkbUXzju+UuDzC+WEQkM439gX1vnalf+T0RPeb5MRTxtmzgPuw8cBW9J
	zbMb7qKyjgXYpVUqdg2Q8UYS3IiMAqL7lBoEi+CS2+Oo9lP/xdvpIKoyQRY/85mX
	nssR/XQOdckKeluQCYNbpy3Wg/R2/qr5ie7hLQ0LjPSa8hWudo+QXNDENAYb6Wdc
	vExRZAE/KKZBsrhNG3jTD4sVQseG70jbe9CLd+W29Do3kEiFloV1tG2ge/0qYOp2
	yA==
Received: (qmail 1390799 invoked from network); 29 Nov 2024 12:56:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2024 12:56:15 +0100
X-UD-Smtp-Session: l3s3148p1@0VPL4gsodtMgAQnoAEnuAE61Ad4iLfCs
Date: Fri, 29 Nov 2024 12:56:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in I2C OF COMPONENT PROBER
Message-ID: <Z0mr3uIatn1A0iSE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lukas Bulwahn <lbulwahn@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20241129095238.51748-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yBRPQr3UFnGOqWre"
Content-Disposition: inline
In-Reply-To: <20241129095238.51748-1-lukas.bulwahn@redhat.com>


--yBRPQr3UFnGOqWre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 10:52:38AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit 157ce8f381ef ("i2c: Introduce OF component probe function") adds t=
he
> header file include/linux/i2c-of-prober.h and a corresponding file entry =
in
> the newly added MAINTAINERS section I2C OF COMPONENT PROBER. This file
> entry unfortunately has a typo.
> Fortunately, ./scripts/get_maintainer.pl --self-test=3Dpatterns detects t=
his
> broken reference.
>=20
> Fix the typo in this file entry in the I2C OF COMPONENT PROBER section.
>=20
> Fixes: 157ce8f381ef ("i2c: Introduce OF component probe function")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied to for-mergewindow, thanks!


--yBRPQr3UFnGOqWre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdJq9oACgkQFA3kzBSg
KbZSDA//WVfUWr7RZtRfQdM3rxGc3tg3gOh/v43xBLYMzMw+YRr5ntV59jLBixkc
i5Dljx+8yOOqw3oNJwTe6uVoHfwP8kc/n0BbdunKUoO9LyoI2Jv1cpsANdleKJi0
9QXahMyl/w0Jmoruv9SaMxg1GYg1wNx5mtCqIo3kZEnopxkzuOXpE6u1gelQ69f3
u69Opunm4olZ4+SwShk/y0M2t2om8sUoSeNuTT2L9wSJbuEk/uTnKhe/ft3NP/H8
d/D4VMBOAQLDP4TlC5hJZD/Jxi8KKbEoJN0KbZMysACtcWiPdlu/RWIUg64OzfQ9
y4gyiCtlDBGufCJicdhctxFD6PCK6ay7ZY6BwfUW1xKRV1f4sdSpOBtOZDqdMMi6
s55/MnKtu9RvCXqVgPPNfd1VYLK3DKQe5/WDBYRm9r2esbXvKwS4kD5M/U3MxMJ/
XVxbCzTQWhqc5RDnvOJW+O53FVj4vRFqavCd4D4DVRFqBdL/bXTdvvR0gH0gUvJV
sYSB5wiKzW9iKgLeKYqyaS6Y2t/87rqjfxyRPrybX4CdEGijcbBjIA5Y+56XtMTp
OQn7TVoANIHZFEb3E/PpbFY70GINlzfp2QHwt8olCGP3lI5w0ugg7H0ZHP6ozzyu
XZ7/rXO6FQRX+6cpYCsWxc1co+LCPcEqgw+wOZQedvFdNqBhlPU=
=hFPO
-----END PGP SIGNATURE-----

--yBRPQr3UFnGOqWre--

