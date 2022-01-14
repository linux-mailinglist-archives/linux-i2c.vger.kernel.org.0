Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C302448E831
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 11:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240335AbiANKSC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 05:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240323AbiANKSC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 05:18:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DA0C061574;
        Fri, 14 Jan 2022 02:18:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7D7EBB823A5;
        Fri, 14 Jan 2022 10:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94594C36AE5;
        Fri, 14 Jan 2022 10:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642155478;
        bh=Spfv4rIdTqDcfRKVer0oHyTdUEot8YAzpaQktg6H6/A=;
        h=Date:From:To:Cc:Subject:From;
        b=tRg79tZLTJA+PgOpqauU9ECo9LP/f3uPCErqVYyt537vLo2tzpxBe7dKrvojoMPXd
         R20FW7wbV3mCkw2Pi0Wd3abFHAGG56wemR1GI2ZUyI5VH8K3vmd9tXHwm8Esz/Dsv7
         OBvr3HO4hHtxeo08EpUA3NagmM70Z1MfFKaqzummjBc2WWIGEPG1xXoXSqrctmw+Ja
         n0wTk+uzvu6YCANZQEFmLZPMvw2hkqb6HYtkkF+2fvMy60vhUbEl+KFPfUjtsEYh/b
         T+ZAM498kThkvFlvDdZRykQPjVS+kWYdAspbEEda/8kwIU/Idjf0dzmh+B6ZNZ2pOJ
         Wr6PPavo/zB+w==
Date:   Fri, 14 Jan 2022 11:17:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.17
Message-ID: <YeFNz6pdiGvVTPLh@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IQeYaCUw+0LgCgpF"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IQeYaCUw+0LgCgpF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

for 5.17, I2C has mostly driver updates and refactorization. The removal
of the XLR driver and the i801 refactoring stand out a little. In the
core, we enabled async suspend/resume for I2C controllers and their
clients. No issues were reported during the test phase in -next. We will
see how this goes for mainline.

Please pull.

Thanks,

   Wolfram


The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-merge=
window

for you to fetch changes up to bf3c39f5da43499c52d4127b7f2f495b69dfeebf:

  i2c: sh_mobile: remove unneeded semicolon (2022-01-11 21:11:24 +0100)

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match

Akhil R (2):
      i2c: tegra: Add the ACPI support
      i2c: tegra: use i2c_timings for bus clock freq

Alain Volmat (1):
      i2c: stm32: get rid of stm32f7_i2c_release_bus return value

Andy Shevchenko (8):
      i2c: mux: gpio:=C2=A0Replace custom acpi_get_local_address()
      i2c: mux: gpio: Don't dereference fwnode from struct device
      i2c: mux: gpio: Use array_size() helper
      i2c: designware: Fix the kernel doc description for struct dw_i2c_dev
      i2c: designware-pci: Add a note about struct dw_scl_sda_cfg usage
      i2c: designware-pci: Group MODULE_*() macros
      i2c: designware-pci: use __maybe_unused for PM functions
      i2c: designware-pci: Convert to use dev_err_probe()

Corey Minyard (1):
      i2c: imx: Add timer for handling the stop condition

David Heidelberg (1):
      dt-bindings: i2c: brcm,bcm2835-i2c: convert to YAML schema

Derek Basehore (1):
      i2c: enable async suspend/resume on i2c client devices

Geert Uytterhoeven (1):
      dt-bindings: at24: Rework special case compatible handling

Heiner Kallweit (7):
      i2c: i801: Don't silently correct invalid transfer size
      i2c: i801: Remove i801_set_block_buffer_mode
      i2c: i801: Improve handling of chip-specific feature definitions
      i2c: i801: Improve handling platform data for tco device
      eeprom: at24: remove struct at24_client
      i2c: i801: Don't read back cleared status in i801_check_pre()
      i2c: i801: Don't clear status flags twice in interrupt mode

Jacky Bai (1):
      dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string

Jaewon Kim (2):
      dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c compatible
      i2c: exynos5: Add support for ExynosAutoV9 SoC

Joakim Tjernlund (1):
      i2c: mpc: Correct I2C reset procedure

John Keeping (1):
      i2c: rk3x: enable clock before getting rate

Lad Prabhakar (3):
      i2c: bcm2835: Use platform_get_irq() to get the interrupt
      i2c: sh_mobile: Use platform_get_irq_optional() to get the interrupt
      i2c: riic: Use platform_get_irq() to get the interrupt

Lakshmi Sowjanya D (3):
      i2c: designware-pci: Add support for Fast Mode Plus and High Speed Mo=
de
      i2c: designware-pci: Set ideal timing parameters for Elkhart Lake PSE
      i2c: designware-pci: Fix to change data types of hcnt and lcnt parame=
ters

Maxim Kochetkov (2):
      dt-bindings: at24: add at24c1025
      eeprom: at24: Add support for 24c1025 EEPROM

Rajat Jain (2):
      i2c: designware: Enable async suspend / resume of designware devices
      i2c: enable async suspend/resume for i2c adapters

Rob Herring (3):
      i2c: Remove Netlogic XLP variant
      i2c: Remove unused Netlogic/Sigma Designs XLR driver
      dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'

Sam Protsenko (5):
      dt-bindings: i2c: exynos5: Convert to dtschema
      dt-bindings: i2c: exynos5: Add bus clock
      i2c: exynos5: Add bus clock support
      i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
      i2c: exynos5: Fix getting the optional clock

Tamal Saha (1):
      i2c: designware: Do not complete i2c read without RX_FULL interrupt

Thierry Reding (1):
      i2c: aspeed: Remove unused includes

Wolfram Sang (7):
      Merge branch 'i2c/for-current' into i2c/for-mergewindow
      Revert "i2c: designware-pci: Set ideal timing parameters for Elkhart =
Lake PSE"
      Revert "i2c: designware-pci: Add support for Fast Mode Plus and High =
Speed Mode"
      i2c: stm32f7: remove noisy and imprecise log messages
      i2c: rcar: update to new DMAENGINE API when terminating
      i2c: sh_mobile: update to new DMAENGINE API when terminating
      Merge tag 'at24-updates-for-v5.17' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/brgl/linux into i2c/for-mergewindow

Yang Li (1):
      i2c: sh_mobile: remove unneeded semicolon


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (1):
      (Rev.) i2c: stm32f7: remove noisy and imprecise log messages

Andrew Manley (2):
      (Test) i2c: imx: Add timer for handling the stop condition
      (Rev.) i2c: imx: Add timer for handling the stop condition

Andy Shevchenko (1):
      (Rev.) i2c: tegra: use i2c_timings for bus clock freq

Chanho Park (3):
      (Rev.) i2c: exynos5: Fix getting the optional clock
      (Rev.) i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
      (Rev.) i2c: exynos5: Add bus clock support

Dmitry Osipenko (3):
      (Rev.) i2c: tegra: use i2c_timings for bus clock freq
      (Test) i2c: tegra: use i2c_timings for bus clock freq
      (Rev.) i2c: tegra: Add the ACPI support

Dong Aisheng (1):
      (Rev.) dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string

Evan Green (3):
      (Rev.) i2c: mux: gpio: Use array_size() helper
      (Rev.) i2c: mux: gpio: Don't dereference fwnode from struct device
      (Rev.) i2c: mux: gpio:=C2=A0Replace custom acpi_get_local_address()

Florian Fainelli (2):
      (Rev.) i2c: bcm2835: Use platform_get_irq() to get the interrupt
      (Test) dt-bindings: i2c: brcm,bcm2835-i2c: convert to YAML schema

Geert Uytterhoeven (3):
      (Rev.) i2c: sh_mobile: remove unneeded semicolon
      (Rev.) i2c: riic: Use platform_get_irq() to get the interrupt
      (Rev.) i2c: sh_mobile: Use platform_get_irq_optional() to get the int=
errupt

Heiko Stuebner (1):
      (Rev.) i2c: rk3x: enable clock before getting rate

Jarkko Nikula (3):
      (Test) i2c: enable async suspend/resume on i2c client devices
      (Test) i2c: enable async suspend/resume for i2c adapters
      (Test) i2c: designware: Enable async suspend / resume of designware d=
evices

Jean Delvare (10):
      (Rev.) i2c: i801: Don't clear status flags twice in interrupt mode
      (Test) i2c: i801: Don't clear status flags twice in interrupt mode
      (Rev.) i2c: i801: Don't read back cleared status in i801_check_pre()
      (Test) i2c: i801: Don't read back cleared status in i801_check_pre()
      (Rev.) i2c: i801: Improve handling platform data for tco device
      (Rev.) i2c: i801: Improve handling of chip-specific feature definitio=
ns
      (Test) i2c: i801: Improve handling of chip-specific feature definitio=
ns
      (Rev.) i2c: i801: Remove i801_set_block_buffer_mode
      (Test) i2c: i801: Remove i801_set_block_buffer_mode
      (Rev.) i2c: i801: Don't silently correct invalid transfer size

Joel Stanley (1):
      (Rev.) i2c: aspeed: Remove unused includes

Krzysztof Kozlowski (7):
      (Rev.) i2c: exynos5: Fix getting the optional clock
      (Rev.) i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
      (Rev.) i2c: exynos5: Add bus clock support
      (Rev.) i2c: exynos5: Add support for ExynosAutoV9 SoC
      (Rev.) dt-bindings: i2c: exynos5: Add bus clock
      (Rev.) dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c compatible
      (Rev.) dt-bindings: i2c: exynos5: Convert to dtschema

Oleksij Rempel (1):
      (Rev.) i2c: imx: Add timer for handling the stop condition

Thierry Reding (1):
      (Rev.) dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'

Wolfram Sang (3):
      (Rev.) i2c: riic: Use platform_get_irq() to get the interrupt
      (Rev.) i2c: sh_mobile: Use platform_get_irq_optional() to get the int=
errupt
      (Test) i2c: sh_mobile: Use platform_get_irq_optional() to get the int=
errupt

 Documentation/devicetree/bindings/eeprom/at24.yaml |  29 +-
 .../devicetree/bindings/i2c/aspeed,i2c.yaml        |   1 -
 .../devicetree/bindings/i2c/brcm,bcm2835-i2c.txt   |  22 -
 .../devicetree/bindings/i2c/brcm,bcm2835-i2c.yaml  |  54 +++
 .../devicetree/bindings/i2c/i2c-exynos5.txt        |  53 ---
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       | 133 ++++++
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |   2 +
 drivers/i2c/busses/Kconfig                         |  18 +-
 drivers/i2c/busses/Makefile                        |   1 -
 drivers/i2c/busses/i2c-aspeed.c                    |   2 -
 drivers/i2c/busses/i2c-bcm2835.c                   |  11 +-
 drivers/i2c/busses/i2c-designware-core.h           |  13 +-
 drivers/i2c/busses/i2c-designware-master.c         |   7 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  51 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   2 +
 drivers/i2c/busses/i2c-exynos5.c                   | 110 ++++-
 drivers/i2c/busses/i2c-i801.c                      | 288 +++++--------
 drivers/i2c/busses/i2c-imx.c                       |  92 +++-
 drivers/i2c/busses/i2c-mpc.c                       |  23 +-
 drivers/i2c/busses/i2c-rcar.c                      |  26 +-
 drivers/i2c/busses/i2c-riic.c                      |  10 +-
 drivers/i2c/busses/i2c-rk3x.c                      |   7 +
 drivers/i2c/busses/i2c-sh_mobile.c                 |  60 +--
 drivers/i2c/busses/i2c-stm32f7.c                   |  14 +-
 drivers/i2c/busses/i2c-tegra.c                     |  69 ++-
 drivers/i2c/busses/i2c-xlp9xx.c                    |   7 -
 drivers/i2c/busses/i2c-xlr.c                       | 470 -----------------=
----
 drivers/i2c/i2c-core-base.c                        |   2 +
 drivers/i2c/muxes/i2c-mux-gpio.c                   |  53 +--
 drivers/misc/eeprom/at24.c                         |  68 ++-
 30 files changed, 677 insertions(+), 1021 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.=
txt
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
 delete mode 100644 drivers/i2c/busses/i2c-xlr.c

--IQeYaCUw+0LgCgpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHhTcoACgkQFA3kzBSg
KbbNSw//cLRT80uwIvv68VVUDt7m6OKwwW8qGlG/feAsdhoRPY/QzmTv1U0Hpw11
EiHQxieaJw2NC4x/VcUJ0k9lKpabT5c0qaSdRpoWgaoUgLK7j6mnKMs0W+xbJd+n
Rs5h4mDUoqDRwz0YVnVzvkTt6jwb/Y98fuGEzXwjMeuNumdyNpzjZjeEcQuEhrfC
oYvdmkQPRt7pItOe7KZ5C8se8vliBCwhYCFtHMyqsZEN/fZbfjWHVJTg6z8p2pAy
EYxQKXlRBURHD8DJqAudijOUVomji1y9UusAo0zyh4j31LG+slnZnLPxHImz02Hc
YXyFkDWkooWbBTsCxDS/QdgU+Nphiw9A9SFsafk7fPmKtimPDxY8+4llwGLiCLpL
bh66OZzhtym2ihpUn5nE9AG/9AR804fnOw/PJMjIUETUpekMCQDAAz9ry1FaKrmH
W74yOVn/qeEK2yhKsN12fiDVhKglKCGGz0H8ky1Cf2EMpYfYpiEGjBvpQqLUJc6k
Eeu5ovBHPGRWpzgtx4lHAzuxWzZOU/CQt54L4HPqoYLes61ZXRs0F9Pd7dbMwjvL
jC0S37JapS048kKLled2nqhX2Qg3ApPFyeikL54wmL60W+3tvVldksT3Lt5XtB/s
5TnwDIxMmdq20D9dpNZ3p9fKbmH7UuXaKPkXe1M+aRGj+ingY3w=
=aIlM
-----END PGP SIGNATURE-----

--IQeYaCUw+0LgCgpF--
