Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703B92C9D96
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 10:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389447AbgLAJZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 04:25:09 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8896 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390818AbgLAJYa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 04:24:30 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Clc8q3221z75q3;
        Tue,  1 Dec 2020 17:23:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 17:23:40 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH 2/8] i2c: img-scb: fix reference leak when pm_runtime_get_sync fails
Date:   Tue, 1 Dec 2020 17:31:39 +0800
Message-ID: <20201201093139.112946-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201201092924.112461-1-miaoqinglang@huawei.com>
References: <20201201092924.112461-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PM reference count is not expected to be incremented on
return in functions img_i2c_xfer and img_i2c_init.

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: 93222bd9b966 ("i2c: img-scb: Add runtime PM")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 98a89301e..8e987945e 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1057,7 +1057,7 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			atomic = true;
 	}
 
-	ret = pm_runtime_get_sync(adap->dev.parent);
+	ret = pm_runtime_resume_and_get(adap->dev.parent);
 	if (ret < 0)
 		return ret;
 
@@ -1158,7 +1158,7 @@ static int img_i2c_init(struct img_i2c *i2c)
 	u32 rev;
 	int ret;
 
-	ret = pm_runtime_get_sync(i2c->adap.dev.parent);
+	ret = pm_runtime_resume_and_get(i2c->adap.dev.parent);
 	if (ret < 0)
 		return ret;
 
-- 
2.23.0

