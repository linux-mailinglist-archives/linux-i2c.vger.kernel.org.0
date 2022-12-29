Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B355658EB5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Dec 2022 17:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbiL2QAz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Dec 2022 11:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiL2QAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Dec 2022 11:00:53 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC2325FF
        for <linux-i2c@vger.kernel.org>; Thu, 29 Dec 2022 08:00:52 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so7965018wmk.4
        for <linux-i2c@vger.kernel.org>; Thu, 29 Dec 2022 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RijxwWVbFkgEBf5aHju3Exr6WeKQXc2Z1r2PJmBjhNQ=;
        b=8C5GY2+pcJlRd/VllT2QxHtdEAxwqt9L3RTzWYdZF6ISZabF6Ve/KYDzc1ZogWak5p
         HcPVFZSpNFvj74QQTAu66NumhgKBg23HP6RmmZUb8Ky2IopRfWWbpjZHl8Kl/atEevff
         djhfMxm/vVv+GA+01dCm9gEKI5PGqCwMY8IClUHASxXfnq6E3o/kPw3NtLNe2sYMrlHR
         ENbZQwD0MD8vjn/ESyhW0QfscC8X8Rc9DXPoQ1+YhJybFV9vc1cVaNc2yWTI0Srxl/WY
         tOsGkSOCIMdp+uo1P64dL/gHVvc/ZydMmNdjVQTL+E6Zhw4gaY1fBZOdv/qUDcoV6I8H
         FXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RijxwWVbFkgEBf5aHju3Exr6WeKQXc2Z1r2PJmBjhNQ=;
        b=GXZSD/i6X0/tR6mSsEKsmojRN4zrEuTmBrSpZEW5vZgD2zfcGCh7AMdz4PGWwRdQpg
         YA8bDCHrtnAE2col7WU1wZ0nHNgiIPRgg+qm5hnPDEsxD8wpx0tji4yKFkKM2uI6KqHH
         hSiY4cJt8HwTj1CBt3OgUvjGnzcVh0DyQH5MXxZcWJp3J9l/YfwSyGYU8waGDla+hd9w
         sSNK5SmWHXkGKNmP//SOLpm7VttEsilnZuaOfnzxLxmq6ycmUkMpSak+NP1dLGEBcvGs
         YUahU2jQNe9zlD+WsNhv6fPUpfUYfHo/6YnJiapEUxFcWwc0zoEu6ejs3xppctoMPtJn
         xO1g==
X-Gm-Message-State: AFqh2kreOo9gjMTW4pBtDUOCbYNldMTT4Jxz2xrA8BHUhqm3v2eJtRpI
        fNOHqq5ZbKl2/ttHJeH00NcuPQ==
X-Google-Smtp-Source: AMrXdXtzyQyyl4NEjo2WIs/VrOWIlAeMS8bb7f7rjety531zTnGrM7EDp6nL510upy2K/HIIXq4C/Q==
X-Received: by 2002:a05:600c:4255:b0:3d3:3d34:5d63 with SMTP id r21-20020a05600c425500b003d33d345d63mr21116648wmm.8.1672329650623;
        Thu, 29 Dec 2022 08:00:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f7a:98d8:9d8d:ced8])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b003cfa3a12660sm42511593wmq.1.2022.12.29.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:00:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/2] i2c: dev: don't allow user-space to deadlock the kernel
Date:   Thu, 29 Dec 2022 17:00:45 +0100
Message-Id: <20221229160045.535778-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221229160045.535778-1-brgl@bgdev.pl>
References: <20221229160045.535778-1-brgl@bgdev.pl>
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
 drivers/i2c/i2c-core-base.c | 26 ++--------
 drivers/i2c/i2c-dev.c       | 96 ++++++++++++++++++++++++++++++++-----
 include/linux/i2c.h         |  2 -
 3 files changed, 88 insertions(+), 36 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 087e480b624c..9ce63d513f72 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1139,7 +1139,11 @@ EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
 static void i2c_adapter_dev_release(struct device *dev)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	complete(&adap->dev_released);
+
+	/* free bus id */
+	mutex_lock(&core_lock);
+	idr_remove(&i2c_adapter_idr, adap->nr);
+	mutex_unlock(&core_lock);
 }
 
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
@@ -1512,9 +1516,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	return 0;
 
 out_reg:
-	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
-	wait_for_completion(&adap->dev_released);
 out_list:
 	mutex_lock(&core_lock);
 	idr_remove(&i2c_adapter_idr, adap->nr);
@@ -1713,25 +1715,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
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
-
-	/* free bus id */
-	mutex_lock(&core_lock);
-	idr_remove(&i2c_adapter_idr, adap->nr);
-	mutex_unlock(&core_lock);
-
-	/* Clear the device structure in case this adapter is ever going to be
-	   added again */
-	memset(&adap->dev, 0, sizeof(adap->dev));
 }
 EXPORT_SYMBOL(i2c_del_adapter);
 
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
index d84e0e99f084..3f31e4032044 100644
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
@@ -739,7 +738,6 @@ struct i2c_adapter {
 
 	int nr;
 	char name[48];
-	struct completion dev_released;
 
 	struct mutex userspace_clients_lock;
 	struct list_head userspace_clients;
-- 
2.37.2

