Return-Path: <linux-i2c+bounces-2163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 334508705E8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A925FB2AE31
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECE15339E;
	Mon,  4 Mar 2024 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X03KZaMn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E700650A60;
	Mon,  4 Mar 2024 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566586; cv=none; b=oh4WbThTEqiBwvb04J97Kwii2VvJcu2cK/I2CT/M9lqRG3nZanpdykVTfd/yIi24a5JLy8G90RozbA6xH8ubXfnTx3r2T8xM9D3NNSMlZ5xTdUwfHVmd+T63FW7KXxI2+/IyVy73figvJSm/QwRyxBYSgYXcfl61dFsasYj2sUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566586; c=relaxed/simple;
	bh=osgmdvXSJkfMV1DA1d133SaaMOhn/y5ZbIIEQNjoG3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLzIdD2eyufh3/zY5S5cBLaIx4nLM2rdfaCGFYEljUDCLQy0rS9Z5bPmCOC33ZAeRaJDfuz1h27qKwxj/LRe2/8v18iaPjA8eTr6cPQDMoBG97A3g0azeEN4F2yTpxIO2f/DD3W1i1UUGOAA87vGiKoeCsSMMFFBjfU4ivDGla8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X03KZaMn; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7D041BF20F;
	Mon,  4 Mar 2024 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atrvTInBTa9ftnt4eeX7cpQDhxNmTdh+W88IDH8sTxw=;
	b=X03KZaMnWcCRGT68bktpQfrNroVp3VtpQkl5woOBUaf3UYJV1shpZHNcYvQYTA1JqhAmQ3
	uHVpfl7dR/RzKXB90qOYy2fe1QyCoQVQNf8kL0Honv54htsH0aofSW34InidaoLQJisVB/
	xSIEd/+t+dW5Dppc56fC+M4MR74fQMXaPVgXGAhpKIymZsbUpbAGhZP44IrOFIzslfnb8B
	r1y/7Rmsm9xqfTj7Ig5mobitM/gBV4MF1X2p3ERVOXTd4cmgLXuzwO73X8G6mIn50pI+RO
	noSKKK9vjPwnKJBsxo6ot75ctGaiKYBtWx85UVqvpQ++r3AQ6DvyMy5KQtGQ+A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:50 +0100
Subject: [PATCH v4 07/18] phy: ti: phy-j721e-wiz: split wiz_clock_init()
 function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-7-6f1f53390c85@bootlin.com>
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

The wiz_clock_init() function mixes probe and hardware configuration.
Rename the wiz_clock_init() to wiz_clock_probe() and move the hardware
configuration part in a new function named wiz_clock_init().

This hardware configuration sequence must be called during the resume
stage of the driver.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 67 ++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 5fea4df9404e..0e3cb1ed5a52 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1076,26 +1076,12 @@ static int wiz_clock_register(struct wiz *wiz)
 	return ret;
 }
 
-static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
+static void wiz_clock_init(struct wiz *wiz)
 {
-	const struct wiz_clk_mux_sel *clk_mux_sel = wiz->clk_mux_sel;
-	struct device *dev = wiz->dev;
-	struct device_node *clk_node;
-	const char *node_name;
 	unsigned long rate;
-	struct clk *clk;
-	int ret;
-	int i;
-
-	clk = devm_clk_get(dev, "core_ref_clk");
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk),
-				     "core_ref_clk clock not found\n");
 
-	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
-
-	rate = clk_get_rate(clk);
-	if (rate >= 100000000)
+	rate = clk_get_rate(wiz->input_clks[WIZ_CORE_REFCLK]);
+	if (rate >= REF_CLK_100MHZ)
 		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x1);
 	else
 		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x3);
@@ -1119,6 +1105,39 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 		break;
 	}
 
+	if (wiz->input_clks[WIZ_CORE_REFCLK1]) {
+		rate = clk_get_rate(wiz->input_clks[WIZ_CORE_REFCLK1]);
+		if (rate >= REF_CLK_100MHZ)
+			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
+		else
+			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
+
+	}
+
+	rate = clk_get_rate(wiz->input_clks[WIZ_EXT_REFCLK]);
+	if (rate >= REF_CLK_100MHZ)
+		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x0);
+	else
+		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x2);
+}
+
+static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
+{
+	const struct wiz_clk_mux_sel *clk_mux_sel = wiz->clk_mux_sel;
+	struct device *dev = wiz->dev;
+	struct device_node *clk_node;
+	const char *node_name;
+	struct clk *clk;
+	int ret;
+	int i;
+
+	clk = devm_clk_get(dev, "core_ref_clk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "core_ref_clk clock not found\n");
+
+	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
+
 	if (wiz->data->pma_cmn_refclk1_int_mode) {
 		clk = devm_clk_get(dev, "core_ref1_clk");
 		if (IS_ERR(clk))
@@ -1126,12 +1145,6 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 					     "core_ref1_clk clock not found\n");
 
 		wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
-
-		rate = clk_get_rate(clk);
-		if (rate >= 100000000)
-			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
-		else
-			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
 	}
 
 	clk = devm_clk_get(dev, "ext_ref_clk");
@@ -1141,11 +1154,7 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 
 	wiz->input_clks[WIZ_EXT_REFCLK] = clk;
 
-	rate = clk_get_rate(clk);
-	if (rate >= 100000000)
-		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x0);
-	else
-		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x2);
+	wiz_clock_init(wiz);
 
 	switch (wiz->type) {
 	case AM64_WIZ_10G:
@@ -1589,7 +1598,7 @@ static int wiz_probe(struct platform_device *pdev)
 		goto err_get_sync;
 	}
 
-	ret = wiz_clock_init(wiz, node);
+	ret = wiz_clock_probe(wiz, node);
 	if (ret < 0) {
 		dev_warn(dev, "Failed to initialize clocks\n");
 		goto err_get_sync;

-- 
2.39.2


