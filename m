Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788581C566D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 15:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgEENKE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 09:10:04 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:28001 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgEENKE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 May 2020 09:10:04 -0400
Received: from localhost.localdomain ([93.23.13.215])
        by mwinf5d18 with ME
        id b19t220094ePWwV0319taG; Tue, 05 May 2020 15:10:02 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 05 May 2020 15:10:02 +0200
X-ME-IP: 93.23.13.215
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        wsa@the-dreams.de, wahrenst@gmx.net, nh6z@nh6z.net,
        eric@anholt.net, andriy.shevchenko@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: bcm2835: Fix an error handling path in 'bcm2835_i2c_probe()'
Date:   Tue,  5 May 2020 15:09:52 +0200
Message-Id: <20200505130952.176190-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A call to 'clk_set_rate_exclusive()' must be balanced in the error handling
path.
Add a corresponding 'clk_rate_exclusive_put()'.

While a it, also balance a 'clk_prepare_enable()' call with a
'clk_disable_unprepare()' call and move a 'free_irq()' to the new error
handling path.

This has the side effect to propagate the error code returned by
'request_irq()' instead of returning -ENODEV.

This way, the error handling path of the probe function looks similar to
the remove function.

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-bcm2835.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index d9b86fcc3825..7f403e07dff4 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -451,13 +451,14 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(i2c_dev->bus_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't prepare clock");
-		return ret;
+		goto err_unprotect_clk;
 	}
 
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!irq) {
 		dev_err(&pdev->dev, "No IRQ resource\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_unprepare_clk;
 	}
 	i2c_dev->irq = irq->start;
 
@@ -465,7 +466,7 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 			  dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not request IRQ\n");
-		return -ENODEV;
+		goto err_unprepare_clk;
 	}
 
 	adap = &i2c_dev->adapter;
@@ -483,7 +484,16 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		free_irq(i2c_dev->irq, i2c_dev);
+		goto err_free_irq;
+
+	return 0;
+
+err_free_irq:
+	free_irq(i2c_dev->irq, i2c_dev);
+err_unprepare_clk:
+	clk_disable_unprepare(i2c_dev->bus_clk);
+err_unprotect_clk:
+	clk_rate_exclusive_put(i2c_dev->bus_clk);
 
 	return ret;
 }
-- 
2.25.1

