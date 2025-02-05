Return-Path: <linux-i2c+bounces-9304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB4A28C35
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200081883C0F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 13:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936D714F9E7;
	Wed,  5 Feb 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KSWVXWtK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D4C14A088
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763194; cv=none; b=gnzFFq/bdvgUXu5o5PLSttzpUUxkiZnxdEZoAplsa6Dl9sgI+vbUi0Frj7q4Tnsegn0ZZd6h6+hEET2+oOpQpSQwHkcX7HAnXhOdtW4T3/8+jU1nsMpMRTS0rZBir0eLSxDD/Ok/G3YYN6M5CTmmoTe6075sVGRw4UW5jGR+xoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763194; c=relaxed/simple;
	bh=vnPp5lLHj8ZsK5IUwJHRCJtn3kh/vC+b+JXII13iIw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4yiEK3zMccr0aj0z2x/XAFiH9NH8eY8lNyxBoEFdvIuzKVrQt+PasnjbkbvwaC9wkZiLRsamANsXCy+T2BbfwpymtuZqppi48AIhUvkZpyQ4amSbU/hepdXtP57wwn/iSrn3eBlz0G5CQw75DEj6VxVzOByrRBD2roexWqagJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KSWVXWtK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oQv9sXf6+EsztDBva31BK2v1ZX49PiPczM/j+QJVeKs=; b=KSWVXW
	tKpT/nGyjBgcdgaIUkhuCjxcoK39oA/HWwpOeiJMWmVSustRaZYWNudE9d6asQAJ
	WrWmeS249bFPrutxoNMGkr6B35UJiM0+kL2hBoJMG+ggu+GH7j79jtcH+48MQ/Du
	XtL4LMOVNwD4SyJ91tnN2IkRiU6/XMaUpuchioQLSzLEfHfxPKwJMaL0xwaZoiBd
	AI57pB1kgLnKFnV5uYt53q5Qvl2fbpZHbB2tmcV7rnQnBWmatR2rK9aec4+rR/nA
	yc+6kegHgnZf4V8bG9svWDlEI+mEb4KUkkifLYtEkG4K/vd8PS9i9XhRLezgROEg
	+3neaWpbFg5MIOIw==
Received: (qmail 3407812 invoked from network); 5 Feb 2025 14:46:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 14:46:29 +0100
X-UD-Smtp-Session: l3s3148p1@d4wzWmUt6IltK/OC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] Revert "i2c: Replace list-based mechanism for handling auto-detected clients"
Date: Wed,  5 Feb 2025 14:42:27 +0100
Message-ID: <20250205134623.6921-3-wsa+renesas@sang-engineering.com>
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

This reverts commit 56a50667cbcfaf95eea9128d5676af94e54b51a8. Mux
handling is not sufficiently implemented. It needs more time.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 52 +++++++++++++++++++++++++------------
 include/linux/i2c.h         |  3 ++-
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ddac2f155718..35a221e2c11c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1704,6 +1704,23 @@ int i2c_add_numbered_adapter(struct i2c_adapter *adap)
 }
 EXPORT_SYMBOL_GPL(i2c_add_numbered_adapter);
 
+static void i2c_do_del_adapter(struct i2c_driver *driver,
+			      struct i2c_adapter *adapter)
+{
+	struct i2c_client *client, *_n;
+
+	/* Remove the devices we created ourselves as the result of hardware
+	 * probing (using a driver's detect method) */
+	list_for_each_entry_safe(client, _n, &driver->clients, detected) {
+		if (client->adapter == adapter) {
+			dev_dbg(&adapter->dev, "Removing %s at 0x%x\n",
+				client->name, client->addr);
+			list_del(&client->detected);
+			i2c_unregister_device(client);
+		}
+	}
+}
+
 static int __unregister_client(struct device *dev, void *dummy)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
@@ -1719,6 +1736,12 @@ static int __unregister_dummy(struct device *dev, void *dummy)
 	return 0;
 }
 
+static int __process_removed_adapter(struct device_driver *d, void *data)
+{
+	i2c_do_del_adapter(to_i2c_driver(d), data);
+	return 0;
+}
+
 /**
  * i2c_del_adapter - unregister I2C adapter
  * @adap: the adapter being unregistered
@@ -1742,6 +1765,11 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	}
 
 	i2c_acpi_remove_space_handler(adap);
+	/* Tell drivers about this removal */
+	mutex_lock(&core_lock);
+	bus_for_each_drv(&i2c_bus_type, NULL, adap,
+			       __process_removed_adapter);
+	mutex_unlock(&core_lock);
 
 	/* Remove devices instantiated from sysfs */
 	mutex_lock_nested(&adap->userspace_clients_lock,
@@ -1760,10 +1788,8 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	 * we can't remove the dummy devices during the first pass: they
 	 * could have been instantiated by real devices wishing to clean
 	 * them up properly, so we give them a chance to do that first. */
-	mutex_lock(&core_lock);
 	device_for_each_child(&adap->dev, NULL, __unregister_client);
 	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
-	mutex_unlock(&core_lock);
 
 	/* device name is gone after device_unregister */
 	dev_dbg(&adap->dev, "adapter [%s] unregistered\n", adap->name);
@@ -1983,6 +2009,7 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 	/* add the driver to the list of i2c drivers in the driver core */
 	driver->driver.owner = owner;
 	driver->driver.bus = &i2c_bus_type;
+	INIT_LIST_HEAD(&driver->clients);
 
 	/* When registration returns, the driver core
 	 * will have called probe() for all matching-but-unbound devices.
@@ -2000,13 +2027,10 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 }
 EXPORT_SYMBOL(i2c_register_driver);
 
-static int __i2c_unregister_detected_client(struct device *dev, void *argp)
+static int __process_removed_driver(struct device *dev, void *data)
 {
-	struct i2c_client *client = i2c_verify_client(dev);
-
-	if (client && client->flags & I2C_CLIENT_AUTO)
-		i2c_unregister_device(client);
-
+	if (dev->type == &i2c_adapter_type)
+		i2c_do_del_adapter(data, to_i2c_adapter(dev));
 	return 0;
 }
 
@@ -2017,12 +2041,7 @@ static int __i2c_unregister_detected_client(struct device *dev, void *argp)
  */
 void i2c_del_driver(struct i2c_driver *driver)
 {
-	mutex_lock(&core_lock);
-	/* Satisfy __must_check, function can't fail */
-	if (driver_for_each_device(&driver->driver, NULL, NULL,
-				   __i2c_unregister_detected_client)) {
-	}
-	mutex_unlock(&core_lock);
+	i2c_for_each_dev(driver, __process_removed_driver);
 
 	driver_unregister(&driver->driver);
 	pr_debug("driver [%s] unregistered\n", driver->driver.name);
@@ -2449,7 +2468,6 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 	/* Finally call the custom detection function */
 	memset(&info, 0, sizeof(struct i2c_board_info));
 	info.addr = addr;
-	info.flags = I2C_CLIENT_AUTO;
 	err = driver->detect(temp_client, &info);
 	if (err) {
 		/* -ENODEV is returned if the detection fails. We catch it
@@ -2476,7 +2494,9 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 		dev_dbg(&adapter->dev, "Creating %s at 0x%02x\n",
 			info.type, info.addr);
 		client = i2c_new_client_device(adapter, &info);
-		if (IS_ERR(client))
+		if (!IS_ERR(client))
+			list_add_tail(&client->detected, &driver->clients);
+		else
 			dev_err(&adapter->dev, "Failed creating %s at 0x%02x\n",
 				info.type, info.addr);
 	}
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 4955d9e76c5f..2b2af24d2a43 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -244,6 +244,7 @@ enum i2c_driver_flags {
  * @id_table: List of I2C devices supported by this driver
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
+ * @clients: List of detected clients we created (for i2c-core use only)
  * @flags: A bitmask of flags defined in &enum i2c_driver_flags
  *
  * The driver.owner field should be set to the module owner of this driver.
@@ -298,6 +299,7 @@ struct i2c_driver {
 	/* Device detection callback for automatic device creation */
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
+	struct list_head clients;
 
 	u32 flags;
 };
@@ -334,7 +336,6 @@ struct i2c_client {
 #define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
 #define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
 #define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
-#define I2C_CLIENT_AUTO		0x100	/* client was auto-detected */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
-- 
2.45.2


