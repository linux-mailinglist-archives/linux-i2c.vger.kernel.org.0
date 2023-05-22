Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF57070BA43
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 12:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbjEVKmG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 06:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjEVKmF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 06:42:05 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79C12B3;
        Mon, 22 May 2023 03:42:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="163781160"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2023 19:42:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4EC8F41E3CD3;
        Mon, 22 May 2023 19:42:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] i2c: Add i2c_get_match_data()
Date:   Mon, 22 May 2023 11:41:57 +0100
Message-Id: <20230522104157.333217-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i2c_get_match_data() similar to of_device_get_match_data(),
so that we can optimize the driver code that uses both I2C and
DT-based matching.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
eg:
The RTC 1208 driver code [1] can be optimized with [2], which is planned
to mainline once [3] is accepted.

[1]
if (client->dev.of_node) {
	isl1208->config = of_device_get_match_data(&client->dev);
	if (!isl1208->config)
		return -ENODEV;
} else {
	const struct i2c_device_id *id = i2c_match_id(isl1208_id, client);

	if (!id)
		return -ENODEV;
	isl1208->config = (struct isl1208_config *)id->driver_data;
}

[2]
if (client->dev.of_node)
	isl1208->config = of_device_get_match_data(&client->dev);
else
	isl1208->config = i2c_get_match_data(isl1208_id, client);

if (!isl1208->config)
	return -ENODEV;

[3]
https://lore.kernel.org/linux-renesas-soc/20230522101849.297499-1-biju.das.jz@bp.renesas.com/T/#t
---
 drivers/i2c/i2c-core-base.c | 24 ++++++++++++++++++++++--
 include/linux/i2c.h         |  3 +++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3442aa80290f..1ab639b2693c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -99,8 +99,8 @@ const char *i2c_freq_mode_string(u32 bus_freq_hz)
 }
 EXPORT_SYMBOL_GPL(i2c_freq_mode_string);
 
-const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
-						const struct i2c_client *client)
+static const struct i2c_device_id *i2c_match_device_id(const struct i2c_device_id *id,
+						       const struct i2c_client *client)
 {
 	if (!(id && client))
 		return NULL;
@@ -110,10 +110,30 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 			return id;
 		id++;
 	}
+
 	return NULL;
 }
+
+const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
+					 const struct i2c_client *client)
+{
+	return i2c_match_device_id(id, client);
+}
 EXPORT_SYMBOL_GPL(i2c_match_id);
 
+const void *i2c_get_match_data(const struct i2c_device_id *id,
+			       const struct i2c_client *client)
+{
+	const struct i2c_device_id *match;
+
+	match = i2c_match_device_id(id, client);
+	if (!match)
+		return NULL;
+
+	return (const void *)match->driver_data;
+}
+EXPORT_SYMBOL(i2c_get_match_data);
+
 static int i2c_device_match(struct device *dev, struct device_driver *drv)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0ce344724209..ddfe842b8f24 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -367,6 +367,9 @@ struct i2c_adapter *i2c_verify_adapter(struct device *dev);
 const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 					 const struct i2c_client *client);
 
+const void *i2c_get_match_data(const struct i2c_device_id *id,
+			       const struct i2c_client *client);
+
 static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
 {
 	struct device * const dev = kobj_to_dev(kobj);
-- 
2.25.1

