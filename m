Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430B736F0B4
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 22:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhD2Tvv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 15:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233129AbhD2Tvv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Apr 2021 15:51:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0846613C8;
        Thu, 29 Apr 2021 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619725864;
        bh=bAt7VfIdqePl6apCunMB1a+htbWEWJEXRtLQgsKDA9A=;
        h=Date:From:To:Cc:Subject:From;
        b=DJTyYYiokW+53yriiZtI3K288c6UuPm0Q2rZ6FmpUMZ0H9eVBd7yHC6Zr6KbcQaU8
         blelyD+EEUT3LiZcg6NCnR4tdXCkzPXWIKmTHw5Fa7esDhItiCtaou5b8JX5FQmUkG
         CgT3KK+HM43J/We6FV/ozhkzOK+p/e6j21vEcFa8BoLMdmunsYJbPanRWiTWlc98Ml
         8eL92GoCz4y+XFL1r2HB07evozkWot8OaKXeREOwk93N8WfDArXE6A/sL7gVJ07lNn
         qsDRmbwwAt3iakoiDLf6trNQ5iukt0U4orygVT3dO3VI6f8HQhzwjP2I3t2bt0M0Ei
         xmA7rbMl8od0w==
Date:   Thu, 29 Apr 2021 21:50:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.13
Message-ID: <20210429195058.GA3179@kunai>
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

I2C has for this merge window:

* new drivers for Silicon Labs CP2615 and the HiSilicon I2C unit
* bigger refactoring for the MPC driver
* support for full software nodes; no need to work around with only
  properties anymore
* we now have 'devm_i2c_add_adapter', too
* sub-system wide fixes for the RPM refcounting problem which often
  caused a leak when an error was encountered during probe
* the rest is usual driver updates and improvements

Please pull.

Thanks,

   Wolfram


The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.13

for you to fetch changes up to a80f24945fcfdff31bdf04837145e56570741a67:

  i2c: mediatek: Use scl_int_delay_ns to compensate clock-stretching (2021-=
04-17 22:07:25 +0200)

----------------------------------------------------------------
Alain Volmat (4):
      i2c: stm32f7: support DT binding i2c-analog-filter
      i2c: stm32f7: add support for DNF i2c-digital-filter binding
      i2c: stm32f7: indicate the address being accessed on errors
      i2c: stm32f7: avoid ifdef CONFIG_PM_SLEEP for pm callbacks

Andy Shevchenko (6):
      i2c: drivers: Use generic definitions for bus frequencies (part 2)
      i2c: designware: Switch over to i2c_freq_mode_string()
      i2c: mpc: Use devm_clk_get_optional()
      i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
      i2c: mpc: Use device_get_match_data() helper
      i2c: mpc: Drop duplicate message from devm_platform_ioremap_resource()

Bence Cs=C3=B3k=C3=A1s (2):
      i2c: Add I2C_AQ_NO_REP_START adapter quirk
      i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Br=
idge

Bixuan Cui (1):
      i2c: sprd: Add missing MODULE_DEVICE_TABLE

Chris Packham (9):
      dt-bindings: i2c-mpc: Document interrupt property as required
      dt-bindings: i2c: convert i2c-mpc to json-schema
      i2c: mpc: Make use of i2c_recover_bus()
      i2c: mpc: make interrupt mandatory and remove polling code
      i2c: mpc: use device managed APIs
      i2c: mpc: Remove redundant NULL check
      MAINTAINERS: Add Chris Packham as FREESCALE MPC I2C maintainer
      i2c: mpc: Interrupt driven transfer
      i2c: mpc: Update license and copyright

Dmitry Osipenko (1):
      i2c: Make i2c_recover_bus() to return -EBUSY if bus recovery unimplem=
ented

Dmitry Torokhov (1):
      i2c: ensure timely release of driver-allocated resources

Heikki Krogerus (12):
      i2c: Add support for software nodes
      ARM: davinci: Constify the software nodes
      ARM: omap1: osk: Constify the software node
      ARM: pxa: stargate2: Constify the software node
      ARM: s3c: mini2440: Constify the software node
      platform/x86: intel_cht_int33fe_microb: Constify the software node
      i2c: cht-wc: Constify the software node
      i2c: nvidia-gpu: Constify the software node
      i2c: icy: Constify the software node
      platform/chrome: chromeos_laptop - Prepare complete software nodes
      Input: elantech - Prepare a complete software node for the device
      i2c: Remove support for dangling device properties

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Alder Lake PCH-M

Krzysztof Kozlowski (1):
      i2c: s3c2410: simplify getting of_device_id match data

Qii Wang (3):
      i2c: mediatek: Fix send master code at more than 1MHz
      i2c: mediatek: Fix wrong dma sync flag
      i2c: mediatek: Use scl_int_delay_ns to compensate clock-stretching

Qinglang Miao (8):
      i2c: cadence: fix reference leak when pm_runtime_get_sync fails
      i2c: img-scb: fix reference leak when pm_runtime_get_sync fails
      i2c: imx-lpi2c: fix reference leak when pm_runtime_get_sync fails
      i2c: imx: fix reference leak when pm_runtime_get_sync fails
      i2c: omap: fix reference leak when pm_runtime_get_sync fails
      i2c: sprd: fix reference leak when pm_runtime_get_sync fails
      i2c: stm32f7: fix reference leak when pm_runtime_get_sync fails
      i2c: xiic: fix reference leak when pm_runtime_get_sync fails

Rafael J. Wysocki (1):
      i2c: i2c-scmi: Drop unused ACPI_MODULE_NAME definition

Sanket Goswami (1):
      i2c: designware: Add driver support for AMD NAVI GPU

Sergey Shtylyov (7):
      i2c: cadence: add IRQ check
      i2c: emev2: add IRQ check
      i2c: jz4780: add IRQ check
      i2c: mlxbf: add IRQ check
      i2c: rcar: add IRQ check
      i2c: sh7760: add IRQ check
      i2c: sh7760: fix IRQ error path

Thierry Reding (1):
      i2c: tegra-bpmp: Implement better error handling

Tian Tao (6):
      i2c: stm32f7: Remove useless error message
      i2c: remove unused 'version.h' include in drivers
      i2c: amd8111: Fix coding style issues
      i2c: iop3xx: Fix coding style issues
      i2c: nomadik: Fix space errors
      i2c: core: Fix spacing error by checkpatch

Ulrich Hecht (1):
      i2c: rcar: implement atomic transfers

Wei Yongjun (2):
      i2c: designware: Fix return value check in navi_amd_register_client()
      i2c: mpc: drop release for resource allocated with devm_*

Wolfram Sang (5):
      i2c: powermac: remove uncertainty about SMBUS_BLOCK transfers
      i2c: bail out early when RDWR parameters are wrong
      i2c: tegra-bpmp: don't modify input variable in xlate_flags
      i2c: tegra-bpmp: make some functions void
      Merge branch 'i2c/software-nodes' into i2c/for-5.13

Ye Weihua (1):
      i2c: imx: Fix PM reference leak in i2c_imx_reg_slave()

Yicong Yang (4):
      i2c: core: simplify devm_i2c_new_dummy_device()
      i2c: core: add managed function for adding i2c adapters
      i2c: core: add api to provide frequency mode strings
      i2c: add support for HiSilicon I2C controller


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (1):
      (Rev.) i2c: stm32f7: Remove useless error message

Andy Shevchenko (5):
      (Rev.) i2c: add support for HiSilicon I2C controller
      (Rev.) i2c: core: add api to provide frequency mode strings
      (Rev.) i2c: core: add managed function for adding i2c adapters
      (Rev.) i2c: core: simplify devm_i2c_new_dummy_device()
      (Rev.) i2c: designware: Add driver support for AMD NAVI GPU

Baolin Wang (1):
      (Rev.) i2c: sprd: Add missing MODULE_DEVICE_TABLE

Chris Packham (5):
      (Rev.) i2c: mpc: Drop duplicate message from devm_platform_ioremap_re=
source()
      (Rev.) i2c: mpc: Use device_get_match_data() helper
      (Rev.) i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
      (Rev.) i2c: mpc: Use devm_clk_get_optional()
      (Rev.) i2c: mpc: drop release for resource allocated with devm_*

Dmitry Osipenko (2):
      (Rev.) i2c: add support for HiSilicon I2C controller
      (Rev.) i2c: core: add managed function for adding i2c adapters

Geert Uytterhoeven (2):
      (Rev.) i2c: rcar: add IRQ check
      (Rev.) i2c: rcar: implement atomic transfers

Grygorii Strashko (1):
      (Rev.) i2c: omap: fix reference leak when pm_runtime_get_sync fails

Hans de Goede (2):
      (Rev.) i2c: cht-wc: Constify the software node
      (Rev.) platform/x86: intel_cht_int33fe_microb: Constify the software =
node

Jarkko Nikula (2):
      (Test) i2c: core: add api to provide frequency mode strings
      (Rev.) i2c: core: add api to provide frequency mode strings

Jeff LaBundy (1):
      (Test) i2c: ensure timely release of driver-allocated resources

Max Staudt (1):
      (Rev.) i2c: icy: Constify the software node

Oleksij Rempel (1):
      (Rev.) i2c: imx: fix reference leak when pm_runtime_get_sync fails

Pierre-Yves MORDRET (3):
      (Rev.) i2c: stm32f7: avoid ifdef CONFIG_PM_SLEEP for pm callbacks
      (Rev.) i2c: stm32f7: add support for DNF i2c-digital-filter binding
      (Rev.) i2c: stm32f7: support DT binding i2c-analog-filter

Rob Herring (2):
      (Rev.) dt-bindings: i2c: convert i2c-mpc to json-schema
      (Rev.) dt-bindings: i2c-mpc: Document interrupt property as required

Robert Foss (1):
      (Rev.) i2c: drivers: Use generic definitions for bus frequencies (par=
t 2)

Shyam Sundar S K (1):
      (Rev.) i2c: designware: Add driver support for AMD NAVI GPU

Sylwester Nawrocki (1):
      (Rev.) i2c: s3c2410: simplify getting of_device_id match data

Thierry Reding (2):
      (Test) i2c: tegra-bpmp: make some functions void
      (Test) i2c: tegra-bpmp: don't modify input variable in xlate_flags

Vignesh Raghavendra (1):
      (Rev.) i2c: omap: fix reference leak when pm_runtime_get_sync fails

syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com (1):
      (Test) i2c: bail out early when RDWR parameters are wrong

 Documentation/devicetree/bindings/i2c/i2c-mpc.txt  |  62 ---
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml |  91 ++++
 MAINTAINERS                                        |  19 +
 arch/arm/mach-davinci/board-da830-evm.c            |   6 +-
 arch/arm/mach-davinci/board-dm365-evm.c            |   6 +-
 arch/arm/mach-davinci/board-dm644x-evm.c           |   6 +-
 arch/arm/mach-davinci/board-dm646x-evm.c           |   6 +-
 arch/arm/mach-davinci/board-mityomapl138.c         |   6 +-
 arch/arm/mach-davinci/board-sffsdr.c               |   6 +-
 arch/arm/mach-omap1/board-osk.c                    |   6 +-
 arch/arm/mach-pxa/stargate2.c                      |   6 +-
 arch/arm/mach-s3c/mach-mini2440.c                  |   6 +-
 drivers/i2c/busses/Kconfig                         |  20 +
 drivers/i2c/busses/Makefile                        |   2 +
 drivers/i2c/busses/i2c-amd8111.c                   | 268 +++++-----
 drivers/i2c/busses/i2c-brcmstb.c                   |   1 -
 drivers/i2c/busses/i2c-cadence.c                   |   9 +-
 drivers/i2c/busses/i2c-cht-wc.c                    |   6 +-
 drivers/i2c/busses/i2c-cp2615.c                    | 330 ++++++++++++
 drivers/i2c/busses/i2c-designware-common.c         |   3 +
 drivers/i2c/busses/i2c-designware-core.h           |   8 +
 drivers/i2c/busses/i2c-designware-master.c         | 155 +++++-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  61 +++
 drivers/i2c/busses/i2c-emev2.c                     |   5 +-
 drivers/i2c/busses/i2c-hisi.c                      | 504 ++++++++++++++++++
 drivers/i2c/busses/i2c-i801.c                      |   4 +
 drivers/i2c/busses/i2c-icy.c                       |  32 +-
 drivers/i2c/busses/i2c-img-scb.c                   |   4 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |   2 +-
 drivers/i2c/busses/i2c-imx.c                       |   6 +-
 drivers/i2c/busses/i2c-iop3xx.c                    |  28 +-
 drivers/i2c/busses/i2c-jz4780.c                    |   5 +-
 drivers/i2c/busses/i2c-mlxbf.c                     |  16 +-
 drivers/i2c/busses/i2c-mpc.c                       | 579 +++++++++++------=
----
 drivers/i2c/busses/i2c-mt65xx.c                    |  17 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   4 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |   6 +-
 drivers/i2c/busses/i2c-omap.c                      |   8 +-
 drivers/i2c/busses/i2c-powermac.c                  |   5 -
 drivers/i2c/busses/i2c-qcom-cci.c                  |   4 +-
 drivers/i2c/busses/i2c-rcar.c                      |  89 +++-
 drivers/i2c/busses/i2c-s3c2410.c                   |   9 +-
 drivers/i2c/busses/i2c-scmi.c                      |   2 -
 drivers/i2c/busses/i2c-sh7760.c                    |   5 +-
 drivers/i2c/busses/i2c-sprd.c                      |   5 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |  82 +--
 drivers/i2c/busses/i2c-tegra-bpmp.c                |  79 ++-
 drivers/i2c/busses/i2c-xgene-slimpro.c             |   1 -
 drivers/i2c/busses/i2c-xiic.c                      |   4 +-
 drivers/i2c/i2c-boardinfo.c                        |  11 -
 drivers/i2c/i2c-core-base.c                        | 114 ++--
 drivers/i2c/i2c-dev.c                              |   9 +-
 drivers/input/mouse/elantech.c                     |   6 +-
 drivers/platform/chrome/chromeos_laptop.c          | 100 ++--
 drivers/platform/x86/intel_cht_int33fe_microb.c    |   6 +-
 include/linux/i2c.h                                |  13 +-
 56 files changed, 2082 insertions(+), 771 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
 create mode 100644 drivers/i2c/busses/i2c-cp2615.c
 create mode 100644 drivers/i2c/busses/i2c-hisi.c

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCLDh0ACgkQFA3kzBSg
KbbsZA//WxInBWLld4+JYTlVAEREhv412tNwwvuKFZWlVhn0PdAauDUmEaYNhzVI
heD/1+FuevUZLq1AR9T4DHiJXlSoyU5TdfR5xhG74xDvUHmXQpjjWPlvlqgMzcDa
pZ9hKuov6W4EhOCcS9XelRl7E4QESLg4UMb4mFcZNX8kXLxIxzsbTU4tqDc0zns3
Gt0Twq+osAMNZQN0HYADxBCqpkrPKYz9vsYhCEdZkWamvBRYcbWskXYFiKy0HNER
nhziuo/+Pdx3E/1E2AxX2vkyN5jPH9LmxPa3x/0FUAwLhhkX6gFEpsajsMXHjxEV
2l2NFrwA95RDXPk4a2zsW6qLv+wSWuPH8f7EymnSOTgxknhtjYj+paS59W7MPrSU
Wa+K6+FJEniBZAqu6b5M3SP8er8koIpdLaaXcOSkjp1paI+Rrad0wCT8bzrdkKZu
oY/UBeoj++JChAt0aSq0FlSJCnHVyi/pXuPN01QWTH5ElR/skrLG7OpVUC7PGJkZ
AlV0gF29xkWZXAz3T5ap8DaDiS0T+XeocyB94LQMByyPLGjO7ubVyfaxI4jY4sX1
ZGnxNXdKlWkI/NwYDxKMc7S4ztqitDDiZx3q8jCDixZViPvfATuFZrY9rfX6i8jJ
ykqzcC6qkS2n1qo2TsD5VhVzgQTaZHcnEtGR4g+az4u6rhin58A=
=Gefr
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
