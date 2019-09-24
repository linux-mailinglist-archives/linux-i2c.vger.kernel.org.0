Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6CECBD2AD
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2019 21:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410144AbfIXTbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 15:31:12 -0400
Received: from sauhun.de ([88.99.104.3]:44678 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410069AbfIXTbM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Sep 2019 15:31:12 -0400
Received: from localhost (unknown [90.85.113.197])
        by pokefinder.org (Postfix) with ESMTPSA id EAF0E2C039D;
        Tue, 24 Sep 2019 21:31:08 +0200 (CEST)
Date:   Tue, 24 Sep 2019 21:31:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.4
Message-ID: <20190924193054.GA2215@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has this time:

- new driver for ICY, an Amiga Zorro card :)
- axxia driver gained slave mode support, NXP driver gained ACPI
- the slave EEPROM backend gained 16 bit address support
- and lots of regular driver updates and reworks

Please pull.

Thanks,

   Wolfram


The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.4

for you to fetch changes up to 8ebf15e9c869e764b3aab4928938ee68c0e2bd6d:

  i2c: tegra: Move suspend handling to NOIRQ phase (2019-09-13 15:17:23 +0100)

----------------------------------------------------------------
Adamski, Krzysztof (Nokia - PL/Wroclaw) (1):
      i2c: axxia: support slave mode

Andy Shevchenko (3):
      i2c: Drop unneeded check for of_node
      i2c: designware: assert reset when error happen at ->probe()
      i2c: designware: Fix optional reset error handling

Anson Huang (2):
      i2c: mxs: use devm_platform_ioremap_resource() to simplify code
      i2c: imx-lpi2c: use devm_platform_ioremap_resource() to simplify code

Baolin Wang (3):
      i2c: sprd: Make I2C driver can be built as a module
      i2c: sprd: Change to use devm_platform_ioremap_resource()
      i2c: sprd: Validate the return value of clock initialization

Bartosz Golaszewski (1):
      eeprom: at24: remove unneeded include

Bj??rn Ard?? (2):
      i2c-eeprom_slave: Add support for more eeprom models
      i2c: slave-eeprom: Add comment about address handling

Chuanhua Han (1):
      i2c: imx: ACPI support for NXP i2c controller

Chuhong Yuan (1):
      i2c: busses: Use dev_get_drvdata where possible

Dmitry Osipenko (1):
      i2c: tegra: Compile PM functions unconditionally

Federico Vaga (1):
      i2c: ocores: use request_any_context_irq() to register IRQ handler

Felipe Balbi (1):
      i2c: designware-pci: Switch over to MSI interrupts

Fuqian Huang (1):
      i2c: ismt: Remove call to memset after dmam_alloc_coherent

Hans de Goede (1):
      i2c-cht-wc: Fix lockdep warning

Jarkko Nikula (1):
      i2c: designware-pci: Add support for Elkhart Lake PSE I2C

Jean Delvare (2):
      i2c: piix4: Fix probing of reserved ports on AMD Family 16h Model 30h
      i2c: piix4: Add ACPI support

Jon Hunter (1):
      i2c: tegra: Move suspend handling to NOIRQ phase

Lori Hikichi (1):
      i2c: iproc: Add full name of devicetree node to adapter name

Masahiro Yamada (2):
      i2c: uniphier(-f): use devm_platform_ioremap_resource()
      i2c: uniphier(-f): remove all dev_dbg()

Max Staudt (2):
      i2c: Add i2c-icy for I2C on m68k/Amiga
      i2c: icy: Add LTC2990 present on 2019 board revision

Mika Westerberg (2):
      watchdog: iTCO: Add support for Cannon Lake PCH iTCO
      i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond

Nishka Dasgupta (5):
      i2c: taos-evm: Make structure tsl2550_info constant
      i2c: iproc: Make bcm_iproc_i2c_quirks constant
      i2c: synquacer: Make synquacer_i2c_ops constant
      i2c: fsi: Add of_put_node() before break
      i2c: stm32f7: Make structure stm32f7_i2c_algo constant

Sebastian Andrzej Siewior (2):
      i2c: hix5hd2: Remove IRQF_ONESHOT
      i2c: exynos5: Remove IRQF_ONESHOT

Shaokun Zhang (1):
      i2c: designware: Fix unused variable warning

Simon Horman (6):
      dt-bindings: i2c: sh_mobile: Rename bindings documentation file
      dt-bindings: i2c: rcar: Rename bindings documentation file
      dt-bindings: i2c: riic: Rename bindings documentation file
      dt-bindings: i2c: riic: Rename bindings documentation file
      dt-bindings: i2c: rcar: Rename bindings documentation file
      dt-bindings: i2c: i2c-emev2: Rename bindings documentation file

Stefan Wahren (3):
      dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible
      i2c: bcm2835: Avoid clk stretch quirk for BCM2711
      i2c: bcm2835: Add full name of devicetree node to adapter name

Uwe Kleine-K??nig (1):
      i2c: designware: make use of devm_gpiod_get_optional

Wolfram Sang (5):
      Revert "dt-bindings: i2c: rcar: Rename bindings documentation file"
      Revert "dt-bindings: i2c: riic: Rename bindings documentation file"
      i2c: replace i2c_new_secondary_device with an ERR_PTR variant
      Merge tag 'at24-v5.4-updates-for-wolfram' of git://git.kernel.org/.../brgl/linux into i2c/for-5.4
      i2c: cht-wc: drop check because i2c_unregister_device() is NULL safe


with much appreciated quality assurance from
----------------------------------------------------------------
Alexander Sverdlin (1):
      (Rev.) i2c: axxia: support slave mode

Andrew Lunn (1):
      (Rev.) i2c: ocores: use request_any_context_irq() to register IRQ handler

Andy Shevchenko (4):
      (Rev.) i2c: imx: ACPI support for NXP i2c controller
      (Rev.) i2c: designware-pci: Add support for Elkhart Lake PSE I2C
      (Rev.) i2c: designware: Fix unused variable warning
      (Rev.) i2c: designware: make use of devm_gpiod_get_optional

Benjamin Rouxel (1):
      (Test) i2c: exynos5: Remove IRQF_ONESHOT

Dong Aisheng (1):
      (Rev.) i2c: mxs: use devm_platform_ioremap_resource() to simplify code

Eddie James (1):
      (Rev.) i2c: fsi: Add of_put_node() before break

Eric Anholt (2):
      (Rev.) i2c: bcm2835: Avoid clk stretch quirk for BCM2711
      (Rev.) dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible

Geert Uytterhoeven (8):
      (Rev.) i2c: icy: Add LTC2990 present on 2019 board revision
      (Rev.) i2c: Add i2c-icy for I2C on m68k/Amiga
      (Rev.) dt-bindings: i2c: i2c-emev2: Rename bindings documentation file
      (Rev.) dt-bindings: i2c: rcar: Rename bindings documentation file
      (Rev.) dt-bindings: i2c: riic: Rename bindings documentation file
      (Rev.) dt-bindings: i2c: riic: Rename bindings documentation file
      (Rev.) dt-bindings: i2c: rcar: Rename bindings documentation file
      (Rev.) dt-bindings: i2c: sh_mobile: Rename bindings documentation file

Hans Verkuil (1):
      (Rev.) i2c: replace i2c_new_secondary_device with an ERR_PTR variant

Jean Delvare (4):
      (Rev.) i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond
      (Rev.) watchdog: iTCO: Add support for Cannon Lake PCH iTCO
      (Rev.) i2c: taos-evm: Make structure tsl2550_info constant
      (Rev.) i2c: busses: Use dev_get_drvdata where possible

Kieran Bingham (1):
      (Rev.) i2c: replace i2c_new_secondary_device with an ERR_PTR variant

Krzysztof Kozlowski (1):
      (Test) i2c: exynos5: Remove IRQF_ONESHOT

Laurent Pinchart (1):
      (Rev.) i2c: replace i2c_new_secondary_device with an ERR_PTR variant

Oleksij Rempel (1):
      (Test) i2c: imx: ACPI support for NXP i2c controller

Peter Korsgaard (1):
      (Rev.) i2c: ocores: use request_any_context_irq() to register IRQ handler

Ray Jui (2):
      (Rev.) i2c: iproc: Make bcm_iproc_i2c_quirks constant
      (Rev.) i2c: iproc: Add full name of devicetree node to adapter name

Rob Herring (1):
      (Rev.) dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible

 .../devicetree/bindings/i2c/brcm,bcm2835-i2c.txt   |   4 +-
 .../bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} |   0
 .../i2c/{i2c-emev2.txt => renesas,iic-emev2.txt}   |   0
 .../i2c/{i2c-sh_mobile.txt => renesas,iic.txt}     |   0
 .../i2c/{i2c-riic.txt => renesas,riic.txt}         |   0
 MAINTAINERS                                        |  14 +-
 drivers/acpi/acpi_apd.c                            |   7 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  18 +-
 drivers/i2c/busses/Kconfig                         |  17 +-
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-axxia.c                     | 152 +++++++++++++-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |   6 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |  11 +-
 drivers/i2c/busses/i2c-cht-wc.c                    |  49 ++++-
 drivers/i2c/busses/i2c-designware-master.c         |  14 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  41 +++-
 drivers/i2c/busses/i2c-designware-platdrv.c        |  22 +-
 drivers/i2c/busses/i2c-exynos5.c                   |   4 +-
 drivers/i2c/busses/i2c-fsi.c                       |   4 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   3 +-
 drivers/i2c/busses/i2c-i801.c                      | 145 ++++++++-----
 drivers/i2c/busses/i2c-icy.c                       | 230 +++++++++++++++++++++
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |   4 +-
 drivers/i2c/busses/i2c-imx.c                       |  17 +-
 drivers/i2c/busses/i2c-ismt.c                      |   2 -
 drivers/i2c/busses/i2c-mxs.c                       |   4 +-
 drivers/i2c/busses/i2c-ocores.c                    |   5 +-
 drivers/i2c/busses/i2c-piix4.c                     |  34 ++-
 drivers/i2c/busses/i2c-sprd.c                      |  25 +--
 drivers/i2c/busses/i2c-stm32f7.c                   |   2 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   2 +-
 drivers/i2c/busses/i2c-taos-evm.c                  |   2 +-
 drivers/i2c/busses/i2c-tegra.c                     |  56 +++--
 drivers/i2c/busses/i2c-uniphier-f.c                |  26 +--
 drivers/i2c/busses/i2c-uniphier.c                  |  22 +-
 drivers/i2c/i2c-core-base.c                        |  20 +-
 drivers/i2c/i2c-slave-eeprom.c                     |  42 +++-
 drivers/media/i2c/adv748x/adv748x-core.c           |   6 +-
 drivers/media/i2c/adv7604.c                        |  22 +-
 drivers/misc/eeprom/at24.c                         |   1 -
 drivers/watchdog/iTCO_wdt.c                        |  26 ++-
 include/linux/i2c.h                                |   2 +-
 42 files changed, 795 insertions(+), 267 deletions(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt} (100%)
 create mode 100644 drivers/i2c/busses/i2c-icy.c

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2KbuoACgkQFA3kzBSg
KbYc3A//WpEbu2x03tyvBWk0Nk4pf6blhF+LVij4jC8mzGLktxI42qtg2GCik3eO
oqksraMmNfcPxMlqJh1xnVMjE0jr2/HLIa14g3ZXpdmsrtJn0NbML/Vgs7xHtueg
0aLbSwSnc5utb0K/oQeTdk/MlhuoJN15kucL1Tx9CTPlTlF6ZZ61VOf2Kmu21ZUu
P34ta5ndws1x4Kivo8yLjwQKI/Uxs6JKgkhh6JWAf4msCsPji6papRfJ4YuQq1bJ
hGyQe788dLhL5NwZWi/TqQPvMdQc/ofxlg90tGpZLox7qLZRaUM4R+wbZIu59RMh
3wo3q5j35E3bx3Lr1kASYi7WYLI+21KB5/pZRKG0KDwU8KYwzZtmw2TgulI1G3BA
bVbra5O0fOdXNWUsG4stt1TTtMx0rbwYVlRA1DqF1YihWHsl+TUSh05gNfaV5QBt
ZbTzAlq9UR+UfbjE8iU6XYTG8sbgWxso3ovinSFqB3ei4J5VaSsLIKb8fSZKisNz
y+zxt7IOsWd8N5gbvMjeEUzE4Jw8AZXNeZ2F0zUwIMUEQt5/P1BwW7DzIJ/SfJ1X
c4Q35iOiLsbO2WzAv+Q9OwbRolRteFMIuLAm24sDZkbi3fJjeSyS6s3yVwE3fwSV
ua6qhu/gaPMX1LZKZTNve1eln5+DK2Hh23EckU367fCcNND/pvA=
=IR8R
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
