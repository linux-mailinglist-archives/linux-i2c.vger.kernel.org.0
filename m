Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62106791648
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 13:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237212AbjIDLex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 07:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjIDLew (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 07:34:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C84180;
        Mon,  4 Sep 2023 04:34:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 366B8B80DB5;
        Mon,  4 Sep 2023 11:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D62C433C8;
        Mon,  4 Sep 2023 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693827285;
        bh=QAdwi9ft+dD0azpo9Nr2LI58eTPyPxobIVdVO5Eomfg=;
        h=Date:From:To:Cc:Subject:From;
        b=ARcBqzapc3OXLo60FcHcTPDEzE0OvQLoCJMxih4LCduU2VM59sx+vIgOAn+k2QKx9
         ajp39/sH5q1O4DPA9PTryEt5iAZe8mrobyV/hcEz5WBKkctLqLPOmmQSfMmnxoRYxW
         iTUCtdOsH7sulYw4yOJ0/FjE1B8iBH8EwFsHwuat3ZkQQXCKsvMb4FIb/Ov7VjK/qS
         fJMpxOTDulODCg+sxh2wgR3dwh+GkD+Vt2lXOwxyDBSx1tVbiy2bACw4cxj8H18ec/
         wyP1I06Nt5gofJeyLtxlIu8Xwd7lP3z1dXf0HciBP5gJ3y1XNdMbE0OlBPqvljIHn9
         ZDyqQEBplxd4w==
Date:   Mon, 4 Sep 2023 13:34:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.6-rc1
Message-ID: <ZPXA0wtQYlRZSCEw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qtyJt5okQRq7OboX"
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qtyJt5okQRq7OboX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2ccdd1b13c591d306f0401d98dedc4bdcd02b421:

  Linux 6.5-rc6 (2023-08-13 11:29:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.6-rc1

for you to fetch changes up to 0ab4bcf0e9471c1a3f5e4721ee486f6ed1a76bac:

  i2c: at91: Use dev_err_probe() instead of dev_err() (2023-08-30 21:19:55 =
+0200)

----------------------------------------------------------------
I2C has mainly cleanups this time and a few driver improvements. Because
a lot of developers were on holidays (including myself) it was a good
timing to apply lots of cleanups which would normally cause merge
conflicts with other floating patches. Extra thanks go to Andi Shyti who
backed me up when I was on a four week hiatus. This is also the reason
that some patches were commited later than ideal.

----------------------------------------------------------------
Arnd Bergmann (1):
      virtio: Remove PM #ifdef guards to fix i2c driver

Carlos Song (1):
      i2c: imx-lpi2c: directly return ISR when detect a NACK

Dan Carpenter (1):
      i2c: imx: Clean up a call to request_irq()

Harry Geyer (1):
      i2c: tiny-usb: check usb base class before assuming the interface on =
device is for this driver

Harshit Mogalapalli (1):
      i2c: qcom-cci: Fix error checking in cci_probe()

Ilpo J=C3=A4rvinen (3):
      i2c: sis5595: Do PCI error checks on own line
      i2c: nforce2: Do PCI error check on own line
      I2C: ali15x3: Do PCI error checks on own line

Jinjie Ruan (1):
      i2c: Make return value check more accurate and explicit for devm_pinc=
trl_get()

Krzysztof Kozlowski (2):
      dt-bindings: i2c: nxp,pca9541: convert to DT schema
      dt-bindings: i2c: arb-gpio-challange: convert to DT schema

Liao Chang (9):
      i2c: bcm2835: Use dev_err_probe in probe function
      i2c: mlxbf: Use dev_err_probe in probe function
      i2c: xlp9xx: Use dev_err_probe in probe function
      i2c: hisi: Use dev_err_probe in probe function
      i2c: qcom-cci: Use dev_err_probe in probe function
      i2c: pxa: Use dev_err_probe in probe function
      i2c: dln2: Use dev_err_probe in probe function
      i2c: imx-lpi2c: Use dev_err_probe in probe function
      i2c: synquacer: Use dev_err_probe in probe function

Michal Simek (1):
      dt-bindings: i2c: cadence: Describe power-domains property

Patrick Rudolph (4):
      dt-bindings: i2c: pca954x: Correct interrupt support
      dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
      i2c: muxes: pca954x: Add MAX735x/MAX736x support
      i2c: muxes: pca954x: Add regulator support

Paul Cercueil (22):
      i2c: au1550: Remove #ifdef guards for PM related functions
      i2c: iproc: Remove #ifdef guards for PM related functions
      i2c: brcmstb: Remove #ifdef guards for PM related functions
      i2c: davinci: Remove #ifdef guards for PM related functions
      i2c: designware: Remove #ifdef guards for PM related functions
      i2c: exynos5: Remove #ifdef guards for PM related functions
      i2c: hix5hd2: Remove #ifdef guards for PM related functions
      i2c: i801: Remove #ifdef guards for PM related functions
      i2c: img-scb: Remove #ifdef guards for PM related functions
      i2c: kempld: Convert to use regular device PM
      i2c: lpc2k: Remove #ifdef guards for PM related functions
      i2c: mt65xx: Remove #ifdef guards for PM related functions
      i2c: nomadik: Remove #ifdef guards for PM related functions
      i2c: ocores: Remove #ifdef guards for PM related functions
      i2c: pnx: Remove #ifdef guards for PM related functions
      i2c: pxa: Remove #ifdef guards for PM related functions
      i2c: qup: Remove #ifdef guards for PM related functions
      i2c: rcar: Remove #ifdef guards for PM related functions
      i2c: s3c2410: Remove #ifdef guards for PM related functions
      i2c: sh-mobile: Remove #ifdef guards for PM related functions
      i2c: virtio: Remove #ifdef guards for PM related functions
      i2c: mux: pca954x: Remove #ifdef guards for PM related functions

Rob Herring (1):
      I2C: Explicitly include correct DT includes

Ruan Jinjie (3):
      i2c: s3c2410: Remove redundant dev_err()
      i2c: stm32: Do not check for 0 return after calling platform_get_irq()
      i2c: mux: ltc4306: Remove an unnecessary ternary operator

Vadim Pasternak (2):
      i2c: mlxcpld: Allow driver to run on ARM64 architecture
      i2c: mlxcpld: Add support for extended transaction length

Wolfram Sang (1):
      Merge remote-tracking branch 'andi/i2c/andi-for-next' into i2c/for-me=
rgewindow

Yangtao Li (11):
      i2c: at91: Use devm_platform_get_and_ioremap_resource()
      i2c: iproc: Convert to devm_platform_ioremap_resource()
      i2c: brcmstb: Convert to devm_platform_ioremap_resource()
      i2c: mlxbf: Use devm_platform_get_and_ioremap_resource()
      i2c: stm32f4: Use devm_platform_get_and_ioremap_resource()
      i2c: qcom-geni: Convert to devm_platform_ioremap_resource()
      i2c: st: Use devm_platform_get_and_ioremap_resource()
      i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
      i2c: s3c2410: Use devm_platform_get_and_ioremap_resource()
      i2c: pxa: Use devm_platform_get_and_ioremap_resource()
      i2c: pnx: Use devm_platform_get_and_ioremap_resource()

Yann Sionneau (2):
      i2c: designware: Add support for recovery when GPIO need pinctrl
      i2c: at91: Use dev_err_probe() instead of dev_err()

Zhu Wang (1):
      i2c: remove redundant dev_err_probe()


with much appreciated quality assurance from
----------------------------------------------------------------
 Kamal Dasu (1):
      (Rev.) i2c: brcmstb: Convert to devm_platform_ioremap_resource()

Andi Shyti (33):
      (Rev.) i2c: at91: Use dev_err_probe() instead of dev_err()
      (Rev.) I2C: ali15x3: Do PCI error checks on own line
      (Rev.) i2c: Make return value check more accurate and explicit for de=
vm_pinctrl_get()
      (Rev.) i2c: designware: Add support for recovery when GPIO need pinct=
rl
      (Rev.) i2c: nforce2: Do PCI error check on own line
      (Rev.) i2c: sis5595: Do PCI error checks on own line
      (Rev.) i2c: qcom-cci: Fix error checking in cci_probe()
      (Rev.) i2c: muxes: pca954x: Add regulator support
      (Rev.) i2c: muxes: pca954x: Add MAX735x/MAX736x support
      (Rev.) i2c: pnx: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: pxa: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: s3c2410: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: st: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: qcom-geni: Convert to devm_platform_ioremap_resource()
      (Rev.) i2c: stm32f4: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: mlxbf: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: brcmstb: Convert to devm_platform_ioremap_resource()
      (Rev.) i2c: iproc: Convert to devm_platform_ioremap_resource()
      (Rev.) i2c: at91: Use devm_platform_get_and_ioremap_resource()
      (Rev.) I2C: Explicitly include correct DT includes
      (Rev.) i2c: tiny-usb: check usb base class before assuming the interf=
ace on device is for this driver
      (Rev.) i2c: synquacer: Use dev_err_probe in probe function
      (Rev.) i2c: imx-lpi2c: Use dev_err_probe in probe function
      (Rev.) i2c: dln2: Use dev_err_probe in probe function
      (Rev.) i2c: pxa: Use dev_err_probe in probe function
      (Rev.) i2c: qcom-cci: Use dev_err_probe in probe function
      (Rev.) i2c: xlp9xx: Use dev_err_probe in probe function
      (Rev.) i2c: mlxbf: Use dev_err_probe in probe function
      (Rev.) i2c: stm32: Do not check for 0 return after calling platform_g=
et_irq()
      (Rev.) virtio: Remove PM #ifdef guards to fix i2c driver
      (Rev.) i2c: s3c2410: Remove redundant dev_err()
      (Rev.) i2c: imx-lpi2c: directly return ISR when detect a NACK

Andy Shevchenko (2):
      (Rev.) i2c: designware: Add support for recovery when GPIO need pinct=
rl
      (Rev.) i2c: designware: Remove #ifdef guards for PM related functions

Bartosz Golaszewski (1):
      (Rev.) i2c: davinci: Remove #ifdef guards for PM related functions

Bryan O'Donoghue (1):
      (Rev.) i2c: qcom-cci: Fix error checking in cci_probe()

Conor Dooley (2):
      (Rev.) dt-bindings: i2c: nxp,pca9541: convert to DT schema
      (Rev.) i2c: remove redundant dev_err_probe()

Florian Fainelli (4):
      (Rev.) i2c: brcmstb: Convert to devm_platform_ioremap_resource()
      (Rev.) i2c: bcm2835: Use dev_err_probe in probe function
      (Rev.) i2c: brcmstb: Remove #ifdef guards for PM related functions
      (Rev.) i2c: iproc: Remove #ifdef guards for PM related functions

Geert Uytterhoeven (3):
      (Rev.) i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: sh-mobile: Remove #ifdef guards for PM related functions
      (Rev.) i2c: rcar: Remove #ifdef guards for PM related functions

Jonathan Cameron (20):
      (Rev.) i2c: mux: pca954x: Remove #ifdef guards for PM related functio=
ns
      (Rev.) i2c: virtio: Remove #ifdef guards for PM related functions
      (Rev.) i2c: sh-mobile: Remove #ifdef guards for PM related functions
      (Rev.) i2c: s3c2410: Remove #ifdef guards for PM related functions
      (Rev.) i2c: rcar: Remove #ifdef guards for PM related functions
      (Rev.) i2c: qup: Remove #ifdef guards for PM related functions
      (Rev.) i2c: pxa: Remove #ifdef guards for PM related functions
      (Rev.) i2c: pnx: Remove #ifdef guards for PM related functions
      (Rev.) i2c: ocores: Remove #ifdef guards for PM related functions
      (Rev.) i2c: nomadik: Remove #ifdef guards for PM related functions
      (Rev.) i2c: mt65xx: Remove #ifdef guards for PM related functions
      (Rev.) i2c: lpc2k: Remove #ifdef guards for PM related functions
      (Rev.) i2c: i801: Remove #ifdef guards for PM related functions
      (Rev.) i2c: hix5hd2: Remove #ifdef guards for PM related functions
      (Rev.) i2c: exynos5: Remove #ifdef guards for PM related functions
      (Rev.) i2c: designware: Remove #ifdef guards for PM related functions
      (Rev.) i2c: davinci: Remove #ifdef guards for PM related functions
      (Rev.) i2c: brcmstb: Remove #ifdef guards for PM related functions
      (Rev.) i2c: iproc: Remove #ifdef guards for PM related functions
      (Rev.) i2c: au1550: Remove #ifdef guards for PM related functions

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
      (Rev.) dt-bindings: i2c: pca954x: Correct interrupt support

Linus Walleij (2):
      (Rev.) i2c: Make return value check more accurate and explicit for de=
vm_pinctrl_get()
      (Rev.) i2c: nomadik: Remove #ifdef guards for PM related functions

Michael Shych (2):
      (Rev.) i2c: mlxcpld: Add support for extended transaction length
      (Rev.) i2c: mlxcpld: Allow driver to run on ARM64 architecture

Paul Cercueil (1):
      (Rev.) virtio: Remove PM #ifdef guards to fix i2c driver

Uwe Kleine-K=C3=B6nig (1):
      (Rev.) i2c: imx: Clean up a call to request_irq()

Yicong Yang (1):
      (Rev.) i2c: hisi: Use dev_err_probe in probe function

 .../devicetree/bindings/i2c/cdns,i2c-r1p10.yaml    |   3 +
 .../bindings/i2c/i2c-arb-gpio-challenge.txt        |  82 -------------
 .../bindings/i2c/i2c-arb-gpio-challenge.yaml       | 135 +++++++++++++++++=
++++
 Documentation/devicetree/bindings/i2c/i2c-arb.txt  |  35 ------
 .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml   |  46 ++++++-
 .../devicetree/bindings/i2c/nxp,pca9541.txt        |  29 -----
 .../devicetree/bindings/i2c/nxp,pca9541.yaml       |  56 +++++++++
 drivers/i2c/busses/Kconfig                         |   2 +-
 drivers/i2c/busses/i2c-ali15x3.c                   |  11 +-
 drivers/i2c/busses/i2c-at91-core.c                 |  18 +--
 drivers/i2c/busses/i2c-at91-master.c               |   7 +-
 drivers/i2c/busses/i2c-au1550.c                    |  15 +--
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  20 +--
 drivers/i2c/busses/i2c-bcm2835.c                   |  16 ++-
 drivers/i2c/busses/i2c-brcmstb.c                   |  27 ++---
 drivers/i2c/busses/i2c-cpm.c                       |   4 +-
 drivers/i2c/busses/i2c-davinci.c                   |  16 +--
 drivers/i2c/busses/i2c-designware-master.c         |  12 ++
 drivers/i2c/busses/i2c-designware-platdrv.c        |  22 +---
 drivers/i2c/busses/i2c-dln2.c                      |   6 +-
 drivers/i2c/busses/i2c-emev2.c                     |   2 +-
 drivers/i2c/busses/i2c-exynos5.c                   |  12 +-
 drivers/i2c/busses/i2c-gxp.c                       |   3 +-
 drivers/i2c/busses/i2c-hisi.c                      |  12 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |  10 +-
 drivers/i2c/busses/i2c-i801.c                      |   6 +-
 drivers/i2c/busses/i2c-ibm_iic.c                   |   3 +-
 drivers/i2c/busses/i2c-img-scb.c                   |  10 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  23 ++--
 drivers/i2c/busses/i2c-imx.c                       |  10 +-
 drivers/i2c/busses/i2c-jz4780.c                    |   2 +-
 drivers/i2c/busses/i2c-kempld.c                    |  19 ++-
 drivers/i2c/busses/i2c-lpc2k.c                     |   9 +-
 drivers/i2c/busses/i2c-meson.c                     |   1 -
 drivers/i2c/busses/i2c-microchip-corei2c.c         |   5 +-
 drivers/i2c/busses/i2c-mlxbf.c                     |  60 +++------
 drivers/i2c/busses/i2c-mlxcpld.c                   |  10 ++
 drivers/i2c/busses/i2c-mpc.c                       |   3 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  12 +-
 drivers/i2c/busses/i2c-mt7621.c                    |   3 +-
 drivers/i2c/busses/i2c-mxs.c                       |   1 -
 drivers/i2c/busses/i2c-nforce2.c                   |   4 +-
 drivers/i2c/busses/i2c-nomadik.c                   |  12 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   |   1 -
 drivers/i2c/busses/i2c-ocores.c                    |  10 +-
 drivers/i2c/busses/i2c-owl.c                       |   3 +-
 drivers/i2c/busses/i2c-pca-platform.c              |   1 -
 drivers/i2c/busses/i2c-pnx.c                       |  15 +--
 drivers/i2c/busses/i2c-pxa-pci.c                   |   1 -
 drivers/i2c/busses/i2c-pxa.c                       |  20 +--
 drivers/i2c/busses/i2c-qcom-cci.c                  |   8 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   4 +-
 drivers/i2c/busses/i2c-qup.c                       |  16 +--
 drivers/i2c/busses/i2c-rcar.c                      |  12 +-
 drivers/i2c/busses/i2c-riic.c                      |   1 -
 drivers/i2c/busses/i2c-s3c2410.c                   |  20 +--
 drivers/i2c/busses/i2c-sh_mobile.c                 |  22 +---
 drivers/i2c/busses/i2c-sis5595.c                   |  20 +--
 drivers/i2c/busses/i2c-sprd.c                      |   1 -
 drivers/i2c/busses/i2c-st.c                        |   3 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |   3 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   8 +-
 drivers/i2c/busses/i2c-synquacer.c                 |  28 ++---
 drivers/i2c/busses/i2c-tegra-bpmp.c                |   2 +-
 drivers/i2c/busses/i2c-tegra.c                     |   2 +-
 drivers/i2c/busses/i2c-tiny-usb.c                  |   4 +
 drivers/i2c/busses/i2c-virtio.c                    |   8 +-
 drivers/i2c/busses/i2c-xlp9xx.c                    |   6 +-
 drivers/i2c/muxes/Kconfig                          |   6 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |   2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c                |   3 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                | 101 +++++++++++++--
 include/linux/virtio.h                             |   2 -
 73 files changed, 562 insertions(+), 565 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb-gpio-chal=
lenge.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb-gpio-chal=
lenge.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml

--qtyJt5okQRq7OboX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT1wNMACgkQFA3kzBSg
Kbajqg/9EkmZVVk8mDIca4WFoaUZmhsGG3Yh/7YQWaC7WdubsADLvRLIlkblAJIo
9e++wW7btBu9gS+mPjuUtarH3Eryd02FSPbEI+7sJO2cKZn5vSlEp1Lw35l8kaGt
iCY7gskVYFYR0GJDP15z6ZpK0xGqfexwYTZnnTFJVTMwUW3R6bn52Ty7YCi5vhiL
9aW4OdIaiNTsAX/8IRaFGvroKFShEwIC7rKHK9MZN/TFP/AK7uq2C1ETHk2HgdZX
q4Afl+dBnVJ7Vq5LPZVHppeZiWKq+/zMxVv2m71LBM7fA4NxpLgmWav1hXtwcbJm
N8YHTljmOQ+gK3wdQNhfcgy5TKwqiVHfjojOVfPVDVglcOy7o2/90pRFtMdfrj+a
teHaEDlnmdy7F20dhn+NaDpmKFz1wzffW16daTfoU7UDUxKh+X3EepEX479xVE0T
SDLEeuxO86LeUJ+thfbwyP+zmrSXYqjiLJGZ2n9lW139OfuhaE9I3lVqa3oU8S4Z
mRFQKWS5I4vuZUEs9YjAEhmAlRAbWIuzAAL3U3YbyXV0mUKcouac3hdmVh5nZdF4
UB5gSQEVZc1x44fzFhpIt+okSlKkC3EcfzdnCDvjEyNlubMInys5zqzawJ0fTM73
A5uBkGpEsUKRV/UV004Ou68jY86PAMSnFfX3ucZb0o49veqoJAA=
=EArr
-----END PGP SIGNATURE-----

--qtyJt5okQRq7OboX--
