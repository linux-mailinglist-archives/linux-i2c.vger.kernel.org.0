Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D18D43C2
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2019 17:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfJKPGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Oct 2019 11:06:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44952 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfJKPGo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Oct 2019 11:06:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id e10so1966872pgd.11
        for <linux-i2c@vger.kernel.org>; Fri, 11 Oct 2019 08:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mpPXRoyWFirserBf9zuCtJ6I9zov2+iUK/5Zc6bW6HQ=;
        b=bbG+aeE/JEj48LqkgaCbvnmLt5ChIh1XcShk9vseG6bMWEMaLzMbEAtyMdDg2+e0Ej
         NB2hBvatnR63dxk/eFsUW9FKEDEXmN6wnXpc9A3si1gN95kP9dd2+CT+qzQJWY5KFZ8q
         4jJP0X4zd2fSsFnp6tMdGXlEB8+Ix+fXXaCqMHkFeRBHWp/pGb/7PVKkdzfz9tJpb9mh
         S2iNy4vxY93dQQ1bdFJEYcuA2SBra9TZ26v9cS+osX8/tbZptRGDtzfeqATkV+h+hP/S
         ntLHt/8HKean+jcSjm2ipQ3JmaV26Icv/TNcB96GrywQsq4gHLxHpCVNC1244UkJQbHg
         /Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mpPXRoyWFirserBf9zuCtJ6I9zov2+iUK/5Zc6bW6HQ=;
        b=TPldIwccDuo61t/qxK4Z3xCXB/VevraAgkgpxttDAoU3GHEvAz9i9Gz7D8S7fg8BOe
         Hhq9gyjUffrdAJBlyY0s0l4Jgvj6lf8lWO+zo3hm06FP+JChY/zydsz+onTUjMcetfJf
         r1vHiSPpkH2q1+W+qcsv8cZ4mmTBhbo5lGT2fDCIax0frGX9EQYu9ug2uRi01ccdVK8o
         5ml9GEwMr2e1pJdWEVCaM/eszhxt4gZKI6TT6fCXesk8a+sj8yU8dCMKKVWWe+NnSlyt
         1gKVlURwbxvinVEbu19i/GAxJSq79vBsf4Bm29G1iHt9w8cGN98jMansXbcyPpofoCJJ
         paFg==
X-Gm-Message-State: APjAAAXF/0MYDqd8Jv2z6RVmimDgdMiXMw3/0/f9upWE3zQbhrWyaKGz
        igWvRZNSmYYBGfj9vrHYAyMp7+5vx40=
X-Google-Smtp-Source: APXvYqztblkwLQKLSg104FVFFpzHVvaGOFBQnx6ew2KHVCu0TtPfltnMs1emHAXwszmvep7FLDsoxw==
X-Received: by 2002:a17:90a:b946:: with SMTP id f6mr17395692pjw.69.1570806403400;
        Fri, 11 Oct 2019 08:06:43 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (unknown-103-217.windriver.com. [147.11.103.217])
        by smtp.gmail.com with ESMTPSA id d1sm10777356pfc.98.2019.10.11.08.06.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:06:42 -0700 (PDT)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: dev: Fix the race between the release of i2c_dev and cdev
Date:   Fri, 11 Oct 2019 23:00:14 +0800
Message-Id: <20191011150014.28177-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The struct cdev is embedded in the struct i2c_dev. In the current code,
we would free the i2c_dev struct directly in put_i2c_dev(), but the
cdev is manged by a kobject, and the release of it is not predictable.
So it is very possible that the i2c_dev is freed before the cdev is
entirely released. We can easily get the following call trace with
CONFIG_DEBUG_KOBJECT_RELEASE and CONFIG_DEBUG_OBJECTS_TIMERS enabled.
  ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x38
  WARNING: CPU: 19 PID: 1 at lib/debugobjects.c:325 debug_print_object+0xb0/0xf0
  Modules linked in:
  CPU: 19 PID: 1 Comm: swapper/0 Tainted: G        W         5.2.20-yocto-standard+ #120
  Hardware name: Marvell OcteonTX CN96XX board (DT)
  pstate: 80c00089 (Nzcv daIf +PAN +UAO)
  pc : debug_print_object+0xb0/0xf0
  lr : debug_print_object+0xb0/0xf0
  sp : ffff00001292f7d0
  x29: ffff00001292f7d0 x28: ffff800b82151788
  x27: 0000000000000001 x26: ffff800b892c0000
  x25: ffff0000124a2558 x24: 0000000000000000
  x23: ffff00001107a1d8 x22: ffff0000116b5088
  x21: ffff800bdc6afca8 x20: ffff000012471ae8
  x19: ffff00001168f2c8 x18: 0000000000000010
  x17: 00000000fd6f304b x16: 00000000ee79de43
  x15: ffff800bc0e80568 x14: 79616c6564203a74
  x13: 6e6968207473696c x12: 5f72656d6974203a
  x11: ffff0000113f0018 x10: 0000000000000000
  x9 : 000000000000001f x8 : 0000000000000000
  x7 : ffff0000101294cc x6 : 0000000000000000
  x5 : 0000000000000000 x4 : 0000000000000001
  x3 : 00000000ffffffff x2 : 0000000000000000
  x1 : 387fc15c8ec0f200 x0 : 0000000000000000
  Call trace:
   debug_print_object+0xb0/0xf0
   __debug_check_no_obj_freed+0x19c/0x228
   debug_check_no_obj_freed+0x1c/0x28
   kfree+0x250/0x440
   put_i2c_dev+0x68/0x78
   i2cdev_detach_adapter+0x60/0xc8
   i2cdev_notifier_call+0x3c/0x70
   notifier_call_chain+0x8c/0xe8
   blocking_notifier_call_chain+0x64/0x88
   device_del+0x74/0x380
   device_unregister+0x54/0x78
   i2c_del_adapter+0x278/0x2d0
   unittest_i2c_bus_remove+0x3c/0x80
   platform_drv_remove+0x30/0x50
   device_release_driver_internal+0xf4/0x1c0
   driver_detach+0x58/0xa0
   bus_remove_driver+0x84/0xd8
   driver_unregister+0x34/0x60
   platform_driver_unregister+0x20/0x30
   of_unittest_overlay+0x8d4/0xbe0
   of_unittest+0xae8/0xb3c
   do_one_initcall+0xac/0x450
   do_initcall_level+0x208/0x224
   kernel_init_freeable+0x2d8/0x36c
   kernel_init+0x18/0x108
   ret_from_fork+0x10/0x1c
  irq event stamp: 3934661
  hardirqs last  enabled at (3934661): [<ffff00001009fa04>] debug_exception_exit+0x4c/0x58
  hardirqs last disabled at (3934660): [<ffff00001009fb14>] debug_exception_enter+0xa4/0xe0
  softirqs last  enabled at (3934654): [<ffff000010081d94>] __do_softirq+0x46c/0x628
  softirqs last disabled at (3934649): [<ffff0000100b4a1c>] irq_exit+0x104/0x118

This is a common issue when using cdev embedded in a struct.
Fortunately, we already have a mechanism to solve this kind of issue.
Please see commit 233ed09d7fda ("chardev: add helper function to
register char devs with a struct device") for more detail.

In this patch, we choose to embed the struct device into the i2c_dev,
and use the API provided by the commit 233ed09d7fda to make sure that
the release of i2c_dev and cdev are in sequence.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/i2c/i2c-dev.c | 49 +++++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 2ea4585d18c5..dd23ed0b306d 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/compat.h>
+#include <linux/cdev.h>
 
 /*
  * An i2c_dev represents an i2c_adapter ... an I2C or SMBus master, not a
@@ -40,7 +41,7 @@
 struct i2c_dev {
 	struct list_head list;
 	struct i2c_adapter *adap;
-	struct device *dev;
+	struct device dev;
 	struct cdev cdev;
 };
 
@@ -84,12 +85,14 @@ static struct i2c_dev *get_free_i2c_dev(struct i2c_adapter *adap)
 	return i2c_dev;
 }
 
-static void put_i2c_dev(struct i2c_dev *i2c_dev)
+static void put_i2c_dev(struct i2c_dev *i2c_dev, bool del_cdev)
 {
 	spin_lock(&i2c_dev_list_lock);
 	list_del(&i2c_dev->list);
 	spin_unlock(&i2c_dev_list_lock);
-	kfree(i2c_dev);
+	if (del_cdev)
+		cdev_device_del(&i2c_dev->cdev, &i2c_dev->dev);
+	put_device(&i2c_dev->dev);
 }
 
 static ssize_t name_show(struct device *dev,
@@ -628,6 +631,14 @@ static const struct file_operations i2cdev_fops = {
 
 static struct class *i2c_dev_class;
 
+static void i2cdev_dev_release(struct device *dev)
+{
+	struct i2c_dev *i2c_dev;
+
+	i2c_dev = container_of(dev, struct i2c_dev, dev);
+	kfree(i2c_dev);
+}
+
 static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 {
 	struct i2c_adapter *adap;
@@ -644,27 +655,23 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 
 	cdev_init(&i2c_dev->cdev, &i2cdev_fops);
 	i2c_dev->cdev.owner = THIS_MODULE;
-	res = cdev_add(&i2c_dev->cdev, MKDEV(I2C_MAJOR, adap->nr), 1);
-	if (res)
-		goto error_cdev;
-
-	/* register this i2c device with the driver core */
-	i2c_dev->dev = device_create(i2c_dev_class, &adap->dev,
-				     MKDEV(I2C_MAJOR, adap->nr), NULL,
-				     "i2c-%d", adap->nr);
-	if (IS_ERR(i2c_dev->dev)) {
-		res = PTR_ERR(i2c_dev->dev);
-		goto error;
+
+	device_initialize(&i2c_dev->dev);
+	i2c_dev->dev.devt = MKDEV(I2C_MAJOR, adap->nr);
+	i2c_dev->dev.class = i2c_dev_class;
+	i2c_dev->dev.parent = &adap->dev;
+	i2c_dev->dev.release = i2cdev_dev_release;
+	dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+
+	res = cdev_device_add(&i2c_dev->cdev, &i2c_dev->dev);
+	if (res) {
+		put_i2c_dev(i2c_dev, false);
+		return res;
 	}
 
 	pr_debug("i2c-dev: adapter [%s] registered as minor %d\n",
 		 adap->name, adap->nr);
 	return 0;
-error:
-	cdev_del(&i2c_dev->cdev);
-error_cdev:
-	put_i2c_dev(i2c_dev);
-	return res;
 }
 
 static int i2cdev_detach_adapter(struct device *dev, void *dummy)
@@ -680,9 +687,7 @@ static int i2cdev_detach_adapter(struct device *dev, void *dummy)
 	if (!i2c_dev) /* attach_adapter must have failed */
 		return 0;
 
-	cdev_del(&i2c_dev->cdev);
-	put_i2c_dev(i2c_dev);
-	device_destroy(i2c_dev_class, MKDEV(I2C_MAJOR, adap->nr));
+	put_i2c_dev(i2c_dev, true);
 
 	pr_debug("i2c-dev: adapter [%s] unregistered\n", adap->name);
 	return 0;
-- 
2.14.4

