Return-Path: <linux-i2c+bounces-2162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E6E8705BD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25DC288A55
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052C4524BF;
	Mon,  4 Mar 2024 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oXi19VKF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37808487AE;
	Mon,  4 Mar 2024 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566584; cv=none; b=q5oJbsa5/pY7wKsJkwpbWgWDmQZHXuS4hEGCCcGlNxIxcdm8CalAVkj73Zfj8QTZGLkIQZu5c6znxq8teBRG0Vcrc0kEBgdmKqjbNNUF/xcHNEMJLpmttIF91r3QVVvjyDM/arL5SfcttQQ9T8K9i6MPE9q60xaCQS2tkcjppUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566584; c=relaxed/simple;
	bh=gDGwcPUlhrJ58tTxtAf4S10aFgybKlZmlLgO5JE33HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aU8DvyJ8G9Tu5eP8h2/LTIispX6OWIcr/zs4YSY3QKnhhm+kRPt1rsZ0X3QkUeB4xjMTicjv+pqgii1BbeIWq4mjxgVg2xsQGAg46wXE5bzMYw+AFZQC06KxWEHQJzBCGZ5EguRbDQGAV2sRGFLk5UYLxTF6NxKyrH9r6hXIkCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oXi19VKF; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D52811BF20E;
	Mon,  4 Mar 2024 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9MU9XELe1rM5Qiqxbtkg8dW/yfnlPXWOR1yK6MM7gxg=;
	b=oXi19VKF5yDJqVZZ865hfvPY/iEeC1bAFreQVtJL0SApnx/uRhJ7RNklpOZYjjEA+5BSQa
	3wMtRucKkBiDFCiijlJfqBp2XS866d49WvtD3qtAiG6KHrIPXvP/UZmY/N5tzyfoKNfoH/
	HSc40iBTcFg6kQ2ZDy8lhjdQvN3reu2FuzP+i6WwX6+Bn/UfDs7fRnO517BH8mYJyian3z
	oIrpuRLcM4kuBujFJLg4NSxZdOBQ+KSRFMnrGoIDwVc0s9WszTijFN06rVUfuPY1KJyDwt
	yFV2QBNrddPjzDWGEmIE/lofQj85aNE0vOeywP1KfaI0ABAPIcTUQTDwo66JWA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:49 +0100
Subject: [PATCH v4 06/18] phy: ti: phy-j721e-wiz: use dev_err_probe()
 instead of dev_err()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-6-6f1f53390c85@bootlin.com>
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

Use dev_err_probe() instead of dev_err() in wiz_clock_init() to simplify
the code and standardize the error output.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 46 +++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 00d7e6a6de03..5fea4df9404e 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1088,11 +1088,10 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 	int i;
 
 	clk = devm_clk_get(dev, "core_ref_clk");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "core_ref_clk clock not found\n");
-		ret = PTR_ERR(clk);
-		return ret;
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "core_ref_clk clock not found\n");
+
 	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
 
 	rate = clk_get_rate(clk);
@@ -1122,11 +1121,10 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 
 	if (wiz->data->pma_cmn_refclk1_int_mode) {
 		clk = devm_clk_get(dev, "core_ref1_clk");
-		if (IS_ERR(clk)) {
-			dev_err(dev, "core_ref1_clk clock not found\n");
-			ret = PTR_ERR(clk);
-			return ret;
-		}
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "core_ref1_clk clock not found\n");
+
 		wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
 
 		rate = clk_get_rate(clk);
@@ -1137,11 +1135,10 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 	}
 
 	clk = devm_clk_get(dev, "ext_ref_clk");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "ext_ref_clk clock not found\n");
-		ret = PTR_ERR(clk);
-		return ret;
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "ext_ref_clk clock not found\n");
+
 	wiz->input_clks[WIZ_EXT_REFCLK] = clk;
 
 	rate = clk_get_rate(clk);
@@ -1157,8 +1154,9 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 	case J721S2_WIZ_10G:
 		ret = wiz_clock_register(wiz);
 		if (ret)
-			dev_err(dev, "Failed to register wiz clocks\n");
-		return ret;
+			return dev_err_probe(dev, ret, "Failed to register wiz clocks\n");
+
+		return 0;
 	default:
 		break;
 	}
@@ -1167,16 +1165,15 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 		node_name = clk_mux_sel[i].node_name;
 		clk_node = of_get_child_by_name(node, node_name);
 		if (!clk_node) {
-			dev_err(dev, "Unable to get %s node\n", node_name);
-			ret = -EINVAL;
+			ret = dev_err_probe(dev, -EINVAL, "Unable to get %s node\n", node_name);
 			goto err;
 		}
 
 		ret = wiz_mux_of_clk_register(wiz, clk_node, wiz->mux_sel_field[i],
 					      clk_mux_sel[i].table);
 		if (ret) {
-			dev_err(dev, "Failed to register %s clock\n",
-				node_name);
+			dev_err_probe(dev, ret, "Failed to register %s clock\n",
+				      node_name);
 			of_node_put(clk_node);
 			goto err;
 		}
@@ -1188,16 +1185,15 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 		node_name = clk_div_sel[i].node_name;
 		clk_node = of_get_child_by_name(node, node_name);
 		if (!clk_node) {
-			dev_err(dev, "Unable to get %s node\n", node_name);
-			ret = -EINVAL;
+			ret = dev_err_probe(dev, -EINVAL, "Unable to get %s node\n", node_name);
 			goto err;
 		}
 
 		ret = wiz_div_clk_register(wiz, clk_node, wiz->div_sel_field[i],
 					   clk_div_sel[i].table);
 		if (ret) {
-			dev_err(dev, "Failed to register %s clock\n",
-				node_name);
+			dev_err_probe(dev, ret, "Failed to register %s clock\n",
+				      node_name);
 			of_node_put(clk_node);
 			goto err;
 		}

-- 
2.39.2


