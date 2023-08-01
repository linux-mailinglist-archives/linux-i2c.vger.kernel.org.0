Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9D376BAAD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 19:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbjHAREY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 13:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbjHARD5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 13:03:57 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 66F5330F2;
        Tue,  1 Aug 2023 10:03:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,247,1684767600"; 
   d="scan'208";a="171566346"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2023 02:03:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.54])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26762402842A;
        Wed,  2 Aug 2023 02:03:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Date:   Tue,  1 Aug 2023 18:03:18 +0100
Message-Id: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_device_get_match_data() callback to struct bus_type().

While at it, introduced i2c_get_match_data_helper() to avoid code
duplication with i2c_get_match_data().

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Extended to support i2c_of_match_device() as suggested by Andy.
 * Changed i2c_of_match_device_sysfs() as non-static function as it is
   needed for i2c_device_get_match_data().
 * Added a TODO comment to use i2c_verify_client() when it accepts const
   pointer.
 * Added multiple returns to make code path for device_get_match_data()
   faster in i2c_get_match_data().
RFC v1->v2:
 * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
 * Fixed build warnings reported by kernel test robot <lkp@intel.com>
 * Added const qualifier to return type and parameter struct i2c_driver
   in i2c_get_match_data_helper().
 * Added const qualifier to struct i2c_driver in i2c_get_match_data()
 * Dropped driver variable from i2c_device_get_match_data()
 * Replaced to_i2c_client with logic for assigning verify_client as it
   returns non const pointer.
---
 drivers/i2c/i2c-core-base.c | 49 +++++++++++++++++++++++++++++++------
 drivers/i2c/i2c-core-of.c   |  3 ++-
 include/linux/i2c.h         | 11 +++++++++
 3 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..7db881a923b6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,23 +114,55 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
-const void *i2c_get_match_data(const struct i2c_client *client)
+static const void *i2c_get_match_data_helper(const struct i2c_driver *driver,
+					     const struct i2c_client *client)
 {
-	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
 	const struct i2c_device_id *match;
+
+	match = i2c_match_id(driver->id_table, client);
+	if (!match)
+		return NULL;
+
+	return (const void *)match->driver_data;
+}
+
+static const void *i2c_device_get_match_data(const struct device *dev)
+{
+	/* TODO: use i2c_verify_client() when it accepts const pointer */
+	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
+					  to_i2c_client(dev) : NULL;
 	const void *data;
 
-	data = device_get_match_data(&client->dev);
-	if (!data) {
-		match = i2c_match_id(driver->id_table, client);
-		if (!match)
-			return NULL;
+	if (!dev->driver)
+		return NULL;
+
+	data = i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
+	if (data)
+		return data;
 
-		data = (const void *)match->driver_data;
+	if (dev->driver->of_match_table) {
+		const struct of_device_id *match;
+
+		match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
+						  (struct i2c_client *)client);
+		if (match)
+			data = match->data;
 	}
 
 	return data;
 }
+
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
+	const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
+	const void *data;
+
+	data = device_get_match_data(&client->dev);
+	if (data)
+		return data;
+
+	return i2c_get_match_data_helper(driver, client);
+}
 EXPORT_SYMBOL(i2c_get_match_data);
 
 static int i2c_device_match(struct device *dev, struct device_driver *drv)
@@ -695,6 +727,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.get_match_data	= i2c_device_get_match_data,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..514bf8cddb81 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -113,7 +113,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static const struct of_device_id*
+const struct of_device_id*
 i2c_of_match_device_sysfs(const struct of_device_id *matches,
 				  struct i2c_client *client)
 {
@@ -141,6 +141,7 @@ i2c_of_match_device_sysfs(const struct of_device_id *matches,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(i2c_of_match_device_sysfs);
 
 const struct of_device_id
 *i2c_of_match_device(const struct of_device_id *matches,
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3430cc2b05a6..597aa0f1ed0b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -999,6 +999,10 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
 	return i2c_get_adapter_by_fwnode(of_fwnode_handle(node));
 }
 
+const struct of_device_id*
+i2c_of_match_device_sysfs(const struct of_device_id *matches,
+			  struct i2c_client *client);
+
 const struct of_device_id
 *i2c_of_match_device(const struct of_device_id *matches,
 		     struct i2c_client *client);
@@ -1030,6 +1034,13 @@ static inline const struct of_device_id
 	return NULL;
 }
 
+static inline const struct of_device_id
+*i2c_of_match_device(const struct of_device_id *matches,
+		     struct i2c_client *client)
+{
+	return NULL;
+}
+
 static inline int of_i2c_get_board_info(struct device *dev,
 					struct device_node *node,
 					struct i2c_board_info *info)
-- 
2.25.1

