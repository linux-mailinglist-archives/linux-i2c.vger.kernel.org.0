Return-Path: <linux-i2c+bounces-5703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5AE95BF18
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 21:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065761C23256
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 19:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA91F1D0DE6;
	Thu, 22 Aug 2024 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtQ9G6RK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCA61D0DD8;
	Thu, 22 Aug 2024 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356089; cv=none; b=alCnXpCY2N3CB30mOQ3NbBg8iZfGGAzwXXr9LgvSlghdMHos8cvWwi88x4kF4Ds1C6G8szFy4Arjc06x5cSx+ZqxmeHN0QlOh6NVB+F4tVYTsy0kvNr4jZkLVAp/JnwPM1NIcAmFPx9QIyU1wl2gDw8+z6G+fdiKAzkIjOAIHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356089; c=relaxed/simple;
	bh=tB49lS8rz9WhTn6BCv/z0G8fDNKWjK6d9QB9jnbaVbw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p9+/2Kk7Zf2pB2zifx9WNkgEbbYzQ5axHh9WBaF1xNnYmTgSorLHaEaD5GcJnRS5EYUuPNj4EYnq0gc81rY/pZEUvpxuq5HnstcHgRIG/4pFU7ICXxbveNCd75Ub1EXUUvlKW0KeFoxpPBfpwW9jUkMOSWEp1/nwowS0enJN6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtQ9G6RK; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f406034874so11443621fa.1;
        Thu, 22 Aug 2024 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724356086; x=1724960886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oljDWS3/G7+4zgM6pU0BdufbuPL7s7mviXiM5w+t40Y=;
        b=VtQ9G6RKmxL0RWbw8lMOXd7WOSwQebR6seY+o/BvCW+9p1HpghRWEVfbyotUrdQoNc
         h4PMNDfLT1UWOJGdwDKwKqJivVA26zpXvIO2TVwl42hUUNkLN7fN1ljRSvBrEOY8b5jc
         efbOxLIasl3eOaHFZRXk8CBUFURHqHUGOfQkpprri6sCDMZjel5oTG0B9ml/mhnV20Vt
         gz8FQwmisH/RS/P3wE3GAkCqn+Amx+TNRXCdmS9OI2eGZ78puOtu7V4JFBt6syR+SE2j
         Wpqz+DSZ7fnXT2o1vERWxS6/VFgezVMupbMUXrB/SVxld86AAY27sb0N2f1ThiIf8eav
         27mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724356086; x=1724960886;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oljDWS3/G7+4zgM6pU0BdufbuPL7s7mviXiM5w+t40Y=;
        b=IBBqzDYiNHukQzhOVj1Y6HuSf4J7dZoS/dgRCwt5Mj+g2eCB4zHRXZK4dOtFtudkPA
         DF818LwXrxHOzFL7Du0PlxyEu7Kw3MkVtO9JlM3CRoiq8VnA+z0oslLmT5FyweKA0WYY
         EBnLe0J7sgrnun928D7xSnJ0xknJeD/G1t386Y+qSOnbx+nLJ8qW+Fcll3YXDU3uMqr4
         /JKZk/L66HsHcnhUjnsaF5plznZU6714yGp7j+WrPd4RgaBotpMZjxXuBDnGaRMEute1
         afmVvcxbjfjruAdpPmFdJaf4EidbRS8xcrKbL5YwkiJALNXzT/F8ruF9a7Asc9spHAsC
         Osfw==
X-Forwarded-Encrypted: i=1; AJvYcCVNj/juW+Cq/WxzY7DRwkhiv+NGxXZpv+jlI+EAXCVaQsZtY5c/ff97kqMUMmGzHfqJE3qlsqZUs7rUYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBP/cV0QCfTSL+7+q/M13j3SRt5SefImuF3VvVQjBWdD/0v9KM
	CS5/zhUHG5EZpxHwF+yxo+4jnifZC5ZedjR/z7Fma82kzymeU1Ak
X-Google-Smtp-Source: AGHT+IETAM+1UTvJEScSDpmSdBXMloY+BRruOEFtwQndCDye50PqQLnxBt0voYyBx90zw7yhxqpQAw==
X-Received: by 2002:a2e:bc18:0:b0:2ef:1784:a20 with SMTP id 38308e7fff4ca-2f4f4938683mr686241fa.38.1724356085589;
        Thu, 22 Aug 2024 12:48:05 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3? (dynamic-2a02-3100-9dc4-2200-e9ea-53e6-39db-eab3.310.pool.telefonica.de. [2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0515a96d0sm1246839a12.86.2024.08.22.12.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 12:48:05 -0700 (PDT)
Message-ID: <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>
Date: Thu, 22 Aug 2024 21:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
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
 drivers/i2c/i2c-core-base.c | 48 ++++++++++---------------------------
 include/linux/i2c.h         |  3 +--
 2 files changed, 13 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 79292bb33..ea76007ea 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1662,23 +1662,6 @@ int i2c_add_numbered_adapter(struct i2c_adapter *adap)
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
@@ -1694,12 +1677,6 @@ static int __unregister_dummy(struct device *dev, void *dummy)
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
@@ -1723,11 +1700,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	}
 
 	i2c_acpi_remove_space_handler(adap);
-	/* Tell drivers about this removal */
-	mutex_lock(&core_lock);
-	bus_for_each_drv(&i2c_bus_type, NULL, adap,
-			       __process_removed_adapter);
-	mutex_unlock(&core_lock);
 
 	/* Remove devices instantiated from sysfs */
 	mutex_lock_nested(&adap->userspace_clients_lock,
@@ -1967,7 +1939,6 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
 	/* add the driver to the list of i2c drivers in the driver core */
 	driver->driver.owner = owner;
 	driver->driver.bus = &i2c_bus_type;
-	INIT_LIST_HEAD(&driver->clients);
 
 	/* When registration returns, the driver core
 	 * will have called probe() for all matching-but-unbound devices.
@@ -1985,10 +1956,13 @@ int i2c_register_driver(struct module *owner, struct i2c_driver *driver)
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
 
@@ -1999,7 +1973,10 @@ static int __process_removed_driver(struct device *dev, void *data)
  */
 void i2c_del_driver(struct i2c_driver *driver)
 {
-	i2c_for_each_dev(driver, __process_removed_driver);
+	/* Satisfy __must_check, function can't fail */
+	if (driver_for_each_device(&driver->driver, NULL, NULL,
+				   __i2c_unregister_detected_client)) {
+	}
 
 	driver_unregister(&driver->driver);
 	pr_debug("driver [%s] unregistered\n", driver->driver.name);
@@ -2426,6 +2403,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 	/* Finally call the custom detection function */
 	memset(&info, 0, sizeof(struct i2c_board_info));
 	info.addr = addr;
+	info.flags = I2C_CLIENT_AUTO;
 	err = driver->detect(temp_client, &info);
 	if (err) {
 		/* -ENODEV is returned if the detection fails. We catch it
@@ -2452,9 +2430,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
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
index 377def497..910a9b259 100644
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
2.46.0



