Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569B5294880
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Oct 2020 08:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390578AbgJUGzJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Oct 2020 02:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730666AbgJUGzJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Oct 2020 02:55:09 -0400
Received: from localhost (p5b32cbae.dip0.t-ipconnect.de [91.50.203.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9D6B221FC;
        Wed, 21 Oct 2020 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603263307;
        bh=8fGGloocC7P23ysBQMhtChsYIrLtlnYYyEEr4KoJUu0=;
        h=Date:From:To:Cc:Subject:From;
        b=ZJiMm3fcsDsAhFUjdA6yv1Z/3hkjMsElVaYMlmCrH/GsMmPk/HV5WLTmPrKKZih4E
         XRkjgnbOPTxqfYgpIuKGnjyi+559yLovnmT6CszVhbnvT3fgV1Ww3M4Ayo7L3uM6jC
         hu3HkDMURL5vqt+n3oTyMmVr5wpQ6nAP28BpibN4=
Date:   Wed, 21 Oct 2020 08:55:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.10
Message-ID: <20201021065500.GA1429@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus, everyone,

during this short break of my holidays, I send the first pull request of
I2C for 5.10. Main changes:

* if a host can be a client, too, the I2C core can now use it to emulate
  SMBus HostNotify support (STM32 and R-Car added this so far)
* also for client mode, a testunit has been added. It can create rare
  situations on the bus, so host controllers can be tested
* a binding has been added to mark the bus as "single-master". This
  allows for better timeout detections
* new driver for Mellanox Bluefield
* massive refactoring of the Tegra driver
* EEPROMs recognized by the at24 driver can now have custom names
* rest is driver updates

Please pull.

Thanks,

   Wolfram


The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.10

for you to fetch changes up to 40daf09a30a0c86a038bcce606604333f32e03f8:

  Documentation: i2c: add testunit docs to index (2020-10-05 22:57:45 +0200)

----------------------------------------------------------------
Alain Volmat (4):
      i2c: smbus: add core function handling SMBus host-notify
      i2c: stm32f7: Add SMBus Host-Notify protocol support
      i2c: stm32: name slave slot to ease maintenance
      i2c: stm32: fix error message on upon dma_request_chan & defer handling

Andy Shevchenko (3):
      i2c: ismt: Describe parameters in kernel doc
      i2c: ismt: Add support for Intel Emmitsburg PCH
      i2c: nvidia-gpu: Use put_unaligned_be24()

Anson Huang (1):
      i2c: imx: Use dev_err_probe() to simplify error handling

Barry Song (1):
      i2c: busses: replace spin_lock_irqsave by spin_lock in hard IRQ

Dirk Behme (1):
      i2c: rcar: Auto select RESET_CONTROLLER

Dmitry Osipenko (32):
      i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
      i2c: tegra: Add missing pm_runtime_put()
      i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
      i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
      i2c: tegra: Initialize div-clk rate unconditionally
      i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
      i2c: tegra: Runtime PM always available on Tegra
      i2c: tegra: Remove error message used for devm_request_irq() failure
      i2c: tegra: Use reset_control_reset()
      i2c: tegra: Use devm_platform_get_and_ioremap_resource()
      i2c: tegra: Use platform_get_irq()
      i2c: tegra: Use clk-bulk helpers
      i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
      i2c: tegra: Clean up probe function
      i2c: tegra: Reorder location of functions in the code
      i2c: tegra: Clean up variable types
      i2c: tegra: Remove outdated barrier()
      i2c: tegra: Remove likely/unlikely from the code
      i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
      i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
      i2c: tegra: Rename wait/poll functions
      i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
      i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
      i2c: tegra: Factor out register polling into separate function
      i2c: tegra: Factor out hardware initialization into separate function
      i2c: tegra: Check errors for both positive and negative values
      i2c: tegra: Improve formatting of variables
      i2c: tegra: Clean up variable names
      i2c: tegra: Clean up printk messages
      i2c: tegra: Clean up and improve comments
      i2c: tegra: Clean up whitespaces, newlines and indentation
      i2c: tegra: Improve driver module description

Jaakko Laine (3):
      i2c: xiic: Change code alignment to 1 space only
      i2c: xiic: Improve struct memory alignment
      i2c: xiic: Support forcing single-master in DT

Jarkko Nikula (2):
      i2c: Remove 'default n' from busses/Kconfig
      i2c: i801: Add support for Intel Alder Lake PCH-S

Jean Delvare (2):
      eeprom: at24: Add support for the Sony VAIO EEPROMs
      eeprom: at24: Tidy at24_read()

Jeffrey Lin (1):
      i2c: i801: Register lis3lv02d I2C device on Dell Latitude 5480

Jon Hunter (3):
      eeprom: at24: Initialise AT24 NVMEM ID field
      dt-bindings: eeprom: at24: Add label property for AT24
      eeprom: at24: Support custom device names for AT24 EEPROMs

Khalil Blaiech (2):
      dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
      i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC

Krzysztof Kozlowski (10):
      i2c: mux: gpmux: Simplify with dev_err_probe()
      i2c: mux: reg: Simplify with dev_err_probe()
      i2c: bcm2835: Simplify with dev_err_probe()
      i2c: stm32: Simplify with dev_err_probe()
      i2c: rk3x: Simplify with dev_err_probe()
      i2c: imx: Fix external abort on interrupt in exit paths
      dt-bindings: i2c: imx-lpi2c: Add properties and use unevaluatedProperties
      dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QXP compatible matching
      dt-bindings: i2c: imx: Add properties and use unevaluatedProperties
      dt-bindings: i2c: imx: Fix i.MX 7 compatible matching

Paul Cercueil (3):
      dt-bindings: i2c: ingenic: Add compatible string for the JZ4770
      i2c: jz4780: Add compatible string for JZ4770 SoC
      i2c: jz4780: Remove of_match_ptr()

Tian Tao (1):
      i2c: Switch to using the new API kobj_to_dev()

Tom Rix (1):
      i2c: amd_mp2: handle num is 0 input for i2c_amd_xfer

Vadym Kochan (1):
      eeprom: at24: set type id as EEPROM

Wang ShaoBo (1):
      i2c: efm32: Use devm_platform_get_and_ioremap_resource()

Wolfram Sang (9):
      i2c: add binding to mark a bus as SMBus
      i2c: rcar: improve bus busy detection
      i2c: rcar: refactor and shorten timeout when resetting
      i2c: add slave testunit driver
      i2c: rcar: add HostNotify support
      misc: eeprom: use helper to get i2c_client from kobj
      Merge tag 'at24-updates-for-v5.10' of git://git.kernel.org/.../brgl/linux into i2c/for-5.10
      i2c: testunit: improve documentation
      Documentation: i2c: add testunit docs to index

 Documentation/devicetree/bindings/eeprom/at24.yaml |    3 +
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |   29 +-
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml |    8 +-
 Documentation/devicetree/bindings/i2c/i2c.txt      |    5 +
 .../devicetree/bindings/i2c/ingenic,i2c.yaml       |   12 +-
 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   42 +
 Documentation/i2c/busses/i2c-i801.rst              |    1 +
 Documentation/i2c/index.rst                        |    1 +
 Documentation/i2c/slave-testunit-backend.rst       |   69 +
 MAINTAINERS                                        |    6 +
 drivers/i2c/Kconfig                                |    9 +-
 drivers/i2c/Makefile                               |    1 +
 drivers/i2c/busses/Kconfig                         |   20 +-
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |    2 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |    8 +-
 drivers/i2c/busses/i2c-efm32.c                     |   12 +-
 drivers/i2c/busses/i2c-i801.c                      |    5 +
 drivers/i2c/busses/i2c-imx.c                       |   32 +-
 drivers/i2c/busses/i2c-ismt.c                      |   12 +-
 drivers/i2c/busses/i2c-jz4780.c                    |    3 +-
 drivers/i2c/busses/i2c-mlxbf.c                     | 2506 ++++++++++++++++++++
 drivers/i2c/busses/i2c-mv64xxx.c                   |    5 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |    3 +-
 drivers/i2c/busses/i2c-owl.c                       |    5 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |    5 +-
 drivers/i2c/busses/i2c-rcar.c                      |   65 +-
 drivers/i2c/busses/i2c-rk3x.c                      |   19 +-
 drivers/i2c/busses/i2c-stm32.c                     |   12 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |    6 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |  145 +-
 drivers/i2c/busses/i2c-tegra.c                     | 1420 ++++++-----
 drivers/i2c/busses/i2c-xiic.c                      |   62 +-
 drivers/i2c/i2c-slave-testunit.c                   |  175 ++
 drivers/i2c/i2c-smbus.c                            |  107 +
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |   16 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   10 +-
 drivers/misc/eeprom/at24.c                         |   71 +-
 drivers/misc/eeprom/eeprom.c                       |    2 +-
 include/linux/i2c-smbus.h                          |   12 +
 include/linux/i2c.h                                |    2 +-
 41 files changed, 4009 insertions(+), 920 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 Documentation/i2c/slave-testunit-backend.rst
 create mode 100644 drivers/i2c/busses/i2c-mlxbf.c
 create mode 100644 drivers/i2c/i2c-slave-testunit.c

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+P2z8ACgkQFA3kzBSg
KbZLChAAjcTZAZUuUAao9Kn5uab1q2OxGOYUSFMuQjklX6GGY0rIU+mAhhvgP6wD
vhqPoKt37+i8Dc+Lx05pUfC2KNY07FOflRtM+ljTk/OIKoiMN4tRxsC921l3k48p
AAFMy/Y3wHq/zfJtx+R9YNl01lAm7DpQFBW9N+4OgrU7CDoatEqIG/EmORFhE6HJ
wwEtj9Db6DzszUvn+2e9SnXlcZyZdkI8Yu2KVmFjjYB5WuJ65IrBMKfMFnWWBixz
ZdGbx4tXUIq5jIU+EWAIQdPcbeAv3kK2z9nVz1iiFcFp1N2tLys4LS2wj53k3Xir
tKUtroZ5tZG6yg+MOs0vHxit+Edrrs7yaEmlIXbLnpNFXF/JEFPbqFMUAOPZc3Ph
pdfTyQmYG4LolLcnuamg/ZcuZUX2lfZMasTjOZ3oCsOBbcSN8nzJxLAc91B4QlSA
cq3VO7gCng7enEZzoVGwJaqDdQLXEtCangyEQCYVqCb09KlNQsCKjvVH4ClPrGZ8
tjdGRJOsRGm5bWk0Gu26ER3VGMvh6UzvMfyP5zUXFUD7rlFW88Lc0U2Em6IboJVM
qmvSOAdYDhpfZsj55TIYNFwU+e+y3B4tzgkG4fsmFLnvOXwynDZGfk3OKnX9ls4p
2g4boIJLsROhLkSKUH6WVR+qZ7uX/zIYjvkvAFbwJ76lBMDyyJ8=
=0x6o
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
