Return-Path: <linux-i2c+bounces-6923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E938A97E6B0
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 09:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A202928164C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7233A482E4;
	Mon, 23 Sep 2024 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS7mvf15"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F94778C;
	Mon, 23 Sep 2024 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076899; cv=none; b=FYGGd2P8dFoyIWXU+YP5wRMOCAHqkN54TScU6Tq2EV4WUoL23WXF68s84oEOD8gr6Qnf6wrr22jGEULEUCYyaNU2wvA3CC2d3R6fHN56hbD6zG1+pz7+ju6EukP6ckNjIWu6OmleUDaU/4zPeF790/zyGioHXn2hX6yVKz7jsdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076899; c=relaxed/simple;
	bh=x5cQQRHqR0e64bRpxAunGX4aZJLq6HpDKbeZnc7wK3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBUkfYDZcEW6sd0/5OgBEfYh1jlWulveZjxYI8eVR/sFIm7OuIxav9SY8xEh2Cepjk3rH3rrVuVyeJ6v8v9ca2pdeA/FAJHGnloq/u35Uo/LRcJrVaoCg032tfKlxOvhus7xlIz1biSwqTibcpdZpwD7XtoKf+ly9yoM+XZq8EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS7mvf15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C720DC4CEC5;
	Mon, 23 Sep 2024 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727076898;
	bh=x5cQQRHqR0e64bRpxAunGX4aZJLq6HpDKbeZnc7wK3w=;
	h=Date:From:To:Cc:Subject:From;
	b=kS7mvf15N1hTC2qnkxDyHJDvGvjW376FYLpMLvZwf9rvyj0aybEK4XzPPVpt3ASBk
	 7U7vCbw1qvDOFTRU9YQxfizevhGXzEOvl+DKRm9pA3ys6IgD4TtDWZhxCYsuTH57qg
	 4Ip7ZgwaCvrcBIXIVNDwnttz5OUnDc1cOu5Ez7F6vGS+ShdG1EG+/d0ETMmDsrB/Mc
	 DCRsIVH8eE4mS0M/nevQ8ow1YbGfSAATWP1XDkTGwnO02LbPtH9JZaZnuZau98m+72
	 Odhh1xTc6Y9rbw4NWQI/JLkSamP4a2RCDgcL2n2AJ4Y6+AYau0SLjoNRwtHDN0lmAs
	 vmgIq68hAjEoA==
Date: Mon, 23 Sep 2024 09:34:53 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.12-rc1
Message-ID: <ZvEaHWH0IndyeMvs@shikoro>
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
	protocol="application/pgp-signature"; boundary="GhYVcdPfY+2guB+o"
Content-Disposition: inline


--GhYVcdPfY+2guB+o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.12-rc1

for you to fetch changes up to c24999e61b2187578fe4256b7bc6190a046c4b93:

  Merge tag 'i2c-host-6.12' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/andi.shyti/linux into i2c/for-mergewindow (2024-09-21 12:46:00 +0200)

----------------------------------------------------------------
i2c-for-6.12-rc1

I2C core
=3D=3D=3D=3D=3D=3D=3D=3D

After 15 years of deprecation, the I2C_COMPAT symbol has finally been
removed. Also client addresses are now locked during initialization to
prevent race conditions between different kinds of instantiation. Scoped
foreach OF child loops are now used. And the testunit has received some
cleanups and documentation improvements as well as two new tests, one
for repeated start and one for triggering SMBusAlert interrupts.

I2C host drivers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The DesignWare and the Renesas I2C drivers have received most of
the changes in this pull request.

The first has has undergone through a series of cleanups that
have been sent to the mailing list a year ago for the first time
and finally get merged in this pull request. They are many, from
typos (e.g. i2/i2c), to cosmetics, to refactoring (e.g. move
inline functions to librarieas) and many others.

Besides that, all the DesignWare Kconfig options have been
grouped under the I2C_DESIGNWARE_CORE and this required some
adaptation in many of the kernel configuration files for
different arm and mips boards.

Follows the list of the rest of the changes grouped by type of
change.

Cleanups
--------
The Qualcomm Geni platform improves the exit path in the runtime
resume function.

The Intel LJCA driver loses "target_addr" parameter in
ljca_i2c_stop() because it was unused.

The MediaTek controller intializes the restart_flag in the
transfer function using the ternary conditional operator ("? :")
instead of initializing it in different parts.

Constified a few global data structures in the virtio driver.

The Renesas driver simplifies the bus speed handling in the init
function making it more readable.

Improved an if/else statement in probe function of the Renesas
R-Car driver.

The iMX/MXC driver switches to using the RUNTIME_PM_OPS() instead
of SET_RUNTIME_PM_OPS().

Still in the iMX/MXC driver a comma ',' has been replaced by a
semicolon ';', while in different drivers the ',' has been
removed from the '{ }' delimiters.

Finally three devm_clk_get_enabled() have been used to simplify
the devm_clk_get/clk_prepare_enable tuple in the Renesas EMEV2,
Ingenic and MPC drivers.

Refactors
---------
The Nuvoton fixes a potential out of boundary array access. This
is not a bug fix because the issue could never occur due to
hardware not having the properties listed in the array. The
change makes the driver more future proof and, at the same time,
silences code analyzers.

Improvements
------------
The Renesas I2C (riic) driver undergoes several patches improving
the runtime power management handling.

The Intel i801 driver uses a more descriptive adapter's name to
show the presence of the IDF feature.

In the Intel Denverton (ismt) adapter the pending transactions
are killed when irq's can't complete their handling, triggering a
timeout. This could have been considered as a bug fix, but
because, standing to Vasily, it's very sporadic, I preferred
considering the patch rather as an improvement.

New Feature
-----------
The Renesas I2C (riic) driver now supports the fast mode plus.

New support
-----------
Added support for:

    - Renesas R9A08G045
    - Rockchip RK3576
    - KEBA I2C
    - Theobroma Systems Mule Multiplexer.

The Keba comes with a new driver, i2c-keba.c.
The Mule is an i2c multiplexer and it also comes with a new
driver, mux/i2c-mux-mule.c.

Core patch
----------
This pull request includes also a patch in the I2C framework, in
i2c-core-base.c where the runtime PM functions have been replaced
in order to allow to be accessed during the device add.

Devicetree
----------
Some cleanups in the devicetree, as well. nVidia and Qualcomm
bindings improve their "if:then:" blocks. While the aspeed
binding loses the "multi-master" property because it was
redundant.

The i2c-sprd binding has been converted to YAML.

AT24 updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- document a new model from giantec in DT bindings

----------------------------------------------------------------
Adrian Huang (1):
      i2c: designware: Fix wrong setting for {ss,fs,hs}_{h,l}cnt registers

Andi Shyti (2):
      i2c: qcom-geni: Use goto for clearer exit path
      i2c: ljca: Remove unused "target_addr" parameter

Andy Shevchenko (16):
      i2c: designware: Replace a while-loop by for-loop
      i2c: designware: Let PCI core to take care about interrupt vectors
      i2c: designware: Add missing 'c' into PCI IDs variable name
      i2c: designware: Unify terminator in device ID tables
      i2c: designware: Always provide device ID tables
      i2c: designware: Drop return value from i2c_dw_acpi_configure()
      i2c: designware: Drop return value from dw_i2c_of_configure()
      i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
      i2c: designware: Consolidate firmware parsing and configuring code
      i2c: designware: Unify the firmware type checks
      i2c: designware: Move exports to I2C_DW namespaces
      i2c: designware: Remove ->disable() callback
      i2c: designware: Consolidate PM ops
      i2c: designware: Uninline i2c_dw_probe()
      i2c: designware: Propagate firmware node
      i2c: designware: Use pci_get_drvdata()

AngeloGioacchino Del Regno (1):
      i2c: mt65xx: Avoid double initialization of restart_flag in isr

Christophe JAILLET (1):
      i2c: virtio: Constify struct i2c_algorithm and struct virtio_device_id

Claudiu Beznea (8):
      i2c: riic: Use temporary variable for struct device
      i2c: riic: Call pm_runtime_get_sync() when need to access registers
      i2c: riic: Use pm_runtime_resume_and_get()
      i2c: riic: Enable runtime PM autosuspend support
      i2c: riic: Add suspend/resume support
      i2c: riic: Define individual arrays to describe the register offsets
      dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
      i2c: riic: Add support for fast mode plus

Detlev Casanova (1):
      dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible

Fabio Estevam (1):
      i2c: imx: Switch to RUNTIME_PM_OPS()

Farouk Bouabid (2):
      dt-bindings: i2c: add support for tsd,mule-i2c-mux
      i2c: muxes: add support for tsd,mule-i2c multiplexer

Geert Uytterhoeven (1):
      i2c: riic: Simplify unsupported bus speed handling

Gerhard Engleder (1):
      i2c: keba: Add KEBA I2C controller support

Hans de Goede (2):
      i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
      i2c: i801: Use a different adapter-name for IDF adapters

Heikki Krogerus (7):
      ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
      ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
      arm64: defconfig: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLAT=
FORM
      mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
      RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATF=
ORM
      net: txgbe: Fix I2C Kconfig dependencies
      i2c: designware: Group all DesignWare drivers under a single option

Heiko Stuebner (1):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A

Heiner Kallweit (2):
      i2c: core: Lock address during client device instantiation
      i2c: Remove I2C_COMPAT config symbol and related code

Krzysztof Kozlowski (6):
      i2c: simplify with scoped for each OF child loop
      dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses
      dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:then:
      dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level
      dt-bindings: i2c: qcom,i2c-cci: add missing clocks constraint in if:t=
hen:
      dt-bindings: i2c: aspeed: drop redundant multi-master

Kuninori Morimoto (1):
      i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()

Rong Qianfeng (2):
      i2c: emev2: Use devm_clk_get_enabled() helpers
      i2c: jz4780: Use devm_clk_get_enabled() helpers

Shen Lichuan (1):
      i2c: imx: Convert comma to semicolon

Stanislav Jakubek (1):
      dt-bindings: i2c: i2c-sprd: convert to YAML

Tyrone Ting (1):
      i2c: npcm: restore slave addresses array length

Vasily Khoruzhick (1):
      i2c: ismt: kill transaction in hardware on timeout

Wolfram Sang (10):
      i2c: testunit: sort case blocks
      i2c: testunit: use decimal values in docs when appropriate
      i2c: testunit: add command to support versioning and test rep_start
      i2c: testunit: return current command on read messages
      i2c: testunit: describe fwnode based instantiation
      i2c: testunit: move code to avoid a forward declaration
      i2c: testunit: add SMBusAlert trigger
      Merge tag 'at24-updates-for-v6.12-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      i2c: don't use ',' after delimiters
      Merge tag 'i2c-host-6.12' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/andi.shyti/linux into i2c/for-mergewindow

Zhang Zekun (1):
      i2c: mpc: Use devm_clk_get_optional_enabled() to simplify code


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (21):
      (Rev.) i2c: designware: Use pci_get_drvdata()
      (Rev.) i2c: designware: Propagate firmware node
      (Rev.) i2c: designware: Uninline i2c_dw_probe()
      (Rev.) i2c: core: Setup i2c_adapter runtime-pm before calling device_=
add()
      (Rev.) i2c: npcm: restore slave addresses array length
      (Rev.) dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
      (Rev.) i2c: designware: Consolidate PM ops
      (Rev.) i2c: designware: Remove ->disable() callback
      (Rev.) i2c: designware: Move exports to I2C_DW namespaces
      (Rev.) i2c: designware: Unify the firmware type checks
      (Rev.) i2c: designware: Consolidate firmware parsing and configuring =
code
      (Rev.) i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_con=
figure()
      (Rev.) i2c: riic: Add suspend/resume support
      (Rev.) i2c: riic: Call pm_runtime_get_sync() when need to access regi=
sters
      (Rev.) i2c: designware: Drop return value from dw_i2c_of_configure()
      (Rev.) i2c: designware: Drop return value from i2c_dw_acpi_configure()
      (Rev.) i2c: designware: Always provide device ID tables
      (Rev.) i2c: designware: Unify terminator in device ID tables
      (Rev.) i2c: designware: Add missing 'c' into PCI IDs variable name
      (Rev.) i2c: designware: Let PCI core to take care about interrupt vec=
tors
      (Rev.) i2c: designware: Replace a while-loop by for-loop

Chris Packham (1):
      (Rev.) i2c: mpc: Use devm_clk_get_optional_enabled() to simplify code

Claudiu Beznea (2):
      (Rev.) i2c: riic: Simplify unsupported bus speed handling
      (Test) i2c: riic: Simplify unsupported bus speed handling

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: i2c-sprd: convert to YAML

Dong Wang (1):
      (Test) i2c: designware: Fix wrong setting for {ss,fs,hs}_{h,l}cnt reg=
isters

Geert Uytterhoeven (2):
      (Rev.) i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
      (Rev.) i2c: emev2: Use devm_clk_get_enabled() helpers

Guenter Roeck (1):
      (Rev.) dt-bindings: i2c: add support for tsd,mule-i2c-mux

Jarkko Nikula (1):
      (Test) i2c: designware: Let PCI core to take care about interrupt vec=
tors

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible

Krzysztof Piotr Oledzki (1):
      (Test) i2c: core: Lock address during client device instantiation

Mario Limonciello (7):
      (Rev.) i2c: designware: Unify the firmware type checks
      (Rev.) i2c: designware: Consolidate firmware parsing and configuring =
code
      (Rev.) i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_con=
figure()
      (Rev.) i2c: designware: Drop return value from dw_i2c_of_configure()
      (Rev.) i2c: designware: Always provide device ID tables
      (Rev.) i2c: designware: Unify terminator in device ID tables
      (Rev.) i2c: designware: Replace a while-loop by for-loop

Pali Roh=C3=A1r (2):
      (Rev.) i2c: i801: Use a different adapter-name for IDF adapters
      (Rev.) i2c: core: Setup i2c_adapter runtime-pm before calling device_=
add()

Rob Herring (Arm) (1):
      (Rev.) dt-bindings: i2c: add support for tsd,mule-i2c-mux

Sanket Goswami (1):
      (Test) i2c: designware: Consolidate PM ops

Serge Semin (2):
      (Test) i2c: designware: Propagate firmware node
      (Test) i2c: designware: Uninline i2c_dw_probe()

Wolfram Sang (10):
      (Rev.) i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
      (Rev.) i2c: emev2: Use devm_clk_get_enabled() helpers
      (Rev.) i2c: muxes: add support for tsd,mule-i2c multiplexer
      (Rev.) dt-bindings: i2c: add support for tsd,mule-i2c-mux
      (Rev.) i2c: riic: Simplify unsupported bus speed handling
      (Rev.) i2c: riic: Define individual arrays to describe the register o=
ffsets
      (Rev.) i2c: riic: Enable runtime PM autosuspend support
      (Rev.) i2c: riic: Use pm_runtime_resume_and_get()
      (Rev.) i2c: riic: Call pm_runtime_get_sync() when need to access regi=
sters
      (Rev.) i2c: riic: Use temporary variable for struct device

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/i2c/aspeed,i2c.yaml        |   5 -
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 Documentation/devicetree/bindings/i2c/i2c-sprd.txt |  31 --
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |  27 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   1 +
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   4 +
 .../devicetree/bindings/i2c/sprd,sc9860-i2c.yaml   |  65 +++
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  69 +++
 Documentation/i2c/slave-testunit-backend.rst       | 120 ++++-
 arch/arc/configs/axs101_defconfig                  |   1 +
 arch/arc/configs/axs103_defconfig                  |   1 +
 arch/arc/configs/axs103_smp_defconfig              |   1 +
 arch/arc/configs/tb10x_defconfig                   |   1 +
 arch/arm/configs/hisi_defconfig                    |   1 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm/configs/pxa_defconfig                     |   1 +
 arch/arm/configs/socfpga_defconfig                 |   1 +
 arch/arm/configs/spear13xx_defconfig               |   1 +
 arch/arm/configs/spear3xx_defconfig                |   1 +
 arch/arm/configs/spear6xx_defconfig                |   1 +
 arch/arm64/configs/defconfig                       |   1 +
 arch/mips/configs/generic/board-ocelot.config      |   1 +
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/configs/nommu_k210_defconfig            |   1 +
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   1 +
 drivers/i2c/Kconfig                                |   8 -
 drivers/i2c/busses/Kconfig                         |  40 +-
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-ali1535.c                   |   3 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |   2 +-
 drivers/i2c/busses/i2c-aspeed.c                    |   2 +-
 drivers/i2c/busses/i2c-designware-common.c         | 180 ++++++-
 drivers/i2c/busses/i2c-designware-core.h           |  39 +-
 drivers/i2c/busses/i2c-designware-master.c         |  36 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  88 +--
 drivers/i2c/busses/i2c-designware-platdrv.c        | 184 ++-----
 drivers/i2c/busses/i2c-designware-slave.c          |   6 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   2 +-
 drivers/i2c/busses/i2c-emev2.c                     |  25 +-
 drivers/i2c/busses/i2c-i801.c                      |   9 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |   2 +-
 drivers/i2c/busses/i2c-imx.c                       |  11 +-
 drivers/i2c/busses/i2c-ismt.c                      |  10 +
 drivers/i2c/busses/i2c-jz4780.c                    |  22 +-
 drivers/i2c/busses/i2c-keba.c                      | 598 +++++++++++++++++=
++++
 drivers/i2c/busses/i2c-ljca.c                      |   6 +-
 drivers/i2c/busses/i2c-mpc.c                       |  23 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |   5 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   |   6 +-
 drivers/i2c/busses/i2c-omap.c                      |   2 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-pnx.c                       |   2 +-
 drivers/i2c/busses/i2c-pxa-pci.c                   |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  23 +-
 drivers/i2c/busses/i2c-qup.c                       |   2 +-
 drivers/i2c/busses/i2c-rcar.c                      |  12 +-
 drivers/i2c/busses/i2c-riic.c                      | 228 +++++---
 drivers/i2c/busses/i2c-s3c2410.c                   |   2 +-
 drivers/i2c/busses/i2c-virtio.c                    |   4 +-
 drivers/i2c/i2c-core-base.c                        |  79 +--
 drivers/i2c/i2c-core-slave.c                       |   7 +-
 drivers/i2c/i2c-slave-testunit.c                   | 166 ++++--
 drivers/i2c/muxes/Kconfig                          |  16 +
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 148 +++++
 drivers/net/ethernet/wangxun/Kconfig               |   3 +-
 include/linux/i2c.h                                |   3 +
 69 files changed, 1747 insertions(+), 605 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sprd.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.y=
aml
 create mode 100644 Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.=
yaml
 create mode 100644 drivers/i2c/busses/i2c-keba.c
 create mode 100644 drivers/i2c/muxes/i2c-mux-mule.c

--GhYVcdPfY+2guB+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbxGh0ACgkQFA3kzBSg
KbY4UQ/7BATLJ4nu7P91+QagxpVcVUkBBs8k+pgb3WtcWLBlQtTUkYvsqLvd7W+L
Rz1Qg0JTdh5wTQxx6ED586AvcMQVC0xKjBmVE9irSa5fkQX+ys1FFBFIbYbayGv2
4f/vZUSUs7kd3FTfi9b8A9NUdu2sTEdgVB4mlFnniHUWDuminTTDuMqdI/ZW1ECW
Z0FJ+NhLv2/NkPR5V2XFZcZRPcbuREDYA1tRHcoPkH5JJ0Dd0TBhm/zks/zdLU6c
mqBr69YS7zVQfWxFDWZDACYTRm/TJY30xnJyJrqE96PiXKZdUgGceRgy+F0LmsHl
hJSe6JCeoS3+bDHShdVr1DdW5qP85eUHgSVS/d82CM3WB48zcJxY81IfnlWOeHjt
T00LW4Cx/mXehvfL74ihoXKkhY0xQHNE8TEB1nbUOAkyaL3kMFSgcpjyZEz75/jq
KtRw7rdgRM0UD3ZondEp7Ws/EvIXO4U7LvJEprjEq/Y5jGDe8r2C7qQ2iZYxB3r+
WJEj6EKz03wjvcWUwUDn8t3Q0gRRStunCshZcOGHFpUiVBpZzM3DyzJtEEsbmmbQ
0iedgrDXUXogfpa69zECUgpo2me2Sn7YZUsG/WDw4dsOJPPTdDvtSY/Dmy1izQYa
xj8WCBfUODThqV3HjchjM5l9dYduukMP+zhDo8irf5XRj77aj9I=
=6Mu3
-----END PGP SIGNATURE-----

--GhYVcdPfY+2guB+o--

