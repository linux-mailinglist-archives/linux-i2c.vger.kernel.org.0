Return-Path: <linux-i2c+bounces-9293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DFA26E71
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 10:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D32CB1885D24
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D9820D4FF;
	Tue,  4 Feb 2025 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L7pEl6Ib"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A820B1EB;
	Tue,  4 Feb 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661373; cv=none; b=beIzWI+ui2SkW8PeyQ2z7Czv/7HN1iZMZRWAwgDLHkPvLowiIc1GGwyb4YPaF0+39pu5dqTiPVsMUvVrosEfXztwaFRPqEb7afQiFvKwEc82akZAdomcoad4QL/Io997H33MtVVNVs8gNdUf4so4drdugc31QgzNbVUDtMFO/zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661373; c=relaxed/simple;
	bh=9UyTqG6Scxnw2JCbscV5mgn9TTmIFbUHcnqLy7WyfA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWEdUBgK/hvV7uovCMr3pB7T6Cte+NFWpfTC5R/wQXCWdeor4I/uVLPYUP6YmVaA+x/j+1+xJ+5G2K4g+EDwyNJ7DUynY/ZI3RQETl+oRhnWiHi8l3c61obiOoTAyeuxnXQRCbOMSTDS4dSFKev1tSorHOjmsup0apz00ijq5r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L7pEl6Ib; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3183743424;
	Tue,  4 Feb 2025 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738661367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JO7X/XjeAWCq1N/Kk05dh0ZWAY65eHnekvIueQlv25A=;
	b=L7pEl6IbZHpoEX9u9TnXDjxD/ATZhmTikEhkeAflqD828s4ZXoDOEk/Gu46PLBPUa4DTXd
	TWoK1+PfW6BlgZo/fPSyhkcJ65gnGDWYNz7jYgJlyIbAtumL7mum8LncSpVdT9U9hbqPn1
	OJC5hshjlzLDdKkXCPmm8nZ+RW4//wEdNkOcZR3x4w8x4lwmBSwJyUXQZ05+ng6k2sTRww
	hubRgqF0vVhDzeyD1nByCs8vXVueDBMLwfDN84l4+mReqqa0DbQ9FihI9OHEKLufpDCa/+
	/9dWQ/dAwBWEbbQ/Im8rUUfzNIHsrEYIe5M/q8XufsrhATifZfOIfeHBF8fR4w==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 04 Feb 2025 10:29:18 +0100
Subject: [PATCH v7 7/9] i2c: support per-channel ATR alias pools
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-fpc202-v7-7-78b4b8a35cf1@bootlin.com>
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
In-Reply-To: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelieefteelffeuheevtdetkefhfffhteffkefgtefhkeevudeutdeugfffheegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudefngdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghrvghkrdhkihgvrhhnrghnsegrmhgurdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghns
 ehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegurhgrghgrnhdrtghvvghtihgtsegrmhgurdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

Some I2C address translators (ATRs) assign each of their remote peripheral
aliases to a specific channel. To properly handle these devices, add
support for having separate alias pools for each ATR channel.

This is achieved by allowing callers of i2c_atr_add_adapter to pass an
optional alias list. If present, this list will be used to populate the
channel's alias pool. Otherwise, the common alias pool will be used.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c         | 74 ++++++++++++++++++++++++++++++-------------
 drivers/media/i2c/ds90ub913.c |  9 ++++--
 drivers/media/i2c/ds90ub953.c |  9 ++++--
 include/linux/i2c-atr.h       | 34 ++++++++++++++------
 4 files changed, 91 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 01f8c6f6e68a0a6012101a201c3fd8c7c0f25b47..6b4cf979b86e0dcbba3bd9dbb297a8b5e6216dd5 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -37,6 +37,7 @@ struct i2c_atr_alias_pair {
 /**
  * struct i2c_atr_alias_pool - Pool of client aliases available for an ATR.
  * @size:     Total number of aliases
+ * @shared:   Indicates if this alias pool is shared by multiple channels
  *
  * @lock:     Lock protecting @aliases and @use_mask
  * @aliases:  Array of aliases, must hold exactly @size elements
@@ -44,6 +45,7 @@ struct i2c_atr_alias_pair {
  */
 struct i2c_atr_alias_pool {
 	size_t size;
+	bool shared;
 
 	/* Protects aliases and use_mask */
 	spinlock_t lock;
@@ -58,6 +60,8 @@ struct i2c_atr_alias_pool {
  * @chan_id:         The ID of this channel
  * @alias_pairs:     List of @struct i2c_atr_alias_pair containing the
  *                   assigned aliases
+ * @alias_pool:      Pool of available client aliases
+ *
  * @orig_addrs_lock: Mutex protecting @orig_addrs
  * @orig_addrs:      Buffer used to store the original addresses during transmit
  * @orig_addrs_size: Size of @orig_addrs
@@ -68,6 +72,7 @@ struct i2c_atr_chan {
 	u32 chan_id;
 
 	struct list_head alias_pairs;
+	struct i2c_atr_alias_pool *alias_pool;
 
 	/* Lock orig_addrs during xfer */
 	struct mutex orig_addrs_lock;
@@ -84,7 +89,7 @@ struct i2c_atr_chan {
  * @algo:      The &struct i2c_algorithm for adapters
  * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
  * @max_adapters: Maximum number of adapters this I2C ATR can have
- * @alias_pool: Pool of available client aliases
+ * @alias_pool: Optional common pool of available client aliases
  * @i2c_nb:    Notifier for remote client add & del events
  * @adapter:   Array of adapters
  */
@@ -107,7 +112,7 @@ struct i2c_atr {
 	struct i2c_adapter *adapter[] __counted_by(max_adapters);
 };
 
-static struct i2c_atr_alias_pool *i2c_atr_alloc_alias_pool(size_t num_aliases)
+static struct i2c_atr_alias_pool *i2c_atr_alloc_alias_pool(size_t num_aliases, bool shared)
 {
 	struct i2c_atr_alias_pool *alias_pool;
 	int ret;
@@ -130,6 +135,8 @@ static struct i2c_atr_alias_pool *i2c_atr_alloc_alias_pool(size_t num_aliases)
 		goto err_free_aliases;
 	}
 
+	alias_pool->shared = shared;
+
 	spin_lock_init(&alias_pool->lock);
 
 	return alias_pool;
@@ -357,7 +364,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	u16 alias;
 	int ret;
 
-	ret = i2c_atr_reserve_alias(atr->alias_pool);
+	ret = i2c_atr_reserve_alias(chan->alias_pool);
 	if (ret < 0) {
 		dev_err(atr->dev, "failed to find a free alias\n");
 		return ret;
@@ -387,7 +394,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 err_free:
 	kfree(c2a);
 err_release_alias:
-	i2c_atr_release_alias(atr->alias_pool, alias);
+	i2c_atr_release_alias(chan->alias_pool, alias);
 
 	return ret;
 }
@@ -408,7 +415,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 		return;
 	}
 
-	i2c_atr_release_alias(atr->alias_pool, c2a->alias);
+	i2c_atr_release_alias(chan->alias_pool, c2a->alias);
 
 	dev_dbg(atr->dev,
 		"chan%u: detached alias 0x%02x from addr 0x%02x\n",
@@ -469,16 +476,20 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 	u32 *aliases32;
 	int ret;
 
-	ret = fwnode_property_count_u32(dev_fwnode(dev), "i2c-alias-pool");
-	if (ret < 0) {
-		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
-			ret);
-		return ret;
-	}
+	if (!fwnode_property_present(dev_fwnode(dev), "i2c-alias-pool")) {
+		num_aliases = 0;
+	} else {
+		ret = fwnode_property_count_u32(dev_fwnode(dev), "i2c-alias-pool");
+		if (ret < 0) {
+			dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
+				ret);
+			return ret;
+		}
 
-	num_aliases = ret;
+		num_aliases = ret;
+	}
 
-	alias_pool = i2c_atr_alloc_alias_pool(num_aliases);
+	alias_pool = i2c_atr_alloc_alias_pool(num_aliases, true);
 	if (IS_ERR(alias_pool)) {
 		ret = PTR_ERR(alias_pool);
 		dev_err(dev, "Failed to allocate alias pool, err %d\n", ret);
@@ -592,15 +603,15 @@ void i2c_atr_delete(struct i2c_atr *atr)
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, "I2C_ATR");
 
-int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
-			struct device *adapter_parent,
-			struct fwnode_handle *bus_handle)
+int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 {
+	struct fwnode_handle *bus_handle = desc->bus_handle;
 	struct i2c_adapter *parent = atr->parent;
+	char symlink_name[ATR_MAX_SYMLINK_LEN];
 	struct device *dev = atr->dev;
+	u32 chan_id = desc->chan_id;
 	struct i2c_atr_chan *chan;
-	char symlink_name[ATR_MAX_SYMLINK_LEN];
-	int ret;
+	int ret, idx;
 
 	if (chan_id >= atr->max_adapters) {
 		dev_err(dev, "No room for more i2c-atr adapters\n");
@@ -616,8 +627,8 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	if (!chan)
 		return -ENOMEM;
 
-	if (!adapter_parent)
-		adapter_parent = dev;
+	if (!desc->parent)
+		desc->parent = dev;
 
 	chan->atr = atr;
 	chan->chan_id = chan_id;
@@ -629,7 +640,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	chan->adap.owner = THIS_MODULE;
 	chan->adap.algo = &atr->algo;
 	chan->adap.algo_data = chan;
-	chan->adap.dev.parent = adapter_parent;
+	chan->adap.dev.parent = desc->parent;
 	chan->adap.retries = parent->retries;
 	chan->adap.timeout = parent->timeout;
 	chan->adap.quirks = parent->quirks;
@@ -656,13 +667,26 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 		fwnode_handle_put(atr_node);
 	}
 
+	if (desc->num_aliases > 0) {
+		chan->alias_pool = i2c_atr_alloc_alias_pool(desc->num_aliases, false);
+		if (IS_ERR(chan->alias_pool)) {
+			ret = PTR_ERR(chan->alias_pool);
+			goto err_fwnode_put;
+		}
+
+		for (idx = 0; idx < desc->num_aliases; idx++)
+			chan->alias_pool->aliases[idx] = desc->aliases[idx];
+	} else {
+		chan->alias_pool = atr->alias_pool;
+	}
+
 	atr->adapter[chan_id] = &chan->adap;
 
 	ret = i2c_add_adapter(&chan->adap);
 	if (ret) {
 		dev_err(dev, "failed to add atr-adapter %u (error=%d)\n",
 			chan_id, ret);
-		goto err_fwnode_put;
+		goto err_free_alias_pool;
 	}
 
 	snprintf(symlink_name, sizeof(symlink_name), "channel-%u",
@@ -679,6 +703,9 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 
 	return 0;
 
+err_free_alias_pool:
+	if (!chan->alias_pool->shared)
+		i2c_atr_free_alias_pool(chan->alias_pool);
 err_fwnode_put:
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
@@ -711,6 +738,9 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 
 	i2c_del_adapter(adap);
 
+	if (!chan->alias_pool->shared)
+		i2c_atr_free_alias_pool(chan->alias_pool);
+
 	atr->adapter[chan_id] = NULL;
 
 	fwnode_handle_put(fwnode);
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bfb688f00d7bf5a109e978f6c322e6..bedfeb5f9273ac48d29b480cc7cee67e55e926a2 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -670,6 +670,7 @@ static int ub913_i2c_master_init(struct ub913_data *priv)
 static int ub913_add_i2c_adapter(struct ub913_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	struct i2c_atr_adap_desc desc = { };
 	struct fwnode_handle *i2c_handle;
 	int ret;
 
@@ -677,8 +678,12 @@ static int ub913_add_i2c_adapter(struct ub913_data *priv)
 	if (!i2c_handle)
 		return 0;
 
-	ret = i2c_atr_add_adapter(priv->plat_data->atr, priv->plat_data->port,
-				  dev, i2c_handle);
+	desc.chan_id = priv->plat_data->port;
+	desc.parent = dev;
+	desc.bus_handle = i2c_handle;
+	desc.num_aliases = 0;
+
+	ret = i2c_atr_add_adapter(priv->plat_data->atr, &desc);
 
 	fwnode_handle_put(i2c_handle);
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332de3dfd89a0720ada64cdfa3297de..11d541bdc80e054c83a8c84c2f2b8d400db74a4a 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1122,6 +1122,7 @@ static int ub953_register_clkout(struct ub953_data *priv)
 static int ub953_add_i2c_adapter(struct ub953_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	struct i2c_atr_adap_desc desc = { };
 	struct fwnode_handle *i2c_handle;
 	int ret;
 
@@ -1129,8 +1130,12 @@ static int ub953_add_i2c_adapter(struct ub953_data *priv)
 	if (!i2c_handle)
 		return 0;
 
-	ret = i2c_atr_add_adapter(priv->plat_data->atr, priv->plat_data->port,
-				  dev, i2c_handle);
+	desc.chan_id = priv->plat_data->port;
+	desc.parent = dev;
+	desc.bus_handle = i2c_handle;
+	desc.num_aliases = 0;
+
+	ret = i2c_atr_add_adapter(priv->plat_data->atr, &desc);
 
 	fwnode_handle_put(i2c_handle);
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 14c1f9175c0db6a8a9c6ef5d771ae68361132a76..1c3a5bcd939fc56f4a6ca1b6a5cc0ac2c17083b7 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -36,6 +36,29 @@ struct i2c_atr_ops {
 			    u16 addr);
 };
 
+/**
+ * struct i2c_atr_adap_desc - An ATR downstream bus descriptor
+ * @chan_id:        Index of the new adapter (0 .. max_adapters-1).  This value is
+ *                  passed to the callbacks in `struct i2c_atr_ops`.
+ * @parent:         The device used as the parent of the new i2c adapter, or NULL
+ *                  to use the i2c-atr device as the parent.
+ * @bus_handle:     The fwnode handle that points to the adapter's i2c
+ *                  peripherals, or NULL.
+ * @num_aliases:    The number of aliases in this adapter's private alias pool. Set
+ *                  to zero if this adapter uses the ATR's global alias pool.
+ * @aliases:        An optional array of private aliases used by the adapter
+ *                  instead of the ATR's global pool of aliases. Must contain
+ *                  exactly num_aliases entries if num_aliases > 0, is ignored
+ *                  otherwise.
+ */
+struct i2c_atr_adap_desc {
+	u32 chan_id;
+	struct device *parent;
+	struct fwnode_handle *bus_handle;
+	size_t num_aliases;
+	u16 *aliases;
+};
+
 /**
  * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
  * @parent:       The parent (upstream) adapter
@@ -65,12 +88,7 @@ void i2c_atr_delete(struct i2c_atr *atr);
 /**
  * i2c_atr_add_adapter - Create a child ("downstream") I2C bus.
  * @atr:        The I2C ATR
- * @chan_id:    Index of the new adapter (0 .. max_adapters-1).  This value is
- *              passed to the callbacks in `struct i2c_atr_ops`.
- * @adapter_parent: The device used as the parent of the new i2c adapter, or NULL
- *                  to use the i2c-atr device as the parent.
- * @bus_handle: The fwnode handle that points to the adapter's i2c
- *              peripherals, or NULL.
+ * @desc:       An ATR adapter descriptor
  *
  * After calling this function a new i2c bus will appear. Adding and removing
  * devices on the downstream bus will result in calls to the
@@ -85,9 +103,7 @@ void i2c_atr_delete(struct i2c_atr *atr);
  *
  * Return: 0 on success, a negative error code otherwise.
  */
-int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
-			struct device *adapter_parent,
-			struct fwnode_handle *bus_handle);
+int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc);
 
 /**
  * i2c_atr_del_adapter - Remove a child ("downstream") I2C bus added by

-- 
2.47.1


