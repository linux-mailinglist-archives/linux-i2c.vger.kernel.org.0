Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDBD343F61
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 12:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhCVLNY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 07:13:24 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14056 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhCVLMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 07:12:50 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F3sGx6gTDzNq9X;
        Mon, 22 Mar 2021 19:10:17 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 19:12:38 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <andriy.shevchenko@linux.intel.com>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v3 1/3] i2c: core: add managed function for adding i2c adapters
Date:   Mon, 22 Mar 2021 19:10:11 +0800
Message-ID: <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C controller drivers will only unregister the I2C
adapter in their .remove() callback, which can be done
by simply using a managed variant to add the I2C adapter.

So add the managed functions for adding the I2C adapter.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/i2c-core-base.c | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  1 +
 2 files changed, 40 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf72..61486dc 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1550,6 +1550,38 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL(i2c_add_adapter);
 
+static void devm_i2c_del_adapter(struct device *dev, void *ptr);
+
+/**
+ * devm_i2c_add_adapter - device-managed variant of i2c_add_adapter()
+ * @dev: managing device for adding this I2C adapter
+ * @adapter: the adapter to add
+ * Context: can sleep
+ *
+ * Add adapter with dynamic bus number, same with i2c_add_adapter()
+ * but the adapter will be auto deleted on driver detach.
+ */
+int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
+{
+	struct i2c_adapter **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_i2c_del_adapter, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = i2c_add_adapter(adapter);
+	if (!ret) {
+		*ptr = adapter;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_i2c_add_adapter);
+
 /**
  * i2c_add_numbered_adapter - declare i2c adapter, use static bus number
  * @adap: the adapter to register (with adap->nr initialized)
@@ -1703,6 +1735,13 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 }
 EXPORT_SYMBOL(i2c_del_adapter);
 
+static void devm_i2c_del_adapter(struct device *dev, void *ptr)
+{
+	struct i2c_adapter *adapter = *((struct i2c_adapter **)ptr);
+
+	i2c_del_adapter(adapter);
+}
+
 static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
 			    u32 def_val, bool use_def)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5662265..10bd0b0 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -844,6 +844,7 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
  */
 #if IS_ENABLED(CONFIG_I2C)
 int i2c_add_adapter(struct i2c_adapter *adap);
+int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter);
 void i2c_del_adapter(struct i2c_adapter *adap);
 int i2c_add_numbered_adapter(struct i2c_adapter *adap);
 
-- 
2.8.1

