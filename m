Return-Path: <linux-i2c+bounces-4013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D390733D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 15:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7221C1F21B72
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 13:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920D61448E8;
	Thu, 13 Jun 2024 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z0vsLImH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204291448E0;
	Thu, 13 Jun 2024 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718284421; cv=none; b=PX1EUvDd0byR0JVJ3htPenRlawobYSy5/B7T2wcGIpwCJsmgzUvsZsL23XeZrlwPHLTTfkcDrqc31+y+JnjOPt5moNk7cdHai1NquIEjnK5FhS+Ydskk9dTh2DJi0LJJzigyFj1bCZ1NqJDChICyHqkPddwEHICDBG1SrGcB6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718284421; c=relaxed/simple;
	bh=EYPaH6HcYOZCqyGlWoEHW3wVG4t2hDe+OBWpMsvbE6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QY2EbnY1lCrZ/ig7zSPgdBJI9fy6WWE207iwSTWbwa8roU8OlRdng0x8zTTMADivrORlSd85vpdCFNHLgEYncDkRrTgyoPDiyDjHpOYuN871HIkIWVYmhvJpbOzTTNdhNJ3CtXzp5Rnus7eUycwJYpzFGZmKAuQRpii3euk6K1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z0vsLImH; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81202000F;
	Thu, 13 Jun 2024 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718284417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3GaXSbxwPm6mJzK7Jl/toxcNOtijxizQmUCJV+spiw=;
	b=Z0vsLImHpfwbC16x0Azm80oH1pItnoipJeEPTPJln7vXinX/DpQk2/eiKq8lUsnjccLLro
	kwQoC7emmQaBIeswR6mb6sADKAYSJnvpcfUMoMNbirwPvbLc0cs1z5PIv4HAWPuff94EP2
	BNVyuQbwCLrXAzHQM8HLfrul+jt4clFeCeo+ZHWRDhAMdLmSyNK9I5Is4xcWh9yA4lrW3S
	cowthIa0N1pIYxYd5oG4waCr+Nwx4ffy486V7L1BtaXvUI3oWSgBQge0PhztDTvPHJrJ2R
	7EXIkGr+DrQTzH82YGOYzExp4RPG05EgF9Py/aSjReMc2w58clynOg8b/XmPBg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 13 Jun 2024 15:13:27 +0200
Subject: [PATCH 1/2] i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS() and
 RUNTIME_PM_OPS()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-1-aab001eb1ad1@bootlin.com>
References: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
In-Reply-To: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
To: Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
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
index 30a5ea282a8b..410c8b37f768 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1534,7 +1534,7 @@ static void omap_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused omap_i2c_runtime_suspend(struct device *dev)
+static int omap_i2c_runtime_suspend(struct device *dev)
 {
 	struct omap_i2c_dev *omap = dev_get_drvdata(dev);
 
@@ -1560,7 +1560,7 @@ static int __maybe_unused omap_i2c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
+static int omap_i2c_runtime_resume(struct device *dev)
 {
 	struct omap_i2c_dev *omap = dev_get_drvdata(dev);
 
@@ -1575,10 +1575,10 @@ static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
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
@@ -1586,7 +1586,7 @@ static struct platform_driver omap_i2c_driver = {
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


