Return-Path: <linux-i2c+bounces-1310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0482DD58
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24201282AE8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74F918E39;
	Mon, 15 Jan 2024 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F/+6IPqF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26418048;
	Mon, 15 Jan 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDBC5C0013;
	Mon, 15 Jan 2024 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j40X4Nu4eW/wfOAO/d7B3IGTPdOyDBc/O2ndpv/7HmA=;
	b=F/+6IPqFmci0LEpiKsOSrjUeL2jGbhF/9atcE8qzUcQtLYK/brxsei7e3RZeUzfNzN4Zl2
	BGlSDC3rbCowgKD1C6eTFBU1KYs8J170dSsLKAxAGLb2ni6COkWoRLHmLL1jwYqx3Ch5Af
	zl09x0HFnGDfU3Fi/Bad5Ts6Eepgr9LpWyS/LUKkUKi5kJ8CbI3poOU9kBNwb4eqj3eSz7
	8SkHeoB8uoXuyuGPqE9qRUEGtApJV5vm5q2cBoX+Qj9/W5zB4Y1Y4Og2oXQprGsUYBsgdE
	PrfoPZIl7V9Vcn9ajzE7R+g0B2UK1Y+noBqRgt17q0pucMB5duEqKE63/r9EsA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:45 +0100
Subject: [PATCH 04/14] mux: mmio: Add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v1-4-84e55da52400@bootlin.com>
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

Implement resume support

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mux/mmio.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
index fd1d121a584b..ab4ef195fc0d 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -125,13 +125,47 @@ static int mux_mmio_probe(struct platform_device *pdev)
 
 	mux_chip->ops = &mux_mmio_ops;
 
+	dev_set_drvdata(dev, mux_chip);
+
 	return devm_mux_chip_register(dev, mux_chip);
 }
 
+#ifdef CONFIG_PM
+static int mux_mmio_resume_noirq(struct device *dev)
+{
+	struct mux_chip *mux_chip = dev_get_drvdata(dev);
+	int global_ret = 0;
+	unsigned int i;
+
+	for (i = 0; i < mux_chip->controllers; i++) {
+		struct mux_control *mux = &mux_chip->mux[i];
+		int val = mux->cached_state;
+		int ret;
+
+		if (val == MUX_IDLE_AS_IS)
+			continue;
+
+		ret = mux_mmio_set(mux, val);
+		if (ret) {
+			dev_err(dev, "control %u: error restoring mux: %d\n", i, ret);
+			if (!global_ret)
+				global_ret = ret;
+		}
+	}
+
+	return global_ret;
+}
+#endif
+
+static const struct dev_pm_ops mux_mmio_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, mux_mmio_resume_noirq)
+};
+
 static struct platform_driver mux_mmio_driver = {
 	.driver = {
 		.name = "mmio-mux",
 		.of_match_table	= mux_mmio_dt_ids,
+		.pm = &mux_mmio_pm_ops,
 	},
 	.probe = mux_mmio_probe,
 };

-- 
2.39.2


