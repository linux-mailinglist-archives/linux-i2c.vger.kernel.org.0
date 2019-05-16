Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2CAC20FE9
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 23:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfEPVNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 17:13:23 -0400
Received: from sauhun.de ([88.99.104.3]:45614 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728256AbfEPVNW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 17:13:22 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id B37552C04ED;
        Thu, 16 May 2019 23:13:19 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 2/3] i2c: core: add device-managed version of i2c_new_dummy
Date:   Thu, 16 May 2019 23:13:09 +0200
Message-Id: <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
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

i2c_new_dummy is typically called from the probe function of the
driver for the primary i2c client. It requires calls to
i2c_unregister_device in the error path of the probe function and
in the remove function.
This can be simplified by introducing a device-managed version.

Note the changed error case return value type: i2c_new_dummy returns
NULL whilst devm_i2c_new_dummy_device returns an ERR_PTR.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
[wsa: rename new functions and fix minor kdoc issues]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/driver-model/devres.txt |  3 ++
 drivers/i2c/i2c-core-base.c           | 44 +++++++++++++++++++++++++++
 include/linux/i2c.h                   |  3 ++
 3 files changed, 50 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 99994a461359..69c7fa7f616c 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -271,6 +271,9 @@ GPIO
   devm_gpio_request_one()
   devm_gpio_free()
 
+I2C
+  devm_i2c_new_dummy_device()
+
 IIO
   devm_iio_device_alloc()
   devm_iio_device_free()
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c38dde73366..d389d4fb0623 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -929,6 +929,50 @@ struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
 }
 EXPORT_SYMBOL_GPL(i2c_new_dummy);
 
+struct i2c_dummy_devres {
+	struct i2c_client *client;
+};
+
+static void devm_i2c_release_dummy(struct device *dev, void *res)
+{
+	struct i2c_dummy_devres *this = res;
+
+	i2c_unregister_device(this->client);
+}
+
+/**
+ * devm_i2c_new_dummy_device - return a new i2c device bound to a dummy driver
+ * @dev: device the managed resource is bound to
+ * @adapter: the adapter managing the device
+ * @address: seven bit address to be used
+ * Context: can sleep
+ *
+ * This is the device-managed version of @i2c_new_dummy_device. It returns the
+ * new i2c client or an ERR_PTR in case of an error.
+ */
+struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
+					     struct i2c_adapter *adapter,
+					     u16 address)
+{
+	struct i2c_dummy_devres *dr;
+	struct i2c_client *client;
+
+	dr = devres_alloc(devm_i2c_release_dummy, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	client = i2c_new_dummy_device(adapter, address);
+	if (IS_ERR(client)) {
+		devres_free(dr);
+	} else {
+		dr->client = client;
+		devres_add(dev, dr);
+	}
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
+
 /**
  * i2c_new_secondary_device - Helper to get the instantiated secondary address
  * and create the associated device
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index be27062f8ed1..6c4db54714f6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -469,6 +469,9 @@ extern int i2c_probe_func_quick_read(struct i2c_adapter *, unsigned short addr);
 extern struct i2c_client *
 i2c_new_dummy(struct i2c_adapter *adap, u16 address);
 
+extern struct i2c_client *
+devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
+
 extern struct i2c_client *
 i2c_new_secondary_device(struct i2c_client *client,
 				const char *name,
-- 
2.19.1

