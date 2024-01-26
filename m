Return-Path: <linux-i2c+bounces-1470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA783DC7F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4807F1F2A0D0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06AC21104;
	Fri, 26 Jan 2024 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NLM/H13H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB420DCF;
	Fri, 26 Jan 2024 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279892; cv=none; b=WG3WODMBHb7ifkh6PnYK//6B0Vewhw0x+jbAkeJr+spW+/dCoP6heq1vHhEcpwYkZYxgW/qHElmLytkvWfY2QiHYaLz1cNVzRmTr+SiZTJSNtsxttqkO969Owm5spLNhHxmH7/IKfnPO53VS1iZsa0LoifhB009snluECozwgmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279892; c=relaxed/simple;
	bh=EpowN3MVwFfCca/NjDDLYiLhwhML2WXMPwNVeRQX9Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGaXKcaI9oeCUp1ZMjnietK2XaQ9NBuwROVTOieMq0ScB1S7XItwAaElOFiI0exXdc4nn8aT6Po5LmSP+BtEejIKOL03P0rPbUQXBm9eABA4/7ErRk4eOnDRayJ9BTwRbfTyu4viUMP1IIQnBvAYTV0GzlPy8N+uJunxhlxxC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NLM/H13H; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECC734000C;
	Fri, 26 Jan 2024 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcccQt60PbgXpfFYlxstnMtRY1ZKZ/mBq6e6WJEE79I=;
	b=NLM/H13Hw/PkB6gbvbxB84bToMata8sGd+8fNgBMPoCQyJBCFw7ww/kaf4etU5S8sBoSba
	qEXCwG03S1uvdeiaBigfX6iJ5K+LnYAemVXCIpZXWPF+Re9gI+xG5sjsYMPLHSNthiO8Mv
	Ox1r1V7G4eJL7pNLmSx7Ew6p21yyF9d12y0Fx+OJmSD8HUvazkJY8K6ZbI15tLVr4qtajv
	Rpim2RT9MllbJPXO9Bi9DugU+P79Qr0qvkKh1IjKFprTSYdMIbQoch6YWVhDADzwN3iNyM
	zdxtkji3XSDQCuK1XLF9te52H/2uQq2JGQAsYthPAoyMm5PVOTufu34ERyKZZg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:55 +0100
Subject: [PATCH v2 13/15] PCI: cadence: add resume support to
 cdns_pcie_host_setup()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v2-13-8e4f7d228ec2@bootlin.com>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

That function mixes probe structure init and hardware config.
The whole hardware config part must be done at resume after a suspend to
ram.
We therefore pass it a boolean flag determining if we are at probe or at
resume.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c         |  2 +-
 drivers/pci/controller/cadence/pcie-cadence-host.c | 49 ++++++++++++----------
 drivers/pci/controller/cadence/pcie-cadence-plat.c |  2 +-
 drivers/pci/controller/cadence/pcie-cadence.h      |  4 +-
 4 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 2c87e7728a65..9b343a46da11 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -509,7 +509,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			gpiod_set_value_cansleep(gpiod, 1);
 		}
 
-		ret = cdns_pcie_host_setup(rc);
+		ret = cdns_pcie_host_setup(rc, true);
 		if (ret < 0) {
 			clk_disable_unprepare(pcie->refclk);
 			goto err_pcie_setup;
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 5b14f7ee3c79..dd4d876a9138 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -497,14 +497,14 @@ static int cdns_pcie_host_init(struct device *dev,
 	return cdns_pcie_host_init_address_translation(rc);
 }
 
-int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
+int cdns_pcie_host_setup(struct cdns_pcie_rc *rc, bool probe)
 {
 	struct device *dev = rc->pcie.dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
 	struct pci_host_bridge *bridge;
 	enum cdns_pcie_rp_bar bar;
-	struct cdns_pcie *pcie;
+	struct cdns_pcie *pcie = &rc->pcie;
 	struct resource *res;
 	int ret;
 
@@ -512,26 +512,27 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	if (!bridge)
 		return -ENOMEM;
 
-	pcie = &rc->pcie;
-	pcie->is_rc = true;
+	if (probe) {
+		pcie->is_rc = true;
 
-	rc->vendor_id = 0xffff;
-	of_property_read_u32(np, "vendor-id", &rc->vendor_id);
+		rc->vendor_id = 0xffff;
+		of_property_read_u32(np, "vendor-id", &rc->vendor_id);
 
-	rc->device_id = 0xffff;
-	of_property_read_u32(np, "device-id", &rc->device_id);
+		rc->device_id = 0xffff;
+		of_property_read_u32(np, "device-id", &rc->device_id);
 
-	pcie->reg_base = devm_platform_ioremap_resource_byname(pdev, "reg");
-	if (IS_ERR(pcie->reg_base)) {
-		dev_err(dev, "missing \"reg\"\n");
-		return PTR_ERR(pcie->reg_base);
-	}
+		pcie->reg_base = devm_platform_ioremap_resource_byname(pdev, "reg");
+		if (IS_ERR(pcie->reg_base)) {
+			dev_err(dev, "missing \"reg\"\n");
+			return PTR_ERR(pcie->reg_base);
+		}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
-	rc->cfg_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(rc->cfg_base))
-		return PTR_ERR(rc->cfg_base);
-	rc->cfg_res = res;
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+		rc->cfg_base = devm_pci_remap_cfg_resource(dev, res);
+		if (IS_ERR(rc->cfg_base))
+			return PTR_ERR(rc->cfg_base);
+		rc->cfg_res = res;
+	}
 
 	if (rc->quirk_detect_quiet_flag)
 		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
@@ -555,12 +556,14 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	if (ret)
 		return ret;
 
-	if (!bridge->ops)
-		bridge->ops = &cdns_pcie_host_ops;
+	if (probe) {
+		if (!bridge->ops)
+			bridge->ops = &cdns_pcie_host_ops;
 
-	ret = pci_host_probe(bridge);
-	if (ret < 0)
-		goto err_init;
+		ret = pci_host_probe(bridge);
+		if (ret < 0)
+			goto err_init;
+	}
 
 	return 0;
 
diff --git a/drivers/pci/controller/cadence/pcie-cadence-plat.c b/drivers/pci/controller/cadence/pcie-cadence-plat.c
index 0456845dabb9..071423091668 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-plat.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-plat.c
@@ -86,7 +86,7 @@ static int cdns_plat_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		ret = cdns_pcie_host_setup(rc);
+		ret = cdns_pcie_host_setup(rc, true);
 		if (ret)
 			goto err_init;
 	} else {
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 373cb50fcd15..3b0da889ed64 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -515,11 +515,11 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 }
 
 #ifdef CONFIG_PCIE_CADENCE_HOST
-int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
+int cdns_pcie_host_setup(struct cdns_pcie_rc *rc, bool probe);
 void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 			       int where);
 #else
-static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
+static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc, bool probe)
 {
 	return 0;
 }

-- 
2.39.2


