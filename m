Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1151476CBB7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 13:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbjHBLXv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 07:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbjHBLXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 07:23:41 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D20E426A3;
        Wed,  2 Aug 2023 04:23:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,249,1684767600"; 
   d="scan'208";a="171671075"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2023 20:23:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.171])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0798F41B83E0;
        Wed,  2 Aug 2023 20:23:30 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to support i2c sysfs
Date:   Wed,  2 Aug 2023 12:23:17 +0100
Message-Id: <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
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

Extend i2c_device_get_match_data() to i2c sysfs interface by changing
i2c_of_match_device_sysfs() to non-static and call this function as a
fallback for i2c_get_match_data_helper().

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * split from patch #2
 * Added space after of_device_id for i2c_of_match_device_sysfs()
 * Added const parameter for struct i2c_client, to prevent overriding it's
   pointer.
 * Moved declaration from public i2c.h->i2c-core.h
---
 drivers/i2c/i2c-core-base.c | 16 +++++++++++++++-
 drivers/i2c/i2c-core-of.c   |  5 +++--
 drivers/i2c/i2c-core.h      |  9 +++++++++
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2436f23e63af..d002c5a1cc84 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -131,11 +131,25 @@ static const void *i2c_device_get_match_data(const struct device *dev)
 	/* TODO: use i2c_verify_client() when it accepts const pointer */
 	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
 					  to_i2c_client(dev) : NULL;
+	const void *data;
 
 	if (!client || !dev->driver)
 		return NULL;
 
-	return i2c_get_match_data_helper(client);
+	data = i2c_get_match_data_helper(client);
+	if (data)
+		return data;
+
+	if (dev->driver->of_match_table) {
+		const struct of_device_id *match;
+
+		match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
+						  client);
+		if (match)
+			return match->data;
+	}
+
+	return data;
 }
 
 const void *i2c_get_match_data(const struct i2c_client *client)
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..179b3486904a 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -113,9 +113,9 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static const struct of_device_id*
+const struct of_device_id *
 i2c_of_match_device_sysfs(const struct of_device_id *matches,
-				  struct i2c_client *client)
+			  const struct i2c_client *client)
 {
 	const char *name;
 
@@ -141,6 +141,7 @@ i2c_of_match_device_sysfs(const struct of_device_id *matches,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(i2c_of_match_device_sysfs);
 
 const struct of_device_id
 *i2c_of_match_device(const struct of_device_id *matches,
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 1247e6e6e975..e4d397b67989 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -82,8 +82,17 @@ static inline void i2c_acpi_remove_space_handler(struct i2c_adapter *adapter) {
 
 #ifdef CONFIG_OF
 void of_i2c_register_devices(struct i2c_adapter *adap);
+const struct of_device_id *
+i2c_of_match_device_sysfs(const struct of_device_id *matches,
+			  const struct i2c_client *client);
 #else
 static inline void of_i2c_register_devices(struct i2c_adapter *adap) { }
+static inline const struct of_device_id *
+i2c_of_match_device_sysfs(const struct of_device_id *matches,
+			  const struct i2c_client *client)
+{
+	return NULL;
+}
 #endif
 extern struct notifier_block i2c_of_notifier;
 
-- 
2.25.1

