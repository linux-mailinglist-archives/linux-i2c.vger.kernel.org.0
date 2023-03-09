Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB376B1C97
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjCIHp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 02:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjCIHp5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:45:57 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C2FDCA70
        for <linux-i2c@vger.kernel.org>; Wed,  8 Mar 2023 23:45:50 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by laurent.telenet-ops.be with bizsmtp
        id W7ln2900G3mNwr4017lnNV; Thu, 09 Mar 2023 08:45:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1paAxd-00BJiF-3S;
        Thu, 09 Mar 2023 08:45:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1paAyB-00Fxln-Kt;
        Thu, 09 Mar 2023 08:45:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: dev: Fix bus callback return values
Date:   Thu,  9 Mar 2023 08:45:46 +0100
Message-Id: <03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2cdev_{at,de}tach_adapter() callbacks are used for two purposes:
  1. As notifier callbacks, when (un)registering I2C adapters created or
     destroyed after i2c_dev_init(),
  2. As bus iterator callbacks, for registering already existing
     adapters from i2c_dev_init(), and for cleanup.

Unfortunately both use cases expect different return values: the former
expects NOTIFY_* return codes, while the latter expects zero or error
codes, and aborts in case of error.

Hence in case 2, as soon as i2cdev_{at,de}tach_adapter() returns
(non-zero) NOTIFY_OK, the bus iterator aborts.  This causes (a) only the
first already existing adapter to be registered, leading to missing
/dev/i2c-* entries, and (b) a failure to unregister all but the first
I2C adapter during cleanup.

Fix this by introducing separate callbacks for the bus iterator,
wrapping the notifier functions, and always returning succes.
Any errors inside these callback functions are unlikely to happen, and
are fatal anyway.

Fixes: cddf70d0bce71c2a ("i2c: dev: fix notifier return values")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen on r8a7740/armadillo and r8a73a4/ape6evm, where the i2c-shmobile
adapters are probed before i2c_dev_init().
Not seen on r8a779g0/white-hawk, where all I2C adapters are probed after
i2c_dev_init().

 drivers/i2c/i2c-dev.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 107623c4cc14aaf9..95a0b63ac560cf33 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -646,7 +646,7 @@ static void i2cdev_dev_release(struct device *dev)
 	kfree(i2c_dev);
 }
 
-static int i2cdev_attach_adapter(struct device *dev, void *dummy)
+static int i2cdev_attach_adapter(struct device *dev)
 {
 	struct i2c_adapter *adap;
 	struct i2c_dev *i2c_dev;
@@ -685,7 +685,7 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 	return NOTIFY_DONE;
 }
 
-static int i2cdev_detach_adapter(struct device *dev, void *dummy)
+static int i2cdev_detach_adapter(struct device *dev)
 {
 	struct i2c_adapter *adap;
 	struct i2c_dev *i2c_dev;
@@ -711,9 +711,9 @@ static int i2cdev_notifier_call(struct notifier_block *nb, unsigned long action,
 
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
-		return i2cdev_attach_adapter(dev, NULL);
+		return i2cdev_attach_adapter(dev);
 	case BUS_NOTIFY_DEL_DEVICE:
-		return i2cdev_detach_adapter(dev, NULL);
+		return i2cdev_detach_adapter(dev);
 	}
 
 	return NOTIFY_DONE;
@@ -725,6 +725,18 @@ static struct notifier_block i2cdev_notifier = {
 
 /* ------------------------------------------------------------------------- */
 
+static int __init i2c_dev_attach_adapter(struct device *dev, void *dummy)
+{
+	i2cdev_attach_adapter(dev);
+	return 0;
+}
+
+static int __exit i2c_dev_detach_adapter(struct device *dev, void *dummy)
+{
+	i2cdev_detach_adapter(dev);
+	return 0;
+}
+
 /*
  * module load/unload record keeping
  */
@@ -752,7 +764,7 @@ static int __init i2c_dev_init(void)
 		goto out_unreg_class;
 
 	/* Bind to already existing adapters right away */
-	i2c_for_each_dev(NULL, i2cdev_attach_adapter);
+	i2c_for_each_dev(NULL, i2c_dev_attach_adapter);
 
 	return 0;
 
@@ -768,7 +780,7 @@ static int __init i2c_dev_init(void)
 static void __exit i2c_dev_exit(void)
 {
 	bus_unregister_notifier(&i2c_bus_type, &i2cdev_notifier);
-	i2c_for_each_dev(NULL, i2cdev_detach_adapter);
+	i2c_for_each_dev(NULL, i2c_dev_detach_adapter);
 	class_destroy(i2c_dev_class);
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }
-- 
2.34.1

