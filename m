Return-Path: <linux-i2c+bounces-9146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FCA1879C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 23:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358A63A49A1
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 22:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4451E1F76D3;
	Tue, 21 Jan 2025 22:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcUyvLmk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A61B041B;
	Tue, 21 Jan 2025 22:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737497687; cv=none; b=YAVP9bQI/xUEtraeoPYr2gdsSlcwIeXHG/1ZYBLItsHPouoFweOnkZWKmgePyiCnlcAWy1poGddc2AarcSYFZIX4KxDrAk+yyeJelu0CvEQGDwkb6w3RzZ3ReP6onC+kCLm+fsrEsLJNf5qxmpsJlQd+8eNCKnyE4YyDL5mOrN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737497687; c=relaxed/simple;
	bh=XbNIxiQ1d3o5cq3LLQ8Fz6YdMgME3quh37lA7t4gZ+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XXAkQThNff9pBoWZgycF9Oa92sXGgNy/mpZEawjxlVA6caadXhTipbREFgQUbHCVZyWwqGDVCs9OnnQi95MZSEdAv4q+xxYd1dMD2KZp1ikADgrFc/RPQuoG4in5OgsjgyxVbbIjPxPaNgyvcLMmrCh+BD970sJxXREw7vQLJBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcUyvLmk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882D6C4CEDF;
	Tue, 21 Jan 2025 22:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737497686;
	bh=XbNIxiQ1d3o5cq3LLQ8Fz6YdMgME3quh37lA7t4gZ+E=;
	h=Date:From:To:Cc:Subject:From;
	b=tcUyvLmkhSt8FaYKod7OAJC7f+ONrR0HEINwhFzwF0HFAEC5cg+7Kn/X/jFvLlg5R
	 M9oQF/OINkw0WzRqHxKrw7tHxA6Ms8nmAljI4RaQLq9sQ0AkdzwtnvlnVsy+O/rg+1
	 KFE9+i6VwDgAsTe6QHoG78CjIKd6j+qKzia+fBoaIVQk1J6Z0N+qvR6b/rZxGF1ILR
	 Cs00q/Ko38PaoFe8VgRcU1BLol++zyKrf3houEdBD7BFaAjbwEiryv3anWZTbElXXl
	 H6bv6oWcukzniEJlc4t1oQoHucJex7VgQJAOzYfBYbNDq7ERFE6iRsj6khNFw6FM5a
	 3yMZjBH083oww==
Date: Tue, 21 Jan 2025 23:14:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc1
Message-ID: <Z5AcUmwke1z4ZI4l@ninjato>
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
	protocol="application/pgp-signature"; boundary="9GSCKybAnQQ9OoPF"
Content-Disposition: inline


--9GSCKybAnQQ9OoPF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.14-rc1

for you to fetch changes up to 27c3f0e61f19d2306527406cad233d5f5915ca1e:

  i2c: add kdoc for the new debugfs entry of clients (2025-01-15 22:04:06 +=
0100)

----------------------------------------------------------------
i2c-for-6.14-rc1

Core:

- list-based mechanisms for handling auto-detected and userspace created
  clients are replaced with a flag-based approach. The resulting code is
  much simpler as well as the locking.

- i2c clients now get a default debugfs dir managed by the I2C core.
  Drivers don't have to maintain their own directory anymore.

Drivers:

- xiic gains atomic_transfer support
- imx-lpi2c gains DMA and target mode support
- riic gets a collection of cleanups
- npcm gets a better timeout handling and more precise frequency setups
- davinci loses the unused platform_data

The rest is regular driver updates and improvements.

AT24:

- add new compatibles for at24 variants from Giantec and Puya
  Semiconductor (together with a new vendor prefix)

----------------------------------------------------------------
Andi Shyti (3):
      i2c: nomadik: Enable compile testing for the Nomadik driver
      i2c: qcom-geni: Use dev_err_probe in the probe function
      i2c: qcom-geni: Simplify error handling in probe function

Atharva Tiwari (2):
      i2c: amd756: Fix endianness handling for word data
      i2c: amd756: Remove superfluous TODO

Bartosz Golaszewski (3):
      i2c: davinci: kill platform data
      i2c: davinci: order includes alphabetically
      i2c: davinci: use generic device property accessors

Biju Das (1):
      dt-bindings: i2c: renesas,riic: Document the R9A09G047 support

Bryan O'Donoghue (1):
      dt-bindings: i2c: qcom-cci: Document x1e80100 compatible

Carlos Song (7):
      i2c: imx: fix divide by zero warning
      i2c: imx: make controller available until system suspend_noirq() and =
=66rom resume_noirq()
      i2c: imx: switch different pinctrl state in different system power st=
atus
      i2c: imx: support DMA defer probing
      i2c: imx-lpi2c: add eDMA mode support for LPI2C
      i2c: imx-lpi2c: add target mode support
      i2c: imx-lpi2c: make controller available until the system enters sus=
pend_noirq() and from resume_noirq().

Charles Boyer (1):
      i2c: npcm: Enable slave in eob interrupt

Chen Ni (1):
      i2c: isch: Convert comma to semicolon

Geert Uytterhoeven (1):
      i2c: I2C_BRCMSTB should not default to y when compile-testing

Heiner Kallweit (4):
      ALSA: ppc: Remove i2c client removal hack
      i2c: Replace list-based mechanism for handling auto-detected clients
      i2c: Replace list-based mechanism for handling userspace-created clie=
nts
      i2c: core: Allocate temp client on the stack in i2c_detect

Ivaylo Ivanov (2):
      dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
      i2c: exynos5: Add support for Exynos8895 SoC

Lad Prabhakar (9):
      i2c: riic: Introduce a separate variable for IRQ
      i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
      i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      i2c: riic: Use BIT macro consistently
      i2c: riic: Use GENMASK() macro for bitmask definitions
      i2c: riic: Make use of devres helper to request deasserted reset line
      i2c: riic: Mark riic_irqs array as const
      i2c: riic: Use predefined macro and simplify clock tick calculation
      i2c: riic: Add `riic_bus_barrier()` to check bus availability

Luca Weiss (3):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128F
      dt-bindings: vendor-prefixes: Add Puya Semiconductor (Shanghai) Co., =
Ltd.
      dt-bindings: eeprom: at24: Add compatible for Puya P24C256C

Manikanta Guntupalli (2):
      i2c: xiic: Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_res=
ume to facilitate atomic mode
      i2c: xiic: Add atomic transfer support

Patrick H=C3=B6hn (1):
      i2c: i801: Add lis3lv02d for Dell Precision M6800

Philipp Stanner (1):
      i2c: i801: Remove unnecessary PCI function call

Randolph Ha (1):
      i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz

Thomas Wei=C3=9Fschuh (1):
      i2c: slave-eeprom: Constify 'struct bin_attribute'

Tyrone Ting (3):
      i2c: npcm: Modify timeout evaluation mechanism
      i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
      i2c: npcm: use i2c frequency table

Uwe Kleine-K=C3=B6nig (1):
      i2c: designware: Actually make use of the I2C_DW_COMMON and I2C_DW sy=
mbol namespaces

Wolfram Sang (6):
      i2c: keba: drop check because i2c_unregister_device() is NULL safe
      Merge branch 'i2c/i2c-host' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/andi.shyti/linux into i2c/for-mergewindow
      Revert "i2c: amd756: Fix endianness handling for word data"
      Merge tag 'at24-updates-for-v6.14-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      i2c: add core-managed per-client directory in debugfs
      i2c: add kdoc for the new debugfs entry of clients


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: davinci: use generic device property accessors
      (Rev.) i2c: davinci: order includes alphabetically

Andy Shevchenko (9):
      (Rev.) i2c: riic: Add `riic_bus_barrier()` to check bus availability
      (Rev.) i2c: riic: Use predefined macro and simplify clock tick calcul=
ation
      (Rev.) i2c: riic: Mark riic_irqs array as const
      (Rev.) i2c: riic: Make use of devres helper to request deasserted res=
et line
      (Rev.) i2c: riic: Use GENMASK() macro for bitmask definitions
      (Rev.) i2c: riic: Use BIT macro consistently
      (Rev.) i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      (Rev.) i2c: riic: Use dev_err_probe in probe and riic_init_hw functio=
ns
      (Rev.) i2c: riic: Introduce a separate variable for IRQ

Claudiu Beznea (14):
      (Test) i2c: riic: Add `riic_bus_barrier()` to check bus availability
      (Rev.) i2c: riic: Add `riic_bus_barrier()` to check bus availability
      (Test) i2c: riic: Mark riic_irqs array as const
      (Rev.) i2c: riic: Mark riic_irqs array as const
      (Test) i2c: riic: Make use of devres helper to request deasserted res=
et line
      (Rev.) i2c: riic: Make use of devres helper to request deasserted res=
et line
      (Test) i2c: riic: Use GENMASK() macro for bitmask definitions
      (Rev.) i2c: riic: Use GENMASK() macro for bitmask definitions
      (Test) i2c: riic: Use BIT macro consistently
      (Rev.) i2c: riic: Use BIT macro consistently
      (Test) i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      (Rev.) i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      (Test) i2c: riic: Use dev_err_probe in probe and riic_init_hw functio=
ns
      (Rev.) i2c: riic: Use dev_err_probe in probe and riic_init_hw functio=
ns

Frank Li (3):
      (Rev.) i2c: imx: switch different pinctrl state in different system p=
ower status
      (Rev.) i2c: imx: make controller available until system suspend_noirq=
() and from resume_noirq()
      (Rev.) i2c: imx: fix divide by zero warning

Geert Uytterhoeven (10):
      (Rev.) i2c: riic: Add `riic_bus_barrier()` to check bus availability
      (Rev.) i2c: riic: Use predefined macro and simplify clock tick calcul=
ation
      (Rev.) i2c: riic: Mark riic_irqs array as const
      (Rev.) i2c: riic: Make use of devres helper to request deasserted res=
et line
      (Rev.) i2c: riic: Use GENMASK() macro for bitmask definitions
      (Rev.) i2c: riic: Use BIT macro consistently
      (Rev.) i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      (Rev.) i2c: riic: Use dev_err_probe in probe and riic_init_hw functio=
ns
      (Rev.) i2c: riic: Introduce a separate variable for IRQ
      (Rev.) dt-bindings: i2c: renesas,riic: Document the R9A09G047 support

Guenter Roeck (1):
      (Rev.) i2c: add core-managed per-client directory in debugfs

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom-cci: Document x1e80100 compatible
      (Rev.) dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compat=
ible

Mika Westerberg (1):
      (Rev.) i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz

Takashi Iwai (1):
      (Rev.) ALSA: ppc: Remove i2c client removal hack

Tali Perry (4):
      (Rev.) i2c: npcm: Enable slave in eob interrupt
      (Rev.) i2c: npcm: use i2c frequency table
      (Rev.) i2c: npcm: Assign client address earlier for `i2c_recover_bus(=
)`
      (Rev.) i2c: npcm: Modify timeout evaluation mechanism

Vladimir Zapolskiy (2):
      (Rev.) i2c: qcom-geni: Simplify error handling in probe function
      (Rev.) i2c: qcom-geni: Use dev_err_probe in the probe function

Wolfram Sang (18):
      (Rev.) i2c: riic: Add `riic_bus_barrier()` to check bus availability
      (Test) i2c: riic: Add `riic_bus_barrier()` to check bus availability
      (Test) i2c: riic: Use predefined macro and simplify clock tick calcul=
ation
      (Rev.) i2c: riic: Use predefined macro and simplify clock tick calcul=
ation
      (Test) i2c: riic: Mark riic_irqs array as const
      (Rev.) i2c: riic: Mark riic_irqs array as const
      (Test) i2c: riic: Make use of devres helper to request deasserted res=
et line
      (Rev.) i2c: riic: Make use of devres helper to request deasserted res=
et line
      (Rev.) i2c: riic: Use GENMASK() macro for bitmask definitions
      (Test) i2c: riic: Use GENMASK() macro for bitmask definitions
      (Rev.) i2c: riic: Use BIT macro consistently
      (Test) i2c: riic: Use BIT macro consistently
      (Rev.) i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      (Test) i2c: riic: Use local `dev` pointer in `dev_err_probe()`
      (Rev.) i2c: riic: Use dev_err_probe in probe and riic_init_hw functio=
ns
      (Test) i2c: riic: Use dev_err_probe in probe and riic_init_hw functio=
ns
      (Rev.) i2c: riic: Introduce a separate variable for IRQ
      (Test) i2c: riic: Introduce a separate variable for IRQ

 Documentation/devicetree/bindings/eeprom/at24.yaml |   5 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |   1 +
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   5 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/i2c/busses/Kconfig                         |   4 +-
 drivers/i2c/busses/i2c-amd756.c                    |   4 +-
 drivers/i2c/busses/i2c-davinci.c                   | 112 +--
 drivers/i2c/busses/i2c-designware-common.c         |   5 +-
 drivers/i2c/busses/i2c-designware-master.c         |   5 +-
 drivers/i2c/busses/i2c-designware-slave.c          |   5 +-
 drivers/i2c/busses/i2c-exynos5.c                   |  35 +-
 drivers/i2c/busses/i2c-i801.c                      |   8 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 | 811 +++++++++++++++++=
+++-
 drivers/i2c/busses/i2c-imx.c                       |  99 ++-
 drivers/i2c/busses/i2c-isch.c                      |   6 +-
 drivers/i2c/busses/i2c-keba.c                      |   8 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   | 427 ++++++++---
 drivers/i2c/busses/i2c-qcom-geni.c                 |  56 +-
 drivers/i2c/busses/i2c-riic.c                      | 134 ++--
 drivers/i2c/busses/i2c-xiic.c                      | 281 +++++--
 drivers/i2c/i2c-core-acpi.c                        |  22 +
 drivers/i2c/i2c-core-base.c                        | 130 ++--
 drivers/i2c/i2c-slave-eeprom.c                     |   8 +-
 include/linux/i2c.h                                |  13 +-
 include/linux/platform_data/i2c-davinci.h          |  26 -
 sound/ppc/keywest.c                                |   7 +-
 27 files changed, 1714 insertions(+), 507 deletions(-)
 delete mode 100644 include/linux/platform_data/i2c-davinci.h

--9GSCKybAnQQ9OoPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeQHFIACgkQFA3kzBSg
KbZguA//cympjMNowB9eSPMS3vzO9wda2r4abD7/pKJ406Azbljjq2MvTggWpmqb
RXMjcBiB1IVz7xhXtU2uMyqOMlboAtgezRLi6AwcdI0TeOYzyeMdR9MIjXtes1IW
3YqbheCd0ZIfCxNhSczAhEWYuZMn8S9VEFoi2ZB9QD5+crRBUdA39vQlmPc4O0BZ
Lf0qyF1DDAdr91Dy14xwIx89UgIABilvxQ4zYRYV/0okkIjhWij1r40paoGtpA+L
KSDKIMRlP9ygH4dW6xlngk1/6CilidTgNdabzfnrkt8KLt4rnzCKKScMCNzpPx67
uvi7rnMYIY5rIMIh0MhwNDUBxGk5fEk8Rtbi5zr60oEhhGPqCqJZ98EG+2jn3Clg
DuMNSRxMFZy1qsq3753zJrRm6fMDTAjPcVBXVXWt/TRwFbvHb//zcMdsjSQ+LNds
YwxkwKUfzAYM7onI0PT+ZJYGY88zj5DjObyDmU+1672DihA9xdN71t0ocQVxqJh2
GLRvWw9udXOhv9ELpIcgm9WeG5HKcN/P7rtG2THvd0gtwumkRv7dqoLrtB3YYUSB
xe465wkZAeSxcn6avWVOai0Q3d58ifihUpLkayxeJumO9L6DWdZWH1V/oRlOBT9t
U0sSPGNjzgQ8XN6lj2DoD5zVTi3BKhX/XZB1haaPZngw/cZQLMo=
=wINE
-----END PGP SIGNATURE-----

--9GSCKybAnQQ9OoPF--

