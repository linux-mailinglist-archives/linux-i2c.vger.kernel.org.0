Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222F77705C8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 18:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjHDQSE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 12:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjHDQSB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 12:18:01 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 275F0B2;
        Fri,  4 Aug 2023 09:17:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,255,1684767600"; 
   d="scan'208";a="171950234"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2023 01:17:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.35])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DE4E040116CC;
        Sat,  5 Aug 2023 01:17:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-rtc@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 4/4] i2c: Add i2c_device_get_match_data() callback
Date:   Fri,  4 Aug 2023 17:17:28 +0100
Message-Id: <20230804161728.394920-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_device_get_match_data() callback to struct bus_type.

While at it, introduced i2c_get_match_data_helper() to avoid code
duplication with i2c_get_match_data().

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v6->v7:
 * Updated typo in commit description struct bus_type()->struct bus_type.
 * Added Rb tag from Andy.
v5->v6:
 * Merged with patch#3 from v5.
 * Separate patch#3 to prepare for better difference for
   i2c_match_id() changes.
v4->v5:
 * Added const struct device_driver variable 'drv' in i2c_device_get_match
   _data().
 * For code readability and maintenance perspective, added separate NULL
   check for drv and client variable and added comment for NULL check for
   drv variable.
v3->v4:
 * Dropped struct i2c_driver parameter from i2c_get_match_data_helper()
 * Split I2C sysfs handling in separate patch.
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
 drivers/i2c/i2c-core-base.c | 53 ++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7005dfe64066..d543460e47c2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,15 +114,10 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
-const void *i2c_get_match_data(const struct i2c_client *client)
+static const void *i2c_get_match_data_helper(const struct i2c_client *client)
 {
 	const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
 	const struct i2c_device_id *match;
-	const void *data;
-
-	data = device_get_match_data(&client->dev);
-	if (data)
-		return data;
 
 	match = i2c_match_id(driver->id_table, client);
 	if (!match)
@@ -130,6 +125,51 @@ const void *i2c_get_match_data(const struct i2c_client *client)
 
 	return (const void *)match->driver_data;
 }
+
+static const void *i2c_device_get_match_data(const struct device *dev)
+{
+	const struct device_driver *drv = dev->driver;
+	const struct i2c_client *client;
+	const void *data;
+
+	/*
+	 * It is not guaranteed that the function is always called on a device
+	 * bound to a driver (even though we normally expect this to be the
+	 * case).
+	 */
+	if (!drv)
+		return NULL;
+
+	/* TODO: use i2c_verify_client() when it accepts const pointer */
+	client = (dev->type == &i2c_client_type) ? to_i2c_client(dev) : NULL;
+	if (!client)
+		return NULL;
+
+	data = i2c_get_match_data_helper(client);
+	if (data)
+		return data;
+
+	if (drv->of_match_table) {
+		const struct of_device_id *match;
+
+		match = i2c_of_match_device_sysfs(drv->of_match_table, client);
+		if (match)
+			return match->data;
+	}
+
+	return NULL;
+}
+
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
+	const void *data;
+
+	data = device_get_match_data(&client->dev);
+	if (data)
+		return data;
+
+	return i2c_get_match_data_helper(client);
+}
 EXPORT_SYMBOL(i2c_get_match_data);
 
 static int i2c_device_match(struct device *dev, struct device_driver *drv)
@@ -694,6 +734,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.get_match_data	= i2c_device_get_match_data,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
-- 
2.25.1

