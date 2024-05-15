Return-Path: <linux-i2c+bounces-3495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D692A8C6479
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 131EE1C21A01
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779C45FDD1;
	Wed, 15 May 2024 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mYHu/lBe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289BD54645;
	Wed, 15 May 2024 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767293; cv=none; b=kE1US/I+S9CI4RAoLDz4EkQPLf5/umafy5+093mCY36i2wzEI262EUvIWBWWFE7CJU2ZOXuval/9RfSCCz4s2cwajKdWyzzIG7i/WhHTFN1YyJGFsHs4+2olmTa46uVdt4PxWPaV8hSb5JSv4D+raCFiT/WaCY3R+jCTTQG/0TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767293; c=relaxed/simple;
	bh=Xx+vayIh82SAtHVXudYjPk1zPq0B929fRjdBosiyvNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFgaWwjytVxET2apF+ewVh6tBykn13OujXXTLl7/6uFck4aRnZRGOz3k29dxa7cp+xehkgS/IzGbC91PbWlDJPMzD3R3y9qOdiS/UY5EFRim4sxXO0zCMIPyAAzm3AHIOl+XKRdQy3gqMWwzVGdKrDILGe5RRYt0860fmHisiZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mYHu/lBe; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C446B1BF212;
	Wed, 15 May 2024 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJsk01g8PFOtWZ8YN5wBqGOjLENbNBCD6D5JYLiJQjE=;
	b=mYHu/lBeHXPTuT2pLodznqLS/H8Xpzf7PcFP7oEulgPVaU7eloHBM+U/WwP50U0e0zE4kP
	a3rBE/qGlBNcqSpy3gGmeyH1R7KfHIeb0LlxLnkOcdezN9UUMqVfenrEd7yxCgIlxHZMNl
	cMNj9Uya1uI3ro8LdBeIdnAvxKiwIAnpf8yWpR2Gt1uT1KjvUsR6uR8l+yitAqJYpMlhUD
	OADsJMDD5jW6jeW7rQ4DNmL5jrrtGnUU6JMZTFC0KPutYiAdpOV2MyeEa/DjrdimxizSs/
	VUHVqubHB4IaBawDYggmKsrf0zLF6hmkkR9pfQNGEN0xx9XNlU+C6RW3Vrlt3g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 15 May 2024 12:01:04 +0200
Subject: [PATCH v6 03/12] i2c: omap: wakeup the controller during suspend()
 callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v6-3-4656ef6e6d66@bootlin.com>
References: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
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
index 258839845b12..c767a6418962 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1575,9 +1575,31 @@ static int omap_i2c_runtime_resume(struct device *dev)
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
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				  pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
 	RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
 		       omap_i2c_runtime_resume, NULL)
 };

-- 
2.39.2


