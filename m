Return-Path: <linux-i2c+bounces-11850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F30CDAFA029
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 15:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B2687A7AF9
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 13:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF2E253931;
	Sat,  5 Jul 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4RhUIsE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980A13DB9F;
	Sat,  5 Jul 2025 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720703; cv=none; b=TrGocNjvOPwD9dQsfjdi0an709HLSOebgx3Uhlvvt//bBCP5THVCjNXUld84sTLwrX9DRg/GT7lLBknUz1CfaSSj/LJ0+eqn+5yYGy8AfohALcyjMn+4l8D4Tog5UmK8UztyTo5bGtR7hRw8C/5qKEj7Wub4ntKfe1x9FzkdzmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720703; c=relaxed/simple;
	bh=S/+SPECrJ9hwBt015R6VVTYLl2CaM/EtJtugv5y0JMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVNdP5+86HZwz8GMyTXWRAtuDLEJRP6OlrmM7F+vu3COlY8bkdVj7wWpXckm2WPzdRNols+K81Id0eMGWFQ0w+Do59si1c+geiioTm8IGBeecZ2HEIGAJf0uaM7NAlQ7LE6jLQ4AdT0RYrxi29Ot6orx5b1K8Qtj2QpiRoF88fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4RhUIsE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B79C4CEE7;
	Sat,  5 Jul 2025 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751720702;
	bh=S/+SPECrJ9hwBt015R6VVTYLl2CaM/EtJtugv5y0JMs=;
	h=Date:From:To:Cc:Subject:From;
	b=k4RhUIsEjqOm0jhpDowOoynm7Qaf2ijC30wor27l6OeG6/dHtGxjPlBDh6UoaZIf+
	 x1lfDWnDc5FPMK0o7rQE+p/5Ocy8yYZl1bFTzEr1dvpk8oTZJYBLSJiYhGj/5QpKx5
	 QwryHFYY7+/OaqVjcVZMY3CAmSCG4BPlm7RbI/TRhMvP0MoSBVWNjt5Aso1p8uC3p7
	 EtO6h0WWsrVwc8l/dPhQeM50hjM0BaOcC8nG3v2g8SIzuj8+dmQ202Lq8yQdmIqDWU
	 P9rpXMCMoonY2JtuR1zt8/l/VC9rKDET5XQsoiMP00g6FBbqzfp4kvAwrlSqAOmE0j
	 G1jtGSkC8SCnw==
Date: Sat, 5 Jul 2025 15:04:59 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.16-rc5
Message-ID: <aGki-9QTCbO-H4zU@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVsUToTKcWfmnEfn"
Content-Disposition: inline


--SVsUToTKcWfmnEfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc5

for you to fetch changes up to 534eb6de621954cde61c910dbeb8fb1700a0a0d6:

  Merge tag 'i2c-host-fixes-6.16-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-07-04 18:31:22 +0200)

----------------------------------------------------------------
i2c-for-6.16-rc5

designware: initialise msg_write_idx during transfer
microchip: check return value from core xfer call
realtek: add 'reg' property constraint to the device tree

----------------------------------------------------------------
Conor Dooley (1):
      i2c: microchip-core: re-fix fake detections w/ i2cdetect

Krzysztof Kozlowski (1):
      dt-bindings: i2c: realtek,rtl9301: Fix missing 'reg' constraint

Michael J. Ruhl (1):
      i2c/designware: Fix an initialization issue

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.16-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c/designware: Fix an initialization issue

 Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml | 3 ++-
 drivers/i2c/busses/i2c-designware-master.c                     | 1 +
 drivers/i2c/busses/i2c-microchip-corei2c.c                     | 6 +++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

--SVsUToTKcWfmnEfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhpIvsACgkQFA3kzBSg
KbYjVhAAhSKwTpo49dx/uMl33+C2670EwkdvoSe4hQ2bvisIhqJ61WKdwncmBehi
90b4BHIu3DcDQHnbVVFjY2emTPmQkFQx1g0DPRMG8qs7vVBgV78K9h4jU18m5Om5
h0DelSFwIKVAv70s7LayAfo4W+D4m+eLavJWATpmqR05FtIrYJIfIGxY++q6ksxY
p8gkYHh+HTD1X6VY2Ioyf1tACdbH1bCu3XY2a2BLYlteR4msU3aFIhAjOvNPaXuH
Mg4NpNvMVkjh6p+XlCp7Mx6SdS5Bl/ez8mTR6h8yDjIuOb5p1Qb0GYhn4u7TsABS
a9GYcOrCPQtC0DNTBaYzmIr/7sVE/bT1pgaI9Mibiy3FPXZDeet9ZA2FZcNWV5P4
lAA/JRhqg3Dzw7e9n0fl3CwYwiC0bu10YlF1qu9urPqX9He8DB5ag3v+WrAOZFDr
IKBkSuMLReF4RFWRqBRJ5JHqWwyX76sgKmS3ZC2VKD6GpMVvF4ruVWoZT09SdMdW
ssJTuQBsRGaCzI+Ky0bqRSEg56V+UVOhei/r6hLn9NaXVyqSeJKFj6qtVFjXN7/C
yWr9yABC0YQkG6QtKtd4FM1DSnLxvZKRXgV/q89q2tl8RKRqiyC06W8gvjZY8fgY
aZUKL69cIz+p29P3xN80zkVaEBSc+XhIryOlZD5KozxaQ+YUqUg=
=TG+8
-----END PGP SIGNATURE-----

--SVsUToTKcWfmnEfn--

