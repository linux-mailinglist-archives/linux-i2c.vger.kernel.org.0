Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F77341373
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 04:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhCSD27 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 23:28:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13202 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhCSD26 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 23:28:58 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1q7C2HyxzmZTd;
        Fri, 19 Mar 2021 11:26:31 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 11:28:53 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: qup: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Fri, 19 Mar 2021 11:29:31 +0800
Message-ID: <1616124571-59218-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/i2c/busses/i2c-qup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 61dc20f..324ced7 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1797,12 +1797,12 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		goto fail;
 
 	ret = devm_request_irq(qup->dev, qup->irq, qup_i2c_interrupt,
-			       IRQF_TRIGGER_HIGH, "i2c_qup", qup);
+			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+			       "i2c_qup", qup);
 	if (ret) {
 		dev_err(qup->dev, "Request %d IRQ failed\n", qup->irq);
 		goto fail;
 	}
-	disable_irq(qup->irq);
 
 	hw_ver = readl(qup->base + QUP_HW_VERSION);
 	dev_dbg(qup->dev, "Revision %x\n", hw_ver);
-- 
2.7.4

