Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A964C46F96A
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 03:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbhLJDBv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 22:01:51 -0500
Received: from m12-18.163.com ([220.181.12.18]:22780 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhLJDBv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 22:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Ul1cZ
        sDrGceF2boeMAzd+MEotAGR1y5T0vMOvr4Pzas=; b=h+l7rWgRCJkzpMD2c9pTD
        nIxEClaO1waQc7ve0uNWoAySqy2Y3V6HJnI+Q3HM/lX/z0rHvtMsJ6+2ZswTkAuK
        W57Z35gNv9dki3ijNqKsnOmuP0uJtBP0GKWkcoi+JiuE7jCRNWC2A2G50+wdKBHn
        exQSpotFYrwqjKMlpqdYd8=
Received: from localhost.localdomain (unknown [120.243.48.4])
        by smtp14 (Coremail) with SMTP id EsCowADnTlf_wbJhOuGqAA--.18832S4;
        Fri, 10 Dec 2021 10:57:38 +0800 (CST)
From:   lizhe <sensor1010@163.com>
To:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sensor1010@163.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/i2c/busses/i2c-imx.c: Use with resource management to register interrupts
Date:   Thu,  9 Dec 2021 18:57:01 -0800
Message-Id: <20211210025701.7316-1-sensor1010@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowADnTlf_wbJhOuGqAA--.18832S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruryrXrW8XFyfGFy3XrW8JFb_yoWktrcE9F
        W8Cwn7WrsIvrnYgr1YvFW3Zr1vkF1q9F18X3W2qa4S934DKwsruFsrZ3s5Ar4DWr47KFnY
        93s8GF4fArnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjNzV5UUUUU==
X-Originating-IP: [120.243.48.4]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBlwZkq1SIlLJeLAABsX
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the probe function, used devm_request_threaded_irq instead of
request_threaded_irq, make full use of the resource management
function provided by the kernel

Signed-off-by: lizhe <sensor1010@163.com>
---
 drivers/i2c/busses/i2c-imx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3576b63a6c03..3e99827b2720 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1426,7 +1426,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
+	ret = devm_request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
 				   pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
@@ -1472,7 +1472,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	free_irq(irq, i2c_imx);
 rpm_disable:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1


