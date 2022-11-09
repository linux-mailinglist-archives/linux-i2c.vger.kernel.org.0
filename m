Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C995D622A5C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Nov 2022 12:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiKILYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 06:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiKILY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 06:24:29 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61BD19021
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 03:24:27 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N6jGC3d78zJnWM;
        Wed,  9 Nov 2022 19:21:23 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 19:24:24 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <openbmc@lists.ozlabs.org>,
        <linux-i2c@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] i2c: npcm7xx: Fix error handling in npcm_i2c_init()
Date:   Wed, 9 Nov 2022 11:22:50 +0000
Message-ID: <20221109112250.124829-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A problem about i2c-npcm7xx create debugfs failed is triggered with the
following log given:

 [  173.827310] debugfs: Directory 'npcm_i2c' with parent '/' already present!

The reason is that npcm_i2c_init() returns platform_driver_register()
directly without checking its return value, if platform_driver_register()
failed, it returns without destroy the newly created debugfs, resulting
the debugfs of npcm_i2c can never be created later.

 npcm_i2c_init()
   debugfs_create_dir() # create debugfs directory
   platform_driver_register()
     driver_register()
       bus_add_driver()
         priv = kzalloc(...) # OOM happened
   # return without destroy debugfs directory

Fix by removing debugfs when platform_driver_register() returns error.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 0c365b57d957..83457359ec45 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2393,8 +2393,17 @@ static struct platform_driver npcm_i2c_bus_driver = {
 
 static int __init npcm_i2c_init(void)
 {
+	int ret;
+
 	npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
-	return platform_driver_register(&npcm_i2c_bus_driver);
+
+	ret = platform_driver_register(&npcm_i2c_bus_driver);
+	if (ret) {
+		debugfs_remove_recursive(npcm_i2c_debugfs_dir);
+		return ret;
+	}
+
+	return 0;
 }
 module_init(npcm_i2c_init);
 
-- 
2.17.1

