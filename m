Return-Path: <linux-i2c+bounces-1729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A013F856755
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4ECEB2AD4F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C92134CF8;
	Thu, 15 Feb 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gg8LSpng"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3F0133996;
	Thu, 15 Feb 2024 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010293; cv=none; b=QDjL1FSFy6LfPRJg+TiyrIVScAe9VnDmJxfIAakydEDR3rMqSv6257742aTfnbiVrZe9iS32Vm16UuLU6dy15yzYPByoxeKCACFm47/O5L1NIRvn1hDjqUR2304VVUnb3JMsx54yV79rchvIZSc9tZ6FDWHESpaW9plj1mIPMdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010293; c=relaxed/simple;
	bh=e8PnsOii99gP0WA1XiPKpyChAqiQWSXdi7Ps4pRmQWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLTTiceF5y64OH2g/lWJ5xONVcyT6JVEi1puW2ub0/o3NQuKYA1V/8VPndgrG+NIcbGhohqzr5i4RCXkeXYz2K/F5MG+dWmWkyfvIJbC7ZXevZUtjtkGBjS0Z9eh6MUORu4IZRfzQQje+rsjPosAtrmKe9h+JvQcjKPxaGh1qg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gg8LSpng; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8674D24000C;
	Thu, 15 Feb 2024 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1V15uXYgQovRfHKkboS9SmVJZ6AkIUbwkHyEKcbL1E=;
	b=gg8LSpngj0cgh6SQ5tDzggpeMP+2IxDATwuUVkbIqHMrw16NmysDOc3hrVYBH0vJ7zbilS
	cYPTI8ULj3TpzeK9LhxhUJ8Q4u64dJqIvvVC9h1K8RuPe5f3LSXPoOXtEc5AyQW/1jnlcd
	8VM2zrisMKFufiPbpa8CzNUB0Ug8CL0M05l0UkOKzyYoGuhPjRcyiPr1vtT95jZMjsVgJO
	B7QyabGQf/i0NwG7+tBwo2rL9u1iHiiB+44dM4/V6ZH4zuu4Ak1IoYnqMVfBMie5548gIp
	gs8Zm9DT4yckBC7P5w0lnPZSiAXLQetc7HfzuGew1/mjZ2H2lOdFly2qQCFy3g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:53 +0100
Subject: [PATCH v3 08/18] phy: ti: phy-j721e-wiz: split wiz_clock_init()
 function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-8-5c2e4a3fac1f@bootlin.com>
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

The wiz_clock_init() function mixes probe and hardware configuration.
Rename the wiz_clock_init() to wiz_clock_probe() and move the hardware
configuration part in a new function named wiz_clock_init().

This hardware configuration sequence must be called during the resume
stage of the driver.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 65 ++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ce8a99801a4c..45c5a4e9cd12 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1076,25 +1076,11 @@ static int wiz_clock_register(struct wiz *wiz)
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
-
-	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
 
-	rate = clk_get_rate(clk);
+	rate = clk_get_rate(wiz->input_clks[WIZ_CORE_REFCLK]);
 	if (rate >= 100000000)
 		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x1);
 	else
@@ -1119,6 +1105,39 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 		break;
 	}
 
+	if (wiz->input_clks[WIZ_CORE_REFCLK1]) {
+		rate = clk_get_rate(wiz->input_clks[WIZ_CORE_REFCLK1]);
+		if (rate >= 100000000)
+			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
+		else
+			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
+
+	}
+
+	rate = clk_get_rate(wiz->input_clks[WIZ_EXT_REFCLK]);
+	if (rate >= 100000000)
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


