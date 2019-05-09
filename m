Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02DF192AC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 21:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfEITMA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 15:12:00 -0400
Received: from sauhun.de ([88.99.104.3]:35258 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbfEITL7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 May 2019 15:11:59 -0400
Received: from localhost (p54B33113.dip0.t-ipconnect.de [84.179.49.19])
        by pokefinder.org (Postfix) with ESMTPSA id 3C6412E3571;
        Thu,  9 May 2019 21:11:56 +0200 (CEST)
Date:   Thu, 9 May 2019 21:11:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.2
Message-ID: <20190509191132.GA9306@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has for you:

* API for late atomic transfers (e.g. to shut down via PMIC). We have a
  seperate callback now which is called under clearly defined
  conditions. In-kernel users are converted, too.
* new driver for the AMD PCIe MP2 I2C controller
* large refactoring for at91 and bcm-iproc (both gain slave support
  due to this)
* and a good share of various driver improvements anf fixes

Please pull.

Thanks,

   Wolfram


The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.2

for you to fetch changes up to e6ae3ca27477226eae77cc00d5fad89d7ce64aea:

  dt-bindings: i2c: riic: document r7s9210 support (2019-05-03 16:53:31 +0200)

----------------------------------------------------------------
Adamski, Krzysztof (Nokia - PL/Wroclaw) (1):
      i2c: axxia: use auto cmd for last message

Andy Shevchenko (1):
      i2c: at91: Convert to use struct i2c_timings

Anson Huang (1):
      i2c: imx-lpi2c: Use __maybe_unused instead of #if CONFIG_PM_SLEEP

Bartosz Golaszewski (1):
      MAINTAINERS: change my e-mail address for at24

Bich HEMON (2):
      dt-bindings: i2c: stm32: remove extra spaces
      dt-bindings: i2c: stm32: update optional properties for stm32h7/stm32mp1

Bjorn Helgaas (1):
      i2c: isch: Remove unnecessary acpi.h include

Chris Brandt (1):
      dt-bindings: i2c: riic: document r7s9210 support

Dan Carpenter (1):
      i2c: nomadik: remove an unnecessary NULL check in nmk_i2c_remove()

Elie Morisse (1):
      i2c: Add drivers for the AMD PCIe MP2 I2C controller

Fabien Parent (1):
      dt-bindings: i2c: i2c-mtk: add support for MT8516

Geert Uytterhoeven (2):
      dt-bindings: at24: add Renesas R1EX24016
      i2c: riic: Add Runtime PM support

Gustavo A. R. Silva (1):
      i2c: mux: demux-pinctrl: use struct_size() in devm_kzalloc()

Juergen Fitschen (3):
      i2c: at91: segregate master mode specific code from probe and init func
      i2c: at91: split driver into core and master file
      i2c: at91: added slave mode support

Michael Cheng (1):
      i2c: iproc: Add support for more master error status

Nicolas Le Bayon (1):
      i2c: i2c-stm32f7: improve loopback in timing algorithm

Phil Edworthy (2):
      dt: snps,designware-i2c: Add clock bindings documentation
      i2c: designware: Add support for an interface clock

Pu Wen (1):
      i2c-piix4: Add Hygon Dhyana SMBus support

Qii Wang (5):
      i2c: mediatek: Add offsets array for new i2c registers
      dt-bindings: i2c: Add Mediatek MT8183 i2c binding
      i2c: mediatek: Add arb clock in i2c driver
      i2c: mediatek: Add i2c and apdma sync in i2c driver
      i2c: mediatek: Add i2c support for MediaTek MT8183

Ray Jui (2):
      dt-bindings: i2c: iproc: make 'interrupts' optional
      i2c: iproc: Change driver to use 'BIT' macro

Rayagonda Kokatanur (4):
      i2c: iproc: add polling support
      i2c: iproc: use wrapper for read/write access
      dt-bindings: i2c: iproc: add "brcm, iproc-nic-i2c" compatible string
      i2c: iproc: add NIC I2C support

Robert Shearman (3):
      i2c: mux: pca954x: remove support for unused platform data
      i2c: mux: pca9541: remove support for unused platform data
      i2c: mux: pca954x: allow management of device idle state via sysfs

Shreesha Rajashekar (2):
      i2c: iproc: Extend I2C read up to 255 bytes
      i2c: iproc: Add slave mode support

Wolfram Sang (21):
      i2c: rcar: sanity check for minimal DMA length
      i2c: rcar: let DMA enable routine return success status
      i2c: rcar: wait for data empty before starting DMA
      i2c: apply coding style for struct i2c_adapter
      i2c: brcmstb: remove unused struct member
      i2c: core: remove use of in_atomic()
      i2c: core: use I2C locking behaviour also for SMBUS
      i2c: core: introduce callbacks for atomic transfers
      i2c: mux: populate the new *_atomic callbacks
      i2c: demux: handle the new atomic callbacks
      i2c: omap: Add the master_xfer_atomic hook
      i2c: tegra-bpmp: convert to use new atomic callbacks
      i2c: ocores: refactor setup for polling
      i2c: ocores: enable atomic xfers
      i2c: stu300: use xfer_atomic callback to bail out early
      i2c: algo: bit: add flag to whitelist atomic transfers
      i2c: gpio: flag atomic capability if possible
      Merge tag 'at24-v5.2-updates-for-wolfram' of git://git.kernel.org/.../brgl/linux into i2c/for-5.2
      Merge branch 'i2c-mux/for-next' of https://github.com/peda-r/i2c-mux into i2c/for-5.2
      i2c: core: ratelimit 'transfer when suspended' errors
      i2c: core: apply 'is_suspended' check for SMBus, too


with much appreciated quality assurance from
----------------------------------------------------------------
Alexander Sverdlin (1):
      (Rev.) i2c: axxia: use auto cmd for last message

Andrew Lunn (2):
      (Rev.) i2c: ocores: enable atomic xfers
      (Rev.) i2c: ocores: refactor setup for polling

Andy Shevchenko (1):
      (Rev.) i2c: apply coding style for struct i2c_adapter

Chris Brandt (1):
      (Test) i2c: riic: Add Runtime PM support

Geert Uytterhoeven (3):
      (Rev.) dt-bindings: i2c: riic: document r7s9210 support
      (Rev.) i2c: rcar: let DMA enable routine return success status
      (Rev.) i2c: rcar: sanity check for minimal DMA length

Jarkko Nikula (2):
      (Test) i2c: designware: Add support for an interface clock
      (Rev.) dt: snps,designware-i2c: Add clock bindings documentation

Jean Delvare (2):
      (Rev.) i2c-piix4: Add Hygon Dhyana SMBus support
      (Rev.) i2c: isch: Remove unnecessary acpi.h include

Linus Walleij (2):
      (Rev.) i2c: gpio: flag atomic capability if possible
      (Rev.) i2c: stu300: use xfer_atomic callback to bail out early

Matthias Brugger (5):
      (Rev.) i2c: mediatek: Add i2c support for MediaTek MT8183
      (Rev.) i2c: mediatek: Add i2c and apdma sync in i2c driver
      (Rev.) i2c: mediatek: Add arb clock in i2c driver
      (Rev.) dt-bindings: i2c: Add Mediatek MT8183 i2c binding
      (Rev.) i2c: mediatek: Add offsets array for new i2c registers

Mukesh Ojha (1):
      (Rev.) i2c: isch: Remove unnecessary acpi.h include

Nicolas Boichat (3):
      (Rev.) i2c: mediatek: Add i2c support for MediaTek MT8183
      (Rev.) i2c: mediatek: Add i2c and apdma sync in i2c driver
      (Rev.) i2c: mediatek: Add arb clock in i2c driver

Niklas S??derlund (1):
      (Rev.) i2c: riic: Add Runtime PM support

Peter Rosin (1):
      (Rev.) i2c: mux: populate the new *_atomic callbacks

Pierre-Yves MORDRET (3):
      (Rev.) dt-bindings: i2c: stm32: update optional properties for stm32h7/stm32mp1
      (Rev.) dt-bindings: i2c: stm32: remove extra spaces
      (Rev.) i2c: i2c-stm32f7: improve loopback in timing algorithm

Rob Herring (5):
      (Rev.) dt-bindings: i2c: riic: document r7s9210 support
      (Rev.) dt-bindings: i2c: Add Mediatek MT8183 i2c binding
      (Rev.) dt-bindings: i2c: iproc: add "brcm, iproc-nic-i2c" compatible string
      (Rev.) dt-bindings: i2c: iproc: make 'interrupts' optional
      (Rev.) dt: snps,designware-i2c: Add clock bindings documentation

Simon Horman (8):
      (Rev.) i2c: core: apply 'is_suspended' check for SMBus, too
      (Rev.) i2c: core: ratelimit 'transfer when suspended' errors
      (Rev.) i2c: tegra-bpmp: convert to use new atomic callbacks
      (Rev.) i2c: omap: Add the master_xfer_atomic hook
      (Rev.) i2c: apply coding style for struct i2c_adapter
      (Rev.) i2c: rcar: wait for data empty before starting DMA
      (Rev.) i2c: rcar: let DMA enable routine return success status
      (Rev.) i2c: rcar: sanity check for minimal DMA length

Stefan Lengfeld (2):
      (Test) i2c: core: introduce callbacks for atomic transfers
      (Test) i2c: core: remove use of in_atomic()

Timo Alho (1):
      (Rev.) i2c: tegra-bpmp: convert to use new atomic callbacks

 .../ABI/testing/sysfs-bus-i2c-devices-pca954x      |  20 +
 Documentation/devicetree/bindings/eeprom/at24.txt  |   1 +
 .../devicetree/bindings/i2c/brcm,iproc-i2c.txt     |  17 +-
 .../devicetree/bindings/i2c/i2c-designware.txt     |   9 +
 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   5 +-
 Documentation/devicetree/bindings/i2c/i2c-riic.txt |   5 +-
 .../devicetree/bindings/i2c/i2c-stm32.txt          |  37 +-
 Documentation/i2c/busses/i2c-amd-mp2               |  23 +
 Documentation/i2c/busses/i2c-piix4                 |   2 +
 MAINTAINERS                                        |  13 +-
 drivers/i2c/algos/i2c-algo-bit.c                   |  22 +-
 drivers/i2c/busses/Kconfig                         |  25 +
 drivers/i2c/busses/Makefile                        |   5 +
 drivers/i2c/busses/i2c-amd-mp2-pci.c               | 483 +++++++++++++
 drivers/i2c/busses/i2c-amd-mp2-plat.c              | 367 ++++++++++
 drivers/i2c/busses/i2c-amd-mp2.h                   | 219 ++++++
 drivers/i2c/busses/i2c-at91-core.c                 | 376 ++++++++++
 .../i2c/busses/{i2c-at91.c => i2c-at91-master.c}   | 480 +------------
 drivers/i2c/busses/i2c-at91-slave.c                | 143 ++++
 drivers/i2c/busses/i2c-at91.h                      | 174 +++++
 drivers/i2c/busses/i2c-axxia.c                     |  57 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 | 764 +++++++++++++++++----
 drivers/i2c/busses/i2c-brcmstb.c                   |   1 -
 drivers/i2c/busses/i2c-designware-common.c         |  18 +-
 drivers/i2c/busses/i2c-designware-core.h           |   2 +
 drivers/i2c/busses/i2c-designware-platdrv.c        |   5 +
 drivers/i2c/busses/i2c-gpio.c                      |   2 +
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  11 +-
 drivers/i2c/busses/i2c-isch.c                      |   1 -
 drivers/i2c/busses/i2c-mt65xx.c                    | 255 +++++--
 drivers/i2c/busses/i2c-nomadik.c                   |   3 +-
 drivers/i2c/busses/i2c-ocores.c                    |  16 +-
 drivers/i2c/busses/i2c-omap.c                      |  76 +-
 drivers/i2c/busses/i2c-piix4.c                     |  15 +-
 drivers/i2c/busses/i2c-rcar.c                      |  30 +-
 drivers/i2c/busses/i2c-riic.c                      |  43 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   4 +
 drivers/i2c/busses/i2c-stu300.c                    |  25 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c                |  25 +-
 drivers/i2c/i2c-core-base.c                        |  23 +-
 drivers/i2c/i2c-core-smbus.c                       |  29 +-
 drivers/i2c/i2c-core.h                             |  36 +
 drivers/i2c/i2c-mux.c                              |   6 +
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |   6 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c                |   8 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                | 106 ++-
 include/linux/i2c-algo-bit.h                       |   1 +
 include/linux/i2c.h                                |  41 +-
 include/linux/platform_data/pca954x.h              |  48 --
 49 files changed, 3151 insertions(+), 932 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-pca954x
 create mode 100644 Documentation/i2c/busses/i2c-amd-mp2
 create mode 100644 drivers/i2c/busses/i2c-amd-mp2-pci.c
 create mode 100644 drivers/i2c/busses/i2c-amd-mp2-plat.c
 create mode 100644 drivers/i2c/busses/i2c-amd-mp2.h
 create mode 100644 drivers/i2c/busses/i2c-at91-core.c
 rename drivers/i2c/busses/{i2c-at91.c => i2c-at91-master.c} (65%)
 create mode 100644 drivers/i2c/busses/i2c-at91-slave.c
 create mode 100644 drivers/i2c/busses/i2c-at91.h
 delete mode 100644 include/linux/platform_data/pca954x.h

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzUe10ACgkQFA3kzBSg
KbYh7w/+P7EgsTY2Lf++2poJw4YFJKPynb1vBRZSZ99IaEUevz/k92CT3/d5U2kB
XV56CRJu/IohVSWrh+w2OvBBJxe5dMxy+MjmQhrBn1a1xDAsjmMFNEDajpXd+iZO
vXy0bEKxvkwTCgN2ZOkSSRLp2lcX2RbwEbAfs0aC2gS1NJVz+m4EUok1eiwkaNHN
g+deGclLltvo/AK6pPeSqX3ojy7GeOr9yvWvmM7UUAKP48UrwwPTBPVf65XRRRpa
GE14tOOuDpRIzKiZk+6+w/JHVAXP04UquC1zl9nuUVAL71aJtOyp0uhj8e5G6Znz
aGF0X5ED6aRPULVDxCdCzC8z96f7h89Zh0RIJyLYTbc0aw4opjy1Gxh4hvDWIDn4
Uz3E9H7AWVy0gTk5C9xxRtZQ6ArCOH0JWrY1M3i5+K87Mc5f9TNYdTPcWVCtZTUq
pccKk28fXk6vG4haLFIYKBZtVQWW8LbzeMoMz5VUVkS5lrc1CRAOxEOgwDvoOV2Q
QlH/DPMjZ8wak+MDxjCfUYrBsK5xLYhOPs3GaHQBc+Y/Up6JjIsEwonmvbLYhLDv
0Bo8a0zxD/kuVeLH2IfMuawEWSbyDuHh2zx/ix2vBOn6LVqAcVIyOFiiUSq1I8Qg
54sVms8iWIqhRl+BA2tieZr3gyrGQm+pt4vvvHGnvfdcWeYQG48=
=xSPh
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
