Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC3F358327
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 14:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhDHMUg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 08:20:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16841 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhDHMUf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 08:20:35 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGKzQ3cmSz7tyN;
        Thu,  8 Apr 2021 20:18:10 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 20:20:13 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <digetx@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <prime.zeng@huawei.com>, <tiantao6@hisilicon.com>,
        <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH] i2c: core: simplify devm_i2c_new_dummy_device()
Date:   Thu, 8 Apr 2021 20:17:40 +0800
Message-ID: <1617884260-15461-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_add_action_or_reset() instead of devres_alloc() and
devres_add(), which works the same. This will simplify the
code. There is no functional change.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/i2c-core-base.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf72..b883a59 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1016,15 +1016,9 @@ struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address
 }
 EXPORT_SYMBOL_GPL(i2c_new_dummy_device);

-struct i2c_dummy_devres {
-	struct i2c_client *client;
-};
-
-static void devm_i2c_release_dummy(struct device *dev, void *res)
+static void devm_i2c_release_dummy(void *client)
 {
-	struct i2c_dummy_devres *this = res;
-
-	i2c_unregister_device(this->client);
+	i2c_unregister_device(client);
 }

 /**
@@ -1041,20 +1035,16 @@ struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
 					     struct i2c_adapter *adapter,
 					     u16 address)
 {
-	struct i2c_dummy_devres *dr;
 	struct i2c_client *client;
-
-	dr = devres_alloc(devm_i2c_release_dummy, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
-		return ERR_PTR(-ENOMEM);
+	int ret;

 	client = i2c_new_dummy_device(adapter, address);
-	if (IS_ERR(client)) {
-		devres_free(dr);
-	} else {
-		dr->client = client;
-		devres_add(dev, dr);
-	}
+	if (IS_ERR(client))
+		return client;
+
+	ret = devm_add_action_or_reset(dev, devm_i2c_release_dummy, client);
+	if (ret)
+		return ERR_PTR(ret);

 	return client;
 }
--
2.8.1

