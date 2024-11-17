Return-Path: <linux-i2c+bounces-8010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D849D0337
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2024 12:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43B67B21D0A
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2024 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8E813AA5D;
	Sun, 17 Nov 2024 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GE8woULG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357226296;
	Sun, 17 Nov 2024 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731842011; cv=none; b=WlI/TfQKGrfGxtn8eAfJlPy6WlGl53RwfpjCHtcpzHoHVwre8hh5lvB+UDT3KHTk40PCwL2fW9LhBU44O9OrsXNjDN2GnnJFN7iBskeaAFXMRvIYvddlS7jl6OIeYJiYx+MCxlMHZh23CUYhwCY/pRQmnqmYyGopeSdIDJ2z9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731842011; c=relaxed/simple;
	bh=XLWJcoc+n7xYCcnhKP+4IOuIsy3B3tkvq7YgD8B+L1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pg81wnhhm7w21MCpuBmN/ENtD8EFJ1mzB7CIycKZD0WZ4myJnaIeHNchL9YmiPzldt5NYPxfikS2HCh1UdEZTq7PFx7Hvu+ZiBvzSnoixQa8+k1SpTYm4Tb1LpuZQyYC++fFw45qb0rTF9P8qHKz2sSLk/eFKBcNone2xhmGMyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GE8woULG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02C2C4CECD;
	Sun, 17 Nov 2024 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731842010;
	bh=XLWJcoc+n7xYCcnhKP+4IOuIsy3B3tkvq7YgD8B+L1M=;
	h=Date:From:To:Cc:Subject:From;
	b=GE8woULGhHbeVNS8rVLn+jBdt1dCIPoqOLJqGV7uxnfpId1Cd7p1zS2oKayWQRvh2
	 dkuDRqBJST7FHJR9GZBzgdi9SNsE3r+i65HQ75p6DX0n2exwCavTzz54kkQYiTQ7qD
	 xfAoVvEFZyK8eegqkMH5po3iqmoBmA3eZjVW43qku1iJ+OIjmFpiueSEYV6A7TMepp
	 aqr9aCZG56LpPoHu34i8opy3f4YW/eDCsS61f/YjVZMr1+WsFR2951Wg1iHcxSxQZn
	 NG55rId78+X7ww1TSnfLpqaPWykiiNyIgAqSa6+sNFwlBOBL1lUXUhj1B4/p7Byubc
	 fPNudI6FYyQqA==
Date: Sun, 17 Nov 2024 12:13:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.13, part 1
Message-ID: <bzixz2b4zkjl2szbrvt7hz2y6txoyhi2wveh7fcprhwnx4rujr@3yqp6aumrjr7>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

I'm a bit late with this pull request as I've been extremely
busy over the last couple of weeks.

I've checked the tag description multiple times to ensure it
won't upset our big boss :-) I hope I've struck the right
balance — descriptive but not overly so. Please feel free to
suggest or recommend any changes.

As I mentioned earlier, I'm slightly behind on reviews and
merges. Thank you for allowing a pull request in the middle of
the merge window (likely next Saturday or Sunday).

In the meantime, if anyone needs me to take a closer look at
anything I've missed, don't hesitate to ping me on those or
reach out privately.

Thank you,
Andi

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.13-p1

for you to fetch changes up to 1922bc245541bd08e3282d8199c8ac703e366111:

  docs: i2c: piix4: Add ACPI section (2024-11-17 11:58:57 +0100)

----------------------------------------------------------------
i2c-host updates for v6.13, part 1

Improvements and Refactoring:

 - All controllers using the 'remove_new' callback have been
   reverted to use the 'remove' callback.

 - Makefile improvements (switched from '*-objs' to '*-y')

 - Intel SCH controller underwent significant refactoring:
   - Improved usage of private data references.
   - Transitioned to memory-mapped I/O functions.
   - Adopted 'devm' functions for resource management.
   - Added kernel-doc compatible comments.
   - Used 'const' where applicable.
   - Numerous smaller refinements.
   This brings love and a modern look to the driver.

 - Additional cleanups in the DesignWare driver.

 - PIIX4 driver updates:
   - Exposed functions and definitions in the header file to
     enable usage by other drivers (e.g., AMD ASF).

 - Nuvoton NPCM I2C controller:
   - Enhanced read/write operations and bus error (BER) flag
     management to address corner cases that could lead to
     timeouts.

 - Qualcomm CCI driver received several cleanups.

 - iMX/MXC:
   - Improved message handling to reduce I2C protocol overhead.
   - Refactored DMA/non-DMA read/write and bus polling mechanisms
     to achieve this.

New Features:

 - i2c-cadence:
   - Added support for atomic transfers.
   - Refactored to group generic code into separate functions.

 - Qualcomm CCI:
   - Added support for a 32MHz serial engine clock.

 - Added support for:
   - HJMC01 DesignWare ACPI HID.
   - ACPI documentation for PIIX4.

Deprecated Features:

 - Dropped support for AMD756 S4882 and NFORCE2 S4985.

New Hardware Support:

 - Added support for:
   - Intel Panther Lake.
   - AMD ASF.
   - S32G2/S32G3 SoCs.
   - Realtek RTL I2C Controller.

 - New drivers:
   - 'i2c-amd-asf-plat.c' for AMD ASF.
   - 'i2c-rtl9300.c' for Realtek RTL.

Fixes:

 - AMD ASF driver:
   - Fixed an uninitialised 'len' variable.

Devicetree Updates:

 - Documented Qualcomm SDM670.
 - Added 'PIC64GX' compatibility to Microchip Core I2C binding.
 - Added support for S32G.

----------------------------------------------------------------
Andy Shevchenko (17):
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

Chris Packham (2):
      dt-bindings: i2c: Add Realtek RTL I2C Controller
      i2c: Add driver for the RTL9300 I2C controller

Ciprian Marian Costea (2):
      dt-bindings: i2c: imx: add SoC specific compatible strings for S32G
      i2c: imx: add support for S32G2/S32G3 SoCs

Hunter Yu (1):
      i2c: designware: Add a new ACPI HID for HJMC01 I2C controller

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Panther Lake

Jean Delvare (1):
      i2c: Drop legacy muxing pseudo-drivers

Jiapeng Chong (1):
      i2c: qcom-cci: Remove the unused variable cci_clk_rate

Konstantin Aladyshev (1):
      docs: i2c: piix4: Add ACPI section

Manikanta Guntupalli (3):
      i2c: cadence: Relocate cdns_i2c_runtime_suspend and cdns_i2c_runtime_resume to facilitate atomic mode
      i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
      i2c: cadence: Add atomic transfer support for controller version 1.4

Manikanta Mylavarapu (1):
      i2c: qcom-geni: Support systems with 32MHz serial engine clock

Pierre-Henry Moussay (1):
      dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with driver

Qianqiang Liu (1):
      i2c: amd-asf: Fix uninitialized variables issue in amd_asf_process_target

Raag Jadav (1):
      i2c: designware: constify abort_sources

Richard Acayan (1):
      dt-bindings: i2c: qcom-cci: Document SDM670 compatible

Shyam Sundar S K (8):
      i2c: piix4: Change the parameter list of piix4_transaction function
      i2c: piix4: Move i2c_piix4 macros and structures to common header
      i2c: piix4: Export i2c_piix4 driver functions as library
      i2c: amd-asf: Add ACPI support for AMD ASF Controller
      i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with SMBus
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

Uwe Kleine-König (1):
      i2c: Switch back to struct platform_driver::remove()

Vladimir Zapolskiy (1):
      i2c: qcom-cci: Remove unused struct member cci_clk_rate

Wolfram Sang (1):
      i2c: qcom-geni: Keep comment why interrupts start disabled

 Documentation/devicetree/bindings/i2c/i2c-imx.yaml |   4 +
 .../devicetree/bindings/i2c/microchip,corei2c.yaml |   4 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  19 +
 .../bindings/i2c/realtek,rtl9301-i2c.yaml          |  69 ++++
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 Documentation/i2c/busses/i2c-piix4.rst             |  63 +++
 MAINTAINERS                                        |  17 +-
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
 drivers/i2c/busses/i2c-cadence.c                   | 425 +++++++++++++++------
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
 drivers/i2c/busses/i2c-imx.c                       | 409 +++++++++++++++++---
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
 drivers/i2c/busses/i2c-rtl9300.c                   | 423 ++++++++++++++++++++
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
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c         |   2 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |   2 +-
 drivers/i2c/muxes/i2c-mux-gpio.c                   |   2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |   2 +-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c                |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   2 +-
 113 files changed, 2116 insertions(+), 1136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c
 delete mode 100644 drivers/i2c/busses/i2c-amd756-s4882.c
 delete mode 100644 drivers/i2c/busses/i2c-nforce2-s4985.c
 create mode 100644 drivers/i2c/busses/i2c-piix4.h
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

