Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD6635CA72
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 17:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243147AbhDLPu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 11:50:57 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16903 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243098AbhDLPu5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 11:50:57 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FJtSZ1fZ6zjZ0w;
        Mon, 12 Apr 2021 23:48:46 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 23:50:26 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] i2c: mpc: drop release for resource allocated with devm_*
Date:   Mon, 12 Apr 2021 16:00:26 +0000
Message-ID: <20210412160026.194423-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's not necessary to release resource which allocated with devm_*
and those release may leads to a double free. And also remove useless
irq_dispose_mapping() call since mapping not created.

Fixes: 09aab7add7bf ("i2c: mpc: use device managed APIs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/i2c/busses/i2c-mpc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 46cdb36e2f9b..6e5614acebac 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -759,12 +759,6 @@ static int fsl_i2c_remove(struct platform_device *op)
 	if (i2c->clk_per)
 		clk_disable_unprepare(i2c->clk_per);
 
-	if (i2c->irq)
-		free_irq(i2c->irq, i2c);
-
-	irq_dispose_mapping(i2c->irq);
-	iounmap(i2c->base);
-	kfree(i2c);
 	return 0;
 };
 

