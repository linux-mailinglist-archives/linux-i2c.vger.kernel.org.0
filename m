Return-Path: <linux-i2c+bounces-1725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C557385671B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04D101C222AC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198101332B7;
	Thu, 15 Feb 2024 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mTIdkXRM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5831754B;
	Thu, 15 Feb 2024 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010288; cv=none; b=RLHBpKjE3NI54zlOGRE+EBUS1e9SmQkehHPuZIg2Epjmi4SfA7rcQ0gZ2vR7CMApMmUrBJ0RGV97xmpDqRkExTOlLoEgRKulcgA+AR0kAonXA4K3htLUSStF3hY3jLRqtW7ssvwjGHPd3xMib+hq2+KF4zOMzli1IpKuVg8y55E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010288; c=relaxed/simple;
	bh=qG7Aih/dlI+jjqynJ8CwK6KPV3f2CPLL/GBb4pkvOTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKKKa3XFxKQMck5WMxQ1HM/7Z4/CisrWtOXStWk2ajISosiPSKxrbQpAAKA+Kcaa8VnwVIPp2gRFJzw9HmZx9M6XVTmx3TZBwr2xjAFgJAMarHcinuUWM7bh0TJDkVvpN8rhi7pIz2CZhlBEfJuUJTq+ySFXqLKvFWPRvEWltoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mTIdkXRM; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 949FA240005;
	Thu, 15 Feb 2024 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyF0yc35eBHz6J5ozV2PTcEtd5Ku7xNg8KIyrWR2Ppc=;
	b=mTIdkXRMUnc1Ncw1CWpsPwNllIyE5RWLeNrhM1TegKqa7oqfvKO/Fb10XiXCzERmNJAm5a
	DJRnqTUiopMwB+wrwWP3sLY6zMDgVKdm4t8K+sIb4rQILYECzSqDiy1a76l/mA/DuUKYEw
	OmkRRFfjY+3POb7TaLbNucl8alqGWRLtBYswCxalNLkoAZdOB+kgcQv44HuMZkBZZ96lIP
	gkIsc61gjI4l1hc1skr2UKj4en2dKzD1iuXh3gwbC/SjbTPR0NiIu0tgOlKRmK+tdCDWFy
	6d/wPjybitM07zx/FEjIsX7BDsGLsyUtPIDxaEJR4joKe5HG/b9X73Wvq2kCjQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:46 +0100
Subject: [PATCH v3 01/18] gpio: pca953x: move suspend()/resume() to
 suspend_noirq()/resume_noirq()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Some IOs can be needed during suspend_noirq()/resume_noirq().
So move suspend()/resume() to noirq.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-pca953x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 00ffa168e405..6e495fc67a93 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1234,7 +1234,7 @@ static void pca953x_save_context(struct pca953x_chip *chip)
 	regcache_cache_only(chip->regmap, true);
 }
 
-static int pca953x_suspend(struct device *dev)
+static int pca953x_suspend_noirq(struct device *dev)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 
@@ -1248,7 +1248,7 @@ static int pca953x_suspend(struct device *dev)
 	return 0;
 }
 
-static int pca953x_resume(struct device *dev)
+static int pca953x_resume_noirq(struct device *dev)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	int ret;
@@ -1268,7 +1268,8 @@ static int pca953x_resume(struct device *dev)
 	return ret;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x_resume);
+static DEFINE_NOIRQ_DEV_PM_OPS(pca953x_pm_ops,
+			       pca953x_suspend_noirq, pca953x_resume_noirq);
 
 /* convenience to stop overlong match-table lines */
 #define OF_653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __int))

-- 
2.39.2


