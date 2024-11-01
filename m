Return-Path: <linux-i2c+bounces-7738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DD9B9AAA
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17DE31F21E99
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 22:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2399F1E5718;
	Fri,  1 Nov 2024 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP/UTMjP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750B140E34;
	Fri,  1 Nov 2024 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730499104; cv=none; b=HU3olGHfZ1ATk/Py+D/k/rA2Ei37TqCm6fHceyNJPARiBS3k8tCt3WpOuzVM6gw/tTxshf7m9pTBwE7DaHct0LIjjqGs8xLEbFoKCER5zRs1Ji/ny8XNmtDBA7Rx/+DxCw2DeeE8wlGuwPfQzIQfXd5Oz5szWG46MZgzXsrhC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730499104; c=relaxed/simple;
	bh=OuSZ+E81WdF/LSy/5Haov+3JOJKWzrfSxa/YANPqTrY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ERPgWh7pqreGCrLx7mbu83sbRInZGLFG9GuacDr8djWGOq7itRzaO1rTp6Sq9UvmdBnKlB1UD8Sf/bhLcf8FRjBB2u+8RrTjXJh2NvwphoHkMmMuCFsXA1dyYpHsVMv9MplpHers/ause3qDWN9/3UGow0/kLUNTVfQcSOzhWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP/UTMjP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9932aa108cso369399766b.2;
        Fri, 01 Nov 2024 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730499101; x=1731103901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wsl5aHTkWjcFQnTYdMiQzuW4t99GFUFvR1z99NrMSdc=;
        b=AP/UTMjP92CRXIPktKHkfz/im+yOzhsIKZEXH77HHMr5HHX8BwpooqFZgjVKV+FaHm
         yK4MVR53u05n9ngupzKoo3NA/MLzRvbDi/39GzQ0ywqd070VtXRZmwjn3dyBoOcouRz1
         RvB3Qua43ux+Azs617X3Ecqd4rgkHfsuijR4INXTC910f42vEWPP01PLqNrF/y02zr+J
         u6m/p/RJybh+tWZnPqSp1MLsNagX4J7ImJssl+iCOUB101uxp5T3OcFl9U14sGhYW2BM
         JKxPNIg2wpIrlHIdLpnuTyIrGYTPpdeSZ+6e8J7EJTCK+LzDWGpmq8SgZnPOIEvzeNIF
         0Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730499101; x=1731103901;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsl5aHTkWjcFQnTYdMiQzuW4t99GFUFvR1z99NrMSdc=;
        b=uEh++FpiTLnJz7bT4DyzvZPB9hkR85oAW7bwPZwhL7pkd0LajUJ9rT0Zreajy0hjvX
         8nrPmmweGqO5IomvMOSmtVaLeCxj79bEddBhNSjhskdQCBiUdWQBzeO+zOWganDeWAp3
         5ZV8AP2FcqBQtW07ICxuLX9Yids1UY9AwmYNFTvGcVTKKZI6yvsR4juC7yZtIjSgdjQt
         moWcxX/l7GkcMRSJpMNKCmAuOrpsj7fNLY2OiKZM2ScQNB6MObPx+3VmGHbSYPsVjRVw
         ZEipqcP4RYxCP1/IagwyqDFgqVah+mfa5Tr1pZU5O4/BDwN85DjLZXgZWcIKKvu0S9KP
         ERVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwg9hM4Vy6ao7IJx2+JfuQcX1ResPYXAQ0PjFJ4CMcqXkPofWjorT1N3lLwF/0TwVUj+9qacuYF2T68Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGIN0IZUV+C2JqgN6o4r4RzHfDWMNoknKKv6WpjYZukhFMOZJ
	YSUVon3xUY7t6jaPT2hFxIj8Sk5oVOId3LZgBSk6vDOl4Qy5OtDr
X-Google-Smtp-Source: AGHT+IHZfPate37Y0Aqa+ckCgEtZLWUK1t4xByQjdvShldkTK8Aqw8zBLrt5hIUyoracz7FxzSSV0A==
X-Received: by 2002:a17:907:3f2a:b0:a9a:4cf:5cea with SMTP id a640c23a62f3a-a9e50cace53mr820237966b.54.1730499101253;
        Fri, 01 Nov 2024 15:11:41 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9e565dfa80sm234035566b.130.2024.11.01.15.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:11:40 -0700 (PDT)
Message-ID: <122c72c5-3bae-4c60-ad53-d8b4061db30d@gmail.com>
Date: Fri, 1 Nov 2024 23:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/4] i2c: Replace list-based mechanism for handling
 userspace-created clients
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

Similar to the list of auto-detected clients, we can also replace the
list of userspace-created clients with flagging such client devices.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- protect client unregistration with core_lock mutex
---
 drivers/i2c/i2c-core-base.c | 61 +++++++++++++++----------------------
 include/linux/i2c.h         |  1 +
 2 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 42c62839d..15397cfaa 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1293,14 +1293,12 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 		info.flags |= I2C_CLIENT_SLAVE;
 	}
 
+	info.flags |= I2C_CLIENT_USER;
+
 	client = i2c_new_client_device(adap, &info);
 	if (IS_ERR(client))
 		return PTR_ERR(client);
 
-	/* Keep track of the added device */
-	mutex_lock(&adap->userspace_clients_lock);
-	list_add_tail(&client->detected, &adap->userspace_clients);
-	mutex_unlock(&adap->userspace_clients_lock);
 	dev_info(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
 		 info.type, info.addr);
 
@@ -1308,6 +1306,15 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_WO(new_device);
 
+static int __i2c_find_user_addr(struct device *dev, void *addrp)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	unsigned short addr = *(unsigned short *)addrp;
+
+	return client && client->flags & I2C_CLIENT_USER &&
+	       i2c_encode_flags_to_addr(client) == addr;
+}
+
 /*
  * And of course let the users delete the devices they instantiated, if
  * they got it wrong. This interface can only be used to delete devices
@@ -1322,7 +1329,8 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		    const char *buf, size_t count)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	struct i2c_client *client, *next;
+	struct i2c_client *client;
+	struct device *child_dev;
 	unsigned short addr;
 	char end;
 	int res;
@@ -1338,28 +1346,20 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
+	mutex_lock (&core_lock);
 	/* Make sure the device was added through sysfs */
-	res = -ENOENT;
-	mutex_lock_nested(&adap->userspace_clients_lock,
-			  i2c_adapter_depth(adap));
-	list_for_each_entry_safe(client, next, &adap->userspace_clients,
-				 detected) {
-		if (i2c_encode_flags_to_addr(client) == addr) {
-			dev_info(dev, "%s: Deleting device %s at 0x%02hx\n",
-				 "delete_device", client->name, client->addr);
-
-			list_del(&client->detected);
-			i2c_unregister_device(client);
-			res = count;
-			break;
-		}
+	child_dev = device_find_child(&adap->dev, &addr, __i2c_find_user_addr);
+	if (!child_dev) {
+		mutex_unlock (&core_lock);
+		dev_err(dev, "Can't find userspace-created device at %#x\n", addr);
+		return -ENOENT;
 	}
-	mutex_unlock(&adap->userspace_clients_lock);
+	client = i2c_verify_client(child_dev);
+	i2c_unregister_device(client);
+	put_device(child_dev);
+	mutex_unlock (&core_lock);
 
-	if (res < 0)
-		dev_err(dev, "%s: Can't find device in list\n",
-			"delete_device");
-	return res;
+	return count;
 }
 static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, S_IWUSR, NULL,
 				  delete_device_store);
@@ -1722,7 +1722,6 @@ static int __unregister_dummy(struct device *dev, void *dummy)
 void i2c_del_adapter(struct i2c_adapter *adap)
 {
 	struct i2c_adapter *found;
-	struct i2c_client *client, *next;
 
 	/* First make sure that this adapter was ever added */
 	mutex_lock(&core_lock);
@@ -1735,18 +1734,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
 	i2c_acpi_remove_space_handler(adap);
 
-	/* Remove devices instantiated from sysfs */
-	mutex_lock_nested(&adap->userspace_clients_lock,
-			  i2c_adapter_depth(adap));
-	list_for_each_entry_safe(client, next, &adap->userspace_clients,
-				 detected) {
-		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
-			client->addr);
-		list_del(&client->detected);
-		i2c_unregister_device(client);
-	}
-	mutex_unlock(&adap->userspace_clients_lock);
-
 	/* Detach any active clients. This can't fail, thus we do not
 	 * check the returned value. This is a two-pass process, because
 	 * we can't remove the dummy devices during the first pass: they
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index c4c8e841a..376136b18 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -333,6 +333,7 @@ struct i2c_client {
 #define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
 #define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
 #define I2C_CLIENT_AUTO		0x100	/* for board_info; auto-detected */
+#define I2C_CLIENT_USER		0x200	/* for board_info; userspace-created */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
-- 
2.47.0



