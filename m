Return-Path: <linux-i2c+bounces-10068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A64FA756C6
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 15:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20C9418848EA
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 14:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340391C5F3B;
	Sat, 29 Mar 2025 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGiIyrQd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0678179A7;
	Sat, 29 Mar 2025 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743259470; cv=none; b=GBXK8oWXXeXjY1iURXOjaPAzNCw5DVe23gQceQHyMWhMHsbCXDdRxnRDKO/EdVuc9ixd3r5dfnUqpb5ZVaQwgOJLzSo7rmlki8Tv1nj7wT0u+7E1q0/zYRS6NkELUWNBt90PiyfEOOnxXkhM0Qwcs2Qr9aKQ5WkWsYb0nLRjoNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743259470; c=relaxed/simple;
	bh=Cj5Dlm0hVoftsve8k7bn/JPshxJL8dr8Ur2hCjZazvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ak2h1xztqANwBmX53jsqLNgwfukAlD2dW4eJFf4DOQgCWH6Y9Oyvl2gO8mtXlXOJrLDWRPDbpsxiedDGuFUwu/JHCaQSNJT2EGzpyX7KATcyvKO2XpnbriecSisgCclvApdaLpV+zMNofwfPUZE83suxxmAiRkk1IRviGrehJ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGiIyrQd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960E2C4CEE2;
	Sat, 29 Mar 2025 14:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743259469;
	bh=Cj5Dlm0hVoftsve8k7bn/JPshxJL8dr8Ur2hCjZazvQ=;
	h=Date:From:To:Cc:Subject:From;
	b=IGiIyrQdWyBJX5vq6RbW+S7zJYO5HyiZ3h5af6x7i622rTlceiCkytZy62s0MmmPb
	 WH+ejioqXDmmCjAN8kn2qCM32N05y8j2X7go2CuowXPoxdqUeKbXYY9agbl1FtanPw
	 PoVjEYwKC6gRntwzTsEyCW9agzDocq93uCByAjBz+IOZKR9cmc52OENQt6R9GlxysQ
	 yB44PCjxRCv4wvIELtaVehSh93gOe9zLxwek58tUT/9I9p4pOF/XZnFe5s6XhS8i0S
	 Qj5De8lphibSbvIIzJDlGoWvrw+sOkZDHigKtj1CLmfFNXhuTeUvC1zA7O2BtCQ81w
	 qvLmGf/BawfNg==
Date: Sat, 29 Mar 2025 15:44:25 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.15-rc1
Message-ID: <Z-gHSYOhavbE5h1v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m1gRNLXApZTucdmW"
Content-Disposition: inline


--m1gRNLXApZTucdmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc1

for you to fetch changes up to 31396626eaf0be0e8edc87b801fcd205016e42d9:

  dt-bindings: i2c: snps,designware-i2c: describe Renesas RZ/N1D variant (2025-03-28 12:37:41 +0100)

----------------------------------------------------------------
i2c-for-6.15-rc1

i2c-core updates (collected by Wolfram)

 - remove last user and unexport i2c_of_match_device()
 - irq usage cleanup from Jiri

i2c-host updates (collected by Andi)

Refactoring and cleanups
 - octeon, cadence, i801, pasemi, mlxbf, bcm-iproc: general
   refactorings
 - octeon: remove 10-bit address support

Improvements
 - amd-asf: improved error handling
 - designware: use guard(mutex)
 - amd-asf, designware: update naming to follow latest specs
 - cadence: fix cleanup path in probe
 - i801: use MMIO and I/O mapping helpers to access registers
 - pxa: handle error after clk_prepare_enable

New features
 - added i2c_10bit_addr_*_from_msg() and updated multiple drivers
 - omap: added multiplexer state handling
 - qcom-geni: update frequency configuration
 - qup: introduce DMA usage policy

New hardware support
 - exynos: add support for Samsung exynos7870
 - k1: add support for spacemit k1 (new driver)
 - imx: add support for i.mx94 lpi2c
 - rk3x: add support for rk3562
 - designware: add support for Renesas RZ/N1D

Multiplexers
 - ltc4306, reg: fix assignment in platform_driver structure

at24 eeprom updates (collected by Bartosz)

- add two new compatible entries to the DT binding document
- drop of_match_ptr() and ACPI_PTR() macros

----------------------------------------------------------------
Andi Shyti (1):
      i2c: k1: Initialize variable before use

Andy Shevchenko (14):
      power: ip5xxx_power: Make use of i2c_get_match_data()
      i2c: Unexport i2c_of_match_device()
      eeprom: at24: Drop of_match_ptr() and ACPI_PTR() protections
      i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
      i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
      i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers
      i2c: mlxbf: Use readl_poll_timeout_atomic() for polling

Anindya Sundar Gayen (1):
      i2c: i2c-exynos5: fixed a spelling error

Arnd Bergmann (1):
      i2c: mux: remove incorrect of_match_ptr annotations

Aryan Srivastava (3):
      i2c: octeon: refactor common i2c operations
      i2c: octeon: fix return commenting
      i2c: octeon: remove 10-bit addressing support

Danila Tikhonov (2):
      dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E

Frank Li (1):
      dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C

Heiner Kallweit (5):
      i2c: i801: Cosmetic improvements
      i2c: i801: Move i801_wait_intr and i801_wait_byte_done in the code
      i2c: i801: Improve too small kill wait time in i801_check_post
      i2c: i801: Switch to iomapped register access
      i2c: i801: Use MMIO if available

Jayesh Choudhary (2):
      dt-bindings: i2c: omap: Add mux-states property
      i2c: omap: Add support for setting mux

Jiri Slaby (SUSE) (1):
      irqdomain: i2c: Switch to irq_find_mapping()

Kaustabh Chakraborty (2):
      dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
      dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible

Kever Yang (1):
      dt-bindings: i2c: i2c-rk3x: Add rk3562 support

Manikanta Guntupalli (1):
      i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended in probe error path

Michal Simek (1):
      i2c: cadence: Simplify using devm_clk_get_enabled()

Mukesh Kumar Savaliya (1):
      i2c: qcom-geni: Update i2c frequency table to match hardware guidance

Shyam Sundar S K (4):
      i2c: amd: Switch to guard(mutex)
      i2c: dw: Update the master_xfer callback name
      i2c: amd-asf: Modify callbacks of i2c_algorithm to align with the latest revision
      i2c: amd-asf: Set cmd variable when encountering an error

Stephan Gerhold (3):
      dt-bindings: i2c: qcom,i2c-qup: Document power-domains
      dt-bindings: i2c: qup: Document interconnects
      i2c: qup: Vote for interconnect bandwidth to DRAM

Sven Peter (1):
      i2c: pasemi: Add registers bits and switch to BIT()

Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

Vitalii Mordan (1):
      i2c: pxa: fix call balance of i2c->clk handling routines

Wentao Liang (1):
      i2c: iproc: Refactor prototype and remove redundant error checks

Wolfram Sang (3):
      Merge tag 'at24-updates-for-v6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      Merge tag 'i2c-host-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow
      dt-bindings: i2c: snps,designware-i2c: describe Renesas RZ/N1D variant


with much appreciated quality assurance from
----------------------------------------------------------------
Alex Elder (1):
      (Rev.) i2c: spacemit: add support for SpacemiT K1 SoC

Alyssa Rosenzweig (1):
      (Rev.) i2c: pasemi: Add registers bits and switch to BIT()

Andy Shevchenko (4):
      (Rev.) i2c: octeon: remove 10-bit addressing support
      (Rev.) i2c: octeon: fix return commenting
      (Rev.) i2c: dw: Update the master_xfer callback name
      (Rev.) i2c: amd: Switch to guard(mutex)

AngeloGioacchino Del Regno (1):
      (Rev.) i2c: Introduce i2c_10bit_addr_*_from_msg() helpers

Asmaa Mnebhi (1):
      (Rev.) i2c: mlxbf: Use readl_poll_timeout_atomic() for polling

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: spacemit: add support for K1 SoC

Heiko Stuebner (1):
      (Rev.) dt-bindings: i2c: i2c-rk3x: Add rk3562 support

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible
      (Rev.) dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible

Neal Gompa (1):
      (Rev.) i2c: pasemi: Add registers bits and switch to BIT()

Rob Herring (2):
      (Rev.) dt-bindings: i2c: qup: Document interconnects
      (Rev.) dt-bindings: i2c: qcom,i2c-qup: Document power-domains

Rob Herring (Arm) (1):
      (Rev.) dt-bindings: i2c: omap: Add mux-states property

Vladimir Zapolskiy (3):
      (Rev.) i2c: qcom-geni: Update i2c frequency table to match hardware guidance
      (Rev.) i2c: Unexport i2c_of_match_device()
      (Rev.) power: ip5xxx_power: Make use of i2c_get_match_data()

Wolfram Sang (1):
      (Rev.) i2c: octeon: remove 10-bit addressing support

 Documentation/devicetree/bindings/eeprom/at24.yaml |   5 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |   1 +
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |   1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml      |  14 +
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   1 +
 .../bindings/i2c/snps,designware-i2c.yaml          |   5 +
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  61 +++
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      |   6 +
 drivers/i2c/busses/Kconfig                         |  18 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c              |   8 +-
 drivers/i2c/busses/i2c-axxia.c                     |  21 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  13 +-
 drivers/i2c/busses/i2c-bcm-kona.c                  |   6 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |  11 +-
 drivers/i2c/busses/i2c-cadence.c                   |  19 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c         |  26 +-
 drivers/i2c/busses/i2c-designware-master.c         |   2 +-
 drivers/i2c/busses/i2c-eg20t.c                     |  28 +-
 drivers/i2c/busses/i2c-exynos5.c                   |   2 +-
 drivers/i2c/busses/i2c-i801.c                      | 271 +++++-----
 drivers/i2c/busses/i2c-ibm_iic.c                   |  14 +-
 drivers/i2c/busses/i2c-k1.c                        | 602 +++++++++++++++++++++
 drivers/i2c/busses/i2c-kempld.c                    |  10 +-
 drivers/i2c/busses/i2c-mlxbf.c                     | 106 +---
 drivers/i2c/busses/i2c-mt7621.c                    |  20 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |  12 +-
 drivers/i2c/busses/i2c-octeon-core.c               | 111 ++--
 drivers/i2c/busses/i2c-omap.c                      |  22 +
 drivers/i2c/busses/i2c-pasemi-core.c               |  40 +-
 drivers/i2c/busses/i2c-pxa.c                       |   5 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   6 +-
 drivers/i2c/busses/i2c-qup.c                       |  36 ++
 drivers/i2c/busses/i2c-rzv2m.c                     |  15 +-
 drivers/i2c/i2c-core-of.c                          |   1 -
 drivers/i2c/i2c-core.h                             |   9 +
 drivers/i2c/muxes/i2c-mux-ltc4306.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   2 +-
 drivers/misc/eeprom/at24.c                         |  10 +-
 drivers/power/supply/ip5xxx_power.c                |   7 +-
 include/linux/i2c.h                                |  26 +-
 43 files changed, 1115 insertions(+), 464 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

--m1gRNLXApZTucdmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfoB0kACgkQFA3kzBSg
KbY5EQ//b9L3TrBIqbrs13YzuPV2AFcXlVelcnxBc1ypY+5PgoXMiToh4Um89k/l
+9/GDVfpI+DWGsFnG5F7KrckBtNu1ZLxdp133lzzMNI65gfi4uLq9UmxkUKX6k89
zSztZzpTfTwc0biJUlTDZIi/u+El/8cuMY1AzBjPfn/GAawyDGhskYQFLvPYcsqZ
EpgOpObxq6FT4HD8FRbeimfwH/LXZEn931Ifgray25z1tj99dOOVejGzYGOY5F0b
C0I7EdgxbAxS0babGAHqLuMT9IjZ7O40DkqugEu2pgdDap72ZS6XSzvMdJgtxHUK
p3qfZRVb27pKuDb4q0Qgv2KZaUtPv7YLAqEnJyAb+b93pYmaBylP32LHWmMd+Tmi
/Z1weaY81QeROO9FdGiIPKnvw2Z+pdrnUxGlmLG7Jo70vFvISDwFA0kex3urBVvK
15APSfIFcWBVVV7TjznYkeYOunTERS6Mh5mnWnJsGlF2rddrHb+zUoXtQiRKzRwo
NcnS9EXNuA578V2FhCIwy42EXVl1hQyhzFmoDwkAVkhGJzFtb3hh0DP3ZQ8QwKvu
hZl1BjABSbvn1HEm3RWexiCd44HaykCNlpFiDXT1MMEpLFjezwlXEppbJJAPsw5l
nrYhmLXNB2l4k+w0gS9MTnsZuJrLVK8OHOUpKMO/Jq1b6gQFUAk=
=QJ6q
-----END PGP SIGNATURE-----

--m1gRNLXApZTucdmW--

