Return-Path: <linux-i2c+bounces-2170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 188F48705E9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C780E2853AB
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31B658122;
	Mon,  4 Mar 2024 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DYGTkPWE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320E56B98;
	Mon,  4 Mar 2024 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566599; cv=none; b=keAR3yNcssE+WO6XKCClRP2Kj+XFHTGuqmPS6ljWtWAa6zc5brmsAPuWIcU/e4Aom5ue5+OvSmU4XxZQBU7cStbGYFPprk1F23T5+/xSDa/e797UoDh8yTOyk6RCPiQ0SjslVi/GucINBsm4Z56BF6pEoWEhhrnzTOFzP6uCK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566599; c=relaxed/simple;
	bh=PuFPfR2lIZ+bkqMkJWaCoXVb8zQMzKhIXQuBGxgZ6Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfwmF6mb913x9uh55jn+GJiZv8Dxyd7RGsW9Iop238NKNm4z0xbp0OiHmJOrTc3Kcm2DxhxEqDUkjHJmmHdyxv42BoELvWL1BKL+XCnPW3DJn+0emUdMszrkTUMI/3yit05jgdUqYTMUhVt1CIqOKlbOJpM36C+FlYg4oesn0hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DYGTkPWE; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 771F61BF20B;
	Mon,  4 Mar 2024 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DaC56o2wBLHPxa2Ttp6Fja2dcIvmi8wc4P6dTqN62vk=;
	b=DYGTkPWEslLKG8HWGpJ11wN+i6/cmO4SQCQb8RAV5EJtc4xXnvBDg6XQ/AXZOu2gFCUsAG
	2+t6wdveq+JnF/wbiAGysqVcbo4f5C9KpKqmamF7ZOEBhmiCTDHKT7ZHqlNSyc1gzZFl8J
	PU2u1fQ4dS6Fy6Lt3hhCCEJcMKNNrgp1PX53fvt/ufDHll2jicK16x89I2iVdXlIF/7fXB
	hTMI3Ggc4WoGOgLD3mrg+4KXl7r+jExKUw99Tbha9BIGIwc40Yz2vAHgF66nE0bOeLL2mz
	HS8lsbqZgkSVRWLF+kzb+jeVF54C6wzLxx+XEz/VVc9KzUZqddt0Ley+aYbBDA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:57 +0100
Subject: [PATCH v4 14/18] PCI: cadence: Extract link setup sequence from
 cdns_pcie_host_setup()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-14-6f1f53390c85@bootlin.com>
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
 Thomas Richard <thomas.richard@bootlin.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

The function cdns_pcie_host_setup() mixes probe structure and link setup.

The link setup must be done during the resume sequence. So extract it from
cdns_pcie_host_setup() and create a dedicated function.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
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
index 03b96798f858..9ca2ffca0bf9 100644
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


