Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BCB3BABCD
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jul 2021 09:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhGDHgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 03:36:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhGDHgT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 4 Jul 2021 03:36:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC7166135E;
        Sun,  4 Jul 2021 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625384024;
        bh=+K7ot8IQhwPVdZ+DDdetdJY4G5HR5QRJ4UtRyg9RPf8=;
        h=Date:From:To:Cc:Subject:From;
        b=q51giXGDSb5jCEj2ueQH+/CYhB9Isf731uC7N+C+8/3GOijlvBiGNnHVjamwf0yBZ
         fZkS1FEcbZwlGeQWM401cya213eo+2ajnpo5+PbwtI+Uv3wiLyE3T9vSStE5FNb7sy
         Qb7qtlFMP+q2ZDTILi2vdaEIZcOaUXnipdYwc3VKwS3h9CfrQ7yr3YN3vOQ0x44Ti7
         yp4M5USCwIlLdI6qlQyF8pt0y1j9h6eJcqNkk74wQ2O8ZIRzF0hwMyIFJL5suW1vnM
         nUwVdaAGwNUqxrxIfPQl5o8VUTaWodbBCU6t3Mbb1UY+b14ElWnQ4q/NDSjfHA1bhk
         JhP9Ln9kFq6Wg==
Date:   Sun, 4 Jul 2021 09:33:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.14
Message-ID: <YOFkTpjuZQsWXDHq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bOBf+0/2UbJz2SSC"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bOBf+0/2UbJz2SSC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

now that 5b1170560889 ("drm/i915/selftests: Rename pm_ prefixed
functions names") hit your tree, I can ask you to pull these I2C changes
for 5.14. Main items:

* core supports now bus regulators controlling power for SCL/SDA
* quite some DT binding conversions to YAML
* added a seperate DT binding for the optional SMBus Alert feature
* documentation with examples how to deal with I2C sysfs files
* some bigger rework for the i801 driver
* and a few usual driver updates

Please pull.

Thanks,

   Wolfram


The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-merge=
window

for you to fetch changes up to 9d6336831bdc78e5207eaf147cc17228b5e984c3:

  i2c: ali1535: mention that the device should not be disabled (2021-07-02 =
09:14:46 +0200)

----------------------------------------------------------------
Alain Volmat (2):
      i2c: add binding to mark a bus as supporting SMBus-Alert
      i2c: stm32f7: add SMBus-Alert support

Alex Qiu (1):
      Documentation: i2c: Add doc for I2C sysfs

Andy Shevchenko (2):
      i2c: core: Make debug message even more debuggish
      i2c: cht-wc: Replace of_node by NULL

Bibby Hsieh (1):
      i2c: core: support bus regulator controlling in adapter

Biju Das (2):
      dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller
      i2c: riic: Add RZ/G2L support

Chris Packham (1):
      i2c: mpc: Restore reread of I2C status register

Dmitry Torokhov (1):
      i2c: core: Disable client irq on reboot/shutdown

Geert Uytterhoeven (10):
      i2c: rcar: Drop "renesas,i2c-rcar"
      dt-bindings: i2c: renesas,i2c: Drop "renesas,i2c-rcar"
      dt-bindings: i2c: renesas,i2c: Convert to json-schema
      dt-bindings: i2c: renesas,iic-emev2: Convert to json-schema
      dt-bindings: i2c: renesas,riic: Convert to json-schema
      MAINTAINERS: Add linux-renesas-soc to the Renesas I2C entries
      dt-bindings: i2c: i2c-mux: Remove reset-active-low from ssd1307fb exa=
mples
      dt-bindings: i2c: renesas,iic: Always declare generic compatibility
      dt-bindings: i2c: renesas,iic: Convert to json-schema
      dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"

Heiner Kallweit (7):
      i2c: i801: Remove unneeded warning after wait_event_timeout timeout
      i2c: i801: Replace waitqueue with completion API
      i2c: i801: Use standard PCI constants instead of own ones
      i2c: i801: Improve status polling
      i2c: i801: Simplify initialization of i2c_board_info in i801_probe_op=
tional_slaves
      i2c: i801: Use driver name constant instead of function dev_driver_st=
ring
      i2c: i801: Improve i801_setup_hstcfg

Hsin-Yi Wang (2):
      dt-binding: i2c: mt65xx: add vbus-supply property
      i2c: mediatek: mt65xx: add optional vbus-supply

Jonathan Marek (1):
      i2c: qcom-cci: add sm8250 compatible

Kewei.Xu (1):
      dt-bindings: i2c: update bindings for MT8195 SoC

Krzysztof Kozlowski (3):
      i2c: xiic: Simplify with dev_err_probe()
      i2c: cadence: Simplify with dev_err_probe()
      i2c: davinci: Simplify with dev_err_probe()

Kwon Tae-young (1):
      i2c: imx: Fix some checkpatch warnings

Liang Chen (1):
      dt-bindings: i2c: i2c-rk3x: add description for rk3568

Qii Wang (1):
      i2c: mediatek: Rename i2c irq name

Quan Nguyen (1):
      i2c: core-smbus: Expose PEC calculate function for generic use

Raviteja Narayanam (1):
      i2c: cadence: Clear HOLD bit before xfer_size register rolls over

Vignesh Raghavendra (1):
      dt-bindings: i2c: Move i2c-omap.txt to YAML format

Wolfram Sang (1):
      i2c: ali1535: mention that the device should not be disabled

Zev Weiss (1):
      i2c: aspeed: disable additional device addresses on ast2[56]xx


with much appreciated quality assurance from
----------------------------------------------------------------
Brendan Higgins (1):
      (Rev.) i2c: aspeed: disable additional device addresses on ast2[56]xx

Daniel Kurtz (1):
      (Rev.) i2c: i801: Replace waitqueue with completion API

Geert Uytterhoeven (2):
      (Rev.) i2c: riic: Add RZ/G2L support
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller

Guenter Roeck (1):
      (Rev.) Documentation: i2c: Add doc for I2C sysfs

Hans de Goede (1):
      (Rev.) i2c: cht-wc: Replace of_node by NULL

Jean Delvare (14):
      (Rev.) i2c: ali1535: mention that the device should not be disabled
      (Rev.) i2c: i801: Improve i801_setup_hstcfg
      (Test) i2c: i801: Improve i801_setup_hstcfg
      (Rev.) i2c: i801: Use driver name constant instead of function dev_dr=
iver_string
      (Test) i2c: i801: Use driver name constant instead of function dev_dr=
iver_string
      (Rev.) i2c: i801: Simplify initialization of i2c_board_info in i801_p=
robe_optional_slaves
      (Rev.) i2c: i801: Improve status polling
      (Test) i2c: i801: Improve status polling
      (Rev.) i2c: i801: Use standard PCI constants instead of own ones
      (Test) i2c: i801: Use standard PCI constants instead of own ones
      (Rev.) i2c: i801: Replace waitqueue with completion API
      (Test) i2c: i801: Replace waitqueue with completion API
      (Rev.) i2c: i801: Remove unneeded warning after wait_event_timeout ti=
meout
      (Test) i2c: i801: Remove unneeded warning after wait_event_timeout ti=
meout

Joel Stanley (2):
      (Rev.) i2c: aspeed: disable additional device addresses on ast2[56]xx
      (Test) i2c: aspeed: disable additional device addresses on ast2[56]xx

Lad Prabhakar (2):
      (Rev.) i2c: riic: Add RZ/G2L support
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller

Loic Poulain (1):
      (Rev.) i2c: qcom-cci: add sm8250 compatible

Matthias Brugger (3):
      (Rev.) dt-bindings: i2c: update bindings for MT8195 SoC
      (Rev.) i2c: mediatek: mt65xx: add optional vbus-supply
      (Rev.) i2c: core: support bus regulator controlling in adapter

Philipp Zabel (1):
      (Rev.) i2c: riic: Add RZ/G2L support

Pierre-Yves MORDRET (1):
      (Rev.) i2c: stm32f7: add SMBus-Alert support

Qii Wang (1):
      (Rev.) i2c: mediatek: mt65xx: add optional vbus-supply

Rob Herring (6):
      (Rev.) dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"
      (Rev.) dt-bindings: i2c: renesas,iic: Convert to json-schema
      (Rev.) dt-bindings: i2c: Move i2c-omap.txt to YAML format
      (Rev.) dt-bindings: i2c: renesas,riic: Convert to json-schema
      (Rev.) dt-bindings: i2c: renesas,iic-emev2: Convert to json-schema
      (Rev.) dt-bindings: i2c: renesas,i2c: Convert to json-schema

Uwe Kleine-K=C3=B6nig (1):
      (Rev.) i2c: imx: Fix some checkpatch warnings

Vinod Koul (1):
      (Rev.) i2c: qcom-cci: add sm8250 compatible

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   2 +
 .../devicetree/bindings/i2c/i2c-mux-gpio.txt       |   1 -
 Documentation/devicetree/bindings/i2c/i2c-omap.txt |  37 --
 .../devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt |   4 +-
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |   5 +-
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 Documentation/devicetree/bindings/i2c/i2c.txt      |   7 +-
 .../devicetree/bindings/i2c/renesas,i2c.txt        |  67 ----
 .../devicetree/bindings/i2c/renesas,iic-emev2.txt  |  22 --
 .../devicetree/bindings/i2c/renesas,iic-emev2.yaml |  54 +++
 .../devicetree/bindings/i2c/renesas,iic.txt        |  72 ----
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  | 158 +++++++++
 .../devicetree/bindings/i2c/renesas,riic.txt       |  32 --
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  93 +++++
 .../bindings/i2c/renesas,rmobile-iic.yaml          | 149 ++++++++
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      | 102 ++++++
 Documentation/i2c/i2c-sysfs.rst                    | 395 +++++++++++++++++=
++++
 MAINTAINERS                                        |  13 +-
 drivers/i2c/busses/i2c-ali1535.c                   |   5 +
 drivers/i2c/busses/i2c-aspeed.c                    |  12 +-
 drivers/i2c/busses/i2c-cadence.c                   |  57 ++-
 drivers/i2c/busses/i2c-cht-wc.c                    |   3 +-
 drivers/i2c/busses/i2c-davinci.c                   |   5 +-
 drivers/i2c/busses/i2c-i801.c                      | 136 +++----
 drivers/i2c/busses/i2c-imx.c                       |  19 +-
 drivers/i2c/busses/i2c-mpc.c                       |   2 +
 drivers/i2c/busses/i2c-mt65xx.c                    |   9 +-
 drivers/i2c/busses/i2c-qcom-cci.c                  |   1 +
 drivers/i2c/busses/i2c-rcar.c                      |   1 -
 drivers/i2c/busses/i2c-riic.c                      |  23 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |  73 ++++
 drivers/i2c/busses/i2c-xiic.c                      |   9 +-
 drivers/i2c/i2c-core-base.c                        | 108 +++++-
 drivers/i2c/i2c-core-smbus.c                       |  12 +-
 include/linux/i2c.h                                |   3 +
 35 files changed, 1316 insertions(+), 376 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,i2c.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2=
=2Eyaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rmobile-i=
ic.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
 create mode 100644 Documentation/i2c/i2c-sysfs.rst

--bOBf+0/2UbJz2SSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDhZEkACgkQFA3kzBSg
KbYYFQ/+Ic5ZNhdrc03RkXnKt5e1o+szxGnIfR/J7aITMHwz0lJzOdjxx7GOT1dI
MrPHDw/D1VgO0F/DKMrBW+0c2+eSaOfcA24tIySOcAfPrZm2FdeQ05UnFZt3qbbH
0E6ZL8fSk6n2iR5Yf8ehlmcJvwtGUrscTOJv9ScStZE7jUW4B9BLZMFENwMBnE/F
ZKEZX+VU107kl5qDaRoMYDg8ucszPZdHKc81raabSlqwFzdujX43j+eAPs2yTkdf
rI94Z5FC37U2lsCIxrsh1/7rjWbWBGzc81GvTV2InClzGA27WndAUROh03r0Xgpj
9VS3HbDoKLWEnOli/VEwSqXwK3BzWOsovWXGlpzAS/9ceG0topn+7/pQ8d3azQqo
l6DHmSIiHOPVa7l+T33deJ9tG/7pGf8jp8Qfz6hLuPG4n3m1m4t+8wv6Bd1cegQc
IVFKRR5uS+MroUcxBlvMCcciUmturX7F/DeE4AlRNNHJmro/E/Im/AHL175U0HfH
Xg64ZPU8gpZ5DDZutzWyztB6w/YK/yBZ0g6mOWk4eBGP6ViAMSOjp5y3bpASDIhz
XWOFw/Kqzm3zsqApHdxjvUgT+BfDy6Abxnt0RXjwQao7XXEkWEBFoswwIUNc1OSL
x/xS0nnxfas/uZMpWUiy9B/PLg8fWURUx+PteYt/QyenlMGFm5Q=
=Hi0o
-----END PGP SIGNATURE-----

--bOBf+0/2UbJz2SSC--
