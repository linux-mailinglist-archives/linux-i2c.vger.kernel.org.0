Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2F03581A6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 13:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhDHLYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 07:24:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16093 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhDHLYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 07:24:10 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGJkL2ypYz19KtW;
        Thu,  8 Apr 2021 19:21:46 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 19:23:48 +0800
From:   Pu Lehui <pulehui@huawei.com>
To:     <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pulehui@huawei.com>, <yangjihong1@huawei.com>,
        <zhangjinhao2@huawei.com>
Subject: [PATCH -next] i2c: cadence: Fix PM reference leak in cdns_i2c_master_xfer()
Date:   Thu, 8 Apr 2021 19:23:52 +0800
Message-ID: <20210408112352.211173-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.98]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pm_runtime_get_sync() will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get() to keep usage
counter balanced.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 drivers/i2c/busses/i2c-cadence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e4b7f2a951ad..e8eae8725900 100644
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
2.17.1

