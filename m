Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1DA5EF77F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 16:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234411AbiI2O1P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 10:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234788AbiI2O1O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 10:27:14 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A56A1162FD
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 07:27:11 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MdbDh5nm4zWh53;
        Thu, 29 Sep 2022 22:23:00 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 22:27:08 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 22:27:07 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <nsekhar@ti.com>, <brgl@bgdev.pl>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH v2] i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe
Date:   Thu, 29 Sep 2022 22:30:38 +0800
Message-ID: <20220929143038.60864-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pm_runtime_enable will increase power disable depth. Thus a
pairing decrement is needed on the error handling path to keep
it balanced according to context.

Fixes:17f88151ff190 ("i2c: davinci: Add PM Runtime Support")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/i2c/busses/i2c-davinci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 471c47db546b..c836cf884185 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -823,7 +823,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	r = pm_runtime_resume_and_get(dev->dev);
 	if (r < 0) {
 		dev_err(dev->dev, "failed to runtime_get device: %d\n", r);
-		return r;
+		goto err_pm;
 	}
 
 	i2c_davinci_init(dev);
@@ -882,6 +882,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 err_unuse_clocks:
 	pm_runtime_dont_use_autosuspend(dev->dev);
 	pm_runtime_put_sync(dev->dev);
+err_pm:
 	pm_runtime_disable(dev->dev);
 
 	return r;
-- 
2.25.1

