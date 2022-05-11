Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E7E5228CF
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 03:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239822AbiEKBQQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 21:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240206AbiEKBQP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 21:16:15 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBD0275F7;
        Tue, 10 May 2022 18:16:13 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KycQX0Q2Kz1JC3x;
        Wed, 11 May 2022 09:15:00 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 09:16:11 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 09:16:11 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <wsa@kernel.org>
Subject: [PATCH v2] i2c: core: Fix possible memleak in i2c_new_client_device()
Date:   Wed, 11 May 2022 09:27:38 +0800
Message-ID: <20220511012738.3031346-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I got memory leak as follows when doing fault injection test:

unreferenced object 0xffff888014aec078 (size 8):
  comm "xrun", pid 356, jiffies 4294910619 (age 16.332s)
  hex dump (first 8 bytes):
    31 2d 30 30 31 63 00 00                          1-001c..
  backtrace:
    [<00000000eb56c0a9>] __kmalloc_track_caller+0x1a6/0x300
    [<000000000b220ea3>] kvasprintf+0xad/0x140
    [<00000000b83203e5>] kvasprintf_const+0x62/0x190
    [<000000002a5eab37>] kobject_set_name_vargs+0x56/0x140
    [<00000000300ac279>] dev_set_name+0xb0/0xe0
    [<00000000b66ebd6f>] i2c_new_client_device+0x7e4/0x9a0

In error path after calling dev_set_name() which called by
i2c_dev_set_name(), the put_device() should be used to give up
the device reference, then the name allocated in dev_set_name()
will be freed in kobject_cleanup().
In this patch, I splited device_register() into device_initialize()
and device_add() to make the code more clear.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  split device_register() into device_initialize() and device_add()
---
 drivers/i2c/i2c-core-base.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..e7dded8b037b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -928,6 +928,11 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->flags = info->flags;
 	client->addr = info->addr;
 
+	client->dev.parent = &client->adapter->dev;
+	client->dev.bus = &i2c_bus_type;
+	client->dev.type = &i2c_client_type;
+	device_initialize(&client->dev);
+
 	client->init_irq = info->irq;
 	if (!client->init_irq)
 		client->init_irq = i2c_dev_irq_from_resources(info->resources,
@@ -947,9 +952,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	if (status)
 		goto out_err;
 
-	client->dev.parent = &client->adapter->dev;
-	client->dev.bus = &i2c_bus_type;
-	client->dev.type = &i2c_client_type;
 	client->dev.of_node = of_node_get(info->of_node);
 	client->dev.fwnode = info->fwnode;
 
@@ -966,7 +968,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
-	status = device_register(&client->dev);
+	status = device_add(&client->dev);
 	if (status)
 		goto out_remove_swnode;
 
@@ -984,7 +986,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		"Failed to register i2c client %s at 0x%02x (%d)\n",
 		client->name, client->addr, status);
 out_err_silent:
-	kfree(client);
+	put_device(&client->dev);
 	return ERR_PTR(status);
 }
 EXPORT_SYMBOL_GPL(i2c_new_client_device);
-- 
2.25.1

