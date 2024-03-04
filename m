Return-Path: <linux-i2c+bounces-2159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B08705AE
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E13671C21BF7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BA24D12D;
	Mon,  4 Mar 2024 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KEWC1IKF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C8487AE;
	Mon,  4 Mar 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566578; cv=none; b=nfUTMv73tLndztqcLkIyonpIm2LvUn3ghKywhM6vrz3BkyeI2+BJEAoOD0TiPswmKxcqSrDXstwmtcJQP02MHUz2wmfYzrco5x+82iMdhFD8fgyn75h9nZdhKP4MXkXOiw+aSJt3f3MYPqs2hIFh2vrz5BG5QUXsCzeLioTtAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566578; c=relaxed/simple;
	bh=Ff5habTJBwpnMGCWcJcXduOtk4oykNyYJ1ARoENGFO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8JZb2u0jY6P4VBVMX98e/k1NBP38UzEIDH0LwY9u1It0DX6LZWBqUnCmoLEDW/6l8zJyUe95WbdVf6t661c72jmpAD5yxcUrOM5nQ7ppC8Tnv+oMqWhZky4T92a7bWUHCYU1eX8SDck65A8vpqbynFPohsbtW+rpYYMg7JShI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KEWC1IKF; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A9B61BF20A;
	Mon,  4 Mar 2024 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gl1VkLUtlzwgjyFHXIWhWfMxiJmBAtrbqfGEcOsrt6A=;
	b=KEWC1IKFF6+WH764Ea9IkJgO1K0u3tppkwQfA0RE2+3oC4gLo8ZNlA2jHd4/2XDAe4PmK0
	TMiqXGm31hhI4L5f7IOPlKybsmyogXbRtpAQaI3hwmg0ibql2l4y7t3NmeUdGGFoQkFwM1
	tIEszKtCKzxUKAVMKyy1Qam5JZwCrUDzidj0FFO+ZFhBbhXgEJMHIaJF0+nWSZoJ32pdh3
	N2cNG9JALpmFvLzLB0Nf9aP3kgiFHcVK/4aWQ0ULdXTXW/6VX8D6FZ3UEWEXTSGRYbBGsM
	rZ0om+g5FXbQDL5fk4mi4A6muXj3dpVWn1V+wqf867eqall84fE/FZ2xC7aObA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:46 +0100
Subject: [PATCH v4 03/18] i2c: omap: wakeup the controller during suspend()
 callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>
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

A device may need the controller up during suspend_noirq() or
resume_noirq().
But if the controller is autosuspended, there is no way to wakeup it during
suspend_noirq() or resume_noirq() because runtime pm is disabled at this
time.

The suspend() callback wakes up the controller, so it is available until
its suspend_noirq() callback (pm_runtime_force_suspend()).
During the resume, it's restored by resume_noirq() callback
(pm_runtime_force_resume()). Then resume() callback enables autosuspend.

So the controller is up during a little time slot in suspend and resume
sequences even if it's not used.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-omap.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 42165ef57946..28417b2a18b0 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1575,9 +1575,31 @@ static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int omap_i2c_suspend(struct device *dev)
+{
+	/*
+	 * If the controller is autosuspended, there is no way to wakeup it once
+	 * runtime pm is disabled (in suspend_late()).
+	 * But a device may need the controller up during suspend_noirq() or
+	 * resume_noirq().
+	 * Wakeup the controller while runtime pm is enabled, so it is available
+	 * until its suspend_noirq(), and from resume_noirq().
+	 */
+	return pm_runtime_resume_and_get(dev);
+}
+
+static int omap_i2c_resume(struct device *dev)
+{
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops omap_i2c_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				      pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
 	SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
 			   omap_i2c_runtime_resume, NULL)
 };

-- 
2.39.2


