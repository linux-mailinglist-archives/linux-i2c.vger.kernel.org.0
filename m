Return-Path: <linux-i2c+bounces-3502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC88C649E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D20D286060
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE69763FD;
	Wed, 15 May 2024 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nNr8jD6A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB487581D;
	Wed, 15 May 2024 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767303; cv=none; b=Iz3jR+LJZO+go1gHs6p7jz/rstq8BI73IjTTMFnPzc759VNs1rHnq08Rx+QTzxkPLH4A24iG05PZNNaR1n+5dEjAm9WHZwgOHUfO/HIyykoss89s5pd1EoJy+PGy+Zt4n9v+rTSNn9bldvFNoGZetxyaAlLEMlc2bMU+/7S4bPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767303; c=relaxed/simple;
	bh=Hi7CNJIos7Z9zyfmhn8gv5F7wudXu7ivCs1VjXQ08h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLmq3DA7/1LAUNZ+Ti1UtVeH1+7ty/jSAAB91VzDhUxjVJWOYRIPfrbNPZYTsVLne/bPCzTtDNoaN1CRlqnE5D4UEm/uQbAb3fr+g8fLSDfDubZU+xdqXEr4xo/3OTC/nfq3l6z9bCEdIrAP7V7xVDUHKZurUW6NB84iDkpgzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nNr8jD6A; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99F431BF211;
	Wed, 15 May 2024 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJFPWxXw72vNyH+gQgC1DthvjYV6wnk21OakN4I7AYs=;
	b=nNr8jD6ASKjdH1ujixPbpO/pzeGnDCBlzh0xu3T4+YXKAgyIkFPniBhWCfTCMSpxRX91tP
	kH8MyKMSWlqll4CCO7yku3IT2ngUZtWNH2mzPXBQIYmS7QG3VLhz29BC9InqG5HgJp9xlH
	68/XPSWx2xGqfExR2JRiOlJtSBTT70yMSDN3NTeH0Fbfk4nXNtVwvwgJipRGlzyxmiBXON
	w8J9c+Dm0hE6BNcr77iCFL3ZLLu3B0Cd/xHgKfupe4Yl/Fc+4KRHdDyQhxQA1SuEiqLFcw
	VrifmROqT3+EOnUHcCl4OvmnMhJc/F7H8l7hbYQ8FqRD8M1pXa4OpD3vaRHDFQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 15 May 2024 12:01:09 +0200
Subject: [PATCH v6 08/12] PCI: j721e: Use dev_err_probe() in the probe()
 function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v6-8-4656ef6e6d66@bootlin.com>
References: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
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


