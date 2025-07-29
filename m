Return-Path: <linux-i2c+bounces-12063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81360B14A2B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 10:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB4D17DECC
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 08:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572C9284B49;
	Tue, 29 Jul 2025 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPhKK73X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6D28504B;
	Tue, 29 Jul 2025 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778037; cv=none; b=CRFReWE4OlITqRa518YfVLE7eYgGFpf6MbkavvHFZ0Gqn+ovKGzFAmVwIfy6m2i16Rjw/yGZFj1O+853vybRiGfvnMGWPJ8eQP8IKrmBcJjLwrJ+xtz/iRFX9Rw5YpSNgccTdPbnGU9DJ+1YZpoAWZ3V6piGwCqmeud/m6ssUQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778037; c=relaxed/simple;
	bh=mjOpsgFcshv7GmSpkMUvgmy1tViVtwM0LKLBEVbC6JA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBMG6sV0z5LumMBDQ6dXeL6yiEQxdXKLmWUm4BWJnEgdmJG/ZLOnoujOUl1HHfHW09aS5y+xiFh4PUagrj27IxS1A4gaF1YRn8NH308oxXJp33WbGSqY4fEJSB1/JDscWgTNGOFwpqtlomb7dLnqGGFrCZOTtHrfnXmyMxYCtOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPhKK73X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A583BC4CEEF;
	Tue, 29 Jul 2025 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753778035;
	bh=mjOpsgFcshv7GmSpkMUvgmy1tViVtwM0LKLBEVbC6JA=;
	h=Date:From:To:Cc:Subject:From;
	b=qPhKK73X3V5RlUteVB1eTZVdKVWy92va3B5+dthmy2Sz3WVOGcBEuHLuUypFjfEZC
	 6P3rv8u1oaqAwwGIdlXeDKsah7/NP1S9gsV6C/X2+4geER6OjOwhoO4Umrt0NEbhv1
	 SUrj65inxQH3A+IT7nQChoZtlfWa27IIQu12zLBV2oR23F4lEZFWW7Zx03l2LARzMx
	 e50DACiFBlyVhYDyp20ROaJoSnhxBqgMCrUyNdJLQfY7RyybLQIaf7+DPF0qgQp5Lm
	 puHspG7N10qWB/PqNKK/9zTc5G54MKCozEQ8HVT4xc7SzY3skNqVjtu3J4qu9Idpw2
	 f1d3Z3Oo01oYw==
Date: Tue, 29 Jul 2025 10:33:51 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.17-rc1
Message-ID: <aIiHbx_RBSMZ9av7@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfyn2+/kijfYDtfO"
Content-Disposition: inline


--nfyn2+/kijfYDtfO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc1

for you to fetch changes up to 1c24e5fc0c7096e00c202a6a3e0c342c1afb47c2:

  i2c: core: Fix double-free of fwnode in i2c_unregister_device() (2025-07-28 10:41:36 +0200)

----------------------------------------------------------------
i2c-for-6.17-rc1

I2C Core:

- prevent double-free of an fwnode if it is a software node
- use recent helpers instead of custom ACPI or outdated OF ones
- add a more elaborate description of a message flag

I2C Host drivers, part 1:

Cleanups and refactorings:
- lpi2c, riic, st, stm32f7: general improvements
- riic: support more flexible IRQ configurations
- tegra: fix documentation

Improvements:
- lpi2c: improve register polling and add atomic transfer
- imx: use guarded spinlocks

New hardware support:
- Samsung Exynos 2200
- Renesas RZ/T2H (R9A09G077), RZ/N2H (R9A09G087)

DT binding:
- rk3x: enable power domains
- nxp: support clock property

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: acpi: Replace custom code with device_match_acpi_handle()

Emanuele Ghidoli (2):
      i2c: lpi2c: use readl_poll_timeout() for register polling
      i2c: lpi2c: implement xfer_atomic callback

Frank Li (1):
      dt-bindings: i2c: nxp,pnx-i2c: allow clocks property

Hans Zhang (1):
      i2c: tegra: Add missing kernel-doc for dma_dev member

Hans de Goede (1):
      i2c: core: Fix double-free of fwnode in i2c_unregister_device()

I Viswanath (1):
      i2c: Clarify behavior of I2C_M_RD flag

Ivaylo Ivanov (1):
      dt-bindings: i2c: exynos5: add samsung,exynos2200-hsi2c compatible

Jiri Slaby (SUSE) (1):
      i2c: mux: pca954x: Use dev_fwnode()

Jonas Karlman (1):
      dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain

Lad Prabhakar (5):
      dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end
      dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support
      i2c: riic: Pass IRQ desc array as part of OF data
      i2c: riic: Move generic compatible string to end of array
      i2c: riic: Add support for RZ/T2H SoC

Qianfeng Rong (1):
      i2c: st: Use min() to improve code

Troy Mitchell (1):
      i2c: imx: use guard to take spinlock

Wolfram Sang (1):
      Merge tag 'i2c-host-6.17-pt1' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow

Yuesong Li (1):
      i2c: lpi2c: convert to use secs_to_jiffies()

Yumeng Fang (1):
      i2c: stm32f7: Use str_on_off() helper


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (4):
      (Rev.) i2c: core: Fix double-free of fwnode in i2c_unregister_device()
      (Rev.) i2c: riic: Add support for RZ/T2H SoC
      (Rev.) i2c: riic: Move generic compatible string to end of array
      (Rev.) i2c: riic: Pass IRQ desc array as part of OF data

Carlos Song (2):
      (Rev.) i2c: lpi2c: implement xfer_atomic callback
      (Rev.) i2c: lpi2c: use readl_poll_timeout() for register polling

Frank Li (1):
      (Rev.) i2c: imx: use guard to take spinlock

Geert Uytterhoeven (6):
      (Rev.) i2c: riic: Add support for RZ/T2H SoC
      (Rev.) i2c: riic: Move generic compatible string to end of array
      (Rev.) i2c: riic: Pass IRQ desc array as part of OF data
      (Test) i2c: riic: Pass IRQ desc array as part of OF data
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support
      (Rev.) dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: exynos5: add samsung,exynos2200-hsi2c compatible

Patrice Chotard (1):
      (Rev.) i2c: st: Use min() to improve code

Primoz Fiser (2):
      (Test) i2c: lpi2c: implement xfer_atomic callback
      (Test) i2c: lpi2c: use readl_poll_timeout() for register polling

Rob Herring (Arm) (1):
      (Rev.) dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain

Vladimir Zapolskiy (1):
      (Rev.) dt-bindings: i2c: nxp,pnx-i2c: allow clocks property

Wolfram Sang (7):
      (Rev.) i2c: riic: Add support for RZ/T2H SoC
      (Test) i2c: riic: Add support for RZ/T2H SoC
      (Rev.) i2c: riic: Move generic compatible string to end of array
      (Test) i2c: riic: Move generic compatible string to end of array
      (Rev.) i2c: riic: Pass IRQ desc array as part of OF data
      (Test) i2c: riic: Pass IRQ desc array as part of OF data
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support

 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |   1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   3 +
 .../devicetree/bindings/i2c/nxp,pnx-i2c.yaml       |   3 +
 .../devicetree/bindings/i2c/renesas,riic.yaml      | 105 ++++++---
 drivers/i2c/busses/i2c-imx-lpi2c.c                 | 256 ++++++++++++++-------
 drivers/i2c/busses/i2c-imx.c                       |  37 ++-
 drivers/i2c/busses/i2c-riic.c                      |  54 ++++-
 drivers/i2c/busses/i2c-st.c                        |  19 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   3 +-
 drivers/i2c/busses/i2c-tegra.c                     |   1 +
 drivers/i2c/i2c-core-acpi.c                        |   2 +-
 drivers/i2c/i2c-core-base.c                        |   8 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   3 +-
 include/uapi/linux/i2c.h                           |   3 +-
 14 files changed, 333 insertions(+), 165 deletions(-)

--nfyn2+/kijfYDtfO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiIh28ACgkQFA3kzBSg
Kbbz6g/+Lqhq8+mcBRnocS25U+iWI9RFCXcthJxwtCBIKY8ptrJUxDWa9WtrpeWT
bUKct452qTsCXA7Q8epmJTdDqliIXxQtZzRWEVSSsb8d4hdcMPVpyoMZrjrvm4zC
R6KqAf79bJtytNQxmdIHvdqC+TMAAipx4PmxFwmvMp+suJuggMuc229zIdnYAHes
6xWPlOfRLBkGxrNQ4GkdynMrOb9oGSWOdAD4gATMrJ0Hw2GE4d7I4zVluN0+VnQQ
3gwntsrRjv8kjBKN7MmmgzrlDafaFLmK5a6WaNw0LzXsxfHAnoUMpP8o42BN4a9T
F94ZzhTB0zHRpoerZFpyKECVe+n3UZ1I93CC7+He3DUB7CviptRSUWaYV1ml2KvT
7qumuArZaDTE0tWK5PzO7Ale40F7sI5yQRfZ9g3rAXW/UvpqMYg0m8qm7QbhuUeX
58O4T8xTZDPNhvT1topLmEjx8a6f9so4MhuO0tkcqSEd4PXZoazJSa/uo8JqmA62
OWa0iB81WogljaSQqgtpnVUFJwsdGO2hGnuypWS6kSu3ObdQaZ+t6SjHX5D810UP
ry0YV6APe32BX7eEqkCETH3O/ezitFYLTKL3VBP0qz0z7X9uoSP7amQxQywg5K+m
bEKWhfi+dA4aBM6RYOs4aS3o6QS4YaexlKrDwMYznD2SVkAgzeM=
=QW6O
-----END PGP SIGNATURE-----

--nfyn2+/kijfYDtfO--

