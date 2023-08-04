Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 346777705BF
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 18:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjHDQRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 12:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjHDQRu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 12:17:50 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B51EB2;
        Fri,  4 Aug 2023 09:17:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,255,1684767600"; 
   d="scan'208";a="175631504"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2023 01:17:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.35])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 71B5240116CC;
        Sat,  5 Aug 2023 01:17:45 +0900 (JST)
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
Subject: [PATCH v7 2/4] i2c: Enhance i2c_get_match_data()
Date:   Fri,  4 Aug 2023 17:17:26 +0100
Message-Id: <20230804161728.394920-3-biju.das.jz@bp.renesas.com>
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

Enhance i2c_get_match_data() for a faster path for device_get_match_data().

While at it, add const to struct i2c_driver to prevent overriding the
driver pointer.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v6->v7:
 * Updated commit description by removing unnecessary wrapping.
 * Moved the patch from #3 to #2.
 * Added Rb tag from Andy
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

