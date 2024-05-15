Return-Path: <linux-i2c+bounces-3503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FA8C64A2
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C46285F60
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151EF7A705;
	Wed, 15 May 2024 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e6MO0lwS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351376057;
	Wed, 15 May 2024 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767304; cv=none; b=ZuBPNGpCCKqCuOYiEOZht+yq14nD+q9rDfI6GAckHa7iPvNQV+rLcxhQV+5kj2U/7Pg4jEsoS6n7GKz9YiAJmzP/Wdorkh0BR+3JjHqkwWkshxxRrvAgrdeP0QICiNk2gsWLQlhMXp/jRSPgm31DrknX7FRH3y0OPgAnKdU862M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767304; c=relaxed/simple;
	bh=D/mIw5PQXaVybV8q1M5tT5irn19bOqE7/C1r84b60EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrx3jAHyswVK36GahPj17WI/vKKWXnGrHFXWVAeCMeKn78nVdK4I82aL9o+WgZSddXS6/R+MiDfb5co/JLc9/iifW1eNvYL6xItGY5+ea1eY0rPiuGOwVKONyc8v/JeRpiAVi4BzWUaa9WFzBBZZhLNDe9Honbe8uiymdgdu0Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e6MO0lwS; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 898AF1BF217;
	Wed, 15 May 2024 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAhWJDZy3Qxtd03byX/QomLU+QUbXtxsEhEbMTufqk0=;
	b=e6MO0lwS8WgaP79vHG+A2B9FcakIel5UokK/xMHNp3rN6XT73NXrUUeCiZ/0zpYKT28nTy
	DnPPmEExwvUbrwB8PzZydR6+masYhW3x4BFcyWyK+y8LyTBRNjnaVwhchbFzOgCQ1W9tHI
	GHMMrqTf1k7DubnXxQGmTFWKzfsRcP+ldk+kPh/uqKAp0z7Yr508yk02AtGAyDFX6CWDP8
	xBiq9zsK0kUEDYTE0NNX0jaHUn8jRruaiS49gjS8TvvQXLVakS9jm1BLoFJe/LHdYgJgnR
	2ZxzVTAe+tbzSsizvTmzhrlXGxSQJ0D/gTnS5zWO7puFEMkCeIJqFgMHLSTSJw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 15 May 2024 12:01:10 +0200
Subject: [PATCH v6 09/12] PCI: j721e: Add reset GPIO to struct j721e_pcie
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v6-9-4656ef6e6d66@bootlin.com>
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


