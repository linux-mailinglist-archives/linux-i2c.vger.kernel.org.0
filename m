Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3863D34917E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 13:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhCYMEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 08:04:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14535 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhCYMEl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 08:04:41 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5kHG44ZTzPlls;
        Thu, 25 Mar 2021 20:02:02 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 20:03:59 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <pierre-yves.mordret@foss.st.com>, <alain.volmat@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] i2c: stm32f7: Remove useless error message
Date:   Thu, 25 Mar 2021 20:04:32 +0800
Message-ID: <1616673872-4382-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following coccicheck report:

drivers/i2c/busses/i2c-stm32f7.c:2032:3-10 : platform_get_irq :
line 2032 is redundant because platform_get_irq() already prints an error

Remove dev_err() messages after platform_get_irq() failures.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 162a3b0..9fbcbd1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2035,12 +2035,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	phy_addr = (dma_addr_t)res->start;
 
 	irq_event = platform_get_irq(pdev, 0);
-	if (irq_event <= 0) {
-		if (irq_event != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get IRQ event: %d\n",
-				irq_event);
+	if (irq_event <= 0)
 		return irq_event ? : -ENOENT;
-	}
 
 	irq_error = platform_get_irq(pdev, 1);
 	if (irq_error <= 0)
-- 
2.7.4

