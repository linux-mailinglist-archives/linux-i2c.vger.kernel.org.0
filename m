Return-Path: <linux-i2c+bounces-2965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67E8A6C55
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D93471F21AD5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB27212D75D;
	Tue, 16 Apr 2024 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m44ZOLO8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083E12C81A;
	Tue, 16 Apr 2024 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274221; cv=none; b=QKWN2RBhAvG4w1sYqU+QB5g+KWjA1oqOg4oNcIVkhjLm2hOVXN1+EliDrXS7FFumWjEOLEhRR/HHubHlK+2Qt+hfNflTG5XTni6e6ulu4pUSOMMTnqMg2VNhXAA1eSK8IHDVoURRmFiDiDDl4k2piLeLyLxCHxP8xwRbKYjs0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274221; c=relaxed/simple;
	bh=OyHx7ZZ4/h8Wstp56SurooyJvSWdHdopw96/iRKHd8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Od2lqEdOcvf/jYrrXaD0WuXEaIUE66zubp+HfyXw1Om55heur/fiJvGjMKzd4qUov+fdMp3JpkTPTuQwtXn4IWlxuirbi7coGhZvPJpDh5YSJpp4qEoxbS1+JLN5jXxHUXBIkt9ff1Dr7dJ+xp3K1D/6kkfDpDbC95ENpu41ZlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m44ZOLO8; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2679640002;
	Tue, 16 Apr 2024 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S70Ysmy7GOlawn6RWq9qzGyOkNk33BPaQBIqrV30L4w=;
	b=m44ZOLO8xpcdJKizGaKX1WggODNsjt4un2hjLuEjhmbR32wlPqG9/kESbGgqe1D8HsirO5
	vExlvHjUeYcOGMMcn5A+lbgOnDdiCcoC04YoQb0EXPyLXy687m5LybeYJq9cu4xTEF2GVU
	qieBPBlBCnELs3pn9ET5ATWQIlopmHncoMqx2TXGEEFOyBal6O0S99COZ5LCh+ALIo7dlc
	JmoF2mpk5cZ8xcz13AHNe7aNb52Egf1FVPScQbCjWPOMGSKfJ7L1iHaVpCQWq8AfFD38pc
	6TY1MWkdzzHF4yGmmUhhZjGGTMfiZnIu0KdntxUzWon0p+S/NtmHGusiI2RZ1w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:50 +0200
Subject: [PATCH v5 01/11] gpio: pca953x: move suspend()/resume() to
 suspend_noirq()/resume_noirq()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v5-1-4b8c46711ded@bootlin.com>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


