Return-Path: <linux-i2c+bounces-8114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AC9D4A18
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 10:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA7D2826E5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4171CB32F;
	Thu, 21 Nov 2024 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5XgQPid"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2D15C120;
	Thu, 21 Nov 2024 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732181820; cv=none; b=YEjFokEB47wfWCQq8k3o9syvTNlDL3jhyPEzUcbQ1D467cQLXcDGaT+TcWB7nXZcCdotKZG998HXXhrkhxiDXcLUXp31V11NJS/RAyIMpwi7OHB+TgjO7AP00ip89K6Y1HCDoYRlxXw0eeCeH3+TsafjnyEJcLOYZL/JSrHvwBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732181820; c=relaxed/simple;
	bh=NhMf8WXupr2HRRouvVVPIJUbnKVsVNXgRi+W8+oxQAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmTe4i5fueI5PyqiNVa/ZcYj8J6sPceNfl5i4fzxU8INBIuWG4s6HnJOUbcFqsFAHPbIccVLfBMf7IW1LA5VHLGWnDlUWO/P09kDhg0kXPXysUiWd8zR9kXE52h2WFceoVSFBukLn08N869rsYxenEfwmMbRQBdp9E3WmXFtchE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5XgQPid; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B40C4CECC;
	Thu, 21 Nov 2024 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732181820;
	bh=NhMf8WXupr2HRRouvVVPIJUbnKVsVNXgRi+W8+oxQAo=;
	h=Date:From:To:Cc:Subject:From;
	b=p5XgQPidbtxPrTCWYDVgxwEkjvEGYWR9BC+679vyHA+X4ZacnlNisDTsrCG+1H/62
	 3Zecnymz17VK0ZxWKKGC3m/KPwLGWMCxx3HmBg/bjXkKRTAhCx/QOYQVgYQJZJVtIO
	 wfrLV4vK7DtziuoHUY1NNnJBbMhKu2uXTwNoqekL2o+C8WcYg2owLD76dW4V+VM7kj
	 0troNCWV+HyyUpfmGulbv/2Qi4hchUTlOZsNmxIBipq8hFetD5Gour38oSQekWso42
	 5GF9PsU4RcD3xryKRyKhzU1j95qZ49FriwALcebv0UKD7eB1w5HteWk/7l0192JV+B
	 ABueotDl7t1gw==
Date: Thu, 21 Nov 2024 10:36:57 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.13-rc1
Message-ID: <Zz7_OUd-y4ZjnlFZ@ninjato>
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
	protocol="application/pgp-signature"; boundary="f3S4dA/KAuVMAi3n"
Content-Disposition: inline


--f3S4dA/KAuVMAi3n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.13-rc1

for you to fetch changes up to 1b3073291ddbe23fede7e0dd1b6f5635e370f8ba:

  Merge tag 'i2c-host-6.13-p1' of git://git.kernel.org/pub/scm/linux/kernel=
/git/andi.shyti/linux into i2c/for-mergewindow (2024-11-18 08:35:47 +0100)

----------------------------------------------------------------
i2c-for-6.13-rc1

i2c-core (Wolfram)

 - drivers can now use a GPIO as a side channel for SMBus Alerts
   using a generic binding

 - regular stuff like mem leak fix, Makefile maintenance...

i2c-host updates (Andi)

Major Improvements and Refactoring:

 - All controllers using the 'remove_new' callback have been
   reverted to use the 'remove' callback.

 - Intel SCH controller underwent significant refactoring,
   this brings love and a modern look to the driver.

 - PIIX4 driver refactored to enable usage by other drivers
   (e.g., AMD ASF).

 - iMX/MXC improved message handling to reduce protocol overhead:
     Refactored DMA/non-DMA read/write and bus polling mechanisms
     to achieve this.

 - ACPI documentation for PIIX4.

New Features:

 - i2c-cadence added support for atomic transfers.
 - Qualcomm CII added support for a 32MHz serial engine clock.

Deprecated Features:

 - Dropped outdated support for AMD756 S4882 and NFORCE2 S4985. If
   somebody misses this, Jean will rewrite support using the proper
   i2c mux framework.

New Hardware Support:

 - Added support for:
   - Intel Panther Lake (new ID)
   - AMD ASF (new driver)
   - S32G2/S32G3 SoCs (new ID)
   - Realtek RTL I2C Controller (new driver)
   - HJMC01 DesignWare ACPI HID (new ID)
   - PIC64GX to Microchip Core (new ID)
   - Qualcomm SDM670 to Qualcomm CCI (new ID)

at24 updates (Bartosz)

- add support for the lockable page on ST M24256E

----------------------------------------------------------------
Andy Shevchenko (18):
      i2c: Use *-y instead of *-objs in Makefile
      i2c: isch: Pass pointer to struct i2c_adapter down
      i2c: isch: Use string_choices API instead of ternary operator
      i2c: isch: Switch to memory mapped IO accessors
      i2c: isch: Use custom private data structure
      i2c: isch: switch i2c registration to devm functions
      i2c: isch: Utilize temporary variable to hold device pointer
      i2c: isch: Use read_poll_timeout()
      i2c: isch: Unify the name of the variable to hold an error code
      i2c: isch: Don't use "proxy" headers
      i2c: isch: Prefer to use octal permission
      i2c: isch: Convert to kernel-doc
      i2c: designware: Use temporary variable for struct device
      i2c: designware: Get rid of redundant 'else'
      i2c: designware: Remove 'cond' from i2c_dw_scl_hcnt()
      i2c: designware: Use sda_hold_time variable name everywhere
      i2c: designware: Fix spelling and other issues in the comments
      i2c: busses: Use *-y instead of *-objs in Makefile

Bryan O'Donoghue (1):
      i2c: qcom-cci: Stop complaining about DT set clock rate

Chen-Yu Tsai (1):
      i2c: core: Remove extra space in Makefile

Chris Packham (2):
      dt-bindings: i2c: Add Realtek RTL I2C Controller
      i2c: Add driver for the RTL9300 I2C controller

Christophe JAILLET (1):
      Documentation: i2c: Constify struct i2c_device_id

Ciprian Marian Costea (2):
      dt-bindings: i2c: imx: add SoC specific compatible strings for S32G
      i2c: imx: add support for S32G2/S32G3 SoCs

Hunter Yu (1):
      i2c: designware: Add a new ACPI HID for HJMC01 I2C controller

Igor Pylypiv (1):
      i2c: dev: Fix memory leak when underlying adapter does not support I2C

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Panther Lake

Jean Delvare (1):
      i2c: Drop legacy muxing pseudo-drivers

Jiapeng Chong (1):
      i2c: qcom-cci: Remove the unused variable cci_clk_rate

Konstantin Aladyshev (1):
      docs: i2c: piix4: Add ACPI section

Manikanta Guntupalli (3):
      i2c: cadence: Relocate cdns_i2c_runtime_suspend and cdns_i2c_runtime_=
resume to facilitate atomic mode
      i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
      i2c: cadence: Add atomic transfer support for controller version 1.4

Manikanta Mylavarapu (1):
      i2c: qcom-geni: Support systems with 32MHz serial engine clock

Marek Vasut (2):
      dt-bindings: at24: add ST M24256E Additional Write lockable page supp=
ort
      eeprom: at24: add ST M24256E Additional Write lockable page support

Pierre-Henry Moussay (1):
      dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with =
driver

Qianqiang Liu (1):
      i2c: amd-asf: Fix uninitialized variables issue in amd_asf_process_ta=
rget

Raag Jadav (1):
      i2c: designware: constify abort_sources

Richard Acayan (1):
      dt-bindings: i2c: qcom-cci: Document SDM670 compatible

Shyam Sundar S K (8):
      i2c: piix4: Change the parameter list of piix4_transaction function
      i2c: piix4: Move i2c_piix4 macros and structures to common header
      i2c: piix4: Export i2c_piix4 driver functions as library
      i2c: amd-asf: Add ACPI support for AMD ASF Controller
      i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with SM=
Bus
      i2c: amd-asf: Add routine to handle the ASF slave process
      i2c: amd-asf: Clear remote IRR bit to get successive interrupt
      MAINTAINERS: Add AMD ASF driver entry

Stefan Eichenberger (3):
      i2c: imx: do not poll for bus busy in single master mode
      i2c: imx: separate atomic, dma and non-dma use case
      i2c: imx: prevent rescheduling in non dma mode

Tyrone Ting (2):
      i2c: npcm: correct the read/write operation procedure
      i2c: npcm: use a software flag to indicate a BER condition

Uwe Kleine-K=C3=B6nig (1):
      i2c: Switch back to struct platform_driver::remove()

Vladimir Zapolskiy (1):
      i2c: qcom-cci: Remove unused struct member cci_clk_rate

Wolfram Sang (5):
      i2c: testunit: improve error handling for GPIO
      i2c: support gpio-binding for SMBAlerts
      Merge tag 'at24-updates-for-v6.13-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      i2c: qcom-geni: Keep comment why interrupts start disabled
      Merge tag 'i2c-host-6.13-p1' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/andi.shyti/linux into i2c/for-mergewindow


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (8):
      (Rev.) i2c: Add driver for the RTL9300 I2C controller
      (Rev.) i2c: designware: Get rid of redundant 'else'
      (Rev.) i2c: designware: Use temporary variable for struct device
      (Rev.) i2c: cadence: Add atomic transfer support for controller versi=
on 1.4
      (Rev.) i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
      (Rev.) i2c: cadence: Relocate cdns_i2c_runtime_suspend and cdns_i2c_r=
untime_resume to facilitate atomic mode
      (Rev.) i2c: core: Remove extra space in Makefile
      (Rev.) i2c: support gpio-binding for SMBAlerts

Andy Shevchenko (10):
      (Rev.) docs: i2c: piix4: Add ACPI section
      (Rev.) i2c: designware: Add a new ACPI HID for HJMC01 I2C controller
      (Rev.) i2c: amd-asf: Clear remote IRR bit to get successive interrupt
      (Rev.) i2c: amd-asf: Add routine to handle the ASF slave process
      (Rev.) i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF =
with SMBus
      (Rev.) i2c: amd-asf: Add ACPI support for AMD ASF Controller
      (Rev.) i2c: piix4: Export i2c_piix4 driver functions as library
      (Rev.) i2c: piix4: Move i2c_piix4 macros and structures to common hea=
der
      (Rev.) i2c: piix4: Change the parameter list of piix4_transaction fun=
ction
      (Rev.) i2c: core: Remove extra space in Makefile

Bagas Sanjaya (1):
      (Rev.) docs: i2c: piix4: Add ACPI section

Bjorn Andersson (2):
      (Rev.) i2c: qcom-geni: Keep comment why interrupts start disabled
      (Rev.) i2c: qcom-geni: Support systems with 32MHz serial engine clock

Dan Carpenter (1):
      (Rev.) i2c: amd-asf: Fix uninitialized variables issue in amd_asf_pro=
cess_target

Dmitry Baryshkov (1):
      (Rev.) i2c: qcom-cci: Remove the unused variable cci_clk_rate

Frank Li (4):
      (Rev.) i2c: imx: add support for S32G2/S32G3 SoCs
      (Rev.) dt-bindings: i2c: imx: add SoC specific compatible strings for=
 S32G
      (Rev.) i2c: imx: separate atomic, dma and non-dma use case
      (Rev.) i2c: imx: do not poll for bus busy in single master mode

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: Add Realtek RTL I2C Controller
      (Rev.) dt-bindings: i2c: qcom-cci: Document SDM670 compatible

Mario Limonciello (3):
      (Rev.) i2c: designware: Fix spelling and other issues in the comments
      (Rev.) i2c: designware: Get rid of redundant 'else'
      (Rev.) i2c: designware: Use temporary variable for struct device

Rob Herring (1):
      (Rev.) dt-bindings: at24: add ST M24256E Additional Write lockable pa=
ge support

Serge Semin (1):
      (Test) i2c: designware: Get rid of redundant 'else'

Tali Perry (2):
      (Rev.) i2c: npcm: use a software flag to indicate a BER condition
      (Rev.) i2c: npcm: correct the read/write operation procedure

Vladimir Zapolskiy (3):
      (Rev.) i2c: qcom-cci: Remove the unused variable cci_clk_rate
      (Rev.) i2c: qcom-cci: Stop complaining about DT set clock rate
      (Rev.) dt-bindings: i2c: qcom-cci: Document SDM670 compatible

 Documentation/devicetree/bindings/eeprom/at24.yaml |   2 +
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml |   4 +
 .../devicetree/bindings/i2c/microchip,corei2c.yaml |   4 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  19 +
 .../bindings/i2c/realtek,rtl9301-i2c.yaml          |  69 ++++
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 Documentation/i2c/busses/i2c-piix4.rst             |  63 +++
 Documentation/i2c/writing-clients.rst              |   3 +-
 MAINTAINERS                                        |  17 +-
 drivers/i2c/Makefile                               |   6 +-
 drivers/i2c/busses/Kconfig                         |  65 ++--
 drivers/i2c/busses/Makefile                        |  16 +-
 drivers/i2c/busses/i2c-altera.c                    |   2 +-
 drivers/i2c/busses/i2c-amd-asf-plat.c              | 369 ++++++++++++++++++
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |   2 +-
 drivers/i2c/busses/i2c-amd756-s4882.c              | 245 ------------
 drivers/i2c/busses/i2c-amd756.c                    |   4 +-
 drivers/i2c/busses/i2c-aspeed.c                    |   2 +-
 drivers/i2c/busses/i2c-at91-core.c                 |   2 +-
 drivers/i2c/busses/i2c-au1550.c                    |   2 +-
 drivers/i2c/busses/i2c-axxia.c                     |   2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |   2 +-
 drivers/i2c/busses/i2c-bcm-kona.c                  |   2 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |   2 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |   2 +-
 drivers/i2c/busses/i2c-cadence.c                   | 425 +++++++++++++++--=
----
 drivers/i2c/busses/i2c-cbus-gpio.c                 |   2 +-
 drivers/i2c/busses/i2c-cht-wc.c                    |   2 +-
 drivers/i2c/busses/i2c-cpm.c                       |   2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |   2 +-
 drivers/i2c/busses/i2c-davinci.c                   |   2 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c         |  10 +-
 drivers/i2c/busses/i2c-designware-common.c         |  68 ++--
 drivers/i2c/busses/i2c-designware-core.h           |  12 +-
 drivers/i2c/busses/i2c-designware-master.c         |  17 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  39 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |  55 ++-
 drivers/i2c/busses/i2c-designware-slave.c          |   6 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   2 +-
 drivers/i2c/busses/i2c-dln2.c                      |   2 +-
 drivers/i2c/busses/i2c-emev2.c                     |   2 +-
 drivers/i2c/busses/i2c-exynos5.c                   |   2 +-
 drivers/i2c/busses/i2c-gpio.c                      |   2 +-
 drivers/i2c/busses/i2c-gxp.c                       |   2 +-
 drivers/i2c/busses/i2c-highlander.c                |   2 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   2 +-
 drivers/i2c/busses/i2c-i801.c                      |   6 +
 drivers/i2c/busses/i2c-ibm_iic.c                   |   2 +-
 drivers/i2c/busses/i2c-img-scb.c                   |   2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |   2 +-
 drivers/i2c/busses/i2c-imx.c                       | 409 +++++++++++++++++=
---
 drivers/i2c/busses/i2c-iop3xx.c                    |   2 +-
 drivers/i2c/busses/i2c-isch.c                      | 317 +++++++--------
 drivers/i2c/busses/i2c-jz4780.c                    |   2 +-
 drivers/i2c/busses/i2c-kempld.c                    |   2 +-
 drivers/i2c/busses/i2c-lpc2k.c                     |   2 +-
 drivers/i2c/busses/i2c-meson.c                     |   2 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c         |   2 +-
 drivers/i2c/busses/i2c-mlxbf.c                     |   2 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |   2 +-
 drivers/i2c/busses/i2c-mpc.c                       |   2 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |   2 +-
 drivers/i2c/busses/i2c-mt7621.c                    |   2 +-
 drivers/i2c/busses/i2c-mv64xxx.c                   |   2 +-
 drivers/i2c/busses/i2c-mxs.c                       |   2 +-
 drivers/i2c/busses/i2c-nforce2-s4985.c             | 240 ------------
 drivers/i2c/busses/i2c-nforce2.c                   |  16 -
 drivers/i2c/busses/i2c-npcm7xx.c                   |  24 +-
 drivers/i2c/busses/i2c-ocores.c                    |   2 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c            |   2 +-
 drivers/i2c/busses/i2c-omap.c                      |   2 +-
 drivers/i2c/busses/i2c-opal.c                      |   2 +-
 drivers/i2c/busses/i2c-pasemi-platform.c           |   2 +-
 drivers/i2c/busses/i2c-pca-platform.c              |   2 +-
 drivers/i2c/busses/i2c-piix4.c                     |  51 +--
 drivers/i2c/busses/i2c-piix4.h                     |  44 +++
 drivers/i2c/busses/i2c-pnx.c                       |   2 +-
 drivers/i2c/busses/i2c-powermac.c                  |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   2 +-
 drivers/i2c/busses/i2c-qcom-cci.c                  |  23 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  27 +-
 drivers/i2c/busses/i2c-qup.c                       |   2 +-
 drivers/i2c/busses/i2c-rcar.c                      |   2 +-
 drivers/i2c/busses/i2c-riic.c                      |   2 +-
 drivers/i2c/busses/i2c-rk3x.c                      |   2 +-
 drivers/i2c/busses/i2c-rtl9300.c                   | 423 +++++++++++++++++=
+++
 drivers/i2c/busses/i2c-rzv2m.c                     |   2 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   2 +-
 drivers/i2c/busses/i2c-scmi.c                      |   2 +-
 drivers/i2c/busses/i2c-sh7760.c                    |   2 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   2 +-
 drivers/i2c/busses/i2c-simtec.c                    |   2 +-
 drivers/i2c/busses/i2c-sprd.c                      |   2 +-
 drivers/i2c/busses/i2c-st.c                        |   2 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |   2 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   2 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c                |   2 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c                |   2 +-
 drivers/i2c/busses/i2c-tegra.c                     |   2 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |   2 +-
 drivers/i2c/busses/i2c-uniphier.c                  |   2 +-
 drivers/i2c/busses/i2c-versatile.c                 |   2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c                |   2 +-
 drivers/i2c/busses/i2c-viperboard.c                |   2 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c             |   2 +-
 drivers/i2c/busses/i2c-xiic.c                      |   2 +-
 drivers/i2c/busses/i2c-xlp9xx.c                    |   2 +-
 drivers/i2c/busses/scx200_acb.c                    |   2 +-
 drivers/i2c/i2c-core-smbus.c                       |   9 +-
 drivers/i2c/i2c-dev.c                              |  17 +-
 drivers/i2c/i2c-slave-testunit.c                   |   7 +
 drivers/i2c/i2c-smbus.c                            |  22 +-
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c         |   2 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |   2 +-
 drivers/i2c/muxes/i2c-mux-gpio.c                   |   2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |   2 +-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   2 +-
 drivers/misc/eeprom/at24.c                         |   4 +
 121 files changed, 2164 insertions(+), 1158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9301-i=
2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c
 delete mode 100644 drivers/i2c/busses/i2c-amd756-s4882.c
 delete mode 100644 drivers/i2c/busses/i2c-nforce2-s4985.c
 create mode 100644 drivers/i2c/busses/i2c-piix4.h
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--f3S4dA/KAuVMAi3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc+/zkACgkQFA3kzBSg
KbY0zg/+NLYqJQS8R0uZVoogw/3NgbSSZj02/C5lERYyxZh4efRJA3fwN3yNtne2
8XAc8dWKIGbnTPqtT5kLhtsJBUrTfZ9+HVu2OwBelsjm/9LT3PQkFjNcZeQ8O2dX
AH3IGxi1J+UNknF0Lw1tUVAzObgt3cffkEaTgFdR2Hnyczu+OtnFooFT/Iz+7g7m
3nD1APpCeO5pYIv/C86/xnLShuOssE28QhyMx/mxp2ycUoGqCkodkqKDzvOERm/y
/ZY6To5ZbXg6sheGD4yaiMGIBHZDxbHSi82LvFTyPhyA29cxwRxM7A1Rp/jLi2HN
FxH8t+BZM74pv+QHxwM9t91/2R7/V7+BwWGxhYu9F1csmjA10R6g/tiWdtDJycmI
wtjknqjADsyh8kFHYUIu0Rn5FNmnMaHEYPdJn+svQg9odhlNVS9TmIvu21a8F+pv
HxvqgaQjwQLlnzMrogJwa3SPoIjdabJIPnvUw+wL6rMBYeZHRehkqFpWFPKwqFZA
124LHJyIu7njU+KRCGbzANQQog+4QY47idPrH7a9og6PeUyXfCthJZyz7L0qAN7v
egfAaQUBkf7If6s1heahhZrZLFUM4vfosnAQ05F7jgBGV+gHNoYcvwcMtbHyVIE9
B+hf9VADhl25WrbFEP0SY1Ks7mf4ehz62s060vPHzGD19xFHFLE=
=WsPJ
-----END PGP SIGNATURE-----

--f3S4dA/KAuVMAi3n--

