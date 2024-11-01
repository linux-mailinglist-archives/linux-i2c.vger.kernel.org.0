Return-Path: <linux-i2c+bounces-7737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D29B9AA7
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13CC1C20D7A
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 22:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEF31E3760;
	Fri,  1 Nov 2024 22:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARp5tbp8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289ED140E34;
	Fri,  1 Nov 2024 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730498997; cv=none; b=Xj2IKse4Ob+bZdYTY+RPJexIeTOpP+5cXH+taGh1LNAQ1ia643KA2285gQ0wwGC3T7hd3T4v/G54oL5Gpf8n2vQ9oPrhNEXdV7Yc7gzDrM2dra3zB76+A1gyAAtQFKCSDa68hA7grfuNvzcKpY0sjY4sKMDBp6uRd2XnQp9rZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730498997; c=relaxed/simple;
	bh=GY/Tp13bCnZUirZZ62QGdtbmCk36m0vbZ/fhKd65/fE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SkiwFhAcptybrcLwf7WDjGO4CIfR2SSqKsNDBOEGFi9iQu0mHJ8mzu/UxWCbXvS32pG8rbxHzQE6eu5MKfuPUb6lrXpJCkhP/VFNQp/wkfMvu+ofvLoPVusJBgCJdFzmUPvYua1U6upv2wW2Esxcv7yDV1p/5MLi7c9m+BdHLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARp5tbp8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a156513a1so394880466b.0;
        Fri, 01 Nov 2024 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730498993; x=1731103793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmzks9voy7g4XG43J0mesHi+7q1nCR+8ONL1iVF7v8A=;
        b=ARp5tbp8tWeZytli5j24ahJntEXA91xYy6Ti+YAST+67ZSo5aqW0U7OtIH89FKS+4G
         7oYmbbxx8VHlcNsveB/5lEnfGano3V4rM2V0szLnC7W7OEvbEeJfwlHQM47hpTs9QVfc
         H3jx0ge+ULd3s0wjfjZ4CX+hYu504PXAmFGqkBzxkAc3ke9S/UuULB8xq7nlpGmgTzRX
         6tPAOZWljxl88QsTAPLMjAIkdBR9wSoK2ywIeycojzuqNPv2+2CkEdgttkborBur7yeD
         Y/5AdGH19uy5SWs8ZQfgq86AUlRcSwmC404jO3hMLS2rON0EYgakyLrWMynZ6E/4R3Wj
         6k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730498993; x=1731103793;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qmzks9voy7g4XG43J0mesHi+7q1nCR+8ONL1iVF7v8A=;
        b=sFpjfu5tJNVqy5q+BV0D6t+a1yTjyD8wYHUwMC6Soqlmsno2tXrMWfyvgG/zCOlvFD
         DEF8ppbzkXvSSwTXXwzZwUju5khZPW9DbV4CPkKeBCvy5FBXj+h7UQVsm7s0tanAC7Ge
         G99tegyoy9YLeLhSyMm1Zd4IoJyWQ1+54QZo84NLB5OtkQ0xx10xZULLk3Mkgifzqnqm
         BApL9Q+zCQnEE3zOYKka+uS7R+sbYYcei9/srgCZECmgBYMGKYOcaozIXXnw59FENmsG
         VH/emgzymOqZqAjVJerc8eXk/1l/RfclORuOhcVH/TW0afukbd8wYKK08aAzMKWT7rbu
         CLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXefIxEZkvjc5SFFcNtTiTi0V0eRiIPBR9QlYOcCsXFVR6VxmEuIdfId9HoglXZzg911EzfdLZcxh0TAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzft8GptkQAtA63m9ze7QcWi6oXrHr4gJSN2RIeEzXbJrTLIWrw
	mf57Jyjr8wDD7hfGKJZbMke+YSrwzm2RcHIav8OP7bHAst4emU9u
X-Google-Smtp-Source: AGHT+IEvJxscl5Bf+o7qVzxHR0D2c7D/R+oT8whCgFJIOXQteRJ2D5V4J1Oyi0zoBHHEuT4gkfJBeA==
X-Received: by 2002:a17:907:9615:b0:a99:f7df:b20a with SMTP id a640c23a62f3a-a9de633636cmr2293415766b.62.1730498993204;
        Fri, 01 Nov 2024 15:09:53 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9e566437c9sm232590066b.160.2024.11.01.15.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:09:52 -0700 (PDT)
Message-ID: <ad839a82-8694-4f99-b1c1-0ee53c9d40cf@gmail.com>
Date: Fri, 1 Nov 2024 23:09:51 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

So far a list is used to track auto-detected clients per driver.
The same functionality can be achieved much simpler by flagging
auto-detected clients.

Two notes regarding the usage of driver_for_each_device:
In our case it can't fail, however the function is annotated __must_check.
So a little workaround is needed to avoid a compiler warning.
Then we may remove nodes from the list over which we iterate.
This is safe, see the explanation at the beginning of lib/klist.c.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- protect client removal with core_lock mutex
---
 drivers/i2c/i2c-core-base.c | 52 ++++++++++++-------------------------
 include/linux/i2c.h         |  3 +--
 2 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7c810893b..42c62839d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1696,23 +1696,6 @@ int i2c_add_numbered_adapter(struct i2c_adapter *adap)
 }
 EXPORT_SYMBOL_GPL(i2c_add_numbered_adapter);
 
-static void i2c_do_del_adapter(struct i2c_driver *driver,
-			      struct i2c_adapter *adapter)
-{
-	struct i2c_client *client, *_n;
-
-	/* Remove the devices we created ourselves as the result of hardware
-	 * probing (using a driver's detect method) */
-	list_for_each_entry_safe(client, _n, &driver->clients, detected) {
-		if (client->adapter == adapter) {
-			dev_dbg(&adapter->dev, "Removing %s at 0x%x\n",
-				client->name, client->addr);
-			list_del(&client->detected);
-			i2c_unregister_device(client);
-		}
-	}
-}
-
 static int __unregister_client(struct device *dev, void *dummy)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
@@ -1728,12 +1711,6 @@ static int __unregister_dummy(struct device *dev, void *dummy)
 	return 0;
 }
 
-static int __process_removed_adapter(struct device_driver *d, void *data)
-{
-	i2c_do_del_adapter(to_i2c_driver(d), data);
-	return 0;
-}
-
 /**
  * i2c_del_adapter - unregister I2C adapter
  * @adap: the adapter being unregistered
@@ -1757,11 +1734,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	}
 
 	i2c_acpi_remove_space_handler(adap);
-	/* Tell drivers about this removal */
-	mutex_lock(&core_lock);
-	bus_for_each_drv(&i2c_bus_type, NULL, adap,
-			       __process_removed_adapter);
-	mutex_unlock(&core_lock);
 
 	/* Remove devices instantiated from sysfs */
 	mutex_lock_nested(&adap->userspace_clients_lock,
@@ -1780,8 +1752,10 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	 * we can't remove the dummy devices during the first pass: they
 	 * could have been instantiated by real devices wishing to clean
 	 * them up properly, so we give them a chance to do that first. */
+	mutex_lock(&core_lock);
 	device_for_each_child(&adap->dev, NULL, __unregister_client);
 	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
+	mutex_unlock(&core_lock);
 
 	/* device name is gone after device_unregister */
 	dev_dbg(&adap->dev, "adapter [%s] unregistered\n", adap->name);
@@ -2001,7 +1975,6 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 	/* add the driver to the list of i2c drivers in the driver core */
 	driver->driver.owner = owner;
 	driver->driver.bus = &i2c_bus_type;
-	INIT_LIST_HEAD(&driver->clients);
 
 	/* When registration returns, the driver core
 	 * will have called probe() for all matching-but-unbound devices.
@@ -2019,10 +1992,13 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 }
 EXPORT_SYMBOL(i2c_register_driver);
 
-static int __process_removed_driver(struct device *dev, void *data)
+static int __i2c_unregister_detected_client(struct device *dev, void *argp)
 {
-	if (dev->type == &i2c_adapter_type)
-		i2c_do_del_adapter(data, to_i2c_adapter(dev));
+	struct i2c_client *client = i2c_verify_client(dev);
+
+	if (client && client->flags & I2C_CLIENT_AUTO)
+		i2c_unregister_device(client);
+
 	return 0;
 }
 
@@ -2033,7 +2009,12 @@ static int __process_removed_driver(struct device *dev, void *data)
  */
 void i2c_del_driver(struct i2c_driver *driver)
 {
-	i2c_for_each_dev(driver, __process_removed_driver);
+	mutex_lock(&core_lock);
+	/* Satisfy __must_check, function can't fail */
+	if (driver_for_each_device(&driver->driver, NULL, NULL,
+				   __i2c_unregister_detected_client)) {
+	}
+	mutex_unlock(&core_lock);
 
 	driver_unregister(&driver->driver);
 	pr_debug("driver [%s] unregistered\n", driver->driver.name);
@@ -2460,6 +2441,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 	/* Finally call the custom detection function */
 	memset(&info, 0, sizeof(struct i2c_board_info));
 	info.addr = addr;
+	info.flags = I2C_CLIENT_AUTO;
 	err = driver->detect(temp_client, &info);
 	if (err) {
 		/* -ENODEV is returned if the detection fails. We catch it
@@ -2486,9 +2468,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 		dev_dbg(&adapter->dev, "Creating %s at 0x%02x\n",
 			info.type, info.addr);
 		client = i2c_new_client_device(adapter, &info);
-		if (!IS_ERR(client))
-			list_add_tail(&client->detected, &driver->clients);
-		else
+		if (IS_ERR(client))
 			dev_err(&adapter->dev, "Failed creating %s at 0x%02x\n",
 				info.type, info.addr);
 	}
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 388ce71a2..c4c8e841a 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -244,7 +244,6 @@ enum i2c_driver_flags {
  * @id_table: List of I2C devices supported by this driver
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
- * @clients: List of detected clients we created (for i2c-core use only)
  * @flags: A bitmask of flags defined in &enum i2c_driver_flags
  *
  * The driver.owner field should be set to the module owner of this driver.
@@ -299,7 +298,6 @@ struct i2c_driver {
 	/* Device detection callback for automatic device creation */
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
-	struct list_head clients;
 
 	u32 flags;
 };
@@ -334,6 +332,7 @@ struct i2c_client {
 #define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
 #define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
 #define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
+#define I2C_CLIENT_AUTO		0x100	/* for board_info; auto-detected */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
-- 
2.47.0



