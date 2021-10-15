Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B19142EE1D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Oct 2021 11:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhJOJuI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Oct 2021 05:50:08 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:14357 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhJOJuH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Oct 2021 05:50:07 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HW1Xr1rFMz909T;
        Fri, 15 Oct 2021 17:43:08 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 15 Oct 2021 17:48:00 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 15 Oct
 2021 17:47:59 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <wsa@kernel.org>
Subject: [PATCH] i2c: core: Fix possible memleak in i2c_new_client_device()
Date:   Fri, 15 Oct 2021 17:55:41 +0800
Message-ID: <20211015095541.3611223-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
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

In error path after calling i2c_dev_set_name(), the put_device()
should be used to give up the device reference, then the name
allocated in dev_set_name() will be freed in kobject_cleanup().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/i2c-core-base.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 54964fbe3f03..190d4fd5e594 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1047,8 +1047,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.of_node = of_node_get(info->of_node);
 	client->dev.fwnode = info->fwnode;
 
-	i2c_dev_set_name(adap, client, info);
-
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
 		if (status) {
@@ -1059,17 +1057,20 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	i2c_dev_set_name(adap, client, info);
 	status = device_register(&client->dev);
-	if (status)
-		goto out_remove_swnode;
+	if (status) {
+		device_remove_software_node(&client->dev);
+		of_node_put(info->of_node);
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

