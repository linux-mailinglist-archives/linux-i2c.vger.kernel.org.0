Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D4476FABC
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 09:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbjHDHJm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 03:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbjHDHJl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 03:09:41 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9C3B110;
        Fri,  4 Aug 2023 00:09:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,254,1684767600"; 
   d="scan'208";a="175584226"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Aug 2023 16:09:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.35])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9B117419E612;
        Fri,  4 Aug 2023 16:09:33 +0900 (JST)
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
Subject: [PATCH v6 3/4] i2c: Enhance i2c_get_match_data()
Date:   Fri,  4 Aug 2023 08:09:14 +0100
Message-Id: <20230804070915.117829-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
References: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
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

Enhance i2c_get_match_data() for a faster path for device_get_
match_data().

While at it, add const to struct i2c_driver to prevent overriding
the driver pointer.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Separate patch to prepare for better difference for
   i2c_match_id() changes.
---
 drivers/i2c/i2c-core-base.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..7005dfe64066 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -116,20 +116,19 @@ EXPORT_SYMBOL_GPL(i2c_match_id);
 
 const void *i2c_get_match_data(const struct i2c_client *client)
 {
-	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
+	const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
 	const struct i2c_device_id *match;
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
+	match = i2c_match_id(driver->id_table, client);
+	if (!match)
+		return NULL;
 
-	return data;
+	return (const void *)match->driver_data;
 }
 EXPORT_SYMBOL(i2c_get_match_data);
 
-- 
2.25.1

