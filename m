Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EFE7243A2
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 15:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbjFFNFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 09:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237962AbjFFNF1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 09:05:27 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 52FF1E7C;
        Tue,  6 Jun 2023 06:05:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,221,1681138800"; 
   d="scan'208";a="162417460"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jun 2023 22:05:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E26EB41F04A3;
        Tue,  6 Jun 2023 22:05:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] i2c: Add i2c_get_match_data()
Date:   Tue,  6 Jun 2023 14:05:19 +0100
Message-Id: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_get_match_data() to get match data for both I2C and
DT-based matching, so that we can optimize the driver code that
uses both.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added support for getting match data for both I2C and DT-based
   matching.
 * Added Rb tag from Geert and retained the Rb tag as change is trivial.
v1->v2:
 * Dropped parameter const struct i2c_device_id *id and the helper function.

eg: The RTC pcf85063/isl1208 driver code can be optimized with this patch.
-       if (client->dev.of_node) {
-                config = of_device_get_match_data(&client->dev);
-               if (!config)
-                       return -ENODEV;
-       } else {
-               enum pcf85063_type type =
-                       i2c_match_id(pcf85063_ids, client)->driver_data;
-               if (type >= PCF85063_LAST_ID)
-                       return -ENODEV;
-               config = &pcf85063_cfg[type];
-       }
+       config = i2c_get_match_data(client);
+       if (!config)
+               return -ENODEV;
---
 drivers/i2c/i2c-core-base.c | 21 +++++++++++++++++++++
 include/linux/i2c.h         |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae3af738b03f..15a49f4ba668 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,6 +114,27 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
+	struct device_driver *drv = client->dev.driver;
+	struct i2c_driver *driver = to_i2c_driver(drv);
+	const struct i2c_device_id *match;
+	const void *data;
+
+	if (client->dev.of_node) {
+		data = of_device_get_match_data(&client->dev);
+	} else {
+		match = i2c_match_id(driver->id_table, client);
+		if (!match)
+			return NULL;
+
+		data = (const void *)match->driver_data;
+	}
+
+	return data;
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

