Return-Path: <linux-i2c+bounces-9320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A8A2A589
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 11:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6EE81888DA2
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D08722653C;
	Thu,  6 Feb 2025 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwMBeSTR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE9213240
	for <linux-i2c@vger.kernel.org>; Thu,  6 Feb 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836458; cv=none; b=NrWJ3KRbx1/dDgLJ5OPGMRf9SroF3Y45N1g8vDPOkRiR+3xy0fR5MKmQtw1C4jtYYkHDu+gAsNSadKy9dmo0VlVkf1w3Do0sUyT5oOrmzrws9RR2Z/qeooG5BEOmLJ0684Yeckx7SOEdRZPdJMLmMh3k0MnBEPreKN2sjhfYaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836458; c=relaxed/simple;
	bh=CzjkvSl5bUdgTxMskxre+KE0XE1SS95jnFszn3Xnotc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=XeRMSq1hMW8YM9iiFFLdSD3XQz9TuTsMd2HjTf0mnwzS4q3x8LvjSTGwUfJySjQDVhicnBeLzCjrtku2pzszcNtyPBpoEkDkrTIeAIT+BwIzv9ohYQ8SkWJ/VPcJZfhlzKpWqZGkpO0VoxCWZlkRPZ3+of3PqCJHKEgEZggbf2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwMBeSTR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38daf156e97so354356f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 06 Feb 2025 02:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738836455; x=1739441255; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDbptf1KoFiRKgm88wtWmZ01AFp5FSUjaep+pCbwySA=;
        b=HwMBeSTRtGnedOWHcYddrWzViV+DoQyx+IB2Z7UQ35dlScv5jLYuP6BVPgR/XzIGVr
         z+CQdJoZppJNPA3CCHPpI8TiUFWMctx8nUTDTzwMZ/RAmeSiKI4Z86hHGQbL4W0FPvbL
         8UVYlj0I6AZEVVtlUe94lVrqIqqZ4SnRXs6ArqgNYVt7Sgirv9m3HkTOPlCqnX3ceRl8
         P6hEJb+ncmxpLLEYxdFMxNhxlZqKxSUyDdp0GOYEHzRWgl3qlc/MP4NMyztA8Uy6f00a
         4AYIQIhJSEfDTkSv/uyHitIYU3J7p8oSXXp6C904Ic/qm1qakIRfiYSskHF7nEhCxnj9
         b7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836455; x=1739441255;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDbptf1KoFiRKgm88wtWmZ01AFp5FSUjaep+pCbwySA=;
        b=ULOItJ3O/pDIRg7XqM9y7ct8Milk8ULjNyWqmr+OnDdeCg66sFHayNIHTwgayclSLI
         SyLb4LHpB4D14TfwDEGWVCQVoejS+PRkBtL8apL6i7ZwqEzj52mHPNsC2yMTFKMLn3bI
         xhP0QPXoqoFzfXbZsnxB3LmK7A/TmNd1GI/nND8yLs13F7VxdM/kQmMAMW1W+CIv8dk9
         MBr+RLky2ZfcXnHEcrq5gF0sAf+LVp0SKy1t8sgygSpps9vAyiAc/zzyDZwIhXxVvXlW
         blyp25fC13EMccXoV6kfNW3JP8q3c+quzRmj+gDoI6oT/p0BpnuB1JTqJswzDhxW1Pmf
         myCA==
X-Gm-Message-State: AOJu0YxwnUifei+vU2iBPAmvMcTqnC2L29OlzZRaKv2KicbekZmmDGH2
	6TcsdkvlK9qIhm8fNbMruDDOvA2cro8pPRKBGu1WZyKMiILKT5XyvMXVW5iQ
X-Gm-Gg: ASbGncu4Ueg6you9sotrYRRb4Hq241n57t0Ssf4zLLu71/DyuY8yNVwwP7z4ngxd7Ef
	h/SdOBxXvUGbBHYXDO2NWtOLWLsJt5NWsLVASXY5W9R6vz2LfyfWhBgKGVDvotQ1WRFvZt0eS3R
	USdF/9kf1ZOI9SWIJyE2hyeyMQS5RR1jgVBzSQ2YIh9inzMe7dJZJleOl9WmNrMR3qTj3kaFLHW
	o5fM1v3txEbJpEfkEM/Erlzo8j/9a1nryehFjKdDM6a1jhPdzv8iu6FRw3uRK9bRlwGXSPy1Sc1
	CGNjEpFBMdn6G2ZbQPnJfFMP5fQxLqKE1Ct9gvzCut5e6fC4+Qnfja9up74oeo3Q6UxXHJv/qM0
	svxRLb7eVzzAggP2NiZihbS5r0oTsIUyP86944aKTDdyck6hmS3BzXDR5OJJL/43cUzbAFUe37P
	qPezp2pQA=
X-Google-Smtp-Source: AGHT+IEt7xoi5wvJfugcHHkjKlv1ju5AsYTvXVDPpczBnczjLZb5Pilae2H1S89A+e41OzaI3XU6/w==
X-Received: by 2002:a5d:5f53:0:b0:38d:b9c5:7988 with SMTP id ffacd0b85a97d-38db9c57b57mr2368583f8f.50.1738836455007;
        Thu, 06 Feb 2025 02:07:35 -0800 (PST)
Received: from ?IPV6:2a02:3100:a4c1:b600:ad88:f124:d3a6:2177? (dynamic-2a02-3100-a4c1-b600-ad88-f124-d3a6-2177.310.pool.telefonica.de. [2a02:3100:a4c1:b600:ad88:f124:d3a6:2177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm6233f8f.101.2025.02.06.02.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:07:33 -0800 (PST)
Message-ID: <f654e0ba-cb6a-43b6-9b9e-87a9d2e0d7d3@gmail.com>
Date: Thu, 6 Feb 2025 11:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: Fix deadlock on adapter removal
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
Tested-by: Herve Codina <herve.codina@bootlin.com>
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


