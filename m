Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D6E2DA2E0
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 22:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732575AbgLNVyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 16:54:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727624AbgLNVyW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Dec 2020 16:54:22 -0500
Date:   Mon, 14 Dec 2020 22:53:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607982821;
        bh=e7/nWuQN99M/Q3cVOFxplYir6ndBIL+r4to0u3mrNa0=;
        h=From:To:Cc:Subject:From;
        b=CyjfsW2CAEjg18P4zJ9TiRinI6CZI4ChMWI1wbzejk2Ir8UtzXZNdpCZyTLtbJ94R
         YHVPlgukfsnHdOguK+2V5c4Iub0OIjwioLt1zlovaaUA7r0Iny4xmfDuaC8MLcxFN2
         8WlmHpDgVch5oJiRuM01Z2hUlBzSpAHqK5mbAEo4dPWJxcJfmzWueLzmwdbXY0o8Pf
         PGawddrO4bpMsBL/a5v0g6d8GvzHrELcvdvgkE8WXQEN9gzsH9gNFlBi2DXP5WgHhJ
         puzxKWCGMLxDZ/VkxpSC4zR8Vy5CJEIvG0clPuUCVDYjvtP3RK7A5gVLExez62XFiO
         iwrQ2pyt7gYtA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.11
Message-ID: <20201214215335.GA4651@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

the pull request for I2C is a bit smaller this time with mostly usual
driver updates. Slave support for imx stands out a little.

Please pull.

Thanks,

   Wolfram


The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.11

for you to fetch changes up to 4e970a0ada5299d017a4263074f725227c2d2852:

  i2c: remove check that can never be true (2020-12-11 15:43:49 +0100)

----------------------------------------------------------------
Alexandre Belloni (1):
      i2c: at91: remove legacy DMA left overs

Andy Shevchenko (2):
      i2c: designware: Switch header to use BIT() and GENMASK()
      i2c: designware: Make register offsets all of the same width

Aswath Govindraju (1):
      dt-bindings: i2c: Add compatible string for AM64 SoC

Biwen Li (1):
      i2c: imx: support slave mode for imx I2C driver

Bjorn Andersson (1):
      Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C63=
0"

Codrin Ciubotariu (1):
      i2c: pxa: move to generic GPIO recovery

Cristian Ciocaltea (4):
      i2c: owl: Add support for atomic transfers
      i2c: owl: Enable asynchronous probing
      dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
      i2c: owl: Add compatible for the Actions Semi S500 I2C controller

Douglas Anderson (3):
      soc: qcom: geni: More properly switch to DMA mode
      Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
      soc: qcom: geni: Optimize/comment select fifo/dma mode

Fabio Estevam (2):
      i2c: imx: Remove unused .id_table support
      i2c: mxs: Remove unneeded platform_device_id

Geert Uytterhoeven (1):
      i2c: sh_mobile: Mark adapter suspended during suspend

Khalil Blaiech (1):
      dt-bindings: i2c: mellanox,i2c-mlxbf: convert txt to YAML schema

Mario Alejandro Posso Escobar (1):
      i2c: ismt: Adding support for I2C_SMBUS_BLOCK_PROC_CALL

Mark Tomlinson (1):
      i2c: mv64xxx: Add bus error recovery

Martin Kaiser (3):
      i2c: exynos5: remove duplicate error message
      i2c: exynos5: fix platform_get_irq error handling
      i2c: exynos5: don't check for irq 0

Sagar Shrikant Kadam (1):
      i2c: ocores: fix polling mode workaround on FU540-C000 SoC

Stefan L=C3=A4sser (1):
      i2c: ocores: Avoid false-positive error log message.

Uwe Kleine-K=C3=B6nig (3):
      i2c: pca-platform: drop two members from driver data that are assigne=
d to only
      i2c: Warn when device removing fails
      i2c: remove check that can never be true

Vaibhav Gupta (1):
      i2c: nvidia-gpu: drop empty stub for runtime pm

Wolfram Sang (2):
      Merge tag '20201013212531.428538-1-dianders@chromium.org' of https://=
git.kernel.org/.../qcom/linux into i2c/for-5.11
      Merge branch 'i2c/for-current' into i2c/for-5.11

Yash Shah (1):
      dt-bindings: i2c: Update DT binding docs to support SiFive FU740 SoC


with much appreciated quality assurance from
----------------------------------------------------------------
Akash Asthana (3):
      (Rev.) Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo Y=
oga C630"
      (Rev.) Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
      (Rev.) soc: qcom: geni: More properly switch to DMA mode

Andrew Lunn (1):
      (Rev.) i2c: ocores: Avoid false-positive error log message.

Codrin Ciubotariu (1):
      (Rev.) i2c: at91: remove legacy DMA left overs

Dmitry Baryshkov (2):
      (Test) Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
      (Test) soc: qcom: geni: More properly switch to DMA mode

Jarkko Nikula (1):
      (Rev.) i2c: nvidia-gpu: drop empty stub for runtime pm

Krzysztof Kozlowski (3):
      (Rev.) i2c: exynos5: don't check for irq 0
      (Rev.) i2c: exynos5: fix platform_get_irq error handling
      (Rev.) i2c: exynos5: remove duplicate error message

Manivannan Sadhasivam (4):
      (Rev.) i2c: owl: Add compatible for the Actions Semi S500 I2C control=
ler
      (Rev.) i2c: owl: Add compatible for the Actions Semi S500 I2C control=
ler
      (Rev.) i2c: owl: Enable asynchronous probing
      (Rev.) i2c: owl: Add support for atomic transfers

Peter Korsgaard (1):
      (Rev.) i2c: ocores: Avoid false-positive error log message.

Rob Herring (3):
      (Rev.) dt-bindings: i2c: Update DT binding docs to support SiFive FU7=
40 SoC
      (Rev.) dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a s=
chema
      (Rev.) dt-bindings: i2c: mellanox,i2c-mlxbf: convert txt to YAML sche=
ma

Steev Klimaszewski (1):
      (Test) Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo Y=
oga C630"

Stephen Boyd (2):
      (Rev.) Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
      (Rev.) soc: qcom: geni: More properly switch to DMA mode

 .../devicetree/bindings/i2c/i2c-ocores.txt         |   8 +-
 Documentation/devicetree/bindings/i2c/i2c-omap.txt |   1 +
 Documentation/devicetree/bindings/i2c/i2c-owl.txt  |  29 ---
 Documentation/devicetree/bindings/i2c/i2c-owl.yaml |  62 ++++++
 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |  42 ----
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml           |  78 +++++++
 MAINTAINERS                                        |   3 +-
 drivers/i2c/busses/Kconfig                         |   1 +
 drivers/i2c/busses/i2c-at91-master.c               |   1 -
 drivers/i2c/busses/i2c-at91.h                      |   2 -
 drivers/i2c/busses/i2c-designware-core.h           |  98 ++++-----
 drivers/i2c/busses/i2c-exynos5.c                   |   5 +-
 drivers/i2c/busses/i2c-imx.c                       | 239 +++++++++++++++++=
----
 drivers/i2c/busses/i2c-ismt.c                      |  19 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |  29 ++-
 drivers/i2c/busses/i2c-mxs.c                       |  22 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |  10 +-
 drivers/i2c/busses/i2c-ocores.c                    |  25 ++-
 drivers/i2c/busses/i2c-owl.c                       |  75 +++++--
 drivers/i2c/busses/i2c-pca-platform.c              |   4 -
 drivers/i2c/busses/i2c-pxa.c                       |  76 +------
 drivers/i2c/busses/i2c-qcom-geni.c                 |  18 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |  28 +++
 drivers/i2c/i2c-core-base.c                        |  14 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  55 +++--
 25 files changed, 604 insertions(+), 340 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.yaml

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/X3toACgkQFA3kzBSg
KbavVRAAqRIueaBZtcE1a98L39pGKW14iIKe078dhIMgJf3soeLtGpinFDr4HhHW
ipndEaeGP2LCU1pumJh6jjzGADVJNDNeVKkScreg59tKkw0QHLsZDwZTgKoHciH9
EPGVQqn2t/D51Uq0Z9zLV7RRPHSJVEyjm1r/pKgBcK2g1LdbPqgTzmh7ZK8o/x0P
eQ434theFhg/gmhARJqrqWw5+go7VFrhzwRAQFzHFeY0o6H0ZeaneWak8Niu0br6
NSIMiyy1CKjk1XvsNbGY1345tAw2QmqrYVv5ldv23x31ICi9LufwqJT97jI5RwjM
NMQ5W95br2+5iFYxuDxoWvqMGuf+GrB7NrRjOy/vWAjJLgCsl4Gr58a1aujDEbDT
/U08184cE0KW36y9IclWeGEr/C8kk07VHJDCGYkjjOaA6R1KjFdFvKkUuNvb9IbC
/FeuILd1ZqSncbcjtyLZmGvibWA7bH1DIwERc7dFQ4IM8iMqZUkASjlpHMXEJaZI
AQN6G/PMmC9TUl/yqHR8XZlLHVviwOZ0moj73W1JpCkMgBeXHuRAbj6lJOYBkW3K
Qlq+iDISeAABILQ1qEKER9KUrL45TariQ2V953w0ogdtEO8P52NhY5zQ+bosqZRZ
Vc/oVAZ9343QUOl/TocIeINWSAZzpGanu30mEli3YUQ5vtvZ7sQ=
=esms
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
