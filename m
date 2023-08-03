Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348C576E566
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 12:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbjHCKRd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 06:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbjHCKQ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 06:16:56 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19A9235A1;
        Thu,  3 Aug 2023 03:16:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,251,1684767600"; 
   d="scan'208";a="171794306"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2023 19:16:29 +0900
Received: from localhost.localdomain (unknown [10.226.93.128])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F9E2400F951;
        Thu,  3 Aug 2023 19:16:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 4/4] i2c: Extend i2c_device_get_match_data() to support i2c sysfs
Date:   Thu,  3 Aug 2023 11:16:11 +0100
Message-Id: <20230803101611.323342-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230803101611.323342-1-biju.das.jz@bp.renesas.com>
References: <20230803101611.323342-1-biju.das.jz@bp.renesas.com>
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

Extend i2c_device_get_match_data() to i2c sysfs interface for
retrieving match data from the match table.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * Separated non-static function change as separate patch#3
 * Replaced 'dev->driver'->'drv'.
 * Replaced return value data->NULL to avoid (potentially) stale pointers,
   if there is no match.
v4:
 * split from patch #2
 * Added space after of_device_id for i2c_of_match_device_sysfs()
 * Added const parameter for struct i2c_client, to prevent overriding it's
   pointer.
 * Moved declaration from public i2c.h->i2c-core.h
---
 drivers/i2c/i2c-core-base.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index e738cfba9c3b..d543460e47c2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -130,6 +130,7 @@ static const void *i2c_device_get_match_data(const struct device *dev)
 {
 	const struct device_driver *drv = dev->driver;
 	const struct i2c_client *client;
+	const void *data;
 
 	/*
 	 * It is not guaranteed that the function is always called on a device
@@ -144,7 +145,19 @@ static const void *i2c_device_get_match_data(const struct device *dev)
 	if (!client)
 		return NULL;
 
-	return i2c_get_match_data_helper(client);
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
 }
 
 const void *i2c_get_match_data(const struct i2c_client *client)
-- 
2.25.1

