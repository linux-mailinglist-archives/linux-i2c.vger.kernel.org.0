Return-Path: <linux-i2c+bounces-1721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A58856715
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91ADBB23388
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9138132C1C;
	Thu, 15 Feb 2024 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o9DbmqpX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5CD1EEE7;
	Thu, 15 Feb 2024 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010287; cv=none; b=oUVYDEmvJpzXN4lZjeuXJgb6pgms4AcWrC6GvE/PUQgovyEqsBPoTLBNMZ5n5beKfq1sDN2xgoUYYYlkYTLcBhcOYsggRHxUF02cvhig4kvUjx8JDslaRp60SmXzMxDR1W8+tQQKto2Pb0INXfnDVM8id4EmkyUAA0oKCR1H+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010287; c=relaxed/simple;
	bh=/5RuGo1BUth2SZ1jzxAgP1hnBYBVss31ksnOXl9XJrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eVAJCDK+IjAScr3EPL+TCqH/XftZyzNAAxAdCRSWH6IOFgwP/4++rPKu4nkE5j14eE9Fa5MtMUpeCtGFdYlNTUVyypVuRHlRAD3a3EjRx1DJ2DZWNczHUUpL7T9c/7OSNwc+AsA4rHE5EOAusMRgQEUzwd2R3uM9Te+C8j5oU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o9DbmqpX; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8270C240002;
	Thu, 15 Feb 2024 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mFwF74WYG389eTgoCBYbyxfkr+BMGReUM+V29ejlH/U=;
	b=o9DbmqpX4/9BdCNE5XP79nCuaHvPL3RSwYXLefC9AJr49SuqVn3XKDXDtej/ID9DyQRboT
	6u1yn7jIStwyGAhYzO5ATu7pptNaohDS2ZrCLPXskvm+Nm3iEdf1G0YYl3siW7qgw/OKUn
	zVHPSIdue3Jq+cDPL6NNW7NVvY1eAJbQDJNlGBCU0CGcPMgnW97E0O0o+8omOjAcaQj4FC
	40hZf8UBmaWOUGGFL3CM0LoU4uXpj8wvxUFt8c2rym1n5LpMz6gtBEMGlW+c4Mc4qHMZjx
	xcbwmKpDSpz/78ukf6JT1G3dRc9WJnGouHmAeGu5fYJPzIASeTCac6dOGjC/wA==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v3 00/18] Add suspend to ram support for PCIe on J7200
Date: Thu, 15 Feb 2024 16:17:45 +0100
Message-Id: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABkrzmUC/32NQQ7CIBBFr9KwdgxMS2hdeQ/jAujUYrQ00BBN0
 7sL3bnQ5Z/5/72VRQqOIjtVKwuUXHR+yqE+VMyOeroRuD5nhhwbLjjCXSHnMFtHEDEAWSN0pzq
 qpWJ5ZHQkMEFPdiyzp44LhfKYAw3utZsu15xHFxcf3rs4iXL96UgCOLQNSdlrmSv8bLxfHm46W
 v9kBZbwPwALgJpB9YgtWfwGbNv2Adp2j00IAQAA
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
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

The main change in this v3 is the removal of the probe boolean for the
functions wiz_clock_probe() and cdns_pcie_host_setup().
Their contents were split in multiple functions which are called in the
resume_noirq() callbacks.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
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
      pinctrl: pinctrl-single: remove dead code in suspend() and resume() callbacks
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
      PCI: cadence: extract link setup sequence from cdns_pcie_host_setup()
      PCI: cadence: set cdns_pcie_host_init() global

Théo Lebrun (3):
      mux: mmio: add resume support
      PCI: j721e: add reset GPIO to struct j721e_pcie
      PCI: j721e: add suspend and resume support

 drivers/gpio/gpio-pca953x.c                        |   7 +-
 drivers/i2c/busses/i2c-omap.c                      |  22 ++++
 drivers/mux/core.c                                 |  30 +++++
 drivers/mux/mmio.c                                 |  12 ++
 drivers/pci/controller/cadence/pci-j721e.c         | 102 ++++++++++++++++-
 drivers/pci/controller/cadence/pcie-cadence-host.c |  44 +++++---
 drivers/pci/controller/cadence/pcie-cadence.h      |  12 ++
 drivers/phy/cadence/phy-cadence-torrent.c          | 121 +++++++++++++++------
 drivers/phy/ti/phy-j721e-wiz.c                     | 119 +++++++++++++-------
 drivers/pinctrl/pinctrl-single.c                   |  28 ++---
 include/linux/mux/driver.h                         |   1 +
 11 files changed, 380 insertions(+), 118 deletions(-)
---
base-commit: 00ff0f9ce40db8e64fe16c424a965fd7ab769c42
change-id: 20240102-j7200-pcie-s2r-ecb1a979e357

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


