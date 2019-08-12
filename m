Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79598AB7A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 01:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfHLXxJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 19:53:09 -0400
Received: from enpas.org ([46.38.239.100]:55736 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726600AbfHLXxI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 19:53:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 51EB01006F0;
        Mon, 12 Aug 2019 23:53:06 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH v2 3/4] hwmon/ltc2990: Add platform_data support
Date:   Tue, 13 Aug 2019 01:52:36 +0200
Message-Id: <20190812235237.21797-3-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812235237.21797-1-max@enpas.org>
References: <20190812235237.21797-1-max@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows code using i2c_new_device() to specify a measurement mode.

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/hwmon/ltc2990.c               |  9 +++++++++
 include/linux/platform_data/ltc2990.h | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/linux/platform_data/ltc2990.h

diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index f9431ad43..f19b9c50c 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/ltc2990.h>
 
 #define LTC2990_STATUS	0x00
 #define LTC2990_CONTROL	0x01
@@ -206,6 +207,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
 	int ret;
 	struct device *hwmon_dev;
 	struct ltc2990_data *data;
+	struct ltc2990_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct device_node *of_node = i2c->dev.of_node;
 
 	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
@@ -227,6 +229,13 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
 		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
 		    data->mode[1] & ~LTC2990_MODE1_MASK)
 			return -EINVAL;
+	} else if (pdata) {
+		data->mode[0] = pdata->meas_mode[0];
+		data->mode[1] = pdata->meas_mode[1];
+
+		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
+		    data->mode[1] & ~LTC2990_MODE1_MASK)
+			return -EINVAL;
 	} else {
 		ret = i2c_smbus_read_byte_data(i2c, LTC2990_CONTROL);
 		if (ret < 0)
diff --git a/include/linux/platform_data/ltc2990.h b/include/linux/platform_data/ltc2990.h
new file mode 100644
index 000000000..7ec89e784
--- /dev/null
+++ b/include/linux/platform_data/ltc2990.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LTC2990_PDATA_H
+#define LTC2990_PDATA_H
+
+#include <linux/types.h>
+
+struct ltc2990_platform_data {
+	u8 meas_mode[2];
+};
+
+#endif /* LTC2990_PDATA_H */
-- 
2.11.0

