Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1F876B637
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 15:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbjHANtE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 09:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbjHANsw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 09:48:52 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31098ED
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 06:48:48 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFbym5D9kz1GDGh;
        Tue,  1 Aug 2023 21:47:44 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 21:48:45 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <brgl@bgdev.pl>, <andi.shyti@kernel.org>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v2] i2c: remove redundant dev_err_probe()
Date:   Tue, 1 Aug 2023 21:48:14 +0800
Message-ID: <20230801134814.247782-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When platform_get_irq() is called, the error message has been printed,
so it need not to call dev_err_probe() to print error.

As the comment of platform_get_irq() says, it returned non-zero value
when it succeeded, and it returned negative value when it failed.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---
Changes in v2:
- Update the comment, explain the return value of platform_get_irq().
---
 drivers/i2c/busses/i2c-davinci.c           | 2 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 52527189a7bf..329c952d5062 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -765,7 +765,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return dev_err_probe(&pdev->dev, irq, "can't get irq resource\n");
+		return irq;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 7f58f7eaabb6..0b0a1c4d17ca 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -378,9 +378,8 @@ static int mchp_corei2c_probe(struct platform_device *pdev)
 		return PTR_ERR(idev->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return dev_err_probe(&pdev->dev, -ENXIO,
-				     "invalid IRQ %d for I2C controller\n", irq);
+	if (irq < 0)
+		return irq;
 
 	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(idev->i2c_clk))
-- 
2.17.1

