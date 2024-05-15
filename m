Return-Path: <linux-i2c+bounces-3498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C058C6489
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A60CE2859A1
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4216BB5D;
	Wed, 15 May 2024 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eRmiQZqk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D235FDD3;
	Wed, 15 May 2024 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767296; cv=none; b=ckFJ9eTgHW2OGHH46SjQoIDP96JhamxEm8AHQafb0UmiIWYk7Mf7IIpJv1oJcN8OrFp32d5XggekD/IQgH0u4HHc0sIP4XNkZkx/gkwXFfUvey6j8wxKJyGc8HEIAFR+fj4aOWSnbG1mvMpU3nugUgXBmBj3XI3JUknj5xOygto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767296; c=relaxed/simple;
	bh=ZrTKcGJkHEqb+v6yflajK2rkFG4g28PoMECEd6V0ZOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZf469RDrOEyIqLzsA3fNXZzHQh8V+6l+Ews4lMFIg5Mi+MxQ9jY1o0F+BtsAp4JNVQkJERlNglFWVENKEM0Tzt8aEejTRQb4UaPULnHuQUl+LUeca1yFH1YUwEEjI2i0U9iTGxr1y4z70E0Nj9o42Uye63U4E3Epj6Gk5pL43Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eRmiQZqk; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E46111BF20B;
	Wed, 15 May 2024 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGogtQj5nq7MIjQ8OBcq+m0LGsth8pY35oV+zXBp1Qg=;
	b=eRmiQZqkTOB37sJmNecYYb6L5eGWwHHm3E9JIKzFuo2CLYM01ZMDoJEcmCDNq2o+fjvi8X
	/zp2AVkP/ILYZ8NUnm6XUs2i4iJzAwzPs2BFkBiLVFILTjfg8vwO8zDDV/nxG4t9idT4LC
	YO7gmkwlfzQlXHQtSDBpmNS+U6MQP5nraaBt8tMqLE92WCnyoz/sdX7ZB5NDIL0ye1Giwb
	DtzqfoTUF/TTRdtT7qI3UBzwlUiNFr9tWdz/J0AoBnbEAGuaBTXKq/CKWYYDWOt8ftWICH
	kej/9saIc2AyRrifaUIqnusY3FB7wyNhUNHSOBehQkt+BV8e/z71SM1OWFsMGA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 15 May 2024 12:01:03 +0200
Subject: [PATCH v6 02/12] i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS()
 and RUNTIME_PM_OPS()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v6-2-4656ef6e6d66@bootlin.com>
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
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Replace SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() by
NOIRQ_SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS().
The usage of pm_ptr() and these more recent macros allows the compiler to
see and drop the dead code.
The unnecessary '__maybe_unused' annotations on PM functions can be
removed.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-omap.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 42165ef57946..258839845b12 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1535,7 +1535,7 @@ static void omap_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused omap_i2c_runtime_suspend(struct device *dev)
+static int omap_i2c_runtime_suspend(struct device *dev)
 {
 	struct omap_i2c_dev *omap = dev_get_drvdata(dev);
 
@@ -1561,7 +1561,7 @@ static int __maybe_unused omap_i2c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
+static int omap_i2c_runtime_resume(struct device *dev)
 {
 	struct omap_i2c_dev *omap = dev_get_drvdata(dev);
 
@@ -1576,10 +1576,10 @@ static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops omap_i2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
-			   omap_i2c_runtime_resume, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
+	RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
+		       omap_i2c_runtime_resume, NULL)
 };
 
 static struct platform_driver omap_i2c_driver = {
@@ -1587,7 +1587,7 @@ static struct platform_driver omap_i2c_driver = {
 	.remove_new	= omap_i2c_remove,
 	.driver		= {
 		.name	= "omap_i2c",
-		.pm	= &omap_i2c_pm_ops,
+		.pm	= pm_ptr(&omap_i2c_pm_ops),
 		.of_match_table = of_match_ptr(omap_i2c_of_match),
 	},
 };

-- 
2.39.2


