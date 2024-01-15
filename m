Return-Path: <linux-i2c+bounces-1305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5682DD3F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7816F1F22C4E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9F517C98;
	Mon, 15 Jan 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="COOXp3qP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525D179BD;
	Mon, 15 Jan 2024 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 322DFC0008;
	Mon, 15 Jan 2024 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sUS3vLWJetwrOxifoKHwojurtz05QQ0WVVV+b0as8c=;
	b=COOXp3qPdfsNX4WwaTj+W6tNhEJvjMWJwGpreYYsAzWHkD+A6UGJGtR6y0XvJRVUth+rs2
	1gASrl5oLU9BrJ/J2UDxOXzPYx03q3SW8eLI+TtSKxG9C06QjLKmVsS5khzb3ZRbjvTjOi
	0LH8AB+Uh+p8St2qxjjUc4GPijrgM5cK0qsEYAYs0yFtAl2NRy6aXsbXjmZJUAKhoy/JwA
	2nMmfnm1FYFGQrlzibu6pz121m3l+m5C2Lyc2+WMMqyVY77aIttUeEwpzzSfk2qOJvNgLY
	qYRFtnhkloQNhaO9Tw9kjSKVn8hh8m1vhZseUUKfrl3wnB7AmJhciG9L9f7Aww==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:47 +0100
Subject: [PATCH 06/14] phy: ti: phy-j721e-wiz: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v1-6-84e55da52400@bootlin.com>
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

Add resume support.
It has been tested on J7200 SR1.0 and SR2.0.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 09f7edf16562..fac7070a9d6b 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1666,12 +1666,51 @@ static void wiz_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 }
 
+#ifdef CONFIG_PM
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
+static const struct dev_pm_ops wiz_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, wiz_resume_noirq)
+};
+#endif
+
 static struct platform_driver wiz_driver = {
 	.probe		= wiz_probe,
 	.remove_new	= wiz_remove,
 	.driver		= {
 		.name	= "wiz",
 		.of_match_table = wiz_id_table,
+		.pm	= pm_ptr(&wiz_pm_ops),
 	},
 };
 module_platform_driver(wiz_driver);

-- 
2.39.2


