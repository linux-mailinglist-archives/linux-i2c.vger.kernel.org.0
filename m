Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9E3B744D79
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jul 2023 13:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjGBLy6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jul 2023 07:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjGBLy6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jul 2023 07:54:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7273E1B0;
        Sun,  2 Jul 2023 04:54:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E49DE60B6A;
        Sun,  2 Jul 2023 11:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9535DC433C8;
        Sun,  2 Jul 2023 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688298895;
        bh=rM5N92wCqF7pdUlr9rbxQUKdS3miUtavyNRooiHGKYw=;
        h=Date:From:To:Cc:Subject:From;
        b=nZPmEEwwuEczxweapM6GDfRYq8EsMrYeL2FLt2kufT9dzCoqWW35O6X239oi4AmHh
         WqP/sVMQMrIUkFLq8PYX+TsIpsyI92X6Lp2GLrUUU9BL8+JNLBbYPk8GO/W9e1zVmF
         8KIptdQbCHafmq+shO1K07+xpCqmHGAtg+2n7YFzsYqzdFccVdAaS2rYtTiSXv0DFl
         NQnOhvXgyI6KQdzd+TUpxQV/hO6mx/ipV7q5WtYJOUns0tcsEwk/bncc3hYKOtxKfT
         e7BDdnp8HLnn6Bl9EISr6hRewAo87Qj+DkaAxau9Wahjrk+Hyf0CjPogBZfTQUafRQ
         11VIpWPEAPU5Q==
Date:   Sun, 2 Jul 2023 13:54:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.5-rc1
Message-ID: <ZKFlfZS3y0eBI63e@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="umR+ez4sFrMUWuD2"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--umR+ez4sFrMUWuD2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

Stephen pointed out a misunderstanding. Patch "usb: typec: ucsi: Mark
dGPUs as DEVICE scope" may also come to you via the USB tree. Because
both commits are identical, we agreed to just leave things this way.

Please pull.

   Wolfram

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.5-rc1

for you to fetch changes up to 6fb605c41d731d511b33045d0cd713d706970b6d:

  Merge tag 'at24-updates-for-v6.5' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/brgl/linux into i2c/for-mergewindow (2023-06-23 12:59:46 +0200)

----------------------------------------------------------------
Biggest news is not a patch this time

* I2C has now a co-maintainer taking care of the host drivers. Welcome
  Andi Shyti and have fun!
* platform remove callback converted to return void in drivers
* simplify drivers by using devm_clk_get_enabled()
* introduce i2c_get_match_data() to avoid more boilerplate code
  (especially since the core stopped delivering an i2c_device_id)
* and the usual bunch of driver updates

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Share same DMA channel for RX and TX

Alexander Stein (1):
      eeprom: at24: Use dev_err_probe for nvmem register failure

Andi Shyti (12):
      i2c: nomadik: Remove unnecessary goto label
      i2c: nomadik: Use devm_clk_get_enabled()
      i2c: nomadik: Use dev_err_probe() whenever possible
      i2c: xiic: Use devm_clk_get_enabled()
      i2c: mt7621: Use devm_clk_get_enabled()
      i2c: pasemi-platform: Use devm_clk_get_enabled()
      i2c: sun6i-p2wi: Use devm_clk_get_enabled()
      i2c: hix5hd2: Use devm_clk_get_enabled()
      i2c: lpc2k: Use devm_clk_get_enabled()
      i2c: owl: Use devm_clk_get_enabled()
      i2c: uniphier-f: Use devm_clk_get_enabled()
      i2c: uniphier: Use devm_clk_get_enabled()

Andrew Davis (2):
      i2c: davinci: Use struct name not type with devm_kzalloc()
      i2c: davinci: Use platform table macro over module_alias

Biju Das (4):
      i2c: rzv2m: Drop extra space
      i2c: rzv2m: Replace lowercase macros with static inline functions
      i2c: rzv2m: Disable the operation of unit in case of error
      i2c: Add i2c_get_match_data()

Jarkko Nikula (3):
      i2c: i801: Enlarge device name field in i801_ids table
      i2c: i801: Add support for Intel Meteor Lake SoC-S
      i2c: i801: Add support for Intel Meteor Lake PCH-S

Jiawen Wu (1):
      i2c: designware: Add driver support for Wangxun 10Gb NIC

Mario Limonciello (1):
      usb: typec: ucsi: Mark dGPUs as DEVICE scope

Markus Elfring (2):
      i2c: Delete error messages for failed memory allocations
      i2c: Improve size determinations

Md Sadre Alam (1):
      i2c: qcom-cci:Use devm_platform_get_and_ioremap_resource()

Micha=C5=82 Miros=C5=82aw (2):
      i2c: tegra: allow DVC support to be compiled out
      i2c: tegra: allow VI support to be compiled out

Rob Herring (1):
      i2c: mpc: Use of_property_read_reg() to parse "reg"

Uwe Kleine-K=C3=B6nig (2):
      i2c: Convert to platform remove callback returning void
      i2c: imx-lpi2c: Don't open-code DIV_ROUND_UP

Wang Zhang (1):
      i2c: ocores: use devm_ managed clks

Wolfram Sang (1):
      Merge tag 'at24-updates-for-v6.5' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/brgl/linux into i2c/for-mergewindow

XU pengfei (1):
      i2c: img-scb: remove unnecessary (void*) conversion

taolan (1):
      i2c: hix5hd2: Add I2C_M_STOP flag support for i2c-hix5hd2 driver.

ye xingchen (2):
      i2c: versatile: Use devm_platform_get_and_ioremap_resource()
      i2c: wmt: Use devm_platform_get_and_ioremap_resource()


with much appreciated quality assurance from
----------------------------------------------------------------
Alyssa Rosenzweig (1):
      (Rev.) i2c: pasemi-platform: Use devm_clk_get_enabled()

Andi Shyti (7):
      (Rev.) i2c: ocores: use devm_ managed clks
      (Rev.) i2c: wmt: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: versatile: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: imx-lpi2c: Don't open-code DIV_ROUND_UP
      (Rev.) i2c: i801: Add support for Intel Meteor Lake PCH-S
      (Rev.) i2c: i801: Add support for Intel Meteor Lake SoC-S
      (Rev.) i2c: i801: Enlarge device name field in i801_ids table

Andrew Lunn (1):
      (Rev.) i2c: ocores: use devm_ managed clks

Andy Shevchenko (1):
      (Rev.) i2c: designware: Add driver support for Wangxun 10Gb NIC

Asmaa Mnebhi (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Bartosz Golaszewski (3):
      (Rev.) i2c: davinci: Use platform table macro over module_alias
      (Rev.) i2c: davinci: Use struct name not type with devm_kzalloc()
      (Rev.) i2c: Convert to platform remove callback returning void

Chris Packham (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Chris Pringle (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Claudiu Beznea (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Conor Dooley (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Dmitry Osipenko (2):
      (Rev.) i2c: tegra: allow VI support to be compiled out
      (Rev.) i2c: tegra: allow DVC support to be compiled out

Evan Quan (2):
      (Rev.) usb: typec: ucsi: Mark dGPUs as DEVICE scope
      (Test) usb: typec: ucsi: Mark dGPUs as DEVICE scope

Geert Uytterhoeven (2):
      (Rev.) i2c: rzv2m: Drop extra space
      (Rev.) i2c: Convert to platform remove callback returning void

Hans de Goede (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Heikki Krogerus (1):
      (Rev.) usb: typec: ucsi: Mark dGPUs as DEVICE scope

Jean Delvare (4):
      (Rev.) i2c: i801: Add support for Intel Meteor Lake PCH-S
      (Rev.) i2c: i801: Add support for Intel Meteor Lake SoC-S
      (Rev.) i2c: i801: Enlarge device name field in i801_ids table
      (Rev.) i2c: Convert to platform remove callback returning void

Jernej Skrabec (1):
      (Rev.) i2c: sun6i-p2wi: Use devm_clk_get_enabled()

Konrad Dybcio (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Krzysztof Kozlowski (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Linus Walleij (5):
      (Rev.) i2c: nomadik: Use dev_err_probe() whenever possible
      (Rev.) i2c: nomadik: Use devm_clk_get_enabled()
      (Rev.) i2c: nomadik: Remove unnecessary goto label
      (Rev.) i2c: versatile: Use devm_platform_get_and_ioremap_resource()
      (Rev.) i2c: Convert to platform remove callback returning void

Martin Blumenstingl (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Matthias Brugger (2):
      (Rev.) i2c: mt7621: Use devm_clk_get_enabled()
      (Rev.) i2c: Convert to platform remove callback returning void

Patrice Chotard (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Piotr Raczynski (1):
      (Rev.) i2c: designware: Add driver support for Wangxun 10Gb NIC

Sebastian Reichel (1):
      (Rev.) usb: typec: ucsi: Mark dGPUs as DEVICE scope

Stefan Roese (1):
      (Rev.) i2c: mt7621: Use devm_clk_get_enabled()

Tali Perry (1):
      (Rev.) i2c: Convert to platform remove callback returning void

Vignesh Raghavendra (1):
      (Rev.) i2c: Convert to platform remove callback returning void

 Documentation/i2c/busses/i2c-i801.rst       |   2 +-
 drivers/i2c/busses/Kconfig                  |   4 +-
 drivers/i2c/busses/i2c-altera.c             |   6 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |   5 +-
 drivers/i2c/busses/i2c-aspeed.c             |   6 +-
 drivers/i2c/busses/i2c-at91-core.c          |   6 +-
 drivers/i2c/busses/i2c-au1550.c             |   5 +-
 drivers/i2c/busses/i2c-axxia.c              |   6 +-
 drivers/i2c/busses/i2c-bcm-iproc.c          |   6 +-
 drivers/i2c/busses/i2c-bcm-kona.c           |   6 +-
 drivers/i2c/busses/i2c-bcm2835.c            |   6 +-
 drivers/i2c/busses/i2c-brcmstb.c            |   5 +-
 drivers/i2c/busses/i2c-cadence.c            |   6 +-
 drivers/i2c/busses/i2c-cbus-gpio.c          |   6 +-
 drivers/i2c/busses/i2c-cht-wc.c             |   6 +-
 drivers/i2c/busses/i2c-cpm.c                |   6 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     |   6 +-
 drivers/i2c/busses/i2c-davinci.c            |  29 +++----
 drivers/i2c/busses/i2c-designware-common.c  |   8 ++
 drivers/i2c/busses/i2c-designware-core.h    |   4 +
 drivers/i2c/busses/i2c-designware-master.c  |  89 +++++++++++++++++--
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  13 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c |  21 ++++-
 drivers/i2c/busses/i2c-digicolor.c          |   6 +-
 drivers/i2c/busses/i2c-dln2.c               |   6 +-
 drivers/i2c/busses/i2c-emev2.c              |   6 +-
 drivers/i2c/busses/i2c-exynos5.c            |   6 +-
 drivers/i2c/busses/i2c-gpio.c               |   6 +-
 drivers/i2c/busses/i2c-gxp.c                |   6 +-
 drivers/i2c/busses/i2c-highlander.c         |   6 +-
 drivers/i2c/busses/i2c-hix5hd2.c            |  23 +++--
 drivers/i2c/busses/i2c-i801.c               | 128 +++++++++++++++---------=
----
 drivers/i2c/busses/i2c-ibm_iic.c            |  10 +--
 drivers/i2c/busses/i2c-img-scb.c            |   8 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c          |   8 +-
 drivers/i2c/busses/i2c-imx.c                |   6 +-
 drivers/i2c/busses/i2c-iop3xx.c             |   6 +-
 drivers/i2c/busses/i2c-isch.c               |   6 +-
 drivers/i2c/busses/i2c-jz4780.c             |   5 +-
 drivers/i2c/busses/i2c-kempld.c             |   6 +-
 drivers/i2c/busses/i2c-lpc2k.c              |  28 ++----
 drivers/i2c/busses/i2c-meson.c              |   6 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c  |   6 +-
 drivers/i2c/busses/i2c-mlxbf.c              |   6 +-
 drivers/i2c/busses/i2c-mlxcpld.c            |   6 +-
 drivers/i2c/busses/i2c-mpc.c                |  11 ++-
 drivers/i2c/busses/i2c-mt65xx.c             |   6 +-
 drivers/i2c/busses/i2c-mt7621.c             |  26 ++----
 drivers/i2c/busses/i2c-mv64xxx.c            |   6 +-
 drivers/i2c/busses/i2c-mxs.c                |   6 +-
 drivers/i2c/busses/i2c-nomadik.c            |  48 +++--------
 drivers/i2c/busses/i2c-npcm7xx.c            |   5 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c         |   3 +
 drivers/i2c/busses/i2c-ocores.c             |  70 +++++----------
 drivers/i2c/busses/i2c-octeon-platdrv.c     |   5 +-
 drivers/i2c/busses/i2c-omap.c               |   6 +-
 drivers/i2c/busses/i2c-opal.c               |   6 +-
 drivers/i2c/busses/i2c-owl.c                |  18 +---
 drivers/i2c/busses/i2c-pasemi-platform.c    |  25 ++----
 drivers/i2c/busses/i2c-pca-platform.c       |   6 +-
 drivers/i2c/busses/i2c-pnx.c                |   6 +-
 drivers/i2c/busses/i2c-powermac.c           |   6 +-
 drivers/i2c/busses/i2c-pxa.c                |   6 +-
 drivers/i2c/busses/i2c-qcom-cci.c           |   9 +-
 drivers/i2c/busses/i2c-qcom-geni.c          |   5 +-
 drivers/i2c/busses/i2c-qup.c                |   5 +-
 drivers/i2c/busses/i2c-rcar.c               |   6 +-
 drivers/i2c/busses/i2c-riic.c               |   6 +-
 drivers/i2c/busses/i2c-rk3x.c               |   6 +-
 drivers/i2c/busses/i2c-rzv2m.c              |  49 +++++++----
 drivers/i2c/busses/i2c-s3c2410.c            |   6 +-
 drivers/i2c/busses/i2c-scmi.c               |   6 +-
 drivers/i2c/busses/i2c-sh7760.c             |   9 +-
 drivers/i2c/busses/i2c-sh_mobile.c          |   5 +-
 drivers/i2c/busses/i2c-simtec.c             |   6 +-
 drivers/i2c/busses/i2c-st.c                 |   6 +-
 drivers/i2c/busses/i2c-stm32f4.c            |   6 +-
 drivers/i2c/busses/i2c-stm32f7.c            |   6 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c         |  23 ++---
 drivers/i2c/busses/i2c-synquacer.c          |   6 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c         |   6 +-
 drivers/i2c/busses/i2c-tegra.c              | 114 ++++++++++---------------
 drivers/i2c/busses/i2c-tiny-usb.c           |   4 +-
 drivers/i2c/busses/i2c-uniphier-f.c         |  27 ++----
 drivers/i2c/busses/i2c-uniphier.c           |  27 ++----
 drivers/i2c/busses/i2c-versatile.c          |   9 +-
 drivers/i2c/busses/i2c-viperboard.c         |   6 +-
 drivers/i2c/busses/i2c-wmt.c                |  10 +--
 drivers/i2c/busses/i2c-xgene-slimpro.c      |   6 +-
 drivers/i2c/busses/i2c-xiic.c               |  26 ++----
 drivers/i2c/busses/i2c-xlp9xx.c             |   6 +-
 drivers/i2c/busses/scx200_acb.c             |   6 +-
 drivers/i2c/i2c-core-base.c                 |  19 +++++
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c  |   5 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c       |   6 +-
 drivers/i2c/muxes/i2c-mux-gpio.c            |   6 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c           |   6 +-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c         |   5 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c         |   6 +-
 drivers/i2c/muxes/i2c-mux-reg.c             |   6 +-
 drivers/misc/eeprom/at24.c                  |   3 +-
 drivers/usb/typec/ucsi/psy.c                |  14 +++
 include/linux/i2c.h                         |   2 +
 103 files changed, 585 insertions(+), 727 deletions(-)

--umR+ez4sFrMUWuD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmShZX0ACgkQFA3kzBSg
KbYRSxAAjRfhQhpEoueWFGKyqQm5ARu4DD3xjSnxH0yQEeAAGQyEzgWx2ZrJv0C+
e/iAxkS1vpZcV/a7sdg3kATzpp4Ir4FFOm6G7wohr0f41FSPEyhovNjCJbBnf30b
W2xHtCxFT6PKmsxb1fh7TiX+NCvwmNm9jLJGtnZGHhBmxesDuK2JenbP9nnWLTXu
GZiM5YF4hStTLOH3DCQtB1MtKzNFGMSMvTzHqyY/wb81Y9RvxR2+OLKZNlhlgU25
n5m01/WArJF1y3CozwxPBwuMdZnVzGtLs0fDmi4KH6WZjkIxowyviVoZWMPjQXQf
ZZPHXJbrS31m6qsHnrZCj2DQoJ+dc6NyS613OPtJmrXTnIPCTzAo/13NK9N0WNKm
+gES6Zb2DZlXdN5yMA37c0DU8odNKOMVkKxipH1lAylwW4ot2ac2tZGvE1YJU1Wa
5LT61KYCTe5HNvGnMq+fvhQa8NQvrubG8XlwwCtHii0FCB+PFyCumj6q0qJ8X+x6
9WSOttZyP/+EHy7UUp/tVT+rTN8Qi4D2q1WZ2ZQWMX5mPpvczD7H0zXSBjDSkphd
jR0oyNT57HhBLcndmTsisKMPdH1UevBoMBbXVLXZwswZpluWxvJCG9noZqw2H9Nq
pmRmDPMLTfK5eHTalynhu4dD5yhOZ4VZtDRLfKPrmaeKTgpDFAk=
=Wue0
-----END PGP SIGNATURE-----

--umR+ez4sFrMUWuD2--
