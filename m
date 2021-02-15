Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23ADE31B793
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 11:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhBOKqe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 05:46:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:46786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230359AbhBOKqV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Feb 2021 05:46:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE0764E34;
        Mon, 15 Feb 2021 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613385933;
        bh=5h8KO1xMiydUBxIGjSj0caOJTB/bzfbXlBwubzrbiQ8=;
        h=Date:From:To:Cc:Subject:From;
        b=gcgH6rjINL4ltclaXuRsWhWtNW95sGmHBLWxOwCHAqbarj2C3eallRzrPQDs1T+Qm
         xZTi0YX4+rRM63romq3uUB++/SMVyoUwYhIwY7dqFjNBFAa3tFLg9ihB3nJzNOZltd
         tbj/k82aGQxNU8f3q0TJh9E40A2+d6u+buImzTHwWvF33ekM8JYi96LaZgjTNuzesd
         zHS1ynUDVUr/FuQSkcpTcbxOsw38MPEWZ/4pWqEg6bGG83tP0rQvXU9sVGXScVc1Hw
         bgDh9Lg9MGeaMFcJ5muC0dHrwYqgvtcnEM2oMprOIeN/XqFpboknobMTfsWdH0PT5Q
         j2vXSM7KeJZiw==
Date:   Mon, 15 Feb 2021 11:45:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.12
Message-ID: <20210215104527.GA8113@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has this time:

* mostly driver updates. Bigger ones for mlxcpld and iproc. But most of
  them are all over the place.
* removal of the efm32, sirf, u300, and zte zx bus drivers because of
  platform removal. So, we have a pleasant diffstat this time.
* first set of cleanups in the I2C core as preparation to increase
  maximum length of SMBus transfers to 255 (as specified in the new
  standard). Better documentation of struct i2c_msg and its flags stand
  out here.
* the testunit can now respond to SMBus block process calls which is the
  testcase when implementing the above new maximum length.

Please pull.

Thanks,

   Wolfram


The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.12

for you to fetch changes up to 0b16cfd9e660f59e396ab5f3af7d49e3677e3f9c:

  i2c: remove redundant error print in stm32f7_i2c_probe (2021-02-12 11:37:=
37 +0100)

----------------------------------------------------------------
Andre Przywara (1):
      dt-bindings: i2c: mv64xxx: Add H616 compatible string

Andy Shevchenko (3):
      gpiolib: Follow usual pattern for gpiod_remove_lookup_table() call
      i2c: i801: Drop duplicate NULL check in i801_del_mux()
      i2c: i801: Refactor mux code since platform_device_unregister() is NU=
LL aware

Arnd Bergmann (3):
      i2c: remove sirf bus driver
      i2c: remove u300 bus driver
      i2c: remove zte zx bus driver

Dmitry Osipenko (1):
      i2c: tegra: Use threaded interrupt

Dmitry Torokhov (1):
      i2c: smbus: switch from loops to memcpy

Evan Green (2):
      i2c: i2c-mux-gpio: Factor out pdev->dev in _probe_dt()
      i2c: i2c-mux-gpio: Enable this driver in ACPI land

Geert Uytterhoeven (1):
      dt-bindings: eeprom: at24: Document ROHM BR24G01

Hans de Goede (1):
      i2c: core: Do not print duplicate error when failing to register an i=
2c-client from ACPI

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Alder Lake PCH-P

Kevin Paul Herbert (1):
      i2c: imx: Synthesize end of transaction events without idle interrupts

Menglong Dong (1):
      i2c: remove redundant error print in stm32f7_i2c_probe

Rayagonda Kokatanur (6):
      i2c: iproc: handle Master aborted error
      i2c: iproc: handle only slave interrupts which are enabled
      i2c: iproc: update slave isr mask (ISR_MASK_SLAVE)
      i2c: iproc: fix typo in slave_isr function
      i2c: iproc: handle master read request
      i2c: iproc: handle rx fifo full interrupt

Richard Neumann (2):
      i2c: amd-mp2: convert to PCI logging functions
      i2c: amd-mp2: Remove unused macro

Roja Rani Yarubandi (2):
      i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct
      i2c: i2c-qcom-geni: Add shutdown callback for i2c

Samuel Holland (2):
      i2c: mv64xxx: Add runtime PM support
      i2c: mv64xxx: Fix check for missing clock after adding RPM

Tian Tao (1):
      i2c: fix platform_get_irq.cocci warnings

Tom Rix (1):
      i2c: stub: remove definition of DEBUG

Uwe Kleine-K=C3=B6nig (1):
      i2c: Drop unused efm32 bus driver

Vadim Pasternak (12):
      i2c: mlxcpld: Update module license
      i2c: mlxcpld: Decrease polling time for performance improvement
      i2c: mlxcpld: Add support for I2C bus frequency setting
      i2c: mux: mlxcpld: Update module license
      platform/x86: mlxcpld: Update module license
      i2c: mux: mlxcpld: Move header file out of x86 realm
      i2c: mux: mlxcpld: Convert driver to platform driver
      i2c: mux: mlxcpld: Prepare mux selection infrastructure for two-byte =
support
      i2c: mux: mlxcpld: Get rid of adapter numbers enforcement
      i2c: mux: mlxcpld: Extend driver to support word address space devices
      i2c: mux: mlxcpld: Extend supported mux number
      i2c: mux: mlxcpld: Add callback to notify mux creation completion

Weihang Li (1):
      i2c: busses: Replace spin_lock_irqsave with spin_lock in hard IRQ

Wolfram Sang (18):
      i2c: rcar: faster irq code to minimize HW race condition
      i2c: rcar: optimize cacheline to minimize HW race condition
      i2c: rcar: make sure irq is not threaded on Gen2 and earlier
      i2c: rcar: protect against supurious interrupts on V3U
      i2c: gpio: fix MODULE_LICENCE
      dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U) support
      i2c: refactor documentation of struct i2c_msg
      i2c: remove licence boilerplate from main UAPI header
      i2c: remove licence boilerplate from i2c-dev UAPI header
      i2c: uapi: add macro to describe support for all SMBus transfers
      i2c: algo: bit: use new macro to specifiy capabilities
      i2c: qup: advertise SMBus transfers using RECV_LEN
      i2c: s3c2410: advertise SMBus transfers using RECV_LEN
      Merge tag 'v5.11-rc5' into i2c/for-5.12
      i2c: smbus: don't abuse loop variable
      i2c: smbus: improve naming in i2c_smbus_xfer_emulated()
      Merge tag 'at24-updates-for-v5.12' of git://git.kernel.org/.../brgl/l=
inux into i2c/for-5.12
      i2c: testunit: add support for block process calls

Zheng Yongjun (2):
      i2c: use DIV_ROUND_UP macro to do calculation
      i2c: busses: Use DEFINE_SPINLOCK() for spinlock


with much appreciated quality assurance from
----------------------------------------------------------------
Akash Asthana (2):
      (Rev.) i2c: i2c-qcom-geni: Add shutdown callback for i2c
      (Rev.) i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct

Andy Shevchenko (3):
      (Rev.) i2c: amd-mp2: Remove unused macro
      (Rev.) i2c: amd-mp2: convert to PCI logging functions
      (Rev.) i2c: core: Do not print duplicate error when failing to regist=
er an i2c-client from ACPI

Fabio Estevam (1):
      (Rev.) i2c: use DIV_ROUND_UP macro to do calculation

Geert Uytterhoeven (1):
      (Rev.) dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U) support

Linus Walleij (1):
      (Rev.) i2c: remove u300 bus driver

Luca Ceresoli (1):
      (Rev.) i2c: smbus: switch from loops to memcpy

Michael Shych (4):
      (Rev.) i2c: mux: mlxcpld: Extend supported mux number
      (Rev.) i2c: mux: mlxcpld: Extend driver to support word address space=
 devices
      (Rev.) i2c: mux: mlxcpld: Convert driver to platform driver
      (Rev.) i2c: mux: mlxcpld: Move header file out of x86 realm

Mika Westerberg (1):
      (Rev.) i2c: core: Do not print duplicate error when failing to regist=
er an i2c-client from ACPI

Niklas S=C3=B6derlund (4):
      (Rev.) i2c: rcar: protect against supurious interrupts on V3U
      (Rev.) i2c: rcar: make sure irq is not threaded on Gen2 and earlier
      (Rev.) i2c: rcar: optimize cacheline to minimize HW race condition
      (Rev.) i2c: rcar: faster irq code to minimize HW race condition

Oleksij Rempel (2):
      (Test) i2c: imx: Synthesize end of transaction events without idle in=
terrupts
      (Rev.) i2c: imx: Synthesize end of transaction events without idle in=
terrupts

Ondrej Jirman (1):
      (Test) i2c: mv64xxx: Add runtime PM support

 Documentation/devicetree/bindings/eeprom/at24.yaml |    9 +-
 Documentation/devicetree/bindings/i2c/i2c-sirf.txt |   19 -
 .../devicetree/bindings/i2c/i2c-stu300.txt         |   15 -
 .../devicetree/bindings/i2c/i2c-zx2967.txt         |   22 -
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |   21 +-
 .../devicetree/bindings/i2c/renesas,i2c.txt        |    1 +
 Documentation/i2c/slave-testunit-backend.rst       |   23 +-
 drivers/gpio/gpiolib.c                             |    4 +
 drivers/i2c/algos/i2c-algo-bit.c                   |    4 +-
 drivers/i2c/busses/Kconfig                         |   39 -
 drivers/i2c/busses/Makefile                        |    4 -
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |   55 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |    3 +-
 drivers/i2c/busses/i2c-amd-mp2.h                   |    6 -
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  254 +++--
 drivers/i2c/busses/i2c-digicolor.c                 |    5 +-
 drivers/i2c/busses/i2c-efm32.c                     |  469 ---------
 drivers/i2c/busses/i2c-elektor.c                   |    3 +-
 drivers/i2c/busses/i2c-gpio.c                      |    2 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |    4 +-
 drivers/i2c/busses/i2c-i801.c                      |   17 +-
 drivers/i2c/busses/i2c-imx.c                       |   65 +-
 drivers/i2c/busses/i2c-jz4780.c                    |    5 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |   97 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |  122 ++-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   93 +-
 drivers/i2c/busses/i2c-qup.c                       |    2 +-
 drivers/i2c/busses/i2c-rcar.c                      |   66 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |    2 +-
 drivers/i2c/busses/i2c-sirf.c                      |  475 ---------
 drivers/i2c/busses/i2c-stm32f7.c                   |    6 +-
 drivers/i2c/busses/i2c-stu300.c                    | 1008 ----------------=
----
 drivers/i2c/busses/i2c-tegra.c                     |    9 +-
 drivers/i2c/busses/i2c-zx2967.c                    |  602 ------------
 drivers/i2c/i2c-core-acpi.c                        |    6 +-
 drivers/i2c/i2c-core-smbus.c                       |   46 +-
 drivers/i2c/i2c-slave-testunit.c                   |   12 +-
 drivers/i2c/i2c-stub.c                             |    1 -
 drivers/i2c/muxes/i2c-mux-gpio.c                   |  112 ++-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c                |  163 ++--
 include/linux/platform_data/mlxcpld.h              |   31 +
 include/linux/platform_data/x86/mlxcpld.h          |   52 -
 include/uapi/linux/i2c-dev.h                       |   25 +-
 include/uapi/linux/i2c.h                           |  128 +--
 44 files changed, 906 insertions(+), 3201 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sirf.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-stu300.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-zx2967.txt
 delete mode 100644 drivers/i2c/busses/i2c-efm32.c
 delete mode 100644 drivers/i2c/busses/i2c-sirf.c
 delete mode 100644 drivers/i2c/busses/i2c-stu300.c
 delete mode 100644 drivers/i2c/busses/i2c-zx2967.c
 create mode 100644 include/linux/platform_data/mlxcpld.h
 delete mode 100644 include/linux/platform_data/x86/mlxcpld.h

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAqUMMACgkQFA3kzBSg
Kbam0w//Zjf+X9XpBXc5rlCquLlUU3aSQ/h9CZsOrvihRnxcy0+oYRsvLPEw4T6W
nRnCnYTsaXQG3tGbTHlwPRz88vSTbN7Em5HuoCYTz60A3KTeGVij6hK65SzDsupj
Khp5OkAo/rx4uJmwj3RkOdWhh+8i7Si9c4Y+k2HSUr7vWZQSwusUxERdJreTdS93
xcN755eVVqchMxiLlTqho7AXl6kg9r2b3Bi2Eq1AURjgTDIY1d0Rfi7jE9LK5WQX
0PTc4D++V2rZruvPBlKTUHis35EIHY0ksgqVDnoJlcn8162508t//21D4uiMNQvP
l1hGvuU5P6M6ZWbFZaOedyppI63wGPt3QXpWeH3XKHSfPTFwMpR9kXie2COLAcdO
tUtvRjgMLE7OHRkP7mgRiWatlqVMnLwAs6XsuaTJY/Lb7as8Is4n4JINJWryGXJM
XIxiuu2O5q/itthMHBv/+acKxhqvY7Ky6nXOv0HnRTcabir2vo3JnvVzm/JQO3Sm
cslEnEWFtCiJvboVx2jllQzJU5+DqzbQRaKDGfx6CkUPzAhqX8z6E+BpzfY2Z7c2
a55yyrU/qjfhsMfdW2KbcBymob80SmjMauxNBAwGTOKSe/ewg+Jwu650XVtIsDjk
C3byaZZZVusVD82JrMIBP74pv0r15ZxJTtcSRdk/eLt50a0c3p4=
=YFDM
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
