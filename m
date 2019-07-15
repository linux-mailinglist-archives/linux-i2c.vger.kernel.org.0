Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E37669E60
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2019 23:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbfGOVhI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jul 2019 17:37:08 -0400
Received: from sauhun.de ([88.99.104.3]:54650 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730156AbfGOVhI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jul 2019 17:37:08 -0400
Received: from localhost (p5486CFD1.dip0.t-ipconnect.de [84.134.207.209])
        by pokefinder.org (Postfix) with ESMTPSA id A48E72C7BD8;
        Mon, 15 Jul 2019 23:37:03 +0200 (CEST)
Date:   Mon, 15 Jul 2019 23:37:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.3
Message-ID: <20190715213658.GA5361@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

new stuff from the I2C world:

* in the core, getting irqs from ACPI is now similar to OF
* new driver for MediaTek MT7621/7628/7688 SoCs
* bcm2835, i801, and tegra drivers got some more attention
* GPIO API cleanups
* cleanups in the core headers
* lots of usual driver updates

There is a trivial merge conflict (SPDX header) in the meson driver.

Please pull.

Thanks,

   Wolfram


The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.3

for you to fetch changes up to cc6b9dfb2c5769afeb3335048173c730bdf8dbe1:

  i2c: mt7621: Fix platform_no_drv_owner.cocci warnings (2019-07-06 17:04:32 +0200)

----------------------------------------------------------------
Ajay Gupta (5):
      i2c: nvidia-gpu: refactor master_xfer
      i2c: nvidia-gpu: add runtime pm support
      usb: typec: ucsi: ccg: enable runtime pm support
      i2c: nvidia-gpu: resume ccgx i2c client
      usb: typec: ucsi: ccg: add runtime pm workaround

Alexander Sverdlin (1):
      i2c: i801: Add Block Write-Block Read Process Call support

Andy Shevchenko (2):
      i2c: i801: Fix kernel crash in is_dell_system_with_lis3lv02d()
      i2c: i801: Use match_string() helper to simplify the code

Annaliese McDermond (3):
      i2c: bcm2835: Model Divider in CCF
      i2c: bcm2835: Move IRQ request after clock code in probe
      i2c: bcm2835: Ensure clock exists when probing

Anson Huang (1):
      i2c: imx: Use __maybe_unused instead of #if CONFIG_PM

Bartosz Golaszewski (3):
      eeprom: at24: use devm_i2c_new_dummy_device()
      eeprom: at24: drop unnecessary label
      eeprom: at24: modify a comment referring to platform data

Bitan Biswas (7):
      i2c: tegra: clean up macros
      i2c: tegra: remove unnecessary variable init
      i2c: tegra: fix alignment and spacing violations
      i2c: tegra: add spinlock definition comment
      i2c: tegra: fix msleep warning
      i2c: tegra: Add suspend-resume support
      i2c: tegra: remove BUG() macro

Charles Keepax (6):
      i2c: core: Allow whole core to use i2c_dev_irq_from_resources
      i2c: acpi: Use available IRQ helper functions
      i2c: acpi: Factor out getting the IRQ from ACPI
      i2c: core: Move ACPI IRQ handling to probe time
      i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
      i2c: core: Tidy up handling of init_irq

Fabrice Gasnier (3):
      i2c: stm32f7: fix the get_irq error cases
      i2c: i2c-stm32f7: Add I2C_SMBUS_I2C_BLOCK_DATA support
      dt-bindings: i2c-stm32: document optional dmas

Gustavo A. R. Silva (3):
      eeprom: at24: use struct_size() in devm_kzalloc()
      i2c: mux: Use struct_size() in devm_kzalloc()
      i2c: mux: pinctrl: use flexible-array member and struct_size() helper

Jarkko Nikula (3):
      i2c: i801: Add support for Intel Elkhart Lake
      i2c: i801: Fix PCI ID sorting
      i2c: i801: Add support for Intel Tiger Lake

Jean Delvare (1):
      i2c: i801: Documentation update

Kamal Dasu (1):
      i2c: Allow selecting BCM2835 I2C controllers on ARCH_BRCMSTB

Lee Jones (2):
      i2c: qcom-geni: Signify successful driver probe
      i2c: qcom-geni: Provide support for ACPI

Linus Walleij (4):
      i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
      i2c: s3c2410: Convert to use GPIO descriptors
      i2c: iop: Use GPIO descriptors
      i2c: mux/i801: Switch to use descriptor passing

Maxime Ripard (4):
      dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
      dt-bindings: i2c: mv64xxx: Add YAML schemas
      dt-bindings: i2c: mv64xxx: Fix the example compatible
      dt-bindings: i2c: sun6i-p2wi: Fix the binding example

Neil Armstrong (1):
      i2c: meson: update with SPDX Licence identifier

Oliver O'Halloran (1):
      i2c: fsi: Create busses for all ports

Pali Roh??r (1):
      i2c: i801: Register optional lis3lv02d I2C device on Dell machines

Paul Cercueil (1):
      i2c: jz4780: Drop dependency on MACH_JZ4780

Peter Ujfalusi (1):
      dt-bindings: i2c: omap: Add new compatible for J721E SoCs

Rayagonda Kokatanur (1):
      i2c: iproc: Add multi byte read-write support for slave mode

Ruslan Babayev (1):
      i2c: acpi: export i2c_acpi_find_adapter_by_handle

Sagar Shrikant Kadam (3):
      dt-bindings: i2c: extend existing opencore bindings
      i2c: ocores: add support for i2c device on Sifive FU540-c000 SoC
      i2c: ocores: add polling mode workaround for Sifive FU540-C000 SoC

Stefan Roese (2):
      dt-bindings: i2c: i2c-mt7621: Add bindings for MediaTek MT7621/28/88 I2C
      i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver

Thierry Reding (1):
      i2c: tegra: Avoid error message on deferred probe

Vasyl Gomonovych (1):
      i2c: cpm: remove casting dma_alloc

Wolfram Sang (11):
      i2c: headers: don't use 'dev' as adapter variable
      i2c: headers: always have a named variable in arguments
      i2c: core: always have a named variable in arguments
      i2c: headers: update docs about I2C_CLIENT_*
      i2c: headers: reformat header comment and update copyright
      i2c: mux: add sysfs header
      i2c: mux: demux-pinctrl: use proper email address for ABI requests
      i2c: add newly exported functions to the header, too
      i2c: core: add sysfs header
      Merge tag 'at24-v5.3-updates-for-wolfram' of git://git.kernel.org/.../brgl/linux into i2c/for-5.3
      Merge branch 'i2c-mux/for-next' of https://github.com/peda-r/i2c-mux into i2c/for-5.3

YueHaibing (2):
      eeprom: at24: Remove set but not used variable 'addr'
      i2c: mt7621: Fix platform_no_drv_owner.cocci warnings


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Lunn (3):
      (Rev.) i2c: ocores: add polling mode workaround for Sifive FU540-C000 SoC
      (Rev.) i2c: ocores: add support for i2c device on Sifive FU540-c000 SoC
      (Rev.) i2c: acpi: export i2c_acpi_find_adapter_by_handle

Andy Shevchenko (7):
      (Rev.) i2c: core: Tidy up handling of init_irq
      (Rev.) i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
      (Rev.) i2c: core: Move ACPI IRQ handling to probe time
      (Rev.) i2c: acpi: Factor out getting the IRQ from ACPI
      (Rev.) i2c: acpi: Use available IRQ helper functions
      (Rev.) i2c: core: Allow whole core to use i2c_dev_irq_from_resources
      (Rev.) i2c: mux/i801: Switch to use descriptor passing

Bartosz Golaszewski (1):
      (Rev.) i2c: add newly exported functions to the header, too

Dmitry Osipenko (8):
      (Rev.) i2c: tegra: remove BUG() macro
      (Test) i2c: tegra: remove BUG() macro
      (Rev.) i2c: tegra: Add suspend-resume support
      (Rev.) i2c: tegra: fix msleep warning
      (Rev.) i2c: tegra: add spinlock definition comment
      (Rev.) i2c: tegra: fix alignment and spacing violations
      (Rev.) i2c: tegra: remove unnecessary variable init
      (Rev.) i2c: tegra: clean up macros

Dong Aisheng (1):
      (Rev.) i2c: imx: Use __maybe_unused instead of #if CONFIG_PM

Douglas Anderson (1):
      (Rev.) i2c: mux: arb-gpio: Rewrite to use GPIO descriptors

Eddie James (1):
      (Rev.) i2c: fsi: Create busses for all ports

Eric Anholt (1):
      (Rev.) i2c: bcm2835: Model Divider in CCF

Jarkko Nikula (1):
      (Rev.) i2c: i801: Documentation update

Jean Delvare (7):
      (Rev.) i2c: i801: Add support for Intel Tiger Lake
      (Rev.) i2c: i801: Fix PCI ID sorting
      (Rev.) i2c: i801: Add support for Intel Elkhart Lake
      (Rev.) i2c: i801: Add Block Write-Block Read Process Call support
      (Rev.) i2c: i801: Use match_string() helper to simplify the code
      (Rev.) i2c: i801: Register optional lis3lv02d I2C device on Dell machines
      (Rev.) i2c: Allow selecting BCM2835 I2C controllers on ARCH_BRCMSTB

Kieran Bingham (1):
      (Rev.) i2c: add newly exported functions to the header, too

Marek Szyprowski (1):
      (Test) i2c: mux: arb-gpio: Rewrite to use GPIO descriptors

Mika Westerberg (7):
      (Rev.) i2c: core: Tidy up handling of init_irq
      (Rev.) i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
      (Rev.) i2c: core: Move ACPI IRQ handling to probe time
      (Rev.) i2c: acpi: Factor out getting the IRQ from ACPI
      (Rev.) i2c: acpi: Use available IRQ helper functions
      (Rev.) i2c: core: Allow whole core to use i2c_dev_irq_from_resources
      (Rev.) i2c: mux/i801: Switch to use descriptor passing

Pali Roh??r (2):
      (Rev.) i2c: i801: Use match_string() helper to simplify the code
      (Rev.) i2c: i801: Fix kernel crash in is_dell_system_with_lis3lv02d()

Pierre-Yves MORDRET (3):
      (Rev.) dt-bindings: i2c-stm32: document optional dmas
      (Rev.) i2c: i2c-stm32f7: Add I2C_SMBUS_I2C_BLOCK_DATA support
      (Rev.) i2c: stm32f7: fix the get_irq error cases

Ray Jui (1):
      (Rev.) i2c: iproc: Add multi byte read-write support for slave mode

Ren?? van Dorst (1):
      (Test) i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver

Rob Herring (5):
      (Rev.) dt-bindings: i2c: sun6i-p2wi: Fix the binding example
      (Rev.) dt-bindings: i2c: mv64xxx: Fix the example compatible
      (Rev.) dt-bindings: i2c: mv64xxx: Add YAML schemas
      (Rev.) dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
      (Rev.) dt-bindings: i2c: extend existing opencore bindings

Simon Horman (1):
      (Rev.) i2c: mux: demux-pinctrl: use proper email address for ABI requests

Stefan Roese (1):
      (Rev.) i2c: mt7621: Fix platform_no_drv_owner.cocci warnings

Wolfram Sang (1):
      (Rev.) eeprom: at24: use devm_i2c_new_dummy_device()

 .../ABI/testing/sysfs-platform-i2c-demux-pinctrl   |   4 +-
 .../bindings/i2c/allwinner,sun6i-a31-p2wi.yaml     |  65 ++++
 .../devicetree/bindings/i2c/i2c-mt7621.txt         |  25 ++
 .../devicetree/bindings/i2c/i2c-mv64xxx.txt        |  64 ----
 .../devicetree/bindings/i2c/i2c-ocores.txt         |   9 +-
 Documentation/devicetree/bindings/i2c/i2c-omap.txt |   1 +
 .../devicetree/bindings/i2c/i2c-stm32.txt          |   2 +
 .../devicetree/bindings/i2c/i2c-sun6i-p2wi.txt     |  41 ---
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          | 124 +++++++
 Documentation/i2c/busses/i2c-i801                  |  20 +-
 MAINTAINERS                                        |   7 +
 arch/arm/include/asm/hardware/iop3xx.h             |   2 +
 arch/arm/mach-iop32x/em7210.c                      |   3 +
 arch/arm/mach-iop32x/glantank.c                    |   3 +
 arch/arm/mach-iop32x/iq31244.c                     |   3 +
 arch/arm/mach-iop32x/iq80321.c                     |   3 +
 arch/arm/mach-iop32x/n2100.c                       |   2 +
 arch/arm/plat-iop/i2c.c                            |  24 ++
 drivers/gpio/gpio-iop.c                            |   1 +
 drivers/i2c/busses/Kconfig                         |  13 +-
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-bcm-iproc.c                 | 117 +++----
 drivers/i2c/busses/i2c-bcm2835.c                   | 135 ++++++--
 drivers/i2c/busses/i2c-cpm.c                       |   4 +-
 drivers/i2c/busses/i2c-fsi.c                       |  32 +-
 drivers/i2c/busses/i2c-i801.c                      | 206 +++++++++++-
 drivers/i2c/busses/i2c-imx.c                       |  11 +-
 drivers/i2c/busses/i2c-iop3xx.c                    |  32 +-
 drivers/i2c/busses/i2c-iop3xx.h                    |   2 +
 drivers/i2c/busses/i2c-meson.c                     |   5 +-
 drivers/i2c/busses/i2c-mt7621.c                    | 356 +++++++++++++++++++++
 drivers/i2c/busses/i2c-nvidia-gpu.c                |  64 +++-
 drivers/i2c/busses/i2c-ocores.c                    |  33 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  17 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |  47 +--
 drivers/i2c/busses/i2c-stm32f7.c                   |  32 +-
 drivers/i2c/busses/i2c-tegra.c                     | 136 +++++---
 drivers/i2c/i2c-core-acpi.c                        |  61 ++--
 drivers/i2c/i2c-core-base.c                        |  20 +-
 drivers/i2c/i2c-core-of.c                          |   1 +
 drivers/i2c/i2c-core.h                             |   9 +
 drivers/i2c/i2c-mux.c                              |   4 +-
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c         |  79 ++---
 drivers/i2c/muxes/i2c-mux-gpio.c                   | 116 ++-----
 drivers/i2c/muxes/i2c-mux-pinctrl.c                |   5 +-
 drivers/misc/eeprom/at24.c                         |  86 ++---
 drivers/platform/x86/dell-smo8800.c                |   1 +
 drivers/usb/typec/ucsi/ucsi.c                      |  10 +
 drivers/usb/typec/ucsi/ucsi.h                      |   1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 118 ++++++-
 include/linux/i2c.h                                |  99 +++---
 include/linux/platform_data/i2c-mux-gpio.h         |   7 -
 52 files changed, 1614 insertions(+), 649 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-mt7621.c

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0s8fYACgkQFA3kzBSg
KbYISw//bQP9mHtjo2GGon7ctZ4pLYySDqBy6FcMadwz7Y9MrOLWs1cJswX2cTqa
9vprpqb94NG7RMzxhofzQKdG78aoZFavy47zAwiaZIy3X625rws5qDu4HeYeUtFm
63Sw2gXkmDzS8n2/dNE22vE7IO+wirPB+Ltocs6Yu18fQQ4uyR3wZ8ZSlgTeyb7+
8rmXDuhOhvXQ8EjWkS6AP0tURiTd17+srJYJlhKNsQzRK9wRfToZDyUuA4Uclly/
y7iILhn1USANZ/FpxYiSMOKxZhA8x9ujU/9wfam4P1JAVU05oSJKw2uBlEaiUjip
sCD9kkh56a7rNtPylRwoZfnf8nEeD1j8zha9MsFyGY3qA86xYlfkoj/8Jpw6q7uA
aIMbX+Rda+JewZwONH4d6d2z1qgd4PMelLAGosoGcV6NPmyWvq0MBccjvCAFMoTI
pi7QmzWFGBa39oLY3s6pWdAXbBAtMbtjHhQR+qwPTmx+Redr8WIJ55kEReVlYnTX
oXLCMxoNB3knUN80pyDdnFc3i1KGIde/J8NgGlft/lzE7f1yEuHv++Us5YuaWQkf
61NjocyxKWCLH4lxO04u2ArkauHk6KkR3sASan9tUuvMLuh7mM9QBSansEdDaKaO
WVsC+PHL6INCawNlgvaVX+Oy9FMFoiJ5O8W99TtLwqnr1eMNlbs=
=DECq
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
