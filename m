Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907BB394E3A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 May 2021 23:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhE2VRp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 May 2021 17:17:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229746AbhE2VRp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 May 2021 17:17:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A78D460FDC;
        Sat, 29 May 2021 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622322968;
        bh=Cfg4Gg+P2/XHAIOl8AWgKqZ6/6OaV2o8LcAJ5P6ayvM=;
        h=Date:From:To:Cc:Subject:From;
        b=B1oaCyGmfoH2Sa2A1V/7+VVhj9+7rxnCSa6NZQNUMRMsOV4EUtx+saui0V3XZLx5C
         zNYqnWwq83de/HuQKv8poRF+6BEq48exiaV+0WvqSDw9V8Q+lNhFcu3eG2wWlddg30
         3GVcvSNdArvd1AX7lLOT6Qde+KMYaugnNiM4gRJCdXduXnZvyCz17IOq7Sg3ulCrpN
         P+qdYEAfLKjAb35OVKA/WKwAfS1cEt2UqGCCajUQ6GyaLQFAiYD93MQ19DXAn/vUVM
         Emkn0efp6B2ut0hDJke2bGVrgLzbtHjG7Islc7GVJtLXhJYebzADevXrNPOKABAiMu
         iFwOXMRKpL3SQ==
Date:   Sat, 29 May 2021 23:15:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.13-rc4
Message-ID: <YLKvCNTvXTpPabHq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PYp+C+HSmgfWSXJr"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PYp+C+HSmgfWSXJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

this I2C pull request is a bit larger than usual at rc4 time. The reason
is due to Lee's work of fixing newly reported build warnings. The rest
is fixes as usual.

Please pull.

Thanks,

   Wolfram


The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 8aa0ae439966364da86fc6437375e32f2890c4c3:

  MAINTAINERS: adjust to removing i2c designware platform data (2021-05-28 16:48:48 +0200)

----------------------------------------------------------------
Chris Packham (4):
      dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
      powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c controllers
      powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P1010 i2c controllers
      i2c: mpc: implement erratum A-004447 workaround

Colin Ian King (1):
      i2c: qcom-geni: fix spelling mistake "unepxected" -> "unexpected"

Geert Uytterhoeven (3):
      i2c: icy: Remove unused variable new_fwnode in icy_probe()
      i2c: I2C_HISI should depend on ACPI
      i2c: sh_mobile: Use new clock calculation formulas for RZ/G2E

Jean Delvare (1):
      i2c: i801: Don't generate an interrupt on bus reset

Krzysztof Kozlowski (1):
      i2c: s3c2410: fix possible NULL pointer deref on read message after write

Lee Jones (10):
      i2c: busses: i2c-nomadik: Fix formatting issue pertaining to 'timeout'
      i2c: muxes: i2c-arb-gpio-challenge: Demote non-conformant kernel-doc headers
      i2c: busses: i2c-ali1563: File headers are not good candidates for kernel-doc
      i2c: busses: i2c-cadence: Fix incorrectly documented 'enum cdns_i2c_slave_mode'
      i2c: busses: i2c-designware-master: Fix misnaming of 'i2c_dw_init_master()'
      i2c: busses: i2c-eg20t: Fix 'bad line' issue and provide description for 'msgs' param
      i2c: busses: i2c-ocores: Place the expected function names into the documentation headers
      i2c: busses: i2c-pnx: Provide descriptions for 'alg_data' data structure
      i2c: busses: i2c-st: Fix copy/paste function misnaming issues
      i2c: busses: i2c-stm32f4: Remove incorrectly placed ' ' from function name

Lukas Bulwahn (1):
      MAINTAINERS: adjust to removing i2c designware platform data

Qii Wang (1):
      i2c: mediatek: Disable i2c start_en and clear intr_stat brfore reset


with much appreciated quality assurance from
----------------------------------------------------------------
Akash Asthana (1):
      (Rev.) i2c: qcom-geni: fix spelling mistake "unepxected" -> "unexpected"

Alain Volmat (2):
      (Rev.) i2c: busses: i2c-stm32f4: Remove incorrectly placed ' ' from function name
      (Rev.) i2c: busses: i2c-st: Fix copy/paste function misnaming issues

Andrew Lunn (1):
      (Rev.) i2c: busses: i2c-ocores: Place the expected function names into the documentation headers

Andy Shevchenko (1):
      (Rev.) MAINTAINERS: adjust to removing i2c designware platform data

Fabrizio Castro (1):
      (Rev.) i2c: sh_mobile: Use new clock calculation formulas for RZ/G2E

Jarkko Nikula (1):
      (Test) i2c: i801: Don't generate an interrupt on bus reset

Jean Delvare (1):
      (Rev.) i2c: busses: i2c-ali1563: File headers are not good candidates for kernel-doc

Linus Walleij (1):
      (Rev.) i2c: busses: i2c-nomadik: Fix formatting issue pertaining to 'timeout'

Max Staudt (1):
      (Rev.) i2c: icy: Remove unused variable new_fwnode in icy_probe()

Michal Simek (1):
      (Rev.) i2c: busses: i2c-cadence: Fix incorrectly documented 'enum cdns_i2c_slave_mode'

Peter Korsgaard (1):
      (Rev.) i2c: busses: i2c-ocores: Place the expected function names into the documentation headers

 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml |  7 ++
 MAINTAINERS                                        |  1 -
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi        |  8 +++
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi        | 16 +++++
 drivers/i2c/busses/Kconfig                         |  2 +-
 drivers/i2c/busses/i2c-ali1563.c                   |  2 +-
 drivers/i2c/busses/i2c-cadence.c                   |  2 +-
 drivers/i2c/busses/i2c-designware-master.c         |  2 +-
 drivers/i2c/busses/i2c-eg20t.c                     |  3 +-
 drivers/i2c/busses/i2c-i801.c                      |  6 +-
 drivers/i2c/busses/i2c-icy.c                       |  1 -
 drivers/i2c/busses/i2c-mpc.c                       | 81 +++++++++++++++++++++-
 drivers/i2c/busses/i2c-mt65xx.c                    |  5 ++
 drivers/i2c/busses/i2c-nomadik.c                   |  2 +-
 drivers/i2c/busses/i2c-ocores.c                    |  8 +--
 drivers/i2c/busses/i2c-pnx.c                       |  8 +--
 drivers/i2c/busses/i2c-qcom-geni.c                 |  2 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |  3 +
 drivers/i2c/busses/i2c-sh_mobile.c                 |  2 +-
 drivers/i2c/busses/i2c-st.c                        |  4 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |  2 +-
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c         |  4 +-
 22 files changed, 142 insertions(+), 29 deletions(-)

--PYp+C+HSmgfWSXJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCyrwMACgkQFA3kzBSg
Kba+7A/+OTh/9N1wFQfSwCLyjemFLlUz2dY61uaIcrsFbvW8Cmg2XIGDj4EJm2yW
TkPAMcZf1RweNlVFjbAAUWLp7oWvRx/K5ydKmAGHpEk1ORzeqgcO/whu57KKdCtY
VQcyr7QOg/JCs42HQjbGFhDZjVpI1N/kVM3M/Q7gPPFhebTbx+nEQAgwl8QkPtHo
KhlOtkus2zDlE4MkKxY8WR2BONp9hvjSGceX7v8N21XASasUiRlLCgqD9TbG+YCD
/3VCWMchPNcthnKDOwRdP8B10obtR9DcC+Rmo+bfARjxlGSYxqyKLh/Q8oKFaqzu
d98z+HFYLyUU0CARZ+N6XUbv8un8lRQk7BGYJxOT728VYfEg7NAQb0i89LJjhRzZ
oRaev/6TbBGCLGG40AWD29sO3Aq13CNfhbF1nmbFk2wElZqWf84eSSe/Lu0mqpYB
0Gy2Qhijik3SqHZBlUmlJmao9SyqDmBMBsm2jY+chhh6/Vem2cC4HGJGik32r+8i
mqCbUPTWjGiac/gkzBPMe52IU/1lskWDUhcpKDIOJhu31foW6gAqke8++rKpoJPe
YHkW5/Qq0Cdz5Q0B5hI2l8AjkBLYPtEhbtSV3Z7U051ZpDeCEXXMhiimdT9J6fCu
tou/yRc++Dl+qvCpYsprK7jdQ7UVKfGi5UohEaD62N4/mKcax/s=
=OkUB
-----END PGP SIGNATURE-----

--PYp+C+HSmgfWSXJr--
