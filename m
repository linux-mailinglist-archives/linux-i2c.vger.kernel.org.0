Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE5762915A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 06:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKOFHu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 00:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiKOFHt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 00:07:49 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9871582B;
        Mon, 14 Nov 2022 21:07:48 -0800 (PST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBDgy1cYFzmVvj;
        Tue, 15 Nov 2022 13:07:26 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 13:07:46 +0800
Received: from ubuntu1804.huawei.com (10.67.175.30) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 13:07:46 +0800
From:   Hui Tang <tanghui20@huawei.com>
To:     <ardb@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yusongping@huawei.com>
Subject: [PATCH] i2c: synquacer: fix missing clk_disable_unprepare() on error path
Date:   Tue, 15 Nov 2022 13:04:29 +0800
Message-ID: <20221115050429.184659-1-tanghui20@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.30]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

clk_disable_unprepare() should be invoked on error path after
clk_prepare_enable() in synquacer_i2c_probe.

Fixes: 0d676a6c4390 ("2c: add support for Socionext SynQuacer I2C controller")
Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index cba1145ddfac..73d9168573ec 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -569,22 +569,27 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE) {
 		dev_err(&pdev->dev, "PCLK missing or out of range (%d)\n",
 			i2c->pclkrate);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto clk_free;
 	}
 
 	i2c->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(i2c->base))
-		return PTR_ERR(i2c->base);
+	if (IS_ERR(i2c->base)) {
+		ret = PTR_ERR(i2c->base);
+		goto clk_free;
+	}
 
 	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0)
-		return i2c->irq;
+	if (i2c->irq < 0) {
+		ret = i2c->irq;
+		goto clk_free;
+	}
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
 			       0, dev_name(&pdev->dev), i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
-		return ret;
+		goto clk_free;
 	}
 
 	i2c->state = STATE_IDLE;
@@ -607,7 +612,7 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	ret = i2c_add_numbered_adapter(&i2c->adapter);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
-		return ret;
+		goto clk_free;
 	}
 
 	platform_set_drvdata(pdev, i2c);
@@ -616,6 +621,11 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 		 dev_name(&i2c->adapter.dev));
 
 	return 0;
+
+clk_free:
+	if (!IS_ERR(i2c->pclk))
+		clk_disable_unprepare(i2c->pclk);
+	return ret;
 }
 
 static int synquacer_i2c_remove(struct platform_device *pdev)
-- 
2.17.1

