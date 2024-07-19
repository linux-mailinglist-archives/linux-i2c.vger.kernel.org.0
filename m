Return-Path: <linux-i2c+bounces-5035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 500529379AA
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 17:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A792DB20F7E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 15:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3018145356;
	Fri, 19 Jul 2024 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKCkgWXg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CE145359;
	Fri, 19 Jul 2024 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721402003; cv=none; b=Wpmd96LDGtxa5410GRtL4Ns0OrhW9hfmEF8XdbICwenix0n1cxRICu5t0/1P1vqeNeUFVHDSmzCqEuxnna/55Ip9LWY8tq1TrPfEfrdwaB8TnN3sAUrWZAvz0+Tm0p9BwV+UZ17/Z3oP1W5BszPai1Ip/ayK5bfYmyvGfJKkleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721402003; c=relaxed/simple;
	bh=SzHsVmGv2ZCHpBQMcBNhLyRWHe2AjYTuCw6fHGbthXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyzsLuroZ8fM5qR38omIOV7Vo6WiaM7L40INb6UjMa4PpIUi+xs8ify2TYqdpAWGLF5HE89y2VFG+tCCufVv9KOlYACkGV9qa/9GTwR9yKMLdP1nKeZbYJhWFs/kb4TQ1CiYmWkLi9JCPYSV7TilbjCWz4ZTmexXimULLzQ/Tr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKCkgWXg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF19CC32782;
	Fri, 19 Jul 2024 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721402003;
	bh=SzHsVmGv2ZCHpBQMcBNhLyRWHe2AjYTuCw6fHGbthXI=;
	h=Date:From:To:Cc:Subject:From;
	b=eKCkgWXg9PrWcz29fz0l4y3SdEXww/KbuKstn0tITtj/HckHumsHuNscGWVRPVXH7
	 Er+G1K9QSnru1p3QIxI8Vskn1Audqzmm8lez2h9++2hvDuvPH/jd+wDP3e+KLcFv5x
	 TWsNV7ArqAXYeYaSOmcLMxg5dn3gpVMSXR1yuBca3JpKPHBCG68m1TctwZdbVaK+xA
	 7zb0PbLN+UqcwhElmueVyjQvi7pQghVYwxVXZJY1jXHvXQKUjILWAAAQQ+Pk2Axcxz
	 gh/LKpvQVwOWEgS+hEUztVo5wBHYgG0VojwZ+99VY4pZruACGTLjEGDMC7oierY8dL
	 ExIlZ48KLKe3A==
Date: Fri, 19 Jul 2024 17:13:18 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.11-rc1-try2
Message-ID: <ZpqCjrdsScuA7CgO@shikoro>
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
	protocol="application/pgp-signature"; boundary="4o8M8B6Lp1KpRl4A"
Content-Disposition: inline


--4o8M8B6Lp1KpRl4A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

Here is my updated pull request with the summaries of the included
merges. There will be a trivial merge conflict because 6.10 gained
bd9f5348089b ("i2c: mark HostNotify target address as used") after rc7.
The .driver_data field simply needs to go. Please pull.

   Wolfram


The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.11-rc1-try2

for you to fetch changes up to 5d89b5bdbce3937c86f05ffe19455c3068fd94f7:

  i2c: document new callbacks in i2c_algorithm (2024-07-13 11:11:58 +0200)

----------------------------------------------------------------
The I2C core gains documentation updates for the testunit, a cleanup
regarding unneeded 'driver_data' and more sanity checks in the char
device.

For the host drivers, this release includes significant updates, with
the primary change being the renaming from "master/slave" to
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

AT24 EEPROM driver changes:

 - add support for two new Microchip models
 - document even more new models in DT bindings (those use fallback
   compatibles so no code changes)

----------------------------------------------------------------
Andrei Simion (1):
      dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64

Claudiu Beznea (1):
      eeprom: at24: Add support for Microchip 24AA025E48/24AA025E64 EEPROMs

Frieder Schrempf (2):
      dt-bindings: eeprom: at24: Move compatible for Belling BL24C16A to pr=
oper place
      dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B

George Stark (1):
      dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Arrow Lake-H

Javier Carrasco (1):
      i2c: designware: Constify read-only struct regmap_config

Jean Delvare (1):
      i2c: dev: Check for I2C_FUNC_I2C before calling i2c_transfer

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

Uwe Kleine-K=C3=B6nig (1):
      i2c: Drop explicit initialization of struct i2c_device_id::driver_dat=
a to 0

Wolfram Sang (67):
      Documentation: i2c: testunit: use proper reST
      Merge tag 'at24-updates-for-v6.11-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      i2c: add debug message for detected HostNotify alerts
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
      Merge tag 'i2c-host-6.11' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/andi.shyti/linux into i2c/for-mergewindow
      i2c: document new callbacks in i2c_algorithm


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (1):
      (Rev.) i2c: st: reword according to newest specification

Andi Shyti (62):
      (Rev.) i2c: st: reword according to newest specification
      (Rev.) i2c: cpm: reword according to newest specification
      (Rev.) i2c: virtio: reword according to newest specification
      (Rev.) i2c: nvidia-gpu: reword according to newest specification
      (Rev.) i2c: viai2c: reword according to newest specification
      (Rev.) i2c: viperboard: reword according to newest specification
      (Rev.) i2c: uniphier: reword according to newest specification
      (Rev.) i2c: uniphier-f: reword according to newest specification
      (Rev.) i2c: tiny-usb: reword according to newest specification
      (Rev.) i2c: thunderx-pcidrv: reword according to newest specification
      (Rev.) i2c: tegra-bpmp: reword according to newest specification
      (Rev.) i2c: taos-evm: reword according to newest specification
      (Rev.) i2c: sun6i-p2wi: reword according to newest specification
      (Rev.) i2c: stm32f4: reword according to newest specification
      (Rev.) i2c: sprd: reword according to newest specification
      (Rev.) i2c: sis5595: reword according to newest specification
      (Rev.) i2c: rzv2m: reword according to newest specification
      (Rev.) i2c: robotfuzz-osif: reword according to newest specification
      (Rev.) i2c: rk3x: reword according to newest specification
      (Rev.) i2c: riic: reword according to newest specification
      (Rev.) i2c: pxa-pci: reword according to newest specification
      (Rev.) i2c: powermac: reword according to newest specification
      (Rev.) i2c: piix4: reword according to newest specification
      (Rev.) i2c: pasemi: reword according to newest specification
      (Rev.) i2c: owl: reword according to newest specification
      (Rev.) i2c: opal: reword according to newest specification
      (Rev.) i2c: octeon: reword according to newest specification
      (Rev.) i2c: ocores: reword according to newest specification
      (Rev.) i2c: mv64xxx: reword according to newest specification
      (Rev.) i2c: mt7621: reword according to newest specification
      (Rev.) i2c: mpc: reword according to newest specification
      (Rev.) i2c: mlxcpld: reword according to newest specification
      (Rev.) i2c: ls2x: reword according to newest specification
      (Rev.) i2c: lpc2k: reword according to newest specification
      (Rev.) i2c: ljca: reword according to newest specification
      (Rev.) i2c: kempld: reword according to newest specification
      (Rev.) i2c: jz4780: reword according to newest specification
      (Rev.) i2c: isch: reword according to newest specification
      (Rev.) i2c: iop3xx: reword according to newest specification
      (Rev.) i2c: ibm_iic: reword according to newest specification
      (Rev.) i2c: i801: reword according to newest specification
      (Rev.) i2c: hix5hd2: reword according to newest specification
      (Rev.) i2c: hisi: reword according to newest specification
      (Rev.) i2c: highlander: reword according to newest specification
      (Rev.) i2c: gpio: reword according to newest specification
      (Rev.) i2c: fsi: reword according to newest specification
      (Rev.) i2c: dln2: reword according to newest specification
      (Rev.) i2c: diolan-u2c: reword according to newest specification
      (Rev.) i2c: digicolor: reword according to newest specification
      (Rev.) i2c: davinci: reword according to newest specification
      (Rev.) i2c: cros-ec-tunnel: reword according to newest specification
      (Rev.) i2c: cht-wc: reword according to newest specification
      (Rev.) i2c: brcmstb: reword according to newest specification
      (Rev.) i2c: bcm2835: reword according to newest specification
      (Rev.) i2c: bcm-kona: reword according to newest specification
      (Rev.) i2c: au1550: reword according to newest specification
      (Rev.) i2c: altera: reword according to newest specification
      (Rev.) i2c: ali15x3: reword according to newest specification
      (Rev.) i2c: reword i2c_algorithm according to newest specification
      (Rev.) i2c: add debug message for detected HostNotify alerts
      (Rev.) i2c: omap: wakeup the controller during suspend() callback
      (Rev.) i2c: dev: Check for I2C_FUNC_I2C before calling i2c_transfer

AngeloGioacchino Del Regno (2):
      (Rev.) i2c: mt7621: reword according to newest specification
      (Rev.) i2c: mt7621: Add Airoha EN7581 i2c support

Baolin Wang (1):
      (Rev.) i2c: sprd: reword according to newest specification

Chris Packham (1):
      (Rev.) i2c: mpc: reword according to newest specification

Conor Dooley (6):
      (Rev.) dt-bindings: i2c: adjust indentation in DTS example to coding =
style
      (Rev.) dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml sche=
ma
      (Rev.) dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-=
cells
      (Rev.) dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-c=
ells
      (Rev.) dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-ce=
lls
      (Rev.) dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64

Eddie James (1):
      (Rev.) i2c: fsi: reword according to newest specification

Florian Fainelli (3):
      (Rev.) i2c: brcmstb: reword according to newest specification
      (Rev.) i2c: bcm2835: reword according to newest specification
      (Rev.) i2c: bcm-kona: reword according to newest specification

Hans de Goede (1):
      (Rev.) i2c: cht-wc: reword according to newest specification

Heiko Stuebner (1):
      (Rev.) i2c: rk3x: reword according to newest specification

Jarkko Nikula (1):
      (Rev.) dt-bindings: i2c: dw: Document compatible thead,th1520-i2c

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema

Neil Armstrong (1):
      (Rev.) dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domai=
ns

Ray Liu (1):
      (Test) i2c: mt7621: Add Airoha EN7581 i2c support

Rob Herring (Arm) (1):
      (Rev.) dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domai=
ns

Stefan Roese (1):
      (Rev.) i2c: mt7621: reword according to newest specification

Tony Lindgren (1):
      (Rev.) i2c: omap: wakeup the controller during suspend() callback

 Documentation/devicetree/bindings/eeprom/at24.yaml |  18 ++-
 .../bindings/i2c/amlogic,meson6-i2c.yaml           |   3 +
 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |  10 +-
 .../devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml  |  28 ++---
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 112 +++++++++---------
 .../devicetree/bindings/i2c/i2c-lpc2k.txt          |  33 ------
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |   6 -
 .../devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml   |  54 +++++++++
 .../devicetree/bindings/i2c/renesas,iic-emev2.yaml |  14 +--
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |  20 ++--
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  34 +++---
 .../bindings/i2c/renesas,rmobile-iic.yaml          |  24 ++--
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   6 -
 .../bindings/i2c/snps,designware-i2c.yaml          |   4 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  66 +++++------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      |  64 +++++------
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 Documentation/i2c/slave-testunit-backend.rst       | 127 ++++++++++++++---=
----
 MAINTAINERS                                        |   2 +-
 drivers/i2c/busses/Kconfig                         |   3 +-
 drivers/i2c/busses/i2c-ali1563.c                   |   1 +
 drivers/i2c/busses/i2c-ali15x3.c                   |   2 +-
 drivers/i2c/busses/i2c-altera.c                    |   4 +-
 drivers/i2c/busses/i2c-au1550.c                    |  15 ++-
 drivers/i2c/busses/i2c-bcm-kona.c                  |  13 +--
 drivers/i2c/busses/i2c-bcm2835.c                   |  10 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |  11 +-
 drivers/i2c/busses/i2c-ccgx-ucsi.c                 |   1 +
 drivers/i2c/busses/i2c-cht-wc.c                    |   8 +-
 drivers/i2c/busses/i2c-cp2615.c                    |  10 +-
 drivers/i2c/busses/i2c-cpm.c                       |   4 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |   4 +-
 drivers/i2c/busses/i2c-davinci.c                   |  17 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   2 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   6 +-
 drivers/i2c/busses/i2c-diolan-u2c.c                |   2 +-
 drivers/i2c/busses/i2c-dln2.c                      |   4 +-
 drivers/i2c/busses/i2c-fsi.c                       |  56 ++++-----
 drivers/i2c/busses/i2c-gpio.c                      |   8 +-
 drivers/i2c/busses/i2c-highlander.c                |   2 +-
 drivers/i2c/busses/i2c-hisi.c                      |   8 +-
 drivers/i2c/busses/i2c-hix5hd2.c                   |   6 +-
 drivers/i2c/busses/i2c-i801.c                      |  15 ++-
 drivers/i2c/busses/i2c-ibm_iic.c                   |  27 ++---
 drivers/i2c/busses/i2c-iop3xx.c                    |  15 +--
 drivers/i2c/busses/i2c-isch.c                      |   2 +-
 drivers/i2c/busses/i2c-jz4780.c                    |   4 +-
 drivers/i2c/busses/i2c-kempld.c                    |   4 +-
 drivers/i2c/busses/i2c-ljca.c                      |  20 ++--
 drivers/i2c/busses/i2c-lpc2k.c                     |  10 +-
 drivers/i2c/busses/i2c-ls2x.c                      |  11 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |  14 +--
 drivers/i2c/busses/i2c-mpc.c                       |   4 +-
 drivers/i2c/busses/i2c-mt7621.c                    |  26 ++---
 drivers/i2c/busses/i2c-mv64xxx.c                   |  12 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |   7 +-
 drivers/i2c/busses/i2c-ocores.c                    |   8 +-
 drivers/i2c/busses/i2c-octeon-core.c               |   6 +-
 drivers/i2c/busses/i2c-octeon-core.h               |   4 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c            |   2 +-
 drivers/i2c/busses/i2c-omap.c                      |  36 ++++--
 drivers/i2c/busses/i2c-opal.c                      |  10 +-
 drivers/i2c/busses/i2c-owl.c                       |  12 +-
 drivers/i2c/busses/i2c-pasemi-core.c               |   6 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-powermac.c                  |  14 +--
 drivers/i2c/busses/i2c-pxa-pci.c                   |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   1 +
 drivers/i2c/busses/i2c-qup.c                       |   1 +
 drivers/i2c/busses/i2c-rcar.c                      |  13 +--
 drivers/i2c/busses/i2c-riic.c                      |   8 +-
 drivers/i2c/busses/i2c-rk3x.c                      |  20 ++--
 drivers/i2c/busses/i2c-robotfuzz-osif.c            |   4 +-
 drivers/i2c/busses/i2c-rzv2m.c                     |  12 +-
 drivers/i2c/busses/i2c-sis5595.c                   |   2 +-
 drivers/i2c/busses/i2c-sprd.c                      |  16 +--
 drivers/i2c/busses/i2c-st.c                        |   8 +-
 drivers/i2c/busses/i2c-stm32f4.c                   |   8 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c                |  20 ++--
 drivers/i2c/busses/i2c-taos-evm.c                  |   2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c                |   4 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |   2 +-
 drivers/i2c/busses/i2c-tiny-usb.c                  |   6 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |  26 ++---
 drivers/i2c/busses/i2c-uniphier.c                  |  15 ++-
 drivers/i2c/busses/i2c-viai2c-common.c             |   2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c                |   8 +-
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c            |  12 +-
 drivers/i2c/busses/i2c-viperboard.c                |  10 +-
 drivers/i2c/busses/i2c-virtio.c                    |   2 +-
 drivers/i2c/busses/i2c-xiic.c                      |   9 +-
 drivers/i2c/i2c-core-base.c                        |   6 +-
 drivers/i2c/i2c-dev.c                              |  12 ++
 drivers/i2c/i2c-slave-testunit.c                   |   2 +-
 drivers/i2c/i2c-smbus.c                            |   2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c                |   2 +-
 drivers/misc/eeprom/at24.c                         |   8 ++
 include/linux/i2c.h                                |  44 +++++--
 98 files changed, 744 insertions(+), 639 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.y=
aml

--4o8M8B6Lp1KpRl4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaago4ACgkQFA3kzBSg
KbYJQRAApr9lzEDL2uVfTb9mXzA0ZxGfgi0PmN3S7kC0IB5DCrN9x5N1akkmKG/j
47d4rl+nzl8aenOGMqYS6iXqJ/og9eD+vTlG8uhcAfH/jEM/dI76R/a2NAUaf3tI
kZRBXepui1hPONQ+hvZdxT0JT137+QuK+7wWwS8beTJMXBzedeEFSewt4fv/Y9IQ
ESaJ/7a+YvKR6YNZJFbGgRDBOcF1t+tpFtnkvOHe22SSYeiei6eJpiJK2l92xslZ
K0LZUbqySngVHD/1k7QIZoe/Csx0uOcLQygKJcs6YYSFucGghqH9XAioTCNi1X2z
YZx9+Z1oknVJCMtEFtOptbr6Cwzdx0wUQah6mmFmHrGXQJcz4X++8PvrW4seVdpU
RioBpTfpIW8hJoj5CQAYGuKNrjdDyCMUxfMuGEtBAc0Shw7ScJU+bowSZ1rbOpgj
0A55/YgFav+T3+DpZSh9HFiXTVB7I2MwmglVVzdb9PMTTF25k/7oYcE+rR70Gey5
4RfD0NzMY551m9SvClm+MqPe69PNm/bKrRHOjMDAGRhO+Xmnbg0eGetHz1A4HGel
352CzRCrwByY9TNm5FoPSxGF00mV2HMPfVLIkgajRGwZpdazh7I9Gk9FhaXNWsmp
qaqKbzaEQuUFU8KJZUg/nCgLuN/fcTE8YY49PAQtFFqvbyf3oPs=
=Mz0n
-----END PGP SIGNATURE-----

--4o8M8B6Lp1KpRl4A--

