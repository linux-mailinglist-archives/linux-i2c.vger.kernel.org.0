Return-Path: <linux-i2c+bounces-2969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D78A6C6A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F051F21693
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8920612FB27;
	Tue, 16 Apr 2024 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F8cf1O9I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125E12C478;
	Tue, 16 Apr 2024 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274224; cv=none; b=Q+ZZIXCCUICzkBjvjvuOIckIlemFDtLpxfBLKVUW3i9HjlikkdJTUrqDPrkW2HhFC4pHsbHLz7rDQkpO6I2m29uRq2m1w+087AImR4hs/DRpnMuEPRosXwvfWmpIpOZcIsc1UjcauvZNr16h3XcKvP53LmBI6Xme9hYkSz//kJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274224; c=relaxed/simple;
	bh=apSBWBKkMJNnStRx/8dtwDw22jEGIZT4fi1c5kvCSMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSKkfti0NEwUibT7tR1YZebjjRAhRb8MsHWLS818j4Ko2Ui5fdXL3snI76pa6C08epvofFlxNqehkyXPPNcCcash6kuJNDqhvs7PNux+pSbY/ughuzhsODSuxSQOztQy9zbjK+snEpe6OAt5vCqd7nmzNLPW8vplF2JBppkAmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F8cf1O9I; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A22440005;
	Tue, 16 Apr 2024 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQ53IDpfy/dBPYCwYJ4Ymr6E23RYTC0CIbeHa3tWtTg=;
	b=F8cf1O9IxBO6J5zYRX0n+xuJoI1K6jL7NE11uqLLladeK9287DQA1RAP/LuN/9RXbHBONh
	oizfCMNvVa19tEPNhXEtTXXA+f8oCo9GalSsuI5SAEMbcIyrFy86EWCHKZmodPPJoCOiLN
	rQy/hB+ZXh5cf8f7Inwc69xy65+9x4bOHm+quNTjR06RMnDcAYFA1A5+CJkXVFQ5iaSrzP
	wV5FC56jNr9Mqc08kcCPvr5PR6p2NT7DWgulBuV9QL+7TUSE6qs2woEKVW1XECqrwv7k2W
	J/5/53Z0ZjgpBlRuBPrP6i2/97d4kCsDrY0xP5AGDAdDSewrvLwjipScz1otWA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:55 +0200
Subject: [PATCH v5 06/11] PCI: cadence: Set cdns_pcie_host_init() global
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v5-6-4b8c46711ded@bootlin.com>
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

During the resume sequence of the host, cdns_pcie_host_init() needs to be
called, so set it global.

The dev function parameter is removed, as it isn't used.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c | 5 ++---
 drivers/pci/controller/cadence/pcie-cadence.h      | 6 ++++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 93d9922730af..8af95e9da7ce 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -485,8 +485,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	return cdns_pcie_host_map_dma_ranges(rc);
 }
 
-static int cdns_pcie_host_init(struct device *dev,
-			       struct cdns_pcie_rc *rc)
+int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
 {
 	int err;
 
@@ -564,7 +563,7 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
 		rc->avail_ib_bar[bar] = true;
 
-	ret = cdns_pcie_host_init(dev, rc);
+	ret = cdns_pcie_host_init(rc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 1d37d5f9f811..bb215aeebf20 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -522,6 +522,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 
 #ifdef CONFIG_PCIE_CADENCE_HOST
 int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
+int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
 void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 			       int where);
@@ -531,6 +532,11 @@ static inline int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
 	return 0;
 }
 
+static inline int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
+{
+	return 0;
+}
+
 static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 {
 	return 0;

-- 
2.39.2


