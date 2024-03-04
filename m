Return-Path: <linux-i2c+bounces-2156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2D87059E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69E001C22561
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CBF47A7A;
	Mon,  4 Mar 2024 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g6OJS6Jc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D93B29A;
	Mon,  4 Mar 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566573; cv=none; b=ZWHKD5QxHf8Yr8IbkgEc0aC3r8z2h2Elmbv4VFYzV8Z+DWfS8kPqSXUV3RzYk4Qq01KMaVxKd+04mIL3f0Z06rGU2Nlh6SgSOAdBth+pn3sBnlf//sObVU7GAU/ID4KqSNBhX1oOFl8geR/JKMPaNxzeb67YZMjzRD9R+dpR+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566573; c=relaxed/simple;
	bh=ySdztOBYEF3jOLO27ENS3g67Z23SqhZ5bWmdZAqUDvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oFJ0DuuQxuPOETYLomC1SEDrtmO+m8rVrQuQ1QcveU8rB1ouzDxAixzHsZL/qJjjb97ROcnFKmbtd3Kdyra70DZpdjzeb5l1r40gO9wueygruZJVAgHXiBeq9ehEgp8eK/BEvnNm3niHljeFLvZoxom1KkxTTva25CS1cssf90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g6OJS6Jc; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A931A1BF208;
	Mon,  4 Mar 2024 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+lEurNTi9qfX5Aes1xgUAal4TCh7q2x2RHJVUpm+ago=;
	b=g6OJS6JcWBSuyXa2duBldoQwxnFxkLAjLb2nyWJ01g3sP0iT/twWMnjpd4Ale5OPqNpade
	VN9c3epcrRf0GcA6VUQwEzLzmpv814Umny6bjsdNCxfBqHJtwWLFCteUIBXO1LUmJE2Xdk
	+q3zvt42iJp0vcR7L+VQj6og4DhcA77MGz5SOxj9Ooin2+Xc5/mnjhrpJJBmGakMsbnJoE
	EZ+z1A/zFgJPxBvFMuHI8PmmZWJ8lcpwHGcoDh1T8K/nHeBBrMAQfH1c+dTOTGrFmPCueo
	hAgBIhAi3gHvSdmlznzIzQPCGIOlVwDkbwVDcfdSaikKRIZO9O2RNHhRWiHqIw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v4 00/18] Add suspend to ram support for PCIe on J7200
Date: Mon, 04 Mar 2024 16:35:43 +0100
Message-Id: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE/q5WUC/33NTQ7CIBAF4Ks0rMXAAGnrynsYF5QOFqOlgYZom
 t5d6M4Yu3zz872FRAwOIzlVCwmYXHR+zEEeKmIGPd6Quj5nAgwk4wzovQbG6GQc0giBoum4bus
 WhapJfup0RNoFPZqhvD11nDGUxRTQutfWdLnmPLg4+/DeihMv078diVNGG4lK9VrlE3buvJ8fb
 jwa/yQFS7APQAFQ2roHaNDALyD2AZEBZQClFlYbbr+BdV0/jQXLw0kBAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

This add suspend to ram support for the PCIe (RC mode) on J7200 platform.

In RC mode, the reset pin for endpoints is managed by a gpio expander on a
i2c bus. This pin shall be managed in suspend_noirq() and resume_noirq().
The suspend/resume has been moved to suspend_noirq()/resume_noirq() for
pca953x (expander) and pinctrl-single.

To do i2c accesses during suspend_noirq/resume_noirq, we need to force the
wakeup of the i2c controller (which is autosuspended) during suspend
callback. 
It's the only way to wakeup the controller if it's autosuspended, as
runtime pm is disabled in suspend_noirq and resume_noirq.

The main change in the v4 is that now mux_chip_resume() returns zero or on
the first error.
The 2 patches on the pinctrl-single driver were squashed.
And the subject line for the PCI patches was fixed.
Other changes are detailed below.

Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
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
Thomas Richard (15):
      gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
      pinctrl: pinctrl-single: move suspend()/resume() callbacks to noirq
      i2c: omap: wakeup the controller during suspend() callback
      mux: add mux_chip_resume() function
      phy: ti: phy-j721e-wiz: use dev_err_probe() instead of dev_err()
      phy: ti: phy-j721e-wiz: split wiz_clock_init() function
      phy: ti: phy-j721e-wiz: add resume support
      phy: cadence-torrent: extract calls to clk_get from cdns_torrent_clk
      phy: cadence-torrent: register resets even if the phy is already configured
      phy: cadence-torrent: add already_configured to struct cdns_torrent_phy
      phy: cadence-torrent: remove noop_ops phy operations
      phy: cadence-torrent: add suspend and resume support
      PCI: cadence: Extract link setup sequence from cdns_pcie_host_setup()
      PCI: cadence: Set cdns_pcie_host_init() global
      PCI: j721e: Use dev_err_probe() in the probe() function

Théo Lebrun (3):
      mux: mmio: add resume support
      PCI: j721e: Add reset GPIO to struct j721e_pcie
      PCI: j721e: Add suspend and resume support

 drivers/gpio/gpio-pca953x.c                        |   7 +-
 drivers/i2c/busses/i2c-omap.c                      |  22 ++++
 drivers/mux/core.c                                 |  29 +++++
 drivers/mux/mmio.c                                 |  12 ++
 drivers/pci/controller/cadence/pci-j721e.c         | 107 +++++++++++++++--
 drivers/pci/controller/cadence/pcie-cadence-host.c |  44 ++++---
 drivers/pci/controller/cadence/pcie-cadence.h      |  12 ++
 drivers/phy/cadence/phy-cadence-torrent.c          | 120 ++++++++++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                     | 132 +++++++++++++--------
 drivers/pinctrl/pinctrl-single.c                   |  28 ++---
 include/linux/mux/driver.h                         |   1 +
 11 files changed, 384 insertions(+), 130 deletions(-)
---
base-commit: e76807cc177efce5bdb253de3c673b13c08be013
change-id: 20240102-j7200-pcie-s2r-ecb1a979e357

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


