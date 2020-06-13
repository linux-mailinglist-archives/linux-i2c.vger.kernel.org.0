Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2C21F8320
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 13:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgFMLdg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 07:33:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgFMLdg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Jun 2020 07:33:36 -0400
Received: from localhost (p5486c936.dip0.t-ipconnect.de [84.134.201.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9108207DD;
        Sat, 13 Jun 2020 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592048014;
        bh=nPi94PwQqHyUO+Gyhl3GHgeW6P8ahu7P+2wyxqUeFYY=;
        h=Date:From:To:Cc:Subject:From;
        b=EBfheZwNFIVqyL3xprAuUO8auiLWkNiacpj/po3p/VOUbjcPCMUSIZHHcajIjcr5t
         F58xPS8urQ31tV5nyNKT6Rkq2+BjjxFr0lLv440q5sZ+6G5vg7SrzMFNCMkv4sNLro
         YJ89Fi3c+PH6eI/gEK8uUeaALqh2u2ulXYuztlpI=
Date:   Sat, 13 Jun 2020 13:33:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.8
Message-ID: <20200613113328.GA5400@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has quite some patches for you this time. I hope it is the move to
per-driver-maintainers which is now showing results. We will see.

Big news is two new drivers (Nuvoton NPCM and Qualcomm CCI), larger
refactoring of the Designware, Tegra, and PXA drivers, the Cadence
driver supports being a slave now, and there is support to
instanciate SPD eeproms for well-known cases (which will be user-visible
because the i801 driver supports it), and some
devm_platform_ioremap_resource() conversions which blow up the diffstat.

Note that I applied the Nuvoton driver quite late, so some minor fixup patc=
hes
arrived during the merge window. I chose to apply them right away
because they were trivial.

Please pull.

Thanks,

   Wolfram


The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:

  Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.8

for you to fetch changes up to d790eeb3db6aefac39ffa06e598eb31b7352ca4f:

  i2c: Drop stray comma in MODULE_AUTHOR statements (2020-06-11 12:32:14 +0=
200)

----------------------------------------------------------------
Adam Honse (1):
      i2c: piix4: Detect secondary SMBus controller on AMD AM4 chipsets

Aishwarya R (1):
      i2c: powermac: Simplify reading the "reg" and "i2c-address" property

Aishwarya Ramakrishnan (1):
      i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify code

Alain Volmat (3):
      dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
      i2c: stm32f7: allows for any bus frequency
      i2c: fix missing pm_runtime_put_sync in i2c_device_probe

Andy Shevchenko (17):
      i2c: mux: pca954x: Refactor pca954x_irq_handler()
      i2c: mux: pca954x: Make use of device properties
      i2c: mux: pca954x: Move device_remove_file() out of pca954x_cleanup()
      i2c: mux: pca954x: Convert license to SPDX identifier
      i2c: designware: Use devm_platform_ioremap_resource() to simplify code
      i2c: designware: Move configuration routines to respective modules
      i2c: designware: Switch PCI driver to use i2c_dw_configure_master()
      i2c: designware: Rename i2c_dw_probe() to i2c_dw_probe_master()
      i2c: designware: Allow slave mode for PCI enumerated devices
      i2c: designware: Get rid of PCI driver specifics in common code
      i2c: designware: Include proper headers in i2c-desingware-core.h
      i2c: designware: Move i2c_dw_validate_speed() helper to a common code
      i2c: designware: Drop unneeded condition in i2c_dw_validate_speed()
      i2c: designware: Move ACPI parts into common module
      i2c: designware: Read counters from ACPI for PCI driver
      i2c: designware: Drop hard coded FIFO depth assignment
      i2c: acpi: Drop double check for ACPI companion device

Atsushi Nemoto (2):
      i2c: altera: Fix race between xfer_msg and isr thread
      i2c: altera: cleanup spinlock

Bibby Hsieh (2):
      dt-binding: i2c: add bus-supply property
      i2c: core: support bus regulator controlling in adapter

Bj=C3=B6rn Ard=C3=B6 (1):
      i2c: slave-eeprom: Make it possible to pre-load eeprom data

Christophe JAILLET (1):
      i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pin=
ctrl_probe()'

Codrin Ciubotariu (2):
      i2c: at91: Send bus clear command if SDA is down
      i2c: at91: Fix pinmux after devm_gpiod_get() for bus recovery

Dan Carpenter (2):
      i2c: stm32f7: prevent array underflow in stm32f7_get_lower_rate()
      i2c: npcm7xx: Fix a couple of error codes in probe

Dave Stevenson (1):
      i2c: brcmstb: Fix handling of optional interrupt

Dejin Zheng (3):
      i2c: busses: convert to devm_platform_ioremap_resource
      i2c: busses: convert to devm_platform_get_and_ioremap_resource
      i2c: busses: remove duplicate dev_err()

Dmitry Osipenko (2):
      i2c: tegra: Better handle case where CPU0 is busy for a long time
      i2c: tegra: Synchronize DMA before termination

Etienne Carriere (1):
      i2c: stm32: don't print an error on probe deferral

Fabrice Gasnier (1):
      i2c: i2c-stm32f7: improve nack debug message

Geert Uytterhoeven (1):
      i2c: i801: Use GPIO_LOOKUP() helper macro

Gustavo A. R. Silva (2):
      i2c: mux: Replace zero-length array with flexible-array
      i2c: npcm7xx: Remove unnecessary parentheses

Jason Yan (2):
      i2c: qup: remove unneeded conversion to bool
      i2c: powermac: use true,false for bool variable

Jean Delvare (3):
      i2c: smbus: Add a way to instantiate SPD EEPROMs automatically
      i2c: i801: Instantiate SPD EEPROMs automatically
      i2c: Drop stray comma in MODULE_AUTHOR statements

Loic Poulain (1):
      i2c: Add Qualcomm CCI I2C driver

Lubomir Rintel (1):
      i2c: pxa: don't error out if there's no pinctrl

Max Staudt (1):
      i2c: icy: Fix build with CONFIG_AMIGA_PCMCIA=3Dn

Maxime Ripard (1):
      i2c: brcmstb: Allow to compile it on BCM2835

Qii Wang (2):
      MAINTAINERS: add maintainer for mediatek i2c controller driver
      i2c: mediatek: Add i2c ac-timing adjust support

Radu Pirea (1):
      i2c: cadence: Added slave support

Rayagonda Kokatanur (1):
      i2c: iproc: add support for SMBUS quick cmd

Russell King (19):
      i2c: pxa: use official address byte helper
      i2c: pxa: remove unneeded includes
      i2c: pxa: re-arrange includes to be in alphabetical order
      i2c: pxa: re-arrange functions to flow better
      i2c: pxa: re-arrange register field definitions
      i2c: pxa: add and use definitions for IBMR register
      i2c: pxa: always set fm and hs members for each type
      i2c: pxa: move private definitions to i2c-pxa.c
      i2c: pxa: move DT IDs along side platform IDs
      i2c: pxa: fix i2c_pxa_scream_blue_murder() debug output
      i2c: pxa: clean up decode_bits()
      i2c: pxa: fix i2c_pxa_wait_bus_not_busy() boundary condition
      i2c: pxa: consolidate i2c_pxa_*xfer() implementations
      i2c: pxa: avoid complaints with non-responsive slaves
      i2c: pxa: ensure timeout messages are unique
      i2c: pxa: remove some unnecessary debug
      i2c: pxa: clear all master action bits in i2c_pxa_stop_message()
      i2c: pxa: use master-abort for device probes
      i2c: pxa: implement generic i2c bus recovery

Serge Semin (11):
      dt-bindings: i2c: Convert DW I2C binding to DT schema
      dt-bindings: i2c: Convert DW I2C slave to the DW I2C master example
      dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
      i2c: designware: Use `-y` to build multi-object modules
      i2c: designware: slave: Set DW I2C core module dependency
      i2c: designware: Add Baytrail sem config DW I2C platform dependency
      i2c: designware: Discard Cherry Trail model flag
      i2c: designware: Convert driver to using regmap API
      i2c: designware: Retrieve quirk flags as early as possible
      i2c: designware: Move reg-space remapping into a dedicated function
      i2c: designware: Add Baikal-T1 System I2C support

Tali Perry (4):
      dt-bindings: i2c: npcm7xx: add NPCM I2C controller
      i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
      i2c: npcm7xx: Add support for slave mode for Nuvoton
      MAINTAINERS: npcm7xx: Add maintainer for Nuvoton NPCM BMC

Tang Bin (2):
      i2c: efm32: Omit superfluous error message in efm32_i2c_probe()
      i2c: efm32: Avoid unnecessary check in efm32_i2c_probe()

Thierry Reding (5):
      Revert "i2c: tegra: Fix suspending in active runtime PM state"
      i2c: tegra: Restore pinmux on system resume
      i2c: tegra: Keep IRQs enabled during suspend/resume
      i2c: tegra: Use FIELD_PREP/FIELD_GET macros
      i2c: tegra: Add support for the VI I2C on Tegra210

Todor Tomov (1):
      dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller

Viresh Kumar (1):
      i2c: sh_mobile: simplify code and remove false compilation warning

Wan Ahmad Zainie (2):
      i2c: designware: Calculate SCL timing parameter for Fast Mode Plus
      i2c: designware: Calculate SCL timing parameter for High Speed Mode

Wolfram Sang (16):
      i2c: refactor parsing of timings
      i2c: regroup documentation of bindings
      platform/mellanox: mlxreg-hotplug: convert to use i2c_new_client_devi=
ce()
      i2c: use my kernel.org address from now on
      i2c: algo-pca: update contact email
      i2c: slave-eeprom: add support for 24c512 EEPROMs
      i2c: reword explanation about atomic transfers
      Merge branch 'i2c/for-current-fixed' into i2c/for-5.8
      Merge tag 'for-5.8-i2c' of git://git.kernel.org/.../tegra/linux into =
i2c/for-5.8
      Revert "i2c: core: support bus regulator controlling in adapter"
      Revert "dt-binding: i2c: add bus-supply property"
      i2c: save a variable in i2c_detect()
      i2c: slave-eeprom: skip useless initialization
      i2c: slave-eeprom: update documentation to recent changes
      i2c: avoid confusing naming in header
      i2c: add 'single-master' property to generic bindings

kernel test robot (1):
      i2c: npcm7xx: npcm_i2caddr[] can be static


with much appreciated quality assurance from
----------------------------------------------------------------
Ajay Gupta (1):
      (Rev.) i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify code

Alain Volmat (1):
      (Rev.) i2c: stm32f7: prevent array underflow in stm32f7_get_lower_rat=
e()

Andrew Lunn (1):
      (Rev.) i2c: pxa: implement generic i2c bus recovery

Andy Shevchenko (11):
      (Rev.) i2c: npcm7xx: Add support for slave mode for Nuvoton
      (Rev.) i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
      (Rev.) i2c: designware: Add Baikal-T1 System I2C support
      (Rev.) i2c: designware: Move reg-space remapping into a dedicated fun=
ction
      (Rev.) i2c: designware: Retrieve quirk flags as early as possible
      (Rev.) i2c: designware: Convert driver to using regmap API
      (Rev.) i2c: designware: Discard Cherry Trail model flag
      (Rev.) i2c: designware: Add Baytrail sem config DW I2C platform depen=
dency
      (Rev.) i2c: busses: remove duplicate dev_err()
      (Rev.) i2c: designware: Calculate SCL timing parameter for High Speed=
 Mode
      (Rev.) i2c: designware: Calculate SCL timing parameter for Fast Mode =
Plus

Barry Song (1):
      (Rev.) i2c: busses: convert to devm_platform_ioremap_resource

Bjorn Andersson (3):
      (Rev.) i2c: qup: remove unneeded conversion to bool
      (Rev.) i2c: Add Qualcomm CCI I2C driver
      (Rev.) i2c: busses: convert to devm_platform_ioremap_resource

Erhard Furtner (1):
      (Test) i2c: powermac: Simplify reading the "reg" and "i2c-address" pr=
operty

Jarkko Nikula (3):
      (Rev.) i2c: Drop stray comma in MODULE_AUTHOR statements
      (Test) i2c: designware: Convert driver to using regmap API
      (Rev.) i2c: fix missing pm_runtime_put_sync in i2c_device_probe

Jean Delvare (2):
      (Rev.) i2c: i801: Use GPIO_LOOKUP() helper macro
      (Rev.) i2c: piix4: Detect secondary SMBus controller on AMD AM4 chips=
ets

Patrick Williams (1):
      (Rev.) i2c: slave-eeprom: add support for 24c512 EEPROMs

Peter Rosin (5):
      (Rev.) i2c: mux: Replace zero-length array with flexible-array
      (Rev.) i2c: mux: pca954x: Convert license to SPDX identifier
      (Rev.) i2c: mux: pca954x: Move device_remove_file() out of pca954x_cl=
eanup()
      (Rev.) i2c: mux: pca954x: Make use of device properties
      (Rev.) i2c: mux: pca954x: Refactor pca954x_irq_handler()

Pierre-Yves MORDRET (3):
      (Rev.) i2c: stm32f7: allows for any bus frequency
      (Rev.) i2c: stm32: don't print an error on probe deferral
      (Rev.) i2c: i2c-stm32f7: improve nack debug message

Rob Herring (8):
      (Rev.) dt-bindings: i2c: npcm7xx: add NPCM I2C controller
      (Rev.) i2c: add 'single-master' property to generic bindings
      (Rev.) dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
      (Rev.) dt-bindings: i2c: Convert DW I2C slave to the DW I2C master ex=
ample
      (Rev.) dt-bindings: i2c: Convert DW I2C binding to DT schema
      (Rev.) i2c: regroup documentation of bindings
      (Rev.) dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
      (Rev.) dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller

Robert Foss (2):
      (Test) i2c: Add Qualcomm CCI I2C driver
      (Rev.) dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller

Sebastian Reichel (2):
      (Rev.) i2c: piix4: Detect secondary SMBus controller on AMD AM4 chips=
ets
      (Test) i2c: piix4: Detect secondary SMBus controller on AMD AM4 chips=
ets

Thor Thayer (1):
      (Rev.) i2c: altera: cleanup spinlock

Tomasz Figa (1):
      (Rev.) i2c: core: support bus regulator controlling in adapter

Wolfram Sang (1):
      (Test) i2c: sh_mobile: simplify code and remove false compilation war=
ning

 .mailmap                                           |    2 +
 .../devicetree/bindings/i2c/i2c-designware.txt     |   73 -
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |   92 +
 Documentation/devicetree/bindings/i2c/i2c.txt      |   73 +-
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml          |   62 +
 .../bindings/i2c/snps,designware-i2c.yaml          |  156 ++
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |    8 +-
 MAINTAINERS                                        |   10 +-
 drivers/i2c/algos/i2c-algo-pca.c                   |    2 +-
 drivers/i2c/busses/Kconfig                         |   60 +-
 drivers/i2c/busses/Makefile                        |   19 +-
 drivers/i2c/busses/i2c-altera.c                    |   30 +-
 drivers/i2c/busses/i2c-at91-core.c                 |    2 +
 drivers/i2c/busses/i2c-at91-master.c               |   69 +-
 drivers/i2c/busses/i2c-at91.h                      |    7 +-
 drivers/i2c/busses/i2c-axxia.c                     |    8 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |   10 +-
 drivers/i2c/busses/i2c-bcm-kona.c                  |    7 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |   20 +-
 drivers/i2c/busses/i2c-cadence.c                   |  323 ++-
 drivers/i2c/busses/i2c-cht-wc.c                    |    6 +-
 drivers/i2c/busses/i2c-davinci.c                   |    4 +-
 drivers/i2c/busses/i2c-designware-common.c         |  327 ++-
 drivers/i2c/busses/i2c-designware-core.h           |   75 +-
 drivers/i2c/busses/i2c-designware-master.c         |  192 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   86 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |  276 +--
 drivers/i2c/busses/i2c-designware-slave.c          |   88 +-
 drivers/i2c/busses/i2c-digicolor.c                 |    4 +-
 drivers/i2c/busses/i2c-efm32.c                     |    4 -
 drivers/i2c/busses/i2c-emev2.c                     |    4 +-
 drivers/i2c/busses/i2c-exynos5.c                   |    8 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |    4 +-
 drivers/i2c/busses/i2c-i801.c                      |   12 +-
 drivers/i2c/busses/i2c-icy.c                       |    1 +
 drivers/i2c/busses/i2c-img-scb.c                   |    8 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |    4 +-
 drivers/i2c/busses/i2c-jz4780.c                    |    4 +-
 drivers/i2c/busses/i2c-lpc2k.c                     |    8 +-
 drivers/i2c/busses/i2c-meson.c                     |    8 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  329 ++-
 drivers/i2c/busses/i2c-mv64xxx.c                   |    4 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   | 2342 ++++++++++++++++=
++++
 drivers/i2c/busses/i2c-nvidia-gpu.c                |    5 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c            |    4 +-
 drivers/i2c/busses/i2c-omap.c                      |    4 +-
 drivers/i2c/busses/i2c-owl.c                       |    8 +-
 drivers/i2c/busses/i2c-pca-platform.c              |    3 +-
 drivers/i2c/busses/i2c-piix4.c                     |    3 +-
 drivers/i2c/busses/i2c-pnx.c                       |    1 -
 drivers/i2c/busses/i2c-powermac.c                  |   18 +-
 drivers/i2c/busses/i2c-pxa.c                       |  870 +++++---
 drivers/i2c/busses/i2c-qcom-cci.c                  |  791 +++++++
 drivers/i2c/busses/i2c-qup.c                       |   18 +-
 drivers/i2c/busses/i2c-rcar.c                      |    4 +-
 drivers/i2c/busses/i2c-rk3x.c                      |    8 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |    2 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |    7 +-
 drivers/i2c/busses/i2c-sirf.c                      |    4 +-
 drivers/i2c/busses/i2c-sprd.c                      |    4 +-
 drivers/i2c/busses/i2c-stm32.c                     |   10 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |    4 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |  138 +-
 drivers/i2c/busses/i2c-stu300.c                    |    4 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c                |    8 +-
 drivers/i2c/busses/i2c-synquacer.c                 |    8 +-
 drivers/i2c/busses/i2c-tegra.c                     |  248 ++-
 drivers/i2c/busses/i2c-uniphier-f.c                |    4 +-
 drivers/i2c/busses/i2c-uniphier.c                  |    4 +-
 drivers/i2c/busses/i2c-xlp9xx.c                    |    8 +-
 drivers/i2c/busses/i2c-xlr.c                       |    4 +-
 drivers/i2c/busses/i2c-zx2967.c                    |    4 +-
 drivers/i2c/i2c-core-acpi.c                        |    6 +-
 drivers/i2c/i2c-core-base.c                        |   96 +-
 drivers/i2c/i2c-core-of.c                          |    2 +-
 drivers/i2c/i2c-core.h                             |    6 +-
 drivers/i2c/i2c-slave-eeprom.c                     |   39 +-
 drivers/i2c/i2c-smbus.c                            |  104 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |    1 +
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   44 +-
 drivers/platform/mellanox/mlxreg-hotplug.c         |   11 +-
 include/linux/i2c-mux.h                            |    2 +-
 include/linux/i2c-smbus.h                          |    8 +-
 include/linux/i2c.h                                |   10 +-
 include/linux/platform_data/i2c-pxa.h              |   48 -
 85 files changed, 5962 insertions(+), 1444 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i=
2c.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i=
2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c
 create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7kuYQACgkQFA3kzBSg
KbYn9g//TlcVQqmd2XU3A8mJ6lpHwGXv2o0PnpJ6yAtQ7OldUpnx6GQv0KzaqFgk
p4ZsCb3Q7N3NxDmmV2BVchBLfu4sJca9PFVkBUVyr/2vXaClFhDLi0qNeGJaZtSw
U0UdJpEdqUEuP9+S+imztSdKB/RQu91a6GbpqxeZhErHVortu+M23vSX0qx/UAxM
inO9bDr1ADxh38livY9dxGJF0RSbSxU9rMMKXbABuFkm3VwDlv79wj6pKzk1jdod
+FVTXu91YHmhwOSBLfd41ogVRrIVTom9XA0QDVkXQZbYByILb7kSSvfZE7lZPSn1
wiTUXfHpaxWBm/K4a8fS2e99fSOnViZa875BBZpUmU6y8Xq+uUmzAgS/CTdu33uX
78QfL5TQ3vJqZbYEkKqnGaNCZYQVKeeRi0w1XcU9EaH6Fso8wDGjkqEjmcbQ72iX
wL7a/nu72ZB18umopO0qNUZqGWa620XZVmfm9Iw1icXvpmUmvkZsFVJ7LX/p9EkE
TQ6dJTtxRTpQwIwapNvXiDmBo5GEk/7SVjHkjD3oi15aMAbuENier+rDqMLJh7/x
sOjDbWCOZeVWed1qo91KbCaU/5YNgUQ1QDrAjGPOaIpYx1FwKn15FVw1vSyMm5ii
chtyV8io4WvnHql5hlus/9UqHE1m2M2HOHFg+7frgfYHXiDiBN0=
=u2FJ
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
