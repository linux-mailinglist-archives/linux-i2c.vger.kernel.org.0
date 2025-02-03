Return-Path: <linux-i2c+bounces-9266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D7A25925
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 13:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536E63A3325
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535E72046AC;
	Mon,  3 Feb 2025 12:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdY8SPdk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B0204687;
	Mon,  3 Feb 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584998; cv=none; b=aUa1U1SEorLC8uWERDatXpAOI1R+6ynwygw4/McfjVhTYmg70Rax9zB5aIBsaGfTcRzAk6z+ak6ScFfWa4+FPkidy5iUDbIvO0dcO/8MrAnkYou7y1SwN+0lJq6sfmK6urdRXLdT3pvxgl0xLrvpkTOgiTVqHdXDW1q4PusePVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584998; c=relaxed/simple;
	bh=hXofbzxGr9UkSBfIseqjF5uUMSV17qsMHkbWDTU+lJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1q5EKNiyBh6HbQivPX5fVWF5vtDbE6/Um2gMlCncCnsJ07HGdv9tadSK8bdXPwnj3qCHASQtLlKtrDtF2LdCT8s3CgKOJHZzMLjcJw9PwiLPtEGVbMxTgSBjagFeGVfFpbMssWj2NrFwQq1ejARyOQipneinkULWR0jecs8lFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdY8SPdk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so43574595e9.1;
        Mon, 03 Feb 2025 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584994; x=1739189794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5S1Jbaqqsuy54JXETXKSNuafE+6eBMfotLplIbgjFY=;
        b=YdY8SPdkPLgMW69FIQKyObb9XLKOp2nCxrUkAXchd7Lan9FbIlB8SIBmDvuNxo2ioo
         V5QJSXu1eP7Lq2xUk5khOKOZXpqgcUvE+3RICp/ZR+85Dtd1ivmZr3rWNg0iPXdOIP/K
         Nw8Nb6WdJTIkhh8uTOQ4YkRVoVUntSuYd39gLaDCpOlJCdOzkGvoba7EnafMNUcbhVcs
         st2PY/O7mUgou6uKmpeOTS7zGOJjG1wTkmh7ff5iGnumHDZvTYfxXASnmzQKjWywWjP1
         RKnMPetwjXLidDbsTrwrMaQHjHd3J8EJSMFRCQ2E6uKM31boPZRexp8hZKnGyhdWjzZy
         dSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584994; x=1739189794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5S1Jbaqqsuy54JXETXKSNuafE+6eBMfotLplIbgjFY=;
        b=wKc9n823sxVbOZLfraIBwr2nbYZtXgUWrCbX+BKw0G65v2yVZCbx80Q9e3hGKEQotO
         +zwZUBhpG7rFr3luflZC5W/Yg6LjfECbesmwaOAYuzPeOMDqSz7XauxAd5+iUFnjn1S3
         H6ECGkC1qEuIhiVoYd0Bpte2PUaqCM8cwnqDdFTo4obukf8CFMvgCfLY/p7B59vlLmZM
         i5AQzA3RWgIzscYbalk/Fukj1GIC9FtVXkli/FusCBrdtOpiRnN3l/MI2HBBM01DNewi
         Jg6W/NKIoUXuU4LHTGDeKqmNFjJYBOIra+7+uQ0iRKuCiPd85THseg3wBnqfjAI3Pmdw
         kzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe5UvkCg72WdmJ6t4FlJmJ8fCj+4RjgTGWud6kJE2U4caFSMIV7r47F0G/i+OOR1lmdTlMh2/GfDZQuLnV@vger.kernel.org, AJvYcCWdMSQj5H1OzU47eO7eEPW1I5rJt8KSo1qGBCOsBfWuBziHUMBVGfxitngHGLxA+evpkL/BURfhN/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrtb7o2RaqYASzj/Jwc+LrTCc8OnR6Rdkq9b19obV/HK8hLO84
	FT/ELGT2rYbhs0GE9WDgh2pIb2iR1PGBjfuKa8pwGh+qzr/GAhxlzPoS2A==
X-Gm-Gg: ASbGnctvHvxcJq0Uavz5OM7nnCPV/rfD1Qe4uyjLroYnYF6O8bm882Gm0dF4TvISLbr
	8fxL5hO+/fG0Ie4ZSB2ZkQPr83h5goI2+OjU2ylccFQSvaYXTGq+61mYMVqnsxCM53neUIaiVdI
	2uS6E+t8BWnY+dbdE8OAQL7v6Eou+pBtG+/Y4x8vx8iPl6yX0dip7F/8pQ9AIeYerXMJCY4Ocvz
	+xGE8hJVMjcpV4z8g+bOYFMn/k6vUMgbHzLttCrROoZ3PhUDaS3FGUz/nRH+uTbltj/s7aTkNq3
	mSmoA05QaDSOPM92El/tM5eg0T4=
X-Google-Smtp-Source: AGHT+IHzzmvbcVxCPLp672vyXzP8nYo4AEWsr32WlCMB1c5YEVuASHO7fdyzgxthfLOMiCMuAcL/1w==
X-Received: by 2002:a05:6000:1843:b0:38c:5d42:152b with SMTP id ffacd0b85a97d-38c5d421959mr13296202f8f.54.1738584994179;
        Mon, 03 Feb 2025 04:16:34 -0800 (PST)
Received: from demon-pc.localdomain ([86.121.79.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa3dsm12805326f8f.93.2025.02.03.04.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:16:33 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 1/3] i2c: atr: Fix lockdep for nested ATRs
Date: Mon,  3 Feb 2025 14:15:15 +0200
Message-ID: <20250203121629.2027871-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121629.2027871-1-demonsingur@gmail.com>
References: <20250203121629.2027871-1-demonsingur@gmail.com>
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
index 1a6ff47b42002..39b3b95c6842a 100644
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


