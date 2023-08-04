Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16CDF76FAB9
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 09:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbjHDHJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 03:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbjHDHJf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 03:09:35 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CF2C110;
        Fri,  4 Aug 2023 00:09:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,254,1684767600"; 
   d="scan'208";a="171902679"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Aug 2023 16:09:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.35])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5CB2C419E24D;
        Fri,  4 Aug 2023 16:09:29 +0900 (JST)
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
Subject: [PATCH v6 2/4] i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-static
Date:   Fri,  4 Aug 2023 08:09:13 +0100
Message-Id: <20230804070915.117829-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
References: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently i2c_of_match_device_sysfs() is used by i2c_of_match_device().
Convert this to non-static function for finding match data for the I2C
sysfs interface using i2c_device_get_match_data() for code reuse.

While at it, fix the below issues:
 1) Replace 'of_device_id*'->'of_device_id *' in function definition.
 2) Fix the alignment in the function definition.
 3) Change the struct i2c_client parameter as const to avoid overriding
    the client pointer.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5->v6:
 * Added Rb tag from Andy.
 * Moved to patch#2
v5:
 * Split from patch #3
 * Removed export symbol
---
 drivers/i2c/i2c-core-of.c | 4 ++--
 drivers/i2c/i2c-core.h    | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..33832622f436 100644
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

