Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC82155CB9
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2020 18:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgBGRTh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Feb 2020 12:19:37 -0500
Received: from sauhun.de ([88.99.104.3]:34244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbgBGRTh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Feb 2020 12:19:37 -0500
Received: from localhost (p54B336F4.dip0.t-ipconnect.de [84.179.54.244])
        by pokefinder.org (Postfix) with ESMTPSA id A3F5D2C054E;
        Fri,  7 Feb 2020 18:19:30 +0100 (CET)
Date:   Fri, 7 Feb 2020 18:19:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.6
Message-ID: <20200207171923.GA9783@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

here is my pull request for this cycle. I finally started using
'--edit-description' of 'git branch', so hopefully this is helpful to
you. Other than that, my pull request and some of the applied patches
are later than I would like, yet the christmas and holiday season were
shortening the working time of this cycle quite a bit. Still, all the
code got linux-next coverage and didn't show conflicts.

Please pull.

Thanks,

   Wolfram


The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.6

for you to fetch changes up to b49f8e0e7bd17b968129790e40f9e2566f4f95ec:

  i2c: cros-ec-tunnel: Fix ACPI identifier (2020-01-31 09:01:25 +0100)

----------------------------------------------------------------
(from the branch description for i2c/for-5.6 local branch)

The I2C subsystems has for 5.6:

- huge improvements and refactorizations of the Linux I2C documentation
  (lots of thanks to Luca for doing it and Jean for the careful review)
- subsystem wide API conversion to i2c_new_client_device()
- remove obsolete parport-light driver
- smaller core updates (removal of 'extern', enabling more compile testing,
  use more helper macros)
- and quite a bunch of driver updates (new IDs, simplifications, better PM,
  support of atomic transfers and other improvements)

i2c-mux updates for 5.6:

- The main feature is the idle-state rework of the pca954x driver from
  Biwen Li

at24 updates for 5.6:

- minor maintenance: update the license tag, sort headers
- move support for the write-protect pin into nvmem core
- add a reference to the new wp-gpios property in nvmem to at25 bindings
- add support for regulator and pm_runtime control

----------------------------------------------------------------
Akshu Agrawal (1):
      i2c: cros-ec-tunnel: Fix slave device enumeration

Alain Volmat (1):
      i2c: stm32f7: add PM_SLEEP suspend/resume support

Alex Williams (1):
      i2c: cadence: Handle transfer_size rollover

Bartosz Golaszewski (3):
      eeprom: at24: update the license tag
      eeprom: at24: sort headers alphabetically
      nvmem: fix a 'makes pointer from integer without a cast' build warning

Bibby Hsieh (2):
      dt-binding: eeprom: at24: add vcc-supply property
      misc: eeprom: at24: support pm_runtime control

Biwen Li (2):
      dt-bindings: i2c: support property idle-state
      i2c: mux: pca954x: support property idle-state

Christoph M=C3=BCllner (1):
      i2c: tiny-usb: Correct I2C fault codes.

Colin Ian King (2):
      i2c: parport: fix spelling mistake: "Atmost" -> "At most"
      i2c: xiic: fix indentation issue

Dmitry Osipenko (8):
      i2c: tegra: Fix suspending in active runtime PM state
      i2c: tegra: Properly disable runtime PM on driver's probe error
      i2c: tegra: Prevent interrupt triggering after transfer timeout
      i2c: tegra: Support atomic transfers
      i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
      i2c: tegra: Use relaxed versions of readl/writel
      i2c: tegra: Always terminate DMA transfer
      i2c: tegra: Check DMA completion status in addition to left time

Eugen Hristev (2):
      dt-bindings: i2c: at91: cosmetic formatting of compatible list
      i2c: at91: remote default value initialization

Geert Uytterhoeven (3):
      i2c: core: Use DEVICE_ATTR_*() helper macros
      dt-bindings: i2c: rcar: Document r8a77961 support
      dt-bindings: i2c: sh_mobile: Document r8a77961 support

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Comet Lake PCH-V

Khouloud Touil (5):
      dt-bindings: nvmem: new optional property wp-gpios
      nvmem: add support for the write-protect pin
      dt-bindings: at24: make wp-gpios a reference to the property defined =
by nvmem
      eeprom: at24: remove the write-protect pin support
      dt-bindings: at25: add reference for the wp-gpios property

Krzysztof Kozlowski (6):
      i2c: stu300: Use proper printk format for iomem pointer
      i2c: pmcmsp: Use proper printk format for resource_size_t
      i2c: pnx: Use proper printk format for resource_size_t
      i2c: highlander: Use proper printk format for size_t
      i2c: Enable compile testing for more drivers
      i2c: exynos: Update Kconfig documentation

Luca Ceresoli (29):
      i2c: remove unneeded 'extern' from function declatations
      docs: i2c: sort index logically
      docs: i2c: summary: extend introduction
      docs: i2c: summary: rewrite the "terminology" section
      docs: i2c: call it "I2C" consistently
      docs: i2c: fix typo
      docs: i2c: replace "I2C-transfer" -> "I2C transfer" consistently
      docs: i2c: i2c-protocol: fix kernel-doc function syntax
      docs: i2c: i2c-protocol: properly name start and stop conditions
      docs: i2c: i2c-protocol: remove unneeded colons from table
      docs: i2c: i2c-protocol: use proper names for ACK and NACK
      docs: i2c: smbus-protocol: fix link syntax
      docs: i2c: smbus-protocol: properly name start and stop conditions
      docs: i2c: smbus-protocol: remove unneeded colons from table
      docs: i2c: smbus-protocol: use proper names for ACK and NACK
      docs: i2c: smbus-protocol: enable kernel-doc function syntax
      docs: i2c: smbus-protocol: fix kernel-doc function syntax
      docs: i2c: smbus-protocol: fix typo
      docs: i2c: smbus-protocol: fix punctuation
      docs: i2c: smbus-protocol: improve I2C Block transactions description
      docs: i2c: instantiating-devices: fix internal hyperlink
      docs: i2c: instantiating-devices: rearrange static instatiation
      docs: i2c: instantiating-devices: use monospace for sysfs attributes
      docs: i2c: old-module-parameters: fix internal hyperlink
      docs: i2c: old-module-parameters: clarify this is for obsolete kernels
      docs: i2c: old-module-parameters: use monospace instead of ""
      docs: i2c: rename sections so the overall picture is clearer
      docs: i2c: i2c-protocol: use same wording as smbus-protocol
      docs: i2c: writing-clients: properly name the stop condition

Martin Blumenstingl (1):
      i2c: meson: implement the master_xfer_atomic callback

Michal Simek (1):
      i2c: cadence: Fix wording in i2c-cadence driver

Peter Rosin (1):
      i2c: mux: pca9541: use the BIT macro

Raul E Rangel (1):
      i2c: cros-ec-tunnel: Fix ACPI identifier

Shubhrajyoti Datta (3):
      i2c: xiic: Add timeout to the rx fifo wait loop
      i2c: xiic: Fix the clocking across bind unbind
      i2c: cadence: Fix error printing in case of defer

Topi Kuutela (1):
      i2c: cadence: Fix power management order of operations

Venkatesh Yadav Abbarapu (1):
      i2c: xiic: defer the probe if clock is not found

Wolfram Sang (18):
      i2c: parport-light: remove driver
      i2c: parport: simplify Kconfig description
      i2c: parport: move include file into main source
      Merge branch 'i2c/for-current' into i2c/for-5.6
      i2c: cht-wc: convert to use i2c_new_client_device()
      i2c: i801: convert to use i2c_new_client_device()
      i2c: nvidia-gpu: convert to use i2c_new_client_device()
      i2c: ocores: convert to use i2c_new_client_device()
      i2c: powermac: convert to use i2c_new_client_device()
      i2c: taos-evm: convert to use i2c_new_client_device()
      i2c: xiic: convert to use i2c_new_client_device()
      i2c: i2c-core-acpi: convert to use i2c_new_client_device()
      i2c: i2c-core-base: convert to use i2c_new_client_device()
      i2c: i2c-core-of: convert to use i2c_new_client_device()
      docs: i2c: use the new API in 'instantiating-devices.rst'
      docs: i2c: use the new API in 'writing-clients'
      Merge tag 'at24-updates-for-v5.6' of git://git.kernel.org/.../brgl/li=
nux into i2c/for-5.6
      Merge branch 'i2c-mux/for-next' of https://github.com/peda-r/i2c-mux =
into i2c/for-5.6

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (2):
      dt-bindings: I2C: Add X1000 bindings.
      I2C: JZ4780: Add support for the X1000.


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Lunn (1):
      (Rev.) i2c: ocores: convert to use i2c_new_client_device()

Enric Balletbo i Serra (1):
      (Rev.) i2c: cros-ec-tunnel: Fix slave device enumeration

Guenter Roeck (1):
      (Rev.) i2c: mux: pca9541: use the BIT macro

Hans de Goede (2):
      (Test) i2c: cht-wc: convert to use i2c_new_client_device()
      (Rev.) i2c: cht-wc: convert to use i2c_new_client_device()

Ioana Ciornei (1):
      (Test) i2c: mux: pca954x: support property idle-state

Jean Delvare (36):
      (Rev.) i2c: i801: Add support for Intel Comet Lake PCH-V
      (Rev.) docs: i2c: writing-clients: properly name the stop condition
      (Rev.) docs: i2c: i2c-protocol: use same wording as smbus-protocol
      (Rev.) docs: i2c: rename sections so the overall picture is clearer
      (Rev.) docs: i2c: old-module-parameters: use monospace instead of ""
      (Rev.) docs: i2c: old-module-parameters: clarify this is for obsolete=
 kernels
      (Rev.) docs: i2c: old-module-parameters: fix internal hyperlink
      (Rev.) docs: i2c: instantiating-devices: use monospace for sysfs attr=
ibutes
      (Rev.) docs: i2c: instantiating-devices: rearrange static instatiation
      (Rev.) docs: i2c: instantiating-devices: fix internal hyperlink
      (Rev.) docs: i2c: smbus-protocol: improve I2C Block transactions desc=
ription
      (Rev.) docs: i2c: smbus-protocol: fix punctuation
      (Rev.) docs: i2c: smbus-protocol: fix typo
      (Rev.) docs: i2c: smbus-protocol: fix kernel-doc function syntax
      (Rev.) docs: i2c: smbus-protocol: enable kernel-doc function syntax
      (Rev.) docs: i2c: smbus-protocol: use proper names for ACK and NACK
      (Rev.) docs: i2c: smbus-protocol: remove unneeded colons from table
      (Rev.) docs: i2c: smbus-protocol: properly name start and stop condit=
ions
      (Rev.) docs: i2c: smbus-protocol: fix link syntax
      (Rev.) docs: i2c: i2c-protocol: use proper names for ACK and NACK
      (Rev.) docs: i2c: i2c-protocol: remove unneeded colons from table
      (Rev.) docs: i2c: i2c-protocol: properly name start and stop conditio=
ns
      (Rev.) docs: i2c: i2c-protocol: fix kernel-doc function syntax
      (Rev.) docs: i2c: replace "I2C-transfer" -> "I2C transfer" consistent=
ly
      (Rev.) docs: i2c: fix typo
      (Rev.) docs: i2c: call it "I2C" consistently
      (Rev.) docs: i2c: summary: rewrite the "terminology" section
      (Rev.) docs: i2c: summary: extend introduction
      (Rev.) docs: i2c: sort index logically
      (Rev.) i2c: parport: fix spelling mistake: "Atmost" -> "At most"
      (Rev.) i2c: taos-evm: convert to use i2c_new_client_device()
      (Test) i2c: taos-evm: convert to use i2c_new_client_device()
      (Rev.) i2c: i801: convert to use i2c_new_client_device()
      (Rev.) i2c: parport: move include file into main source
      (Rev.) i2c: parport: simplify Kconfig description
      (Rev.) i2c: parport-light: remove driver

Kieran Bingham (1):
      (Rev.) i2c: core: Use DEVICE_ATTR_*() helper macros

Linus Walleij (5):
      (Rev.) i2c: stu300: Use proper printk format for iomem pointer
      (Rev.) eeprom: at24: remove the write-protect pin support
      (Rev.) dt-bindings: at24: make wp-gpios a reference to the property d=
efined by nvmem
      (Rev.) nvmem: add support for the write-protect pin
      (Rev.) dt-bindings: nvmem: new optional property wp-gpios

Luca Ceresoli (1):
      (Rev.) i2c: core: Use DEVICE_ATTR_*() helper macros

Ludovic Desroches (1):
      (Rev.) i2c: at91: remote default value initialization

Michal Simek (1):
      (Rev.) i2c: cadence: Handle transfer_size rollover

Neil Armstrong (1):
      (Rev.) i2c: meson: implement the master_xfer_atomic callback

Peter Korsgaard (1):
      (Rev.) i2c: ocores: convert to use i2c_new_client_device()

Rob Herring (5):
      (Rev.) dt-binding: eeprom: at24: add vcc-supply property
      (Rev.) dt-bindings: at25: add reference for the wp-gpios property
      (Rev.) dt-bindings: at24: make wp-gpios a reference to the property d=
efined by nvmem
      (Rev.) dt-bindings: nvmem: new optional property wp-gpios
      (Rev.) dt-bindings: i2c: support property idle-state

Shubhrajyoti Datta (2):
      (Rev.) i2c: cadence: Handle transfer_size rollover
      (Rev.) i2c: xiic: fix indentation issue

Thierry Reding (8):
      (Test) i2c: tegra: Check DMA completion status in addition to left ti=
me
      (Test) i2c: tegra: Always terminate DMA transfer
      (Test) i2c: tegra: Use relaxed versions of readl/writel
      (Test) i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFER=
RED_LEN
      (Test) i2c: tegra: Support atomic transfers
      (Test) i2c: tegra: Prevent interrupt triggering after transfer timeout
      (Test) i2c: tegra: Properly disable runtime PM on driver's probe error
      (Test) i2c: tegra: Fix suspending in active runtime PM state

Vladimir Zapolskiy (1):
      (Rev.) i2c: mux: pca9541: use the BIT macro

 Documentation/devicetree/bindings/eeprom/at24.yaml |    9 +-
 Documentation/devicetree/bindings/eeprom/at25.txt  |    2 +
 Documentation/devicetree/bindings/i2c/i2c-at91.txt |   14 +-
 .../devicetree/bindings/i2c/i2c-jz4780.txt         |    4 +-
 .../devicetree/bindings/i2c/i2c-mux-pca954x.txt    |    2 +
 .../devicetree/bindings/i2c/renesas,i2c.txt        |    3 +-
 .../devicetree/bindings/i2c/renesas,iic.txt        |    1 +
 Documentation/devicetree/bindings/nvmem/nvmem.yaml |   11 +
 Documentation/i2c/busses/i2c-parport-light.rst     |   24 -
 Documentation/i2c/busses/index.rst                 |    1 -
 Documentation/i2c/dev-interface.rst                |   24 +-
 Documentation/i2c/dma-considerations.rst           |    2 +-
 Documentation/i2c/i2c-protocol.rst                 |   45 +-
 Documentation/i2c/i2c-topology.rst                 |   72 +-
 Documentation/i2c/i2c.svg                          | 1341 ++++++++++++++++=
++++
 Documentation/i2c/index.rst                        |   58 +-
 Documentation/i2c/instantiating-devices.rst        |  123 +-
 Documentation/i2c/old-module-parameters.rst        |   31 +-
 Documentation/i2c/slave-interface.rst              |    4 +-
 Documentation/i2c/smbus-protocol.rst               |  107 +-
 Documentation/i2c/summary.rst                      |   62 +-
 Documentation/i2c/writing-clients.rst              |   36 +-
 MAINTAINERS                                        |    2 -
 drivers/i2c/busses/Kconfig                         |  107 +-
 drivers/i2c/busses/Makefile                        |    1 -
 drivers/i2c/busses/i2c-at91-core.c                 |   39 -
 drivers/i2c/busses/i2c-cadence.c                   |   32 +-
 drivers/i2c/busses/i2c-cht-wc.c                    |    6 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |    3 +-
 drivers/i2c/busses/i2c-highlander.c                |    2 +-
 drivers/i2c/busses/i2c-i801.c                      |   10 +-
 drivers/i2c/busses/i2c-jz4780.c                    |  156 ++-
 drivers/i2c/busses/i2c-meson.c                     |   97 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |    6 +-
 drivers/i2c/busses/i2c-ocores.c                    |    2 +-
 drivers/i2c/busses/i2c-parport-light.c             |  267 ----
 drivers/i2c/busses/i2c-parport.c                   |  113 +-
 drivers/i2c/busses/i2c-parport.h                   |  106 --
 drivers/i2c/busses/i2c-pmcmsp.c                    |    6 +-
 drivers/i2c/busses/i2c-pnx.c                       |    4 +-
 drivers/i2c/busses/i2c-powermac.c                  |    8 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |  117 +-
 drivers/i2c/busses/i2c-stu300.c                    |    2 +-
 drivers/i2c/busses/i2c-taos-evm.c                  |    4 +-
 drivers/i2c/busses/i2c-tegra.c                     |  216 ++--
 drivers/i2c/busses/i2c-tiny-usb.c                  |    8 +-
 drivers/i2c/busses/i2c-xiic.c                      |   69 +-
 drivers/i2c/i2c-core-acpi.c                        |   12 +-
 drivers/i2c/i2c-core-base.c                        |   33 +-
 drivers/i2c/i2c-core-of.c                          |    7 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c                |   29 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   69 +-
 drivers/misc/eeprom/at24.c                         |   72 +-
 drivers/nvmem/core.c                               |   19 +-
 drivers/nvmem/nvmem.h                              |    2 +
 include/linux/i2c.h                                |  115 +-
 include/linux/nvmem-provider.h                     |    3 +
 57 files changed, 2604 insertions(+), 1116 deletions(-)
 delete mode 100644 Documentation/i2c/busses/i2c-parport-light.rst
 create mode 100644 Documentation/i2c/i2c.svg
 delete mode 100644 drivers/i2c/busses/i2c-parport-light.c
 delete mode 100644 drivers/i2c/busses/i2c-parport.h

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl49nBcACgkQFA3kzBSg
Kbbj4g//ePvZ2EicjrXJRmpgFOhXHumlfSZf9kyY00G3HCAzlgPFyMUVNE+Seuri
DtKx09OKRuneLNz1MJBpsbGfLk9vJlTNYVb8lvYiVatSWUsQPDYGP088QeBxwuUR
bkw2YbSEgrGNQX19rDGhutwvE2fqHYXTm27NnfnQt+s2b9j/xRnWxdEBLrBPrhum
qfWIVhBDxOKsGVbafqi7J9WUngvvgIksIp+0R+aiIMEwXzqQAvC57NLpKZHRNgl2
dTnpuWzJeIIXAx2DUHOzS+MjMLqfSae2zH9dEPnBkfpDiYoztYFBYfgvTBD9DC+r
RX+536oV/OiUGjjuJ2ugSsfu1v2PMN17K3rYo8Y8GdkGxj5xuFSbLTj+0pY3/N04
GkKX3P/wgKlvmS+v2KJRcjPHRTjhJJ9I8UyaDcygV2uv49UKz/qVYdwmWFeittFt
Hb/wx5sMFzpiJxh5kxFM0Cgt6Zv+3mGUVd2x5kusLQy2Q5yk+nhYjiRUkQlp9yb+
lfpycYbfU4BE1WBaVrxNxjyc6/XPvwpJe4KK9FzeL/9Yewujq8dPiyXB+YrPBNWR
kOOnTd+tLXrb8KBrZH/TON+qk+Av6odvetDNI8mkD738QMfh0gmqvRIVmZF42xOM
nxdIQGrMEnEQWOidrguUgeHjGyLu/QvPjGIAUKXlQdlsBdDuqxA=
=9Xfa
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
