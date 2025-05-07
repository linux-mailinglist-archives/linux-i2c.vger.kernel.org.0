Return-Path: <linux-i2c+bounces-10865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00400AADED6
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF63D3BD096
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2FF25E812;
	Wed,  7 May 2025 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUCqFRiE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB9205E16;
	Wed,  7 May 2025 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620367; cv=none; b=jx6OglmNn9foxeI+bG00N9H97mUy0gIFBS6n4vhdAzVUM+6m3YoES/0RMwWZgcmNRJPzxCfAQkRJpvG5dQrSKGzUD6dZTC7mZRcdE6gGbYpdYYdMR6Y0/XsXTumz9LZQIj7U6NnbxpuGIkhqy+Jvz54B+N/jX2w/YPOC8COPkKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620367; c=relaxed/simple;
	bh=3gVF1lX7le6pC9qL/xludvguDPB/+59nmF22f1RsYfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUekNgoX0C5bNoLqPTgAt+t7QjU1eZf4WMCU9R8GZhrv9hc3i0stNOKUCnxmMBz9lwlVoFSNVo3PQozbD7niB1zCKv+vidILBJjF8olRPLL5IYKjjbu8xfRMXT6K6xPpMRyiK02fJpoKUJyeCkonCNv5d8mlrerPJmooA//fsfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUCqFRiE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so1820559a12.0;
        Wed, 07 May 2025 05:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620364; x=1747225164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF54rRa/C7kGgfTGWwCwoyh8mPZsRmdNv74zpR8PhVs=;
        b=EUCqFRiETYfzrf+LaIf8kt7wr4aX0sM3VriZpGz6v05o7qKCNETgbcoJVNJ6QM6vz0
         AJrfcPe31eZNayxbQCebd5IDQW8PqfF5z285w6EaxYg1n+9fA0NHou+elVB0moTSSMrc
         7S4ur1/nork3cSws2q5ZFnQV0WgWWu7g9jrEfyudBvyM1bqlssU/c8fBaUYYcZRdeXI3
         xPxKePDAK4/LCl+OBs+dv5uvHwDFN08zvoo8idswaZu7DWknshHZFxgvj4+FT0KquN3G
         viQvUfZ65wsg7fRXTK24eZbYdNspz7gbIWw+RInXVtayO4CpT42Iq4aZHML3N5UZnWHr
         pfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620364; x=1747225164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kF54rRa/C7kGgfTGWwCwoyh8mPZsRmdNv74zpR8PhVs=;
        b=sIUM/+phIPaEpUQhDcJ0lnEeIQtrUx2jus0FnRVwZLQi4xE5DLnDHFkm8w0WCoKFjU
         3hdKUKSnm5lNZI8JMecTinRAvYocEwVsbR6czau0VeUra9QbVuKlzMVpFTtjjROExBTB
         zkNPvglDboy/XKQhbBEzf9KpEt2VXnsQXyoQimEqyFgCmoz601SEEOJagt4cATjWgrPV
         clVSu0hsEeOEc7pPbB4gCU2x4ouKmg1FXrYWuT4jX7kvQS46UrffWT/DCPg3f1JWJ1q3
         G90lsWoXWxsA/94CevtAKU9b+UoHX2J4zK3FtUw9Tj8iFwhCwbNXIDnueQwoPVB6B3O0
         Wu6w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9vAdXqHmH6qe/PcQl9TJwvgEGhB6LUr0Qs1vJ2iD8bWhtiAc9C3KJfM2mVFuVZNX+YZtX6wlXSo=@vger.kernel.org, AJvYcCVR6Qvk8DVRwQbcTciTcPv1S/tQOCydIq7k25l4SbvguthkKwE7My80o2flJx1uu4tkzNOd00JUE9dZGrlr@vger.kernel.org, AJvYcCXK6V6KikdROL2zYjZbOSHRWgvZKD+NVPp2UfLtt7AZ4yUWjTt6lnqr8NLOPo3eUKquAwl0jL1Kps15IUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzw6Ma/Cj1KLfnT0TbFoUjXSEyzKZcmtA5KLu6p9dS05s2/Tpz
	2E3ZH5Ju12y57QdRSqzSoNNPUBCoM18o7Ewu3vIVU98VzuFUQNRt
X-Gm-Gg: ASbGncvaTMGg2jcC/wAnoxPxGIJZBjCDzUomNRfvVGvOVSRzKtI+JnhoOMOXLyk2jfs
	SDTwy9jFHa2yTIBVk/GX21cFTc08YMMNhJCHtM7+gxj3SV6GfNfwMkSB2DMrEed1S+jiIvvrsaX
	Mu5Q6OsVZunR5/2DprRWV1f4DiWU6C+PNXMoNM760S/5su2kNRvp+rxLduwjJ+qtLyzAmkmRIJ9
	mO6C3mnb6kq9n+v67dd+ETNd4JmkaEI149QYWm2acgxEe6p0hJDgLlMf4Tl9DzGcZPClPo9cg9n
	F8KJj74e+GGQbUfK1KEDRCJi6eKD7XBKjLOsRhsmLCOyvlxjceMU
X-Google-Smtp-Source: AGHT+IHHZ1UisxTWGw2gOjObSZUMxItcdcaL5HZ72vB3SnYFfsvgrS76Rn6kKlrNhzvngRLwVYn/Ew==
X-Received: by 2002:a05:6402:13ce:b0:5f6:c4ed:e24e with SMTP id 4fb4d7f45d1cf-5fbe9f3c567mr2966906a12.27.1746620363835;
        Wed, 07 May 2025 05:19:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:23 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v5 1/9] i2c: atr: Fix lockdep for nested ATRs
Date: Wed,  7 May 2025 15:19:07 +0300
Message-ID: <20250507121917.2364416-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507121917.2364416-1-demonsingur@gmail.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 1aeaecacc26c..a79ca87e8bbd 100644
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
@@ -683,7 +689,8 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	if (!atr)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_init(&atr->lock);
+	lockdep_register_key(&atr->lock_key);
+	mutex_init_with_key(&atr->lock, &atr->lock_key);
 
 	atr->parent = parent;
 	atr->dev = dev;
@@ -711,6 +718,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	i2c_atr_free_alias_pool(atr->alias_pool);
 err_destroy_mutex:
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 
 	return ERR_PTR(ret);
@@ -727,6 +735,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
 	i2c_atr_free_alias_pool(atr->alias_pool);
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, "I2C_ATR");
@@ -761,8 +770,10 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
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
@@ -839,6 +850,8 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
 	mutex_destroy(&chan->alias_pairs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
+	lockdep_unregister_key(&chan->alias_pairs_lock_key);
 	kfree(chan);
 	return ret;
 }
@@ -876,6 +889,8 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
 	mutex_destroy(&chan->alias_pairs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
+	lockdep_unregister_key(&chan->alias_pairs_lock_key);
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }
-- 
2.49.0


