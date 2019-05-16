Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5220FEA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 23:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfEPVNW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 17:13:22 -0400
Received: from sauhun.de ([88.99.104.3]:45602 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728114AbfEPVNW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 17:13:22 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id 56B282C04D5;
        Thu, 16 May 2019 23:13:19 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 1/3] i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy
Date:   Thu, 16 May 2019 23:13:08 +0200
Message-Id: <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

Currently i2c_new_device and i2c_new_dummy return just NULL in error
case although they have more error details internally. Therefore move
the functionality into new functions returning detailed errors and
add wrappers for compatibility with the current API.

This allows to use these functions with detailed error codes within
the i2c core or for API extensions.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
[wsa: rename new functions and fix minor kdoc issues]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 74 ++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9732a81bb7dd..9c38dde73366 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -714,7 +714,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
 }
 
 /**
- * i2c_new_device - instantiate an i2c device
+ * i2c_new_client_device - instantiate an i2c device
  * @adap: the adapter managing the device
  * @info: describes one I2C device; bus_num is ignored
  * Context: can sleep
@@ -727,17 +727,17 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
  * before any i2c_adapter could exist.
  *
  * This returns the new i2c client, which may be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
+ * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-struct i2c_client *
-i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
+static struct i2c_client *
+i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
 	struct i2c_client	*client;
 	int			status;
 
 	client = kzalloc(sizeof *client, GFP_KERNEL);
 	if (!client)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	client->adapter = adap;
 
@@ -803,7 +803,31 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 		client->name, client->addr, status);
 out_err_silent:
 	kfree(client);
-	return NULL;
+	return ERR_PTR(status);
+}
+EXPORT_SYMBOL_GPL(i2c_new_client_device);
+
+/**
+ * i2c_new_device - instantiate an i2c device
+ * @adap: the adapter managing the device
+ * @info: describes one I2C device; bus_num is ignored
+ * Context: can sleep
+ *
+ * This deprecated function has the same functionality as
+ * @i2c_new_client_device, it just returns NULL instead of an ERR_PTR in case of
+ * an error for compatibility with current I2C API. It will be removed once all
+ * users are converted.
+ *
+ * This returns the new i2c client, which may be saved for later use with
+ * i2c_unregister_device(); or NULL to indicate an error.
+ */
+struct i2c_client *
+i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
+{
+	struct i2c_client *ret;
+
+	ret = i2c_new_client_device(adap, info);
+	return IS_ERR(ret) ? NULL : ret;
 }
 EXPORT_SYMBOL_GPL(i2c_new_device);
 
@@ -854,7 +878,7 @@ static struct i2c_driver dummy_driver = {
 };
 
 /**
- * i2c_new_dummy - return a new i2c device bound to a dummy driver
+ * i2c_new_dummy_device - return a new i2c device bound to a dummy driver
  * @adapter: the adapter managing the device
  * @address: seven bit address to be used
  * Context: can sleep
@@ -869,15 +893,39 @@ static struct i2c_driver dummy_driver = {
  * different driver.
  *
  * This returns the new i2c client, which should be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
+ * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
+static struct i2c_client *
+i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
 {
 	struct i2c_board_info info = {
 		I2C_BOARD_INFO("dummy", address),
 	};
 
-	return i2c_new_device(adapter, &info);
+	return i2c_new_client_device(adapter, &info);
+}
+EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
+
+/**
+ * i2c_new_dummy - return a new i2c device bound to a dummy driver
+ * @adapter: the adapter managing the device
+ * @address: seven bit address to be used
+ * Context: can sleep
+ *
+ * This deprecated function has the same functionality as @i2c_new_dummy_device,
+ * it just returns NULL instead of an ERR_PTR in case of an error for
+ * compatibility with current I2C API. It will be removed once all users are
+ * converted.
+ *
+ * This returns the new i2c client, which should be saved for later use with
+ * i2c_unregister_device(); or NULL to indicate an error.
+ */
+struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
+{
+	struct i2c_client *ret;
+
+	ret = i2c_new_dummy_device(adapter, address);
+	return IS_ERR(ret) ? NULL : ret;
 }
 EXPORT_SYMBOL_GPL(i2c_new_dummy);
 
@@ -1000,9 +1048,9 @@ i2c_sysfs_new_device(struct device *dev, struct device_attribute *attr,
 		info.flags |= I2C_CLIENT_SLAVE;
 	}
 
-	client = i2c_new_device(adap, &info);
-	if (!client)
-		return -EINVAL;
+	client = i2c_new_client_device(adap, &info);
+	if (IS_ERR(client))
+		return PTR_ERR(client);
 
 	/* Keep track of the added device */
 	mutex_lock(&adap->userspace_clients_lock);
-- 
2.19.1

