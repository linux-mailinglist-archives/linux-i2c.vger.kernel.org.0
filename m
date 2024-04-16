Return-Path: <linux-i2c+bounces-2970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF3B8A6C71
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C791F22626
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7258130AD0;
	Tue, 16 Apr 2024 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VyNco7Pc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985812F589;
	Tue, 16 Apr 2024 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274226; cv=none; b=VkWM5U6skalRcXWe68f74hnxFW98d6KsUPjw4BXo9z+35peZCADw+IyJcUptjZVsQ0+lmKn1mq98aem6/fQifrafABbEStLipAwqcPVRN/oz4wX02e4i3BdECaC/pvzh9qqCsrP9ScodQOrXUm9qJIxPWLzeE+8Ej5S1w5MIT3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274226; c=relaxed/simple;
	bh=Hi7CNJIos7Z9zyfmhn8gv5F7wudXu7ivCs1VjXQ08h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZwa2KYSDyAmetjWWo2goXL5HskZ1Uy7lzFL28KeeWHr6mlgmDzbkcrfZhoI9awfCdy5IWnp8NyKR+o8Vmpb3A7fCf6Z7U86MhDWvk9CSU7DdAuxrSgbGEa/ZgsHejqvfoa93ZkI/ettH2ihNxqyIu9ja8hUfEaDFgL9rXyUyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VyNco7Pc; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D1AC40011;
	Tue, 16 Apr 2024 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJFPWxXw72vNyH+gQgC1DthvjYV6wnk21OakN4I7AYs=;
	b=VyNco7PcCsxO3KWimvVr8QzlealtvOdl0KMlANr9g7PKUiEp6kfotsaXXPWtdohFYY9dLT
	a3HGChWFLSnbhW3pRSXVJeluXpZ1rs2+Wg5Jv+oSScVb6MKJSFybRgSa2nLcXL1qcoMOv3
	eBvRxj4ZDFzLyzdgwj5B24Ugb9AIDwTgzqZbBtThkT4Kl5scQx1nRcfLk/HYibDgZefjUF
	/zfiRfY7BVTPxYzHftYyyxGnvusSHcujrD3iN5RCB/Uwe//3PgjF7UK8KO2QcB5+P5Clvx
	3i9PrLFqQ1515FuiB6bOOK0IDkL2RdKxw8REppZzFr64BQjyyvEvoX7q99FFVw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:56 +0200
Subject: [PATCH v5 07/11] PCI: j721e: Use dev_err_probe() in the probe()
 function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v5-7-4b8c46711ded@bootlin.com>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
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
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Use dev_err_probe() instead of dev_err() in the probe() function to
simplify the code and standardize the error output.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 85718246016b..98484f001562 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -482,20 +482,20 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync failed\n");
+		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
 		goto err_get_sync;
 	}
 
 	ret = j721e_pcie_ctrl_init(pcie);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync failed\n");
+		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
 		goto err_get_sync;
 	}
 
 	ret = devm_request_irq(dev, irq, j721e_pcie_link_irq_handler, 0,
 			       "j721e-pcie-link-down-irq", pcie);
 	if (ret < 0) {
-		dev_err(dev, "failed to request link state IRQ %d\n", irq);
+		dev_err_probe(dev, ret, "failed to request link state IRQ %d\n", irq);
 		goto err_get_sync;
 	}
 
@@ -505,28 +505,25 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	case PCI_MODE_RC:
 		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 		if (IS_ERR(gpiod)) {
-			ret = PTR_ERR(gpiod);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get reset GPIO\n");
+			ret = dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get reset GPIO\n");
 			goto err_get_sync;
 		}
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
-			dev_err(dev, "Failed to init phy\n");
+			dev_err_probe(dev, ret, "Failed to init phy\n");
 			goto err_get_sync;
 		}
 
 		clk = devm_clk_get_optional(dev, "pcie_refclk");
 		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			dev_err(dev, "failed to get pcie_refclk\n");
+			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
 			goto err_pcie_setup;
 		}
 
 		ret = clk_prepare_enable(clk);
 		if (ret) {
-			dev_err(dev, "failed to enable pcie_refclk\n");
+			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
 		pcie->refclk = clk;
@@ -554,7 +551,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	case PCI_MODE_EP:
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
-			dev_err(dev, "Failed to init phy\n");
+			dev_err_probe(dev, ret, "Failed to init phy\n");
 			goto err_get_sync;
 		}
 

-- 
2.39.2


