Return-Path: <linux-i2c+bounces-1303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2E82DD31
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D097282A07
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D2817BBA;
	Mon, 15 Jan 2024 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RJ1p+lSe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2139179B0;
	Mon, 15 Jan 2024 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8333C000A;
	Mon, 15 Jan 2024 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FTQqCzxmqCmlYgHh3ktXPX0P1HCGFzF7LoD+ZqCYJUk=;
	b=RJ1p+lSeuPctrMJTsfUuaITNbe+buWSru/jnSfFXQoT8He0ouAn9HpqNISomUAfaiuYaDb
	sj6wgjZCcgcWoIQT/jPEDnQKPrJ/YEEMSRheHxrOvbq/NVyhWfRW2rJ8HZ5XwCY4m+6hx7
	gWbH9Os6b24MmF47qQhtyHcjU8F7uaGeeIcwbmb5LPRRuzAxUcwAJ6qNct71edKD8qCI8y
	FYnDk1JlLnJxaRym4sQEIcixdOi2mDDqSEs4t7GDk5AwYGZeSz8OvQoqIddG4V3frE/e1G
	TKEUv/CbSR+Xmmu8swfG7A3CjqR/lRNY+WvPkgL4C8PMHHYyG114pVWaPADOvQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 00/14] Add suspend to ram support for PCIe on J7200
Date: Mon, 15 Jan 2024 17:14:41 +0100
Message-Id: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPJZpWUC/x2NQQrCQAwAv1JyNpCNylK/Ih6ya7QRXEsiIpT+3
 a3HYRhmgVA3DTgNC7h+LOzVOqTdAHWSdle0a2dg4gMlYnxkJsK5mmKwo9aSZMyj7o8ZelQkFIt
 Lq9OWPSXe6puYXW/2/Z/Ol3X9AbewuWd5AAAA
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

This add suspend to ram support for the PCIe (RC mode) on J7200
platform.

In RC mode, the reset pin for endpoints is managed by a gpio expander
on a i2c bus. This pin shall be managed in suspend_noirq and
resume_noirq.
The suspend/resume has been moved to suspend_noirq/resume_noirq for
pca953x (expander) and pinctrl-single.

To do i2c accesses during suspend_noirq/resume_noirq, we need to force
the wakeup of the i2c controller (which is autosuspended) during
suspend callback. 
It's the only way to wakeup the controller if it's autosuspended, as
runtime pm is disabled in suspend_noirq and resume_noirq.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Thomas Richard (10):
      gpio: pca953x: move suspend/resume to suspend_noirq/resume_noirq
      pinctrl: pinctrl-single: move suspend/resume to suspend_noirq/resume_noirq
      i2c: omap: wakeup the controller during suspend callback
      phy: ti: phy-j721e-wiz: make wiz_clock_init callable multiple times
      phy: ti: phy-j721e-wiz: add resume support
      phy: cadence-torrent: extract calls to clk_get from cdns_torrent_clk
      phy: cadence-torrent: register resets even if the phy is already configured
      phy: cadence-torrent: move already_configured to struct cdns_torrent_phy
      phy: cadence-torrent: remove noop_ops phy operations
      phy: cadence-torrent: add suspend and resume support

Théo Lebrun (4):
      mux: mmio: Add resume support
      PCI: cadence: add resume support to cdns_pcie_host_setup()
      PCI: j721e: move reset GPIO to device struct
      PCI: j721e: add suspend and resume support

 drivers/gpio/gpio-pca953x.c                        |   8 +-
 drivers/i2c/busses/i2c-omap.c                      |  15 +++
 drivers/mux/mmio.c                                 |  34 ++++++
 drivers/pci/controller/cadence/pci-j721e.c         |  86 ++++++++++++--
 drivers/pci/controller/cadence/pcie-cadence-host.c |  49 ++++----
 drivers/pci/controller/cadence/pcie-cadence-plat.c |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.h      |   7 +-
 drivers/phy/cadence/phy-cadence-torrent.c          | 125 +++++++++++++++------
 drivers/phy/ti/phy-j721e-wiz.c                     |  99 ++++++++++++----
 drivers/pinctrl/pinctrl-single.c                   |  19 ++--
 10 files changed, 342 insertions(+), 102 deletions(-)
---
base-commit: 00ff0f9ce40db8e64fe16c424a965fd7ab769c42
change-id: 20240102-j7200-pcie-s2r-ecb1a979e357

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


