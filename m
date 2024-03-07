Return-Path: <linux-i2c+bounces-2256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD1875150
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 15:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50E6FB28006
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 14:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E58512D754;
	Thu,  7 Mar 2024 14:04:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net [46.105.43.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAF12BF12
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.43.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820288; cv=none; b=uquHb69eiDv+ovgkQNxSdYqFhscnjkHn9Az0x2lVjPdy5notqYHUjz3SefsjsJTyJ2AIZzLAfMZVtAtuHD/ClDW9rFZ8XHTpdNrJ3L7yCN3SKoF5ntqJEsjP5rbtIna2jcxI41VW5ed53FWFUqp/qM4lZNA5QXUFP3saQFjM5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820288; c=relaxed/simple;
	bh=tIK19ontrI1rUAXmDeL/20rLDHS95LeN4MXuIS0uO4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3CZyiESqON2xvunHjhmRdeX+K6LQY4YBUHBwa27rLO5PWcstbKDFwaY4RB+FoJpJ59apda+IgUaprMeGuWqA17AWFAD7pYB2BidYWTDePuOd7OG/luu7+o9Zpd5/temllDGaoV5kiccUXnlZrvDMLcT2UssQSnTWj0tCERwTHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.43.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.2.251])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4Tr9zC3nvSz1gKh
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 14:04:39 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lvk4g (unknown [10.110.178.131])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A70A61FECD;
	Thu,  7 Mar 2024 14:04:37 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-6684bf9d7b-lvk4g with ESMTPSA
	id DSENHXXJ6WU6swAABpwoLw
	(envelope-from <andi@etezian.org>); Thu, 07 Mar 2024 14:04:37 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0048fe01131-9bd5-48bc-845a-538c2621cb54,
                    04C590A03728565FFF4429BE5B8A1A25418CCD80) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] i2c: exynos5: Revert "i2c: exynos5: Init data before registering interrupt handler"
Date: Thu,  7 Mar 2024 15:04:27 +0100
Message-ID: <20240307140427.1942235-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14517071925640890951
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrieefgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth

Marek hs reported that commit 51130d52b84c ("i2c: exynos5: Init
data before registering interrupt handler") is breaking things.

This is a regression and until we find out what happens this
should be reverted.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-exynos5.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 8458e22313a7f..385ef9d9e4d4c 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -906,9 +906,23 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->adap.algo_data = i2c;
 	i2c->adap.dev.parent = &pdev->dev;
 
+	/* Clear pending interrupts from u-boot or misc causes */
+	exynos5_i2c_clr_pend_irq(i2c);
+
 	spin_lock_init(&i2c->lock);
 	init_completion(&i2c->msg_complete);
 
+	i2c->irq = ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_clk;
+
+	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
+	if (ret != 0) {
+		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
+		goto err_clk;
+	}
+
 	i2c->variant = of_device_get_match_data(&pdev->dev);
 
 	ret = exynos5_hsi2c_clock_setup(i2c);
@@ -926,21 +940,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	clk_disable(i2c->clk);
 	clk_disable(i2c->pclk);
 
-	/* Clear pending interrupts from u-boot or misc causes */
-	exynos5_i2c_clr_pend_irq(i2c);
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		goto err_clk;
-	i2c->irq = ret;
-
-	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
-		goto err_clk;
-	}
-
 	return 0;
 
  err_clk:
-- 
2.43.0


