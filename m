Return-Path: <linux-i2c+bounces-2172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 025938705F4
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34F021C22262
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCE859B61;
	Mon,  4 Mar 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aZhrnNep"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1E58209;
	Mon,  4 Mar 2024 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566603; cv=none; b=HNiiBa37erejKduvjNEJzojcLxPL1tsHK3oOM+tgY3xp3hOePHutv6AgPClJM2lBveCPzBqrREaav45WEeoXluQSf427pSYk8fLXfB45zZn12m8yUiCRYsPoHCM/A2flrAKYOb9hTRQtgHL3aunoThaj4QNp7Zvx3I2GtAgfQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566603; c=relaxed/simple;
	bh=Ohktw3RK4eDwPNimb3W6pUcDGyTAny2PddqKGaaMR6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Deld+VNPgG1ii8UKBdnPXnjPP1Xsv6hAz1rhZCPOwYnP7YKv17z1QM0Fg4pprwS4QHrJXB3grehEaEaCBhQnXHVW1O5elIACRzspATcGqnrWK2y/fEd7x3ky4Ey+G+33bX3Q9SP/k5QrJqsYLI8EwjPQHRrweS+rdCSghC633l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aZhrnNep; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EC7B1BF208;
	Mon,  4 Mar 2024 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHgRE7AWaSOAAlSu+b/+Fh63+xKvjYyr+YQEe5ZFNNM=;
	b=aZhrnNepGDvUIjpqZPS2Mj2T+VGrvoVHTiGmgIK6SWeYriVx6Fsc0imTLaWFmxbv+SOBbq
	IRz/GynvGMJd/TuUwCO06iCpLAolLJNbp5SK46bUCZ721iEOsmd7vaD0vsUfl+KSADEqby
	8o5NdLzFsFT5FgdzFNNDwhiymGG5bTiNL4mcABGgAiZnJ6h9IA/9N1btGN5ksg7HVYORqX
	+jgBj35S7+ozRjumHtehBIXiUdREalVMwA5Ca7Cg4xS39/qRCEIoK7VbqiY8PXy0CtD2OE
	bOsQq8kpaOcIMtINeAqRRQ/xGg1HQ3STdf0+Ht9yFGoMZxK+yexyt6xInPikKQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:59 +0100
Subject: [PATCH v4 16/18] PCI: j721e: Use dev_err_probe() in the probe()
 function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-16-6f1f53390c85@bootlin.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
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
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Use dev_err_probe() instead of dev_err() in the probe() function to
simplify the code and standardize the error output.

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


