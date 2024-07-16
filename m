Return-Path: <linux-i2c+bounces-4994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549CD932260
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 11:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 601391C21D32
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 09:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B08C17B418;
	Tue, 16 Jul 2024 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIMBdXEZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7474C74;
	Tue, 16 Jul 2024 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721120611; cv=none; b=bdrkPMM3qHg7MiGmK2wZEnT9szHQj06BDMvnbHcuPjDgCsXzNd4Qu95G38PaDK80mc66lh+46JwK40X9k1Uk5yuqK3mAtXBc21c7eYu0U8939DgzUyWkMddnTZEjmjwmdYeuIX4/yIsx4DWe9MJCB6gbokdOKfX4blwoMfytHuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721120611; c=relaxed/simple;
	bh=Zs/iRF0VTf22Js0PoFvljM4MgBJZLqks8tG5TJtnavU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hilsJeemfUHJT+D0UOpYE3AyY6WbKsugfxiD8WpIebx2GyGbsAtgfRp3clPH9JdLWiXo5XwU+W9EXxozVIpY/FCBe1FKghpGpDKIIasni4yziPe4AS2/nnykA7FcTSZvxggfbt22lZGdvag7NQugI4xErbWHBVnelYntdy8TO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIMBdXEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB6BC116B1;
	Tue, 16 Jul 2024 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721120610;
	bh=Zs/iRF0VTf22Js0PoFvljM4MgBJZLqks8tG5TJtnavU=;
	h=Date:From:To:Cc:Subject:From;
	b=FIMBdXEZJ2Mcg1bCueTLfS/uM4zf9MmPLNp2d+ql34t2/uVfFPyli8jXypXD5wSId
	 57c4C2mqBdKGJJcf2fUVi7LTUMsTEUxyJtlL3euAkZtBDKVql6JV+w/z4nuMlO+fmV
	 RrExMq5LenVirrg0sVCvVpb8loyOBz9IAvEDupvbiD/Eb1ljFjd39or7BPVFM2JZDf
	 PdcI8NPMWL0KAsb2m2bB5wSbmWA66xqECZBkJ2b19kOw1pby8rjJxrcmljTjvZtiSx
	 Sqd2eBYZyS4MFr7NnN+asZyiBAsI49KzGMDsMYszuA7GWwn3FJfH5kKsw7S/BltTeC
	 IgQKgXuoQZbkA==
Date: Tue, 16 Jul 2024 11:03:27 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.11-rc1
Message-ID: <ZpY3X1tggZC3s_1X@shikoro>
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
	protocol="application/pgp-signature"; boundary="IrKtSK3EySp/uZPN"
Content-Disposition: inline


--IrKtSK3EySp/uZPN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

there will be a trivial merge conflict because 6.10 gained bd9f5348089b
("i2c: mark HostNotify target address as used") after rc7. The
=2Edriver_data field simply needs to go. Rest should be seamless(tm).

All the best,

   Wolfram


The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.11-rc1

for you to fetch changes up to 5d89b5bdbce3937c86f05ffe19455c3068fd94f7:

  i2c: document new callbacks in i2c_algorithm (2024-07-13 11:11:58 +0200)

----------------------------------------------------------------
Most changes are in the merged requests for I2C host drivers and the
at24 eeprom driver with their own explanations there. The I2C core gains
some documentation updates, a cleanup regarding unneeded 'driver_data'
and more sanity checks in the char device.

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

--IrKtSK3EySp/uZPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaWN18ACgkQFA3kzBSg
KbaVMxAAnvqMNbVBv9RRIlTrpCIdVYbIPbNK6C6XvyWYlCpkP+zspiWVeV/2YbX3
39cTj7x4UskP0qsFGy1CUibUT/g6uc+joG3Kle6WkWE5hrwtvZG3wxvaeoAwRp1e
9CODCsgJ0IGdesu4GDgyKaCHbXEP+38iBfS51nNkIxAwfLxd3ftD87fKDcI23QIV
8QgQYEyv49eBwyl15K5rE+lHUtgOEGW8QQIyGP9MKPIXPjhjBaSnwnXQU9vFmAy3
Z1f2k3fErd8jID1VyAjF3elqYjKsY8t7sXUtWwxNq4o4i3Jit+CoffM+lP6LJx7c
2ZVAj5lgJyDlvw4x1DHOLZVY9vKZ86neTFCpIJiEBQ6sSh3D6Ytk+I62QWUyoPId
8m8kIH1AV8VSkw68bxEwNrKkBY8spPvY1vR2jP+C1WAE+jReZwwVs0yrG4yfiOO2
HsxmWoW2s3v3olnVViOCB7M/LEKCxP7YoWl8F139qqmK1dj0okVcD3IN0K6A82+9
E0wmzYjSeV9+5MbC8Js2/m9djXBxJ8i8tLQkDyGFdaN16GPS5FEyzPlyLyHOKPmX
dyOhyhuNDfoKOJA6PoXSU0LbLVAQR3um3yaNS6E06V32meIkdFkTSBE2ImvSmdGN
WiWNchpjjiGvDCEyxO73tTeLp2boElBuOx1z3VXoTNPhdL2FHL4=
=se6e
-----END PGP SIGNATURE-----

--IrKtSK3EySp/uZPN--

