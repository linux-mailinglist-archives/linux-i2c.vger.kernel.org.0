Return-Path: <linux-i2c+bounces-11128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5AAC1FAF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 11:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67A431BA3920
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41AB224256;
	Fri, 23 May 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRf3A7Nm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65B5D8F0;
	Fri, 23 May 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992291; cv=none; b=dW1Kysoj6soV6/rfSSNv54SIoaltspHSUyWgzftMXZirXOivACiCJLirSsK/KlaaEuaibkFK1RzpR/Npwza9RdnF4Hi8TxboDkHpI+lTDzeAl0ccOfhjhk0JxCuuwalLvKInghkG8jw2asgvhc6ByrdviGuww+qesk5XTvdCKyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992291; c=relaxed/simple;
	bh=n83FIuvqZgH7UR8ZIskd3h/2XvNQ6gI+CqfbEbWYlEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNCxDpAxPFZocwgyPSMkgwiUdye6xkclGpMAW7kQ6hSgB9anHIFrP7zq1kveQOPcFHPujSVQKKnjHynTvw4mv19AcpBcpixgG5sskY2Htlg+3GgRdoTHEKv4zzKFUHHgqBJ6Dm85gT4PiC3QAsL5OakxabljgXk06HWYWqcs6J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRf3A7Nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6425C4CEE9;
	Fri, 23 May 2025 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747992290;
	bh=n83FIuvqZgH7UR8ZIskd3h/2XvNQ6gI+CqfbEbWYlEI=;
	h=Date:From:To:Cc:Subject:From;
	b=lRf3A7NmYquDtcwdiZaycsZsA5AnaUIvr6w9Hl5A6wgtjlrUne5ZDwvyjVod16u2/
	 QlxhuQnMiL06BER2uuHE8SecjPR7/ZRpnPK+vfP7CjG72T/Ovm6gaszBFeIXOVdky8
	 Wm31JJL0+swQLbqeyJhUOeQm55G+Xjg7RI6Xdx1omYONVvnijDtO5KZqYAETtZCLIJ
	 DkNKP6N8eqw6mRbYDq4Q06P7l6sJdwUai4kN5SdrCg9J6pxpQC8SwJ+lqoU5Qpcofe
	 v2GfXPyJL+5YOJST0h5jdsogmfwFp9SlFCBaOmCIwhBszxCDUm+ZjqZFDxnVvmPVyX
	 ylfk26KHZlm5Q==
Date: Fri, 23 May 2025 11:24:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.16
Message-ID: <frzddxvvcax5asrhkwaauxdbjqkgdfyoejkmjgozwlcssq7x7e@ra3a7bxvpzgg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Here is a relatively small pull request for 6.16. It mainly
includes cleanups, refactorings, some driver improvements, new
bindings and just one new driver.

A few patches intended for this merge window arrived in the past
couple of weeks, but I chose to leave them out for now. If they
mature and get enough testing, I may send a part 2 pull request
next week. Perhaps I am being a bit too cautious, but because I
have experienced a few build issues this release cycle, I want to
improve the flow and avoid avoidable mistakes.

I wish you a great weekend,
Andi

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.16

for you to fetch changes up to 2b2805404c926b8dcd5c5c13d240722da714906e:

  i2c: mlxbf: avoid 64-bit division (2025-05-23 10:02:27 +0200)

----------------------------------------------------------------
i2c-host updates for v6.16

Cleanups and refactorings
- Many drivers switched to dev_err_probe()
- Generic cleanups applied to designware, iproc, ismt, mlxbf,
  npcm7xx, qcom-geni, pasemi, and thunderx
- davinci: declare I2C mangling support among I2C features
- designware: clean up DTS handling
- designware: fix PM runtime on driver unregister
- imx: improve error logging during probe
- lpc2k: improve checks in probe error path
- xgene-slimpro: improve PCC shared memory handling
- pasemi: improve error handling in reset, smbus clear, timeouts
- tegra: validate buffer length during transfers
- wmt: convert binding to YAML format

Improvements and extended support:
- microchip-core: add SMBus support
- mlxbf: add support for repeated start in block transfers
- mlxbf: improve timer configuration
- npcm: attempt clock toggle recovery before failing init
- octeon: add support for block mode operations
- pasemi: add support for unjam device feature
- riic: add support for bus recovery

New device support:
- MediaTek Dimensity 1200 (MT6893)
- Sophgo SG2044
- Renesas RZ/V2N (R9A09G056)
- Rockchip RK3528
- AMD ISP (new driver)

Core changes:
- i2c-core: add support for Write Disable-aware SPD

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: check msg length in SMBUS block read

Alexander Stein (1):
      i2c: imx: add some dev_err_probe calls

Alexey Charkov (1):
      dt-bindings: i2c: i2c-wmt: Convert to YAML

Andi Shyti (11):
      i2c: iproc: Drop unnecessary initialisation of 'ret'
      i2c: iproc: Use dev_err_probe in probe
      i2c: iproc: Use u32 instead of uint32_t
      i2c: iproc: Fix alignment to match the open parenthesis
      i2c: iproc: Remove stray blank line in slave ISR
      i2c: iproc: Replace udelay() with usleep_range()
      i2c: iproc: Fix indentation of bcm_iproc_i2c_slave_init()
      i2c: iproc: Move function and avoid prototypes
      i2c: iproc: When there's an error treat it as an error
      i2c: iproc: Remove unnecessary double negation
      i2c: mlxbf: Allow build with COMPILE_TEST

Andy Shevchenko (2):
      i2c: qcom-geni: Use generic definitions for bus frequencies
      i2c: designware: Use better constants from units.h

AngeloGioacchino Del Regno (1):
      dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity 1200 MT6893

Arnd Bergmann (1):
      i2c: mlxbf: avoid 64-bit division

Aryan Srivastava (1):
      i2c: octeon: add block-mode i2c operations

Chenyuan Yang (1):
      i2c: lpc2k: Add check for clk_enable()

Chris Babroski (2):
      i2c-mlxbf: Add repeated start condition support
      i2c-mlxbf: Improve I2C bus timing configuration

Christophe JAILLET (1):
      i2c: rzv2m: Constify struct i2c_algorithm

Enrico Zanda (10):
      i2c: uniphier(-f): Replace dev_err() with dev_err_probe() in probe function
      i2c: uniphier: Replace dev_err() with dev_err_probe() in probe function
      i2c: via: Replace dev_err() with dev_err_probe() in probe function
      i2c: viapro: Replace dev_err() with dev_err_probe() in probe function
      i2c: viperboard: Replace dev_err() with dev_err_probe() in probe function
      i2c: virtio: Replace dev_err() with dev_err_probe() in probe function
      i2c: i2c-xiic: Replace dev_err() with dev_err_probe() in probe function
      i2c: scx200_acb: Replace dev_err() with dev_err_probe() in probe function
      i2c: xgene-slimpro: Replace dev_err() with dev_err_probe() in probe function
      i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() in probe function

Feng Wei (1):
      i2c: mlxbf: Use str_read_write() helper

Geert Uytterhoeven (1):
      i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP

Hector Martin (3):
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Log bus reset causes

Heikki Krogerus (1):
      i2c: designware: Don't warn about missing get_clk_rate_khz

Inochi Amaoto (2):
      dt-bindings: i2c: dw: merge duplicate compatible entry.
      dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller

Lad Prabhakar (2):
      i2c: riic: Implement bus recovery
      dt-bindings: i2c: renesas,riic: Document RZ/V2N (R9A09G056) support

Marcus Folkesson (1):
      i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature list

Philipp Stanner (2):
      i2c: ismt: Use non-hybrid PCI devres API
      i2c: thunderx: Use non-hybrid PCI devres API

Pratap Nirujogi (1):
      i2c: amd-isp: Add ISP i2c-designware driver

Sudeep Holla (1):
      i2c: xgene-slimpro: Simplify PCC shared memory region handling

Sven Peter (3):
      i2c: pasemi: Use correct bits.h include
      i2c: pasemi: Sort includes alphabetically
      i2c: pasemi: Improve timeout handling

Tali Perry (1):
      i2c: npcm: Add clock toggle recovery

Tan En De (1):
      i2c: designware: Invoke runtime suspend on quick slave re-registration

Yao Zi (1):
      dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528

Yo-Jung (Leo) Lin (1):
      i2c: smbus: introduce Write Disable-aware SPD instantiating functions

Zhang Songyi (1):
      i2c: npcm7xx: Remove redundant ret variable

prashanth kumar burujukindi (1):
      i2c: microchip-corei2c: add smbus support

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |   1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  |  24 ---
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   1 +
 .../bindings/i2c/snps,designware-i2c.yaml          |  12 +-
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     |  47 +++++
 MAINTAINERS                                        |   9 +-
 drivers/i2c/busses/Kconfig                         |  13 +-
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-bcm-iproc.c                 | 223 ++++++++++-----------
 drivers/i2c/busses/i2c-davinci.c                   |   3 +-
 drivers/i2c/busses/i2c-designware-amdisp.c         | 205 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c         |   4 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   2 +-
 drivers/i2c/busses/i2c-designware-slave.c          |   2 +-
 drivers/i2c/busses/i2c-i801.c                      |   4 +-
 drivers/i2c/busses/i2c-imx.c                       |  12 +-
 drivers/i2c/busses/i2c-ismt.c                      |   2 +-
 drivers/i2c/busses/i2c-lpc2k.c                     |   7 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c         | 102 ++++++++++
 drivers/i2c/busses/i2c-mlxbf.c                     |  87 ++++----
 drivers/i2c/busses/i2c-npcm7xx.c                   |  18 +-
 drivers/i2c/busses/i2c-octeon-core.c               | 166 ++++++++++++++-
 drivers/i2c/busses/i2c-octeon-core.h               |  13 +-
 drivers/i2c/busses/i2c-pasemi-core.c               | 119 ++++++++---
 drivers/i2c/busses/i2c-pasemi-pci.c                |  10 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  19 +-
 drivers/i2c/busses/i2c-riic.c                      |  53 ++++-
 drivers/i2c/busses/i2c-rzv2m.c                     |   2 +-
 drivers/i2c/busses/i2c-tegra.c                     |   5 +
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |   5 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |  24 +--
 drivers/i2c/busses/i2c-uniphier.c                  |  24 +--
 drivers/i2c/busses/i2c-via.c                       |  15 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c                |  20 +-
 drivers/i2c/busses/i2c-viapro.c                    |  33 ++-
 drivers/i2c/busses/i2c-viperboard.c                |  14 +-
 drivers/i2c/busses/i2c-virtio.c                    |   7 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c             |  57 ++----
 drivers/i2c/busses/i2c-xiic.c                      |   4 +-
 drivers/i2c/busses/scx200_acb.c                    |   6 +-
 drivers/i2c/i2c-smbus.c                            |  21 +-
 include/linux/i2c-smbus.h                          |   6 +-
 44 files changed, 1006 insertions(+), 399 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c

