Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D275E08A
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jul 2023 10:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjGWIhj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 04:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjGWIhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 04:37:36 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A08D8E7D;
        Sun, 23 Jul 2023 01:37:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,226,1684767600"; 
   d="scan'208";a="174151268"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2023 17:37:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 74F3F4007214;
        Sun, 23 Jul 2023 17:37:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Date:   Sun, 23 Jul 2023 09:37:21 +0100
Message-Id: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_device_get_match_data() callback to struct bus_type().

While at it, introduced i2c_get_match_data_helper() to avoid code
duplication with i2c_get_match_data().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/i2c/i2c-core-base.c | 38 +++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..80259111355b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,20 +114,41 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
+static void *i2c_get_match_data_helper(struct i2c_driver *driver,
+				       const struct i2c_client *client)
+{
+	const struct i2c_device_id *match;
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
+	const struct i2c_client *client = to_i2c_client(dev);
+	const struct i2c_driver *driver;
+
+	if (!dev->driver)
+		return NULL;
+
+	driver = to_i2c_driver(dev->driver);
+	if (!driver)
+		return NULL;
+
+	return i2c_get_match_data_helper(driver, client);
+}
+
 const void *i2c_get_match_data(const struct i2c_client *client)
 {
 	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
-	const struct i2c_device_id *match;
 	const void *data;
 
 	data = device_get_match_data(&client->dev);
-	if (!data) {
-		match = i2c_match_id(driver->id_table, client);
-		if (!match)
-			return NULL;
-
-		data = (const void *)match->driver_data;
-	}
+	if (!data)
+		data = i2c_get_match_data_helper(driver, client);
 
 	return data;
 }
@@ -695,6 +716,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.get_match_data	= i2c_device_get_match_data,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
-- 
2.25.1

