Return-Path: <linux-i2c+bounces-1737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BB85675D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF5A1F25C22
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877F3137C4F;
	Thu, 15 Feb 2024 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZjIA2HtP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A9913698A;
	Thu, 15 Feb 2024 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010301; cv=none; b=GdvzNfrNiEc1vfbr3PMN5Md5DDo5rD6WklTDr4JF2SY0ZFCoR4y/ZiMonOOjFK5lbkiZd157nsATka2wb+LcDSLqhohj5gF57vU0VDahDrw91ESqn4WHDmilEFQh2VlJoI95N/0v2cGSc17XU6MW9rbAk2BbtRJI3TV+Lo0K5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010301; c=relaxed/simple;
	bh=2w2Jeas0HTHvkD1vXAGqgrRtxpU1SWleMSDVt8qU37E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+HRdB5OGZRrXJlbkxPFlOPffi8qx6Xu3lY8LEU3/Cy/8RG6hh3FHg2+pKONwp8EIFgb2PAHsjQMPwcb0fOH6TwLadO2c7qK+sxKYR9JGAVzEgafLcb+/CDeAv3ha1WQ7rh1WQY2Ov+pSXvtlTlHCy7xR1vhMVlupTP5F8ROhdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZjIA2HtP; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A70B240011;
	Thu, 15 Feb 2024 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIGGC0lj48fyJbGMqvl3dkIPzOEFiGF9ZPkrCVi5RWA=;
	b=ZjIA2HtPvJTv2WhUZQ0z3cbQUg92xBdAbXHiEtRpbgkaAfMA7t++pQjgY1WuiTONb17dnn
	016yjw4b87/Sp6OQHmKA+1Z51jFnWRRhHX6zKOdhaV8yP61/Cw34Oe2mvLttkUdqPIw193
	VOto2Ot9CprgUcZVdAEbZNEi9/jpa9dbxbA26VCmK/Xf/mV1Wo+tTP9UfRl0aNHUZjqoMr
	+kWfU5IRNUx5ZoHdQc7IBC67++fe/gxsNn5IbOa/TpM799uaFakht73vSrXG6sZbNWeiz7
	kpLbBs7Lnee7JuZmMtlQciobFKFbv1r0PehP9m8LLfeLjS6zz4JdZxo6DHqNsQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:18:01 +0100
Subject: [PATCH v3 16/18] PCI: cadence: set cdns_pcie_host_init() global
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-16-5c2e4a3fac1f@bootlin.com>
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

During the resume sequence of the host, cdns_pcie_host_init() needs to be
called, so set it global.

The dev function parameter is removed, as it isn't used.

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
index 4c687aeb810e..d55dfd173f22 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -516,6 +516,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 
 #ifdef CONFIG_PCIE_CADENCE_HOST
 int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
+int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
 void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 			       int where);
@@ -525,6 +526,11 @@ static inline int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
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


