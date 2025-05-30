Return-Path: <linux-i2c+bounces-11178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D7AC9322
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 18:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC82D7B6255
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0F4235341;
	Fri, 30 May 2025 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKUqyt/N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA228235073;
	Fri, 30 May 2025 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621523; cv=none; b=pCCYw6dm/biHiuUloDkVmWFMXih7UkiXqQHCsu1+u3mLihtRMjr5MyRzPmwLMBSEGcwJ9S4DNJoZAVF0+YJmE79wLV9toUJKy8xx72nkbQv356qeqsZZCLFE5JznirZELgo5n0DX5qFWsWRc14JeXJ219TimAEYxCct2+qHu3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621523; c=relaxed/simple;
	bh=VXDtu8WcS71EWWqqfe+cE5P5dRpKHm04HDkKtFU7tzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6WIYMGa6WcCpQgolWbsSabkHDOHxMW07QYzgzftwGaeSGJBnv8laS05CzFGHcUJlTumSJLg911CzWcBbhnzhjZl3QlDw/8LET9dIAlmxVWaeGfb/q2cNHIS1Zuiby4319sZ2cneedXSnej6rDqQJko7jJwJ8uSyVUJfrjMKoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKUqyt/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9003C4CEE9;
	Fri, 30 May 2025 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748621523;
	bh=VXDtu8WcS71EWWqqfe+cE5P5dRpKHm04HDkKtFU7tzc=;
	h=Date:From:To:Cc:Subject:From;
	b=XKUqyt/NyNxLwjKGeI9hQNOnBU3rUBH/yEJ6QvW0T+YqdDPDM1KRkU7dK448eEUT9
	 1s7oh7NcUvDGgd7ZFFAhFXUgjRZJooWyJejuR2B4D9Xp2iSeJ1BEGWg5DV8Lhim+bz
	 jxev8LiEkU+NP3oNGfa28Oe/ObaCKqgTMg4qvRoRSmS3d5qm/KsYwjByhFPZPXFl+M
	 NuEPUq7H2hOX3SjSNeUrHCAKHdGq2rCdmKYKZrDSVg5sCrqYtwuLZhckbOUpD89J9j
	 3UlQ+9SHUM48Pc05v1K6DZDCBE31SGe5arRlg4S3+wi56K30+Rhd1VQz2fwO6ephXi
	 ThIoa6SzWn3tA==
Date: Fri, 30 May 2025 18:11:59 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.16-rc1
Message-ID: <aDnYz2PB_euziA01@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AEjmkLNbeyZsZEOT"
Content-Disposition: inline


--AEjmkLNbeyZsZEOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

this pull-request will have a merge conflict with the media-tree. You
can find a resolution from the author of the I2C changes here [1]. The
diff there is mangled, sadly. I already asked for a better version. Hope
it arrived when you process this request.

Please pull,

   Wolfram

[1] https://lore.kernel.org/all/3352024.aeNJFYEL58@fw-rgant/



The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc1

for you to fetch changes up to 17b7d785fc7fc94b94acc080e09de4b5023fbc1e:

  i2c: Use str_read_write() helper (2025-05-23 17:28:07 +0200)

----------------------------------------------------------------
i2c-for-6.16-rc1

i2c-core updates

- move towards using the 'fwnode' handle instead of 'of_node'
  (meaning 'of_node' even gets removed from i2c_board_info)
- add support for Write Disable-aware SPD eeproms
- minor stuff (use new helpers, typo fixes)

i2c-atr (address translator) updates

- support per-channel alias pools
- added support for dynamic address translation
  (also adds FPC202 driver as its user)
- add 'static' and 'passthrough' flags

i2c-host updates

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

Andy Shevchenko (9):
      i2c: core: Drop duplicate check before calling OF APIs
      i2c: core: Unify the firmware node type check
      i2c: core: Switch to fwnode APIs to get IRQ
      i2c: core: Reuse fwnode variable where it makes sense
      i2c: core: Do not dereference fwnode in struct device
      i2c: core: Deprecate of_node in struct i2c_board_info
      media: i2c: ds90ub960: Remove of_node assignment
      i2c: qcom-geni: Use generic definitions for bus frequencies
      i2c: designware: Use better constants from units.h

AngeloGioacchino Del Regno (1):
      dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity 1200 MT6893

Arnd Bergmann (1):
      i2c: mlxbf: avoid 64-bit division

Aryan Srivastava (1):
      i2c: octeon: add block-mode i2c operations

Bartosz Golaszewski (1):
      i2c: mux: ltc4306: use new GPIO line value setter callbacks

Chenyuan Yang (1):
      i2c: lpc2k: Add check for clk_enable()

Chris Babroski (2):
      i2c-mlxbf: Add repeated start condition support
      i2c-mlxbf: Improve I2C bus timing configuration

Christophe JAILLET (1):
      i2c: rzv2m: Constify struct i2c_algorithm

Cosmin Tanislav (7):
      i2c: atr: find_mapping() -> get_mapping()
      i2c: atr: split up i2c_atr_get_mapping_by_addr()
      i2c: atr: do not create mapping in detach_addr()
      i2c: atr: deduplicate logic in attach_addr()
      i2c: atr: allow replacing mappings in attach_addr()
      i2c: atr: add static flag
      i2c: atr: add passthrough flag

Dan Carpenter (1):
      i2c: atr: Fix end of loop test in i2c_atr_find_mapping_by_addr()

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

Romain Gantois (9):
      dt-bindings: misc: Describe TI FPC202 dual port controller
      media: i2c: ds90ub960: Replace aliased clients list with address list
      media: i2c: ds90ub960: Protect alias_use_mask with a mutex
      i2c: use client addresses directly in ATR interface
      i2c: move ATR alias pool to a separate struct
      i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
      i2c: support per-channel ATR alias pools
      i2c: Support dynamic address translation
      misc: add FPC202 dual port controller driver

Sudeep Holla (1):
      i2c: xgene-slimpro: Simplify PCC shared memory region handling

Sumanth Gavini (1):
      docs: i2c: Fix "resitors" to "resistors"

Sven Peter (3):
      i2c: pasemi: Use correct bits.h include
      i2c: pasemi: Sort includes alphabetically
      i2c: pasemi: Improve timeout handling

Tali Perry (1):
      i2c: npcm: Add clock toggle recovery

Tan En De (1):
      i2c: designware: Invoke runtime suspend on quick slave re-registration

Tomi Valkeinen (1):
      i2c: atr: Fix lockdep for nested ATRs

Wolfram Sang (4):
      i2c: powermac: convert of_node usage to fwnode
      i2c: use only 'fwnode' for client devices
      i2c: remove 'of_node' member from i2c_boardinfo
      Merge tag 'i2c-host-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow

Xu Yang (1):
      i2c: core: add useful info when defer probe

Yao Zi (1):
      dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528

Yo-Jung (Leo) Lin (1):
      i2c: smbus: introduce Write Disable-aware SPD instantiating functions

Yumeng Fang (1):
      i2c: Use str_read_write() helper

Zhang Songyi (1):
      i2c: npcm7xx: Remove redundant ret variable

prashanth kumar burujukindi (1):
      i2c: microchip-corei2c: add smbus support


with much appreciated quality assurance from
----------------------------------------------------------------
Alyssa Rosenzweig (5):
      (Rev.) i2c: pasemi: Log bus reset causes
      (Rev.) i2c: pasemi: Improve error recovery
      (Rev.) i2c: pasemi: Enable the unjam machine
      (Rev.) i2c: pasemi: Sort includes alphabetically
      (Rev.) i2c: pasemi: Use correct bits.h include

Andi Shyti (4):
      (Rev.) i2c: remove 'of_node' member from i2c_boardinfo
      (Rev.) i2c: use only 'fwnode' for client devices
      (Rev.) i2c: powermac: convert of_node usage to fwnode
      (Rev.) dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528

Andy Shevchenko (3):
      (Rev.) i2c: remove 'of_node' member from i2c_boardinfo
      (Rev.) i2c: use only 'fwnode' for client devices
      (Rev.) i2c: powermac: convert of_node usage to fwnode

Asmaa Mnebhi (2):
      (Rev.) i2c-mlxbf: Improve I2C bus timing configuration
      (Rev.) i2c-mlxbf: Add repeated start condition support

Carlos Song (1):
      (Rev.) i2c: core: add useful info when defer probe

Christopher Obbard (1):
      (Rev.) i2c: qcom-geni: Use generic definitions for bus frequencies

Conor Dooley (1):
      (Rev.) dt-bindings: misc: Describe TI FPC202 dual port controller

Fabrizio Castro (2):
      (Rev.) i2c: riic: Implement bus recovery
      (Rev.) i2c: rzv2m: Constify struct i2c_algorithm

Frank Li (2):
      (Rev.) i2c: core: add useful info when defer probe
      (Rev.) i2c: imx: add some dev_err_probe calls

Geert Uytterhoeven (1):
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/V2N (R9A09G056) support

Guenter Roeck (1):
      (Rev.) i2c: smbus: introduce Write Disable-aware SPD instantiating functions

Heiko Stuebner (1):
      (Rev.) dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528

Khalil Blaiech (2):
      (Rev.) i2c-mlxbf: Improve I2C bus timing configuration
      (Rev.) i2c-mlxbf: Add repeated start condition support

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: i2c-wmt: Convert to YAML
      (Rev.) dt-bindings: i2c: dw: merge duplicate compatible entry.

Linus Walleij (2):
      (Rev.) i2c: mux: ltc4306: use new GPIO line value setter callbacks
      (Rev.) misc: add FPC202 dual port controller driver

Luca Ceresoli (9):
      (Rev.) i2c: atr: add passthrough flag
      (Rev.) i2c: atr: add static flag
      (Rev.) i2c: atr: allow replacing mappings in attach_addr()
      (Rev.) i2c: atr: deduplicate logic in attach_addr()
      (Rev.) i2c: atr: do not create mapping in detach_addr()
      (Rev.) i2c: atr: split up i2c_atr_get_mapping_by_addr()
      (Rev.) i2c: atr: find_mapping() -> get_mapping()
      (Rev.) i2c: atr: Fix lockdep for nested ATRs
      (Rev.) i2c: atr: Fix end of loop test in i2c_atr_find_mapping_by_addr()

Mario Limonciello (1):
      (Rev.) i2c: amd-isp: Add ISP i2c-designware driver

Mukesh Kumar Savaliya (2):
      (Rev.) i2c: npcm: Add clock toggle recovery
      (Rev.) i2c: qcom-geni: Use generic definitions for bus frequencies

Neal Gompa (5):
      (Rev.) i2c: pasemi: Log bus reset causes
      (Rev.) i2c: pasemi: Improve error recovery
      (Rev.) i2c: pasemi: Enable the unjam machine
      (Rev.) i2c: pasemi: Sort includes alphabetically
      (Rev.) i2c: pasemi: Use correct bits.h include

Pratap Nirujogi (1):
      (Rev.) i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP

Romain Gantois (4):
      (Rev.) i2c: atr: add passthrough flag
      (Rev.) i2c: atr: add static flag
      (Rev.) i2c: atr: deduplicate logic in attach_addr()
      (Rev.) i2c: atr: Fix end of loop test in i2c_atr_find_mapping_by_addr()

Sakari Ailus (7):
      (Rev.) media: i2c: ds90ub960: Remove of_node assignment
      (Rev.) i2c: core: Deprecate of_node in struct i2c_board_info
      (Rev.) i2c: core: Do not dereference fwnode in struct device
      (Rev.) i2c: core: Reuse fwnode variable where it makes sense
      (Rev.) i2c: core: Switch to fwnode APIs to get IRQ
      (Rev.) i2c: core: Unify the firmware node type check
      (Rev.) i2c: core: Drop duplicate check before calling OF APIs

Tomi Valkeinen (18):
      (Rev.) i2c: atr: Fix end of loop test in i2c_atr_find_mapping_by_addr()
      (Test) misc: add FPC202 dual port controller driver
      (Test) i2c: Support dynamic address translation
      (Test) i2c: support per-channel ATR alias pools
      (Test) i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
      (Test) i2c: move ATR alias pool to a separate struct
      (Rev.) i2c: use client addresses directly in ATR interface
      (Test) i2c: use client addresses directly in ATR interface
      (Test) media: i2c: ds90ub960: Protect alias_use_mask with a mutex
      (Test) media: i2c: ds90ub960: Replace aliased clients list with address list
      (Test) dt-bindings: misc: Describe TI FPC202 dual port controller
      (Test) media: i2c: ds90ub960: Remove of_node assignment
      (Test) i2c: core: Deprecate of_node in struct i2c_board_info
      (Test) i2c: core: Do not dereference fwnode in struct device
      (Test) i2c: core: Reuse fwnode variable where it makes sense
      (Test) i2c: core: Switch to fwnode APIs to get IRQ
      (Test) i2c: core: Unify the firmware node type check
      (Test) i2c: core: Drop duplicate check before calling OF APIs

Wolfram Sang (3):
      (Rev.) dt-bindings: i2c: renesas,riic: Document RZ/V2N (R9A09G056) support
      (Rev.) i2c: riic: Implement bus recovery
      (Test) i2c: riic: Implement bus recovery

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |   1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  |  24 -
 .../devicetree/bindings/i2c/renesas,riic.yaml      |   1 +
 .../bindings/i2c/snps,designware-i2c.yaml          |  12 +-
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     |  47 ++
 .../devicetree/bindings/misc/ti,fpc202.yaml        |  94 ++++
 Documentation/i2c/busses/i2c-parport.rst           |   2 +-
 MAINTAINERS                                        |  16 +-
 drivers/i2c/algos/i2c-algo-pcf.c                   |   3 +-
 drivers/i2c/busses/Kconfig                         |  13 +-
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-at91-master.c               |   3 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 | 223 ++++----
 drivers/i2c/busses/i2c-davinci.c                   |   3 +-
 drivers/i2c/busses/i2c-designware-amdisp.c         | 205 ++++++++
 drivers/i2c/busses/i2c-designware-common.c         |   4 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   2 +-
 drivers/i2c/busses/i2c-designware-slave.c          |   2 +-
 drivers/i2c/busses/i2c-i801.c                      |   4 +-
 drivers/i2c/busses/i2c-imx.c                       |  12 +-
 drivers/i2c/busses/i2c-ismt.c                      |   2 +-
 drivers/i2c/busses/i2c-lpc2k.c                     |   7 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c         | 102 ++++
 drivers/i2c/busses/i2c-mlxbf.c                     |  87 ++--
 drivers/i2c/busses/i2c-npcm7xx.c                   |  18 +-
 drivers/i2c/busses/i2c-octeon-core.c               | 166 +++++-
 drivers/i2c/busses/i2c-octeon-core.h               |  13 +-
 drivers/i2c/busses/i2c-pasemi-core.c               | 119 ++++-
 drivers/i2c/busses/i2c-pasemi-pci.c                |  10 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-powermac.c                  |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  19 +-
 drivers/i2c/busses/i2c-riic.c                      |  53 +-
 drivers/i2c/busses/i2c-rzv2m.c                     |   2 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   3 +-
 drivers/i2c/busses/i2c-tegra.c                     |   5 +
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |   5 +-
 drivers/i2c/busses/i2c-tiny-usb.c                  |   3 +-
 drivers/i2c/busses/i2c-uniphier-f.c                |  24 +-
 drivers/i2c/busses/i2c-uniphier.c                  |  24 +-
 drivers/i2c/busses/i2c-via.c                       |  15 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c                |  20 +-
 drivers/i2c/busses/i2c-viapro.c                    |  33 +-
 drivers/i2c/busses/i2c-viperboard.c                |  17 +-
 drivers/i2c/busses/i2c-virtio.c                    |   7 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c             |  57 +--
 drivers/i2c/busses/i2c-xiic.c                      |   4 +-
 drivers/i2c/busses/scx200_acb.c                    |   6 +-
 drivers/i2c/i2c-atr.c                              | 570 +++++++++++++++------
 drivers/i2c/i2c-core-base.c                        |  67 ++-
 drivers/i2c/i2c-core-of.c                          |   1 -
 drivers/i2c/i2c-core-slave.c                       |  12 +-
 drivers/i2c/i2c-core-smbus.c                       |   3 +-
 drivers/i2c/i2c-smbus.c                            |  21 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c                |  10 +-
 drivers/media/i2c/ds90ub913.c                      |   9 +-
 drivers/media/i2c/ds90ub953.c                      |   9 +-
 drivers/media/i2c/ds90ub960.c                      |  52 +-
 drivers/misc/Kconfig                               |  12 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ti_fpc202.c                           | 438 ++++++++++++++++
 include/linux/i2c-atr.h                            |  73 ++-
 include/linux/i2c-smbus.h                          |   6 +-
 include/linux/i2c.h                                |   2 -
 65 files changed, 2123 insertions(+), 661 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/ti,fpc202.yaml
 create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
 create mode 100644 drivers/misc/ti_fpc202.c

--AEjmkLNbeyZsZEOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg52M8ACgkQFA3kzBSg
KbYvTA//diGgwRF8XQmNG9jl1DUPR3W0udUHZk16fBNFOaSptMP1uEBWZRfkQ8RD
+weYIph6FINM/EpG4Ze9ERPYkWgOWhBRxKy0DUWrbBl0XR6kxQwQzEK5kYqJgZSV
LDXPS/QjsJcU4THf4SksvdPoJPSWp64+fU1Hs3D+Cbhv96kGpiqdo34z4UPTwAzn
xIQVQCpv5Q+Pb9eL/kmpkLUzjIntIcZZTOUdh6uX7SsumeZp1+q7w8KvdkYmUInq
N6Fo0XKcl3Dcp8v7paEfgni+GKtw/Yxz7HFpvtaOton1hLh76YIsT686Gcc3neOm
D+D8wUVD8ZRI0VFwYKhBwN+OLRSllLqdsnQSurw+K7Id2e5yV99AevKlXEHrOSuP
5u8aLViMkTwfEajhLqQ0Whg+ELXValFyl/P++kT3O12WRDXzLJkx3DsKLTAwq1Ky
WY6a61OJnNKK1pI4nHaze86piW2J/59bFqLuUj2cazNMwHmmSblmUiEKiKzs+XBo
8Ixo/2GP+Fug9NULRw11l93vHdOFAS7GYt9NVX9o5iIr9K8kXSKvpzFOpz7yn9uq
iQ06C0rm1sXeA811wrhisLd+0J1yVF0a9CTP5a09JqKHA0MIqSy5RHHuyT8nlXMP
ToAn700Rh9ZO5PW7dAk0HhGyCD+F08RsJ5RZag8iVh6Hx4RWZpI=
=AMj+
-----END PGP SIGNATURE-----

--AEjmkLNbeyZsZEOT--

