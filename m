Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131313974E2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 16:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhFAOF6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 10:05:58 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:6120 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhFAOFz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 10:05:55 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FvYjg3bTZzYpZN;
        Tue,  1 Jun 2021 22:01:27 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 22:04:11 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 1 Jun 2021
 22:04:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <wsa@kernel.org>, <f.fainelli@gmail.com>
Subject: [PATCH -next] i2c: bcm2835: add missing disable and put clk on error in bcm2835_i2c_probe()
Date:   Tue, 1 Jun 2021 22:08:35 +0800
Message-ID: <20210601140835.3595921-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add clk_disable_unprepare() and clk_rate_exclusive_put() on error
path in bcm2835_i2c_probe().

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 37443edbf754..a7fa3429c389 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -449,13 +449,14 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(i2c_dev->bus_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't prepare clock");
-		return ret;
+		goto err_put_clk;
 	}
 
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!irq) {
 		dev_err(&pdev->dev, "No IRQ resource\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_disable_clk;
 	}
 	i2c_dev->irq = irq->start;
 
@@ -463,7 +464,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 			  dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not request IRQ\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_disable_clk;
 	}
 
 	adap = &i2c_dev->adapter;
@@ -480,9 +482,17 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_C, 0);
 
 	ret = i2c_add_adapter(adap);
-	if (ret)
+	if (ret) {
 		free_irq(i2c_dev->irq, i2c_dev);
+		goto err_disable_clk;
+	}
 
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(i2c_dev->bus_clk);
+err_put_clk:
+	clk_rate_exclusive_put(i2c_dev->bus_clk);
 	return ret;
 }
 
-- 
2.25.1

