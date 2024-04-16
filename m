Return-Path: <linux-i2c+bounces-2963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EA8A6C4C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F196A1F217E2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810A012CD8F;
	Tue, 16 Apr 2024 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h2r7DxJE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D04912C549;
	Tue, 16 Apr 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274219; cv=none; b=Geqt+Pu4syu+eyWFzAKYchqXTorfUwhZBkCULMYRM5eMP+Bj1rPdtpdhpBzwoRXDW2LrfHk5LME++b5/Mb9ZLeVoioWWPLrNrdgIC/N7KdFN3LVM+Ri84sjkJLdY+GcigmRsuarzEbpbzLKpUAdqFicHv4CSdtS/WKdfU4M+d6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274219; c=relaxed/simple;
	bh=k2CGSaqDP2m0Z3Oc2xnWpbaC6P75yXQgcSyVyBCP3zk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VxFf30XSoLD+8gmcmFqCklcEc8K7wXrjsEosRbeynr+1N8v1TKxtpDlb7uRZOJgobxrd6Q/0xXPfxrhQ+mFj7Rw6lsdfA7cOsScaCdHlAiGkx74oSqpHLE443NSVDpxfK0RVUOf2895XLb1eqa13+aAI613rDz8kSMEBgFrHSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h2r7DxJE; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F88C40009;
	Tue, 16 Apr 2024 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F0jrhu+me/D8W5kvgHhQRcQp1B1+GzO90q1V+X66rgI=;
	b=h2r7DxJEUW6AVToxugShoo81Z5Enlb15aDdL8trr9lT6j61wVVhUni8KI+4/dzYmzhmwmP
	KDM4RH7iJRitFCqBgXTZOM+06VajU1LbSMn1AxRuyTWLm5pE49VHij1a78iPwzLBHI0osX
	bEDLsX1ndhqMIAxZBT9kH0qBuvxlwwpPY4ZlBPs9qtBU/9AZti/kvRGwfti1DdExRFOVWH
	aAJnMwPj8x4B40aGf9nis/yUL0XFHukpqt70noNnjpcK+KyCRZipk6F7vH0HLT4YNcIvfV
	xgdTlBRdWsg72mO72GuPnmRdMiZF6ZfYdLfqKym09/Ijkp3z4PXteUFjbH0eNw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v5 00/11] Add suspend to ram support for PCIe on J7200
Date: Tue, 16 Apr 2024 15:29:49 +0200
Message-Id: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE19HmYC/33NTQ7CIBAF4KsY1mJgANu68h7GBZ0OFqOlgabRm
 N5dcGeMXb75+d6LJYqeEjtsXizS7JMPQw5mu2HY2+FC3Hc5MxCghRTArxUIwUf0xBNETthK21Q
 NKVOx/NTaRLyNdsC+vN1tmiiWxRjJ+cen6XTOufdpCvH5KZ5lmf7tmCUXvNZkTGdNPhHHNoTp5
 ocdhjsr2AzrABSAtKs6gJoQfgG1DqgMGATSVjmL0v0Ceh3QGdg76YxSjcDafAPLsrwBuBlYy4o
 BAAA=
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

In this 5th iteration, the series was rebased on Linux 6.9-rc1.

The PHY patches were moved to a dedicated series.

The patch for the pinctrl-single driver was removed, as it was already
applied to the pinctrl tree.

Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
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
Thomas Richard (8):
      gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
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
 drivers/i2c/busses/i2c-omap.c                      |  22 ++++
 drivers/mux/core.c                                 |  29 +++++
 drivers/mux/mmio.c                                 |  12 ++
 drivers/pci/controller/cadence/pci-j721e.c         | 121 ++++++++++++++++++---
 drivers/pci/controller/cadence/pcie-cadence-host.c |  44 +++++---
 drivers/pci/controller/cadence/pcie-cadence.h      |  12 ++
 drivers/pci/pci.h                                  |   3 +
 include/linux/mux/driver.h                         |   1 +
 9 files changed, 214 insertions(+), 37 deletions(-)
---
base-commit: 3d31103a742d8c94924848dc0fb5e2ce6b701932
change-id: 20240102-j7200-pcie-s2r-ecb1a979e357

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


