Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6055D341875
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 10:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhCSJdf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 05:33:35 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14405 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhCSJdG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 05:33:06 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1zDL1x0wzkbb0;
        Fri, 19 Mar 2021 17:31:30 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 17:33:02 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <linux@rempel-privat.de>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: imx: Use devm_request_irq()
Date:   Fri, 19 Mar 2021 17:33:40 +0800
Message-ID: <1616146420-6468-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_request_irq() to get rid of manual unregistration.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/i2c/busses/i2c-imx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b80fdc1..e377d4a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1435,8 +1435,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
-				   pdev->name, i2c_imx);
+	ret = devm_request_irq(&pdev->dev, irq, i2c_imx_isr,
+			       IRQF_SHARED, pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
 		goto rpm_disable;
@@ -1481,7 +1481,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	free_irq(irq, i2c_imx);
 rpm_disable:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1494,7 +1493,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 static int i2c_imx_remove(struct platform_device *pdev)
 {
 	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
-	int irq, ret;
+	int ret;
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
@@ -1514,9 +1513,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
 
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0)
-		free_irq(irq, i2c_imx);
 	clk_disable_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.7.4

