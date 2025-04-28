Return-Path: <linux-i2c+bounces-10651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE1A9EDCF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FBB41896087
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF906261565;
	Mon, 28 Apr 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW4KEXGp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893525F79E;
	Mon, 28 Apr 2025 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835928; cv=none; b=DDdYR6PyuOc+ISK4JO8Q8kTi4fXWAHq4VD2AU26vxgOIJ+1prgqeFpIEOBAQW6T9h1+sNXs+WObbPlKElFKF8perR80JysuX4V2ul0gPzh3fWfRy+SmwAU9GdOU2i26dL48i3ls/i8+/AQKpGbqE1fnWSvDSC4v+9HxUVbnRnA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835928; c=relaxed/simple;
	bh=bciEHnVMQN7n9pavQjzBCHpZ3C4ZJHjeMR7GkAtGHHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD3o82T3zFCU4xOzHuz2hz6Lh7wI/HWYGdNGE/GMo8FMmlr3ajP4wR70ICI7oHaSkufcWyyrAiiD1FzIrCVGfp4HOUxj+oyHx4ycvdyfXDcX25kAAXVCTNMLDMOuE8XOVXua84GxesG5eJRT+aBqNFl0MKtJcmB4dKJN9lbYK7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW4KEXGp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3015093f8f.0;
        Mon, 28 Apr 2025 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835925; x=1746440725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTziXyJk1+6IcSQIq/asb7LXfhFB4YPpQUcFiP0m77E=;
        b=QW4KEXGphOWuH+Qvk6UaxAiTWQ5Sf7MP84OeLaqo4Al69E6mLU4rF7liDWITpyaaJI
         FXdUdje8iGXV/d3ZbEB+3BTxT8sUlhQt5702SIixRjj1bFnanouN1mm909+2bfOCECvS
         xbufYo7a3CMDa3emSAMOivcjY+wXW0wAWK3z816F57kkSBrcmG4hfn8Cqxji2IV3iLVl
         jcihtoj4KL+8DGNT6MZCHSXtIatRDhcAHglQFcjbQdclKDhekW+dHpXYbIqn9fwtGuIk
         WP4s7sppaj5Rbuk39oDRg//yH/2O5PfxBQiWPDeZHquC0CEp3MH+CPaWz6JWoi92stv+
         MtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835925; x=1746440725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTziXyJk1+6IcSQIq/asb7LXfhFB4YPpQUcFiP0m77E=;
        b=i0fFoWQDmnKyBvTbExboAKtC8vhJRaK6POkMGUbGXp8TNy5+GKpzF0JdirRx7fRYZs
         G2+hYSPRzAmOsVN4MXXLFiSz5VogMnmxbu3ahW+YTdmaVA2PRipjmkOSGQpokNknfUuA
         AJv71gsEYj7MMwYIovB4L99en6z8MnJi6hsnEPwD+CSfL+FAvQ1LkFli1XaFH0yfszHx
         I4dPwfmcDDqjp2ZzKjqR/cH59Wy400cfzr8RRm6j029JXHTns8XQwSMVXeTcus+ao97Q
         9DLga7WDwJqA1jQSxv0ooEsMqSXfRhGWp8Jet8aE2nTLYgqfChpRP51dQncTtfeQOjL6
         PJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt6vKBC8MWMXGwLGiLuwe6Z0MZBhf0vNH/8g6pHk1f76ISRY7htRIyZk9R6ZY4yuH3Q8kG7WiMUyB1Vho=@vger.kernel.org, AJvYcCXgcMFkRtEG8BxVrvc4bj57yoIB5Ze7MYUTGxQ+Qzt40/etHxMuqRXgoJMSw28ypCSccmj0Bh8QAcZc0fdi@vger.kernel.org, AJvYcCXqF4f/gbLohP93n555nploNowRvrfUyRbbbO+ofGcXWqJU9kMHHcD1l7aJGtSygOivYcd2aDhUvN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn9EY9ecfqa6oJRZyPIMTdudwZmP0x4FosNFEvI5z8iLE10fV/
	imI7pX2vYmQHuTXcPmYWtRjQ7kKM2W5Tdw60cluiRoCIy/nex3+8
X-Gm-Gg: ASbGncsPPUWNDwiZJtGIVRgUhJcg1SKeHN7cNhFcadCiJGfkPQoardcKfmZyPadzjHf
	OJSQFPJyf7hSNGpdTax9GD5U28P9v/g7uUL+yNSaxy/tLIiRha6OoLJnxj+P841BaIJChbzosHh
	xf2nIHEzCMKyURnQNs2/h4qOEHT10/yqJDLq1HaW0fEZhDnoKy1vlagpgpMBgsIUlBtf8hLf9ER
	wFeri+VlY1c40l1umaivukNsHy4Up4AawSuUj3VxR7I/ZiY/3q+r+eiO36LDeQ98+xjUFNmagpe
	0Oj0Lo6a5jnYRB0E4XJDNCpNG7uulVx4U/43Ocy52lTvMhrsTHN2M5y7qyhR0MM=
X-Google-Smtp-Source: AGHT+IGZRXorP+lkjBsTVAdqlnlmu7ZShKy4h6drsX/BP0ENqCmZxQoYonme6qDNDTmXnznvRM4L3A==
X-Received: by 2002:a05:6000:188f:b0:39c:1258:d12c with SMTP id ffacd0b85a97d-3a06d6ffd55mr11140676f8f.28.1745835924724;
        Mon, 28 Apr 2025 03:25:24 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:24 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v4 1/9] i2c: atr: Fix lockdep for nested ATRs
Date: Mon, 28 Apr 2025 13:25:06 +0300
Message-ID: <20250428102516.933571-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428102516.933571-1-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
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


