Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0E8591B90
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Aug 2022 17:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239828AbiHMPmo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Aug 2022 11:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239835AbiHMPmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Aug 2022 11:42:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CBF2B1A9;
        Sat, 13 Aug 2022 08:42:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 512BB60ED5;
        Sat, 13 Aug 2022 15:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F61C433C1;
        Sat, 13 Aug 2022 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660405359;
        bh=BbzZODyb1pf8b8cbccDz5DrfY4BrAZboveA10mzxo/0=;
        h=Date:From:To:Cc:Subject:From;
        b=l/LWI2H4QEtJLoOeSCUuGIcrVIXsaMQrFXH1IBhSs/uelt1JLJWqcwWRLZZzNuU0L
         +PlB9biNuAiRF7LPPKUoTyUWuL+SOhWsGCZswMc3m55b6W4WLEbfgKcWyA7UDH4zIY
         oWDNFwY8xhsZaURbyBTRSjFSFbPiYpdNB6IPpOYE3Vr2dOt7gB+gIWv3GX6iSGSY4T
         ETYnDSWApFqVNeOGZoqmmIfDilrdkEz1E6cBMcBrrYn+ajsfmJESkpG4uM45Mo4rVl
         P4LmnrZwjJMSZuLUGfwp3PFC/6Cml4Mk0nbkU2efntPVU0srp8Fxcqn/2GPqn6f71g
         nuqbB2NDl8sKA==
Date:   Sat, 13 Aug 2022 17:42:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-5.20-part2
Message-ID: <YvfGY2qnl2YXrUgX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4NrrYtAf6bYih70P"
Content-Disposition: inline
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4NrrYtAf6bYih70P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ffcf9c5700e49c0aee42dcba9a12ba21338e8136:

  x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments (2022-08-10 18:30:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.20-part2

for you to fetch changes up to fe99b819487dba848cddd3d4bf4beb8e653d7e9c:

  docs: i2c: i2c-sysfs: fix hyperlinks (2022-08-11 23:25:05 +0200)

----------------------------------------------------------------
* two driver fixes for issues introduced this cycle
* one trivial driver improvement regarding ACPI
* more DTS conversion and additions
* documentation updates
* subsystem-wide move from strlcpy to strscpy

----------------------------------------------------------------
Chris Pringle (1):
      i2c: kempld: Support ACPI I2C device declaration

Conor Dooley (1):
      i2c: microchip-corei2c: fix erroneous late ack send

Kewei Xu (2):
      dt-bindings: i2c: update bindings for mt8188 soc
      i2c: mediatek: add i2c compatible for MT8188

Krzysztof Kozlowski (1):
      dt-bindings: i2c: qcom,i2c-cci: convert to dtschema

Luca Ceresoli (7):
      docs: i2c: i2c-protocol: update introductory paragraph
      docs: i2c: i2c-protocol,smbus-protocol: remove nonsense words
      docs: i2c: i2c-protocol: remove unused legend items
      docs: i2c: smbus-protocol: improve DataLow/DataHigh definition
      docs: i2c: instantiating-devices: add syntax coloring to dts and C blocks
      docs: i2c: i2c-sysfs: improve wording
      docs: i2c: i2c-sysfs: fix hyperlinks

Robin Reckmann (1):
      i2c: qcom-geni: Fix GPI DMA buffer sync-back

Wolfram Sang (2):
      i2c: move drivers from strlcpy to strscpy
      i2c: move core from strlcpy to strscpy


with much appreciated quality assurance from
----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      (Rev.) i2c: mediatek: add i2c compatible for MT8188

Bagas Sanjaya (1):
      (Rev.) docs: i2c: smbus-protocol: improve DataLow/DataHigh definition

Caleb Connolly (1):
      (Test) i2c: qcom-geni: Fix GPI DMA buffer sync-back

Konrad Dybcio (1):
      (Rev.) i2c: qcom-geni: Fix GPI DMA buffer sync-back

Lewis Hanly (1):
      (Test) i2c: microchip-corei2c: fix erroneous late ack send

Luca Weiss (1):
      (Test) i2c: qcom-geni: Fix GPI DMA buffer sync-back

Matthias Brugger (1):
      (Rev.) dt-bindings: i2c: update bindings for mt8188 soc

Qii Wang (2):
      (Rev.) i2c: mediatek: add i2c compatible for MT8188
      (Rev.) dt-bindings: i2c: update bindings for mt8188 soc

Rob Herring (1):
      (Rev.) dt-bindings: i2c: qcom,i2c-cci: convert to dtschema

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |   1 +
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |  96 --------
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 242 +++++++++++++++++++++
 Documentation/i2c/i2c-protocol.rst                 |  11 +-
 Documentation/i2c/i2c-sysfs.rst                    |  24 +-
 Documentation/i2c/instantiating-devices.rst        |  16 +-
 Documentation/i2c/smbus-protocol.rst               |   6 +-
 MAINTAINERS                                        |   2 +-
 drivers/i2c/busses/i2c-altera.c                    |   2 +-
 drivers/i2c/busses/i2c-aspeed.c                    |   2 +-
 drivers/i2c/busses/i2c-au1550.c                    |   2 +-
 drivers/i2c/busses/i2c-axxia.c                     |   2 +-
 drivers/i2c/busses/i2c-bcm-kona.c                  |   2 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |   2 +-
 drivers/i2c/busses/i2c-cbus-gpio.c                 |   2 +-
 drivers/i2c/busses/i2c-cht-wc.c                    |   2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |   2 +-
 drivers/i2c/busses/i2c-davinci.c                   |   2 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   2 +-
 drivers/i2c/busses/i2c-eg20t.c                     |   2 +-
 drivers/i2c/busses/i2c-emev2.c                     |   2 +-
 drivers/i2c/busses/i2c-exynos5.c                   |   2 +-
 drivers/i2c/busses/i2c-gpio.c                      |   2 +-
 drivers/i2c/busses/i2c-highlander.c                |   2 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   2 +-
 drivers/i2c/busses/i2c-i801.c                      |   4 +-
 drivers/i2c/busses/i2c-ibm_iic.c                   |   2 +-
 drivers/i2c/busses/i2c-icy.c                       |   2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |   2 +-
 drivers/i2c/busses/i2c-kempld.c                    |   1 +
 drivers/i2c/busses/i2c-lpc2k.c                     |   2 +-
 drivers/i2c/busses/i2c-meson.c                     |   2 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c         |   2 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  45 +++-
 drivers/i2c/busses/i2c-mt7621.c                    |   2 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |   2 +-
 drivers/i2c/busses/i2c-mxs.c                       |   2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |   2 +-
 drivers/i2c/busses/i2c-omap.c                      |   2 +-
 drivers/i2c/busses/i2c-opal.c                      |   4 +-
 drivers/i2c/busses/i2c-parport.c                   |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   7 +-
 drivers/i2c/busses/i2c-qup.c                       |   2 +-
 drivers/i2c/busses/i2c-rcar.c                      |   2 +-
 drivers/i2c/busses/i2c-riic.c                      |   2 +-
 drivers/i2c/busses/i2c-rk3x.c                      |   2 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   2 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   2 +-
 drivers/i2c/busses/i2c-simtec.c                    |   2 +-
 drivers/i2c/busses/i2c-taos-evm.c                  |   2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c                |   2 +-
 drivers/i2c/busses/i2c-tegra.c                     |   2 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |   2 +-
 drivers/i2c/busses/i2c-uniphier.c                  |   2 +-
 drivers/i2c/busses/i2c-versatile.c                 |   2 +-
 drivers/i2c/busses/i2c-wmt.c                       |   2 +-
 drivers/i2c/i2c-core-base.c                        |   2 +-
 drivers/i2c/i2c-smbus.c                            |   2 +-
 59 files changed, 370 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml

--4NrrYtAf6bYih70P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL3xmMACgkQFA3kzBSg
KbZ7Xw//c0/XgVl2+BpduIx49HDGc29u0QWc5i3eaj5PLLEYJfIfZglpEkhVaftA
+O8CLC/y+d7U+XUEzlNuD3xNHqIPR9dlvgH09vbBzAXmdC4gedOjQCLst7lT3gmI
0OQMP9gUIkjAEZ8LwVXQr1vr1tspacioxVRTAPhkhrGrxGtWgnB1o4YiuZlXMMcB
pB6GbX/w+vUa0KXzbkT0Ynw1zpbi1BLSgsCyFFBL47OULNiUZ+yPd3CiHHp9aQBJ
Tv4pfD84QFolhpCyD1wW3BE3HvvDVJOzf9Dxe+CMpBRv5GL7o/DTi6HaziCzSZy9
3exvaWFNNm36BJrmu3hsYr9UWdjL3jTTNGzJPN5kzzL0kVRk1k8yWmGfcIWqXaXd
UIb3c32Z4yNZ1EFjqglxs3qDd9SMDcBoM+M1ecLcxDdYYFd9mC//ZLu0Yfx4qVDV
M2RrVwIQ7AAaEILDzzrlJ0j9KU9sSrgjKCWqJ3oYEgmYwAKH08J8hhSW10guS7ca
wRPBxdEvQMIccgP2j9TDW2Iwijc1Vz6Y2O9u7EbnyfpIDpjyVan2iyfx+KY74W7a
ba1oI3qrS0gLbdc/yneXYLUhaK0w6o+Nrsv6uz7baBxkurDLZGYRKjeyF9t5e3Qy
a2VzjIl1cK7oAXhDWPZSngBQ92F1a0tdFB1u/UpCePcMbZrLNOE=
=Vtqy
-----END PGP SIGNATURE-----

--4NrrYtAf6bYih70P--
