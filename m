Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5514790901
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 19:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjIBRp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 13:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjIBRp6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 13:45:58 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE39DB6;
        Sat,  2 Sep 2023 10:45:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,222,1688396400"; 
   d="scan'208";a="178508459"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Sep 2023 02:45:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 41243403C476;
        Sun,  3 Sep 2023 02:45:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] eeprom: at24: Drop at24_get_chip_data()
Date:   Sat,  2 Sep 2023 18:45:47 +0100
Message-Id: <20230902174547.71316-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace at24_get_chip_data()->i2c_get_match_data() as it is
redundant.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/misc/eeprom/at24.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index dbbf7db4ff2f..af83aca452b7 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -509,32 +509,6 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	return 0;
 }
 
-static const struct at24_chip_data *at24_get_chip_data(struct device *dev)
-{
-	struct device_node *of_node = dev->of_node;
-	const struct at24_chip_data *cdata;
-	const struct i2c_device_id *id;
-
-	id = i2c_match_id(at24_ids, to_i2c_client(dev));
-
-	/*
-	 * The I2C core allows OF nodes compatibles to match against the
-	 * I2C device ID table as a fallback, so check not only if an OF
-	 * node is present but also if it matches an OF device ID entry.
-	 */
-	if (of_node && of_match_device(at24_of_match, dev))
-		cdata = of_device_get_match_data(dev);
-	else if (id)
-		cdata = (void *)id->driver_data;
-	else
-		cdata = acpi_device_get_match_data(dev);
-
-	if (!cdata)
-		return ERR_PTR(-ENODEV);
-
-	return cdata;
-}
-
 static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 				  struct i2c_client *base_client,
 				  struct regmap_config *regmap_config)
@@ -601,9 +575,9 @@ static int at24_probe(struct i2c_client *client)
 	i2c_fn_block = i2c_check_functionality(client->adapter,
 					       I2C_FUNC_SMBUS_WRITE_I2C_BLOCK);
 
-	cdata = at24_get_chip_data(dev);
-	if (IS_ERR(cdata))
-		return PTR_ERR(cdata);
+	cdata = i2c_get_match_data(client);
+	if (!cdata)
+		return -ENODEV;
 
 	err = device_property_read_u32(dev, "pagesize", &page_size);
 	if (err)
-- 
2.25.1

