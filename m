Return-Path: <linux-i2c+bounces-3477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C68C3396
	for <lists+linux-i2c@lfdr.de>; Sat, 11 May 2024 21:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1571EB20F45
	for <lists+linux-i2c@lfdr.de>; Sat, 11 May 2024 19:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CAD1F61C;
	Sat, 11 May 2024 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjfXJsKe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731431CAA5;
	Sat, 11 May 2024 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715456611; cv=none; b=W/N1pPENwzw4whiq8bMVIL0WDUAeMHw+rzqt90bL6qYTOW9Fryq+5ubUNwXy0EO/ZZFjqb3Cvjy2abL9+adXFJinOMVXpssDYUPUpBnutBWyYNKo0QTqxVRqCvpmO51oVsSFFqLh95zj3LUP4/qt0m6MTmWtAH6HGlaLrnf06ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715456611; c=relaxed/simple;
	bh=+zPK+oNIRvIN1utdGjotDQfFZTrtOS6XcIFqjx7luoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYctcrXhMx/46sFdbsJxFMX8si33KVwAyP1+DV3AkV8rKSpSCjGSkA76NqSlDU3JId+7lnnSL2I2lIErkIPJPbYvNlcBwEseZhIQPsEzwWyVHdn4cuhidAyryMWqU8l+9ovldfIHzyO8YSHMVOEOaaZ+whTEUGLTERQOBi2TTWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjfXJsKe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F55C2BBFC;
	Sat, 11 May 2024 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715456611;
	bh=+zPK+oNIRvIN1utdGjotDQfFZTrtOS6XcIFqjx7luoU=;
	h=Date:From:To:Cc:Subject:From;
	b=QjfXJsKe3KPWqMtLT+fSXbcMKuor3WkHDKuOc04dctKQhrL+8sx9CCun8/KZoh+Kg
	 uf9EVxlYMZd3KFpSfkfj9A/L1o9WMFzACoTPuPCELpTKA1KQMNJPMlANo0+XknITgp
	 LCpVt8fUE3DmrFn7RsktK462+k4LrqwS9WnXftGNw9FVrubwsFc2mkVmhT5nIGq+br
	 l/ysfeMqloL1MSyvm2j+a0/fD/3cC8I/1J/3RUBpOHQ8pWORojg8lgcy/9+3W6MF7+
	 gqsTdQ2kfh8TDQTon9+MwXTRxW5IDfKX9wxGTrn1QNJ8/EcDotyw2eR6dzNj2m6/yG
	 r5OJqLllf8Frg==
Date: Sat, 11 May 2024 21:43:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] i2c-host changes for v6.10 - pt. 1
Message-ID: <42ltajxahaag36a7bpszimmyylbga2d3qamwzfo33nx26ntgwq@2u5hsiuz3wfk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

This is the first part of the pull request for the merge window.

You will find a detailed description in the tag comment.

Two additional changes need to be submitted as part of a second
pull request:

 1. i2c: synquacer: Remove a clk reference from struct synquacer_i2c

     ** Depends on:
        i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()

    This commit from Christophe depends on a patch that was
    included in fixes.

 2. i2c: Remove I2C_CLASS_SPD

     ** Depends on:
        hwmon: jc42: Remove I2C_CLASS_SPD support

    This commit breaks compilation as it relies on a patch that
    was independently taken by Guenter Rock. Therefore, I need to
    ensure that Guenter merges this patch first.

Thanks,
Andi

The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.10

for you to fetch changes up to 61e05bad821cb293418794738e7cc359949f44fe:

  i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE() (2024-05-06 00:56:55 +0200)

----------------------------------------------------------------
Code cleanup:

A substantial code cleanup from Wolfram affects many drivers:

 - Removed dev_err() in case of timeout during i2c transfers, as
   timeouts are not considered errors and should not be treated
   as such.
 - For the same reason, 'timeout' variables have been renamed to
   'time_left'.

Other cleanups:

 - The viperboard driver now omits the "owner = THIS_MODULE"
   assignment.
 - Finally, we have eliminated the last remnants of
   I2C_CLASS_SPD: support for class-based devices has been
   completely removed from the mux-gpio driver.
 - In the ocore devices, a more standard use of ioport_map() for
   8-bit I/O read/write operations has been implemented.
 - The mpc driver will be among the first i2c drivers and one of
   the first in the kernel to use the __free auto cleanup
   routine.
 - The designware driver now uses MODULE_DEVICE_TABLE() instead
   of MODULE_ALIAS() for better consistency with the ID table.
 - Added prefixes to the octeon register macros.
 - Fixed some checkpatch errors in the newly created
   i2c-viai2c-common.c file.

Code refactoring:

 - The riic driver has refactored read/write operations to more
   flexibly support new platforms, laying the foundation for new
   SoC peculiarities.
 - In the i801 driver, a notifier callback has been created for
   muxed child segments.
 - The lpi2c driver now sets a clock rate during probe instead
   of continuously calling clk_get_rate().
 - Improvements in the clock divisor logic to accommodate other
   clock frequencies.
 - Combined some common functionalities during initialization
   for the wmt driver and separated others that can be
   independently used by different drivers. Now, all the common
   functionalities are grouped in the i2c-viai2c-common.c file.
 - Improved the clock stretching mechanism in the newly created
   i2c-viai2c-common.c file, inherited from the previous
   i2c-wmt.c.

Features added:

 - The octeon driver now includes watchdog timeout handling.
 - Added high-speed support for the octeon driver.

Added support for:

 - R9A09G057 SoC in the riic driver.
 - Rapids-D I2C controller in the designware driver.
 - Cadence driver now also supports RISC-V architectures.
 - Added support to the WMT device as a separate driver using the
   newly created i2c-viai2c-common.c functionalities.
 - Added support for the Zhaoxin I2C controller.

Some improvements in the bindings:

 - The pnx driver is converted to dtschema.
 - Added documentation for the Qualcomm SC8280XP.

----------------------------------------------------------------
Abhinav Jain (1):
      i2c: mpc: Removal of of_node_put with __free for auto cleanup

Alexander Stein (1):
      i2c: lpi2c: Avoid calling clk_get_rate during transfer

Andy Shevchenko (1):
      i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()

Animesh Agarwal (1):
      dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema

Arnd Bergmann (1):
      i2c: ocores: convert to ioport_map() for IORESOURCE_IO

Bryan O'Donoghue (1):
      dt-bindings: i2c: qcom-cci: Document sc8280xp compatible

Hans Hu (6):
      i2c: wmt: create wmt_i2c_init for general init
      i2c: wmt: split out common files
      i2c: wmt: rename something
      i2c: wmt: fix a bug when thread blocked
      i2c: wmt: add platform type VIAI2C_PLAT_WMT
      i2c: add zhaoxin i2c controller driver

Heiner Kallweit (5):
      i2c: i801: Call i2c_register_spd for muxed child segments
      i2c: i801: Fix missing Kconfig dependency
      i2c: i801: Remove usage of I2C_CLASS_SPD
      i2c: mux: gpio: remove support for class-based device instantiation
      i2c: i801: Annotate apanel_addr as __ro_after_init

Ji Sheng Teoh (1):
      i2c: cadence: Add RISCV architecture support

Krzysztof Kozlowski (1):
      i2c: viperboard: drop driver owner assignment

Lad Prabhakar (4):
      dt-bindings: i2c: renesas,riic: Document R9A09G057 support
      i2c: riic: Introduce helper functions for I2C read/write operations
      i2c: riic: Pass register offsets and chip details as OF data
      i2c: riic: Add support for R9A09G057 SoC

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT

Niklas Schnelle (1):
      i2c: add HAS_IOPORT dependencies

Piyush Malgujar (2):
      i2c: octeon: Add platform prefix to macros
      i2c: thunderx: Adding ioclk support

Shanth Murthy (1):
      i2c: designware: Add ACPI ID for Granite Rapids-D I2C controller

Suneel Garapati (3):
      i2c: thunderx: Clock divisor logic changes
      i2c: thunderx: Support for High speed mode
      i2c: octeon: Handle watchdog timeout

Wolfram Sang (36):
      i2c: at91-master: remove printout on handled timeouts
      i2c: bcm-iproc: remove printout on handled timeouts
      i2c: bcm2835: remove printout on handled timeouts
      i2c: cadence: remove printout on handled timeouts
      i2c: davinci: remove printout on handled timeouts
      i2c: img-scb: remove printout on handled timeouts
      i2c: ismt: remove printout on handled timeouts
      i2c: nomadik: remove printout on handled timeouts
      i2c: omap: remove printout on handled timeouts
      i2c: qcom-geni: remove printout on handled timeouts
      i2c: qup: remove printout on handled timeouts
      i2c: rk3x: remove printout on handled timeouts
      i2c: sh_mobile: remove printout on handled timeouts
      i2c: st: remove printout on handled timeouts
      i2c: tegra: remove printout on handled timeouts
      i2c: uniphier-f: remove printout on handled timeouts
      i2c: uniphier: remove printout on handled timeouts
      i2c: i801: remove printout on handled timeouts
      i2c: ali1535: remove printout on handled timeouts
      i2c: ali1563: remove printout on handled timeouts
      i2c: ali15x3: remove printout on handled timeouts
      i2c: amd-mp2-plat: use 'time_left' variable with wait_for_completion_timeout()
      i2c: digicolor: use 'time_left' variable with wait_for_completion_timeout()
      i2c: exynos5: use 'time_left' variable with wait_for_completion_timeout()
      i2c: hix5hd2: use 'time_left' variable with wait_for_completion_timeout()
      i2c: imx-lpi2c: use 'time_left' variable with wait_for_completion_timeout()
      i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
      i2c: st: use 'time_left' variable with wait_for_completion_timeout()
      i2c: stm32f4: use 'time_left' variable with wait_for_completion_timeout()
      i2c: stm32f7: use 'time_left' variable with wait_for_completion_timeout()
      i2c: synquacer: use 'time_left' variable with wait_for_completion_timeout()
      i2c: jz4780: use 'time_left' variable with wait_for_completion_timeout()
      i2c: qcom-geni: use 'time_left' variable with wait_for_completion_timeout()
      i2c: rk3x: use 'time_left' variable with wait_event_timeout()
      i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
      i2c: pxa: use 'time_left' variable with wait_event_timeout()

 Documentation/devicetree/bindings/i2c/i2c-pnx.txt  |  34 --
 .../devicetree/bindings/i2c/nxp,pnx-i2c.yaml       |  46 +++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  19 +
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  19 +-
 MAINTAINERS                                        |  12 +-
 drivers/i2c/busses/Kconfig                         |  49 ++-
 drivers/i2c/busses/Makefile                        |   3 +
 drivers/i2c/busses/i2c-ali1535.c                   |   8 +-
 drivers/i2c/busses/i2c-ali1563.c                   |   1 -
 drivers/i2c/busses/i2c-ali15x3.c                   |   4 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |   8 +-
 drivers/i2c/busses/i2c-at91-master.c               |   1 -
 drivers/i2c/busses/i2c-bcm-iproc.c                 |   2 -
 drivers/i2c/busses/i2c-bcm2835.c                   |   1 -
 drivers/i2c/busses/i2c-cadence.c                   |   2 -
 drivers/i2c/busses/i2c-davinci.c                   |   1 -
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   2 -
 drivers/i2c/busses/i2c-designware-platdrv.c        |   9 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   6 +-
 drivers/i2c/busses/i2c-exynos5.c                   |  12 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   8 +-
 drivers/i2c/busses/i2c-i801.c                      |  41 +-
 drivers/i2c/busses/i2c-img-scb.c                   |   5 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  25 +-
 drivers/i2c/busses/i2c-ismt.c                      |   1 -
 drivers/i2c/busses/i2c-jz4780.c                    |  22 +-
 drivers/i2c/busses/i2c-mpc.c                       |  11 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   7 +-
 drivers/i2c/busses/i2c-ocores.c                    |  21 +-
 drivers/i2c/busses/i2c-octeon-core.c               | 141 +++++--
 drivers/i2c/busses/i2c-octeon-core.h               |  53 ++-
 drivers/i2c/busses/i2c-omap.c                      |  11 +-
 drivers/i2c/busses/i2c-pxa.c                       |  14 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  10 +-
 drivers/i2c/busses/i2c-qup.c                       |   4 +-
 drivers/i2c/busses/i2c-riic.c                      | 125 ++++--
 drivers/i2c/busses/i2c-rk3x.c                      |  14 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   6 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   1 -
 drivers/i2c/busses/i2c-st.c                        |  11 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |   8 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   8 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   8 +-
 drivers/i2c/busses/i2c-tegra.c                     |   2 -
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |  13 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |   1 -
 drivers/i2c/busses/i2c-uniphier.c                  |   4 +-
 drivers/i2c/busses/i2c-viai2c-common.c             | 256 +++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h             |  85 +++++
 drivers/i2c/busses/i2c-viai2c-wmt.c                | 148 ++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c            | 298 +++++++++++++++
 drivers/i2c/busses/i2c-viperboard.c                |   1 -
 drivers/i2c/busses/i2c-wmt.c                       | 421 ---------------------
 drivers/i2c/muxes/i2c-mux-gpio.c                   |   3 +-
 include/linux/platform_data/i2c-mux-gpio.h         |   2 -
 55 files changed, 1295 insertions(+), 733 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-pnx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

