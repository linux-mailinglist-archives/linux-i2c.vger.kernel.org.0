Return-Path: <linux-i2c+bounces-5704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C97AB95BF1A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 21:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 258E5B24309
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 19:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EA91D0498;
	Thu, 22 Aug 2024 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6ar4+fa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7E1D048A;
	Thu, 22 Aug 2024 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356128; cv=none; b=EGzKXZC1IzcXvHz3OZdhEGmW8yL/kIrmGGQD84k8iUX4CfaQcZKrmOq85e2ZFoKAqmLlypecQhjvJIpgtCAS+X543qemWFcGI/lS0XTSbub1xFr3Z6u3pcDiFTnMvNRb2Be7UsdCc57ImkJA82wO8HtCXfjJvEpC2PjGw0tkNEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356128; c=relaxed/simple;
	bh=GT9G9PlEjwS2siJj8neJ+ZU7gflneEpzRUq5kKSvX1Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DO08P74QMJSC+1GZL30lzCqtVAdXwVdNOC1cocjKwaIroOMq8xVa1vQlZfFysh0HaQtl9DRO/hmLz/osV0UfMY0ysxBwyKkLPmdlv9hK2tfyilCw2eD23KchZN0/eakPkrKs26BEIOCDZ4d2sxng3HjqOD6aC1XtDITQkBOjTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6ar4+fa; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bef295a429so1726758a12.2;
        Thu, 22 Aug 2024 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724356125; x=1724960925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZuUljxKaLe48xfIx79Zide8oo3BUNNLwjgJ7TPm1dg=;
        b=b6ar4+faIvBAouTkeNmHt0sUwksp4uT7AOP+Ud/o5KIIr7J6+LqsjMFR9q7cVXftVA
         fRg3+ucCK2xqy+zePBzywq8DA8DOL8tTAekO4Qd9zGwI8bqqaAc0QDmZGcDouZSJIAeR
         0RszY79Bgwsr05T3BT0SvfrPdDxVjYI0DR1KaVgDMc/7ryqxKuBL63jeeerOW/ktYMOC
         1xWrKUKC4Yxs09AO9Gwh2rt7EleC6VYD/+BFNlRxs6tV0cP++Qlqlt5Ei6wzQgxTz0hD
         7BzmWXAF79H7ojd3UrxMdNRmOtlBXExegbeoKhE2hMPzU8LAeB5UC/cMJxITaYc0UOOC
         LZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724356125; x=1724960925;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZuUljxKaLe48xfIx79Zide8oo3BUNNLwjgJ7TPm1dg=;
        b=m4d+1JZFDUCJnMkv1TAvxlNM2qYS8gSBTAdKK1c4rN4wWKO9s0dfVIM5Bxen5veivc
         duGu2U18SZt9kcS7A0eT9X2Ad7GRx+/jsxKWmQ0IJnsnorCuVmPleO70RCk3nuEwUMjx
         eTRWJ5SoSr1OxWDPnWwGFaxEy2bEhj4SmJVpcmvegv2QOok67kpJ+TLfCJeUZC8K3g3w
         B3tAFP61Zz5D07uU8jAaK3T/EaLlvF/UUTHxqAc/cbYPdzRacGroLx/Dt0ekkp5FQE97
         nUa2DmKX/fWGyyEA6VXKcgtGk8VNUxU5iFqwbsJsrY/amKjR1u4p/aoON3C5oyotKrMl
         /WqA==
X-Forwarded-Encrypted: i=1; AJvYcCVUuksr5PkyyBFvz7sRKUw186pt+Qtas8u1tx1JVPyV6UZ49LAEuM1CuOILVeX+9WYcf+bZu5LWp8TLPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbNpabLr1/UADABJHDKF5IpXKZjShb0Q8+u7LPYnJZBga3lQ+
	LJk/KcMXuIbe72fRpoho8dht37EbTq5Je7r7MdgcqjXBKD00P8Ds
X-Google-Smtp-Source: AGHT+IGWXkIBhj0Rfoq/eVB8rLfm7JiBepUKe59CP4pAJyvZMNC0zDPRPDdc08Nrv75SVE8lOScx1w==
X-Received: by 2002:a17:906:fe03:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a866f12524cmr502774466b.6.1724356124934;
        Thu, 22 Aug 2024 12:48:44 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3? (dynamic-2a02-3100-9dc4-2200-e9ea-53e6-39db-eab3.310.pool.telefonica.de. [2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f436bb8sm157151466b.131.2024.08.22.12.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 12:48:44 -0700 (PDT)
Message-ID: <22997d09-4406-4c0b-8ed6-74dacc160acb@gmail.com>
Date: Thu, 22 Aug 2024 21:48:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/4] i2c: Replace list-based mechanism for handling
 userspace-created clients
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

Similarly to the list of auto-detected clients, we can also replace the
list of userspace-created clients with flagging such client devices.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 58 ++++++++++++++-----------------------
 include/linux/i2c.h         |  1 +
 2 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ea76007ea..15281c58a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1265,14 +1265,12 @@ new_device_store(struct device *dev, struct device_attribute *attr,
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
 
@@ -1280,6 +1278,15 @@ new_device_store(struct device *dev, struct device_attribute *attr,
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
@@ -1294,7 +1301,8 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		    const char *buf, size_t count)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
-	struct i2c_client *client, *next;
+	struct i2c_client *client;
+	struct device *child_dev;
 	unsigned short addr;
 	char end;
 	int res;
@@ -1311,27 +1319,16 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 	}
 
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
+		dev_err(dev, "Can't find userspace-created device at %#x\n", addr);
+		return -ENOENT;
 	}
-	mutex_unlock(&adap->userspace_clients_lock);
+	client = i2c_verify_client(child_dev);
+	i2c_unregister_device(client);
+	put_device(child_dev);
 
-	if (res < 0)
-		dev_err(dev, "%s: Can't find device in list\n",
-			"delete_device");
-	return res;
+	return count;
 }
 static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, S_IWUSR, NULL,
 				  delete_device_store);
@@ -1688,7 +1685,6 @@ static int __unregister_dummy(struct device *dev, void *dummy)
 void i2c_del_adapter(struct i2c_adapter *adap)
 {
 	struct i2c_adapter *found;
-	struct i2c_client *client, *next;
 
 	/* First make sure that this adapter was ever added */
 	mutex_lock(&core_lock);
@@ -1701,18 +1697,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
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
index 910a9b259..ba2564fe4 100644
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
2.46.0



