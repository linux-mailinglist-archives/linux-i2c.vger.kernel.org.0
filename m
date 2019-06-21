Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A1E4E678
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfFUKxS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:53:18 -0400
Received: from smtp127.iad3b.emailsrvr.com ([146.20.161.127]:47750 "EHLO
        smtp127.iad3b.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726218AbfFUKxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:53:18 -0400
Received: from smtp24.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
        by smtp24.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id E12D44009E;
        Fri, 21 Jun 2019 06:53:16 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1561114396;
        bh=lV2bfiKsrsCHwVyTTU5OqwVm0y5wd6eyI9O1PfwzpQA=;
        h=From:To:Subject:Date:From;
        b=u6vzPBTngG+KiVZ/YIymkvv49EWY1A7zcjitAMkROEQnPul9o6NX6OJpiSWdfbXpK
         nm0enxQJIhwSCAMmuG3jYBz7P6Z2Xj8qy7A4bz/21zoJgPKlrZox6QneigzGBG3Dpk
         CDgxdwFEiIHmUcdQjVFE5NIcRKtmOp4S33R1nKi4=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp24.relay.iad3b.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 9C1D440127;
        Fri, 21 Jun 2019 06:53:15 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from commune.xenotropic.com (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:25 (trex/5.7.12);
        Fri, 21 Jun 2019 06:53:16 -0400
From:   Annaliese McDermond <nh6z@nh6z.net>
To:     eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com,
        wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Annaliese McDermond <nh6z@nh6z.net>, team@nwdigitalradio.com
Subject: [PATCH v2 1/2] i2c: bcm2835: Move IRQ request after clock code in probe
Date:   Fri, 21 Jun 2019 03:52:49 -0700
Message-Id: <20190621105250.19858-2-nh6z@nh6z.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190621105250.19858-1-nh6z@nh6z.net>
References: <20190621105250.19858-1-nh6z@nh6z.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If any of the clock code in the probe fails and returns, the IRQ
will not be freed.  Moving the IRQ request to last allows it to
be freed on any errors further up in the probe function.  devm_
calls can apparently not be used because there are some potential
race conditions that will arise.

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")

Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
---
 drivers/i2c/busses/i2c-bcm2835.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 108d2ae4632c..27b2f204c693 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -521,20 +521,6 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c_dev->regs))
 		return PTR_ERR(i2c_dev->regs);
 
-	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
-		return -ENODEV;
-	}
-	i2c_dev->irq = irq->start;
-
-	ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
-			  dev_name(&pdev->dev), i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not request IRQ\n");
-		return -ENODEV;
-	}
-
 	mclk_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
 
 	bus_clk = bcm2835_i2c_register_div(&pdev->dev, mclk_name, i2c_dev);
@@ -564,6 +550,20 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!irq) {
+		dev_err(&pdev->dev, "No IRQ resource\n");
+		return -ENODEV;
+	}
+	i2c_dev->irq = irq->start;
+
+	ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
+			  dev_name(&pdev->dev), i2c_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not request IRQ\n");
+		return -ENODEV;
+	}
+
 	adap = &i2c_dev->adapter;
 	i2c_set_adapdata(adap, i2c_dev);
 	adap->owner = THIS_MODULE;
-- 
2.19.1

