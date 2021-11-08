Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06B9447BCE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 09:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237983AbhKHIbV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 03:31:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:36266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237989AbhKHIbU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Nov 2021 03:31:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7748A6113D;
        Mon,  8 Nov 2021 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636360116;
        bh=NfCrJRZkNXf3V4VM7AzXPSOMR0GXp9Xmd5rlqemzm+w=;
        h=Date:From:To:Cc:Subject:From;
        b=LhgiaO8HnWVUSwMojgub+rqNN4I1DOeCwTbUJAUG1yTpFxekfZ4HLGPyyMo6LLMXQ
         /qx7p+FeeePWi/j3HQ6Xfi3hTZfc6xd03os/8p29UjIlHO3v45rJO8TgRR318Gx8VI
         tOv6gwmR+k8TBF6L1HO0NdWtD9FnGbJ92RE3p1+DFYi+xx37MJC0QlyEno0qHgTLpG
         EwaRqaA3P35NBkS52iQNgPAojf5TaH4rT4iKcYwR5FAajgd+zSBcaQ+r8ao9r0Y8W5
         jc9MdRwnexmmQSzDVbGhIXdbdW03VnmVqMIH52wDe6C5644+BaLQcoKxvZuxDoRvWM
         2DyYYxDZBCKXw==
Date:   Mon, 8 Nov 2021 09:28:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YYjfrZ69320no587@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ngX/cs6Wtftl2R9b"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ngX/cs6Wtftl2R9b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

after the hot-fix, here is my main pull request for I2C:

* big refactoring of the PASEMI driver to support the Apple M1
* huge improvements to the XIIC in terms of locking and SMP safety
* refactoring and clean ups for the i801 driver
* and a usual bunch of small driver updates

The latest two patches look like they have been applied only yesterday,
but they have been in the tree before and got lost for reasons I sadly
cannot recall or reproduce. They have been reviewed on October, 17th.

Please pull.

Thanks,

   Wolfram


The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-merge=
window

for you to fetch changes up to c6f49acb52c79f8e84af2eda4fc002a2068a6c9e:

  i2c: amd-mp2-plat: ACPI: Use ACPI_COMPANION() directly (2021-11-07 14:57:=
41 +0100)

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: i801: Add support for Intel Ice Lake PCH-N

Christophe JAILLET (2):
      i2c: switch from 'pci_' to 'dma_' API
      i2c: xlr: Fix a resource leak in the error handling path of 'xlr_i2c_=
probe()'

Dmitry Osipenko (1):
      i2c: tegra: Ensure that device is suspended before driver is removed

Heiner Kallweit (6):
      i2c: i801: Improve is_dell_system_with_lis3lv02d
      i2c: i801: Remove not needed check for PCI_COMMAND_INTX_DISABLE
      i2c: i801: Improve i801_acpi_probe/remove functions
      i2c: i801: Improve i801_add_mux
      i2c: i801: Use PCI bus rescan mutex to protect P2SB access
      i2c: i801: Stop using pm_runtime_set_autosuspend_delay(-1)

Jarkko Nikula (1):
      i2c: i801: Fix incorrect and needless software PEC disabling

Jie Deng (1):
      i2c: virtio: update the maintainer to Conghui

Kewei Xu (3):
      i2c: mediatek: fixing the incorrect register offset
      i2c: mediatek: Reset the handshake signal between i2c and dma
      i2c: mediatek: Dump i2c/dma register when a timeout occurs

Krzysztof Kozlowski (2):
      i2c: pxa: drop unneeded MODULE_ALIAS
      i2c: exynos: describe drivers in KConfig

Marek Vasut (6):
      i2c: xiic: Fix broken locking on tx_msg
      i2c: xiic: Drop broken interrupt handler
      i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in xiic_proces=
s()
      i2c: xiic: Switch from waitqueue to completion
      i2c: xiic: Only ever transfer single message
      i2c: xiic: Fix RX IRQ busy check

Michael Brunner (1):
      i2c: kempld: deprecate class based instantiation

Raag Jadav (1):
      dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05

Rafael J. Wysocki (1):
      i2c: amd-mp2-plat: ACPI: Use ACPI_COMPANION() directly

Randy Dunlap (1):
      i2c: qup: fix a trivial typo

Sven Peter (11):
      dt-bindings: i2c: Add Apple I2C controller bindings
      i2c: pasemi: Use io{read,write}32
      i2c: pasemi: Use dev_name instead of port number
      i2c: pasemi: Remove usage of pci_dev
      i2c: pasemi: Split off common probing code
      i2c: pasemi: Split pci driver to its own file
      i2c: pasemi: Move common reset code to own function
      i2c: pasemi: Allow to configure bus frequency
      i2c: pasemi: Refactor _probe to use devm_*
      i2c: pasemi: Add Apple platform driver
      i2c: pasemi: Set enable bit for Apple variant

Tian Tao (1):
      i2c: qup: move to use request_irq by IRQF_NO_AUTOEN flag

Vadim Pasternak (2):
      i2c: mlxcpld: Reduce polling time for performance improvement
      i2c: mlxcpld: Allow flexible polling time setting for I2C transactions

Wolfram Sang (3):
      i2c: rcar: enable interrupts before starting transfer
      Merge branch 'i2c/for-current' into i2c/for-mergewindow
      Merge tag 'at24-updates-for-v5.16' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/brgl/linux into i2c/for-mergewindow

zhaoxiao (1):
      i2c: bcm-kona: Fix return value in probe()


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (2):
      (Rev.) i2c: i801: Use PCI bus rescan mutex to protect P2SB access
      (Rev.) i2c: i801: Remove not needed check for PCI_COMMAND_INTX_DISABLE

Arnd Bergmann (10):
      (Rev.) i2c: pasemi: Set enable bit for Apple variant
      (Rev.) i2c: pasemi: Add Apple platform driver
      (Rev.) i2c: pasemi: Refactor _probe to use devm_*
      (Rev.) i2c: pasemi: Allow to configure bus frequency
      (Rev.) i2c: pasemi: Move common reset code to own function
      (Rev.) i2c: pasemi: Split pci driver to its own file
      (Rev.) i2c: pasemi: Split off common probing code
      (Rev.) i2c: pasemi: Remove usage of pci_dev
      (Rev.) i2c: pasemi: Use io{read,write}32
      (Rev.) dt-bindings: i2c: Add Apple I2C controller bindings

Chen-Yu Tsai (1):
      (Rev.) i2c: mediatek: fixing the incorrect register offset

Christian Zigotzky (11):
      (Test) i2c: pasemi: Set enable bit for Apple variant
      (Test) i2c: pasemi: Add Apple platform driver
      (Test) i2c: pasemi: Refactor _probe to use devm_*
      (Test) i2c: pasemi: Allow to configure bus frequency
      (Test) i2c: pasemi: Move common reset code to own function
      (Test) i2c: pasemi: Split pci driver to its own file
      (Test) i2c: pasemi: Split off common probing code
      (Test) i2c: pasemi: Remove usage of pci_dev
      (Test) i2c: pasemi: Use dev_name instead of port number
      (Test) i2c: pasemi: Use io{read,write}32
      (Test) dt-bindings: i2c: Add Apple I2C controller bindings

Jean Delvare (10):
      (Rev.) i2c: i801: Add support for Intel Ice Lake PCH-N
      (Rev.) i2c: i801: Fix incorrect and needless software PEC disabling
      (Rev.) i2c: i801: Stop using pm_runtime_set_autosuspend_delay(-1)
      (Rev.) i2c: i801: Use PCI bus rescan mutex to protect P2SB access
      (Rev.) i2c: i801: Improve i801_add_mux
      (Test) i2c: i801: Improve i801_add_mux
      (Rev.) i2c: i801: Improve i801_acpi_probe/remove functions
      (Test) i2c: i801: Improve i801_acpi_probe/remove functions
      (Rev.) i2c: i801: Remove not needed check for PCI_COMMAND_INTX_DISABLE
      (Rev.) i2c: i801: Improve is_dell_system_with_lis3lv02d

Mika Westerberg (1):
      (Rev.) i2c: i801: Improve i801_acpi_probe/remove functions

Niklas S=C3=B6derlund (1):
      (Rev.) i2c: rcar: enable interrupts before starting transfer

Qii Wang (3):
      (Rev.) i2c: mediatek: Dump i2c/dma register when a timeout occurs
      (Rev.) i2c: mediatek: Reset the handshake signal between i2c and dma
      (Rev.) i2c: mediatek: fixing the incorrect register offset

Rob Herring (1):
      (Rev.) dt-bindings: i2c: Add Apple I2C controller bindings

Ulrich Hecht (1):
      (Rev.) i2c: rcar: enable interrupts before starting transfer

 Documentation/devicetree/bindings/eeprom/at24.yaml |   6 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |  61 ++++++++
 MAINTAINERS                                        |   2 +-
 drivers/i2c/busses/Kconfig                         |  16 +-
 drivers/i2c/busses/Makefile                        |   3 +
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |   4 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |   5 +-
 drivers/i2c/busses/i2c-bcm-kona.c                  |   2 +-
 drivers/i2c/busses/i2c-i801.c                      |  83 ++++-------
 drivers/i2c/busses/i2c-ismt.c                      |  12 +-
 drivers/i2c/busses/i2c-kempld.c                    |   3 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |  14 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  82 ++++++++++-
 .../i2c/busses/{i2c-pasemi.c =3D> i2c-pasemi-core.c} | 114 ++++-----------
 drivers/i2c/busses/i2c-pasemi-core.h               |  21 +++
 drivers/i2c/busses/i2c-pasemi-pci.c                |  85 +++++++++++
 drivers/i2c/busses/i2c-pasemi-platform.c           | 122 ++++++++++++++++
 drivers/i2c/busses/i2c-pxa.c                       |   1 -
 drivers/i2c/busses/i2c-qup.c                       |   6 +-
 drivers/i2c/busses/i2c-rcar.c                      |   6 +-
 drivers/i2c/busses/i2c-tegra.c                     |   4 +-
 drivers/i2c/busses/i2c-xiic.c                      | 161 +++++++++--------=
----
 drivers/i2c/busses/i2c-xlr.c                       |   6 +-
 23 files changed, 558 insertions(+), 261 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 rename drivers/i2c/busses/{i2c-pasemi.c =3D> i2c-pasemi-core.c} (77%)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-core.h
 create mode 100644 drivers/i2c/busses/i2c-pasemi-pci.c
 create mode 100644 drivers/i2c/busses/i2c-pasemi-platform.c

--ngX/cs6Wtftl2R9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGI36kACgkQFA3kzBSg
KbabuQ//VkjDD+D5+pg1Mj6V9WWDPjw7ZgZ3upU1BQaiE4FIllWpINDMwV4N1PDY
XisS+4LHkDQgiCrMKHJmXyVLnqtnOss7qj85Ucijvpux9dGdMrE1FtD3D3QWN5L9
/SH3LYcCL655dBTX8sQObvwV7R3YjxsfgHSpmcGNlwkyrVGePfCCLbg7CKXCD3eY
Md6s590msUFxvbJcDRnt18xXqk4ozhZTazZMp8lJFPwks3iOiQTPN3gQq9VCEraH
15JKanOGTlk/NJzriF9FayrqeIepZbtnAQAw43YcEXjoHiiCGSusg+BhsPgoKk/2
R05k7l+8PVSciu3JfflXeEJV+b0a8vY+JigoJEIHGkfH9IGkFH5zBnFW9FsX1k9Z
XDtgM/OVknyKHVGdOJfkiqPc4U3x2nIo2Th55oY4nTXQO0KHU2xhS9d7WNOFQnlp
FoN5bJj7swdSyD5qOP22hmOkzccF4jsR7xgxgUUybEPW5VjcOhEFyIObhKRdUFtH
qC95uqJEy3FItBfiTlPhnC6VgFZsIuWnF3yWVRH28rCaVRdIKG5KkRSHgK1Hhfcn
Up9PpX73OHmZjdKZ0anS/oqtz4fF+oX/vlrHTk/5QfAV1wP4arCIAAeUy8nExLau
BkgndTVcLogMej6Qkrgotd/YnUveio5WnehVVgKnbXfu718Y65A=
=CTFS
-----END PGP SIGNATURE-----

--ngX/cs6Wtftl2R9b--
