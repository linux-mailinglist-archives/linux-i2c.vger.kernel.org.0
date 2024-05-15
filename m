Return-Path: <linux-i2c+bounces-3494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C72938C6476
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42B60B223E2
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A6D5A7AE;
	Wed, 15 May 2024 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f4CxYDhD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC05A11A;
	Wed, 15 May 2024 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767293; cv=none; b=nwwr4rM1QHJHo3PNmwws4Kx9O/SNZkixJVhAb3xoUQj13XMveKRhAuttl13UDbhdZwLdyPFwoBjRaBnDDs9fDIqz5Gsf3H5VBlIDlL5IWDHG0LvnkYqD5CY90A4FfCaoTJAo/gtsnGHQP5sEPpxet4GNonPWOCCICnk7VOJmYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767293; c=relaxed/simple;
	bh=2ANJF+sVZ9U/gFFWItijEZdox3eT2Yq0xZP8gY/Ylks=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VxQ3QuZ4tc6ujxAusqT9V1lff6u/D5m3I/vSoivspndCvzAOisblKvYdJzYuGsXhZ+odDNUPtHgLgAhejF2Tas5v/W8k8Dl9OA5QKpwFHtM9+IGaCXw1OhHL6541NtC+U8ACDjptyaZzLp5l9RBGdklw3dtk00xOMSVkH59ThR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f4CxYDhD; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB85F1BF20F;
	Wed, 15 May 2024 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Tq48lIYa1mOy6g80ZOBX+iF4hlu1ufcE8TIs/96ovo=;
	b=f4CxYDhDZ698OMTEiqRorYG8oJMx6MuqJzAPvcYVzvA1P6oiZpWjtIAAiS13q2n2N3zorf
	fTMHpkJ3hPmS+gY3qJBZNRbOflrMMBeFZkdTfu82mb2MO5XzmDrXWJ9VmSZFqJypE+9GH/
	xjYOllL9CrlVmEAtOSPy5uYFx3pyzFsctsUIRy/5GZVPiHKGxI2PEXiCEZEDToUE8d0DU4
	EBjRh+ty+7r1bI+Yj5A8V+gBY/pLmaNlGd6RexoOA5q0u1DV3vUEkM/DTVC/XiAmEAfvqP
	4YjT8t0ZXzIQ1AGtkCVjTOlII6/g8+LsuVybrXFTkG4NRss5I3RhFlFeHjvEpA==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v6 00/12] Add suspend to ram support for PCIe on J7200
Date: Wed, 15 May 2024 12:01:01 +0200
Message-Id: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN2HRGYC/33NzU7EIBQF4FeZsBYDFyitK9/DuIDLxWKcMoGm0
 Uz67sLsTGOX5/58584qlUSVvVzurNCWaspLC8PTheHslg/iKbTMQIAWUgD/tCAEv2EiXqFwQi/
 dZCdSxrL25F0l7otbcO5vV1dXKn1xKxTT96Pp7b3lOdU1l59H8Sb79N+OTXLBR03GBGfaiXj1O
 a9faXnGfGUd2+AcgA6QjjYAjIRwBNQ5oBpgEEg7FR3KeAT0OaAbMEQZjVKTwNEcAXMOmAZoP6I
 erJSBwl9g3/dffb7tKMsBAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

This adds suspend to ram support for the PCIe (RC mode) on J7200 platform.

This 6th iteration fixes a compile issue in the i2c-omap driver if
CONFIG_PM_SLEEP is not set.
A new patch was added to remove the __maybe_unused attribute of
omap_i2c_runtime_suspend() and omap_i2c_runtime_resume().

Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v6:
- i2c-omap: add a patch to remove __maybe_unused attribute of
  omap_i2c_runtime_suspend() and omap_i2c_runtime_resume()
- i2c-omap: fix compile issue if CONFIG_PM_SLEEP is not set
- Link to v5: https://lore.kernel.org/r/20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com

Changes in v5:
- all: series rebased on Linux 6.9-rc1
- pinctrl-single: patch removed (already applied to the pinctrl tree)
- phy: patches moved to a dedicated series.
- pci: add T_PERST_CLK_US macro.
- pci-j721e: update the comments about T_PERST_CLK_US.
- Link to v4: https://lore.kernel.org/r/20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com

Changes in v4:
- all: use SoB/Co-developed-by for patches initially developed by Théo
  Lebrun.
- pinctrl-single: squash the two commits.
- i2c-omap: fix line lenghts of the comment in omap_i2c_suspend().
- mux: mux_chip_resume() return 0 or at the first error.
- phy-j721e-wiz: clean code around dev_err_probe().
- phy-j721e-wiz: use REF_CLK_100MHZ macros.
- pci: fix subject line for all PCI patches.
- pci-cadence: use fsleep() instead of usleep_range().
- pci-cadence: remove cdns_torrent_clk_cleanup() call in
  cdns_torrent_phy_resume_noirq().
- pci-j721e: add a patch to use dev_err_probe() instead of dev_err() in the probe().
- pci-j721e: fix unordered header files.
- pci-j721e: remove some log spammers.
- pci-j721e: add a missing clock disable in j721e_pcie_resume_noirq().
- pci-j721e: simplify the patch "Add reset GPIO to struct j721e_pcie"
- Link to v3: https://lore.kernel.org/r/20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com

Changes in v3:
- pinctrl-single: split patch in two parts, a first patch to remove the
  dead code, a second to move suspend()/resume() callbacks to noirq.
- i2c-omap: add a comments above the suspend_noirq() callback.
- mux: now mux_chip_resume() try to restores all muxes, then return 0 if
  all is ok or the first failure.
- mmio: fix commit message.
- phy-j721e-wiz: add a patch to use dev_err_probe() instead of dev_err() in
  the wiz_clock_init() function.
- phy-j721e-wiz: remove probe boolean for the wiz_clock_init(), rename the
  function to wiz_clock_probe(), extract hardware configuration part in a
  new function wiz_clock_init().
- phy-cadence-torrent: use dev_err_probe() and fix commit messages
- pcie-cadence-host: remove probe boolean for the cdns_pcie_host_setup()
  function and extract the link setup part in a new function
  cdns_pcie_host_link_setup().
- pcie-cadence-host: make cdns_pcie_host_init() global.
- pci-j721e: use the cdns_pcie_host_link_setup() cdns_pcie_host_init()
  functions in the resume_noirq() callback.
- Link to v2: https://lore.kernel.org/r/20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com

Changes in v2:
- all: fix commits messages.
- all: use DEFINE_NOIRQ_DEV_PM_OPS and pm_sleep_ptr macros.
- all: remove useless #ifdef CONFIG_PM.
- pinctrl-single: drop dead code
- mux: add mux_chip_resume() function in mux core.
- mmio: resume sequence is now a call to mux_chip_resume().
- phy-cadence-torrent: fix typo in resume sequence (reset_control_assert()
  instead of reset_control_put()).
- phy-cadence-torrent: use PHY instead of phy.
- pci-j721e: do not shadow cdns_pcie_host_setup return code in resume
  sequence.
- pci-j721e: drop dead code.
- Link to v1: https://lore.kernel.org/r/20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com

---
Thomas Richard (9):
      gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
      i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS()
      i2c: omap: wakeup the controller during suspend() callback
      mux: add mux_chip_resume() function
      PCI: cadence: Extract link setup sequence from cdns_pcie_host_setup()
      PCI: cadence: Set cdns_pcie_host_init() global
      PCI: j721e: Use dev_err_probe() in the probe() function
      PCI: Add T_PERST_CLK_US macro
      PCI: j721e: Use T_PERST_CLK_US macro

Théo Lebrun (3):
      mux: mmio: add resume support
      PCI: j721e: Add reset GPIO to struct j721e_pcie
      PCI: j721e: Add suspend and resume support

 drivers/gpio/gpio-pca953x.c                        |   7 +-
 drivers/i2c/busses/i2c-omap.c                      |  36 ++++--
 drivers/mux/core.c                                 |  29 +++++
 drivers/mux/mmio.c                                 |  12 ++
 drivers/pci/controller/cadence/pci-j721e.c         | 121 ++++++++++++++++++---
 drivers/pci/controller/cadence/pcie-cadence-host.c |  44 +++++---
 drivers/pci/controller/cadence/pcie-cadence.h      |  12 ++
 drivers/pci/pci.h                                  |   3 +
 include/linux/mux/driver.h                         |   1 +
 9 files changed, 221 insertions(+), 44 deletions(-)
---
base-commit: cebffb4fba6177b15e60e28e1ac17fc4efb2f86f
change-id: 20240102-j7200-pcie-s2r-ecb1a979e357

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


