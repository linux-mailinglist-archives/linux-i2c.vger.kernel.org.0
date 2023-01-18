Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B594C671F08
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 15:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjAROJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 09:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjAROIs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 09:08:48 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5A85D93A
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 05:49:44 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id k16so4078794wms.2
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ3Ty+rdCpkk6ljZLYKXjmhZaZ6cKcW44gQP/rtIU/k=;
        b=qMxMdj1/JzYWYbrXksZ/gXrOT9fA/r+XV7MZCDKVPGP+Aix6AKEZWZ35pzazYpbyqI
         nxSrxH4xObPmkENAOD3811dqwZDpoNqH5lcJimjkt5RFXEzVlspEL6Prdno8utvJXfig
         wBXoMBvCuCq3TqsTYf6/Q6bFHMdBB3KY1EhKuHYp9NneuvIG3qywK/eZTKz0StVxQFBG
         kn94XYcVWarwn3dXjqdN8zUI8TFhuQTYX/6Zg846erYdBsWPpGeX9BQhKASJjqJLIv1v
         w7Kafu2cegxP6kkGVPzd03QWvoYQrSoIM9ibxoGT+Hp0P/GzZYvQtZl9rrBhSfKMIPzh
         8Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ3Ty+rdCpkk6ljZLYKXjmhZaZ6cKcW44gQP/rtIU/k=;
        b=G4bOmfakkfDfCmgdGwkL2WEt0Ui7jFZp7Vn5xp5mn3NvjX+oSDItEv7uDhLD+bkMnh
         0Dluf4zDTQA0Rc3d/f3xB6ltehO144MS01KmdUIvchH92STiE53dndiwnskUKdSDxTSC
         QqqaeDru6TTPBHTMylc6la3hpZvGICy93sk5m7duUdLCabgYbv6F7ldGCfdjqXLdTLYl
         FT28K9TTzBL3BYGxy05vaBwy10OYoSfLP9LtmUoGcPYzRXVE0I+i+UZaBqNCVlvspapJ
         H+PZZ+9ah1BvBMWDU2Z9DevJel0b6ZVtetD6QkgRUrr5GNOGkGO5hMCGDCJby4Q2yP3F
         55HQ==
X-Gm-Message-State: AFqh2kogvaUvtgU/8kijMzuyL8WXUuBtcweh6MStAstrElsF/iV6ExLm
        93f++jKmIDlYdSTcCknfwomzew==
X-Google-Smtp-Source: AMrXdXvUOYN2uN3R7Ey2rNpjEhiIxSWpQtb8kb4FfWiLMPhMn1k1dP7k1AGzgZ5fH62hp3CW3VzfdQ==
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id az1-20020a05600c600100b003daf80a5e85mr6636539wmb.26.1674049783126;
        Wed, 18 Jan 2023 05:49:43 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1866:5d91:a429:aba])
        by smtp.gmail.com with ESMTPSA id i18-20020a05600c355200b003d9df9e59c4sm2392363wmq.37.2023.01.18.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:49:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3] i2c: dev: don't allow user-space to deadlock the kernel
Date:   Wed, 18 Jan 2023 14:49:40 +0100
Message-Id: <20230118134940.240102-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
v1 -> v2:
- keep the device release callback and use it to free the IDR number
- rebase on top of v6.2-rc1

v2 -> v3:
- make symbol names more descriptive
- protect the name_show() sysfs callback too
- zero the adapter's struct device on device release
- make sure the code works nicely with CONFIG_DEBUG_KOBJECT_RELEASE enabled

 drivers/i2c/i2c-core-base.c |  32 ++++-------
 drivers/i2c/i2c-dev.c       | 109 +++++++++++++++++++++++++++++++-----
 include/linux/i2c.h         |   2 -
 3 files changed, 106 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 087e480b624c..ec8140d907c2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1139,7 +1139,17 @@ EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
 static void i2c_adapter_dev_release(struct device *dev)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	complete(&adap->dev_released);
+
+	/* free bus id */
+	mutex_lock(&core_lock);
+	idr_remove(&i2c_adapter_idr, adap->nr);
+	mutex_unlock(&core_lock);
+
+	/*
+	 * Clear the device structure in case this adapter is ever going to be
+	 * added again.
+	 */
+	memset(&adap->dev, 0, sizeof(adap->dev));
 }
 
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
@@ -1512,9 +1522,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	return 0;
 
 out_reg:
-	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
-	wait_for_completion(&adap->dev_released);
 out_list:
 	mutex_lock(&core_lock);
 	idr_remove(&i2c_adapter_idr, adap->nr);
@@ -1713,25 +1721,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
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
index 107623c4cc14..38c83ee408be 100644
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
+	struct rw_semaphore rwsem;
 };
 
+static inline struct i2c_dev *inode_to_i2c_dev(struct inode *ino)
+{
+	return container_of(ino->i_cdev, struct i2c_dev, cdev);
+}
+
 #define I2C_MINORS	(MINORMASK + 1)
 static LIST_HEAD(i2c_dev_list);
 static DEFINE_SPINLOCK(i2c_dev_list_lock);
@@ -99,10 +106,21 @@ static ssize_t name_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
 	struct i2c_dev *i2c_dev = i2c_dev_get_by_minor(MINOR(dev->devt));
+	const char *name;
 
 	if (!i2c_dev)
 		return -ENODEV;
-	return sysfs_emit(buf, "%s\n", i2c_dev->adap->name);
+
+	down_read(&i2c_dev->rwsem);
+	if (!i2c_dev->adap) {
+		up_read(&i2c_dev->rwsem);
+		return -ENODEV;
+	}
+
+	name = i2c_dev->adap->name;
+	up_read(&i2c_dev->rwsem);
+
+	return sysfs_emit(buf, "%s\n", name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -136,15 +154,23 @@ static ssize_t i2cdev_read(struct file *file, char __user *buf, size_t count,
 {
 	char *tmp;
 	int ret;
-
+	struct i2c_dev *i2c_dev = inode_to_i2c_dev(file_inode(file));
 	struct i2c_client *client = file->private_data;
 
 	if (count > 8192)
 		count = 8192;
 
+	down_read(&i2c_dev->rwsem);
+	if (!i2c_dev->adap) {
+		up_read(&i2c_dev->rwsem);
+		return -ENODEV;
+	}
+
 	tmp = kzalloc(count, GFP_KERNEL);
-	if (tmp == NULL)
+	if (tmp == NULL) {
+		up_read(&i2c_dev->rwsem);
 		return -ENOMEM;
+	}
 
 	pr_debug("i2c-%d reading %zu bytes.\n", iminor(file_inode(file)), count);
 
@@ -152,6 +178,7 @@ static ssize_t i2cdev_read(struct file *file, char __user *buf, size_t count,
 	if (ret >= 0)
 		if (copy_to_user(buf, tmp, ret))
 			ret = -EFAULT;
+	up_read(&i2c_dev->rwsem);
 	kfree(tmp);
 	return ret;
 }
@@ -161,18 +188,28 @@ static ssize_t i2cdev_write(struct file *file, const char __user *buf,
 {
 	int ret;
 	char *tmp;
+	struct i2c_dev *i2c_dev = inode_to_i2c_dev(file_inode(file));
 	struct i2c_client *client = file->private_data;
 
 	if (count > 8192)
 		count = 8192;
 
+	down_read(&i2c_dev->rwsem);
+	if (!i2c_dev->adap) {
+		up_read(&i2c_dev->rwsem);
+		return -ENODEV;
+	}
+
 	tmp = memdup_user(buf, count);
-	if (IS_ERR(tmp))
+	if (IS_ERR(tmp)) {
+		up_read(&i2c_dev->rwsem);
 		return PTR_ERR(tmp);
+	}
 
 	pr_debug("i2c-%d writing %zu bytes.\n", iminor(file_inode(file)), count);
 
 	ret = i2c_master_send(client, tmp, count);
+	up_read(&i2c_dev->rwsem);
 	kfree(tmp);
 	return ret;
 }
@@ -389,7 +426,8 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 	return res;
 }
 
-static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+static long i2cdev_ioctl_unlocked(struct file *file, unsigned int cmd,
+				  unsigned long arg)
 {
 	struct i2c_client *client = file->private_data;
 	unsigned long funcs;
@@ -495,6 +533,20 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
+static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct i2c_dev *i2c_dev = inode_to_i2c_dev(file_inode(file));
+	long ret;
+
+	down_read(&i2c_dev->rwsem);
+	if (!i2c_dev->adap)
+		ret = -ENODEV;
+	else
+		ret = i2cdev_ioctl_unlocked(file, cmd, arg);
+	up_read(&i2c_dev->rwsem);
+
+	return ret;
+}
 #ifdef CONFIG_COMPAT
 
 struct i2c_smbus_ioctl_data32 {
@@ -516,10 +568,12 @@ struct i2c_rdwr_ioctl_data32 {
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
@@ -578,19 +632,39 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		return i2cdev_ioctl(file, cmd, arg);
 	}
 }
+
+static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd,
+				unsigned long arg)
+{
+	struct i2c_dev *i2c_dev = inode_to_i2c_dev(file_inode(file));
+	long ret;
+
+	down_read(&i2c_dev->rwsem);
+	if (!i2c_dev->adap)
+		ret = -ENODEV;
+	else
+		ret = compat_i2cdev_ioctl_unlocked(file, cmd, arg);
+	up_read(&i2c_dev->rwsem);
+
+	return ret;
+}
 #else
 #define compat_i2cdev_ioctl NULL
 #endif
 
 static int i2cdev_open(struct inode *inode, struct file *file)
 {
-	unsigned int minor = iminor(inode);
+	struct i2c_dev *i2c_dev = inode_to_i2c_dev(inode);
 	struct i2c_client *client;
 	struct i2c_adapter *adap;
+	int ret = 0;
 
-	adap = i2c_get_adapter(minor);
-	if (!adap)
-		return -ENODEV;
+	down_read(&i2c_dev->rwsem);
+	adap = i2c_dev->adap;
+	if (!adap) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 
 	/* This creates an anonymous i2c_client, which may later be
 	 * pointed to some address using I2C_SLAVE or I2C_SLAVE_FORCE.
@@ -601,22 +675,23 @@ static int i2cdev_open(struct inode *inode, struct file *file)
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
+	up_read(&i2c_dev->rwsem);
+	return ret;
 }
 
 static int i2cdev_release(struct inode *inode, struct file *file)
 {
 	struct i2c_client *client = file->private_data;
 
-	i2c_put_adapter(client->adapter);
 	kfree(client);
 	file->private_data = NULL;
 
@@ -669,6 +744,8 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 	i2c_dev->dev.parent = &adap->dev;
 	i2c_dev->dev.release = i2cdev_dev_release;
 
+	init_rwsem(&i2c_dev->rwsem);
+
 	res = dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
 	if (res)
 		goto err_put_i2c_dev;
@@ -698,6 +775,10 @@ static int i2cdev_detach_adapter(struct device *dev, void *dummy)
 	if (!i2c_dev) /* attach_adapter must have failed */
 		return NOTIFY_DONE;
 
+	down_write(&i2c_dev->rwsem);
+	i2c_dev->adap = NULL;
+	up_write(&i2c_dev->rwsem);
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

