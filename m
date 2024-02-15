Return-Path: <linux-i2c+bounces-1724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939D685671D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB87282809
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3691332B9;
	Thu, 15 Feb 2024 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a1sPo+Sl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3EC13249D;
	Thu, 15 Feb 2024 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010288; cv=none; b=c4/dRJt+laqMArcKDScYQhJ21G1A5x05EnAZ93ji+XcvVOMB/riJJz4umDyJZCLOBKu/VWI6gfJh9HWZmpj38VziFgRf1Q6EQ6WZqZ3wej5wvzeQ6N3eMF5yyqocXUK/KztP5laaWbupMT9A921VffNmf/IJFJEJkLTyiOvDaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010288; c=relaxed/simple;
	bh=gwP4GGnMLfEyHCmYyPO/TojmDhPU7kHveCMamRTjHN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fiKOCX5TDz8aXQ7a12yj/OcZQBZZIf7yufTLI2uiU1kDTUPVPeiXScNUj5PBa8/VwxV+oisddcMtasTNEy6Izl532w2Y7MI+ByzHoVQeqdw2LWnskNvF1WAQG9NUb1uSs27F/PJhi29R/zkG82Px0kfkxL/BFtr7aTIhFJO2JMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a1sPo+Sl; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06364240006;
	Thu, 15 Feb 2024 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Nb4IKDaAI4vBqYGKsypVxdn/pv7j5S+qa35Zvmbq10=;
	b=a1sPo+SljVkvFgmvNstzu6qhGzIn8T2Jlq8tR6v7f3Wbt2waxMx0PuXyqzenCM75tzcGFX
	/EFaVr4qjHtDeGymq+4E5AB4rp8tCP1yfFcg2ezFRM5SF2tHoz+oGaVIYhdUDJDDuKqQkX
	RMfkk8TZENhJCHFuKZRiqlsZU5G9g6gmNL0swzNg3pxdi92grHlbi6MIUQnYmxpu3f9Ueu
	aZEd4yXKtB7eHTAtqi/3ORkRti+LBBzONHFZbGbrEJJdrI41gF656WQxq8D1waPDOhrNEJ
	m+ECSeFtL8qio+b0CmbOQxBVJDbd5Yr8KkltuhGdubtNpfYUCvmb8wxccoMPyw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:49 +0100
Subject: [PATCH v3 04/18] i2c: omap: wakeup the controller during suspend()
 callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-4-5c2e4a3fac1f@bootlin.com>
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
index 42165ef57946..c11deb285114 100644
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
+	 * Wakeup the controller while runtime pm is enabled, so it is available until
+	 * its suspend_noirq(), and from resume_noirq().
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


