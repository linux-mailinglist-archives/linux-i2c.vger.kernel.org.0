Return-Path: <linux-i2c+bounces-1459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BE83DC33
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC92281A8C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80911CD3C;
	Fri, 26 Jan 2024 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QeD+UINS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E21CD1A;
	Fri, 26 Jan 2024 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279864; cv=none; b=AdQZ5x3eqNjl8A1s9gbLDs+NjGjZwYJetvckUMjdhbchGRKJR8FNeRWrig52yIG2OL/xnowUZZ2MMaxBFKho4KYFs7Qpq2TFiUOudUVjV9A08cTbl5/DrwmfFS6H8HBuOaYyb9RccXYN7BUdncHtkkOxn+48DV6Qbo+X/7/Kv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279864; c=relaxed/simple;
	bh=BLC9y/pBFPu9WfpypKFGXfgo4cG5qrErXSPYt3f0ihE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUjdWYr2QlTbc0PSc51GhSen+cEEO9g4f9f8UseUk7G0kOrkIl37tEVNh9V3iFamP8eazTscZ5u2FRqdmsEjhnmZEuzRF8WlosDUCojO9sjBcE8t/zIzg12xh7eQHNg8rmn+j0QEt8206q+qydO3iCvr2XOdxX0+1rRtRNYcYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QeD+UINS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D48BD40010;
	Fri, 26 Jan 2024 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeT42sEpDDYGcpf5YrXoKh3jtRRClLytLS9mk4kxR3s=;
	b=QeD+UINS/zyJVUS478SNFmS/cAWoK6t9gopcTzrs5nJYkpqEUtEvkahDp7Vc5PIPAQBQI+
	Dnw0MvCHZlPJ4wDUiqAGUgN2QReYkr5W+fx9cYu7BuYJAYCJ8KPAdaFBRELUGFbYgIaGe7
	rDS/Awtg1g8wuh/+xpjgb1yMR3WhaSLEeqqeXRQU8WgMdVzepnDLESUlgcTLrgrIkIAiuV
	9BIj+isUeaxYUTYAB9O/sqtXDAyPI7O+VlXojO7xSLrHrg0B07UD6fxYI+GK3KX2BUHjix
	KgPxn9S7mfQOKMiDtTc0IiTESa5jDd+dWvrAzP2ftvTRvWTE2/0vMD19UByEcg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:43 +0100
Subject: [PATCH v2 01/15] gpio: pca953x: move suspend()/resume() to
 suspend_noirq()/resume_noirq()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>
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

Some IOs can be needed during suspend_noirq()/resume_noirq().
So move suspend()/resume() to noirq.

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


