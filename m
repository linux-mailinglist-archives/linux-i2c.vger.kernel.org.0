Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8569E71F07C
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 19:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbjFARRb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 13:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjFARRX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 13:17:23 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0BFCD1;
        Thu,  1 Jun 2023 10:17:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,210,1681138800"; 
   d="scan'208";a="165365583"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jun 2023 02:17:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A99954001DDC;
        Fri,  2 Jun 2023 02:17:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] i2c: Add i2c_get_match_data()
Date:   Thu,  1 Jun 2023 18:17:11 +0100
Message-Id: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_get_match_data() similar to of_device_get_match_data(),
so that we can optimize the driver code that uses both I2C and
DT-based matching.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped parameter const struct i2c_device_id *id and the helper function.

eg: The RTC pcf85063/isl1208 driver code can be optimized with this patch.
-       if (client->dev.of_node) {
+       if (client->dev.of_node)
                config = of_device_get_match_data(&client->dev);
-               if (!config)
-                       return -ENODEV;
-       } else {
-               enum pcf85063_type type =
-                       i2c_match_id(pcf85063_ids, client)->driver_data;
-               if (type >= PCF85063_LAST_ID)
-                       return -ENODEV;
-               config = &pcf85063_cfg[type];
-       }
+       else
+               config = i2c_get_match_data(client);
+
+       if (!config)
+               return -ENODEV;
---
 drivers/i2c/i2c-core-base.c | 14 ++++++++++++++
 include/linux/i2c.h         |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae3af738b03f..8576a1647785 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,6 +114,20 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
+	struct device_driver *drv = client->dev.driver;
+	struct i2c_driver *driver = to_i2c_driver(drv);
+	const struct i2c_device_id *match;
+
+	match = i2c_match_id(driver->id_table, client);
+	if (!match)
+		return NULL;
+
+	return (const void *)match->driver_data;
+}
+EXPORT_SYMBOL(i2c_get_match_data);
+
 static int i2c_device_match(struct device *dev, struct device_driver *drv)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 13a1ce38cb0c..3430cc2b05a6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -367,6 +367,8 @@ struct i2c_adapter *i2c_verify_adapter(struct device *dev);
 const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 					 const struct i2c_client *client);
 
+const void *i2c_get_match_data(const struct i2c_client *client);
+
 static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
 {
 	struct device * const dev = kobj_to_dev(kobj);
-- 
2.25.1

