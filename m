Return-Path: <linux-i2c+bounces-9567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92989A43DD8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD5823AEAA6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C76E267B8A;
	Tue, 25 Feb 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUFQnKia"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C71267B1D;
	Tue, 25 Feb 2025 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483590; cv=none; b=EAxFVHuDJ6YOsgBjNjoLdc0tXP3IOtXny58UfA0yT2AREEjQ2bZFg1P3A7WySLAwB/4DOXPva+TfOl2/ngU+ROhGX/UVkIypMrYrcG5JrO1DTyjZst6xqNqGRgjG0Z/klcbR39VWwxqfyQkb1+WBngmbbhpzcedqCFplu1ACPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483590; c=relaxed/simple;
	bh=Z3q6d2KoYcwqI1FYMKRCPsrGbXms4OIkpAtzw9QVUnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNh/ubZhVzzhBgFUePNMXWr9Kog0CnaTj/cuo18RGP5b+ODbYHXwnVZYiPU12t1oKPLwXHH9qgmTUWB6WxOeLS4PeKFbMlkFuj+Wnnht2MgGUZPZB5YyUL2Xg5MAgRAUzHWO6PaduE3iZzJa9nml9ivJwagKYLZCp5QKBJK8LbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUFQnKia; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb75200275so869368166b.3;
        Tue, 25 Feb 2025 03:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483587; x=1741088387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwTefxFXTw38FMjS0DrFd4KzMWhLSYAuwn1lwiNQkZk=;
        b=hUFQnKia8vzUo9LRiKj1YXPi5RNb00oe6bwZf2BMzGj08IdpvAWIh31e45x37QxiPH
         1UVRCwqjhOAbdYZEGE2uvRlxuN18xpSZTMVZRQNElirV49A1tSjOcM/cJQSFJoMY2o93
         /pLmXEtealG7ZUhdeAHxRLfw86h39y0x3GcD+a/ZvrNk3RPL0mGdroNCT2w+FhcqxOY1
         YakalgzBXm35EYysmrEo2sWtX6JT4bluIzzU8B6JnuAyou7Q44ykiWbUbQCXwTLLpU7N
         ZScw4FBgCBXoIHNHzIKOzO9/foy56MIdS3+YpS0saQz/L7oUNNkAkxUAErIxtAl72khP
         wR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483587; x=1741088387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwTefxFXTw38FMjS0DrFd4KzMWhLSYAuwn1lwiNQkZk=;
        b=OhkGHnSlCn6SWaVgNFUZSnA07xraBOBs2iDfaVqoWgLR8gHRhTjg54rQcQzVd5U5Fw
         03kd27DSPCSPhxa3lT3ke+xfZ24OiyPXKTFgz5e2ng9b32Tdwbr+RB7wnuy82yTbk+fj
         xAQXsngnydvin2Tb1O+kGkZ2QtIHivVnCT9J58/1HZIDjH7efukJW8dmlEFzfcEzoQrE
         gU6/Z4Dr+IR+dP+VYiuUb3/o8O4dPX3TPx/YmTHSRFPGeM4ubIGBFJIkbsrZH+sNd23E
         5+KIxavfak/uYyp2cR86J7+TaeByxt/Ay//qZwMjhyq7AUYZlrrEWw8rRomwtUo0MZZk
         uypw==
X-Forwarded-Encrypted: i=1; AJvYcCVEg6NobtVdd036HSvBeR5SyzB9PHqrwKArNViD4+i1TkmhdNuW0jrnGRvGHG3UJBlKTFpbFjAjapfYOKc9@vger.kernel.org, AJvYcCWszRkJ8lZtW89SZw2gIiBLInAv9hoq7TaNkorKaVvoUDWfL/MRDbrzBNksFv5aasEWfh/tFE6OBqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsTNzkHe5WfQOYmd4gMi+N8wczckXETjH0bUxpTv59AvNfyw4
	prQ7mkLz3bJBj1VT5zLEOruniLBuMsaTLkEfBhH6zXhiRYNp0w0y
X-Gm-Gg: ASbGncvNXaZEHmQ2IfLQmwI9qvlqDA2CmX/n2SRfl3V9ukNK2OMWhmknJaFxeBw4hbu
	beaI4zJ/POxYLziNwsVon0lHXaK0WGvSDd3U6QvqK3A31LtiRBoQpQE7lSixhyw9xeh7sOMm30h
	NUOzruQFcmljBtYdDZt0FqQPLQ/bGz+rDNxqzF3Qgmc9fF/j6SjqKZYO+VoPAYNdrzYHrdY3JAO
	Zdr2JjjGsQhgUf5bfOCLpTTM5O0iquEL6lN47D2gEZepXDxdiun96xRhAZPS5zzyZypomNR12wC
	yObDet6qz8mwIQN/XMGx/eltRnS1E6Q2rV7CRhI=
X-Google-Smtp-Source: AGHT+IGFDRm/ulrJyQU1OaBedXIkQQUTa1wFTjnD50Pp1SafglMTGdgwys7LwNzPYvUjOcjrBBiAdg==
X-Received: by 2002:a17:906:80e:b0:abc:c34:4134 with SMTP id a640c23a62f3a-abc0c344449mr1328292966b.18.1740483586327;
        Tue, 25 Feb 2025 03:39:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 1/9] i2c: atr: Fix lockdep for nested ATRs
Date: Tue, 25 Feb 2025 13:39:29 +0200
Message-ID: <20250225113939.49811-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225113939.49811-1-demonsingur@gmail.com>
References: <20250225113939.49811-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

When we have an ATR, and another ATR as a subdevice of the first ATR,
we get lockdep warnings for the i2c_atr.lock and
i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
for the locks, and doesn't see the locks of the separate ATR instances
as separate.

Fix this by generating a dynamic lock key per lock instance.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/i2c/i2c-atr.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 1a6ff47b4200..39b3b95c6842 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -68,11 +68,13 @@ struct i2c_atr_alias_pool {
  * @atr:             The parent I2C ATR
  * @chan_id:         The ID of this channel
  * @alias_pairs_lock: Mutex protecting @alias_pairs
+ * @alias_pairs_lock_key: Lock key for @alias_pairs_lock
  * @alias_pairs:     List of @struct i2c_atr_alias_pair containing the
  *                   assigned aliases
  * @alias_pool:      Pool of available client aliases
  *
  * @orig_addrs_lock: Mutex protecting @orig_addrs
+ * @orig_addrs_lock_key: Lock key for @orig_addrs_lock
  * @orig_addrs:      Buffer used to store the original addresses during transmit
  * @orig_addrs_size: Size of @orig_addrs
  */
@@ -83,11 +85,13 @@ struct i2c_atr_chan {
 
 	/* Lock alias_pairs during attach/detach */
 	struct mutex alias_pairs_lock;
+	struct lock_class_key alias_pairs_lock_key;
 	struct list_head alias_pairs;
 	struct i2c_atr_alias_pool *alias_pool;
 
 	/* Lock orig_addrs during xfer */
 	struct mutex orig_addrs_lock;
+	struct lock_class_key orig_addrs_lock_key;
 	u16 *orig_addrs;
 	unsigned int orig_addrs_size;
 };
@@ -100,6 +104,7 @@ struct i2c_atr_chan {
  * @priv:      Private driver data, set with i2c_atr_set_driver_data()
  * @algo:      The &struct i2c_algorithm for adapters
  * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
+ * @lock_key:  Lock key for @lock
  * @max_adapters: Maximum number of adapters this I2C ATR can have
  * @alias_pool: Optional common pool of available client aliases
  * @i2c_nb:    Notifier for remote client add & del events
@@ -115,6 +120,7 @@ struct i2c_atr {
 	struct i2c_algorithm algo;
 	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
 	struct mutex lock;
+	struct lock_class_key lock_key;
 	int max_adapters;
 
 	struct i2c_atr_alias_pool *alias_pool;
@@ -679,7 +685,8 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	if (!atr)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_init(&atr->lock);
+	lockdep_register_key(&atr->lock_key);
+	mutex_init_with_key(&atr->lock, &atr->lock_key);
 
 	atr->parent = parent;
 	atr->dev = dev;
@@ -707,6 +714,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	i2c_atr_free_alias_pool(atr->alias_pool);
 err_destroy_mutex:
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 
 	return ERR_PTR(ret);
@@ -723,6 +731,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
 	i2c_atr_free_alias_pool(atr->alias_pool);
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, "I2C_ATR");
@@ -757,8 +766,10 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	chan->atr = atr;
 	chan->chan_id = chan_id;
 	INIT_LIST_HEAD(&chan->alias_pairs);
-	mutex_init(&chan->alias_pairs_lock);
-	mutex_init(&chan->orig_addrs_lock);
+	lockdep_register_key(&chan->alias_pairs_lock_key);
+	lockdep_register_key(&chan->orig_addrs_lock_key);
+	mutex_init_with_key(&chan->alias_pairs_lock, &chan->alias_pairs_lock_key);
+	mutex_init_with_key(&chan->orig_addrs_lock, &chan->orig_addrs_lock_key);
 
 	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
 		 i2c_adapter_id(parent), chan_id);
@@ -835,6 +846,8 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
 	mutex_destroy(&chan->alias_pairs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
+	lockdep_unregister_key(&chan->alias_pairs_lock_key);
 	kfree(chan);
 	return ret;
 }
@@ -872,6 +885,8 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
 	mutex_destroy(&chan->alias_pairs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
+	lockdep_unregister_key(&chan->alias_pairs_lock_key);
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }
-- 
2.48.1


