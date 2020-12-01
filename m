Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6D82C9D7C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 10:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729571AbgLAJYH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 04:24:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8223 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgLAJYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 04:24:05 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Clc8C4SMkzkj9j;
        Tue,  1 Dec 2020 17:22:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 17:23:18 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH 1/8] i2c: cadence: fix reference leak when pm_runtime_get_sync fails
Date:   Tue, 1 Dec 2020 17:31:17 +0800
Message-ID: <20201201093117.112900-1-miaoqinglang@huawei.com>
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
return in functions cdns_i2c_master_xfer and cdns_reg_slave.

However, pm_runtime_get_sync will increment pm usage counter
even failed. Forgetting to putting operation will result in a
reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: 7fa32329ca03 ("i2c: cadence: Move to sensible power management")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/i2c/busses/i2c-cadence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e4b7f2a95..e8eae8725 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -789,7 +789,7 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	bool change_role = false;
 #endif
 
-	ret = pm_runtime_get_sync(id->dev);
+	ret = pm_runtime_resume_and_get(id->dev);
 	if (ret < 0)
 		return ret;
 
@@ -911,7 +911,7 @@ static int cdns_reg_slave(struct i2c_client *slave)
 	if (slave->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
-	ret = pm_runtime_get_sync(id->dev);
+	ret = pm_runtime_resume_and_get(id->dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.23.0

