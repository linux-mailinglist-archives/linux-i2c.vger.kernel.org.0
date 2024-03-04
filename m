Return-Path: <linux-i2c+bounces-2164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4698705C7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6AEC28AB7F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257C253809;
	Mon,  4 Mar 2024 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Upw1ehRr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B545BFD;
	Mon,  4 Mar 2024 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566587; cv=none; b=YDTmVXuntU+Pf1LKOBP0GQA61HhPLSyMuY9ilRv6zhMPv0+KY1Gxn+rcj7iwBMLxY4nBQAjx56IyxbAmXplucHA1CwVv+MiKOb6SzzUfna3kEzUShWSuWj/ZM/9JUijqRBwq94LZ4bZb3nqQF2gX0LPdEEQ2TyClTm1EaBt2fxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566587; c=relaxed/simple;
	bh=gNPojeRs7uaeynf3JtSmScZnTJITifyQp2nnjKqNJJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhoqaD5c6ZWaytjgMEkE7bR9EIHSGZvgWrhXaITStcBDCPHZE4tYSJY8mNUCMUyL9pAwVxVo2LWflvp50R1TTBNPSPxVm0Ar3yJ9O1FGU5IZbwl0O6P+cPAuyCRb/oPmoFkraJuMVabB4nB1RQ438UlBOxLPzpO69JFO6mlOlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Upw1ehRr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 948841BF214;
	Mon,  4 Mar 2024 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2OqSyPPWtiaASZZ8fL+0nOgh8uzFroOQ4LwJV+N5EE=;
	b=Upw1ehRrYckmxR7s0sIaRde2rNTfRmIGymX3WOWIMcmwJn2tnZ5SJSZeFZzhVRZdPirmKr
	bni3uAVKVIw4fu7A1VZWffvCAqJQF060OqoWZNXHu/UiVrELnfqu195k/GHe8HsIAEZ3CC
	7/ZYFec/AvlECjmYdwdzofKDYrpV20COkdQuetKUMQYw3lgKkROpYFIabNg8YvW38scIfM
	H04oJxv1HlhO9xpzMYEDGpylIN0kcTkZCvzKR3RcufYUsc69vIyKwhhn7KxCVNQND8IVrp
	4izfZHh51RkXyhEVkG83Es2QoNVlTLtNZ9auBiCBaYRyFkJauy7nD1jV2SiOmA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:51 +0100
Subject: [PATCH v4 08/18] phy: ti: phy-j721e-wiz: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v4-8-6f1f53390c85@bootlin.com>
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

Add resume support.
It has been tested on J7200 SR1.0 and SR2.0.

Co-developed-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 0e3cb1ed5a52..b2320f2efb72 100644
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


