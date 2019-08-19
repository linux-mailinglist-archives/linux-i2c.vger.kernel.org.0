Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4EC992344
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 14:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfHSMQb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 08:16:31 -0400
Received: from enpas.org ([46.38.239.100]:37792 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726852AbfHSMQa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Aug 2019 08:16:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 71DAB100174;
        Mon, 19 Aug 2019 12:16:28 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH v5 2/3] hwmon/ltc2990: Generalise DT to fwnode support
Date:   Mon, 19 Aug 2019 14:16:17 +0200
Message-Id: <20190819121618.16557-2-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190819121618.16557-1-max@enpas.org>
References: <20190819121618.16557-1-max@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ltc2990 will now use device_property_read_u32_array() instead of
of_property_read_u32_array() - allowing the use of software nodes
via fwnode_create_software_node().

This allows code using i2c_new_device() to specify a default
measurement mode for the LTC2990 via fwnode_create_software_node().

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/hwmon/ltc2990.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index f9431ad43..53ff50517 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -13,7 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 
 #define LTC2990_STATUS	0x00
 #define LTC2990_CONTROL	0x01
@@ -206,7 +206,6 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
 	int ret;
 	struct device *hwmon_dev;
 	struct ltc2990_data *data;
-	struct device_node *of_node = i2c->dev.of_node;
 
 	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_WORD_DATA))
@@ -218,9 +217,10 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
 
 	data->i2c = i2c;
 
-	if (of_node) {
-		ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
-						 data->mode, 2);
+	if (dev_fwnode(&i2c->dev)) {
+		ret = device_property_read_u32_array(&i2c->dev,
+						     "lltc,meas-mode",
+						     data->mode, 2);
 		if (ret < 0)
 			return ret;
 
-- 
2.11.0

