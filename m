Return-Path: <linux-i2c+bounces-6706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40776977E68
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 13:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A612FB2654F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 11:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060001D86CB;
	Fri, 13 Sep 2024 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpkD3Chm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C12C80;
	Fri, 13 Sep 2024 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726226405; cv=none; b=aJFEPQSTHIuvp6XrBSm+oExn9wDuLlNky94pGbC1iK8I2AIGHQnu8TuY/55V2Rt283fM6RKHdmabhMVMvbFlisxTqXVkutIulqbzMvxw+Wj/9DuQ7FrwRw0x7nMjs0LQMKHxyTJVPB+sDdPlKH4v8TQ9FSSHSp9q5FWwCF7qDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726226405; c=relaxed/simple;
	bh=2q+oY1XM3ivnJHwrKpOxFBjXi0TqwMW8ul28q34tzts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ic7UBxy/znKc/JiHD9PvlST+92P6mScEedOSSN/Fo8L+s2yFjpBaB15z31wHCJFuZkd11IwVzzI9DDIzZE4ckMqY69kKduWltsSVGjus29qakEnOy0i74509iNBEcyCRZP+ROPD3w9W9cJASddnyaexQrGQhX6DSO9gV1VHrAzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpkD3Chm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1281C4CEC0;
	Fri, 13 Sep 2024 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726226405;
	bh=2q+oY1XM3ivnJHwrKpOxFBjXi0TqwMW8ul28q34tzts=;
	h=Date:From:To:Cc:Subject:From;
	b=cpkD3Chmla7OXXQMQ2FgnI+Tg49e4YhRr1Bj6x6C10w3UOBYEVKHclaDNdDYpcH/A
	 i6unkiioPwG5XdnieSOJxE+Bzm2Uym5HuM81qW1+JwH2CL9qTYCnkQQTTdYSl1Qqq1
	 HOLJPecPAm5gDYUVlCFByUL4KYJO2mPL78LDaII9vgpp56QQ2AhNOcvUYau9SPWoyd
	 biGaPmNq7fwO7ZAQbwzknoiv3mpMQDmZJsmtF4xaIVx3VqXPpeTIgIBb7Ce2WjNtin
	 fIxlGbOYRDtiGvSQIeDq9f71aO5JtN+BjWm17w7F1gQpBomY7D/uNM/AwfP4T+rSmg
	 eVO4qHZCRyLrg==
Date: Fri, 13 Sep 2024 13:20:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.12
Message-ID: <ihephcck34arr3hvxj3pjtmk3p4dobyrblhawhsf4wi42h3344@zkelbpeexnbg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

This turned out to be a fairly loaded pull request, covering a
variety of topics. There are four new platforms added, but the
bulk of it consists of cleanups and refactors.

I didn’t plan to have a second pull request during this merge
window. Everything that was submitted is included in this one.

Wishing you a great weekend and a fantastic conference week,
which I’m sorry to miss!

Andi

The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.12

for you to fetch changes up to f56f4ba2fc1dbefd3242946f2fad35338a60e3bc:

  i2c: designware: Use pci_get_drvdata() (2024-09-11 12:52:46 +0200)

----------------------------------------------------------------
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
      arm64: defconfig: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
      mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
      RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
      net: txgbe: Fix I2C Kconfig dependencies
      i2c: designware: Group all DesignWare drivers under a single option

Krzysztof Kozlowski (5):
      dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses
      dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:then:
      dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level
      dt-bindings: i2c: qcom,i2c-cci: add missing clocks constraint in if:then:
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

Wolfram Sang (1):
      i2c: don't use ',' after delimiters

Zhang Zekun (1):
      i2c: mpc: Use devm_clk_get_optional_enabled() to simplify code

 .../devicetree/bindings/i2c/aspeed,i2c.yaml        |   5 -
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 Documentation/devicetree/bindings/i2c/i2c-sprd.txt |  31 --
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |  27 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   1 +
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   4 +
 .../devicetree/bindings/i2c/sprd,sc9860-i2c.yaml   |  65 +++
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  69 +++
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
 drivers/i2c/busses/i2c-keba.c                      | 598 +++++++++++++++++++++
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
 drivers/i2c/i2c-core-base.c                        |  20 +-
 drivers/i2c/muxes/Kconfig                          |  16 +
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 148 +++++
 drivers/net/ethernet/wangxun/Kconfig               |   3 +-
 63 files changed, 1480 insertions(+), 508 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sprd.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/sprd,sc9860-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
 create mode 100644 drivers/i2c/busses/i2c-keba.c
 create mode 100644 drivers/i2c/muxes/i2c-mux-mule.c

