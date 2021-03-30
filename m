Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219B534EA41
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 16:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhC3OWc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 10:22:32 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14643 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbhC3OWJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 10:22:09 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8s5T63qgznWLY;
        Tue, 30 Mar 2021 22:19:25 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 22:21:55 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v5 1/5] i2c: core: add managed function for adding i2c adapters
Date:   Tue, 30 Mar 2021 22:19:22 +0800
Message-ID: <1617113966-40498-2-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/i2c-core-base.c | 26 ++++++++++++++++++++++++++
 include/linux/i2c.h         |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf72..de9402c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1703,6 +1703,32 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 }
 EXPORT_SYMBOL(i2c_del_adapter);
 
+static void devm_i2c_del_adapter(void *adapter)
+{
+	i2c_del_adapter(adapter);
+}
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
+	int ret;
+
+	ret = i2c_add_adapter(adapter);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_i2c_del_adapter, adapter);
+}
+EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
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

