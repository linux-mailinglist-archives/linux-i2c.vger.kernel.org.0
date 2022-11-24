Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A84F63749B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Nov 2022 09:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiKXI5E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Nov 2022 03:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiKXI4v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Nov 2022 03:56:51 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52198756F
        for <linux-i2c@vger.kernel.org>; Thu, 24 Nov 2022 00:56:49 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NHsGf70JkzJnt1;
        Thu, 24 Nov 2022 16:53:30 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 16:56:48 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 24 Nov
 2022 16:56:47 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
CC:     <yangyingliang@huawei.com>
Subject: [PATCH] i2c: core: Fix possible memleak in i2c_new_client_device()
Date:   Thu, 24 Nov 2022 16:54:48 +0800
Message-ID: <20221124085448.3620240-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

If device_register() returns error in i2c_new_client_device(),
the name allocated by i2c_dev_set_name() need be freed. As
comment of device_register() says, it should use put_device()
to give up the reference in the error path.

Moving i2c_dev_set_name() to front of device_register(), so
it's managed by device core, then call put_device(), when the
refcount is 0, the name will be freed in kobject_cleanup() and
the 'client' will be freed in i2c_client_dev_release().

Because the 'client' is freed by calling put_device(), so it
don't need goto error label, release other resources before
put_device() and return directly.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/i2c-core-base.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..161bf28f2d87 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -954,7 +954,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
-	i2c_dev_set_name(adap, client, info);
 
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
@@ -966,17 +965,23 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	i2c_dev_set_name(adap, client, info);
 	status = device_register(&client->dev);
-	if (status)
-		goto out_remove_swnode;
+	if (status) {
+		device_remove_software_node(&client->dev);
+		of_node_put(info->of_node);
+		dev_err(&adap->dev,
+			"Failed to register i2c client %s at 0x%02x (%d)\n",
+			client->name, client->addr, status);
+		put_device(&client->dev);
+		return ERR_PTR(status);
+	}
 
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
 	return client;
 
-out_remove_swnode:
-	device_remove_software_node(&client->dev);
 out_err_put_of_node:
 	of_node_put(info->of_node);
 out_err:
-- 
2.25.1

