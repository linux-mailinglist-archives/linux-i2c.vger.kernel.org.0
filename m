Return-Path: <linux-i2c+bounces-1302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA182DD30
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BA5FB20F9B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9809E17BB3;
	Mon, 15 Jan 2024 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RKiq6PED"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9305179AF;
	Mon, 15 Jan 2024 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07E69C0004;
	Mon, 15 Jan 2024 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHlgHmhFQdKKCDXxYc/ggNFFXgHMuRi1rAK2fpmgtw0=;
	b=RKiq6PEDFJewrIz560B/cQ7e8tySHH9TYfN2TIIxHo7jCa0ynZHX3RDfG0oFlfnFvvOssw
	u144gWBkomeblDYKinfqJUIYWK1WMtw9qjsgs7ng8lZ2ypTKhVLM9zmHr6dJ63EVQXQwde
	eThjBltyddSiqdCcYecfV4PIMB8UcX9g6arV7Nop89YqbkWUTlUPpNMmLqMdDR+4irOTBT
	440oP+5rcQZtcYkgHtRWUSEVkdd1WLtoyBxz9Faf4iL6d2dKxvhoH4OaD4imIxpLc2MVR6
	vK/ktLLz9ZcJhB9krkUmpZJHTB1l5Lkga5nXC/T7b3uLnVm8CyR1WQbqjXSCAg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:46 +0100
Subject: [PATCH 05/14] phy: ti: phy-j721e-wiz: make wiz_clock_init callable
 multiple times
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v1-5-84e55da52400@bootlin.com>
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
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

For suspend and resume support, wiz_clock_init needs to be called
multiple times.
Add a parameter to wiz_clock_init to be able to skip clocks
registration.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 60 +++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index fc3cd98c60ff..09f7edf16562 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1076,7 +1076,7 @@ static int wiz_clock_register(struct wiz *wiz)
 	return ret;
 }
 
-static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
+static int wiz_clock_init(struct wiz *wiz, struct device_node *node, bool probe)
 {
 	const struct wiz_clk_mux_sel *clk_mux_sel = wiz->clk_mux_sel;
 	struct device *dev = wiz->dev;
@@ -1087,14 +1087,36 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 	int ret;
 	int i;
 
-	clk = devm_clk_get(dev, "core_ref_clk");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "core_ref_clk clock not found\n");
-		ret = PTR_ERR(clk);
-		return ret;
+	if (probe) {
+		clk = devm_clk_get(dev, "core_ref_clk");
+		if (IS_ERR(clk)) {
+			dev_err(dev, "core_ref_clk clock not found\n");
+			ret = PTR_ERR(clk);
+			return ret;
+		}
+		wiz->input_clks[WIZ_CORE_REFCLK] = clk;
+
+		if (wiz->data->pma_cmn_refclk1_int_mode) {
+			clk = devm_clk_get(dev, "core_ref1_clk");
+			if (IS_ERR(clk)) {
+				dev_err(dev, "core_ref1_clk clock not found\n");
+				ret = PTR_ERR(clk);
+				return ret;
+			}
+			wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
+		}
+
+		clk = devm_clk_get(dev, "ext_ref_clk");
+		if (IS_ERR(clk)) {
+			dev_err(dev, "ext_ref_clk clock not found\n");
+			ret = PTR_ERR(clk);
+			return ret;
+		}
+		wiz->input_clks[WIZ_EXT_REFCLK] = clk;
 	}
-	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
 
+
+	clk = wiz->input_clks[WIZ_CORE_REFCLK];
 	rate = clk_get_rate(clk);
 	if (rate >= 100000000)
 		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x1);
@@ -1121,14 +1143,7 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 	}
 
 	if (wiz->data->pma_cmn_refclk1_int_mode) {
-		clk = devm_clk_get(dev, "core_ref1_clk");
-		if (IS_ERR(clk)) {
-			dev_err(dev, "core_ref1_clk clock not found\n");
-			ret = PTR_ERR(clk);
-			return ret;
-		}
-		wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
-
+		clk = wiz->input_clks[WIZ_CORE_REFCLK1];
 		rate = clk_get_rate(clk);
 		if (rate >= 100000000)
 			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
@@ -1136,20 +1151,17 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
 	}
 
-	clk = devm_clk_get(dev, "ext_ref_clk");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "ext_ref_clk clock not found\n");
-		ret = PTR_ERR(clk);
-		return ret;
-	}
-	wiz->input_clks[WIZ_EXT_REFCLK] = clk;
-
+	clk = wiz->input_clks[WIZ_EXT_REFCLK];
 	rate = clk_get_rate(clk);
 	if (rate >= 100000000)
 		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x0);
 	else
 		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x2);
 
+	/* What follows is about registering clocks. */
+	if (!probe)
+		return 0;
+
 	switch (wiz->type) {
 	case AM64_WIZ_10G:
 	case J7200_WIZ_10G:
@@ -1592,7 +1604,7 @@ static int wiz_probe(struct platform_device *pdev)
 		goto err_get_sync;
 	}
 
-	ret = wiz_clock_init(wiz, node);
+	ret = wiz_clock_init(wiz, node, true);
 	if (ret < 0) {
 		dev_warn(dev, "Failed to initialize clocks\n");
 		goto err_get_sync;

-- 
2.39.2


