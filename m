Return-Path: <linux-i2c+bounces-861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E822818541
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 11:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0871F228B1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACF11548E;
	Tue, 19 Dec 2023 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwvUrXMR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E715480;
	Tue, 19 Dec 2023 10:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADCDC433C7;
	Tue, 19 Dec 2023 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702981398;
	bh=U906BmzuKRafIT3hoeynNyxobv+3tP333JodvO24wAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwvUrXMR3sb/P86n6/Eis5saruFNAW0PQld0MOYhulqVTt+1bbsrykyuJmhqQvyd3
	 PK6CF5A7xrHHOrqTV5T0m8YNmhpB2r7BkXBLUsvN4VY4CtSXYtUeoqGXJO27SXMpfi
	 qUerrHqCjfjHzVIBthyfu+wB4nj9ReYWEAnQDE/5P4OPaz+mkmgmUStPl1uwYzXSio
	 XdkkEZ11J32KgdebAEyMepzEL+hvWoPDyLoVTcWyd3ws+uG77Fp+GZ6J6u4z1IKm2D
	 jAuWAj2xaoxnwX0QVF2ncmVeBPs9NgqxDpAtQVsT/m70Z/K4lmoM8v1BI3B/hVMRbn
	 3xD1Vu3tImAfQ==
Date: Tue, 19 Dec 2023 11:23:14 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
Message-ID: <ZYFvEn0/xxIhGnlT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <ZYBgB3J51hfGQSVX@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KsquU4lTI4LLq+Gd"
Content-Disposition: inline
In-Reply-To: <ZYBgB3J51hfGQSVX@smile.fi.intel.com>


--KsquU4lTI4LLq+Gd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, is there any chance to get this into this (v6.8) cycle?

Sure, due to lots of travels and other issues I am in general very late
with preparing the merge window.

Applied to for-next, thanks!


--KsquU4lTI4LLq+Gd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBbxIACgkQFA3kzBSg
KbbAyxAApJnqXuyNbW9/vaiYuWTzj+560pA14dQFR5UlRWlzKyG0TN77j8QEcfHY
9zHNsvUf/7aO5ifzHUUc31bgPmhz69cI2bKPE6xg9oEQCmONV89knJgs21bbXfxu
z1izbTrlv3sN8/P+PVBHtw0+xohpxWGG5+IstVjNHPtnGTmIKxKtpOzdc7zwEWIi
aWG0UDCaUwEwr51F/KDuWeBZHwDL14QkJ6Jm4pl88u9tJqv1uduLwAufqlR00nsW
c4uGuzJlh/wJOSE11rweyv9K1ZA7HxPsYjQB9qD3esyQ1fIVamJb2C8kxAP1QqIp
3RmDgP4yJrmP3Wlg/eJO9pon+3DdDyLwt5bhRazNIbTLwEa/UCXQBakYsYCp23XA
e2JEkCDFkMqEVhCi+Ac3H/W0JpMmxPeBPb9HyRlhrlpS2t8s9dlyAcI7UQcQrqDb
Mt4cAlJjmi1/HfotY6PsEMOC0nURQR47vBGiP+OV9T2CvU5eBS8g8TAjLJQtLgjn
67bSa6cm1Qoo1zfayCj6+U3ZojSDvRLUAWt3/CAOECOeVozCdSaYoI5k+sEKIhRF
213zIJEMPdFE8rViqVTBa8r/Vr98Fj/izPtomnzkna3oY6NvlbXK5rLFWW3BcqGn
fLkxWO++2xQFtzBd8pPivYBNxfeWsxjkF+Fcdut2DNu5INV8cCc=
=yFh1
-----END PGP SIGNATURE-----

--KsquU4lTI4LLq+Gd--

