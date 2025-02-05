Return-Path: <linux-i2c+bounces-9305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6096A28C37
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D614C1884AAA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F011514EE;
	Wed,  5 Feb 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eunfJS2u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AF414B959
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763194; cv=none; b=I47epOTN3YZMGFC0LudpFjHGSXIIxpgMr6fp6XIaKsmpIekA96Q/Ovhhj1zRieeNC41gUx7/7OhzJqnOChpgQnaQ4TVh3acIyX5GUxTcqUngHjL682FyeO1jnEYojsromqxCHlnWWh/rVPdZL1IeXil1xlUZK0ji/F4s8p9K598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763194; c=relaxed/simple;
	bh=+983UlTNnqMQC5TvN5/QpGRNQYk5jHqiSQumBSSm4+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sr3+Y3hl2pebNWujuu6JVsoFQnb4qmq6eTsS3EEJcyJNMXzp1rfrP+WM1PS7Qg7lymKz49PklOcRbPKyiZL8oSFeppMmxHoQ0mlKJfQuqZre+IKyQI6s/uFBcBkLIrm7aT91EBkSgMM3iD+zyQ04X/N2zjw6BCZJG/WP0Qj71Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eunfJS2u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VkoR3rn+hEek9A6aywU0FxYNjsNzsIH24DCOiGL7LLM=; b=eunfJS
	2ud2/U1/mUOTSBBHcE64JwKVY8oh4+lRxokQgT0Vv7itUPMGB5nd49xL/MxuNd3R
	rNdQPD2fuzsHGzohEGv4TYR9iLLs3xlPNAa6PXv14y1w7e4kl63NOggKDlxaHXqn
	Z64Y93HWx33gQgAYuArWlPjDLKFoEcorT8kDaU8j7WlovXiC0lWKnjmnCsafjrAD
	zZNKIYKShZ48mlpUl+Wo5i4hiuNdNRqC8vpY+Y7R1gR5eHSdflBT/0/4nHpcKABe
	o0Dnr+16eF9gsWGR+w2sjcaZUBjRYxxSaYl5ZBGxd3NtzfAB+CF17Rf7x3uNhyHp
	X/UJ4GQtWT0WDHNA==
Received: (qmail 3407780 invoked from network); 5 Feb 2025 14:46:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 14:46:27 +0100
X-UD-Smtp-Session: l3s3148p1@2eogWmUt3oltK/OC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] Revert "i2c: Replace list-based mechanism for handling userspace-created clients"
Date: Wed,  5 Feb 2025 14:42:26 +0100
Message-ID: <20250205134623.6921-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
References: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 3cfe39b3a845593a485ab1c716615979004ef9f6. Mux
handling is not sufficiently implemented. It needs more time.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 61 ++++++++++++++++++++++++-------------
 include/linux/i2c.h         |  7 ++++-
 2 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5546184df05f..ddac2f155718 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1300,12 +1300,14 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 		info.flags |= I2C_CLIENT_SLAVE;
 	}
 
-	info.flags |= I2C_CLIENT_USER;
-
 	client = i2c_new_client_device(adap, &info);
 	if (IS_ERR(client))
 		return PTR_ERR(client);
 
+	/* Keep track of the added device */
+	mutex_lock(&adap->userspace_clients_lock);
+	list_add_tail(&client->detected, &adap->userspace_clients);
+	mutex_unlock(&adap->userspace_clients_lock);
 	dev_info(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
 		 info.type, info.addr);
 
@@ -1313,15 +1315,6 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_WO(new_device);
 
-static int __i2c_find_user_addr(struct device *dev, const void *addrp)
-{
-	struct i2c_client *client = i2c_verify_client(dev);
-	unsigned short addr = *(unsigned short *)addrp;
-
-	return client && client->flags & I2C_CLIENT_USER &&
-	       i2c_encode_flags_to_addr(client) == addr;
-}
-
 /*
  * And of course let the users delete the devices they instantiated, if
  * they got it wrong. This interface can only be used to delete devices
@@ -1336,7 +1329,7 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		    const char *buf, size_t count)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	struct device *child_dev;
+	struct i2c_client *client, *next;
 	unsigned short addr;
 	char end;
 	int res;
@@ -1352,19 +1345,28 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
-	mutex_lock(&core_lock);
 	/* Make sure the device was added through sysfs */
-	child_dev = device_find_child(&adap->dev, &addr, __i2c_find_user_addr);
-	if (child_dev) {
-		i2c_unregister_device(i2c_verify_client(child_dev));
-		put_device(child_dev);
-	} else {
-		dev_err(dev, "Can't find userspace-created device at %#x\n", addr);
-		count = -ENOENT;
+	res = -ENOENT;
+	mutex_lock_nested(&adap->userspace_clients_lock,
+			  i2c_adapter_depth(adap));
+	list_for_each_entry_safe(client, next, &adap->userspace_clients,
+				 detected) {
+		if (i2c_encode_flags_to_addr(client) == addr) {
+			dev_info(dev, "%s: Deleting device %s at 0x%02hx\n",
+				 "delete_device", client->name, client->addr);
+
+			list_del(&client->detected);
+			i2c_unregister_device(client);
+			res = count;
+			break;
+		}
 	}
-	mutex_unlock(&core_lock);
+	mutex_unlock(&adap->userspace_clients_lock);
 
-	return count;
+	if (res < 0)
+		dev_err(dev, "%s: Can't find device in list\n",
+			"delete_device");
+	return res;
 }
 static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, S_IWUSR, NULL,
 				  delete_device_store);
@@ -1535,6 +1537,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->locked_flags = 0;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
+	mutex_init(&adap->userspace_clients_lock);
+	INIT_LIST_HEAD(&adap->userspace_clients);
 
 	/* Set default timeout to 1 second if not already set */
 	if (adap->timeout == 0)
@@ -1726,6 +1730,7 @@ static int __unregister_dummy(struct device *dev, void *dummy)
 void i2c_del_adapter(struct i2c_adapter *adap)
 {
 	struct i2c_adapter *found;
+	struct i2c_client *client, *next;
 
 	/* First make sure that this adapter was ever added */
 	mutex_lock(&core_lock);
@@ -1738,6 +1743,18 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
 	i2c_acpi_remove_space_handler(adap);
 
+	/* Remove devices instantiated from sysfs */
+	mutex_lock_nested(&adap->userspace_clients_lock,
+			  i2c_adapter_depth(adap));
+	list_for_each_entry_safe(client, next, &adap->userspace_clients,
+				 detected) {
+		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
+			client->addr);
+		list_del(&client->detected);
+		i2c_unregister_device(client);
+	}
+	mutex_unlock(&adap->userspace_clients_lock);
+
 	/* Detach any active clients. This can't fail, thus we do not
 	 * check the returned value. This is a two-pass process, because
 	 * we can't remove the dummy devices during the first pass: they
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index c31fd1dba3bd..4955d9e76c5f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -313,6 +313,8 @@ struct i2c_driver {
  * @dev: Driver model device node for the slave.
  * @init_irq: IRQ that was set at initialization
  * @irq: indicates the IRQ generated by this device (if any)
+ * @detected: member of an i2c_driver.clients list or i2c-core's
+ *	userspace_devices list
  * @slave_cb: Callback when I2C slave mode of an adapter is used. The adapter
  *	calls it to pass on slave events to the slave driver.
  * @devres_group_id: id of the devres group that will be created for resources
@@ -333,7 +335,6 @@ struct i2c_client {
 #define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
 #define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
 #define I2C_CLIENT_AUTO		0x100	/* client was auto-detected */
-#define I2C_CLIENT_USER		0x200	/* client was userspace-created */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
@@ -345,6 +346,7 @@ struct i2c_client {
 	struct device dev;		/* the device structure		*/
 	int init_irq;			/* irq set at initialization	*/
 	int irq;			/* irq issued by device		*/
+	struct list_head detected;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
@@ -751,6 +753,9 @@ struct i2c_adapter {
 	char name[48];
 	struct completion dev_released;
 
+	struct mutex userspace_clients_lock;
+	struct list_head userspace_clients;
+
 	struct i2c_bus_recovery_info *bus_recovery_info;
 	const struct i2c_adapter_quirks *quirks;
 
-- 
2.45.2


