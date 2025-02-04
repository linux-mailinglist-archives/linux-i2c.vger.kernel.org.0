Return-Path: <linux-i2c+bounces-9297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F87A27C43
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 20:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25253A1949
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 19:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E293218AA2;
	Tue,  4 Feb 2025 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j++BR4IS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D02B9BB
	for <linux-i2c@vger.kernel.org>; Tue,  4 Feb 2025 19:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698887; cv=none; b=AcIgk7oXCXr953uz5mprOMiQMYQSUGhOEYxX4wpV5A49yFHKJsmZLFLqaVBxvAa9mJHAi5OhotpNs+JFEDlO2Kk2sMHcu7KeYt5DqtYdatOO4hPz4HoxdQHNHKgmDV5jVXkMAoZlr0JMgBiEDIL2h+BOMQwiixNklVWoXe9Z6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698887; c=relaxed/simple;
	bh=6Bm6LlbX1iIWpk63z7+MF6dvF1ulQ7KWN+Ol8A/rKtw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=BrwNanZeWM2nyCbMNWHJlP/I6kO29PAPeOvTyedrVZkNmkzNCqp2aNgxYxx7YNQzhPr4t3fSFVpsUfvinD/Yibhow9v5iv61UlTmxvhm8MAy9roc5cfpbgMWEuAf/bXLKVOvBADl8uHtoD52TBD+ABxx87f8N9It/MxGjzJS1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j++BR4IS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso794745e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2025 11:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698882; x=1739303682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKGDr4Fjo59qWaCWYxzR0fYMZWTqgomEHDPu4hlrSko=;
        b=j++BR4ISGergrS8wXkqncy4d8lOV1TQWWHP7g2OrLsInrl7L4xrjD5groz8Gjpvkld
         1nVaZpy677s4deA5yMXk9xT7BMCK0jJ6/zUtkiuyjG76WduuJrHCBAAJVpAHxO3eCb0b
         LEaEyFgRtQ6XwG2O4NY6MC2+rfk3F+nQ3DD4hBS/sjLy+HK6jzz6veExy7MRkL4ZB0Jq
         xQxOl0C1XBrkQlwbpr63o3PP2GVzUClk6KTrRSJOQe6SgrC8GGX30fZPRbvXg9f1yS9c
         DzDJcSFgHIsG4uFvt2BG0300Y6gAPZjENBza01Ses2g7qbDHfWY40/QzOAVOpC+0e6xY
         0+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698882; x=1739303682;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKGDr4Fjo59qWaCWYxzR0fYMZWTqgomEHDPu4hlrSko=;
        b=kriI4cfvKW51yhhP4t5KKqQWJB47p/qqs96uUFpXH+azq/3SsrKOTinDpK1sWe8IOx
         pyEJfvb/F2SiEEmRsqc9tKZfyMTNubKh0XlCLj7H23kF19Y5xZuFe0jx0GrWpsgNyvix
         VUccFw8lYIb5cUB4ZytfOuVAmWO++R5P2yVEpeqysP+cMs5ZHHvNmtg+EpDbHkM7Pe/x
         oOEVG9VSWIOA7AjGlpiT0O/8XwYJ3Y+tTwIISDRcTnViDNIvKn/LSA/QcS/gUc7RWNxc
         UV/D/14H9W9+m/eDMylDkZS1HKcQQH6t6+3doll/wABAr64EeMSmF+aFb7wtFQ7z2NE0
         pzgQ==
X-Gm-Message-State: AOJu0Yw+dtQ9DP0rLxaeqqwz9D5mm+VpsiEG1glyrgL1/b0/y5RpPb3S
	8AXAJhE1t9Kl0sc9TmusQBevrkU0daIFMIcnH5BjycCPZmfXdOuqVnGstkTE
X-Gm-Gg: ASbGncsMH+dqx8Vha88haZnFCbfSMf2f/FTs+CnmjJxJEzNyTt84Y8zIRSoFfHr0Dgp
	nYPgDaWXCfvyEzYo0j1S6h7jCqp1j15CAIqg2l7B/WqKh97mtZ/Zjrh1bAzcaIKQhl/4+UPnEm/
	juZKxj3eTPDLPn0fTAlaJWqLlTa09dwQvAPqMuD6JA2GQmMUUggKXt2aFvOK57MZFoctO/o3veL
	BwZX0RvMZw25yMl95v6gSsNXS8wnHxUT34aQpFqLrCoL/ihhBBqmZWE9x5ufin7tcV5RAJDYqTU
	2ZFstXA4ZvqSV2xU2fYWpNmoTGy50e9k1xqid0wQnxxHweffsdGppwXhKq78T5XU/RQDC7lvWjJ
	M6Js384MHTyf+VD7kNOIS+jRPxhDw2rfWboqpx7FCGcMfPT+yy1NN5v4NjgOKGm5qCPhjDXaDHV
	ULqS6t
X-Google-Smtp-Source: AGHT+IEs9H7j6N7K88V9rfdVJj1t9tI6SylKvgcoJUBt+GzQlkONw/Fun1G2mGaxsXtehJeV1p42lQ==
X-Received: by 2002:a05:600c:35c1:b0:436:e69a:7341 with SMTP id 5b1f17b1804b1-4390cf27863mr1698415e9.3.1738698881257;
        Tue, 04 Feb 2025 11:54:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:b3d9:8600:21e9:f8e3:9d4:22be? (dynamic-2a02-3100-b3d9-8600-21e9-f8e3-09d4-22be.310.pool.telefonica.de. [2a02:3100:b3d9:8600:21e9:f8e3:9d4:22be])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm235301465e9.23.2025.02.04.11.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:54:40 -0800 (PST)
Message-ID: <71a49125-54a7-4705-b54a-a5e7cc54a78b@gmail.com>
Date: Tue, 4 Feb 2025 20:54:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC] i2c: Fix deadlock on adapter removal
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Wolfram Sang <wsa@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
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
 drivers/i2c/i2c-core-base.c | 9 +++------
 include/linux/i2c.h         | 3 ++-
 2 files changed, 5 insertions(+), 7 deletions(-)

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
index c31fd1dba..c9b6c0f50 100644
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
@@ -334,6 +334,7 @@ struct i2c_client {
 #define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
 #define I2C_CLIENT_AUTO		0x100	/* client was auto-detected */
 #define I2C_CLIENT_USER		0x200	/* client was userspace-created */
+#define I2C_CLIENT_UNREGISTERING 0x400	/* client is being unregistered */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
-- 
2.48.1


