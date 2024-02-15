Return-Path: <linux-i2c+bounces-1723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50135856713
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D489281A9F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D178133288;
	Thu, 15 Feb 2024 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZWbj4bpo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC846132497;
	Thu, 15 Feb 2024 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010287; cv=none; b=nV2dkWjvijhGpgc6C4URyobNo718Q0YtJBStFZUdpxoI3e5kd5nd29pkjVdo9FUnvCLYgTjkcwP1oJK/vWRtOiRAOVD9FCbinIKJF25MI/XwuixnwrG7W1iZd1L51SzGQc0fbWD4HLArzqOa2vujH7UZIEQ92R3m3mAI0OHA5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010287; c=relaxed/simple;
	bh=aSTKbIbocmfQVktZDk7IuOcqfsqSduUZkf7ik6EjfoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwyi7b8tjYgLuZ1Y9HhNSiPH5BDSeVML3HnhIuRG72/J8pZtDAR5Zx+Up5LVBxOcUyIrASYomUd3Cg13pnUT3lYC+C9Y3MfWXbN+RJh0vCAw83JMxl0JjIRDuUXhtlIZ4cX2ErrSU0arOhaXkbP+iia5TayJ+Jh0AASIWwXdAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZWbj4bpo; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D55AE240008;
	Thu, 15 Feb 2024 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4i5VKICPkOcySB+v4EkO/Z1q1pJDA/ZgXOxMH2KXNho=;
	b=ZWbj4bpo0gq4xsPTML+Apv3A4CRTQTTzJoyfT4HYx2zruymwJsoWfJVA13e4KRMtDPAhK+
	CYCp73hrUA5wEGtsrs8ZmrZkHS3zDtVcyEV73Br3gjCoNp5H06Psz56lEIUgmWnaZrgltN
	qkyqqXYAkmLfL7shCLK6jw9bym09GzbECAWhaWXX4KvdHXqnVYqAmbEjdIfCXP5Ghq91dY
	SppJdi7Q+JU6MmUL4dTZzGws11jJ8shhPss0CuH4/Irt38bKfVLTdyeDwwNihKJ/gJWZ4i
	um3prNd11HKpF1aeFum/P8wwhqEKM5Lnhcc/ZRenW/xjd9mtqKhKqzoXwkGaIw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:48 +0100
Subject: [PATCH v3 03/18] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-3-5c2e4a3fac1f@bootlin.com>
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
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

The goal is to extend the active period of pinctrl.
Some devices may need active pinctrl after suspend() and/or before
resume().
So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
have active pinctrl until suspend_noirq() (included), and from
resume_noirq() (included).

The deprecated API has been removed to use the new one (dev_pm_ops struct).

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/pinctrl-single.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 02eabd28d46e..0dd4b0e11adf 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1625,7 +1625,6 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int pcs_save_context(struct pcs_device *pcs)
 {
 	int i, mux_bytes;
@@ -1690,10 +1689,9 @@ static void pcs_restore_context(struct pcs_device *pcs)
 	}
 }
 
-static int pinctrl_single_suspend(struct platform_device *pdev,
-					pm_message_t state)
+static int pinctrl_single_suspend_noirq(struct device *dev)
 {
-	struct pcs_device *pcs = platform_get_drvdata(pdev);
+	struct pcs_device *pcs = dev_get_drvdata(dev);
 
 	if (pcs->flags & PCS_CONTEXT_LOSS_OFF) {
 		int ret;
@@ -1706,16 +1704,19 @@ static int pinctrl_single_suspend(struct platform_device *pdev,
 	return pinctrl_force_sleep(pcs->pctl);
 }
 
-static int pinctrl_single_resume(struct platform_device *pdev)
+static int pinctrl_single_resume_noirq(struct device *dev)
 {
-	struct pcs_device *pcs = platform_get_drvdata(pdev);
+	struct pcs_device *pcs = dev_get_drvdata(dev);
 
 	if (pcs->flags & PCS_CONTEXT_LOSS_OFF)
 		pcs_restore_context(pcs);
 
 	return pinctrl_force_default(pcs->pctl);
 }
-#endif
+
+static DEFINE_NOIRQ_DEV_PM_OPS(pinctrl_single_pm_ops,
+			       pinctrl_single_suspend_noirq,
+			       pinctrl_single_resume_noirq);
 
 /**
  * pcs_quirk_missing_pinctrl_cells - handle legacy binding
@@ -1978,11 +1979,8 @@ static struct platform_driver pcs_driver = {
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= pcs_of_match,
+		.pm = pm_sleep_ptr(&pinctrl_single_pm_ops),
 	},
-#ifdef CONFIG_PM
-	.suspend = pinctrl_single_suspend,
-	.resume = pinctrl_single_resume,
-#endif
 };
 
 module_platform_driver(pcs_driver);

-- 
2.39.2


