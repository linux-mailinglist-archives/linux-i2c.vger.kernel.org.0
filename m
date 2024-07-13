Return-Path: <linux-i2c+bounces-4971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AE93049A
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 10:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993711C21437
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463EC446A1;
	Sat, 13 Jul 2024 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbdzxIgA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAC2F2A;
	Sat, 13 Jul 2024 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720861069; cv=none; b=iBSuxFs249fq0ekQ5fKcnGHIovo++6CJgMYrXPvN9a+4nJ/LK4N47oqcZITQc2fJrku5sccZPAaTcFNjcmwyJ65BSBatCVTlZsyUmMaPfEqdkfedbvVlu1uj1gLJy0xgSYwWHfq8XJr3N/tO++B0M751mobU2fIShUcBS+2ZwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720861069; c=relaxed/simple;
	bh=eQHy9Aq5uiTJpp6v4FXGsWqk9+4D+0tP2x7VDhutY88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DW3hvN46RpDlY0H2hXqKmEy1BdCbkE9I6/u45L+T24EUESOvcjQX9RJ+FLZ6wsBomlLNRVT1CYts5ZAhoSm1v6so/57dz2J2rRamSPI/6bS6UoCKa4Jb7/ltNA695jh9+1J4RcE9poiXwN7RtKDZJF7e2wI6JHmeQ6KCx68ant0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbdzxIgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C80C32781;
	Sat, 13 Jul 2024 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720861068;
	bh=eQHy9Aq5uiTJpp6v4FXGsWqk9+4D+0tP2x7VDhutY88=;
	h=Date:From:To:Cc:Subject:From;
	b=RbdzxIgA4dsOGrL1JkQfST8CBXnXAkSAM/xlANAPLaAQXvJ8UamchEtCYrSK6DOS8
	 ihbwLqT9/9C/QqA8AJS5dOZiwY+cFInjbKOFQkvG8H018XF6MiFX8/y4UkjRHnl29g
	 YWQICC+rh5wpjkC4U52HotUlgMjAgFz22AvsRjmrwo01CPAKj0TSKwDRnb0UyiEa0R
	 68f4LwXTF5pCX/wBbUWeoulIHhpwj0wt+8KpVxrX7rcyI+zRrGqRUsc9AzC44VUbPG
	 o7AqF8TTvgOaZdQ5t1m5NMyLq8c6DkbibK0uwbw2x0sZWMAdiTw2npQFZSzqzpMZcr
	 zwG7WwDx23h0w==
Date: Sat, 13 Jul 2024 10:57:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.11
Message-ID: <yxymqbpeuhq52w3ie5nl5pkoojjuybaeodqtrd6uhe2rkmfhfb@3dqr6vefsdxh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Not a massive pull request. The majority of changes relate to the
naming convention updates. Other than that, the holiday period
has given us some slack in the number of patches queued for this
pull request.

There is still one pending documentation fix required for an
issue reported by Stephen that I haven't noticed. I need to add
the documentation check to my workflow. If you don't have the
bandwidth, I can take care of it.

I also have a pending patch for a v2 pull request from Hans de
Goede ("i2c: i801: Use a different adapter name for IDF
adapters") that is waiting for precedence.

I wish you a great rest of the weekend,
Andi

The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.11

for you to fetch changes up to ab1c7ea48f6e225aa40eff3be45a47c7d93cb3b8:

  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains (2024-07-12 01:57:57 +0200)

----------------------------------------------------------------
This release includes significant updates, with the primary
change being the renaming from "master/slave" to
"controller/target" to adhere to I2C v7 and SMBus 3.2 standards.

New Support:

 - Added support for Intel Arrow Lake-H.
 - Added I2C support in the Arioha SoC by linking the Mediatek
   I2C controller.

Cleanups:

 - Added the MODULE_DESCRIPTION() macro, resolving a modpost
   warning in the ALi 1563 Southbridge driver.
 - Constified the regmap_config declaration in the i2c-designware
   driver.
 - Improved the coding style in the Renesas R-Car driver by
   removing unnecessary semicolons after brackets.

General improvements:

 - In the OMAP device, replaced NOIRQ_SYSTEM_SLEEP_PM_OPS with
   RUNTIME_PM_OPS to enable waking up the controller during
   suspend() before suspend_noirq() kicks in.
 - Improved logging in the Xilinx driver.
 - Added a warning (WARN()) in the Renesas R-Car driver for
   spurious interrupts.

DTS Changes:

 - Removed address-cell and size-cell from the Atmel at91sam,
   nVidia Tegra 20, and Samsung S3c2410 devices.
 - Fixed Texas Instruments OMAP4 I2C controller to comply with
   the i2c-controller.yaml schema.
 - Improved indentation in DTS examples for several I2C devices.
 - Converted the NXP LPC1788 binding to the dt-schema.
 - Added documentation for the compatible string
   thead,th1520-i2c.
 - Added the "power-domains" property for the Meson I2C driver.

----------------------------------------------------------------
George Stark (1):
      dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Arrow Lake-H

Javier Carrasco (1):
      i2c: designware: Constify read-only struct regmap_config

Jeff Johnson (1):
      i2c: add missing MODULE_DESCRIPTION() macros

Kanak Shilledar (1):
      dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema

Krzysztof Kozlowski (5):
      dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
      dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
      dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
      dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
      dt-bindings: i2c: adjust indentation in DTS example to coding style

Lorenzo Bianconi (1):
      i2c: mt7621: Add Airoha EN7581 i2c support

Marc Ferland (1):
      i2c: xiic: improve error message when transfer fails to start

Nicolas Ferre (1):
      dt-bindings: i2c: at91: Add sama7d65 compatible string

Thomas Bonnefille (1):
      dt-bindings: i2c: dw: Document compatible thead,th1520-i2c

Thomas Richard (2):
      i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS()
      i2c: omap: wakeup the controller during suspend() callback

Wolfram Sang (62):
      i2c: rcar: WARN about spurious irqs
      i2c: rcar: minor changes to adhere to coding style
      i2c: reword i2c_algorithm according to newest specification
      i2c: ali15x3: reword according to newest specification
      i2c: altera: reword according to newest specification
      i2c: au1550: reword according to newest specification
      i2c: bcm-kona: reword according to newest specification
      i2c: bcm2835: reword according to newest specification
      i2c: brcmstb: reword according to newest specification
      i2c: cht-wc: reword according to newest specification
      i2c: cp2615: reword according to newest specification
      i2c: cros-ec-tunnel: reword according to newest specification
      i2c: davinci: reword according to newest specification
      i2c: digicolor: reword according to newest specification
      i2c: diolan-u2c: reword according to newest specification
      i2c: dln2: reword according to newest specification
      i2c: fsi: reword according to newest specification
      i2c: gpio: reword according to newest specification
      i2c: highlander: reword according to newest specification
      i2c: hisi: reword according to newest specification
      i2c: hix5hd2: reword according to newest specification
      i2c: i801: reword according to newest specification
      i2c: ibm_iic: reword according to newest specification
      i2c: iop3xx: reword according to newest specification
      i2c: isch: reword according to newest specification
      i2c: jz4780: reword according to newest specification
      i2c: kempld: reword according to newest specification
      i2c: ljca: reword according to newest specification
      i2c: lpc2k: reword according to newest specification
      i2c: ls2x: reword according to newest specification
      i2c: mlxcpld: reword according to newest specification
      i2c: mpc: reword according to newest specification
      i2c: mt7621: reword according to newest specification
      i2c: mv64xxx: reword according to newest specification
      i2c: ocores: reword according to newest specification
      i2c: octeon: reword according to newest specification
      i2c: opal: reword according to newest specification
      i2c: owl: reword according to newest specification
      i2c: pasemi: reword according to newest specification
      i2c: piix4: reword according to newest specification
      i2c: powermac: reword according to newest specification
      i2c: pxa-pci: reword according to newest specification
      i2c: riic: reword according to newest specification
      i2c: rk3x: reword according to newest specification
      i2c: robotfuzz-osif: reword according to newest specification
      i2c: rzv2m: reword according to newest specification
      i2c: sis5595: reword according to newest specification
      i2c: sprd: reword according to newest specification
      i2c: stm32f4: reword according to newest specification
      i2c: sun6i-p2wi: reword according to newest specification
      i2c: taos-evm: reword according to newest specification
      i2c: tegra-bpmp: reword according to newest specification
      i2c: thunderx-pcidrv: reword according to newest specification
      i2c: tiny-usb: reword according to newest specification
      i2c: uniphier-f: reword according to newest specification
      i2c: uniphier: reword according to newest specification
      i2c: viperboard: reword according to newest specification
      i2c: viai2c: reword according to newest specification
      i2c: nvidia-gpu: reword according to newest specification
      i2c: virtio: reword according to newest specification
      i2c: cpm: reword according to newest specification
      i2c: st: reword according to newest specification

 .../bindings/i2c/amlogic,meson6-i2c.yaml           |   3 +
 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |  10 +-
 .../devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml  |  28 +++---
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 112 ++++++++++-----------
 .../devicetree/bindings/i2c/i2c-lpc2k.txt          |  33 ------
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |   6 --
 .../devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml   |  54 ++++++++++
 .../devicetree/bindings/i2c/renesas,iic-emev2.yaml |  14 +--
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |  20 ++--
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  34 +++----
 .../bindings/i2c/renesas,rmobile-iic.yaml          |  24 ++---
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   6 --
 .../bindings/i2c/snps,designware-i2c.yaml          |   4 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  66 ++++++------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      |  64 +++++-------
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 MAINTAINERS                                        |   2 +-
 drivers/i2c/busses/Kconfig                         |   3 +-
 drivers/i2c/busses/i2c-ali1563.c                   |   1 +
 drivers/i2c/busses/i2c-ali15x3.c                   |   2 +-
 drivers/i2c/busses/i2c-altera.c                    |   4 +-
 drivers/i2c/busses/i2c-au1550.c                    |  15 ++-
 drivers/i2c/busses/i2c-bcm-kona.c                  |  13 ++-
 drivers/i2c/busses/i2c-bcm2835.c                   |  10 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |  11 +-
 drivers/i2c/busses/i2c-ccgx-ucsi.c                 |   1 +
 drivers/i2c/busses/i2c-cht-wc.c                    |   8 +-
 drivers/i2c/busses/i2c-cp2615.c                    |  10 +-
 drivers/i2c/busses/i2c-cpm.c                       |   4 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |   4 +-
 drivers/i2c/busses/i2c-davinci.c                   |  17 ++--
 drivers/i2c/busses/i2c-designware-platdrv.c        |   2 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   6 +-
 drivers/i2c/busses/i2c-diolan-u2c.c                |   2 +-
 drivers/i2c/busses/i2c-dln2.c                      |   4 +-
 drivers/i2c/busses/i2c-fsi.c                       |  56 +++++------
 drivers/i2c/busses/i2c-gpio.c                      |   8 +-
 drivers/i2c/busses/i2c-highlander.c                |   2 +-
 drivers/i2c/busses/i2c-hisi.c                      |   8 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   6 +-
 drivers/i2c/busses/i2c-i801.c                      |  15 +--
 drivers/i2c/busses/i2c-ibm_iic.c                   |  27 ++---
 drivers/i2c/busses/i2c-iop3xx.c                    |  15 ++-
 drivers/i2c/busses/i2c-isch.c                      |   2 +-
 drivers/i2c/busses/i2c-jz4780.c                    |   4 +-
 drivers/i2c/busses/i2c-kempld.c                    |   4 +-
 drivers/i2c/busses/i2c-ljca.c                      |  20 ++--
 drivers/i2c/busses/i2c-lpc2k.c                     |  10 +-
 drivers/i2c/busses/i2c-ls2x.c                      |  11 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |  14 +--
 drivers/i2c/busses/i2c-mpc.c                       |   4 +-
 drivers/i2c/busses/i2c-mt7621.c                    |  26 ++---
 drivers/i2c/busses/i2c-mv64xxx.c                   |  12 +--
 drivers/i2c/busses/i2c-nvidia-gpu.c                |   7 +-
 drivers/i2c/busses/i2c-ocores.c                    |   8 +-
 drivers/i2c/busses/i2c-octeon-core.c               |   6 +-
 drivers/i2c/busses/i2c-octeon-core.h               |   4 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c            |   2 +-
 drivers/i2c/busses/i2c-omap.c                      |  36 +++++--
 drivers/i2c/busses/i2c-opal.c                      |  10 +-
 drivers/i2c/busses/i2c-owl.c                       |  12 +--
 drivers/i2c/busses/i2c-pasemi-core.c               |   6 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-powermac.c                  |  14 +--
 drivers/i2c/busses/i2c-pxa-pci.c                   |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   1 +
 drivers/i2c/busses/i2c-qup.c                       |   1 +
 drivers/i2c/busses/i2c-rcar.c                      |  13 ++-
 drivers/i2c/busses/i2c-riic.c                      |   8 +-
 drivers/i2c/busses/i2c-rk3x.c                      |  20 ++--
 drivers/i2c/busses/i2c-robotfuzz-osif.c            |   4 +-
 drivers/i2c/busses/i2c-rzv2m.c                     |  12 +--
 drivers/i2c/busses/i2c-sis5595.c                   |   2 +-
 drivers/i2c/busses/i2c-sprd.c                      |  16 +--
 drivers/i2c/busses/i2c-st.c                        |   8 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |   8 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c                |  20 ++--
 drivers/i2c/busses/i2c-taos-evm.c                  |   2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c                |   4 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |   2 +-
 drivers/i2c/busses/i2c-tiny-usb.c                  |   6 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |  26 +++--
 drivers/i2c/busses/i2c-uniphier.c                  |  15 ++-
 drivers/i2c/busses/i2c-viai2c-common.c             |   2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c                |   8 +-
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c            |  12 +--
 drivers/i2c/busses/i2c-viperboard.c                |  10 +-
 drivers/i2c/busses/i2c-virtio.c                    |   2 +-
 drivers/i2c/busses/i2c-xiic.c                      |   9 +-
 include/linux/i2c.h                                |  24 ++++-
 90 files changed, 604 insertions(+), 582 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml

