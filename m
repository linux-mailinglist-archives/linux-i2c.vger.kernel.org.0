Return-Path: <linux-i2c+bounces-2173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B58705FA
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE9501F21C76
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E605A4C8;
	Mon,  4 Mar 2024 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Kc17rCqk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73B5916C;
	Mon,  4 Mar 2024 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566604; cv=none; b=jfqLKHJq8viUA+/smWIgA7/h8PQ3ZmKNWwXenU6nRkPoNZGrzbSsobX8EyA+PepoaY+OKkKqWASzgsqZYtxRfjXBAkTMYJ230TQgl9Sihrg5Nn81aN8ahIOYpBquxFsIkiDKeKxK+5RHSmUwLOOJOfcxGeezqCJpV0ogoiqrg8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566604; c=relaxed/simple;
	bh=D/mIw5PQXaVybV8q1M5tT5irn19bOqE7/C1r84b60EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQJstz21pLw1Ss8sYpPBpYkQh0AR+nHvGjo6Gz3G4gMREwuKkZkOoIJkKbYrXAFgI5j31+bh1d+JBrhQck0LyjLaq862dmX5SGHEf4GeA8baKnGDCSmJ+ssQnBHy9EjiDz6dhGGm+rEmwVL/uIs6cx2LzbE0djvF7Nzj9+0iRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Kc17rCqk; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 155381BF207;
	Mon,  4 Mar 2024 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAhWJDZy3Qxtd03byX/QomLU+QUbXtxsEhEbMTufqk0=;
	b=Kc17rCqkc6LOuhYPwzljGg/aEZQJ8pXDhF6R5AXxVwGA3rWUtr6nJ+P/hf1YcshHcsgfln
	r3emNG6lXMTbJ0PzSHKu5p+6lxRGBaBfH5U26dL9aGFQilO5dcI04j9QqvWFLrX6gLXu55
	44G9/+PQVO9Js+sc7Ok4WYHoEFsPLM5dIM3oceE8QEYk4r1obpEnDwGTkDTW8HN9OIvNMb
	T2EUi1aDs0gMPskOlN08SRld8nN/yfZ6LT4POBBN2f26/mqHy+7JiM54p4LFoC+FRGzIDC
	+Ul80YVITQ4Tlr/nA2VCuukU/XrDcfSEDHcq2vNFaMcme9jU19vIfIJ+TQnjZA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:36:00 +0100
Subject: [PATCH v4 17/18] PCI: j721e: Add reset GPIO to struct j721e_pcie
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v4-17-6f1f53390c85@bootlin.com>
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


