Return-Path: <linux-i2c+bounces-1464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F23BF83DC5D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9299CB2A733
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291DF1DFED;
	Fri, 26 Jan 2024 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fumspxXR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE71EB2C;
	Fri, 26 Jan 2024 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279876; cv=none; b=iG0ePickwu8OlVcUy+nc9RT07H6pmwCdDvsS2szyMq7phyLAU7Jrx+gZ/q21rFWjPWVcda22XzcJBcL9kvRPBU9WuW+CcAUZq035hDA6fjV040Cj9NkP2ihpS56XT15sh284zB8RSMLvqt0tuUARgAXrBpePH9X+ZFlnj+gOtxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279876; c=relaxed/simple;
	bh=gbQeK8jnzyoTJOAZKidUReVLJKue9e9o4CaN2088Z+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlCs07dl6qbIDf9HZmO8Ny/HIu2tdGdBi2TC+prgTgSuIn0z/9CrzLI2jOGISM8AyPHKmDcvbnSa11DnuFgFqqAnVTs5T2zML2mjVfzOfuE/PwUJQaCbTNPtu5yZPR7Ky3rHGEHrkq4j2iKz4BBYLY1pPZfUTbEmrvf9ZrewOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fumspxXR; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 466B04000F;
	Fri, 26 Jan 2024 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I18NFvlzsoQfZSmja7rXdApCroRS70XYkOT3y7UrK2g=;
	b=fumspxXRNw5UiOEesNyasc94ujx9HeTv582Up4GE0IaxaMpACWSc19XX5ZdiGHjcP2H5Cy
	foG4E5lxEtWWThdX+GRtdP2ppslw2kiq5USgOYsDkwvI9D/yQVdURPKIBjKtBoRn8kRSzM
	qd+FZ0ZJfKxIGSn9ziVAPpNEp8aCgkND7XQ1tlUdLFz+kb7b+CI2szTvaf8bkshv1Gx0Js
	5UMY6+3ARpLmSGbzwOlqLZfz6tkvjZkcq2FW6rycjJSzffzsw8vQd3xumCNWCzSpQ5cLQQ
	feZjVdsEItXk5zxcz5wk+R/ZcGQs7JLBDLCXqc4Oc9Vg8bDFrhe3XB3qMirEjQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:49 +0100
Subject: [PATCH v2 07/15] phy: ti: phy-j721e-wiz: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v2-7-8e4f7d228ec2@bootlin.com>
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

Add resume support.
It has been tested on J7200 SR1.0 and SR2.0.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 09f7edf16562..163ac3e95ddb 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1666,12 +1666,47 @@ static void wiz_remove(struct platform_device *pdev)
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
+	ret = wiz_clock_init(wiz, node, false);
+	if (ret < 0) {
+		dev_warn(dev, "Failed to initialize clocks\n");
+		goto err_get_sync;
+	}
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
+err_get_sync:
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


