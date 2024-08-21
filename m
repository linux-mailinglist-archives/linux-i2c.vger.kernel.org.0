Return-Path: <linux-i2c+bounces-5634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B395A95A60C
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A4CB283100
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 20:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5FC1662E4;
	Wed, 21 Aug 2024 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+hhiKUF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533671531C2
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273220; cv=none; b=fi5rABVQ2WcyAXdRU7CPiDfJM4z9OZ2qnWmKyma2EIT2MRgw7pVAsIsApHylFtbTz1ICxXThnp5R07cD3izAlzxbGsDle8i4cXfMGzJq0RPQLkTGNOITk+yS+4MXehYhiNE1DQ/R4ze6EUQgsOAkXFCLfjUZ47nxQWQ0JGXbdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273220; c=relaxed/simple;
	bh=/ftD15TMkMDtA2uICd0ArWMufJ0qH80+HUtt5Ue2AzA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yx+JHtoH3uEDlMVsDLgEr4Mx8tKN0sjMjwmVK5vIFBhHMvGhypHPUOF8tK3yvb/pf6dy6OZbV2NjPwIQFZFmIZRY2MXmAkM/RioUPpFgyDUsa+bK9hX4ot6fNPK8BzuL8UB6TE9WMfq0tjVKYUYvVQNxvrdkSYDN6wPuXwtuuEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+hhiKUF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8682bb5e79so9496766b.2
        for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 13:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724273217; x=1724878017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FUcHbjcwB2shc8mKEGp6CYOM+QvPkIGA/Ohn38u7Kl0=;
        b=V+hhiKUF/baRGdYXhHghuTemLwNTtREQ9CEYv+/ydjtQbGSKfbk7r9z85dEAHGj52c
         RZCpLQBcHi/DOXLBWnwmCoDN+0xcvySWEs2wXYz+wS9eW0nUGTQGVy5aU7GAzBhlW3zJ
         h0R2Ouoqt82wSRAxvtO7N1qKZT8f7MscrbgcCW+/au8YKyloMcrImwDC0wm6E/cGk+RR
         K5SU0in1hyd5Ihf/iUASbEKWreIJyc2v/aWdAPbsHpFxdY/MlyFG7rt+SIlQSxQRuUk0
         8HmTjqJD6d8wVw/1VHWdPiONFBVcEP5a5P2hB8irncbOeXx5eYiH9N6OjAU0SBF1LvJM
         s6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724273217; x=1724878017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUcHbjcwB2shc8mKEGp6CYOM+QvPkIGA/Ohn38u7Kl0=;
        b=XtXFMgVOEBN9nFGtDNnnUz5N9i2dX2YfirMztFnAmFw1W8KgeI7PGP35n3ttSaKhAs
         11pPLbGSmAdDmJ4w4y1Nz4ZNThsu6iS+KaWOFvoX+Y22SMbcwZG+aeosqk4Z//l2Rv65
         YM1OXzWFvP1chQh/aAwd9YtkYX+lbvu5cQ8Yb7bYRW/bSWnaMBFYrLslSkHJpztDL5+y
         2mIwypficShWDb9V2DNL6cGQOisCNKebyFI+74MncVpvxLIjwt8ZELz9994P6qhaeDXc
         kF7hxlQRcANj+Xb8J9UH8T3+NaNZSk17QvrM/lp+ZFp37vPK0iQMPC8y38tjJlGIvUO8
         lWuA==
X-Gm-Message-State: AOJu0YzGmCoOmBdXf7ksvh4w2S92fMGYwIWUntyyXC6EGjDUyN9Sslb1
	Gn6Qe/OA1P9U3NP+zra6xTcPQWFwMkfFvx2pggKs3V153k0wx+KgJcwV2w==
X-Google-Smtp-Source: AGHT+IFhmqNS9Ot0a+gFlkKn/QHN4xbjIfNP2g1TStkslBi6pM2iKHu1PVMbFgiupGliol/0jWOwJQ==
X-Received: by 2002:a17:907:7fa1:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a866f8d9c68mr220914466b.52.1724273216104;
        Wed, 21 Aug 2024 13:46:56 -0700 (PDT)
Received: from ?IPV6:2a01:c22:76de:5100:1131:aa83:adfe:51dd? (dynamic-2a01-0c22-76de-5100-1131-aa83-adfe-51dd.c22.pool.telefonica.de. [2a01:c22:76de:5100:1131:aa83:adfe:51dd])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f220d2bsm9454366b.43.2024.08.21.13.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 13:46:55 -0700 (PDT)
Message-ID: <9eb8879b-f975-41fc-a098-0ad189cc583d@gmail.com>
Date: Wed, 21 Aug 2024 22:46:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] i2c: Replace list-based mechanism for handling
 auto-detected clients
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
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
index 79292bb33..549bb76b7 100644
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



