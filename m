Return-Path: <linux-i2c+bounces-9268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90121A25928
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 13:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DE6B18897ED
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B58204C29;
	Mon,  3 Feb 2025 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaWByffv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1AE2046B3;
	Mon,  3 Feb 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585001; cv=none; b=BFITtVSDTsqIHPos0kXT17nIMS5sPL0aKZLVSaGa8Nq6s8ACICyH9GUaWMF3ND3wbXZwHlKJz93Kv34XmmiUOflbkvi7IIMEfNOBaB89zbUyBGuFXjIG2lzLfZfFemxEKrFyQTh+YDWB4NIRMsqQahenbfK6JJiejKxoXW+0p9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585001; c=relaxed/simple;
	bh=YuQbtxF/0uj/9v3z5S3Lkwr3pWSd+re9V4XEsn+KtY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hs/1vIZaM9KD6Aebyt2QSc5BUCgyaJ8GhwR4bh1WXHTCLaaogswMb6Z1z7aoKj7XclfpKINIqR5GhmLucgN7xVwS/3oJhar/zf9Uv26bp+1aRpRQMzrih6Q3gIPlxrosmeRdIJpXbeY4h8/4vtGgXMa0/L5iO/z7pVBY9nhuax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaWByffv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so44842305e9.1;
        Mon, 03 Feb 2025 04:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584997; x=1739189797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dtc0ZCnm8/eC9KODTwvCTS4jrazLi7CE3FYwUcCkFj4=;
        b=LaWByffvVh+mntuMVu+Y027LPeGxNhS2HGoiSbYCGiZUY6yuioo5RIAB5mPsXsqvgp
         35S3U8eOhHQ8BbQkpEmG6f8wozEl2k5dCgzatihO5ktVAFBXS9l069/BsoNRaNqicCW6
         1tdkSicPMk3zv13weAcZDOPvkOkYjsZp94ED44VqJYsraxosoDD2iIfOsnZQ3H/stUnv
         zoYVLOo5RWDGcD3fNHw+uFS9O5QC3MyENpi55MG7vKZK7Av2JLKqKUYJnOdZbpfFv3bd
         OfXE4RtTOLWoeFvN7x6CjEiKG2ACSb/Ff088PcL0yy/z8O4s1IR796jmlegVCwIrkvoZ
         6z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584997; x=1739189797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dtc0ZCnm8/eC9KODTwvCTS4jrazLi7CE3FYwUcCkFj4=;
        b=MWqUqOUYbOsy7lKCz7P6zUYp4EwXtRi1prrYfFuh0pdZ9biPrJbAOeqlYnv7nnYdIU
         u5q0NILDeumXe+8ijPiLjw8AoHth6kY5fI5oo62RDWhK9IJ89AezRDj9J9K9aSu5Xyhl
         Kv7CMxywFnVpHatb13MErw01sTZOVA0yfQcv8baqn03nAx68Ws30Wfg2IosB3/30leEZ
         utgmZAN5FGghkvrkdx28RJ4u4AN+mScuOOB+a9D1XcFtzioft9OmbvMdXD1yT0Z8miu1
         LpBgcWVtvGF7HVWrDT5PIKuGsoppW41VVQaYZl86W33QMSMa5XCUzyGfCxMGjPXX9/A6
         nVzA==
X-Forwarded-Encrypted: i=1; AJvYcCUN8o+pqqbPP38Ke7IfTNDvM2d1ZMo3NNMzbddnEQuaZpreX3+SOfc1Ik6X3CKaLwVOq+Qq6NNWM/A=@vger.kernel.org, AJvYcCXX9Xphn15e/fvqh0jTGVZugduKch5Zy0U7O1mXHbB0GzmbmJOHcLJCCDb/G/t4eQZ2SXxkwxua5e3uLq6w@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nDL0lkoNP3WYdVuajMyjKG6bsZOzCl9f//W/53jAGYyRNFXu
	httGLnl6SfesA2vczmCqfjO5GBOM86fN/lG+vlkr4VeCgAmSbwhM0tDf5w==
X-Gm-Gg: ASbGncugxpcJgwyGzUPU/IrzohSSrZmQgEqjmAxjrUAf1fnZ9CFIgpmqpnJ1e8+ix0b
	WhzsLfp52lMGjfCNlMNU8n/xq66+Cf635ReVRoUv8RYjwRMOuD6J2pyi5n0TEUD+9djrIb7dEu0
	jybzTdToqqLEEEDccuW/81qb/4lujEOdNKZSVgDN9BgSucZNtjfq0TGis7AGG8yYDzP9prQMtQ3
	9n0PC664FqVljfzBT9b4BJKnkc+LDfx6zNnU7mfFvqTVhHvD81e1su2Uivfb5bbNrAt8UGV9f/B
	xX769tsuUx+aIQdFf7RDPT4Fk2o=
X-Google-Smtp-Source: AGHT+IHhPpDkiEh0xogPX+coK9qZVwBFg88jC2rMPsY829UGLfoZBxcyKdx78bZYRaao/0sxhghMvA==
X-Received: by 2002:a05:600c:3149:b0:438:c18c:5ad8 with SMTP id 5b1f17b1804b1-438dc434e10mr190503235e9.31.1738584997191;
        Mon, 03 Feb 2025 04:16:37 -0800 (PST)
Received: from demon-pc.localdomain ([86.121.79.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa3dsm12805326f8f.93.2025.02.03.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:16:36 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 3/3] i2c: atr: add passthrough flag
Date: Mon,  3 Feb 2025 14:15:17 +0200
Message-ID: <20250203121629.2027871-4-demonsingur@gmail.com>
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

Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
the child ATRs need to be forwarded as-is since the parent I2C ATR can
only do address remapping for the direct children.

In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
address remapping hardware capabilities, but it is able to select which
GMSL link to talk to, allowing it to change the address of the
serializer.

The child ATRs need to have their alias pools defined in such a way to
prevent overlapping addresses between them, but there's no way around
this without orchestration between multiple ATR instances.

To allow for this use-case, add a flag that allows unmapped addresses
to be passed through, since they are already remapped by the child ATRs,
and disables dynamic remapping, since devices that need passthrough
messages to be forwarded as-is, can only handle remapping for their
direct children.

There's no case where a non-remapped address will hit the parent ATR.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c   | 26 ++++++++++++++++++--------
 include/linux/i2c-atr.h | 20 +++++++++++++++++---
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 13f7e07fd8e87..5f0e8f1cf69f7 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -106,6 +106,7 @@ struct i2c_atr_chan {
  * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
  * @lock_key:  Lock key for @lock
  * @max_adapters: Maximum number of adapters this I2C ATR can have
+ * @flags:     Flags for ATR
  * @alias_pool: Optional common pool of available client aliases
  * @i2c_nb:    Notifier for remote client add & del events
  * @adapter:   Array of adapters
@@ -122,6 +123,7 @@ struct i2c_atr {
 	struct mutex lock;
 	struct lock_class_key lock_key;
 	int max_adapters;
+	u32 flags;
 
 	struct i2c_atr_alias_pool *alias_pool;
 
@@ -241,7 +243,7 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
 
 /* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr, bool new_addr)
 {
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
@@ -260,6 +262,9 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 
 	ret = i2c_atr_reserve_alias(chan->alias_pool);
 	if (ret < 0) {
+		if (!new_addr && (atr->flags & I2C_ATR_PASSTHROUGH))
+			return NULL;
+
 		// If no free aliases are left, replace an existing one
 		if (unlikely(list_empty(alias_pairs)))
 			return NULL;
@@ -335,9 +340,12 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
+		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr, false);
 
 		if (!c2a) {
+			if (atr->flags & I2C_ATR_PASSTHROUGH)
+				continue;
+
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
 
@@ -428,7 +436,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr, false);
 
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
@@ -491,7 +499,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr, true);
 	if (!c2a) {
 		dev_err(atr->dev, "failed to find a free alias\n");
 		mutex_unlock(&chan->alias_pairs_lock);
@@ -517,7 +525,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr, false);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
@@ -650,8 +658,9 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 	return ret;
 }
 
-struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters)
+struct i2c_atr *i2c_atr_new_flags(struct i2c_adapter *parent, struct device *dev,
+				  const struct i2c_atr_ops *ops, int max_adapters,
+				  u32 flags)
 {
 	struct i2c_atr *atr;
 	int ret;
@@ -673,6 +682,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	atr->dev = dev;
 	atr->ops = ops;
 	atr->max_adapters = max_adapters;
+	atr->flags = flags;
 
 	if (parent->algo->master_xfer)
 		atr->algo.master_xfer = i2c_atr_master_xfer;
@@ -700,7 +710,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_new, "I2C_ATR");
+EXPORT_SYMBOL_NS_GPL(i2c_atr_new_flags, "I2C_ATR");
 
 void i2c_atr_delete(struct i2c_atr *atr)
 {
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 1c3a5bcd939fc..116067b5b9ba6 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -18,6 +18,15 @@ struct device;
 struct fwnode_handle;
 struct i2c_atr;
 
+/**
+ * enum i2c_atr_flags - Flags for an I2C ATR driver
+ *
+ * @I2C_ATR_PASSTHROUGH: Allow unmapped incoming addresses to pass through
+ */
+enum i2c_atr_flags {
+	I2C_ATR_PASSTHROUGH = BIT(0),
+};
+
 /**
  * struct i2c_atr_ops - Callbacks from ATR to the device driver.
  * @attach_addr: Notify the driver of a new device connected on a child
@@ -60,11 +69,12 @@ struct i2c_atr_adap_desc {
 };
 
 /**
- * i2c_atr_new() - Allocate and initialize an I2C ATR helper.
+ * i2c_atr_new_flags() - Allocate and initialize an I2C ATR helper.
  * @parent:       The parent (upstream) adapter
  * @dev:          The device acting as an ATR
  * @ops:          Driver-specific callbacks
  * @max_adapters: Maximum number of child adapters
+ * @flags:        Flags for ATR
  *
  * The new ATR helper is connected to the parent adapter but has no child
  * adapters. Call i2c_atr_add_adapter() to add some.
@@ -73,8 +83,12 @@ struct i2c_atr_adap_desc {
  *
  * Return: pointer to the new ATR helper object, or ERR_PTR
  */
-struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters);
+struct i2c_atr *i2c_atr_new_flags(struct i2c_adapter *parent, struct device *dev,
+				  const struct i2c_atr_ops *ops, int max_adapters,
+				  u32 flags);
+
+#define i2c_atr_new(parent, dev, ops, max_adapters) \
+	i2c_atr_new_flags(parent, dev, ops, max_adapters, 0)
 
 /**
  * i2c_atr_delete - Delete an I2C ATR helper.
-- 
2.48.1


