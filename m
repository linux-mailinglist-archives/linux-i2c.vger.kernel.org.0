Return-Path: <linux-i2c+bounces-1364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3133830EA4
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 22:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F3371C21FCD
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 21:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE35F25577;
	Wed, 17 Jan 2024 21:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlCwxdXy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795CB24A05;
	Wed, 17 Jan 2024 21:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705527027; cv=none; b=bhGibZ4+xSpA6GJGGftXe7nIL4Z1iToPwRRTCcGFQe0rjkvmR1I9UPtpceOHZRq9ooBDJPV2fZk9EdL6WkzrOz8utNCt6ZJuZj2LguCszGdGovEgA2yXrsLtHRe1Xfvp6TD/l/fVyD3A4Y/0IGL3De96AaBsV8smJvfqvF9W/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705527027; c=relaxed/simple;
	bh=p5oTawWRkoP/5TNXLGu/CTglFDUorkjOLgytgyRHcQg=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition; b=Wb+/25lFo+olEUiZ15BTG3WS6aOqeD13WnkMm3e9cTYa7qwf+Gyq1p1CSlEpS8mk1YRDfE7TPM/xtIetINJppMVuii8cyXMIXy0R9PV6WcVxO2J7opuA9MCjwvQMkESpm6I4v40GVYKSKh2IWgRhe2UUKcPKf2QxgkaD9Y5q8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlCwxdXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FE5C433F1;
	Wed, 17 Jan 2024 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705527026;
	bh=p5oTawWRkoP/5TNXLGu/CTglFDUorkjOLgytgyRHcQg=;
	h=Date:From:To:Cc:Subject:From;
	b=PlCwxdXyeJbrDouFGQvjZKzldqpBJDU9yeyLDwXnNbZ4aAugbobJXa/aPJU5LLLEM
	 nSoL4QWQawg8aIofatLa4GnOzcl7o8XWOv11SWm9dAxNcCF5aCdRdRqyq6SJT6lCl1
	 GboKIWs3VhiQi8zi/LNSsYbJNdvRcIbppOpZYboJJq2zmxxTuzj1LGSlkRYNS2ge1V
	 H43ZKQuWuf83SpOy9lDV2yopwnoQtYho1GOeMR2sdSjrU+Alesj3KcPezWjokmGcPJ
	 xrnvT2aFxJhOKDNx9BfM183G3bUcawcwvaxs8l/HHcI7Bzr/AgjY+6mxWXZLubBwUL
	 IIRafAKUqTKXA==
Date: Wed, 17 Jan 2024 22:30:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PULL REQUEST] i2c-for-6.8-rc1-fixed
Message-ID: <ZahG7xgHJ4Tf8mHI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CxGdaZN1dWPpI1UJ"
Content-Disposition: inline


--CxGdaZN1dWPpI1UJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc1-fixed

for you to fetch changes up to 77fbab12e7e7b381dcf4ac523dfc3bfcbf5e2698:

  Revert "i2c: designware: Fix PM calls order in dw_i2c_plat_probe()" (2024-01-17 22:19:51 +0100)

----------------------------------------------------------------
This cycle, I2C removes the currently unused CLASS_DDC support
(controllers set the flag, but there is no client to use it). Also,
CLASS_SPD support gets simplified to prepare removal in the future.
Class based instantiation is not recommended these days anyhow.
Furthermore, I2C core now creates a debugfs directory per I2C adapter.
Current bus driver users were converted to use it. Then, there are also
quite some driver updates. Standing out are patches for the wmt-driver
which is refactored to support more variants. And a big series for the
designware-driver needed to be reverted because issues have been
reported late in the cycle and no incremental fix has been found yet.
This is the fixed pull requested with a missing revert added.

----------------------------------------------------------------
Alain Volmat (6):
      i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq
      i2c: stm32f7: perform most of irq job in threaded handler
      i2c: stm32f7: simplify status messages in case of errors
      dt-bindings: i2c: document st,stm32mp25-i2c compatible
      i2c: stm32f7: perform I2C_ISR read once at beginning of event isr
      i2c: stm32f7: add support for stm32mp25 soc

Alexander Stein (1):
      i2c: imx: Make SDA actually optional for bus recovering

Andy Shevchenko (24):
      i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
      i2c: designware: Fix reset call order in dw_i2c_plat_probe()
      i2c: designware: Let PCI core to take care about interrupt vectors
      i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
      i2c: designware: Replace a while-loop by for-loop
      i2c: designware: Save pointer to semaphore callbacks instead of index
      i2c: designware: Add missing 'c' into PCI IDs variable name
      i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      i2c: designware: Unify terminator in device ID tables
      i2c: designware: Always provide device ID tables
      i2c: designware: Drop return value from i2c_dw_acpi_configure()
      i2c: designware: Drop return value from dw_i2c_of_configure()
      i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
      i2c: designware: Consolidate firmware parsing and configuring code
      i2c: designware: Unify the firmware type checks
      i2c: designware: Move exports to I2C_DW namespaces
      i2c: designware: Remove ->disable() callback
      i2c: designware: Consolidate PM ops
      i2c: designware: Uninline i2c_dw_probe()
      i2c: designware: Propagate firmware node
      i2c: designware: Use pci_get_drvdata()
      i2c: designware: Use temporary variable for struct device
      i2c: designware: Get rid of redundant 'else'
      i2c: designware: Fix spelling and other issues in the comments

Bartosz Golaszewski (1):
      eeprom: at24: use of_match_ptr()

Christophe Leroy (1):
      i2c: cpm: Remove linux,i2c-index conversion from be32

Greg Kroah-Hartman (1):
      i2c: make i2c_bus_type const

Hans Hu (5):
      i2c: wmt: Reduce redundant: bus busy check
      i2c: wmt: Reduce redundant: wait event complete
      i2c: wmt: Reduce redundant: clock mode setting
      i2c: wmt: Reduce redundant: function parameter
      i2c: wmt: Reduce redundant: REG_CR setting

Heiner Kallweit (9):
      drm: remove I2C_CLASS_DDC support
      fbdev: remove I2C_CLASS_DDC support
      include/linux/i2c.h: remove I2C_CLASS_DDC support
      drm/amd/pm: Remove I2C_CLASS_SPD support
      i2c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      i2c: stub: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      media: netup_unidvb: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      staging: greybus: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      i2c: mux: reg: Remove class-based device auto-detection support

Jean Delvare (1):
      i2c: smbus: Support up to 8 SPD EEPROMs

Marek Szyprowski (3):
      i2c: s3c24xx: fix read transfers in polling mode
      i2c: s3c24xx: fix transferring more than one message in polling mode
      i2c: s3c24xx: add support for atomic transfers

Paul Menzel (2):
      i2c: i801: Add lis3lv02d for Dell Precision 3540
      i2c: i801: Add lis3lv02d for Dell XPS 15 7590

Philipp Zabel (1):
      dt-bindings: at24: add ROHM BR24G04

Tim Lunn (1):
      i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126

Wolfram Sang (32):
      Merge branch 'i2c/remove-ddc-class-immutable' into i2c/for-mergewindow
      i2c: create debugfs entry per adapter
      i2c: gpio: move to per-adapter debugfs directory
      i2c: npcm7xx: move to per-adapter debugfs directory
      i2c: rcar: introduce Gen4 devices
      i2c: rcar: add FastMode+ support for Gen4
      Merge tag 'at24-updates-for-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      MAINTAINERS: use proper email for my I2C work
      Revert "i2c: designware: Fix spelling and other issues in the comments"
      Revert "i2c: designware: Get rid of redundant 'else'"
      Revert "i2c: designware: Use temporary variable for struct device"
      Revert "i2c: designware: Use pci_get_drvdata()"
      Revert "i2c: designware: Propagate firmware node"
      Revert "i2c: designware: Uninline i2c_dw_probe()"
      Revert "i2c: designware: Consolidate PM ops"
      Revert "i2c: designware: Remove ->disable() callback"
      Revert "i2c: designware: Move exports to I2C_DW namespaces"
      Revert "i2c: designware: Unify the firmware type checks"
      Revert "i2c: designware: Consolidate firmware parsing and configuring code"
      Revert "i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()"
      Revert "i2c: designware: Drop return value from dw_i2c_of_configure()"
      Revert "i2c: designware: Drop return value from i2c_dw_acpi_configure()"
      Revert "i2c: designware: Always provide device ID tables"
      Revert "i2c: designware: Unify terminator in device ID tables"
      Revert "i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()"
      Revert "i2c: designware: Add missing 'c' into PCI IDs variable name"
      Revert "i2c: designware: Save pointer to semaphore callbacks instead of index"
      Revert "i2c: designware: Replace a while-loop by for-loop"
      Revert "i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()"
      Revert "i2c: designware: Let PCI core to take care about interrupt vectors"
      Revert "i2c: designware: Fix reset call order in dw_i2c_plat_probe()"
      Revert "i2c: designware: Fix PM calls order in dw_i2c_plat_probe()"


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (37):
      (Rev.) i2c: stm32f7: simplify status messages in case of errors
      (Rev.) i2c: stm32f7: perform most of irq job in threaded handler
      (Rev.) i2c: i801: Add lis3lv02d for Dell XPS 15 7590
      (Rev.) i2c: i801: Add lis3lv02d for Dell Precision 3540
      (Rev.) i2c: cpm: Remove linux,i2c-index conversion from be32
      (Rev.) i2c: imx: Make SDA actually optional for bus recovering
      (Rev.) i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
      (Rev.) i2c: s3c24xx: add support for atomic transfers
      (Rev.) i2c: s3c24xx: fix transferring more than one message in polling mode
      (Rev.) i2c: s3c24xx: fix read transfers in polling mode
      (Rev.) i2c: rcar: add FastMode+ support for Gen4
      (Rev.) i2c: rcar: introduce Gen4 devices
      (Rev.) i2c: designware: Fix spelling and other issues in the comments
      (Rev.) i2c: designware: Get rid of redundant 'else'
      (Rev.) i2c: designware: Use temporary variable for struct device
      (Rev.) i2c: designware: Use pci_get_drvdata()
      (Rev.) i2c: designware: Propagate firmware node
      (Rev.) i2c: designware: Uninline i2c_dw_probe()
      (Rev.) i2c: designware: Consolidate PM ops
      (Rev.) i2c: designware: Remove ->disable() callback
      (Rev.) i2c: designware: Move exports to I2C_DW namespaces
      (Rev.) i2c: designware: Unify the firmware type checks
      (Rev.) i2c: designware: Consolidate firmware parsing and configuring code
      (Rev.) i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
      (Rev.) i2c: designware: Drop return value from dw_i2c_of_configure()
      (Rev.) i2c: designware: Drop return value from i2c_dw_acpi_configure()
      (Rev.) i2c: designware: Always provide device ID tables
      (Rev.) i2c: designware: Unify terminator in device ID tables
      (Rev.) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      (Rev.) i2c: designware: Add missing 'c' into PCI IDs variable name
      (Rev.) i2c: designware: Save pointer to semaphore callbacks instead of index
      (Rev.) i2c: designware: Replace a while-loop by for-loop
      (Rev.) i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
      (Rev.) i2c: designware: Let PCI core to take care about interrupt vectors
      (Rev.) i2c: designware: Fix reset call order in dw_i2c_plat_probe()
      (Rev.) i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
      (Rev.) drm: remove I2C_CLASS_DDC support

AngeloGioacchino Del Regno (1):
      (Rev.) drm: remove I2C_CLASS_DDC support

Chanho Park (2):
      (Rev.) i2c: s3c24xx: add support for atomic transfers
      (Rev.) i2c: s3c24xx: fix read transfers in polling mode

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: document st,stm32mp25-i2c compatible

Geert Uytterhoeven (2):
      (Rev.) i2c: rcar: add FastMode+ support for Gen4
      (Rev.) i2c: rcar: introduce Gen4 devices

Jarkko Nikula (1):
      (Test) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()

Mario Limonciello (11):
      (Rev.) i2c: designware: Fix spelling and other issues in the comments
      (Rev.) i2c: designware: Get rid of redundant 'else'
      (Rev.) i2c: designware: Use temporary variable for struct device
      (Rev.) i2c: designware: Unify the firmware type checks
      (Rev.) i2c: designware: Consolidate firmware parsing and configuring code
      (Rev.) i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
      (Rev.) i2c: designware: Drop return value from dw_i2c_of_configure()
      (Rev.) i2c: designware: Always provide device ID tables
      (Rev.) i2c: designware: Unify terminator in device ID tables
      (Rev.) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      (Rev.) i2c: designware: Replace a while-loop by for-loop

Neil Armstrong (1):
      (Rev.) drm: remove I2C_CLASS_DDC support

Oleksij Rempel (1):
      (Rev.) i2c: imx: Make SDA actually optional for bus recovering

Serge Semin (24):
      (Test) i2c: designware: Fix spelling and other issues in the comments
      (Test) i2c: designware: Get rid of redundant 'else'
      (Test) i2c: designware: Use temporary variable for struct device
      (Test) i2c: designware: Use pci_get_drvdata()
      (Test) i2c: designware: Propagate firmware node
      (Test) i2c: designware: Uninline i2c_dw_probe()
      (Test) i2c: designware: Consolidate PM ops
      (Test) i2c: designware: Remove ->disable() callback
      (Test) i2c: designware: Move exports to I2C_DW namespaces
      (Test) i2c: designware: Unify the firmware type checks
      (Test) i2c: designware: Consolidate firmware parsing and configuring code
      (Test) i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
      (Test) i2c: designware: Drop return value from dw_i2c_of_configure()
      (Test) i2c: designware: Drop return value from i2c_dw_acpi_configure()
      (Test) i2c: designware: Always provide device ID tables
      (Test) i2c: designware: Unify terminator in device ID tables
      (Test) i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      (Test) i2c: designware: Add missing 'c' into PCI IDs variable name
      (Test) i2c: designware: Save pointer to semaphore callbacks instead of index
      (Test) i2c: designware: Replace a while-loop by for-loop
      (Test) i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
      (Test) i2c: designware: Let PCI core to take care about interrupt vectors
      (Test) i2c: designware: Fix reset call order in dw_i2c_plat_probe()
      (Test) i2c: designware: Fix PM calls order in dw_i2c_plat_probe()

Tali Perry (1):
      (Rev.) i2c: npcm7xx: move to per-adapter debugfs directory

Thomas Zimmermann (1):
      (Rev.) drm: remove I2C_CLASS_DDC support

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  28 ++
 MAINTAINERS                                        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   1 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   1 -
 drivers/gpu/drm/ast/ast_i2c.c                      |   1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   1 -
 drivers/gpu/drm/display/drm_dp_helper.c            |   1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   1 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   1 -
 drivers/gpu/drm/gma500/intel_gmbus.c               |   1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c         |   1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |   1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   1 -
 drivers/gpu/drm/loongson/lsdc_i2c.c                |   1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   1 -
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |   1 -
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |   1 -
 drivers/gpu/drm/radeon/radeon_i2c.c                |   1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c             |   1 -
 drivers/i2c/busses/i2c-ali1535.c                   |   2 +-
 drivers/i2c/busses/i2c-ali1563.c                   |   2 +-
 drivers/i2c/busses/i2c-ali15x3.c                   |   2 +-
 drivers/i2c/busses/i2c-amd756.c                    |   2 +-
 drivers/i2c/busses/i2c-amd8111.c                   |   2 +-
 drivers/i2c/busses/i2c-cpm.c                       |   2 +-
 drivers/i2c/busses/i2c-elektor.c                   |   2 +-
 drivers/i2c/busses/i2c-gpio.c                      |  36 +--
 drivers/i2c/busses/i2c-i801.c                      |   2 +
 drivers/i2c/busses/i2c-ibm_iic.c                   |   2 +-
 drivers/i2c/busses/i2c-imx.c                       |   2 +-
 drivers/i2c/busses/i2c-iop3xx.c                    |   2 +-
 drivers/i2c/busses/i2c-isch.c                      |   2 +-
 drivers/i2c/busses/i2c-kempld.c                    |   3 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |   2 +-
 drivers/i2c/busses/i2c-nforce2.c                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   |  49 +--
 drivers/i2c/busses/i2c-pasemi-pci.c                |   2 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-rcar.c                      |  51 ++-
 drivers/i2c/busses/i2c-rk3x.c                      |   8 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |  61 ++--
 drivers/i2c/busses/i2c-scmi.c                      |   2 +-
 drivers/i2c/busses/i2c-sh7760.c                    |   2 +-
 drivers/i2c/busses/i2c-sibyte.c                    |   4 +-
 drivers/i2c/busses/i2c-sis5595.c                   |   2 +-
 drivers/i2c/busses/i2c-sis630.c                    |   2 +-
 drivers/i2c/busses/i2c-sis96x.c                    |   2 +-
 drivers/i2c/busses/i2c-stm32f7.c                   | 342 +++++++++++----------
 drivers/i2c/busses/i2c-via.c                       |   2 +-
 drivers/i2c/busses/i2c-viapro.c                    |   2 +-
 drivers/i2c/busses/i2c-wmt.c                       | 117 ++-----
 drivers/i2c/busses/scx200_acb.c                    |   2 +-
 drivers/i2c/i2c-core-base.c                        |  13 +-
 drivers/i2c/i2c-smbus.c                            |   8 +-
 drivers/i2c/i2c-stub.c                             |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   4 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |   2 +-
 drivers/misc/eeprom/at24.c                         |   5 +-
 drivers/staging/greybus/i2c.c                      |   2 +-
 drivers/video/fbdev/core/fb_ddc.c                  |   1 -
 drivers/video/fbdev/cyber2000fb.c                  |   1 -
 drivers/video/fbdev/i740fb.c                       |   1 -
 drivers/video/fbdev/intelfb/intelfb_i2c.c          |  15 +-
 drivers/video/fbdev/matrox/i2c-matroxfb.c          |  15 +-
 drivers/video/fbdev/s3fb.c                         |   1 -
 drivers/video/fbdev/tdfxfb.c                       |   1 -
 drivers/video/fbdev/tridentfb.c                    |   1 -
 drivers/video/fbdev/via/via_i2c.c                  |   1 -
 include/linux/i2c.h                                |   5 +-
 include/linux/platform_data/i2c-mux-reg.h          |   2 -
 sound/soc/rockchip/rk3399_gru_sound.c              |   2 +-
 79 files changed, 401 insertions(+), 455 deletions(-)

--CxGdaZN1dWPpI1UJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWoRu8ACgkQFA3kzBSg
KbY01g//Uj+KhpM6i47oAkgselui0MqEHcHHq7555O8cur3wCmWFO+DILuzeUbUl
TqRu76repzJgQYF/w3RegydAcGay8yykyModuk7Pn69+4Z2WtOD6nP9qy97cgrIP
jyDMrEuxfLYNb/KxSkhwHtNky5rvz9Jp8/QOioU2cDKGV0e1AhvrCEfmDQ9DaKt9
Nc48kqTpdZtSYSv5TeZHh5ZTW+BxTCyDPAA4SuLI6RrFT4q7BPp7HRNNUqw5bqfs
YvVt9RC9hSia1XRDCcJAnRGLMQRwVuUs0B14TSjvobCpqe36Yif6lLVpTiBpNuHj
7VwV0UdllOiQuWIZHJjKuweEADP8tKlnMWSlyepTfN1QQZ26Mlgcm4HZQHkrmANb
oDdLwj/2LxpZ4734tIp1l3PmFkbg8zDSrtGDoVypyKFkvg2+JPNuLqPtvCFPtQJp
Fr/U7YUTBqL9w6lFUfh2LEMwMj1oUisCCgh0b1JcRn+jJvBAwsdj24Q5Mk+RTfQP
IEtI03iftoNvM07QCsHruAMir/2W5SGMeV5L5ipn0d+3MsVUGFDiLIiLBssuJrnl
/O+2Pm1xyoLogvrS+K5sYLPnzTYGnRYG00zt6Cp5D8u7PIIOOflAd+ZW3fyeKbdV
AK8Tj4IglgK+DzA5RqDH6jeS7ljVVXtkdPa2FK/2mSOE0M5sIQM=
=CKr5
-----END PGP SIGNATURE-----

--CxGdaZN1dWPpI1UJ--

