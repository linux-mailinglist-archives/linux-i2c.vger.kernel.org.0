Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886563C5E4D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 16:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbhGLOZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 10:25:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:31911 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230070AbhGLOZy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Jul 2021 10:25:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="271100640"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="271100640"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 07:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="629678264"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2021 07:23:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E6DFBFF; Mon, 12 Jul 2021 17:23:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v1 1/2] i2c: dev: Define pr_fmt() and drop duplication substrings
Date:   Mon, 12 Jul 2021 17:23:22 +0300
Message-Id: <20210712142323.23118-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Define pr_fmt() to print module name as prefix and at the same time
drop duplication substrings in the messages.

While at it, convert printk(<LEVEL>) to pr_<level>().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-dev.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index cb64fe649390..6cf98c06653a 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -14,6 +14,8 @@
 
 /* The I2C_RDWR ioctl code is written by Kolja Waschk <waschk@telos.de> */
 
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
 #include <linux/cdev.h>
 #include <linux/compat.h>
 #include <linux/device.h>
@@ -68,8 +70,7 @@ static struct i2c_dev *get_free_i2c_dev(struct i2c_adapter *adap)
 	struct i2c_dev *i2c_dev;
 
 	if (adap->nr >= I2C_MINORS) {
-		printk(KERN_ERR "i2c-dev: Out of device minors (%d)\n",
-		       adap->nr);
+		pr_err("Out of device minors (%d)\n", adap->nr);
 		return ERR_PTR(-ENODEV);
 	}
 
@@ -145,8 +146,7 @@ static ssize_t i2cdev_read(struct file *file, char __user *buf, size_t count,
 	if (tmp == NULL)
 		return -ENOMEM;
 
-	pr_debug("i2c-dev: i2c-%d reading %zu bytes.\n",
-		iminor(file_inode(file)), count);
+	pr_debug("i2c-%d reading %zu bytes.\n", iminor(file_inode(file)), count);
 
 	ret = i2c_master_recv(client, tmp, count);
 	if (ret >= 0)
@@ -169,8 +169,7 @@ static ssize_t i2cdev_write(struct file *file, const char __user *buf,
 	if (IS_ERR(tmp))
 		return PTR_ERR(tmp);
 
-	pr_debug("i2c-dev: i2c-%d writing %zu bytes.\n",
-		iminor(file_inode(file)), count);
+	pr_debug("i2c-%d writing %zu bytes.\n", iminor(file_inode(file)), count);
 
 	ret = i2c_master_send(client, tmp, count);
 	kfree(tmp);
@@ -673,8 +672,7 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 		return res;
 	}
 
-	pr_debug("i2c-dev: adapter [%s] registered as minor %d\n",
-		 adap->name, adap->nr);
+	pr_debug("adapter [%s] registered as minor %d\n", adap->name, adap->nr);
 	return 0;
 }
 
@@ -693,7 +691,7 @@ static int i2cdev_detach_adapter(struct device *dev, void *dummy)
 
 	put_i2c_dev(i2c_dev, true);
 
-	pr_debug("i2c-dev: adapter [%s] unregistered\n", adap->name);
+	pr_debug("adapter [%s] unregistered\n", adap->name);
 	return 0;
 }
 
@@ -726,7 +724,7 @@ static int __init i2c_dev_init(void)
 {
 	int res;
 
-	printk(KERN_INFO "i2c /dev entries driver\n");
+	pr_info("i2c /dev entries driver\n");
 
 	res = register_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS, "i2c");
 	if (res)
@@ -754,7 +752,7 @@ static int __init i2c_dev_init(void)
 out_unreg_chrdev:
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 out:
-	printk(KERN_ERR "%s: Driver Initialisation failed\n", __FILE__);
+	pr_err("Driver Initialisation failed\n");
 	return res;
 }
 
-- 
2.30.2

