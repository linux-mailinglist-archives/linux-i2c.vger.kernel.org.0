Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BEBB4D39
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 13:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfIQLtX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 07:49:23 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:34636 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIQLtX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 07:49:23 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAByx-000169-UB; Tue, 17 Sep 2019 12:49:20 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iAByx-0001sK-G7; Tue, 17 Sep 2019 12:49:19 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/2] i2c: core: use IS_ENABLED for CONFIG_I2C_COMPAT
Date:   Tue, 17 Sep 2019 12:49:17 +0100
Message-Id: <20190917114918.7157-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reduce the number of #ifdefs used in the i2c-core-base.c by using
IS_ENABLED(CONFIG_I2C_COMPAT) to try and ensure we compile as much
as possible.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i2c/i2c-core-base.c | 47 +++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c440fa6a3dd..fb8fd32f2783 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1186,9 +1186,7 @@ struct i2c_adapter *i2c_verify_adapter(struct device *dev)
 }
 EXPORT_SYMBOL(i2c_verify_adapter);
 
-#ifdef CONFIG_I2C_COMPAT
 static struct class_compat *i2c_adapter_compat_class;
-#endif
 
 static void i2c_scan_static_board_info(struct i2c_adapter *adapter)
 {
@@ -1358,13 +1356,14 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	pm_suspend_ignore_children(&adap->dev, true);
 	pm_runtime_enable(&adap->dev);
 
-#ifdef CONFIG_I2C_COMPAT
-	res = class_compat_create_link(i2c_adapter_compat_class, &adap->dev,
-				       adap->dev.parent);
-	if (res)
-		dev_warn(&adap->dev,
-			 "Failed to create compatibility class link\n");
-#endif
+	if (IS_ENABLED(CONFIG_I2C_COMPAT)) {
+		res = class_compat_create_link(i2c_adapter_compat_class,
+					       &adap->dev,
+					       adap->dev.parent);
+		if (res)
+			dev_warn(&adap->dev,
+				 "Failed to create compatibility class link\n");
+	}
 
 	i2c_init_recovery(adap);
 
@@ -1573,10 +1572,9 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	device_for_each_child(&adap->dev, NULL, __unregister_client);
 	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
 
-#ifdef CONFIG_I2C_COMPAT
-	class_compat_remove_link(i2c_adapter_compat_class, &adap->dev,
-				 adap->dev.parent);
-#endif
+	if (IS_ENABLED(CONFIG_I2C_COMPAT))
+		class_compat_remove_link(i2c_adapter_compat_class, &adap->dev,
+					 adap->dev.parent);
 
 	/* device name is gone after device_unregister */
 	dev_dbg(&adap->dev, "adapter [%s] unregistered\n", adap->name);
@@ -1818,13 +1816,14 @@ static int __init i2c_init(void)
 
 	is_registered = true;
 
-#ifdef CONFIG_I2C_COMPAT
-	i2c_adapter_compat_class = class_compat_register("i2c-adapter");
-	if (!i2c_adapter_compat_class) {
-		retval = -ENOMEM;
-		goto bus_err;
+	if (IS_ENABLED(CONFIG_I2C_COMPAT)) {
+		i2c_adapter_compat_class = class_compat_register("i2c-adapter");
+		if (!i2c_adapter_compat_class) {
+			retval = -ENOMEM;
+			goto bus_err;
+		}
 	}
-#endif
+
 	retval = i2c_add_driver(&dummy_driver);
 	if (retval)
 		goto class_err;
@@ -1837,10 +1836,9 @@ static int __init i2c_init(void)
 	return 0;
 
 class_err:
-#ifdef CONFIG_I2C_COMPAT
-	class_compat_unregister(i2c_adapter_compat_class);
+	if (IS_ENABLED(CONFIG_I2C_COMPAT))
+		class_compat_unregister(i2c_adapter_compat_class);
 bus_err:
-#endif
 	is_registered = false;
 	bus_unregister(&i2c_bus_type);
 	return retval;
@@ -1853,9 +1851,8 @@ static void __exit i2c_exit(void)
 	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
 		WARN_ON(of_reconfig_notifier_unregister(&i2c_of_notifier));
 	i2c_del_driver(&dummy_driver);
-#ifdef CONFIG_I2C_COMPAT
-	class_compat_unregister(i2c_adapter_compat_class);
-#endif
+	if (IS_ENABLED(CONFIG_I2C_COMPAT))
+		class_compat_unregister(i2c_adapter_compat_class);
 	bus_unregister(&i2c_bus_type);
 	tracepoint_synchronize_unregister();
 }
-- 
2.23.0

