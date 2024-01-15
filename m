Return-Path: <linux-i2c+bounces-1309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045E82DD50
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87A9F1C2085B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779E518E11;
	Mon, 15 Jan 2024 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Crp6RWxA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4A17C95;
	Mon, 15 Jan 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77D41C000B;
	Mon, 15 Jan 2024 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luuiYzsnns/OhtWeHFFRwSXyejuX6Zby2kvPJdFacfc=;
	b=Crp6RWxAJP1bUpPZkHVslhQDy0LElcVFI6AwLcwULZs5RsYzIudWQYt8Q3iRhDgSSnaVZK
	7ymwpYUXf0wGkO5wq+5zCpEykusRLnHd/2731m5szrEcC5N5vLQ/lkof9wfprFL2GDVlYU
	afNaDKsSr4+VALNWEMFWoWM0E5iBdmI/TqzLmaSDb8LhG0uu0N1htYIBEBKEjvqeHJsd6I
	PLElpPuwjvTy40jIgKBGS+dcAtKQwxZDjDs4wNOTVGcTD54SeSVUhAphBiFx+ccLAAaDHM
	9Zw+x3r/aYZpT99MMMs2BmRWWIFYXclINT6abTZtRXkI30meD4hNw7NHLai+Rw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:44 +0100
Subject: [PATCH 03/14] i2c: omap: wakeup the controller during suspend
 callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v1-3-84e55da52400@bootlin.com>
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

A device may need the controller up during suspend_noirq or
resume_noirq.
But if the controller is autosuspended, there is no way to wakeup it
during suspend_noirq or resume_noirq because runtime pm is disabled
at this time.

The suspend callback wakes up the controller, so it is available until
its suspend_noirq callback (pm_runtime_force_suspend).
During the resume, it's restored by resume_noirq callback
(pm_runtime_force_resume). Then resume callback enables autosuspend.

So the controller is up during a little time slot in suspend and resume
sequences even if it's not used.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-omap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 42165ef57946..57f0738fa748 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1575,9 +1575,24 @@ static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+
+static int omap_i2c_suspend(struct device *dev)
+{
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


