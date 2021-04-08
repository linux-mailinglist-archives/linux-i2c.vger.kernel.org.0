Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2503581C1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 13:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhDHL30 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 07:29:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16094 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbhDHL3Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 07:29:25 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGJrP48krz19L3J;
        Thu,  8 Apr 2021 19:27:01 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 19:29:06 +0800
From:   Pu Lehui <pulehui@huawei.com>
To:     <zhengdejin5@gmail.com>, <wsa@kernel.org>,
        <bjorn.andersson@linaro.org>, <andriy.shevchenko@linux.intel.com>,
        <bgolaszewski@baylibre.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pulehui@huawei.com>
Subject: [PATCH -next] i2c: img-scb: fix PM reference leak in img_i2c_xfer()
Date:   Thu, 8 Apr 2021 19:29:10 +0800
Message-ID: <20210408112910.212873-1-pulehui@huawei.com>
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
 drivers/i2c/busses/i2c-img-scb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 98a89301ed2a..8e987945ed45 100644
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
2.17.1

