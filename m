Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E44E114A36
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2019 01:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfLFAXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Dec 2019 19:23:46 -0500
Received: from sauhun.de ([88.99.104.3]:35496 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfLFAXq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Dec 2019 19:23:46 -0500
Received: from localhost (p54B33754.dip0.t-ipconnect.de [84.179.55.84])
        by pokefinder.org (Postfix) with ESMTPSA id D98032C0484;
        Fri,  6 Dec 2019 01:23:42 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: remove i2c_new_dummy() API
Date:   Fri,  6 Dec 2019 01:23:22 +0100
Message-Id: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All in-kernel users have been converted to
{devm_}i2c_new_dummy_device(). Remove the old API.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 23 -----------------------
 include/linux/i2c.h         |  6 ------
 2 files changed, 29 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9333c865d4a9..9f8dcd3f8385 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -896,29 +896,6 @@ struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address
 }
 EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
 
-/**
- * i2c_new_dummy - return a new i2c device bound to a dummy driver
- * @adapter: the adapter managing the device
- * @address: seven bit address to be used
- * Context: can sleep
- *
- * This deprecated function has the same functionality as @i2c_new_dummy_device,
- * it just returns NULL instead of an ERR_PTR in case of an error for
- * compatibility with current I2C API. It will be removed once all users are
- * converted.
- *
- * This returns the new i2c client, which should be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
- */
-struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
-{
-	struct i2c_client *ret;
-
-	ret = i2c_new_dummy_device(adapter, address);
-	return IS_ERR(ret) ? NULL : ret;
-}
-EXPORT_SYMBOL_GPL(i2c_new_dummy);
-
 struct i2c_dummy_devres {
 	struct i2c_client *client;
 };
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index d2f786706657..d1baf8d57536 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -466,12 +466,6 @@ i2c_new_probed_device(struct i2c_adapter *adap,
 /* Common custom probe functions */
 extern int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr);
 
-/* For devices that use several addresses, use i2c_new_dummy() to make
- * client handles for the extra addresses.
- */
-extern struct i2c_client *
-i2c_new_dummy(struct i2c_adapter *adap, u16 address);
-
 extern struct i2c_client *
 i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address);
 
-- 
2.20.1

