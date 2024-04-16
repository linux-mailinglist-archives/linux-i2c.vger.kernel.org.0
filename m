Return-Path: <linux-i2c+bounces-2971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCAF8A6C77
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACEE1B22522
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A625131185;
	Tue, 16 Apr 2024 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XZYn+kxc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586C130A45;
	Tue, 16 Apr 2024 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274227; cv=none; b=TjjidLwBl5zDvzD3NAPx0HhswgjZN6rwPcSl/qOAZHKMuUJE+v0YpgO+aiSU3mkjyJf+XSKTWAjEfrgAcCTvDRw2eY3AXWkb09UZjRb4GZpPG5xxHK74Hv3sG+EZ0z4DSlbnIbgxNLttqH8K6MIADuCVby4QLTHES7CyiAt2wVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274227; c=relaxed/simple;
	bh=D/mIw5PQXaVybV8q1M5tT5irn19bOqE7/C1r84b60EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLaQ12XTMcdIuTH3OfPVlJgjLdDHu5R1vM+QaM0KxzU88TKpwOiFuPrk2r+HUerhdLJOlfARufNJjt4FoGiipTSwpEzoac5IihO0trybUWWJ7D1tOvefoo68bThorF3VHVPXiV08oPz+jZtdvyqX2RhwHvNEChmmbuxi2l7VETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XZYn+kxc; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D126E40012;
	Tue, 16 Apr 2024 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAhWJDZy3Qxtd03byX/QomLU+QUbXtxsEhEbMTufqk0=;
	b=XZYn+kxcfuCWQYnCjZUR3LhfF3daR2uuyjreMPlmn52jRBk5PEAe/gEf4ViXV9q+piGWY2
	xYmtQhD3oBTgc5cWSrLHq8rj+7VdDyRNFXAxkzYC55IdKuttJeqqrYToeqz1Ey7eUJ33BV
	B7F6n2BqE9Y6xrBSwsPBJwa+NhvvVlybCa5OrUCz34Wq3N6iTdtkwSm1v+pqV289Uqn1NG
	aoeTw2OMKRHuEKDDJbUvGXdDPUO0WrIh1aKFUn+pT/NMuslw1+fO2IkjokUwOFU6d6b7Cm
	zi/cI4qDkrYCrIQsDunA6h+v+0wnj9m/tCFk7dRj/Jx9gfyJ1AM6dqeDAdLV0w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:57 +0200
Subject: [PATCH v5 08/11] PCI: j721e: Add reset GPIO to struct j721e_pcie
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v5-8-4b8c46711ded@bootlin.com>
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
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

From: Théo Lebrun <theo.lebrun@bootlin.com>

Add reset GPIO to struct j721e_pcie, so it can be used at suspend and
resume stages.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 98484f001562..9af4fd64c1f9 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -52,6 +52,7 @@ struct j721e_pcie {
 	u32			mode;
 	u32			num_lanes;
 	u32			max_lanes;
+	struct gpio_desc	*reset_gpio;
 	void __iomem		*user_cfg_base;
 	void __iomem		*intd_cfg_base;
 	u32			linkdown_irq_regfield;
@@ -508,6 +509,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			ret = dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get reset GPIO\n");
 			goto err_get_sync;
 		}
+		pcie->reset_gpio = gpiod;
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {

-- 
2.39.2


