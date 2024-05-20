Return-Path: <linux-i2c+bounces-3596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616F8C9A41
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 11:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83671F213F6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 09:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6181C6A3;
	Mon, 20 May 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJONfR+W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ACEFC1D;
	Mon, 20 May 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716196977; cv=none; b=e671IJ5FFVfkDGvG51xyC++XqYKWforwuc120ixnC+kNw7NP3eEwCTWpbK5ADUjPCAREDPl0guUtnLVx6VGqLwNuuAapE0tarbwuQWdyL3RXWrTl6kx7WqdtQJgx+qMiji5mg4Wha0qdiKgJL9eDcgruwU3tgVl7q2mFpNAuG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716196977; c=relaxed/simple;
	bh=3pMKgd4LmFd4C4gJjWdjXdVrkXrPsHj6cGmB/FY1nl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEtD5IUt9jvQwgR8EMFaRZrxVNeVjqJtz3gEr258Kxu9DMlvbLr1vxKer0IorDPFywdGuHOeJPmnQ8U9GVJ5PdlN0txhwUcwur+/FUuXEQ8zMzIvzZkXmuw6w6AWmGae7xu8tqkSAjctkzzZ1v42ijBhxn4mrfGZgtsnWNSJDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJONfR+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F08C2BD10;
	Mon, 20 May 2024 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716196977;
	bh=3pMKgd4LmFd4C4gJjWdjXdVrkXrPsHj6cGmB/FY1nl4=;
	h=Date:From:To:Cc:Subject:From;
	b=MJONfR+WtLjhJO70UsIZWSeTbhKyMnQTb8HwATGqEJdrEW2NRwlL84vUl4pTb3PjW
	 QANfnibBlnfqu4TxcwrPHdLGhr9Sn4Qult5J5zfvEzbXtwJqxbcl2gCC6MjZfdNIJS
	 2WuCIpnqG7oGP8sCDiPW57Grg392rG0gzZWCrR3Eu/0VxqhHWHa7Isj7VyNqyhYztu
	 E1P/s+eUTd1LpcgXmUTC6hYhUTAcnAw9VjAzkf0nFR4+zyPnImxOZNz5EsxLBRvblx
	 54T3YKlHowgB/UUXYbjGYXlLwN4P8tBK+P+oxYAaH2eU3M7hb/bmsobGcChTSDcpLp
	 aVfPiHYv1YYnw==
Date: Mon, 20 May 2024 11:22:53 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc1
Message-ID: <ZksWbctxiJmcNmg9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ci9aXpwAIRAxNlWI"
Content-Disposition: inline


--Ci9aXpwAIRAxNlWI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.10-rc1

for you to fetch changes up to 068a95ef3945033b5355e50fecea18737680d43d:

  power: supply: sbs-manager: Remove class argument from i2c_mux_add_adapte=
r() (2024-05-14 09:21:43 +0200)

----------------------------------------------------------------
I2C core removes an argument from the i2c_mux_add_adapter() call to
further deprecate class based I2C device instantiation. All users are
converted, too. Other that that, Andi collected a number if I2C host
driver patches. Those merges have their own description.

----------------------------------------------------------------
Abhinav Jain (1):
      i2c: mpc: Removal of of_node_put with __free for auto cleanup

Alexander Stein (1):
      i2c: lpi2c: Avoid calling clk_get_rate during transfer

Andy Shevchenko (1):
      i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()

Animesh Agarwal (1):
      dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema

Arnd Bergmann (1):
      i2c: ocores: convert to ioport_map() for IORESOURCE_IO

Bryan O'Donoghue (1):
      dt-bindings: i2c: qcom-cci: Document sc8280xp compatible

Christophe JAILLET (1):
      i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()

Hamish Martin (1):
      i2c: acpi: Unbind mux adapters before delete

Hans Hu (6):
      i2c: wmt: create wmt_i2c_init for general init
      i2c: wmt: split out common files
      i2c: wmt: rename something
      i2c: wmt: fix a bug when thread blocked
      i2c: wmt: add platform type VIAI2C_PLAT_WMT
      i2c: add zhaoxin i2c controller driver

Heiner Kallweit (6):
      i2c: i801: Call i2c_register_spd for muxed child segments
      i2c: i801: Fix missing Kconfig dependency
      i2c: i801: Remove usage of I2C_CLASS_SPD
      i2c: mux: gpio: remove support for class-based device instantiation
      i2c: i801: Annotate apanel_addr as __ro_after_init
      i2c: mux: Remove class argument from i2c_mux_add_adapter()

Ji Sheng Teoh (1):
      i2c: cadence: Add RISCV architecture support

Krzysztof Kozlowski (1):
      i2c: viperboard: drop driver owner assignment

Lad Prabhakar (4):
      dt-bindings: i2c: renesas,riic: Document R9A09G057 support
      i2c: riic: Introduce helper functions for I2C read/write operations
      i2c: riic: Pass register offsets and chip details as OF data
      i2c: riic: Add support for R9A09G057 SoC

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT

Niklas Schnelle (1):
      i2c: add HAS_IOPORT dependencies

Piyush Malgujar (2):
      i2c: octeon: Add platform prefix to macros
      i2c: thunderx: Adding ioclk support

Sai Pavan Boddu (1):
      i2c: cadence: Avoid fifo clear after start

Shanth Murthy (1):
      i2c: designware: Add ACPI ID for Granite Rapids-D I2C controller

Suneel Garapati (3):
      i2c: thunderx: Clock divisor logic changes
      i2c: thunderx: Support for High speed mode
      i2c: octeon: Handle watchdog timeout

Wolfram Sang (40):
      i2c: at91-master: remove printout on handled timeouts
      i2c: bcm-iproc: remove printout on handled timeouts
      i2c: bcm2835: remove printout on handled timeouts
      i2c: cadence: remove printout on handled timeouts
      i2c: davinci: remove printout on handled timeouts
      i2c: img-scb: remove printout on handled timeouts
      i2c: ismt: remove printout on handled timeouts
      i2c: nomadik: remove printout on handled timeouts
      i2c: omap: remove printout on handled timeouts
      i2c: qcom-geni: remove printout on handled timeouts
      i2c: qup: remove printout on handled timeouts
      i2c: rk3x: remove printout on handled timeouts
      i2c: sh_mobile: remove printout on handled timeouts
      i2c: st: remove printout on handled timeouts
      i2c: tegra: remove printout on handled timeouts
      i2c: uniphier-f: remove printout on handled timeouts
      i2c: uniphier: remove printout on handled timeouts
      i2c: i801: remove printout on handled timeouts
      i2c: ali1535: remove printout on handled timeouts
      i2c: ali1563: remove printout on handled timeouts
      i2c: ali15x3: remove printout on handled timeouts
      i2c: amd-mp2-plat: use 'time_left' variable with wait_for_completion_=
timeout()
      i2c: digicolor: use 'time_left' variable with wait_for_completion_tim=
eout()
      i2c: exynos5: use 'time_left' variable with wait_for_completion_timeo=
ut()
      i2c: hix5hd2: use 'time_left' variable with wait_for_completion_timeo=
ut()
      i2c: imx-lpi2c: use 'time_left' variable with wait_for_completion_tim=
eout()
      i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
      i2c: st: use 'time_left' variable with wait_for_completion_timeout()
      i2c: stm32f4: use 'time_left' variable with wait_for_completion_timeo=
ut()
      i2c: stm32f7: use 'time_left' variable with wait_for_completion_timeo=
ut()
      i2c: synquacer: use 'time_left' variable with wait_for_completion_tim=
eout()
      i2c: jz4780: use 'time_left' variable with wait_for_completion_timeou=
t()
      i2c: qcom-geni: use 'time_left' variable with wait_for_completion_tim=
eout()
      i2c: rk3x: use 'time_left' variable with wait_event_timeout()
      i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
      i2c: pxa: use 'time_left' variable with wait_event_timeout()
      Merge tag 'i2c-host-fixes-6.8-rc8' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/andi.shyti/linux into i2c/for-mergewindow
      Merge tag 'i2c-host-6.10' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/andi.shyti/linux into i2c/for-mergewindow
      Merge branch 'i2c/for-current' into i2c/for-mergewindow
      power: supply: sbs-manager: Remove class argument from i2c_mux_add_ad=
apter()


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (5):
      (Rev.) i2c: acpi: Unbind mux adapters before delete
      (Rev.) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TAB=
LE()
      (Rev.) i2c: wmt: create wmt_i2c_init for general init
      (Rev.) i2c: lpi2c: Avoid calling clk_get_rate during transfer
      (Rev.) MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT

Bjorn Andersson (3):
      (Rev.) i2c: qcom-geni: use 'time_left' variable with wait_for_complet=
ion_timeout()
      (Rev.) i2c: qup: remove printout on handled timeouts
      (Rev.) i2c: qcom-geni: remove printout on handled timeouts

Bryan O'Donoghue (1):
      (Rev.) i2c: qcom-geni: use 'time_left' variable with wait_for_complet=
ion_timeout()

Chris Packham (1):
      (Rev.) i2c: mpc: Removal of of_node_put with __free for auto cleanup

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema

Geert Uytterhoeven (4):
      (Rev.) i2c: riic: Add support for R9A09G057 SoC
      (Rev.) i2c: riic: Pass register offsets and chip details as OF data
      (Rev.) i2c: riic: Introduce helper functions for I2C read/write opera=
tions
      (Rev.) dt-bindings: i2c: renesas,riic: Document R9A09G057 support

Jarkko Nikula (1):
      (Test) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TAB=
LE()

Jean Delvare (4):
      (Rev.) i2c: ali15x3: remove printout on handled timeouts
      (Rev.) i2c: ali1563: remove printout on handled timeouts
      (Rev.) i2c: ali1535: remove printout on handled timeouts
      (Rev.) i2c: i801: remove printout on handled timeouts

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: qcom-cci: Document sc8280xp compatible

Laurent Pinchart (1):
      (Rev.) i2c: mux: Remove class argument from i2c_mux_add_adapter()

Linus Walleij (1):
      (Rev.) i2c: nomadik: remove printout on handled timeouts

Mario Limonciello (1):
      (Rev.) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TAB=
LE()

Mika Westerberg (1):
      (Rev.) i2c: acpi: Unbind mux adapters before delete

Peng Fan (1):
      (Rev.) i2c: imx-lpi2c: use 'time_left' variable with wait_for_complet=
ion_timeout()

Philippe Mathieu-Daud=C3=A9 (1):
      (Rev.) i2c: jz4780: use 'time_left' variable with wait_for_completion=
_timeout()

Serge Semin (1):
      (Test) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TAB=
LE()

Thomas Zimmermann (1):
      (Rev.) i2c: mux: Remove class argument from i2c_mux_add_adapter()

Uwe Kleine-K=C3=B6nig (2):
      (Rev.) i2c: st: use 'time_left' variable with wait_for_completion_tim=
eout()
      (Rev.) i2c: lpi2c: Avoid calling clk_get_rate during transfer

Vladimir Zapolskiy (1):
      (Rev.) dt-bindings: i2c: qcom-cci: Document sc8280xp compatible

Wolfram Sang (11):
      (Rev.) i2c: wmt: fix a bug when thread blocked
      (Rev.) i2c: wmt: rename something
      (Rev.) i2c: wmt: split out common files
      (Rev.) i2c: wmt: create wmt_i2c_init for general init
      (Rev.) i2c: i801: Fix missing Kconfig dependency
      (Rev.) i2c: add HAS_IOPORT dependencies
      (Rev.) i2c: i801: Call i2c_register_spd for muxed child segments
      (Rev.) i2c: riic: Add support for R9A09G057 SoC
      (Rev.) i2c: riic: Pass register offsets and chip details as OF data
      (Rev.) i2c: riic: Introduce helper functions for I2C read/write opera=
tions
      (Rev.) dt-bindings: i2c: renesas,riic: Document R9A09G057 support

 Documentation/devicetree/bindings/i2c/i2c-pnx.txt  |  34 --
 .../devicetree/bindings/i2c/nxp,pnx-i2c.yaml       |  46 +++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  19 +
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  19 +-
 MAINTAINERS                                        |  12 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +-
 drivers/i2c/busses/Kconfig                         |  49 ++-
 drivers/i2c/busses/Makefile                        |   3 +
 drivers/i2c/busses/i2c-ali1535.c                   |   8 +-
 drivers/i2c/busses/i2c-ali1563.c                   |   1 -
 drivers/i2c/busses/i2c-ali15x3.c                   |   4 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |   8 +-
 drivers/i2c/busses/i2c-at91-master.c               |   1 -
 drivers/i2c/busses/i2c-bcm-iproc.c                 |   2 -
 drivers/i2c/busses/i2c-bcm2835.c                   |   1 -
 drivers/i2c/busses/i2c-cadence.c                   |   3 +-
 drivers/i2c/busses/i2c-davinci.c                   |   1 -
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   2 -
 drivers/i2c/busses/i2c-designware-platdrv.c        |   9 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   6 +-
 drivers/i2c/busses/i2c-exynos5.c                   |  12 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   8 +-
 drivers/i2c/busses/i2c-i801.c                      |  41 +-
 drivers/i2c/busses/i2c-img-scb.c                   |   5 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  25 +-
 drivers/i2c/busses/i2c-ismt.c                      |   1 -
 drivers/i2c/busses/i2c-jz4780.c                    |  22 +-
 drivers/i2c/busses/i2c-mpc.c                       |  11 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   7 +-
 drivers/i2c/busses/i2c-ocores.c                    |  21 +-
 drivers/i2c/busses/i2c-octeon-core.c               | 141 +++++--
 drivers/i2c/busses/i2c-octeon-core.h               |  53 ++-
 drivers/i2c/busses/i2c-omap.c                      |  11 +-
 drivers/i2c/busses/i2c-pxa.c                       |  14 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  10 +-
 drivers/i2c/busses/i2c-qup.c                       |   4 +-
 drivers/i2c/busses/i2c-riic.c                      | 125 ++++--
 drivers/i2c/busses/i2c-rk3x.c                      |  14 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   6 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   1 -
 drivers/i2c/busses/i2c-st.c                        |  11 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |   8 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   8 +-
 drivers/i2c/busses/i2c-synquacer.c                 |  26 +-
 drivers/i2c/busses/i2c-tegra.c                     |   2 -
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |  13 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |   1 -
 drivers/i2c/busses/i2c-uniphier.c                  |   4 +-
 drivers/i2c/busses/i2c-viai2c-common.c             | 256 +++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h             |  85 +++++
 drivers/i2c/busses/i2c-viai2c-wmt.c                | 148 ++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c            | 298 +++++++++++++++
 drivers/i2c/busses/i2c-viperboard.c                |   1 -
 drivers/i2c/busses/i2c-wmt.c                       | 421 -----------------=
----
 drivers/i2c/i2c-core-acpi.c                        |  19 +-
 drivers/i2c/i2c-mux.c                              |  24 +-
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c         |   2 +-
 drivers/i2c/muxes/i2c-mux-gpio.c                   |   3 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |   2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   2 +-
 drivers/iio/gyro/mpu3050-i2c.c                     |   2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |   2 +-
 drivers/media/dvb-frontends/af9013.c               |   2 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |   2 +-
 drivers/media/dvb-frontends/m88ds3103.c            |   2 +-
 drivers/media/dvb-frontends/rtl2830.c              |   2 +-
 drivers/media/dvb-frontends/rtl2832.c              |   2 +-
 drivers/media/dvb-frontends/si2168.c               |   2 +-
 drivers/media/i2c/max9286.c                        |   2 +-
 drivers/media/usb/cx231xx/cx231xx-i2c.c            |   5 +-
 drivers/of/unittest.c                              |   2 +-
 drivers/power/supply/sbs-manager.c                 |   2 +-
 include/linux/i2c-mux.h                            |   3 +-
 include/linux/platform_data/i2c-mux-gpio.h         |   2 -
 79 files changed, 1340 insertions(+), 798 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-pnx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

--Ci9aXpwAIRAxNlWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZLFm0ACgkQFA3kzBSg
KbZJLQ/9EY9Twfk+W2ji0OvXD08U47jMNj2ldxT7Ced23L+TJF02QiG7+ckImGOf
712dYCeA0QgUZCAkGAcpyQhOlXLUlKjKSHAdJydUgNM9ySaJsvBnWVggJAd3u2aR
C+AEaagkesk+EQAhFJXwCDEjsf0EQC6lcyKxJ1tMHgj2bpa9oKdswKwduH2SYEt9
hw9oJcJfT72rnhqYIxT6lbtCGK4yQNd4ot3vdbQ2nwmY48VVfqdGEXVMGB2l6qVl
dIISSAU5VXI2IfMjfcr4cfGlY+ZSVrIgR09AzkKSq59KZJDYQUNyRoQKO5ZRGEHs
uSNAwXj5EMGXQBt6Rv+lheuURay9muw1QMuxKWes+IA4MS0w/C59kmKq+bcnovBJ
+i8KV0Da+sOIpPOFambph47JsT0pxqiFpUfrkp7X7VUXPFC/gGyQz3AkM9D5SrRp
JMu88WzAGo1NKWF7Yu8k6R8/NgRsGExSUGXuHWJ7JU9SfUOLo62JG7JacENeJfnS
zKIFaEqrt6WFmrjZag8k8jLeLILjyA4ldkb34QUhpRY/82V/OfcELGdfIrHaU3aS
400dv3IXRRm6SBDhrvi1/+jCJZbQYM7Ktcsnlu3H/aMfoeznsrqEWzo10nPfu6su
hrTLd+49e8MvpMxALMK900fzYfaR8rBVo6vUiB/BiQjxBeukOd8=
=r4Iy
-----END PGP SIGNATURE-----

--Ci9aXpwAIRAxNlWI--

