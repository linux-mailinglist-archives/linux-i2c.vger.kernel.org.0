Return-Path: <linux-i2c+bounces-9574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BCA43DEC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF98317EE67
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E869268FE2;
	Tue, 25 Feb 2025 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeyQ2cCi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23D268C6E;
	Tue, 25 Feb 2025 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483602; cv=none; b=VAse08atPCp7f8wZT6gjHfw+Gi5ojJbxv4Y5n7kkDIKhYb1gHy4NM+Q1O935ghA5Cxf6eLA2on17NU2jGX/HmYwcltkqlhaUquf/AsR/bARvIVvqDAgCzzRlGsAqPMglefM6/B4Tn+FZbNbr/asKTRWfYifw5AcH66mEvittA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483602; c=relaxed/simple;
	bh=Q6QxPvHVAiQEose/4To9DXpC60R/SWIoGeYUvA9Uk9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyeV27NRF9wr6t+46icpbmzytm1I1570g8+WDNjNluOkZcRLi16FA7lWGzAAIHk17zxp1KFWV7K4bHb92T4PYHjtMGgwxA2Oy5MW4zzQVqxCy9+Rt16dWG05L8CCZvE7i1d00/w25R8fekg6YRW8srhjU7bPAPrGMNdcyT1ZMHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeyQ2cCi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb7f539c35so1064896966b.1;
        Tue, 25 Feb 2025 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483598; x=1741088398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ka0jueQHoGkiXve29SH/UxFln+xLNtVSmxGTyKTR6k=;
        b=DeyQ2cCiAAax7XiDrR8ln39ATIM3rIfCG7L73zuXnvd+d0CVTp2bt9OsSDMSryoUuB
         lHVA24w4P/nuPRFP+lWwmLreD68jB5oR7UIQwBu6yZsovVu6yhJvqTbzID637TSQiELA
         lG/tXzg0+GzJLnXYHUg0cpdHB/cR7nIu5+OIUjejQXR6vsxLnlye4YYzEtXjio+l2uqJ
         SPQ411Bl320onVCbr19xYwxPNwjWmSGgs056UPdPAQRHVxG1mBZoQ6x8xHE7qj/K5rp0
         hpGiijesV1RSKEgNdQOKUk2Qg4IbAB/4L2ZcPvFeefUgw41mYwanjjFC00bGXQNAXRRl
         kNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483598; x=1741088398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ka0jueQHoGkiXve29SH/UxFln+xLNtVSmxGTyKTR6k=;
        b=bFGTV23heiMfzNrBv419NOFkGbeimKKgGDc/p07aDQ79H7kpN7JDT8jszyv/15tBCR
         5ihTYAHTb8sLjhBxkRIyvWlG6zjbC8RpUsecVassuX55ZHoI8O729iKD7qJzO1nFxwXA
         m30BhHq814AOByhEDavy8Y92KK6IBt8nMiO6IVd7d8s8yRr9fUlPEX5tEEzmn5E/UvPG
         1Yd+EZBHATTE2IAy5u9TaS1Rii5sxCXNj0YyXNcfHwiZ8rbilUl5leO/M0ROmOGd3bkQ
         br0MBjDktrAfvQ9ll9xJkegyyg4+Vx/YrEsbHrp2P3U0GPyb5V4R1if7RscP3Q553orH
         aXdg==
X-Forwarded-Encrypted: i=1; AJvYcCVKB1lyi1BJdSIySlvqHLkhZy1Hu2VvgPWocOLyg49yvBSNOQwaol3p2oL4raR/+W4OOkqhzWpvkUdS14UR@vger.kernel.org, AJvYcCX0qba+Ok5aX1uJY/I2jfQi5r9XII1+Xq0oYxSB8ecbD6fGmcLDTFHI0qUV9AKBp/PGSEbdm3O0rg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJKFFgpceSqfZjy+6xGHYY7HhRm8oFjjo6LEUv1B5zGIiD5vW
	w0NDm9UAPzLQHSCYIjrxONOtn73yair8YNLcqRYAW9XxWtZEc74hcuX/pQ==
X-Gm-Gg: ASbGncvTGViWxQuLjfQKzAaQoyUctFAGif00xVWhabERW25LHYDBkw5xl6iJCDIikN6
	iPPMdDbXCN4BUYZL5RSwmWXuAMDyRoefNhHYJRU9GIiX6thM9K4Ae2Sb2rG91Dg4FWpauXx19if
	I1xT5ENlUQgbyQmJFikoHVb8/Wj76Ej/QnBHTJhv9ZXK9CKeQPRvl1aA52UyEErVtjv/1jYN+5E
	ITY2IiF9A8niPp+8IbY32kQl9PFGFhV1cYHvPFSGWG4QLZGY8AZD2u4GetaFWrzc+Gq+3qTY4kW
	w6QCpJC2xWwZDwVMLeHUtzm4xKanJJDzuiquav0=
X-Google-Smtp-Source: AGHT+IGtaTRnSObhg17rh5Hcn77Ae+STyqfN8/20QTooo19R4PLudKlBkT24Yt8Va2iooeF2Mwye9A==
X-Received: by 2002:a17:906:1712:b0:abe:e09e:b4cd with SMTP id a640c23a62f3a-abee09eb78fmr82964466b.48.1740483598457;
        Tue, 25 Feb 2025 03:39:58 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:58 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 8/9] i2c: atr: add static flag
Date: Tue, 25 Feb 2025 13:39:36 +0200
Message-ID: <20250225113939.49811-9-demonsingur@gmail.com>
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

Some I2C ATRs do not support dynamic remapping, only static mapping
of direct children.

Add a new flag that prevents old mappings to be replaced or new mappings
to be created in the alias finding code paths.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c   | 16 ++++++++++++----
 include/linux/i2c-atr.h | 20 +++++++++++++++++---
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index d8748d71ae15..f7b853f55630 100644
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
 
@@ -339,12 +341,16 @@ i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 static struct i2c_atr_alias_pair *
 i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
+	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
 
 	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (c2a)
 		return c2a;
 
+	if (atr->flags & I2C_ATR_STATIC)
+		return NULL;
+
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
 	if (c2a)
 		return c2a;
@@ -543,7 +549,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	mutex_lock(&chan->alias_pairs_lock);
 
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
-	if (!c2a)
+	if (!c2a && !(atr->flags & I2C_ATR_STATIC))
 		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
 
 	if (!c2a) {
@@ -702,8 +708,9 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
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
@@ -725,6 +732,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	atr->dev = dev;
 	atr->ops = ops;
 	atr->max_adapters = max_adapters;
+	atr->flags = flags;
 
 	if (parent->algo->master_xfer)
 		atr->algo.master_xfer = i2c_atr_master_xfer;
@@ -752,7 +760,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_new, "I2C_ATR");
+EXPORT_SYMBOL_NS_GPL(i2c_atr_new_flags, "I2C_ATR");
 
 void i2c_atr_delete(struct i2c_atr *atr)
 {
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 1c3a5bcd939f..2f79d0d9140f 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -18,6 +18,15 @@ struct device;
 struct fwnode_handle;
 struct i2c_atr;
 
+/**
+ * enum i2c_atr_flags - Flags for an I2C ATR driver
+ *
+ * @I2C_ATR_STATIC: ATR does not support dynamic mapping, use static mapping
+ */
+enum i2c_atr_flags {
+	I2C_ATR_STATIC = BIT(0),
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


