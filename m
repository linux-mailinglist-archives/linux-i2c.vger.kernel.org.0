Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF88647574
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 19:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiLHSVy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 13:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiLHSVv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 13:21:51 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AEC82FB4
        for <linux-i2c@vger.kernel.org>; Thu,  8 Dec 2022 10:21:49 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id n7so1757539wms.3
        for <linux-i2c@vger.kernel.org>; Thu, 08 Dec 2022 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da2FUeEX5r50Lb042nI+fa5XQvR3JjsU/EXbqm9uvsQ=;
        b=RMbcmjyor0xfpvKtHJrFT8xlgmSVWJ+EEUDEInSG8pOYRqydJg+LG8YxFm8NW/tiOX
         b2tzbb2wAH9KXWzCfKYaPCFDLhRHLUvWKM3LIZWhOdo6NeFoxGz8/0GOVnw1l7lTcN0J
         nX0mCC6KTEaHd8lO/mSq9ogtDjNw1FKjnrcT4Yb/o/XHD7tzCpEz4WSyNLTRStDtnF/h
         Rv0i8+f7CPQ4ga8S+SO9xj4zzQNH/nl1lXniDlgJe4X8dI9tbBY6yAo18VK46RENcU9M
         Be+pXDexGCLX1jKIoRJnhOxpwN0vsB1Rwp7U/vb6R/Ykr9/zz/y/LxPDZzg8sfDIk83d
         f+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da2FUeEX5r50Lb042nI+fa5XQvR3JjsU/EXbqm9uvsQ=;
        b=yEF2Y3VEU1sPifSRIoKuxDBHXeSusi7bxlI+FFyiWoP0KQ4UfVB4vNqvOrf4HwEBD0
         7MBO9NpP/nVPnbKxMWXWjQBc/1HB6BEC0PsUJvHbhNXoo9w88QMzXy6nF6cV5Ulcq8Nc
         m60QIl6UTb+5J4eXvZQP3ZJ8x4GOYJ45Wm1mYOtbz+hD2mEbGnmWnnDCpVg1k4X9vI9Z
         4P00bI72PlW/U7SfrduqU+iLltAll8ihBrmPgzj0pHGd6d17fyrP3Xch+BCJKd8hpk5z
         MubsoaWo7YcmBaszAcfD5i1DAyuG0mYa3P9VtMPIEBFmTo4hIJFEJmjZdKwu1xGSvg2E
         T/8g==
X-Gm-Message-State: ANoB5plV062ZoWVJ7s8DB3hQTZdBVcYQGHBSqzKBGI2XnuD2gyCks97L
        hZzHCDNzexGn467qjSj2VttXUw==
X-Google-Smtp-Source: AA0mqf7eYlcJsB5Ofg6lnvYLvSECdyYhwf092xOPDfjvCAkf+XZvcnrHKFWhCM4zNrHK5dcf7AMP0A==
X-Received: by 2002:a05:600c:6549:b0:3c7:1359:783b with SMTP id dn9-20020a05600c654900b003c71359783bmr2723136wmb.1.1670523707862;
        Thu, 08 Dec 2022 10:21:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1fd:11b0:f877:1d6c])
        by smtp.gmail.com with ESMTPSA id f26-20020a7bc8da000000b003cfd4e6400csm5770338wml.19.2022.12.08.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 10:21:47 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] i2c: dev: don't allow user-space to deadlock the kernel
Date:   Thu,  8 Dec 2022 19:21:42 +0100
Message-Id: <20221208182142.250084-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221208182142.250084-1-brgl@bgdev.pl>
References: <20221208182142.250084-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we open an i2c character device and then unbind the underlying i2c
adapter (either by unbinding it manually via sysfs or - for a real-life
example - when unplugging a USB device with an i2c adaper), the kernel
thread calling i2c_del_adapter() will become blocked waiting for the
completion that only completes once all references to the character
device get dropped.

In order to fix that, we introduce a couple changes. They need to be
part of a single commit in order to preserve bisectability. First, drop
the dev_release completion. That removes the risk of a deadlock but
we now need to protect the character device structures against NULL
pointer dereferences. To that end introduce an rw semaphore. It will
protect the dummy i2c_client structure against dropping the adapter from
under it. It will be taken for reading by all file_operations callbacks
and for writing by the notifier's unbind handler. This way we don't
prohibit the syscalls that don't get in each other's way from running
concurrently but the adapter will not be unbound before all syscalls
return.

Finally: upon being notified about an unbind event for the i2c adapter,
we take the lock for writing and set the adapter pointer in the character
device's structure to NULL. This "numbs down" the device - it still exists
but is no longer functional. Meanwhile every syscall callback checks that
pointer after taking the lock but before executing any code that requires
it. If it's NULL, we return an error to user-space.

This way we can safely open an i2c device from user-space, unbind the
device without triggering a deadlock and any subsequent system-call for
the file descriptor associated with the removed adapter will gracefully
fail.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/i2c-core-base.c | 18 -------
 drivers/i2c/i2c-dev.c       | 96 ++++++++++++++++++++++++++++++++-----
 include/linux/i2c.h         |  2 -
 3 files changed, 83 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..368fe271558f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1137,12 +1137,6 @@ EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
 
 /* I2C bus adapters -- one roots each I2C or SMBUS segment */
 
-static void i2c_adapter_dev_release(struct device *dev)
-{
-	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	complete(&adap->dev_released);
-}
-
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
 {
 	unsigned int depth = 0;
@@ -1292,7 +1286,6 @@ ATTRIBUTE_GROUPS(i2c_adapter);
 
 struct device_type i2c_adapter_type = {
 	.groups		= i2c_adapter_groups,
-	.release	= i2c_adapter_dev_release,
 };
 EXPORT_SYMBOL_GPL(i2c_adapter_type);
 
@@ -1513,9 +1506,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	return 0;
 
 out_reg:
-	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
-	wait_for_completion(&adap->dev_released);
 out_list:
 	mutex_lock(&core_lock);
 	idr_remove(&i2c_adapter_idr, adap->nr);
@@ -1714,16 +1705,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
 	i2c_host_notify_irq_teardown(adap);
 
-	/* wait until all references to the device are gone
-	 *
-	 * FIXME: This is old code and should ideally be replaced by an
-	 * alternative which results in decoupling the lifetime of the struct
-	 * device from the i2c_adapter, like spi or netdev do. Any solution
-	 * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
-	 */
-	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
-	wait_for_completion(&adap->dev_released);
 
 	/* free bus id */
 	mutex_lock(&core_lock);
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 107623c4cc14..305b64a5d4d4 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -28,6 +28,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
@@ -44,8 +45,14 @@ struct i2c_dev {
 	struct i2c_adapter *adap;
 	struct device dev;
 	struct cdev cdev;
+	struct rw_semaphore sem;
 };
 
+static inline struct i2c_dev *to_i2c_dev(struct inode *ino)
+{
+	return container_of(ino->i_cdev, struct i2c_dev, cdev);
+}
+
 #define I2C_MINORS	(MINORMASK + 1)
 static LIST_HEAD(i2c_dev_list);
 static DEFINE_SPINLOCK(i2c_dev_list_lock);
@@ -136,15 +143,23 @@ static ssize_t i2cdev_read(struct file *file, char __user *buf, size_t count,
 {
 	char *tmp;
 	int ret;
-
+	struct i2c_dev *i2c_dev = to_i2c_dev(file_inode(file));
 	struct i2c_client *client = file->private_data;
 
 	if (count > 8192)
 		count = 8192;
 
+	down_read(&i2c_dev->sem);
+	if (!i2c_dev->adap) {
+		up_read(&i2c_dev->sem);
+		return -ENODEV;
+	}
+
 	tmp = kzalloc(count, GFP_KERNEL);
-	if (tmp == NULL)
+	if (tmp == NULL) {
+		up_read(&i2c_dev->sem);
 		return -ENOMEM;
+	}
 
 	pr_debug("i2c-%d reading %zu bytes.\n", iminor(file_inode(file)), count);
 
@@ -152,6 +167,7 @@ static ssize_t i2cdev_read(struct file *file, char __user *buf, size_t count,
 	if (ret >= 0)
 		if (copy_to_user(buf, tmp, ret))
 			ret = -EFAULT;
+	up_read(&i2c_dev->sem);
 	kfree(tmp);
 	return ret;
 }
@@ -161,18 +177,28 @@ static ssize_t i2cdev_write(struct file *file, const char __user *buf,
 {
 	int ret;
 	char *tmp;
+	struct i2c_dev *i2c_dev = to_i2c_dev(file_inode(file));
 	struct i2c_client *client = file->private_data;
 
 	if (count > 8192)
 		count = 8192;
 
+	down_read(&i2c_dev->sem);
+	if (!i2c_dev->adap) {
+		up_read(&i2c_dev->sem);
+		return -ENODEV;
+	}
+
 	tmp = memdup_user(buf, count);
-	if (IS_ERR(tmp))
+	if (IS_ERR(tmp)) {
+		up_read(&i2c_dev->sem);
 		return PTR_ERR(tmp);
+	}
 
 	pr_debug("i2c-%d writing %zu bytes.\n", iminor(file_inode(file)), count);
 
 	ret = i2c_master_send(client, tmp, count);
+	up_read(&i2c_dev->sem);
 	kfree(tmp);
 	return ret;
 }
@@ -389,7 +415,8 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 	return res;
 }
 
-static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+static long i2cdev_ioctl_unlocked(struct file *file, unsigned int cmd,
+				  unsigned long arg)
 {
 	struct i2c_client *client = file->private_data;
 	unsigned long funcs;
@@ -495,6 +522,20 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
+static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct i2c_dev *i2c_dev = to_i2c_dev(file_inode(file));
+	long ret;
+
+	down_read(&i2c_dev->sem);
+	if (!i2c_dev->adap)
+		ret = -ENODEV;
+	else
+		ret = i2cdev_ioctl_unlocked(file, cmd, arg);
+	up_read(&i2c_dev->sem);
+
+	return ret;
+}
 #ifdef CONFIG_COMPAT
 
 struct i2c_smbus_ioctl_data32 {
@@ -516,10 +557,12 @@ struct i2c_rdwr_ioctl_data32 {
 	u32 nmsgs;
 };
 
-static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+static long compat_i2cdev_ioctl_unlocked(struct file *file, unsigned int cmd,
+					 unsigned long arg)
 {
 	struct i2c_client *client = file->private_data;
 	unsigned long funcs;
+
 	switch (cmd) {
 	case I2C_FUNCS:
 		funcs = i2c_get_functionality(client->adapter);
@@ -578,19 +621,39 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		return i2cdev_ioctl(file, cmd, arg);
 	}
 }
+
+static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd,
+				unsigned long arg)
+{
+	struct i2c_dev *i2c_dev = to_i2c_dev(file_inode(file));
+	long ret;
+
+	down_read(&i2c_dev->sem);
+	if (!i2c_dev->adap)
+		ret = -ENODEV;
+	else
+		ret = compat_i2cdev_ioctl_unlocked(file, cmd, arg);
+	up_read(&i2c_dev->sem);
+
+	return ret;
+}
 #else
 #define compat_i2cdev_ioctl NULL
 #endif
 
 static int i2cdev_open(struct inode *inode, struct file *file)
 {
-	unsigned int minor = iminor(inode);
+	struct i2c_dev *i2c_dev = to_i2c_dev(inode);
 	struct i2c_client *client;
 	struct i2c_adapter *adap;
+	int ret = 0;
 
-	adap = i2c_get_adapter(minor);
-	if (!adap)
-		return -ENODEV;
+	down_read(&i2c_dev->sem);
+	adap = i2c_dev->adap;
+	if (!adap) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 
 	/* This creates an anonymous i2c_client, which may later be
 	 * pointed to some address using I2C_SLAVE or I2C_SLAVE_FORCE.
@@ -601,22 +664,23 @@ static int i2cdev_open(struct inode *inode, struct file *file)
 	 */
 	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (!client) {
-		i2c_put_adapter(adap);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_unlock;
 	}
 	snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
 
 	client->adapter = adap;
 	file->private_data = client;
 
-	return 0;
+out_unlock:
+	up_read(&i2c_dev->sem);
+	return ret;
 }
 
 static int i2cdev_release(struct inode *inode, struct file *file)
 {
 	struct i2c_client *client = file->private_data;
 
-	i2c_put_adapter(client->adapter);
 	kfree(client);
 	file->private_data = NULL;
 
@@ -669,6 +733,8 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 	i2c_dev->dev.parent = &adap->dev;
 	i2c_dev->dev.release = i2cdev_dev_release;
 
+	init_rwsem(&i2c_dev->sem);
+
 	res = dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
 	if (res)
 		goto err_put_i2c_dev;
@@ -698,6 +764,10 @@ static int i2cdev_detach_adapter(struct device *dev, void *dummy)
 	if (!i2c_dev) /* attach_adapter must have failed */
 		return NOTIFY_DONE;
 
+	down_write(&i2c_dev->sem);
+	i2c_dev->adap = NULL;
+	up_write(&i2c_dev->sem);
+
 	put_i2c_dev(i2c_dev, true);
 
 	pr_debug("adapter [%s] unregistered\n", adap->name);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..5c4adf921245 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -14,7 +14,6 @@
 #include <linux/bits.h>
 #include <linux/mod_devicetable.h>
 #include <linux/device.h>	/* for struct device */
-#include <linux/sched.h>	/* for completion */
 #include <linux/mutex.h>
 #include <linux/regulator/consumer.h>
 #include <linux/rtmutex.h>
@@ -738,7 +737,6 @@ struct i2c_adapter {
 
 	int nr;
 	char name[48];
-	struct completion dev_released;
 
 	struct mutex userspace_clients_lock;
 	struct list_head userspace_clients;
-- 
2.37.2

