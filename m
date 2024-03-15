Return-Path: <linux-i2c+bounces-2364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39E887CB8C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DC14B2299B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5814618EB1;
	Fri, 15 Mar 2024 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPs6dAoi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1184118EA5;
	Fri, 15 Mar 2024 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710499144; cv=none; b=eiPsr7hgPAOptgVJ4WTJJ93srQzaI9qXk9nt0Yz3LD0kQgfuFTjrfcTyDQitqmuAMZkqh9ATI6eWcRFiMg3CLXl2Bd/rAzONB/a/QIu5iBIL8k+Z1SWjUrMD9DAh39PWTnKbATCVyahGycoUjK6EDAkM8A7Swe9NYPs+vHSXT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710499144; c=relaxed/simple;
	bh=MBQse9dmC+iGixt2PNzSLK1zBPbCDEJTv1HX2QRB35o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/sx6eL/4PrSR8eHEMOCE8XEjDUyELBZV10ijpKrzJMSapTW7SxFWYoBgMtr9XDaDt621xt6LEN8mXfUxQJWE5o8uyRxzhF/YhsSDF7oOMjh2t706uXw12DnyISFBDUqjdFuo8fEIscyrNZRpVMIo8MeRLpIgVbKCfgjsMZ4DOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPs6dAoi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39D8C433C7;
	Fri, 15 Mar 2024 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710499143;
	bh=MBQse9dmC+iGixt2PNzSLK1zBPbCDEJTv1HX2QRB35o=;
	h=Date:From:To:Cc:Subject:From;
	b=hPs6dAoipiUjbDq3hLX2som3R3tgem+FLmNTz/1JDGKmZc6R+x+rCmiuX9keTiLJ+
	 qwMrmk2K6g+i7lAN/Aycmc5ql9+X40IF0fYEvSOOMexWe44ypGnBOK6/o4KTrRkP6O
	 ZwkvQiOxJ8Kux5ZMGlcuriQep3XROYICq6r5LekEueXPxOtl2PDd7YCMsvFTyQbqQA
	 Sh4FfTCSFXtseTUbitAL30tei/L8sLx5aG8ffBtqcHkrXlktgWZITdSJZWa5S7E78A
	 063bWXqtUh80oxMKSgvpnblyiB5FGDXcdZyF2oA/5cauIqqEi+W/SjNpkaT6M1P2Kc
	 r3iACYVeNcHJQ==
Date: Fri, 15 Mar 2024 11:39:00 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.9-rc1
Message-ID: <ZfQlREW9HGwKqvLE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lt3MCLn0VjeNbNWF"
Content-Disposition: inline


--lt3MCLn0VjeNbNWF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.9-rc1

for you to fetch changes up to 91962feb9502bb98f830d90fe197653e6f4e84a4:

  Merge tag 'i2c-host-6.9' of git://git.kernel.org/pub/scm/linux/kernel/git=
/andi.shyti/linux into i2c/for-mergewindow (2024-03-12 08:56:06 +0100)

----------------------------------------------------------------
Minor changes to the I2C core. Most changes are in the drivers section
and are described by Andi in the merge commit

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx-lpi2c: add generic GPIO recovery for LPI2C

Devyn Liu (2):
      i2c: hisi: Optimized the value setting of maxwrite limit to fifo dept=
h - 1
      i2c: hisi: Add clearing tx aempty interrupt operation

Esben Haabendal (1):
      i2c: imx: move to generic GPIO recovery

Geert Uytterhoeven (3):
      i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile AG5 to new freq=
uency calculation
      dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0 support
      i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4

Heiner Kallweit (9):
      i2c: i801: Replace magic value with constant in dmi_check_onboard_dev=
ices
      i2c: i801: Remove unused argument from tco functions
      i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
      i2c: i801: Add helper i801_check_and_clear_pec_error
      i2c: i801: Split i801_block_transaction
      i2c: i801: Add SMBUS_LEN_SENTINEL
      i2c: i801: Add helper i801_get_block_len
      i2c: smbus: Prepare i2c_register_spd for usage on muxed segments
      Documentation: i2c: Document that client auto-detection is a legacy m=
echanism

Hsin-Yu.Chen (1):
      i2c: remove redundant condition

Jarkko Nikula (6):
      i2c: designware: Uniform initialization flow for polling mode
      i2c: designware: Do not enable interrupts shortly in polling mode
      i2c: designware: Use accessors to DW_IC_INTR_MASK register
      i2c: designware: Move interrupt handling functions before i2c_dw_xfer=
()
      i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
      i2c: designware: Implement generic polling mode code for Wangxun 10Gb=
 NIC

Ji Sheng Teoh (1):
      i2c: cadence: Add system suspend and resume PM support

Patrick Rudolph (2):
      dt-bindings: i2c: pca954x: Add custom properties for MAX7357
      i2c: muxes: pca954x: Enable features on MAX7357

Peng Fan (1):
      dt-bindings: i2c: imx-lpi2c: add i.MX95 LPI2C

Rand Deeb (1):
      i2c: Remove redundant comparison in npcm_i2c_reg_slave

Ricardo B. Marliere (1):
      i2c: constify the struct device_type usage

Uwe Kleine-K=C3=B6nig (1):
      i2c: sprd: Convert to platform remove callback returning void

Varshini Rajendran (1):
      dt-bindings: i2c: at91: Add sam9x7 compatible string

Wolfram Sang (4):
      dt-bindings: i2c: mpc: use proper binding for transfer timeouts
      i2c: mpc: use proper binding for transfer timeouts
      i2c: mpc: remove outdated macro
      Merge tag 'i2c-host-6.9' of git://git.kernel.org/pub/scm/linux/kernel=
/git/andi.shyti/linux into i2c/for-mergewindow


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (12):
      (Rev.) i2c: remove redundant condition
      (Rev.) i2c: cadence: Add system suspend and resume PM support
      (Rev.) i2c: i801: Add helper i801_get_block_len
      (Rev.) i2c: i801: Add SMBUS_LEN_SENTINEL
      (Rev.) i2c: i801: Split i801_block_transaction
      (Rev.) i2c: i801: Add helper i801_check_and_clear_pec_error
      (Rev.) i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_IC=
H4
      (Rev.) i2c: hisi: Add clearing tx aempty interrupt operation
      (Rev.) i2c: hisi: Optimized the value setting of maxwrite limit to fi=
fo depth - 1
      (Rev.) i2c: i801: Remove unused argument from tco functions
      (Rev.) i2c: i801: Replace magic value with constant in dmi_check_onbo=
ard_devices
      (Rev.) i2c: muxes: pca954x: Enable features on MAX7357

Chris Packham (6):
      (Rev.) i2c: mpc: remove outdated macro
      (Test) i2c: mpc: remove outdated macro
      (Rev.) i2c: mpc: use proper binding for transfer timeouts
      (Test) i2c: mpc: use proper binding for transfer timeouts
      (Rev.) dt-bindings: i2c: mpc: use proper binding for transfer timeouts
      (Test) dt-bindings: i2c: mpc: use proper binding for transfer timeouts

Clark Wang (1):
      (Rev.) i2c: imx-lpi2c: add generic GPIO recovery for LPI2C

Dong Aisheng (1):
      (Rev.) i2c: imx-lpi2c: add generic GPIO recovery for LPI2C

Jiawen Wu (6):
      (Test) i2c: designware: Implement generic polling mode code for Wangx=
un 10Gb NIC
      (Test) i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
      (Test) i2c: designware: Move interrupt handling functions before i2c_=
dw_xfer()
      (Test) i2c: designware: Use accessors to DW_IC_INTR_MASK register
      (Test) i2c: designware: Do not enable interrupts shortly in polling m=
ode
      (Test) i2c: designware: Uniform initialization flow for polling mode

Rob Herring (1):
      (Rev.) dt-bindings: i2c: pca954x: Add custom properties for MAX7357

Wolfram Sang (3):
      (Rev.) i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
      (Rev.) i2c: Remove redundant comparison in npcm_i2c_reg_slave
      (Rev.) i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile AG5 to n=
ew frequency calculation

Yicong Yang (2):
      (Rev.) i2c: hisi: Add clearing tx aempty interrupt operation
      (Rev.) i2c: hisi: Optimized the value setting of maxwrite limit to fi=
fo depth - 1

 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |   4 +-
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |   1 +
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml |   2 +-
 .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml   |  30 ++
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |   1 +
 Documentation/i2c/writing-clients.rst              |  32 +-
 drivers/i2c/busses/Kconfig                         |   2 +-
 drivers/i2c/busses/i2c-cadence.c                   |  33 ++
 drivers/i2c/busses/i2c-designware-common.c         |   2 +-
 drivers/i2c/busses/i2c-designware-core.h           |  23 +-
 drivers/i2c/busses/i2c-designware-master.c         | 424 +++++++++--------=
----
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   2 +-
 drivers/i2c/busses/i2c-hisi.c                      |  13 +-
 drivers/i2c/busses/i2c-i801.c                      | 224 +++++------
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  27 ++
 drivers/i2c/busses/i2c-imx.c                       |  62 +--
 drivers/i2c/busses/i2c-mpc.c                       |  16 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   |   3 -
 drivers/i2c/busses/i2c-sh_mobile.c                 |  27 +-
 drivers/i2c/busses/i2c-sprd.c                      |   6 +-
 drivers/i2c/i2c-core-base.c                        |   4 +-
 drivers/i2c/i2c-smbus.c                            |  19 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |  43 ++-
 include/linux/i2c.h                                |   6 +-
 25 files changed, 522 insertions(+), 486 deletions(-)

--lt3MCLn0VjeNbNWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX0JUQACgkQFA3kzBSg
KbZj+Q//ZljpeVeJF8U0UxHMaCQEb9GjPFPk0H2yu2ndoXNXNHSSINBFsRsLI9k6
eAc/5BbsefLUEdfINca9OSlMZt4t6S4dkt/3JTaX6LxsAXvZPmTTjSmqBH2kaQ/k
+SCQLUxQvFuJgvjp7KA5TOzdMJatKmrekfeM1jnWNLnd5gQN9ayiq4qX75lGQguF
5qHDi0lILJ+XuZh5TDXMAec/T3cpcDcT73RGWUscQY3teNBULw3hGuOEPDzQvKlg
VrCJNcK+uO1agM3XD6RnNnisu4RIUQbAOTytddYdOqWjBm9K5ndbG66gbPGgQGZH
iDZOjaWmb/ECVNuKDWtmB2isrxPmDvpAYLYOsCrTtgTvNVKHeztmSKqmmwI0my54
WAkd3lSKf9O6ZKHq/6mbo3mJyUcRzADWDaYTh8ygO2Fjv9XBth7wAhlHbvKp3Eg0
kqWx1iPpHzPlNFORlQteIKmeaiLqR7b+ovXR/MB0Xl7X1t4P72GNK6G/7OosgQ75
W6Q++B/kIvlsaextGzUmaTNW2EgS0BnnezPVxrI774eApJQOsDuXJNudTA0g5YJn
Rs4x9zdAeKIEw4DWZyntOAIyD9DIZMiVktj5ELPUpWR1q+bqfnzbvMHHtYMrTu6Q
BhkQVadKO7I/H/0oOwDvh1EZ0WUP1cAW+eoOQEWCAzlWU8Od1kE=
=SOaT
-----END PGP SIGNATURE-----

--lt3MCLn0VjeNbNWF--

