Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494085EC7B6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 17:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbiI0P3t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 11:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbiI0P3X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 11:29:23 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240A31BA384
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 08:29:22 -0700 (PDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McNkm55qfzpStW;
        Tue, 27 Sep 2022 23:26:24 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 23:29:20 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 23:29:19 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <nsekhar@ti.com>, <brgl@bgdev.pl>, <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH -next] i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe
Date:   Tue, 27 Sep 2022 23:32:49 +0800
Message-ID: <20220927153249.66926-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

