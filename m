Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B332726696
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 18:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbjFGQ5r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 12:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjFGQ5q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 12:57:46 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C65D71BF8;
        Wed,  7 Jun 2023 09:57:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,224,1681138800"; 
   d="scan'208";a="166132834"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jun 2023 01:57:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 88D264020F1B;
        Thu,  8 Jun 2023 01:57:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4] i2c: Add i2c_get_match_data()
Date:   Wed,  7 Jun 2023 17:57:38 +0100
Message-Id: <20230607165738.138357-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_get_match_data() to get match data for I2C, ACPI and
DT-based matching, so that we can optimize the driver code.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added support for ACPI matching as well by replacing of_device_
   get_match_data->device_get_match_data.
 * Removed Rb tag from Geert as there is change in logic.
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

similar case exists for adding I2C match support for the below clock drivers
along with already supported OF/ACPI based matching.

https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-renesas-pcie.c#L282
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-versaclock5.c#L956
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-versaclock7.c#L1111
---
 drivers/i2c/i2c-core-base.c | 20 ++++++++++++++++++++
 include/linux/i2c.h         |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae3af738b03f..040544b2ced4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,6 +114,26 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
+	struct device_driver *drv = client->dev.driver;
+	struct i2c_driver *driver = to_i2c_driver(drv);
+	const struct i2c_device_id *match;
+	const void *data;
+
+	data = device_get_match_data(&client->dev);
+	if (!data) {
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

