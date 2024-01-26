Return-Path: <linux-i2c+bounces-1457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8F83DC28
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FCB25053
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EC31B81B;
	Fri, 26 Jan 2024 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jYJ+UGbM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D01CD07;
	Fri, 26 Jan 2024 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279863; cv=none; b=Ozq8UEVlYUZFZabQ+tSn1Q62C6lFNo3zGeVzlR2fLm1ZJFZkt+enfPmIzvd8On4GrRvXnYgN9nEAB8SbhCwZP3hb7MuUzysBDNtvyS/0upVH4W1yHVU0EnQ+Q/thq02gMU7MV0uBuFAOsCP4vnhftA6H9MzxFCIFRhu8/S7N7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279863; c=relaxed/simple;
	bh=xgBJPPCeFx6F8RvuJZb3CDZIbr5zJcVGTJYWir/0iIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PtZHDb8awaOPUmsyum+NuRw91odl5U5e7zn9DTT2rciTigcoqt7pPYt5z3YCr3v5L1ngVdCc+6ZeoQjAV6DWLqWOvz5DZR8UenBFVZXsMaNElMCe1ycIJqHge4PVKbkwp0vgmVKgiHDGH5SgLDZQiKM9A/YyA0wMEIdk3ZgKsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jYJ+UGbM; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A5F94000C;
	Fri, 26 Jan 2024 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=62/qYpK4+YlKzbTb8Bu4FQMVmVipXLL21WAgCC0RYzA=;
	b=jYJ+UGbML212yaitjT4mp/B0Uhj+CdJw4jD57IsqiYRIgwE1hfwmCP4ECofgfoBbqQnNM1
	e5uVAXyA5/zPYjCo9OvZwSdnBssk0iN6GMJX+eWzY2rE2ctgKmhw9xAwV5f+86HVqVGSnY
	NoIlCcSt5qwkRpmaPKkO78NxWwWIP8nRtDmqwyGY/y5YhHSNYsmLZPyqOuo841+KBD4ys/
	3h94YI4MafeM0g6YI+/sN6zd2r5qGVHN48dh1XVQ2ebTqiP7bvyrtsyiXGFiE798lcgEDM
	vNhrh6WJx/tIpjPMgqDkRa7oXoJUA1g3LymgdRex25VzqieDKKrJy4xV8WqVJw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v2 00/15] Add suspend to ram support for PCIe on J7200
Date: Fri, 26 Jan 2024 15:36:42 +0100
Message-Id: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHrDs2UC/3WNTQ6CMBBGr0K6dsy00iCuvIdh0ZZRxmhLOoRoC
 He3sHf5vp+8RQllJlGXalGZZhZOsYA5VCoMLj4IuC+sDJoaNRp4NgYRxsAEYjJQ8Nq1TUsn26h
 y8k4IfHYxDNvt7WSivBVjpjt/dtOtKzywTCl/d/Gst/SvY9aAcK7J2t7ZMsGrT2l6cTyG9Fbdu
 q4/Q9ZwwccAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
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

The main change in this v2 is the add of mux_chip_resume() function in the
mux core.
This function restores the state of mux-chip using cached state. It's used
by mmio driver in the resume_noirq() callback.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
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
Thomas Richard (11):
      gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
      pinctrl: pinctrl-single: move suspend()/resume() callbacks to noirq
      i2c: omap: wakeup the controller during suspend() callback
      mux: add mux_chip_resume() function
      phy: ti: phy-j721e-wiz: make wiz_clock_init callable multiple times
      phy: ti: phy-j721e-wiz: add resume support
      phy: cadence-torrent: extract calls to clk_get from cdns_torrent_clk
      phy: cadence-torrent: register resets even if the phy is already configured
      phy: cadence-torrent: add already_configured to struct cdns_torrent_phy
      phy: cadence-torrent: remove noop_ops phy operations
      phy: cadence-torrent: add suspend and resume support

Théo Lebrun (4):
      mux: mmio: add resume support
      PCI: cadence: add resume support to cdns_pcie_host_setup()
      PCI: j721e: add reset GPIO to struct j721e_pcie
      PCI: j721e: add suspend and resume support

 drivers/gpio/gpio-pca953x.c                        |   7 +-
 drivers/i2c/busses/i2c-omap.c                      |  14 +++
 drivers/mux/core.c                                 |  27 +++++
 drivers/mux/mmio.c                                 |  12 ++
 drivers/pci/controller/cadence/pci-j721e.c         |  93 ++++++++++++++--
 drivers/pci/controller/cadence/pcie-cadence-host.c |  49 +++++----
 drivers/pci/controller/cadence/pcie-cadence-plat.c |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.h      |   4 +-
 drivers/phy/cadence/phy-cadence-torrent.c          | 122 +++++++++++++++------
 drivers/phy/ti/phy-j721e-wiz.c                     |  95 ++++++++++++----
 drivers/pinctrl/pinctrl-single.c                   |  28 ++---
 include/linux/mux/driver.h                         |   1 +
 12 files changed, 343 insertions(+), 111 deletions(-)
---
base-commit: 00ff0f9ce40db8e64fe16c424a965fd7ab769c42
change-id: 20240102-j7200-pcie-s2r-ecb1a979e357

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


