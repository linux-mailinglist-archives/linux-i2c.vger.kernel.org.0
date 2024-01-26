Return-Path: <linux-i2c+bounces-1458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192D83DC2C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 677CF1C20BDA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAE91CD26;
	Fri, 26 Jan 2024 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Eduz/GPt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BEB1CD09;
	Fri, 26 Jan 2024 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279864; cv=none; b=snDYHl79pceta2E7D/5VldafaeuV42h9YCpJRCzcgeJSvS13ZIklhHD4M1RwKdlypGVpNMDPlTDDxBOfqQTWbpP1YDEYht33b2yR7hR1t4kuI+fnGMK5eez1cyzCglbudfTRLAJf6lZ1Y7amuVopr3FrzPiXs2WvS005sroqk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279864; c=relaxed/simple;
	bh=2AsuUxlX9MVpETBNp+iFT3Mn1IsIz33sSQXe/x2/9zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbSccqyNin/A6pT80Cv+HGVyfHwQehkYZinhoBBjR+xuzywLRB/ZARxGRBOPusZ8khRJAbpEKqvH723yaLY/hiQwuO4hq3axmsPvX1Yyn4Q/fmqgScjzXLzwqPE0biclt19aeIz0Ywol+TFI80IPiguA7OQ7sOV2GtPIj939JMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Eduz/GPt; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6711C40004;
	Fri, 26 Jan 2024 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBvfyrsgnxZkigb51H7bXjq0DEAjmH59sXjUpzTvFno=;
	b=Eduz/GPtIshO4mhHx0xqXY9W397R7/7eTiPnCpA1xinvHumYUW15LbC6hpiJ8vUVPJusIO
	1/fi+ua9yXAwEL5p3+mXoMJ+HN+LjJKuAfLXINAN0FmNgv0Hqia+1z3w+j1YSD9ES1AMKl
	45WY9fSHJZ6Za1bEzrYDRWc0g4sbE+p9Ls/4k+LbLuL/ZnsftWzBvr0dgpug8OgL/SK5mZ
	cX5bDEhyCrjk4GvrxP3WhZXqmv2StRGvA9KGTV3k0LRh2JrWJ0w21qnHZTNVRPPYOdU+Q9
	IbDVUT5+UK6L1Jk6if5RmpuOa/tg9LnIalVXenvesLE4Mxi4WyO4pk//kzgSUg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:44 +0100
Subject: [PATCH v2 02/15] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
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

The goal is to extend the active period of pinctrl.
Some devices may need active pinctrl after suspend() and/or before
resume().
So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
have active pinctrl until suspend_noirq() (included), and from
resume_noirq() (included).

The deprecated API has been removed to use the new one (dev_pm_ops struct).

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/pinctrl-single.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 19cc0db771a5..0dd4b0e11adf 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1625,7 +1625,6 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int pcs_save_context(struct pcs_device *pcs)
 {
 	int i, mux_bytes;
@@ -1690,14 +1689,9 @@ static void pcs_restore_context(struct pcs_device *pcs)
 	}
 }
 
-static int pinctrl_single_suspend(struct platform_device *pdev,
-					pm_message_t state)
+static int pinctrl_single_suspend_noirq(struct device *dev)
 {
-	struct pcs_device *pcs;
-
-	pcs = platform_get_drvdata(pdev);
-	if (!pcs)
-		return -EINVAL;
+	struct pcs_device *pcs = dev_get_drvdata(dev);
 
 	if (pcs->flags & PCS_CONTEXT_LOSS_OFF) {
 		int ret;
@@ -1710,20 +1704,19 @@ static int pinctrl_single_suspend(struct platform_device *pdev,
 	return pinctrl_force_sleep(pcs->pctl);
 }
 
-static int pinctrl_single_resume(struct platform_device *pdev)
+static int pinctrl_single_resume_noirq(struct device *dev)
 {
-	struct pcs_device *pcs;
-
-	pcs = platform_get_drvdata(pdev);
-	if (!pcs)
-		return -EINVAL;
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
@@ -1986,11 +1979,8 @@ static struct platform_driver pcs_driver = {
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


