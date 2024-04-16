Return-Path: <linux-i2c+bounces-2966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9958A6C5B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605211C21BDA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3967712E1DE;
	Tue, 16 Apr 2024 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O/aQWG4j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A412CDBB;
	Tue, 16 Apr 2024 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274223; cv=none; b=Syhz3C6AmZbj1BspUyLH3IhDwRgy1/zL7Ly40iJRIiZBPTZQVvG9I1lCbbLbspcwopKL2dxFV/nox7HMK0T7Km19iJRo1zSAOIrwtMSwUn4vIIxgLE8eevlinmm74arSAmxH8mXOujVKzgnxFAJqGoqvrtrf6c3hC8Idu5egb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274223; c=relaxed/simple;
	bh=1HPfLwnNxhMFYvL7QXVkxva28ELMiug/Navcejf1G+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N9o8qKV6FgLQ6zztYiI7kg4XYqZBfNvJE4OuQhnVd+eLGMWFJ0rfEzx8DW4NEMfvMo3xFdTu2o9qdjarV5uud2XiU6XSBTMfA7QSlAcKtQB5L3buiVY/n318ZMKhdtRHxxWWtKIiu1pnwIyWcSGB45MQI0VHI55fICYIwUuUAWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O/aQWG4j; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21B3D4000B;
	Tue, 16 Apr 2024 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqh2Batmb/usTjbVB3bshxxGezo7bBmN6Z74wQtMSDE=;
	b=O/aQWG4jnyVFqgryJ4wC0kevnEfeKbeON6EN7zqfeUEIDFAMNrSCY+JuB4qADAQtcFDEvk
	PzfDkXe0TljMj7xxU/cmXiD/LruUx67DAl7iaNX5US2plim9DPQgOiT1mfSBFnuE4l/qKm
	T3Zc2Dyv2n+tRhpqpXMvEBfxOr/iTTMFfPhX07gOSBK8gs7ITrdf0OPOPoVqrZLI0tD9kc
	TofaDM27ViToPe8QUiGHsSdoV4OBgS9p1+uZ7zMQOhsZ5poFF3iSBmxUW1JhOVtq/trDLg
	0AwBEpVv/BARG4KhsivBvyyla7/WV6fDs9GIYepy9DfHjJbbPo3LE2BhRHf06A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:51 +0200
Subject: [PATCH v5 02/11] i2c: omap: wakeup the controller during suspend()
 callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v5-2-4b8c46711ded@bootlin.com>
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
 Wolfram Sang <wsa+renesas@sang-engineering.com>
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

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Tony Lindgren <tony@atomide.com>
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


