Return-Path: <linux-i2c+bounces-1561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E808448FD
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 21:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1ED286B2E
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 20:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7BE171D0;
	Wed, 31 Jan 2024 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dYa6uv7d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8678B38DDE
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706733302; cv=none; b=ePGBWdyFuzMOU61VSvz0Qa/uSk4U4ud98lg87EIp0JQRT9zjT1S9IAgIrcGKuHwd8R8RR0EFbhF9f9EI4e1R3UIWxKbpa2ic95P78Riej5ypacDIXzUQQx0Q4VfDi1eMQw7g3nyzxaqqdCeZf0PghjITg+WNYmS94ExnImJYA0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706733302; c=relaxed/simple;
	bh=55r4DJdVPqJSTlDSqPP1f6IOgEgWDBWfOU61w5rSsYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPoziPhkrtlZICGQBawHkfuajlBdy5d7w5G4Lt9vh/0jZxOFgh2bVjd7sLwclhFsNItkLeuw7KTqPZlZ7M7Mi6XXuQywtsBWgelqD1IuxsZ4L3YO+UXrg6A4QVgrz2MtO7Zd0unpR+XYkVVLSAbYm+59fSj/EGldOpO+5evdl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dYa6uv7d; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=arZw
	p/8R5WW54rU3GpYm/oAt4moxKmQe1MlLvVQEJwU=; b=dYa6uv7d2DOdy3YPfB6e
	bzR5HLr3uJW5H7UuGeqyGZk9LLiilGJ4aU4ue2XRuqCTUPLySvnsvUycMEfwMrU3
	iqktLGUllwrkfGFq6W7hJpUNhmyqbe3K3tapPLwDClXxO+gG64gBg9x4WjKpOiTV
	B0hXnD5Mdk1L+TfMhyP8q6EhFiD7g+kqLY+GF6TmeAEb0gR5GLVfwgqEAjViQipf
	BIBJHqaM9ApC21HfqTf5fY83wluZtL5K6lqjnjqDK9zUNbPFUHbSUMPclKYZjBxr
	L2xbdM6ZJTNztxELhcCdh1tYTkaADEmcpvuI9Cq5r7Z3j8iuJoSSQeA8YW/tHRMb
	CA==
Received: (qmail 3320434 invoked from network); 31 Jan 2024 21:34:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2024 21:34:57 +0100
X-UD-Smtp-Session: l3s3148p1@rsPoz0MQ9t1ehhtJ
Date: Wed, 31 Jan 2024 21:34:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH v2] i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile
 AG5 to new frequency calculation
Message-ID: <Zbqu8K3gBth83YBV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-sh@vger.kernel.org
References: <93f3b97c20164510ed80928500a8d443d7e23adb.1706717315.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vM70xDzKZMWzvl6C"
Content-Disposition: inline
In-Reply-To: <93f3b97c20164510ed80928500a8d443d7e23adb.1706717315.git.geert+renesas@glider.be>


--vM70xDzKZMWzvl6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 05:09:30PM +0100, Geert Uytterhoeven wrote:
> Switch the R-Mobile A1, R-Mobile APE6, and SH-Mobile AG5 SoCs to the new
> frequency calculation formula, to (a) avoid running the I2C bus too fast,
> and (b) bring the low/high ratio closer to the recommended ratio 5/4.
>=20
> As this makes fast_clock_dt_config and v2_freq_calc_dt_config identical,
> merge them into a single fast_clock_dt_config.
>=20
> Legacy SH users (sh7343, sh7366, and sh772[234]) are left alone, and
> still use the old formula.
>=20
> Measurement results on R-Mobile APE6 and SH-Mobile AG5 (fck=3D104 MHz,
> clks_per_count=3D2):
>   100 kHz: 106 kHz LH=3D1.12 before, 99.6 kHz L/H=3D1.22 after
>   400 kHz: 384 kHz LH=3D1.67 before, 392 kHz L/H=3D1.27 after
>=20
> Measurement results on R-Mobile A1 (fck=3D49.5 MHz, clks_per_count=3D1):
>   100 kHz: 106 kHz L/H=3D1.09 before, 99.6 kHz L/H=3D1.20 after
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vM70xDzKZMWzvl6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW6ruwACgkQFA3kzBSg
KbZzkA//WYXKNuGbeFivJqiXWF/FyXgO3RQ0bn/JoD+OAptNuFSzZeDMnot/B/40
/iEu1Z8e6NKepuCe44TA/pfbcfNDx7xjXE0DFPcXAciN6B4yIT3yJ1QNfZq5L5tW
KF0UoRizepEBWcKmVXQXyCun4XyEDgGPqEw7fvqz/HKOVbhfNm3sg9K5Y6mXm7pe
lz7zTlm5i6Gb716XUtY2ZsG3pnSfzDLFPjGE+QE2N5+YboGwQu96kcvD5jgiO5TU
chSIxIkQUfAcRb9QMV3IEn4XnSvgi+NP0e/D/u4ABWFnGc4QcYgCxoAp/+F2fv1t
GYLN++qLrGBBwavfrtNiie7GHIZw+g9OY2ZTv22hq2/c1Dwxf2Oe1AzCQA/qivv/
W21abJnseqfCLZ6I8UMA6mjGaGm9LdPWZzaSzDedPCFrMe7U62OgLX8fVv+Xuw0F
VuVFt6TRAhEqvnbqC+5aCrRR8MWpb8jcLxMMTNzBsPBaXByY/NOi+EOVjan0eBGv
8wab5ZsJB44w5ibh6Vop1kWjBudjFrIMFjhEt9lGX8atpskis3oFUXylhxOcT/FZ
CSPngyvLDIxlYvkcGH+9Rn3htE4YqhBu1/J9W9SWl9Ek1mZvcx6JXIDE2s3Y7E3c
EC/wEhvdS7IrBfXOsE8Acaaq3RBdC0MiE98dbceG9VwRuOwrcO4=
=czUo
-----END PGP SIGNATURE-----

--vM70xDzKZMWzvl6C--

