Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7564E6F6D
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 09:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354727AbiCYIad (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 04:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352607AbiCYIab (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 04:30:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73408BB6;
        Fri, 25 Mar 2022 01:28:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 080AA6175D;
        Fri, 25 Mar 2022 08:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3B6C340E9;
        Fri, 25 Mar 2022 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648196936;
        bh=U0mjacLX/o07OaNRDDg4y+stDZYSKOphZOQvX3zh62U=;
        h=Date:From:To:Cc:Subject:From;
        b=GKIGFjcQRpU4ZKvbCC3r7PpzJ2qCgcr0sxdg3bC4uDivqlKe/MbsZrGdvq+jLkEDD
         7qJ0DN7BCcqE842TOLSAl3NlOqJNWQan8WBLuSjG+FtxxwNt3u8E9WN9Dor4Ba6zCz
         LYR5emK9hnzp9HhHjABUUfnwdc+zJ7FCes2Dedr1RZqofq8NcDuglHdsZwrk9TXczF
         lAdKxh7tdsUGDPj4neWAgzfNzii0Y7R6x2OkEVPag8Q8EANDFYax3Mu4ah+ZuBfGGa
         doHaH5bdGQDthATIj975D9OROx/bvDKdicTexiB+3/3zjMHJdLFS9GNKGXISF81bMR
         5uWCqR4YnAidw==
Date:   Fri, 25 Mar 2022 09:28:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.18
Message-ID: <Yj19RH3qpzQsIV/O@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vge+K6jA1aZ5Bc0I"
Content-Disposition: inline
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vge+K6jA1aZ5Bc0I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has for 5.18: tracepoints when Linux acts as an I2C client, added
support for AMD PSP, whole subsytsem now uses generic_handle_irq_safe(),
piix4 driver gained MMIO access enabling so far missed controllers with
AMD chipsets, plus a bulk of device driver updates, refactorization, and
fixes.

Please pull.

Thanks,

   Wolfram


The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507:

  Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-merge=
window

for you to fetch changes up to 1a22aabf20adf89cb216f566913196128766f25b:

  i2c: mux: demux-pinctrl: do not deactivate a master that is not active (2=
022-03-20 00:49:43 +0100)

----------------------------------------------------------------
Akhil R (4):
      device property: Add fwnode_irq_get_byname
      docs: firmware-guide: ACPI: Add named interrupt doc
      i2c: smbus: Use device_*() functions instead of of_*()
      i2c: tegra: Add SMBus block read function

Andy Shevchenko (6):
      i2c: Introduce common module to instantiate CCGx UCSI
      i2c: nvidia-gpu: Switch to use i2c_new_ccgx_ucsi()
      i2c: nvidia-gpu: Use temporary variable for struct device
      i2c: nvidia-gpu: Convert to use dev_err_probe()
      i2c: designware-pci: Switch to use i2c_new_ccgx_ucsi()
      i2c: smbus: Check for parent device before dereference

AngeloGioacchino Del Regno (1):
      i2c: mt65xx: Simplify with clk-bulk

Christophe JAILLET (2):
      i2c: amd-mp2: Remove useless DMA-32 fallback configuration
      i2c: bcm2835: Fix the error handling in 'bcm2835_i2c_probe()'

Conor Dooley (1):
      dt-bindings: i2c: add bindings for microchip mpfs i2c

Geert Uytterhoeven (3):
      dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0 support
      i2c: rcar: Add R-Car Gen4 support
      dt-bindings: i2c: microchip,corei2c: Fix indentation of compatible it=
ems

Hans de Goede (2):
      i2c: designware: Lock the adapter while setting the suspended flag
      i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers

Jae Hyun Yoo (1):
      i2c: add tracepoints for I2C slave events

Jan Dabros (4):
      i2c: designware: Add missing locks
      i2c: designware: Add AMD PSP I2C bus support
      i2c: designware: Fix improper usage of readl
      i2c: designware: Remove code duplication

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Raptor Lake PCH-S

Jean Delvare (3):
      i2c: i801: Drop useless masking in i801_access
      i2c: i801: Add support for the Process Call command
      i2c: i801: Drop two outdated comments

Jonathan Neusch=C3=A4fer (1):
      i2c: npcm7xx: Fix typos

Kewei Xu (5):
      dt-bindings: i2c: update bindings for MT8186 SoC
      i2c: mediatek: Add i2c compatible for Mediatek MT8186
      i2c: mediatek: modify bus speed calculation formula
      dt-bindings: i2c: update bindings for MT8168 SoC
      i2c: mediatek: Add i2c compatible for Mediatek MT8168

Lad Prabhakar (1):
      i2c: riic: Simplify reset handling

Lucas Tanure (1):
      i2c: meson: Fix wrong speed use from probe

Lukas Bulwahn (1):
      MAINTAINERS: adjust XLP9XX I2C DRIVER after removing the devicetree b=
inding

Martin Povi=C5=A1er (1):
      i2c: pasemi: Drop I2C classes from platform driver variant

Nathan Chancellor (1):
      i2c: designware: Mark dw_i2c_plat_{suspend,resume}() as __maybe_unused

Peter Rosin (1):
      i2c: mux: demux-pinctrl: do not deactivate a master that is not active

Rafael J. Wysocki (1):
      i2c: ACPI: Replace acpi_bus_get_device()

Rafa=C5=82 Mi=C5=82ecki (1):
      i2c: brcmstb: allow compiling on BCM4908

Robert Hancock (1):
      i2c: xiic: Make bus names unique

Sebastian Andrzej Siewior (3):
      genirq: Provide generic_handle_irq_safe()
      i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_not=
ify().
      i2c: cht-wc: Use generic_handle_irq_safe().

Terry Bowman (9):
      kernel/resource: Introduce request_mem_region_muxed()
      i2c: piix4: Replace hardcoded memory map size with a #define
      i2c: piix4: Move port I/O region request/release code into functions
      i2c: piix4: Move SMBus controller base address detect into function
      i2c: piix4: Move SMBus port selection into function
      i2c: piix4: Add EFCH MMIO support to region request and release
      i2c: piix4: Add EFCH MMIO support to SMBus base address detect
      i2c: piix4: Add EFCH MMIO support for SMBus port select
      i2c: piix4: Enable EFCH MMIO for Family 17h+

Vinod Koul (1):
      i2c: qcom-geni: Add support for GPI DMA

Vladimir Zapolskiy (2):
      dt-bindings: i2c: qcom-cci: add QCOM SM8450 compatible
      i2c: qcom-cci: add sm8450 compatible

Wolfram Sang (3):
      Merge branch 'i2c/add-request_mem_region_muxed' into i2c/for-mergewin=
dow
      i2c: don't expose function which is only used internally
      Merge tag 'irq-api-2022-02-21' of git://git.kernel.org/pub/scm/linux/=
kernel/git/tip/tip into i2c/for-mergewindow

Xiang wangx (1):
      i2c: cros-ec-tunnel: Fix syntax errors in comments

Xu Wang (1):
      i2c: mediatek: remove redundant null check

Yang Li (1):
      i2c: designware: remove unneeded semicolon


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (20):
      (Rev.) i2c: designware: Remove code duplication
      (Rev.) i2c: designware: Mark dw_i2c_plat_{suspend,resume}() as __mayb=
e_unused
      (Rev.) i2c: designware: Use the i2c_mark_adapter_suspended/resumed() =
helpers
      (Rev.) i2c: designware: Lock the adapter while setting the suspended =
flag
      (Rev.) i2c: designware: Fix improper usage of readl
      (Rev.) i2c: designware: Add AMD PSP I2C bus support
      (Rev.) i2c: designware: Add missing locks
      (Rev.) i2c: piix4: Enable EFCH MMIO for Family 17h+
      (Rev.) i2c: piix4: Add EFCH MMIO support for SMBus port select
      (Rev.) i2c: piix4: Add EFCH MMIO support to SMBus base address detect
      (Rev.) i2c: piix4: Add EFCH MMIO support to region request and release
      (Rev.) i2c: piix4: Move SMBus port selection into function
      (Rev.) i2c: piix4: Move SMBus controller base address detect into fun=
ction
      (Rev.) i2c: piix4: Move port I/O region request/release code into fun=
ctions
      (Rev.) i2c: piix4: Replace hardcoded memory map size with a #define
      (Rev.) kernel/resource: Introduce request_mem_region_muxed()
      (Rev.) i2c: ACPI: Replace acpi_bus_get_device()
      (Rev.) i2c: smbus: Use device_*() functions instead of of_*()
      (Rev.) docs: firmware-guide: ACPI: Add named interrupt doc
      (Rev.) device property: Add fwnode_irq_get_byname

AngeloGioacchino Del Regno (3):
      (Rev.) i2c: mediatek: Add i2c compatible for Mediatek MT8168
      (Rev.) dt-bindings: i2c: update bindings for MT8168 SoC
      (Rev.) i2c: mediatek: modify bus speed calculation formula

Bjorn Andersson (1):
      (Rev.) i2c: qcom-geni: Add support for GPI DMA

Dmitry Osipenko (1):
      (Rev.) i2c: tegra: Add SMBus block read function

Geert Uytterhoeven (1):
      (Rev.) i2c: riic: Simplify reset handling

Hans de Goede (4):
      (Rev.) i2c: designware: Mark dw_i2c_plat_{suspend,resume}() as __mayb=
e_unused
      (Rev.) i2c: cht-wc: Use generic_handle_irq_safe().
      (Rev.) genirq: Provide generic_handle_irq_safe()
      (Rev.) i2c: designware: Add missing locks

Jan Dabros (1):
      (Rev.) i2c: designware: remove unneeded semicolon

Jarkko Nikula (5):
      (Rev.) i2c: i801: Drop two outdated comments
      (Rev.) i2c: i801: Add support for the Process Call command
      (Rev.) i2c: i801: Drop useless masking in i801_access
      (Test) i2c: designware: Add AMD PSP I2C bus support
      (Test) i2c: designware: Add missing locks

Jean Delvare (9):
      (Rev.) i2c: i801: Add support for Intel Raptor Lake PCH-S
      (Rev.) i2c: piix4: Enable EFCH MMIO for Family 17h+
      (Rev.) i2c: piix4: Add EFCH MMIO support for SMBus port select
      (Rev.) i2c: piix4: Add EFCH MMIO support to SMBus base address detect
      (Rev.) i2c: piix4: Add EFCH MMIO support to region request and release
      (Rev.) i2c: piix4: Move SMBus port selection into function
      (Rev.) i2c: piix4: Move SMBus controller base address detect into fun=
ction
      (Rev.) i2c: piix4: Move port I/O region request/release code into fun=
ctions
      (Rev.) i2c: piix4: Replace hardcoded memory map size with a #define

Michal Simek (1):
      (Test) i2c: xiic: Make bus names unique

Neil Armstrong (1):
      (Rev.) i2c: meson: Fix wrong speed use from probe

Niklas S=C3=B6derlund (1):
      (Rev.) i2c: don't expose function which is only used internally

Oleksandr Natalenko (2):
      (Rev.) i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_h=
ost_notify().
      (Rev.) genirq: Provide generic_handle_irq_safe()

Qii Wang (7):
      (Rev.) i2c: mediatek: Add i2c compatible for Mediatek MT8168
      (Rev.) dt-bindings: i2c: update bindings for MT8168 SoC
      (Rev.) i2c: mt65xx: Simplify with clk-bulk
      (Rev.) i2c: mediatek: remove redundant null check
      (Rev.) i2c: mediatek: modify bus speed calculation formula
      (Rev.) i2c: mediatek: Add i2c compatible for Mediatek MT8186
      (Rev.) dt-bindings: i2c: update bindings for MT8186 SoC

Randy Dunlap (1):
      (Rev.) i2c: npcm7xx: Fix typos

Rob Herring (1):
      (Rev.) dt-bindings: i2c: add bindings for microchip mpfs i2c

Robert Foss (2):
      (Rev.) i2c: qcom-cci: add sm8450 compatible
      (Rev.) dt-bindings: i2c: qcom-cci: add QCOM SM8450 compatible

Sven Peter (1):
      (Rev.) i2c: pasemi: Drop I2C classes from platform driver variant

Wolfram Sang (3):
      (Rev.) genirq: Provide generic_handle_irq_safe()
      (Rev.) i2c: rcar: Add R-Car Gen4 support
      (Rev.) dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0 support

tali.perry@nuvoton.com (1):
      (Rev.) i2c: npcm7xx: Fix typos

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   2 +
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |   4 +-
 .../devicetree/bindings/i2c/microchip,corei2c.yaml |  56 +++
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |   6 +
 Documentation/firmware-guide/acpi/enumeration.rst  |  39 +++
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 MAINTAINERS                                        |   2 +-
 drivers/acpi/acpi_apd.c                            |   7 +-
 drivers/base/property.c                            |  29 ++
 drivers/i2c/busses/Kconfig                         |  25 +-
 drivers/i2c/busses/Makefile                        |   4 +
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |   7 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |  21 +-
 drivers/i2c/busses/i2c-ccgx-ucsi.c                 |  30 ++
 drivers/i2c/busses/i2c-ccgx-ucsi.h                 |  11 +
 drivers/i2c/busses/i2c-cht-wc.c                    |  11 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |   4 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c         | 388 +++++++++++++++++=
++++
 drivers/i2c/busses/i2c-designware-baytrail.c       |  12 +-
 drivers/i2c/busses/i2c-designware-common.c         |  12 +
 drivers/i2c/busses/i2c-designware-core.h           |  20 +-
 drivers/i2c/busses/i2c-designware-master.c         |  11 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  61 ++--
 drivers/i2c/busses/i2c-designware-platdrv.c        |  88 ++++-
 drivers/i2c/busses/i2c-i801.c                      |  24 +-
 drivers/i2c/busses/i2c-meson.c                     |  12 +-
 drivers/i2c/busses/i2c-mt65xx.c                    | 206 ++++++-----
 drivers/i2c/busses/i2c-npcm7xx.c                   |  16 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |  62 ++--
 drivers/i2c/busses/i2c-pasemi-core.c               |   1 -
 drivers/i2c/busses/i2c-pasemi-pci.c                |   1 +
 drivers/i2c/busses/i2c-piix4.c                     | 213 ++++++++---
 drivers/i2c/busses/i2c-qcom-cci.c                  |   3 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 | 308 ++++++++++++++--
 drivers/i2c/busses/i2c-rcar.c                      |   1 +
 drivers/i2c/busses/i2c-riic.c                      |  34 +-
 drivers/i2c/busses/i2c-tegra.c                     |  18 +-
 drivers/i2c/busses/i2c-xiic.c                      |   3 +-
 drivers/i2c/i2c-core-acpi.c                        |  17 +-
 drivers/i2c/i2c-core-base.c                        |   4 +-
 drivers/i2c/i2c-core-slave.c                       |  15 +
 drivers/i2c/i2c-core-smbus.c                       |  14 +-
 drivers/i2c/i2c-core.h                             |   9 +
 drivers/i2c/i2c-smbus.c                            |   5 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |   5 +-
 include/linux/i2c-smbus.h                          |   8 -
 include/linux/i2c.h                                |   8 +-
 include/linux/ioport.h                             |   2 +
 include/linux/irqdesc.h                            |   1 +
 include/linux/property.h                           |   1 +
 include/trace/events/i2c_slave.h                   |  67 ++++
 kernel/irq/irqdesc.c                               |  23 ++
 52 files changed, 1569 insertions(+), 363 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,corei2c=
=2Eyaml
 create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.c
 create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.h
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
 create mode 100644 include/trace/events/i2c_slave.h

--vge+K6jA1aZ5Bc0I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI9fUAACgkQFA3kzBSg
KbYXJQ/+NF/MKJ9tvGmDAZ644lI2A/zkKDvDA6ZJ2/sgw7/hYaPvMlZsBoQw4OvZ
DGgHElW1nFv7ORnu/5mnT1cyIqqNS9tbkHJZUy9z//O5imjTJ0Ma4p3kLD36wKbN
vhCudcBxLLSGjKIsE1tWFSTF/Pt4cIDb3RD7fnR9bvdxnEz54Y+T4DeX+6gLWVbu
mcJjD7j6AmV2eDHbG7JI3udybMo7RJtRu2ICEsI34bKZLzakih8DS8CgZ03TKnNa
K8R7vfrsDuRMCWxzWxenUQvIF3C+7tUBQN2JE28LwpNv5IzO4wAwQIPWjHC7SReF
p9aG0OCqQu0caZOK+mktJ8fl6r7VOjhgOVUCJHAaUq5qvdNy1Vl4AbsC8QrmBW6C
A1aEjQPwPIwATdA62RdndJ45igyv+Xzs5yEH4fwgP2Z80cXJYv7cQoLrmwmqUQyj
dq8tRHEX3SeJuErmiB0zVrmdkJf8vMGOCrSZc6pynipebFV2vyDrlBBdYi6b5Ieh
Ms1Kq3J3mwh4LDnuROUsMLRFJGkJ6r+qOi9roAMWxHmc8iBJ83TuZ0yE7UJSyhDc
zmke1scdyDQNnBdum2+TDZflfXWRVP5SLhxpCckRTryYoT3j50JAB5+f7WWJBA55
gP0Glu7IhLohrPx1snVk8kX0QhG97sJBQbzoWGqjNV9qfb/7pSI=
=i2ks
-----END PGP SIGNATURE-----

--vge+K6jA1aZ5Bc0I--
