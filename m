Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669B73F3409
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Aug 2021 20:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbhHTSoV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Aug 2021 14:44:21 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:59464 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhHTSoU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Aug 2021 14:44:20 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d10 with ME
        id jujb250043riaq203ujboP; Fri, 20 Aug 2021 20:43:41 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 20 Aug 2021 20:43:41 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, wsa@kernel.org, krzk@kernel.org,
        stefan.wahren@i2se.com, nh6z@nh6z.net, eric@anholt.net
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: bcm2835: Fix the error handling in 'bcm2835_i2c_probe()'
Date:   Fri, 20 Aug 2021 20:43:33 +0200
Message-Id: <338008c444af4785a07fb5a402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some resource should be released if an error occurs in
'bcm2835_i2c_probe()'.
Add an error handling path and the needed 'clk_disable_unprepare()' and
'clk_rate_exclusive_put()' calls.

While at it, rework the bottom of the function to use this newly added
error handling path and have an explicit and more standard "return 0;" at
the end of the normal path.

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-bcm2835.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 37443edbf754..a2f19b4c2402 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -449,13 +449,14 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(i2c_dev->bus_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't prepare clock");
-		return ret;
+		goto err_put_exclusive_rate;
 	}
 
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!irq) {
 		dev_err(&pdev->dev, "No IRQ resource\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_disable_unprepare_clk;
 	}
 	i2c_dev->irq = irq->start;
 
@@ -463,7 +464,7 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 			  dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not request IRQ\n");
-		return -ENODEV;
+		goto err_disable_unprepare_clk;
 	}
 
 	adap = &i2c_dev->adapter;
@@ -481,7 +482,16 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		free_irq(i2c_dev->irq, i2c_dev);
+		goto err_free_irq;
+
+	return 0;
+
+err_free_irq:
+	free_irq(i2c_dev->irq, i2c_dev);
+err_disable_unprepare_clk:
+	clk_disable_unprepare(i2c_dev->bus_clk);
+err_put_exclusive_rate:
+	clk_rate_exclusive_put(i2c_dev->bus_clk);
 
 	return ret;
 }
-- 
2.30.2

