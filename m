Return-Path: <linux-i2c+bounces-1730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C43856787
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94195B26207
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26271350DD;
	Thu, 15 Feb 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hxT15fox"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD613472D;
	Thu, 15 Feb 2024 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010293; cv=none; b=DMaamLEk1wGc7gaMYCALjKQOy+mdh7vnE4bTF5gzxP+Ht0u0deOmkDPbKVPflLep+g0dxF2NeA9ldGZysVl87ZgrB+3FLYMT1I3Bcr2+ICMt9AJwisMLkANeNjywdcGqZsKABq5HVPng5twicPkUvkZX32YaCt03wmedjNlGOi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010293; c=relaxed/simple;
	bh=0rF0ydUKx8DNLmpqL/zl2WtbHYCxIoALNzEdbFbOyKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LprEVNhoYTP7bJoC3VGuj2dpYC65/PAVL7dbbpSax1KsK1RcFvmc0Vg58U3msOuHAVvBKy1vsihpTyaEWlreFrKbXw+F+/nNG0ypCSx3lS1A8jkEVcqlgiE3j0Iu4CqPMLRY602pzAWriFklPV2C/S8TzvI0aMSh0e4KODM7hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hxT15fox; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C55F240010;
	Thu, 15 Feb 2024 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elGcazR3RAYdE1WwV1YDwOp1CVUqVY3SVp9Rpe8awS8=;
	b=hxT15foxAPdxrh9+jDZrsMZme2b4pSEQWPLGbELqJ7wHekbnDI4a/szJ/LLrGNVMRlaSiw
	076ABYE/WZmzZMwjI3bycuJPack20ILG4yg725ztMdc5CLGRPzyWHCtY1zKp+4/3VHEhsB
	SRKDRfcJ4e7PDc0SNPOL5DehAGDQpTlBOPVJfwxDpK4dUIsvOuWZLjHxGw8oRUXPTuoGds
	VVaGdH6s2ZhGypPJZDxGJnOGgSJiO/ebirE1trq8DkcfdN8VOvRN7PbNr6vDC2FY7AVAXg
	vX4lNr7DwDKjfJiqYEZWBkqihZ7ZyoYTqVtaghUUkQGyyc1RBvJtUHZptjjzhw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:54 +0100
Subject: [PATCH v3 09/18] phy: ti: phy-j721e-wiz: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v3-9-5c2e4a3fac1f@bootlin.com>
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

Add resume support.
It has been tested on J7200 SR1.0 and SR2.0.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 45c5a4e9cd12..cde38182e34c 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1660,12 +1660,41 @@ static void wiz_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 }
 
+static int wiz_resume_noirq(struct device *dev)
+{
+	struct device_node *node = dev->of_node;
+	struct wiz *wiz = dev_get_drvdata(dev);
+	int ret;
+
+	/* Enable supplemental Control override if available */
+	if (wiz->sup_legacy_clk_override)
+		regmap_field_write(wiz->sup_legacy_clk_override, 1);
+
+	wiz_clock_init(wiz);
+
+	ret = wiz_init(wiz);
+	if (ret) {
+		dev_err(dev, "WIZ initialization failed\n");
+		goto err_wiz_init;
+	}
+
+	return 0;
+
+err_wiz_init:
+	wiz_clock_cleanup(wiz, node);
+
+	return ret;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(wiz_pm_ops, NULL, wiz_resume_noirq);
+
 static struct platform_driver wiz_driver = {
 	.probe		= wiz_probe,
 	.remove_new	= wiz_remove,
 	.driver		= {
 		.name	= "wiz",
 		.of_match_table = wiz_id_table,
+		.pm	= pm_sleep_ptr(&wiz_pm_ops),
 	},
 };
 module_platform_driver(wiz_driver);

-- 
2.39.2


