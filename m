Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFD876CBB5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 13:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbjHBLXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 07:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234219AbjHBLXk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 07:23:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 15D01268F;
        Wed,  2 Aug 2023 04:23:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,249,1684767600"; 
   d="scan'208";a="171671068"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2023 20:23:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.171])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3433C41B83E0;
        Wed,  2 Aug 2023 20:23:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/3] i2c: Add i2c_device_get_match_data() callback
Date:   Wed,  2 Aug 2023 12:23:16 +0100
Message-Id: <20230802112317.252745-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * Dropped struct i2c_driver parameter from i2c_get_match_data_helper()
 * Split I2C sysfs handling in seperate patch.
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
 drivers/i2c/i2c-core-base.c | 38 +++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..2436f23e63af 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,22 +114,39 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
-const void *i2c_get_match_data(const struct i2c_client *client)
+static const void *i2c_get_match_data_helper(const struct i2c_client *client)
 {
-	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
+	const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
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
+
+	if (!client || !dev->driver)
+		return NULL;
+
+	return i2c_get_match_data_helper(client);
+}
+
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
 	const void *data;
 
 	data = device_get_match_data(&client->dev);
-	if (!data) {
-		match = i2c_match_id(driver->id_table, client);
-		if (!match)
-			return NULL;
+	if (data)
+		return data;
 
-		data = (const void *)match->driver_data;
-	}
-
-	return data;
+	return i2c_get_match_data_helper(client);
 }
 EXPORT_SYMBOL(i2c_get_match_data);
 
@@ -695,6 +712,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.get_match_data	= i2c_device_get_match_data,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
-- 
2.25.1

