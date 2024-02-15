Return-Path: <linux-i2c+bounces-1728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B4856734
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E41CD1F221E0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4657D134CC5;
	Thu, 15 Feb 2024 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QzmTPi/x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C656133414;
	Thu, 15 Feb 2024 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010292; cv=none; b=Ofi7o1cDvO54EZXBgT4TlM00I7JAypGcrXTGvJv/IIws/1O14QppY9yZqJNCWB7tmhMGtPkZoTqDIEA809uutvwYR3apNnevlo27njUrAuiKQQ4r4PUkQp3m2/pXqCaQdbiMDRCYonc9ZkcEDJACsKB/ZwSxQcfm3s0mrxUM7Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010292; c=relaxed/simple;
	bh=YGEmOsFMNcXlDNc56Lgxm1tdg2BtX/PFl7Zx00rRIxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhZb6qIehZYHq4V8dHV1ZM3j3n9jxwNt1mr87mWGuJv/AIOn+Jk/weJjkYXCCoDQJnCGBm0vcOtQiHHinrgQvX6wZHLKVMOyWW7Q2rH2yiFlbDsjCe+28UQOEDxMgTDQMnNBLrV436jZKrcnlkn8Ri+UxPDI1BDep5LgTHiaVKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QzmTPi/x; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5238224000B;
	Thu, 15 Feb 2024 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJYNJtMOR5pLpoIfNaokG07UEIar6ENzddhLhwstigw=;
	b=QzmTPi/xi1lzPXKjWZi8IsqH1gG0tk+au3AIC9A497Ujqo734s0p+l9w3RzzdvZX8NmL6R
	KVOQQu0vqfCOEQzkFk+OjGmLNvLvk0exFB+KIsJt0/kDtOVrJwndybcZmomS7rjZWcQl2/
	7iCECEmbkIRrfQbxHfRWi0ftRWGLwxTQaPJ6hDg4JA8pyH/7z77HDB6/8OoUnlvL5npcp6
	rvCQ8tVY6gubbBNLh6Z6Aw0KJ2TL4kv12ZaF35aj7CEqtbyzPrUlXqWs6EfAux0aTmewYL
	E1DyrfghHx5R+xCqxzGMZi/+oQf0KtyQ+jyrU9ZOHD5fuKJjLvwSMDRme3PJwg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:52 +0100
Subject: [PATCH v3 07/18] phy: ti: phy-j721e-wiz: use dev_err_probe()
 instead of dev_err()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-7-5c2e4a3fac1f@bootlin.com>
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

Use dev_err_probe() instead of dev_err() in wiz_clock_init() to simplify
the code and standardize the error output.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index fc3cd98c60ff..ce8a99801a4c 100644
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
@@ -1157,7 +1154,7 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 	case J721S2_WIZ_10G:
 		ret = wiz_clock_register(wiz);
 		if (ret)
-			dev_err(dev, "Failed to register wiz clocks\n");
+			dev_err_probe(dev, ret, "Failed to register wiz clocks\n");
 		return ret;
 	default:
 		break;
@@ -1175,8 +1172,8 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
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
@@ -1188,16 +1185,16 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
 		node_name = clk_div_sel[i].node_name;
 		clk_node = of_get_child_by_name(node, node_name);
 		if (!clk_node) {
-			dev_err(dev, "Unable to get %s node\n", node_name);
 			ret = -EINVAL;
+			dev_err_probe(dev, ret, "Unable to get %s node\n", node_name);
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


