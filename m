Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD5FB587DE9
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Aug 2022 16:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbiHBOJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Aug 2022 10:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbiHBOJW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Aug 2022 10:09:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563B12A96C;
        Tue,  2 Aug 2022 07:09:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E68CD6148A;
        Tue,  2 Aug 2022 14:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6D8C433D6;
        Tue,  2 Aug 2022 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659449360;
        bh=Ms7uCm8JxZAZq3qICBfe4NEofUcgXaVTnDhcDLjSwFA=;
        h=Date:From:To:Cc:Subject:From;
        b=ba5SC2rTTxOXIJVE+r1vYbu6tn6W7SKpVgO2RiK2uToupZqtJ7LQ29yX8WXBiVRcQ
         ZDRqVPI3VXC52y3cOd9+jB9Kos3EAMO1dOpHBXNjGK5YjEUVlgB7NsusFnHuiAq/+D
         XsPuEgZrL6R+uLUiwbjM0A08eYuof/L9ZszN5g5g/Fnrm2ksXcTJ1FncYcWSPcsvDO
         MYG+MR6b6LfSxZoOYCSh4P48CwM4+AUMpUi8f0pyf7lTQcGmDuIzD2kcghQcxhkNSB
         U+7PTVKmMB5L7njhnn4E6STS842NU84qBSChv5r+lDJC5SirP4rLeheQjPQbRnurjc
         hnPTqJaZ4WWew==
Date:   Tue, 2 Aug 2022 16:09:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-5.20-rc1
Message-ID: <YukwCEIqWyIZmMza@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4PZrtKz5G9uyjYQi"
Content-Disposition: inline
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4PZrtKz5G9uyjYQi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
5.20-rc1

for you to fetch changes up to a11821495fd4d9b5c97945db929e02c473b7a5d9:

  i2c: extend documentation about retvals of master_xfer functions (2022-07=
-26 23:13:36 +0200)

----------------------------------------------------------------
- new drivers: Microchip CoreI2C, Renesas RZV2M
- quite some DT schema conversions and extensions
- and a bunch of driver updates and improvements

----------------------------------------------------------------
Alain Volmat (2):
      dt-bindings: i2c: st,stm32-i2c: add entry for stm32mp13
      i2c: stm32: add support for the STM32MP13 soc

Andy Shevchenko (1):
      i2c: scmi: Replace open coded device_get_match_data()

Bjorn Andersson (2):
      i2c: qcom-geni: Propagate GENI_ABORT_DONE to geni_i2c_abort_xfer()
      i2c: qcom-geni: Use the correct return value

Chris Morgan (2):
      i2c: mv64xxx: Remove shutdown method from driver
      i2c: mv64xxx: Add atomic_xfer method to driver

Conor Dooley (2):
      dt-bindings: i2c: convert ocores binding to yaml
      i2c: add support for microchip fpga i2c controllers

Fabio Estevam (1):
      i2c: mxs: Silence a clang warning

Florian Fainelli (1):
      i2c: brcmstb: Use dev_name() for adapter name

Jagan Teki (1):
      dt-bindings: i2c: i2c-rk3x: Document Rockchip RV1126

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Meteor Lake-P

Lars-Peter Clausen (1):
      i2c: cadence: Support PEC for SMBus block read

Liang He (1):
      i2c: mux-gpmux: Add of_node_put() when breaking out of loop

Linus Walleij (3):
      dt-bindings: i2c: Rewrite Nomadik I2C bindings in YAML
      dt-bindings: i2c: nomadik: Drop unused voltage supply from example
      dt-bindings: i2c: nomadik: Add power domain to binding

Luca Weiss (1):
      dt-bindings: i2c: qcom-cci: add QCOM MSM8974 compatible

Lukas Bulwahn (1):
      MAINTAINERS: Rectify entry for OPENCORES I2C BUS DRIVER

Matti Lehtim=C3=A4ki (1):
      i2c: qcom-cci: add msm8974 compatible

Phil Edworthy (2):
      dt-bindings: i2c: Document RZ/V2M I2C controller
      i2c: Add Renesas RZ/V2M controller

Rob Herring (1):
      dt-bindings: i2c: Convert arm,i2c-versatile to DT schema

Sebastian Reichel (1):
      dt-bindings: i2c: i2c-rk3x: add rk3588 compatible

Shubhrajyoti Datta (1):
      i2c: xiic: Fix the type check for xiic_wakeup

Tali Perry (2):
      i2c: npcm: Remove own slave addresses 2:10
      i2c: npcm: Correct slave role behavior

Tyrone Ting (3):
      dt-bindings: i2c: npcm: support NPCM845
      i2c: npcm: Support NPCM845
      i2c: npcm: Capitalize the one-line comment

Uwe Kleine-K=C3=B6nig (1):
      i2c: dummy: Drop no-op remove function

Vadim Pasternak (1):
      i2c: mlxcpld: Add callback to notify probing completion

Vladimir Zapolskiy (1):
      i2c: qcom-cci: simplify access to bus data structure

Wolfram Sang (1):
      i2c: extend documentation about retvals of master_xfer functions

Xu Wang (1):
      i2c: Fix a potential use after free

Yicong Yang (1):
      i2c: hisi: use HZ_PER_KHZ macro in units.h


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Halaney (1):
      (Rev.) i2c: qcom-geni: Use the correct return value

Andy Shevchenko (7):
      (Rev.) i2c: Add Renesas RZ/V2M controller
      (Rev.) i2c: i801: Add support for Intel Meteor Lake-P
      (Rev.) i2c: npcm: Capitalize the one-line comment
      (Rev.) i2c: npcm: Support NPCM845
      (Rev.) i2c: npcm: Correct slave role behavior
      (Rev.) i2c: npcm: Remove own slave addresses 2:10
      (Rev.) dt-bindings: i2c: npcm: support NPCM845

Biju Das (2):
      (Rev.) i2c: Add Renesas RZ/V2M controller
      (Rev.) dt-bindings: i2c: Document RZ/V2M I2C controller

Jean Delvare (1):
      (Rev.) i2c: i801: Add support for Intel Meteor Lake-P

Johan Hovold (1):
      (Rev.) i2c: qcom-geni: Use the correct return value

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: npcm: support NPCM845
      (Rev.) dt-bindings: i2c: Convert arm,i2c-versatile to DT schema

Loic Poulain (2):
      (Rev.) i2c: qcom-cci: add msm8974 compatible
      (Rev.) i2c: qcom-cci: simplify access to bus data structure

Philipp Zabel (1):
      (Rev.) i2c: Add Renesas RZ/V2M controller

Pierre-Yves MORDRET (1):
      (Rev.) i2c: stm32: add support for the STM32MP13 soc

Rob Herring (4):
      (Rev.) dt-bindings: i2c: Document RZ/V2M I2C controller
      (Rev.) dt-bindings: i2c: npcm: support NPCM845
      (Rev.) dt-bindings: i2c: convert ocores binding to yaml
      (Rev.) dt-bindings: i2c: Rewrite Nomadik I2C bindings in YAML

Shubhrajyoti Datta (1):
      (Test) i2c: cadence: Support PEC for SMBus block read

Vinod Koul (2):
      (Rev.) i2c: qcom-geni: Use the correct return value
      (Rev.) i2c: qcom-geni: Propagate GENI_ABORT_DONE to geni_i2c_abort_xf=
er()

 .../devicetree/bindings/i2c/arm,i2c-versatile.yaml |  29 ++
 .../devicetree/bindings/i2c/i2c-nomadik.txt        |  23 -
 .../devicetree/bindings/i2c/i2c-ocores.txt         |  78 ---
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |   7 +-
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   2 +
 .../devicetree/bindings/i2c/i2c-versatile.txt      |  10 -
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml          |  25 +-
 .../bindings/i2c/opencores,i2c-ocores.yaml         | 113 +++++
 .../devicetree/bindings/i2c/renesas,rzv2m.yaml     |  80 ++++
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 115 +++++
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |   2 +
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 MAINTAINERS                                        |   6 +-
 drivers/i2c/busses/Kconfig                         |  30 +-
 drivers/i2c/busses/Makefile                        |   4 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |   4 +-
 drivers/i2c/busses/i2c-cadence.c                   |  10 +-
 drivers/i2c/busses/i2c-hisi.c                      |   3 +-
 drivers/i2c/busses/i2c-i801.c                      |   3 +
 drivers/i2c/busses/i2c-microchip-corei2c.c         | 480 +++++++++++++++++=
++
 drivers/i2c/busses/i2c-mlxcpld.c                   |   4 +
 drivers/i2c/busses/i2c-mv64xxx.c                   |  61 ++-
 drivers/i2c/busses/i2c-mxs.c                       |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   | 176 ++++---
 drivers/i2c/busses/i2c-qcom-cci.c                  |  62 ++-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  22 +-
 drivers/i2c/busses/i2c-rzv2m.c                     | 532 +++++++++++++++++=
++++
 drivers/i2c/busses/i2c-scmi.c                      |   9 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   7 +
 drivers/i2c/busses/i2c-xiic.c                      |   4 +-
 drivers/i2c/i2c-core-base.c                        |   9 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |   1 +
 include/linux/i2c.h                                |   3 +-
 33 files changed, 1655 insertions(+), 262 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/arm,i2c-versatile=
=2Eyaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-nomadik.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-versatile.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/opencores,i2c-oco=
res.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.ya=
ml
 create mode 100644 drivers/i2c/busses/i2c-microchip-corei2c.c
 create mode 100644 drivers/i2c/busses/i2c-rzv2m.c

--4PZrtKz5G9uyjYQi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLpMAcACgkQFA3kzBSg
KbbTDQ/+Pggnq0TPaKmjEkjuKWdjISvx0zUqivGFhhpueRfI85Q89YwdeCWlfHir
pA8uzgo95VYFBfc9XxtVOuiOZL7nf/boQvEoBV0eE9JE2CnSgoxEygaDCPmi7wuU
qTC2BsG7roJ7UQRY6H6lOMANnlHsUROt1iFzqmPok1pisdtAQrES3ZGFb4AqB5z2
bmtAL5DGVw/0QllBo2jTxZ9j89Y2jndfBVekyUW7kvFdvP6oI7ZJehf2IgRyC7yU
Z5CUHcaTjeASR2LspaY39PKSf8RSoGnx+FDW8d8QG7H3T8xyp+lusFBb9kFXF84L
BGmKEErggBdJuh0uY9CkbIfVrmTBtpywpSHPlBiM8wnWiria4P0/7bwHnZoODkLq
PrGB1XlzzuplbuSOJxQ5iq5m8rgiDQhLRm7XRfvbYmkEYgfqnpy/9dUuK+mVASb9
v7F1WO6TdCTFGT+PfmxMyxpBLzC0mUq2suELquNCdQRqUj8qmg3isqHhgrOYmfxB
GahSyHNTLdcf7V5+RzXJwCLacEWry8JYDG3XyGqM+8EKvLm0/ZkjiYGiY64wxwPf
VT/a6q5PhOYvCb99/S9J7kjzAGuAz7FGUO8O4VG3ZB7DxRUsfHG58kepRG5+MQ3C
5l2POP+9c79mimV5TyihD0aCz66rPHnniyPPVOuAGUeB+okk+sk=
=yr4O
-----END PGP SIGNATURE-----

--4PZrtKz5G9uyjYQi--
