Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383FE2E2A70
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Dec 2020 09:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgLYIkv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Dec 2020 03:40:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9686 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgLYIkv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Dec 2020 03:40:51 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D2L2l0fSpzktY9;
        Fri, 25 Dec 2020 16:39:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 25 Dec 2020 16:40:03 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <wsa@kernel.org>, <rrichter@marvell.com>,
        <thor.thayer@linux.intel.com>, <manivannan.sadhasivam@linaro.org>,
        <linus.walleij@linaro.org>, <zhengdejin5@gmail.com>,
        <hslester96@gmail.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: fix platform_get_irq.cocci warnings
Date:   Fri, 25 Dec 2020 16:40:06 +0800
Message-ID: <1608885606-1962-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove dev_err() messages after platform_get_irq*() failures.
drivers/i2c/busses/i2c-hix5hd2.c:417:2-9: line 417 is redundant
because platform_get_irq() already prints an error

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/i2c/busses/i2c-hix5hd2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index ab15b1e..c45f226 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -413,10 +413,8 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(&pdev->dev, "cannot find HS-I2C IRQ\n");
+	if (irq <= 0)
 		return irq;
-	}
 
 	priv->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-- 
2.7.4

