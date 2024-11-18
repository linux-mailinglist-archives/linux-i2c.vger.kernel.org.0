Return-Path: <linux-i2c+bounces-8024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B93409D0E2A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 11:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743B81F2279F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 10:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ADE19D071;
	Mon, 18 Nov 2024 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VxTO66xN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623121990B7;
	Mon, 18 Nov 2024 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924805; cv=none; b=lcH9cZu/KRqALHhqFc8OS6+gUNsuAAaX38b/Apq272yVyfrmGNvF7XYsCzDsjYIDj0S0PqVtwt6xm3eZEEK+1XYYzh2HfgjInXuKAZQZuTa25R3Q2rnNifULBz2vlbm/zSQrcc6E0mth33HzXzIcFZNfIdWT3zvrscs99lY4O94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924805; c=relaxed/simple;
	bh=z3pkah0+TmODuiRyVMMs8EvN63Piux7wYFnD0hJmd70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkiZk9BG9tZZM7DwIq0Fnuc8RJq4h3pVrXwpAI0LN1sw+CvjQHAwGKKqTpBvm4NopRDEmBIhR/Cv1/vUDngZzYkHce1GXrqpEafQ7sCACSc1iOyybW0826S3dgEj6C9hB5jorY7GF+WLXTGBnaOriZCJLTywfi9GV1PA/ylFA/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VxTO66xN; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF9E71BF20F;
	Mon, 18 Nov 2024 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731924800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIJ4d3CEfY6cAlBF9W/fqRPK2MRoB0LfBP4W5Cd+slU=;
	b=VxTO66xN/mE/wOr+KpHeyMuZ7Gq1os95Q+wgu59+URVLHllqc05+LN3fqR2U6polUW1MQY
	py36K2q+ooFl3Mo8yLqQDc/jCBWHqxVihuu+Xp90MhSjVLx37pDFRQ8L+zNzmdwqDL321y
	pIafneC0N33O3FzqkxGdlKiiqa1i2kErZVvZjeojnj4ddzKsDbi8/xr9eamXHhogHfREgX
	yIefLVhm8g3WOf6oHP+hmlBUFKuW8ZJ1qRihvB1S4rJMz6djE5OwmutzfoqI3K7NKbKe9R
	XXvscuUa+zs3WY7XrzdmHv3qfvIUpbIh5bZrJ6yxO6ckhAOHgZ72uv3+CraP2g==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 18 Nov 2024 11:13:07 +0100
Subject: [PATCH v2 8/9] i2c: Support dynamic address translation
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-fpc202-v2-8-744e4f192a2d@bootlin.com>
References: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
In-Reply-To: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

The i2c-atr module keeps a list of associations between I2C client aliases
and I2C addresses. This represents the address translation table which is
programmed into an ATR channel at any given time. This list is only updated
when a new client is bound to the channel.

However in some cases, an ATR channel can have more downstream clients than
available aliases. One example of this is an SFP module that is bound to an
FPC202 port. The FPC202 port can only access up to two logical I2C
addresses. However, the SFP module may expose up to three logical I2C
addresses: its EEPROM on 7-bit addresses 0x50 and 0x51, and a PHY
transceiver on address 0x56.

In cases like these, it is necessary to reconfigure the channel's
translation table on the fly, so that all three I2C addresses can be
accessed when needed.

Add an optional "dynamic_c2a" flag to the i2c-atr module which allows it to
provide on-the-fly address translation. This is achieved by modifying an
ATR channel's translation table whenever an I2C transaction with unmapped
clients is requested.

Add a mutex to protect alias_list. This prevents
i2c_atr_dynamic_attach/detach_addr from racing with the bus notifier
handler to modify alias_list.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c         | 244 ++++++++++++++++++++++++++++++++----------
 drivers/media/i2c/ds90ub960.c |   2 +-
 include/linux/i2c-atr.h       |  13 ++-
 3 files changed, 202 insertions(+), 57 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f7c4d39ad3b48ad64be25b8462394e569aee57d4..cc9ef19078b43ed57f876b0a132ecf979df54730 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -16,6 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/lockdep.h>
 
 #define ATR_MAX_ADAPTERS 100	/* Just a sanity limit */
 #define ATR_MAX_SYMLINK_LEN 11	/* Longest name is 10 chars: "channel-99" */
@@ -27,9 +28,17 @@
  * @alias:  I2C alias address assigned by the driver.
  *          This is the address that will be used to issue I2C transactions
  *          on the parent (physical) bus.
+ * @fixed:  Alias pair cannot be replaced during dynamic address attachment.
+ *          This flag is necessary for situations where a single I2C transaction
+ *          contains more distinct target addresses than the ATR channel can handle.
+ *          It marks addresses that have already been attached to an alias so
+ *          that their alias pair is not evicted by a subsequent address in the same
+ *          transaction.
+ *
  */
 struct i2c_atr_alias_pair {
 	struct list_head node;
+	bool fixed;
 	u16 addr;
 	u16 alias;
 };
@@ -58,6 +67,7 @@ struct i2c_atr_alias_pool {
  * @adap:            The &struct i2c_adapter for the channel
  * @atr:             The parent I2C ATR
  * @chan_id:         The ID of this channel
+ * @alias_pairs_lock: Mutex protecting @alias_pairs
  * @alias_pairs:     List of @struct i2c_atr_alias_pair containing the
  *                   assigned aliases
  * @alias_pool:      Pool of available client aliases
@@ -71,6 +81,8 @@ struct i2c_atr_chan {
 	struct i2c_atr *atr;
 	u32 chan_id;
 
+	/* Lock alias_pairs during attach/detach */
+	struct mutex alias_pairs_lock;
 	struct list_head alias_pairs;
 	struct i2c_atr_alias_pool *alias_pool;
 
@@ -89,6 +101,7 @@ struct i2c_atr_chan {
  * @algo:      The &struct i2c_algorithm for adapters
  * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
  * @max_adapters: Maximum number of adapters this I2C ATR can have
+ * @flags:     Optional features associated with this ATR
  * @alias_pool: Optional common pool of available client aliases
  * @i2c_nb:    Notifier for remote client add & del events
  * @adapter:   Array of adapters
@@ -104,6 +117,7 @@ struct i2c_atr {
 	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
 	struct mutex lock;
 	int max_adapters;
+	unsigned short flags;
 
 	struct i2c_atr_alias_pool *alias_pool;
 
@@ -153,16 +167,128 @@ static void i2c_atr_free_alias_pool(struct i2c_atr_alias_pool *alias_pool)
 	kfree(alias_pool);
 }
 
+/* Must be called with alias_pairs_lock held */
+static struct i2c_atr_alias_pair *i2c_atr_create_c2a(struct i2c_atr_chan *chan,
+						     u16 alias, u16 addr)
+{
+	struct i2c_atr_alias_pair *c2a;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
+
+	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
+	if (!c2a)
+		return NULL;
+
+	c2a->addr = addr;
+	c2a->alias = alias;
+
+	list_add(&c2a->node, &chan->alias_pairs);
+
+	return c2a;
+}
+
+static int i2c_atr_reserve_alias(struct i2c_atr_alias_pool *alias_pool)
+{
+	unsigned long idx;
+	u16 alias;
+
+	spin_lock(&alias_pool->lock);
+
+	idx = find_first_zero_bit(alias_pool->use_mask, alias_pool->size);
+	if (idx >= alias_pool->size) {
+		spin_unlock(&alias_pool->lock);
+		return -EBUSY;
+	}
+
+	set_bit(idx, alias_pool->use_mask);
+
+	alias = alias_pool->aliases[idx];
+
+	spin_unlock(&alias_pool->lock);
+	return alias;
+}
+
+static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 alias)
+{
+	unsigned int idx;
+
+	spin_lock(&alias_pool->lock);
+
+	for (idx = 0; idx < alias_pool->size; ++idx) {
+		if (alias_pool->aliases[idx] == alias) {
+			clear_bit(idx, alias_pool->use_mask);
+			spin_unlock(&alias_pool->lock);
+			return;
+		}
+	}
+
+	spin_unlock(&alias_pool->lock);
+}
+
+/* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_find_mapping_by_addr(const struct list_head *list, u16 phys_addr)
+i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
+	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
+	struct list_head *alias_pairs;
+	u16 alias;
+	int ret;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
 
-	list_for_each_entry(c2a, list, node) {
-		if (c2a->addr == phys_addr)
+	alias_pairs = &chan->alias_pairs;
+
+	list_for_each_entry(c2a, alias_pairs, node) {
+		if (c2a->addr == addr)
 			return c2a;
 	}
 
+	if (!(atr->flags & I2C_ATR_FLAG_DYNAMIC_C2A))
+		return NULL;
+
+	ret = i2c_atr_reserve_alias(chan->alias_pool);
+	if (ret < 0) {
+		// If no free aliases are left, replace an existing one
+		if (unlikely(list_empty(alias_pairs)))
+			return NULL;
+
+		list_for_each_entry_reverse(c2a, alias_pairs, node)
+			if (!c2a->fixed)
+				break;
+
+		if (c2a->fixed)
+			return NULL;
+
+		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
+		c2a->addr = addr;
+
+		// Move updated entry to beginning of list
+		list_move(&c2a->node, alias_pairs);
+
+		alias = c2a->alias;
+	} else {
+		alias = ret;
+
+		c2a = i2c_atr_create_c2a(chan, alias, addr);
+		if (!c2a)
+			goto err_release_alias;
+	}
+
+	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
+	if (ret) {
+		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
+			addr, chan->chan_id, ret);
+		goto err_del_c2a;
+	}
+
+	return c2a;
+
+err_del_c2a:
+	list_del(&c2a->node);
+	kfree(c2a);
+err_release_alias:
+	i2c_atr_release_alias(chan->alias_pool, alias);
 	return NULL;
 }
 
@@ -178,7 +304,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 {
 	struct i2c_atr *atr = chan->atr;
 	static struct i2c_atr_alias_pair *c2a;
-	int i;
+	int i, ret = 0;
 
 	/* Ensure we have enough room to save the original addresses */
 	if (unlikely(chan->orig_addrs_size < num)) {
@@ -194,11 +320,13 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		chan->orig_addrs_size = num;
 	}
 
+	mutex_lock(&chan->alias_pairs_lock);
+
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs,
-						   msgs[i].addr);
+		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
+
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
@@ -206,13 +334,19 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 			while (i--)
 				msgs[i].addr = chan->orig_addrs[i];
 
-			return -ENXIO;
+			ret = -ENXIO;
+			goto out_unlock;
 		}
 
+		// Prevent c2a from being overwritten by another client in this transaction
+		c2a->fixed = true;
+
 		msgs[i].addr = c2a->alias;
 	}
 
-	return 0;
+out_unlock:
+	mutex_unlock(&chan->alias_pairs_lock);
+	return ret;
 }
 
 /*
@@ -225,10 +359,24 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 			       int num)
 {
+	struct i2c_atr_alias_pair *c2a;
 	int i;
 
 	for (i = 0; i < num; i++)
 		msgs[i].addr = chan->orig_addrs[i];
+
+	mutex_lock(&chan->alias_pairs_lock);
+
+	if (unlikely(list_empty(&chan->alias_pairs)))
+		goto out_unlock;
+
+	// unfix c2a entries so that subsequent transfers can reuse their aliases
+	list_for_each_entry(c2a, &chan->alias_pairs, node) {
+		c2a->fixed = false;
+	}
+
+out_unlock:
+	mutex_unlock(&chan->alias_pairs_lock);
 }
 
 static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
@@ -266,14 +414,23 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_adapter *parent = atr->parent;
 	struct i2c_atr_alias_pair *c2a;
+	u16 alias;
+
+	mutex_lock(&chan->alias_pairs_lock);
+
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 
-	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs, addr);
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
+		mutex_unlock(&chan->alias_pairs_lock);
 		return -ENXIO;
 	}
 
-	return i2c_smbus_xfer(parent, c2a->alias, flags, read_write, command,
+	alias = c2a->alias;
+
+	mutex_unlock(&chan->alias_pairs_lock);
+
+	return i2c_smbus_xfer(parent, alias, flags, read_write, command,
 			      size, data);
 }
 
@@ -315,44 +472,6 @@ static const struct i2c_lock_operations i2c_atr_lock_ops = {
 	.unlock_bus =  i2c_atr_unlock_bus,
 };
 
-static int i2c_atr_reserve_alias(struct i2c_atr_alias_pool *alias_pool)
-{
-	unsigned long idx;
-	u16 alias;
-
-	spin_lock(&alias_pool->lock);
-
-	idx = find_first_zero_bit(alias_pool->use_mask, alias_pool->size);
-	if (idx >= alias_pool->size) {
-		spin_unlock(&alias_pool->lock);
-		return -EBUSY;
-	}
-
-	set_bit(idx, alias_pool->use_mask);
-
-	alias = alias_pool->aliases[idx];
-
-	spin_unlock(&alias_pool->lock);
-	return alias;
-}
-
-static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 alias)
-{
-	unsigned int idx;
-
-	spin_lock(&alias_pool->lock);
-
-	for (idx = 0; idx < alias_pool->size; ++idx) {
-		if (alias_pool->aliases[idx] == alias) {
-			clear_bit(idx, alias_pool->use_mask);
-			spin_unlock(&alias_pool->lock);
-			return;
-		}
-	}
-
-	spin_unlock(&alias_pool->lock);
-}
-
 static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 			       u16 addr)
 {
@@ -370,7 +489,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 	alias = ret;
 
-	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
+	mutex_lock(&chan->alias_pairs_lock);
+
+	c2a = i2c_atr_create_c2a(chan, alias, addr);
 	if (!c2a) {
 		ret = -ENOMEM;
 		goto err_release_alias;
@@ -378,7 +499,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
 	if (ret)
-		goto err_free;
+		goto err_del_c2a;
 
 	dev_dbg(atr->dev, "chan%u: addr 0x%02x mapped at alias 0x%02x\n",
 		chan->chan_id, addr, alias);
@@ -387,13 +508,16 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	c2a->alias = alias;
 	list_add(&c2a->node, &chan->alias_pairs);
 
-	return 0;
+	goto out_unlock;
 
-err_free:
+err_del_c2a:
+	list_del(&c2a->node);
 	kfree(c2a);
+	c2a = NULL;
 err_release_alias:
 	i2c_atr_release_alias(chan->alias_pool, alias);
-
+out_unlock:
+	mutex_unlock(&chan->alias_pairs_lock);
 	return ret;
 }
 
@@ -406,13 +530,18 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	atr->ops->detach_addr(atr, chan->chan_id, addr);
 
-	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs, addr);
+	mutex_lock(&chan->alias_pairs_lock);
+
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
+		mutex_unlock(&chan->alias_pairs_lock);
 		return;
 	}
 
+	mutex_unlock(&chan->alias_pairs_lock);
+
 	i2c_atr_release_alias(chan->alias_pool, c2a->alias);
 
 	dev_dbg(atr->dev,
@@ -538,7 +667,8 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 }
 
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters)
+			    const struct i2c_atr_ops *ops, int max_adapters,
+			    u16 flags)
 {
 	struct i2c_atr *atr;
 	int ret;
@@ -559,6 +689,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	atr->dev = dev;
 	atr->ops = ops;
 	atr->max_adapters = max_adapters;
+	atr->flags = flags;
 
 	if (parent->algo->master_xfer)
 		atr->algo.master_xfer = i2c_atr_master_xfer;
@@ -631,6 +762,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	chan->atr = atr;
 	chan->chan_id = chan_id;
 	INIT_LIST_HEAD(&chan->alias_pairs);
+	mutex_init(&chan->alias_pairs_lock);
 	mutex_init(&chan->orig_addrs_lock);
 
 	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
@@ -707,6 +839,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 err_fwnode_put:
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
+	mutex_destroy(&chan->alias_pairs_lock);
 	kfree(chan);
 	return ret;
 }
@@ -743,6 +876,7 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
+	mutex_destroy(&chan->alias_pairs_lock);
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5a836731af6c701ef4070eb2dbab36cbdd86e0a2..06e7450d69877485360852ea9d811723b2ec8cb3 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1099,7 +1099,7 @@ static int ub960_init_atr(struct ub960_data *priv)
 	struct i2c_adapter *parent_adap = priv->client->adapter;
 
 	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
-				priv->hw_data->num_rxports);
+				priv->hw_data->num_rxports, 0);
 	if (IS_ERR(priv->atr))
 		return PTR_ERR(priv->atr);
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 1c3a5bcd939fc56f4a6ca1b6a5cc0ac2c17083b7..9287f064b683cc3cf83016b720c4e6ccd38df426 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -65,6 +65,7 @@ struct i2c_atr_adap_desc {
  * @dev:          The device acting as an ATR
  * @ops:          Driver-specific callbacks
  * @max_adapters: Maximum number of child adapters
+ * @flags:        Options to pass to the ATR framework. Allowed flags are I2C_ATR_FLAG_*
  *
  * The new ATR helper is connected to the parent adapter but has no child
  * adapters. Call i2c_atr_add_adapter() to add some.
@@ -74,7 +75,17 @@ struct i2c_atr_adap_desc {
  * Return: pointer to the new ATR helper object, or ERR_PTR
  */
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters);
+			    const struct i2c_atr_ops *ops, int max_adapters,
+			    u16 flags);
+
+/*
+ * I2C ATR flags
+ *
+ * I2C_ATR_FLAG_DYNAMIC_C2A: Dynamically update translation table when transfers
+ *                           targeting unmapped addresses are requested.
+ *
+ */
+#define I2C_ATR_FLAG_DYNAMIC_C2A BIT(0)
 
 /**
  * i2c_atr_delete - Delete an I2C ATR helper.

-- 
2.47.0


