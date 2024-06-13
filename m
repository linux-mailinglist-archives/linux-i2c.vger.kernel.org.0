Return-Path: <linux-i2c+bounces-4014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FDB907342
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 15:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12122875DD
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 13:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8B3144D28;
	Thu, 13 Jun 2024 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oXZS6Y03"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD835143C46;
	Thu, 13 Jun 2024 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718284422; cv=none; b=bORedvrdwVY2j7Lz7X8fd0At+ekkPlLBUJ/x+tbRzu9Vwbqe9K/uKmAuFxm9fSJqsWDLsDyycbu7oKd7q9gh/BsefODe7ElGZz4H5NfACSY+S74qiFWEVZ//o0IxDBivM7chzr6FESNTO1IER/MArIAyMj6H4TiRB12pIj76Klo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718284422; c=relaxed/simple;
	bh=Ty2UCqUCB0l7oVWoD5eKOXaiKOi1EakKfeomsmmXcoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8ZJ3WUkLFxHADkOGrmOxE1tRkBGW7aduu9kQzuo5IbqmVZrz/QPhR3ZpJlAUL66DYaf5hFR2w2BYbdTg3PoES3Krkc2mDiDjcV7Ovgym37R3RIZVQkJ4ajMgqpYBPUg8CMw025B89dI3CB/UBiDq+oQVIyyexm+T59OX7IaGcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oXZS6Y03; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A012720003;
	Thu, 13 Jun 2024 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718284418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnXBYdyT0gNgWX4/GEGtMkJeHalCuEmPx0jaEIE6hhg=;
	b=oXZS6Y03Py2abvBDLCedfdQ9y7RgtZWBDeY21qzLJK5MmtDCtpZP9WO0Yeibpug5vd9D9T
	JhhcFZ0Xj86WrJ9C4OwAXxW1+v/0limydcCxwt5XnGYcAffUjWuGOl0Odc0xHGgpKG+CsM
	v7vResNn1d6LrTDfTM+DBCPRNP3XyMzlo752JQBEsl3R9h1Q4gIeXJY2hXDQiamAm/aox5
	QL3ivUvV/hoekJgSxe7BHmhDXcWAeMut8aPJJcCTWh+wDYOCByj2Qp/6yejU3pqaTGGR15
	7xiTmZ6Vtr7nT8DBNDXcfpbrmprD7NaQh0iuraIMskpaKd39Tr67Nl5rSWfSlQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 13 Jun 2024 15:13:28 +0200
Subject: [PATCH 2/2] i2c: omap: wakeup the controller during suspend()
 callback
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-2-aab001eb1ad1@bootlin.com>
References: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
In-Reply-To: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
To: Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
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
index 410c8b37f768..35a3f0a64986 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1574,9 +1574,31 @@ static int omap_i2c_runtime_resume(struct device *dev)
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


