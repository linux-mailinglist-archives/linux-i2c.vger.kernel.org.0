Return-Path: <linux-i2c+bounces-9307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C74A28C6F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA3761887A17
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1846E1494DF;
	Wed,  5 Feb 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLtcnZkU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C1E132111
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763372; cv=none; b=Rl7X2pO9IPGTwMIPv8QdYNEoUrsfpFDZnGJyJL6v4bh8zBDYTdxS/RW8clbEZ2eCBvbus9vS/39M1gTLdUEpuMzNn+0NGXJ0NsNQ024W2R7XvrvUBtANSBsD86DHN4ERvE8B7qDzIwYhgjoVZE3dQNGyn7chino53mKPs4VyilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763372; c=relaxed/simple;
	bh=Kuh0OUY8JDYOhMFxSBxsB68Eo8nOHXYwFx+ivgPod80=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gZB2rfbktHwJwkrM6SE+Z4uziqc2mmOa3pUiQw7Ta4vMFdDYebNKPORaAEpU8MonBV3YCu6aWYSHVbwR7W+vSGmVfggW0zx7rKT6Y3aZELlBJ3R3jsd9QY/USXeWr7k0hKcVwg2+ipZUnQ5P+hcUPTdqibCa7twz5IEKYYXBHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLtcnZkU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso48157705e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 05 Feb 2025 05:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738763369; x=1739368169; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hai0JcsI7nc7J2PJoZdXgK0K99BcBP9VfCMiOJBtjFU=;
        b=iLtcnZkUZ7ZVCywmt4L+HMT5nhQQktQYLplmyaP+93sEplD1dEg7b6HJKWZXjElmmL
         s4AgTFzBdTry7govTvMn4EYuitX7p6U8+dvvI6MtEeXJTtLzi7HBUoJBdNU6lnTs0VsI
         VR4n8t7iRCytXTC9DEjXcm6PU66/wy19CRVaBj357UddJohi8iDnpfgLnW1CFf4CR4TM
         JDo3s5c+3Hsh/9E0svd8ibjszzvKpd4d6rMb4Pfm5v11l1oHYy1Mfr1TEfkeflHJ2ido
         ALrKXHOOtNN29q04SDdgAkb5FIEW+/FI50RRxC/dIqGfITlZ651lk+673iBUEMeO6dWg
         WL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738763369; x=1739368169;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hai0JcsI7nc7J2PJoZdXgK0K99BcBP9VfCMiOJBtjFU=;
        b=b96e20KpC/PIpkv5BVR8V9UoF9gv4gGWQkJAbhY2lQQiFtx+ThFuOTklPr4XEkSfTk
         Q5T9pMIrbEJ1NxIKwqWy+dhpyUWlxr/yt44nMSxUHUM4S5YX6n4Q4t/YnIYsNVC0YZ7e
         NF+2bdejQcmdbGg1lUNQdiIJhqe6yG/SPDte+h18Jn8t7pPhWe1iozx4nWbuLYeYfsq8
         6qMdyLcaduQXx8M1tESlCY8LGqq4CAo0Y04MZ7bL0+TghkbAPmm7zwyy4yv1f4B8O+dX
         uZHrLYmN/IweR2sMNgnD1BM9jqhN9znO0GJ3peZmYFIZh2+/ZRYV6bV+adKeUf8Von6e
         q/MQ==
X-Gm-Message-State: AOJu0YwAK+iBmoIclEEZKk2tsFaFmScYXXs5bwnaUi127k7Zq+Ytl3bl
	l5gFvUHxna2sq1QYwMX3w0tUoMnG9Jti2/0CAWeWWv3DSe1p/4FjY4w4AXKJ
X-Gm-Gg: ASbGncs8NN/y63P9Ry2GwYrzOCOg5hlTiWpktVXIPVE7KnLytX8839qtoLx+2UI7kKP
	7Y/1IM05JNHsKjzbeKo2GH3vl1Svf4nlTS2U0h7QUQiIs06liClAO/nQQ8cNEoolY46Cf5KR6VJ
	AHIP7+nRGqxr4QcZD2Mqc1n+tPCzolt96VzUjClutvf+JkDN79qYagADW8mwnAvu1DnflQgiT5J
	DXspCq+HXVCmxiC26ne/8O0IbGcPw0M9Dj3fQCLVliy46sv96YHEJ/evCjQc7O7jbtm9gbG0VCV
	UcnnwY/f/j8M7IR2qbWW/N2lQsktw4jYw/kFXlhPCPzpYIIG/+YbqXb36/6Zen8kbu8315NH7RI
	3C0M5MHahMQRrIPEGwwoeMtWYFjcjcSX+llTZOzk165ARZ35SmVCMiOBYbxRnk71rfDPu61skk1
	aaDOF2BJo=
X-Google-Smtp-Source: AGHT+IF9Dkb55uG//CFlZm8sj+q7rSLVbpQ9xC+Y7s2FpNa5fC4AgBNMcmVwKbOT5DGD/4+uczKheA==
X-Received: by 2002:a05:600c:19c9:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-4390d5a3051mr17684295e9.26.1738763368859;
        Wed, 05 Feb 2025 05:49:28 -0800 (PST)
Received: from ?IPV6:2a02:3100:b14d:3b00:3c96:9472:d1b6:5cc4? (dynamic-2a02-3100-b14d-3b00-3c96-9472-d1b6-5cc4.310.pool.telefonica.de. [2a02:3100:b14d:3b00:3c96:9472:d1b6:5cc4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5492sm19007927f8f.73.2025.02.05.05.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 05:49:27 -0800 (PST)
Message-ID: <72397ae6-43aa-4a15-be5e-cdfe06b2c7ea@gmail.com>
Date: Wed, 5 Feb 2025 14:49:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 RFC] i2c: Fix deadlock on adapter removal
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

i2c_del_adapter() can be called recursively if it has an i2c mux on
the bus. This results in a deadlock.
We use the lock to protect from parallel unregistering of clients in
case driver and adapter are removed at the same time.
The fix approach is based on the fact that the used iterators are
klist-based. So it's safe to remove list elements during the iteration,
and we don't have to acquire the core lock.
As a result we just have to prevent that i2c_unregister_device() is
executed in parallel for the same client. Use an atomic bit op for this
purpose.

Fixes: 56a50667cbcf ("i2c: Replace list-based mechanism for handling auto-detected clients")
Reported-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- define I2C_CLIENT_UNREGISTERING as a bit number
---
 drivers/i2c/i2c-core-base.c | 9 +++------
 include/linux/i2c.h         | 4 +++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 6eade239f..44b861eb4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1059,6 +1059,9 @@ void i2c_unregister_device(struct i2c_client *client)
 	if (IS_ERR_OR_NULL(client))
 		return;
 
+	if (test_and_set_bit(I2C_CLIENT_UNREGISTERING, &client->flags))
+		return;
+
 	if (client->dev.of_node) {
 		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
 		of_node_put(client->dev.of_node);
@@ -1354,7 +1357,6 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
-	mutex_lock(&core_lock);
 	/* Make sure the device was added through sysfs */
 	child_dev = device_find_child(&adap->dev, &addr, __i2c_find_user_addr);
 	if (child_dev) {
@@ -1364,7 +1366,6 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 		dev_err(dev, "Can't find userspace-created device at %#x\n", addr);
 		count = -ENOENT;
 	}
-	mutex_unlock(&core_lock);
 
 	return count;
 }
@@ -1745,10 +1746,8 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	 * we can't remove the dummy devices during the first pass: they
 	 * could have been instantiated by real devices wishing to clean
 	 * them up properly, so we give them a chance to do that first. */
-	mutex_lock(&core_lock);
 	device_for_each_child(&adap->dev, NULL, __unregister_client);
 	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
-	mutex_unlock(&core_lock);
 
 	/* device name is gone after device_unregister */
 	dev_dbg(&adap->dev, "adapter [%s] unregistered\n", adap->name);
@@ -2002,12 +2001,10 @@ static int __i2c_unregister_detected_client(struct device *dev, void *argp)
  */
 void i2c_del_driver(struct i2c_driver *driver)
 {
-	mutex_lock(&core_lock);
 	/* Satisfy __must_check, function can't fail */
 	if (driver_for_each_device(&driver->driver, NULL, NULL,
 				   __i2c_unregister_detected_client)) {
 	}
-	mutex_unlock(&core_lock);
 
 	driver_unregister(&driver->driver);
 	pr_debug("driver [%s] unregistered\n", driver->driver.name);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index c31fd1dba..f5de17590 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -325,7 +325,7 @@ struct i2c_driver {
  * managing the device.
  */
 struct i2c_client {
-	unsigned short flags;		/* div., see below		*/
+	unsigned long flags;		/* div., see below		*/
 #define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
 #define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */
 					/* Must equal I2C_M_TEN below */
@@ -336,6 +336,8 @@ struct i2c_client {
 #define I2C_CLIENT_USER		0x200	/* client was userspace-created */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
+/* following flags are bit numbers */
+#define I2C_CLIENT_UNREGISTERING 31	/* client is being unregistered */
 
 	unsigned short addr;		/* chip address - NOTE: 7bit	*/
 					/* addresses are stored in the	*/
-- 
2.48.1


