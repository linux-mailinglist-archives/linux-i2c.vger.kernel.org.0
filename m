Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D5E64E37B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 22:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiLOVqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 16:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiLOVqa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 16:46:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEBD2A96B;
        Thu, 15 Dec 2022 13:46:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 48FA361F5B;
        Thu, 15 Dec 2022 21:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2137AC433D2;
        Thu, 15 Dec 2022 21:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671140786;
        bh=7gUbT7MLReGM6OgIgeqpfu5Jzns27RCTgZlDtZMrqXs=;
        h=Date:From:To:Cc:Subject:From;
        b=Hi5Rx96quLqVCGHAiPWdlUFJ9GBO1xSj2NLdlKTRVf2WaQkk5KRnXi42iMzJbdD/d
         P69vD14ktBiGD707lkCjyQlXyprGy9fnueePWlLMf8YUp6n1Ztml/N0VJLmwZaqSrT
         bFKnVzsFFAQgCHCQmajj2yQuZECnBAnZ36RBesJUfvFq9gTVd0NKM8KrAJijvSYGqQ
         2aXLUBy6xNFOGlA1/YOsZ3TSWaGNChmvLIzRAJWrdfXFsw1YEyDhRut70stf/hyrEz
         tKDS2fpFYOPWDjNHhsk1c1hCiwicmXcxCi9KpDtsrRjHkQ6anTBeL1+QYeHgtmdlHk
         04o70vKpVetQw==
Date:   Thu, 15 Dec 2022 22:46:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.2-rc1
Message-ID: <Y5uVrz8YuuWDpAzR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WiCE9ZIuPB6tVXCL"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WiCE9ZIuPB6tVXCL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 30a0b95b1335e12efef89dd78518ed3e4a71a763:

  Linux 6.1-rc3 (2022-10-30 15:19:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.2-rc1

for you to fetch changes up to 39244cc754829bf707dccd12e2ce37510f5b1f8d:

  i2c: ismt: Fix an out-of-bounds bug in ismt_access() (2022-12-07 21:27:08=
 +0100)

----------------------------------------------------------------
Core got a new helper 'i2c_client_get_device_id', designware got some
bigger updates, the rest is driver updates all over the place

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Set ACPI node as primary fwnode

Andre Przywara (1):
      dt-bindings: i2c: mv64xxx: Add F1C100s compatible string

Angel Iglesias (1):
      i2c: core: Introduce i2c_client_get_device_id helper function

Arminder Singh (1):
      i2c: /pasemi: PASemi I2C controller IRQ enablement

Binbin Zhou (1):
      i2c: gpio: Fix potential unused warning for 'i2c_gpio_dt_ids'

Corentin Labbe (1):
      i2c: smbus: add DDR support for SPD

Frank Wunderlich (2):
      dt-bindings: i2c: update bindings for mt7986 soc
      i2c: mediatek: add mt7986 support

Hui Tang (1):
      i2c: pxa-pci: fix missing pci_disable_device() on error in ce4100_i2c=
_probe

Jarkko Nikula (12):
      i2c: designware: Fix slave state machine for sequential reads
      i2c: designware: Empty receive FIFO in slave interrupt handler
      i2c: designware: Define software status flags with BIT()
      i2c: designware: Remove needless initializations from i2c_dw_reg_slav=
e()
      i2c: designware: Remove unused completion code from i2c-designware-sl=
ave
      i2c: designware: Simplify slave interrupt handler nesting
      i2c: designware: Do not process interrupt when device is suspended
      i2c: designware: Move debug print in i2c_dw_isr()
      i2c: designware: Simplify master interrupt handler nesting
      i2c: designware: Remove common i2c_dw_disable_int()
      i2c: designware: Align defines in i2c-designware-core.h
      i2c: designware: Add comment to custom register value constants

Jonathan Neusch=C3=A4fer (2):
      i2c: npcm7xx: Group bank 0/1 registers together for readability
      i2c: npcm7xx: Annotate register field definitions with longer names

Lad Prabhakar (1):
      dt-bindings: i2c: renesas,riic: Document RZ/Five SoC

Minghao Chi (1):
      i2c: imx: use devm_platform_get_and_ioremap_resource()

Neil Armstrong (6):
      dt-bindings: qcom: geni-se: document I2C Master Hub wrapper variant
      dt-bindings: i2c: qcom-geni: document I2C Master Hub serial I2C engine
      soc: qcom: geni-se: add desc struct to specify clocks from device mat=
ch data
      soc: qcom: geni-se: add support for I2C Master Hub wrapper variant
      i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub=
 variant
      i2c: qcom-geni: add support for I2C Master Hub variant

Peter Rosin (1):
      i2c: mux: pca9541: switch to using .probe_new

Raju Rangoju (1):
      i2c: amd-mp2: use msix/msi if the hardware supports

Stephen Kitt (1):
      drivers/i2c: use simple i2c probe

Uwe Kleine-K=C3=B6nig (3):
      i2c: mux: pca954x: Convert to i2c's .probe_new()
      i2c: slave-eeprom: Convert to i2c's .probe_new()
      i2c: xiic: Make sure to disable clock on .remove()

Weilong Chen (3):
      i2c: hisi: Add initial device tree support
      dt-bindings: i2c: add entry for hisilicon,ascend910-i2c
      i2c: hisi: Add support to get clock frequency from clock

Wolfram Sang (1):
      Merge branch 'i2c/client_device_id_helper-immutable' into i2c/for-mer=
gewindow

Yang Yingliang (1):
      i2c: mux: reg: check return value after calling platform_get_resource=
()

Zheyu Ma (1):
      i2c: ismt: Fix an out-of-bounds bug in ismt_access()


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (15):
      (Rev.) i2c: gpio: Fix potential unused warning for 'i2c_gpio_dt_ids'
      (Rev.) i2c: core: Introduce i2c_client_get_device_id helper function
      (Rev.) i2c: designware: Add comment to custom register value constants
      (Rev.) i2c: designware: Align defines in i2c-designware-core.h
      (Rev.) i2c: designware: Remove common i2c_dw_disable_int()
      (Rev.) i2c: designware: Simplify master interrupt handler nesting
      (Rev.) i2c: designware: Move debug print in i2c_dw_isr()
      (Rev.) i2c: designware: Do not process interrupt when device is suspe=
nded
      (Rev.) i2c: designware: Simplify slave interrupt handler nesting
      (Rev.) i2c: designware: Remove unused completion code from i2c-design=
ware-slave
      (Rev.) i2c: designware: Remove needless initializations from i2c_dw_r=
eg_slave()
      (Rev.) i2c: designware: Define software status flags with BIT()
      (Rev.) i2c: designware: Empty receive FIFO in slave interrupt handler
      (Rev.) i2c: designware: Fix slave state machine for sequential reads
      (Rev.) i2c: hisi: Add initial device tree support

AngeloGioacchino Del Regno (2):
      (Rev.) i2c: mediatek: add mt7986 support
      (Rev.) dt-bindings: i2c: update bindings for mt7986 soc

Geert Uytterhoeven (1):
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/Five SoC

Hector Martin (1):
      (Rev.) i2c: /pasemi: PASemi I2C controller IRQ enablement

Jean Delvare (1):
      (Rev.) i2c: smbus: add DDR support for SPD

Jonathan Cameron (1):
      (Rev.) i2c: core: Introduce i2c_client_get_device_id helper function

Konrad Dybcio (4):
      (Rev.) i2c: qcom-geni: add support for I2C Master Hub variant
      (Rev.) i2c: qcom-geni: add desc struct to prepare support for I2C Mas=
ter Hub variant
      (Rev.) soc: qcom: geni-se: add support for I2C Master Hub wrapper var=
iant
      (Rev.) soc: qcom: geni-se: add desc struct to specify clocks from dev=
ice match data

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom-geni: document I2C Master Hub serial I2=
C engine
      (Rev.) dt-bindings: qcom: geni-se: document I2C Master Hub wrapper va=
riant

Mukesh Ojha (1):
      (Rev.) i2c: imx: use devm_platform_get_and_ioremap_resource()

Rob Herring (1):
      (Rev.) dt-bindings: i2c: add entry for hisilicon,ascend910-i2c

Sven Peter (1):
      (Rev.) i2c: /pasemi: PASemi I2C controller IRQ enablement

Tali Perry (2):
      (Rev.) i2c: npcm7xx: Annotate register field definitions with longer =
names
      (Rev.) i2c: npcm7xx: Group bank 0/1 registers together for readability

Thierry Reding (1):
      (Rev.) i2c: tegra: Set ACPI node as primary fwnode

Uwe Kleine-K=C3=B6nig (1):
      (Rev.) i2c: imx: use devm_platform_get_and_ioremap_resource()

Yicong Yang (1):
      (Rev.) dt-bindings: i2c: add entry for hisilicon,ascend910-i2c

 .../bindings/i2c/hisilicon,ascend910-i2c.yaml      |  73 +++++++
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |   1 +
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           |  64 +++++-
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   2 +-
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |  44 +++-
 MAINTAINERS                                        |   1 +
 drivers/i2c/busses/Kconfig                         |   2 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |  30 ++-
 drivers/i2c/busses/i2c-amd-mp2.h                   |   1 +
 drivers/i2c/busses/i2c-designware-common.c         |   5 -
 drivers/i2c/busses/i2c-designware-core.h           | 235 ++++++++++-------=
----
 drivers/i2c/busses/i2c-designware-master.c         |  44 ++--
 drivers/i2c/busses/i2c-designware-slave.c          |  77 +++----
 drivers/i2c/busses/i2c-gpio.c                      |   4 +-
 drivers/i2c/busses/i2c-hisi.c                      |  22 +-
 drivers/i2c/busses/i2c-imx.c                       |   3 +-
 drivers/i2c/busses/i2c-ismt.c                      |   3 +
 drivers/i2c/busses/i2c-mt65xx.c                    |  14 ++
 drivers/i2c/busses/i2c-npcm7xx.c                   |  87 ++++----
 drivers/i2c/busses/i2c-pasemi-core.c               |  32 ++-
 drivers/i2c/busses/i2c-pasemi-core.h               |   5 +
 drivers/i2c/busses/i2c-pasemi-platform.c           |   6 +
 drivers/i2c/busses/i2c-pxa-pci.c                   |  10 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  58 ++++-
 drivers/i2c/busses/i2c-tegra.c                     |   1 +
 drivers/i2c/busses/i2c-xiic.c                      |   9 +-
 drivers/i2c/i2c-core-base.c                        |  19 +-
 drivers/i2c/i2c-slave-eeprom.c                     |   5 +-
 drivers/i2c/i2c-smbus.c                            |  11 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c                |   5 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   6 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   5 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  79 +++++--
 include/linux/i2c.h                                |   1 +
 35 files changed, 638 insertions(+), 327 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,ascend9=
10-i2c.yaml

--WiCE9ZIuPB6tVXCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmObla8ACgkQFA3kzBSg
KbZATA/+Pr0X1mGIxQfpiPxqbjUJel8+lpU+SyISl8d5qMkesNXssc3hjsXNE+TP
U5p2ox06DPasogPi2iDnHmMcN3vJaYtSLJJSPMiVyDNpj8hcEibcAx0F7h+jiFiH
GhcHxQ+UOxhUlROuYeIPfoU9N7OVxCyK2kd/5OCbSAHxFwqO6laSy+rxlEWrTd26
VzeeeXvD5KABouTvGtTByN4ZaB/sB3KXYegwBsfr4/uWQM8FRE4Z7Mtd2xJoUjMl
EHiRPjHR+aOU1cKSRrpLVRrOEzK+bR+zVx2Yxs3Bxw34I+tndJotOpK7zth4yi7l
11B9nWRxfAmwBPhFj/Js590M2cWZNpNxkdgR4hEeTVWObxTByuaMt9NteWZgKjO7
E2dUVWDVQH5nrPdXToGgthDazYxf1qwVr7Q7KtqjQdaiT4kj/Z1CIJqNi/wpFozL
QCHG7UOIaJXTqeJd0JQ+LWAPOGhoxFyEDk2XNG6m10LauHeRu2ciTfT/aShClGZC
jzytdJUOsalu6smRU1qnc5Qimrv9ca+3gVjhpm+kxSjDiDnHZMvC+ti/9ihLnd5L
VOK4I2+FF4BToEwV+35M3G5mDrel5xkRkWkHcsgimMq2HvDqKUVC2Ijr+i+b3Snt
yIyIfrxa0/4C4jmftG/XVnU6c8KtKTZbiFcPqzbHFw7vyvh9hXA=
=4U+c
-----END PGP SIGNATURE-----

--WiCE9ZIuPB6tVXCL--
