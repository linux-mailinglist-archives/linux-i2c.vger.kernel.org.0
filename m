Return-Path: <linux-i2c+bounces-9648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E772EA49D0F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5E13B49B4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40861254869;
	Fri, 28 Feb 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5aNCX/c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8621EF36F;
	Fri, 28 Feb 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755861; cv=none; b=rnL7oUNDMNs9tymf7GhiUzgQYgVwiO9CGoiAslQaOMNQDKGpXK5d/fbVbjwE7yo7qaELBFEtKCH2VtCe5qDbwfyEfKjB0oYC1pEygWLBkrX+GKlKFOZYm2SiZFvhO7HhJLNcAa+CAFQdL7G7AaHAM6/9NtBDVnT8Ai7ftWi353U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755861; c=relaxed/simple;
	bh=js0ULzWgxljakcpWyCSCNziXEbJUjtxNr4WUb1YkhYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkbX0HLRuVGYJ4bkkw8cULY/eRJ12Ft0zuv7xNzeqvRTvMy748coyiWXiYvqsysDk7zUZNp0V9/wgvkJ52Rqiq01x4bnKJM1n/wiwkQ9lxEcCIgIK9Zd3wUACSxxm4bVnVgtOvKmBCmdF5ygQDoPPnm8uCyFVRdLA7xsu1RBRok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5aNCX/c; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1389619f8f.2;
        Fri, 28 Feb 2025 07:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755857; x=1741360657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J7Ov3Q3zvbb4Wq/N681pfQJSfPu/xmR7tlaT0hDhM8=;
        b=T5aNCX/cjwPQhyptdhhDzyHrbU7Myqlxn8Y1d5lquXkXncXZrBuApaf57uJw9fzjPk
         yEEt1Who9iywvjwLDwzoDAVRzTKhw12ogXbyNwtH5PExKKd/nTSF6ff4cAsR6HM7x0KC
         4YwQD7Nb6OC9nQu9D/DNRxNw0+3KCLIxFy05QMPXGbPxf/EyXtgdIRMAoFui7pICygpE
         mfQjbepus4zUQIZY9DsrPKQbfIAUE3Lh6fsWbV6+V6aeRHd8Ec85cah0akrmFOMZYJOV
         WH/c+vVWMaoI0MuY6fR4HofKyzBczriWSL3+57n+57MMPoBIv+PgIbLdIJUoCp60chQB
         TPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755857; x=1741360657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2J7Ov3Q3zvbb4Wq/N681pfQJSfPu/xmR7tlaT0hDhM8=;
        b=jgnULtvVnAkmuBEqpFIIX3rvq6I04mnVU8L31n9NKvk8+KnvIBiGN691nOkf5KRC17
         ajLc2IAFk7S1tXkb4BPvtT6cU9ICUY8oMijlEYn9xQMJXPLQ59LlGQWW6JYUfoYYHZUa
         rLUTtJVcTHmf2OzLnON+pyMggrh3EdZdTX+RurtjAVFWruQC5nB9TdJkAUPhNjWGg7TF
         161Z8zN7OdG98lLpaWITXln1WHgxFQzUzzgSDggu3+hbu8uBki7lshMbekM7C5mBvUtj
         33A1+SIvg8zlbl3CgXvBQG7eaXOvNcKdA1Cj9ocToV7CYYtm5OfMti+nlU+MG0Bwko8m
         l/9A==
X-Forwarded-Encrypted: i=1; AJvYcCUWWmr0giaVEMO/A4BNFhzmP6ug/E9nX+UM5wCz30iRUnRhg6JvNxXuH5lRf9JJy1mv1MxLPOoaAfk=@vger.kernel.org, AJvYcCVESt2WO1GyBsDVfwVy9PicxBsBk7tadwCwIOEPhIxwxTclYFV5SPDd1ZXQxSqI/pLRW8UhxtmFHWsK2m0=@vger.kernel.org, AJvYcCVYKsEoIZCZjsdHcs7/CYK+KCT84VkxZjLDAn65OnWZ/myupT8DYT6/Bp+pHEgfOgoPR9c7/lvuCnKMyYWR@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVPDAq42CCN/SQsMRK8U97WB//Yi+ncUUYYdytMlPXRxm3ou3
	lKMH3CJhyCZTDG6zq0YhtertX2/mGc+n3wGPb3s4jsSMpHufiHZV
X-Gm-Gg: ASbGncuSe2zAeJUPqmeCM6iqmD1qGBY1Hz2iY7Ate6PznO39EHEm8BEdtYwjQb7mBoT
	usXJitAO61bxxA/5DheZ0MYoDMYMI6zc2DIpcPypVbkZeAUTqfeDpxp3NfGUeqH+aweCB1vBwBw
	znJGSglVxWx07xgG6YgmJxJUag1Z1/kkcE+KNHZ1Rv6OxMM2oPpL0U255QEyl3/Wmx+k2mC301h
	LF7pGalMZFQSijvO5TCH5pwCoUYdJ6yn33wvueoOn5RXYkl9eaeqf6ZJxPiho2c8nNvTAGLO0zc
	ccOuaPJ5MfICQqNxEGyn/mZVopwRYugBeqUkeeo=
X-Google-Smtp-Source: AGHT+IH30I7c0CtI+edBTcurzoZbuGpVIRTDkszIvnJKH1Zuh+Q1uQQ70sGHOgxf0j2xkRawwp0SAA==
X-Received: by 2002:a5d:5f91:0:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-390eca480f2mr3759250f8f.40.1740755857224;
        Fri, 28 Feb 2025 07:17:37 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:36 -0800 (PST)
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
Subject: [PATCH v3 1/9] i2c: atr: Fix lockdep for nested ATRs
Date: Fri, 28 Feb 2025 17:17:18 +0200
Message-ID: <20250228151730.1874916-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228151730.1874916-1-demonsingur@gmail.com>
References: <20250228151730.1874916-1-demonsingur@gmail.com>
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
index 8a5d9247fd29..f6033c99f474 100644
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


