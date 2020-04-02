Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 409C319BEFE
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 12:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbgDBJ77 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 05:59:59 -0400
Received: from sauhun.de ([88.99.104.3]:56226 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728135AbgDBJ77 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Apr 2020 05:59:59 -0400
Received: from localhost (p54B333EE.dip0.t-ipconnect.de [84.179.51.238])
        by pokefinder.org (Postfix) with ESMTPSA id 98E832C0590;
        Thu,  2 Apr 2020 11:59:54 +0200 (CEST)
Date:   Thu, 2 Apr 2020 11:59:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.7
Message-ID: <20200402095948.GA2414@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has for v5.7:

* using defines for bus speeds to avoid mistakes in hardcoded values;
  lots of small driver updates because of that. Thanks, Andy!
* API change: i2c_setup_smbus_alert() was renamed to
  i2c_new_smbus_alert_device() and returns ERRPTR now. All in-tree users
  have been converted
* in the core, a rare race condition when deleting the cdev has been
  fixed. Thanks, Kevin!
* lots of driver updates. Thanks, everyone!

What I also want to mention: The amount of review and testing tags given
was quite high this time. Thank you to these people, too. I hope we can
keep it like this!

Please pull,

   Wolfram


The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.7

for you to fetch changes up to df576beee53ac97fe0a413430e623e658805891d:

  i2c: rcar: clean up after refactoring i2c_timings (2020-03-31 17:34:29 +0=
200)

----------------------------------------------------------------
Alain Volmat (4):
      i2c: stm32f7: allow controller to be wakeup-source
      i2c: stm32f7: disable/restore Fast Mode Plus bits in low power modes
      i2c: stm32f7: add a new st, stm32mp15-i2c compatible
      i2c: stm32f7: do not backup read-only PECR register

Andy Shevchenko (7):
      i2c: designware: Fix spelling typos in the comments
      i2c: core: Provide generic definitions for bus frequencies
      i2c: core: Allow override timing properties with 0
      i2c: rcar: Consolidate timings calls in rcar_i2c_clock_calculate()
      i2c: stm32f7: switch to I=C2=B2C generic property parsing
      i2c: algo: Use generic definitions for bus frequencies
      i2c: drivers: Use generic definitions for bus frequencies

Kamel Bouhara (2):
      dt-bindings: i2c: at91: document optional bus recovery properties
      i2c: at91: implement i2c bus recovery

Kevin Hao (1):
      i2c: dev: Fix the race between the release of i2c_dev and cdev

Markus Pietrek (1):
      eeprom: at24: add TPF0001 ACPI ID for 24c1024 device

Maxime Ripard (3):
      dt-bindings: i2c: brcmstb: Convert the BRCMSTB binding to a schema
      dt-bindings: i2c: brcmstb: Add BCM2711 BSC/AUTO-I2C binding
      i2c: brcmstb: Support BCM2711 HDMI BSC controllers

Peter Ujfalusi (1):
      i2c: mxs: Use dma_request_chan() instead dma_request_slave_channel()

Serge Semin (2):
      i2c: designware: Detect the FIFO size in the common code
      i2c: designware: Discard i2c_dw_read_comp_param() function

Stefan Lengfeld (1):
      i2c: imx: implement master_xfer_atomic callback

Stephen Boyd (3):
      i2c: qcom-geni: Let firmware specify irq trigger flags
      i2c: qcom-geni: Grow a dev pointer to simplify code
      i2c: qcom-geni: Drop of_platform.h include

Tang Bin (1):
      i2c: imx: remove duplicate print after platform_get_irq()

Wolfram Sang (8):
      i2c: dev: keep sorting of includes
      i2c: powermac: correct comment about custom handling
      i2c: convert SMBus alert setup function to return an ERRPTR
      i2c: smbus: remove outdated references to irq level triggers
      Merge tag 'at24-updates-for-v5.7' of git://git.kernel.org/.../brgl/li=
nux into i2c/for-5.7
      Merge tag 'v5.6-rc7' into i2c/for-5.7
      macintosh: convert to i2c_new_scanned_device
      i2c: rcar: clean up after refactoring i2c_timings

chenqiwu (2):
      i2c: use kobj_to_dev() API
      i2c: omap: use devm_platform_ioremap_resource()


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (1):
      (Rev.) i2c: stm32f7: switch to I=C2=B2C generic property parsing

Amit Kucheria (3):
      (Rev.) i2c: qcom-geni: Drop of_platform.h include
      (Rev.) i2c: qcom-geni: Grow a dev pointer to simplify code
      (Rev.) i2c: qcom-geni: Let firmware specify irq trigger flags

Andy Shevchenko (1):
      (Rev.) i2c: designware: Detect the FIFO size in the common code

Baolin Wang (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Bjorn Andersson (3):
      (Rev.) i2c: qcom-geni: Drop of_platform.h include
      (Rev.) i2c: qcom-geni: Grow a dev pointer to simplify code
      (Rev.) i2c: qcom-geni: Let firmware specify irq trigger flags

Brendan Higgins (4):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies
      (Rev.) i2c: qcom-geni: Drop of_platform.h include
      (Rev.) i2c: qcom-geni: Grow a dev pointer to simplify code
      (Rev.) i2c: qcom-geni: Let firmware specify irq trigger flags

Chris Brandt (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Dmitry Osipenko (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Douglas Anderson (3):
      (Rev.) i2c: qcom-geni: Drop of_platform.h include
      (Rev.) i2c: qcom-geni: Grow a dev pointer to simplify code
      (Rev.) i2c: qcom-geni: Let firmware specify irq trigger flags

Geert Uytterhoeven (1):
      (Rev.) i2c: rcar: clean up after refactoring i2c_timings

Guenter Roeck (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Linus Walleij (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Luca Ceresoli (5):
      (Rev.) i2c: smbus: remove outdated references to irq level triggers
      (Rev.) i2c: convert SMBus alert setup function to return an ERRPTR
      (Test) i2c: omap: use devm_platform_ioremap_resource()
      (Rev.) i2c: omap: use devm_platform_ioremap_resource()
      (Rev.) i2c: use kobj_to_dev() API

Manivannan Sadhasivam (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Mika Westerberg (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Nicolas Saenz Julienne (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Pierre-Yves MORDRET (5):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies
      (Rev.) i2c: stm32f7: do not backup read-only PECR register
      (Rev.) i2c: stm32f7: add a new st, stm32mp15-i2c compatible
      (Rev.) i2c: stm32f7: disable/restore Fast Mode Plus bits in low power=
 modes
      (Rev.) i2c: stm32f7: allow controller to be wakeup-source

Rob Herring (3):
      (Rev.) dt-bindings: i2c: brcmstb: Add BCM2711 BSC/AUTO-I2C binding
      (Rev.) dt-bindings: i2c: brcmstb: Convert the BRCMSTB binding to a sc=
hema
      (Rev.) dt-bindings: i2c: at91: document optional bus recovery propert=
ies

Stefan Agner (1):
      (Rev.) i2c: imx: implement master_xfer_atomic callback

Stefan Lengfeld (1):
      (Test) i2c: imx: implement master_xfer_atomic callback

Thor Thayer (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies

Vignesh Raghavendra (1):
      (Rev.) i2c: omap: use devm_platform_ioremap_resource()

Wolfram Sang (2):
      (Test) i2c: rcar: Consolidate timings calls in rcar_i2c_clock_calcula=
te()
      (Test) i2c: core: Allow override timing properties with 0

 .../devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml  |  97 ++++++++
 Documentation/devicetree/bindings/i2c/i2c-at91.txt |  10 +
 .../devicetree/bindings/i2c/i2c-brcmstb.txt        |  26 ---
 Documentation/i2c/smbus-protocol.rst               |   2 +-
 MAINTAINERS                                        |   2 +-
 drivers/i2c/algos/i2c-algo-pca.c                   |   6 +-
 drivers/i2c/busses/i2c-altera.c                    |   6 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |  27 ++-
 drivers/i2c/busses/i2c-aspeed.c                    |   2 +-
 drivers/i2c/busses/i2c-at91-master.c               |  78 +++++++
 drivers/i2c/busses/i2c-at91.h                      |   4 +
 drivers/i2c/busses/i2c-axxia.c                     |   4 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  14 +-
 drivers/i2c/busses/i2c-bcm-kona.c                  |   8 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |   2 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |  33 +++
 drivers/i2c/busses/i2c-cadence.c                   |   7 +-
 drivers/i2c/busses/i2c-designware-baytrail.c       |   2 +-
 drivers/i2c/busses/i2c-designware-common.c         |  36 ++-
 drivers/i2c/busses/i2c-designware-core.h           |   2 +-
 drivers/i2c/busses/i2c-designware-master.c         |   4 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |  61 ++---
 drivers/i2c/busses/i2c-designware-slave.c          |   4 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   3 +-
 drivers/i2c/busses/i2c-diolan-u2c.c                |  12 +-
 drivers/i2c/busses/i2c-efm32.c                     |   2 +-
 drivers/i2c/busses/i2c-exynos5.c                   |  18 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |  10 +-
 drivers/i2c/busses/i2c-img-scb.c                   |   4 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  16 +-
 drivers/i2c/busses/i2c-imx.c                       | 155 +++++++++----
 drivers/i2c/busses/i2c-lpc2k.c                     |   6 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  21 +-
 drivers/i2c/busses/i2c-mt7621.c                    |   2 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |   6 +-
 drivers/i2c/busses/i2c-mxs.c                       |  10 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   8 +-
 drivers/i2c/busses/i2c-omap.c                      |   6 +-
 drivers/i2c/busses/i2c-owl.c                       |   9 +-
 drivers/i2c/busses/i2c-parport.c                   |  12 +-
 drivers/i2c/busses/i2c-powermac.c                  |  15 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  58 +++--
 drivers/i2c/busses/i2c-qup.c                       |  11 +-
 drivers/i2c/busses/i2c-rcar.c                      |  24 +-
 drivers/i2c/busses/i2c-riic.c                      |   6 +-
 drivers/i2c/busses/i2c-rk3x.c                      |  12 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   4 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   9 +-
 drivers/i2c/busses/i2c-sirf.c                      |   3 +-
 drivers/i2c/busses/i2c-sprd.c                      |   9 +-
 drivers/i2c/busses/i2c-st.c                        |   6 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |  10 +-
 drivers/i2c/busses/i2c-stm32f7.c                   | 245 +++++++++++++++--=
----
 drivers/i2c/busses/i2c-stu300.c                    |   6 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c                |   2 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   6 +-
 drivers/i2c/busses/i2c-tegra.c                     |  18 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |  13 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |   6 +-
 drivers/i2c/busses/i2c-uniphier.c                  |   7 +-
 drivers/i2c/busses/i2c-wmt.c                       |   2 +-
 drivers/i2c/busses/i2c-xlp9xx.c                    |  18 +-
 drivers/i2c/busses/i2c-xlr.c                       |   2 +-
 drivers/i2c/i2c-core-acpi.c                        |   2 +-
 drivers/i2c/i2c-core-base.c                        |  38 ++--
 drivers/i2c/i2c-core-smbus.c                       |  26 +--
 drivers/i2c/i2c-dev.c                              |  50 +++--
 drivers/i2c/i2c-slave-eeprom.c                     |   4 +-
 drivers/i2c/i2c-smbus.c                            |   2 +-
 drivers/macintosh/therm_windtunnel.c               |   4 +-
 drivers/misc/eeprom/at24.c                         |   1 +
 include/linux/i2c-smbus.h                          |   9 +-
 include/linux/i2c.h                                |   8 +
 74 files changed, 855 insertions(+), 520 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6Ft5AACgkQFA3kzBSg
KbZC/w/+PT3eWnhfWxuX6foNSprKFu701tQeyuWm40EFbLfZmgksrqsBvLoO95KM
mIkzBED5CIVQdv1qpkkymsaLjb1CvlrdR4JsdR02dCBsnavMRWYyJIizcR84shnk
KD/BMSQcbM2hJ5dpoPK6Bz5M1XbHnM++gWe3Z5oihPgD11HV2YWTmtSL8Jm7Ryxx
p7sdVDrvRq1tNc3cHUK17yNpwafqHBZuRxhliG+RK/ZXEShK9YL5v1hdbDGjpsXB
TGl8807No1336ovgRL0Sl7W9ASnWUqyfvGq6JLXIW9IZAK767So/vDwYCRnyRFoA
S7O45XxeZPgu2dC5XsWRoZkPwqnzFgSv9kNqKoX8wFlIiWh+IOV1VqQOILm6f6bi
H9z5aZoOJO/3WXHEBSwKkkm0/umHzKql7iC3/J5FIxV7isZio8HbE/0aRIvSgURu
T7Wv3OrVbLnbrxkYtUdvBFzFyHpXFvhaurqxwQKiOWG36byZ7UGYWR+bLXTRd035
p9oTKrUTezF5gDsk1IvOfOxQhi02bv5TLiaxvBlwo9z8ZDkPxpMKPAKYvSHpWtlU
bJDyc9P2eL7e7vzjd4l6rrq2sehh0IeKYp0GRn/Wf8ITlyBvuYPBtwg6EYT5PzLG
WD2rPXfV+n2ckW5GbxKwz5QLBtoK1kal8Wos4QEN/XOkb9lWeos=
=DHJj
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
