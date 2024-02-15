Return-Path: <linux-i2c+bounces-1736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA1856759
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E2A28C7FF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFBA137C21;
	Thu, 15 Feb 2024 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XhQEl6ns"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB76C136660;
	Thu, 15 Feb 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010300; cv=none; b=ZXKlhN3lfAlY9/y28ED3O/gEMecHPlu/6qb/WnVnsyKrrQpGqrKBOzonkQFDVqHUhRBqOtQAeOZXtQqTiNFtCcwSK2Vo+PP0JuF3DAOlsuqHHMK62zLsMa3nEonNFm4WK6UxahIGTW+E4bXaylh62hdgv71dcP/kuTEqrsAVOi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010300; c=relaxed/simple;
	bh=syYHVSXzkqOe90sAyDghDGNg/hTKWhyvklSNl9vHdvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBBGHtNnOK84rzQoQbDaQR/da2LVmRcfNIoEQHybwzPnx7JblR3PGz0/tGiucrmTST7rzXOBWl+VyxjuKPncIVN0RXdh0enEMwNIItcQcSpVtFwsRTv9T4WRvI52wQznfj6euQzYLSRpNnv5PWfwGQb0GE5W9kErtIECmmHXToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XhQEl6ns; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43FEA24000C;
	Thu, 15 Feb 2024 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAFq8gnQLkAuZEJxQcdlNSuJ0c9RJtiPkL9kSYkKtUc=;
	b=XhQEl6nsOJlPT8bqe7eashq44KBh3BxprioEvTZsyIPqhvop6ahUCejb7pGmJ5XQwuRyz7
	QqpnhFMml0Gy6oioCZVhB/4e4SS/Y4ScyrXao0zB6/ES+ce4DGYSJW7hUUWUIf8mWUoBgT
	GyzAfQ6y2D4qwjLjRUuJTtdmmON2MBiTwJgcHlwZW+MLx5Oq6iK3GvQ3MyD3lMBtzWg95q
	ZwpNe/g5xi3m0+df9quWccZ2nQPU5uK248+MINd5p+rP/ElvpVXEnZYB6bilblwvmm51Wi
	j78mjF0m2xmhfP/4/HclzHyAnu1nCUCjJCeaIfULvh7mSVsG4bsZLRLtPqe2eg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:18:00 +0100
Subject: [PATCH v3 15/18] PCI: cadence: extract link setup sequence from
 cdns_pcie_host_setup()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-15-5c2e4a3fac1f@bootlin.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
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

The function cdns_pcie_host_setup() mixes probe structure and link setup.

The link setup must be done during the resume sequence. So extract it from
cdns_pcie_host_setup() and create a dedicated function.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c | 39 ++++++++++++++--------
 drivers/pci/controller/cadence/pcie-cadence.h      |  6 ++++
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 5b14f7ee3c79..93d9922730af 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -497,6 +497,30 @@ static int cdns_pcie_host_init(struct device *dev,
 	return cdns_pcie_host_init_address_translation(rc);
 }
 
+int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
+{
+	struct cdns_pcie *pcie = &rc->pcie;
+	struct device *dev = rc->pcie.dev;
+	int ret;
+
+	if (rc->quirk_detect_quiet_flag)
+		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
+
+	cdns_pcie_host_enable_ptm_response(pcie);
+
+	ret = cdns_pcie_start_link(pcie);
+	if (ret) {
+		dev_err(dev, "Failed to start link\n");
+		return ret;
+	}
+
+	ret = cdns_pcie_host_start_link(rc);
+	if (ret)
+		dev_dbg(dev, "PCIe link never came up\n");
+
+	return 0;
+}
+
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 {
 	struct device *dev = rc->pcie.dev;
@@ -533,20 +557,9 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 		return PTR_ERR(rc->cfg_base);
 	rc->cfg_res = res;
 
-	if (rc->quirk_detect_quiet_flag)
-		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
-
-	cdns_pcie_host_enable_ptm_response(pcie);
-
-	ret = cdns_pcie_start_link(pcie);
-	if (ret) {
-		dev_err(dev, "Failed to start link\n");
-		return ret;
-	}
-
-	ret = cdns_pcie_host_start_link(rc);
+	ret = cdns_pcie_host_link_setup(rc);
 	if (ret)
-		dev_dbg(dev, "PCIe link never came up\n");
+		return ret;
 
 	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
 		rc->avail_ib_bar[bar] = true;
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 373cb50fcd15..4c687aeb810e 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -515,10 +515,16 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 }
 
 #ifdef CONFIG_PCIE_CADENCE_HOST
+int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
 void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 			       int where);
 #else
+static inline int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
+{
+	return 0;
+}
+
 static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 {
 	return 0;

-- 
2.39.2


