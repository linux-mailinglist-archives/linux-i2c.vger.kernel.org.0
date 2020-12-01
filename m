Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7BC2C9D86
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 10:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390827AbgLAJYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 04:24:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8224 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390821AbgLAJYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 04:24:32 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Clc8j5CF8zkj6p;
        Tue,  1 Dec 2020 17:23:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 17:23:43 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Tony Lindgren" <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH 5/8] i2c: omap: fix reference leak when pm_runtime_get_sync fails
Date:   Tue, 1 Dec 2020 17:31:43 +0800
Message-ID: <20201201093143.113180-1-miaoqinglang@huawei.com>
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
return in omap_i2c_probe() and omap_i2c_remove().

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here. I Replace it with pm_runtime_resume_and_get
to keep usage counter balanced.

What's more, error path 'err_free_mem' seems not like a proper
name any more. So I change the name to err_disable_pm and move
pm_runtime_disable below, for pm_runtime of 'pdev->dev' should
be disabled when pm_runtime_resume_and_get fails.

Fixes: 3b0fb97c8dc4 ("I2C: OMAP: Handle error check for pm runtime")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/i2c/busses/i2c-omap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 12ac4212a..d4f6c6d60 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1404,9 +1404,9 @@ omap_i2c_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(omap->dev, OMAP_I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(omap->dev);
 
-	r = pm_runtime_get_sync(omap->dev);
+	r = pm_runtime_resume_and_get(omap->dev);
 	if (r < 0)
-		goto err_free_mem;
+		goto err_disable_pm;
 
 	/*
 	 * Read the Rev hi bit-[15:14] ie scheme this is 1 indicates ver2.
@@ -1513,8 +1513,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 	pm_runtime_dont_use_autosuspend(omap->dev);
 	pm_runtime_put_sync(omap->dev);
+err_disable_pm:
 	pm_runtime_disable(&pdev->dev);
-err_free_mem:
 
 	return r;
 }
@@ -1525,7 +1525,7 @@ static int omap_i2c_remove(struct platform_device *pdev)
 	int ret;
 
 	i2c_del_adapter(&omap->adapter);
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.23.0

