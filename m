Return-Path: <linux-i2c+bounces-1306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C282DD45
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5539D1C211BD
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708DF18050;
	Mon, 15 Jan 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MF2pnLzV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA527179BE;
	Mon, 15 Jan 2024 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BDB9C0009;
	Mon, 15 Jan 2024 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mtR7io+GXcxCNgtcR6WdMbs4r9dsHCXx4WfnCMzH5I=;
	b=MF2pnLzV5ERkgaPFDMVpO9L/ap+ntfbAdlwCxqnW9WBDAlKlU5rGdhan0Y1J2sXjvZUQsv
	bAKBoXOObsbZEFEyxFagqyS4Ive4NF7RRGHKAChFmsLbY8+Tipsrai2ZGas++CrOvtaj1e
	hx5zPYubHf27pxZ1kSCe6mPbOtrjvPIZ3PB2nAWZEahvIoxXa9wZ7XrJaKH7HJnWZITSMD
	Rq1IjF+vmaNTQ/of7m/qZrrZn06agVzaPGeVGr4h3ISwIT59aDgsrBV4HpylpNpHxA4Lyl
	giZvssdEom/0NkTgNPRuDjqno0MS2QSyrRruEsiUjoWJ/+PQRK9PsaqBM6/RqA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:43 +0100
Subject: [PATCH 02/14] pinctrl: pinctrl-single: move suspend/resume to
 suspend_noirq/resume_noirq
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v1-2-84e55da52400@bootlin.com>
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

The goal is to extend the active period of pinctrl.
Some devices may need active pinctrl after suspend and/or before resume.
So move suspend/resume to suspend_noirq/resume_noirq to have active
pinctrl until suspend_noirq (included), and from resume_noirq
(included).

The deprecated API has been removed to use the new one (dev_pm_ops struct).

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/pinctrl-single.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 19cc0db771a5..4ad0f66cf42a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1690,12 +1690,11 @@ static void pcs_restore_context(struct pcs_device *pcs)
 	}
 }
 
-static int pinctrl_single_suspend(struct platform_device *pdev,
-					pm_message_t state)
+static int pinctrl_single_suspend_noirq(struct device *dev)
 {
 	struct pcs_device *pcs;
 
-	pcs = platform_get_drvdata(pdev);
+	pcs = dev_get_drvdata(dev);
 	if (!pcs)
 		return -EINVAL;
 
@@ -1710,11 +1709,11 @@ static int pinctrl_single_suspend(struct platform_device *pdev,
 	return pinctrl_force_sleep(pcs->pctl);
 }
 
-static int pinctrl_single_resume(struct platform_device *pdev)
+static int pinctrl_single_resume_noirq(struct device *dev)
 {
 	struct pcs_device *pcs;
 
-	pcs = platform_get_drvdata(pdev);
+	pcs = dev_get_drvdata(dev);
 	if (!pcs)
 		return -EINVAL;
 
@@ -1723,6 +1722,11 @@ static int pinctrl_single_resume(struct platform_device *pdev)
 
 	return pinctrl_force_default(pcs->pctl);
 }
+
+static const struct dev_pm_ops pinctrl_single_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pinctrl_single_suspend_noirq,
+				      pinctrl_single_resume_noirq)
+};
 #endif
 
 /**
@@ -1986,11 +1990,8 @@ static struct platform_driver pcs_driver = {
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= pcs_of_match,
+		.pm = pm_ptr(&pinctrl_single_pm_ops),
 	},
-#ifdef CONFIG_PM
-	.suspend = pinctrl_single_suspend,
-	.resume = pinctrl_single_resume,
-#endif
 };
 
 module_platform_driver(pcs_driver);

-- 
2.39.2


