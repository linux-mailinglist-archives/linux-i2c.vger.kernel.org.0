Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F4C2C9D8F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 10:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390862AbgLAJYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 04:24:42 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8898 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390851AbgLAJYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 04:24:41 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Clc8z0W02z75dS;
        Tue,  1 Dec 2020 17:23:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 17:23:47 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH 8/8] i2c: xiic: fix reference leak when pm_runtime_get_sync fails
Date:   Tue, 1 Dec 2020 17:31:46 +0800
Message-ID: <20201201093146.113316-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201201092924.112461-1-miaoqinglang@huawei.com>
References: <20201201092924.112461-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PM reference count is not expected to be incremented on
return in xiic_xfer and xiic_i2c_remove.

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: 10b17004a74c ("i2c: xiic: Fix the clocking across bind unbind")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 087b29519..2a8568b97 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -706,7 +706,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	dev_dbg(adap->dev.parent, "%s entry SR: 0x%x\n", __func__,
 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET));
 
-	err = pm_runtime_get_sync(i2c->dev);
+	err = pm_runtime_resume_and_get(i2c->dev);
 	if (err < 0)
 		return err;
 
@@ -873,7 +873,7 @@ static int xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = pm_runtime_get_sync(i2c->dev);
+	ret = pm_runtime_resume_and_get(i2c->dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.23.0

