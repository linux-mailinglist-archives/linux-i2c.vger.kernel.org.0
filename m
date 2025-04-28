Return-Path: <linux-i2c+bounces-10653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E03A9EDD6
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F403A54CB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75457263F24;
	Mon, 28 Apr 2025 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddm5iH+f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71320262FC5;
	Mon, 28 Apr 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835932; cv=none; b=YSvQ/zItGwSRaBw66hCMk7xJOk+MpXxRa+3MvxEeLT3HE9MttwCTys+Ml1RDx2aW+EdPe6+rpARLMbU9R7mo2JwSRC36XdTsLgY0MPzxjE0p0pmgC0UI0+hJUIOfy0tEw36pz0LDAxDoPTzl3zMQx2VYTLnMv8gJ7gGvfj1ayK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835932; c=relaxed/simple;
	bh=a03NI+MuNzuVZP8v4sBl/eM/Sl6EwDBIkZ7zxPYoFZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+ExXsKgjp83X3MkJ1zht4zAGnEklKu+D2yg9FmdqJHrdFGAo/Fd3rIrXD5H6bw6RtCp4Egrd0AvyUMGv6tFD6EGE5a+iwrAPzuFXYDqNifwl0oXQAFGlzzGrVNGBbi7e1WDuDwrqh8g+f7rS3XY02i/Pj57cTvkrRVikG4X3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddm5iH+f; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf257158fso26005535e9.2;
        Mon, 28 Apr 2025 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835929; x=1746440729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2f2rJOutKW7X6JUjBl+o0IcmFLA8VTw6r7e8yFew5Y=;
        b=Ddm5iH+faNr0lzKEQvBNahcrLdBDi4ms4WJAcqi3jw51PeVrZxvuRcBEXn0JIzz95E
         8vJUTPn11qr2KhYaH4pYnYLy4m2I9TnGFFjJW04FGXQ/IMGT8Q3LSjYE+Gk/GR4xsDMd
         w40LyGTK0Fet8QQ6tqtzZ+QPi3QJGTYwK7RkpDFiw0aWpx+pVfPf0ny+G1Phixk2iJXq
         /QcTYmbe0alDI99/EelOjBVt+y8lXVXBcYp0C4w+SAoORCSnNHEAYHcad2NOL7O7/I2N
         b3jEBiiqCaKjLVWDDMP8lso2mQkE0CWuXwo837HAYa3FJM+3MA/iUmp6Q9ZUWWC9CrU7
         esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835929; x=1746440729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2f2rJOutKW7X6JUjBl+o0IcmFLA8VTw6r7e8yFew5Y=;
        b=fJxqv4uGuO1uh/NRecz68e5adweP11Mko1ISZEJQKH8CYHKRbwoCPr2/zE0KTYOr8M
         flTwZ21OHMzk/RBmTUBJDQMGAyyUoX02ocRY+AaqRyYoduecKYIyEx/gIqAuZoyRQ7RB
         z45yTNd/3bLGFwnZKk9y9+V8lPbWrZGHuTx8RDFJfB2yIAZf6COInJ6nIBe2MgwGDdPa
         PlA04fp0+ielZMj6v+h5y7f3GctQo7D4OOzrYZGPxVWf1jOsN0mX5NnDy8d3EG0gmG3R
         GnSuZY4C89csw7oMPr5iCQaCkeuZnmplRSN1F2SvO34LKWq5v+heGnBhXS1b8/qUp9Ok
         cAUA==
X-Forwarded-Encrypted: i=1; AJvYcCXLH5aBaA/b7W4j0JpBTMR0vG6Q6HTY+9OCHZwLklLA50bMfIFOrblrxnarfphvfcBSMy1wfvc/vtHVs8c=@vger.kernel.org, AJvYcCXeH5R9LpyiiPChVSM2wj0ojUTkYcUqqCKGTVbRsEdfNZyrKOFkCzVJHQ7iaqG0D4QuqmtB6qCjR9fWBSl4@vger.kernel.org, AJvYcCXeqOS5XV4uGx4dY9BYWeCP1EFP86Of+bK/gbiXDftYEtieO30rw64J1U0C3u3bAR9l7X/UDIDMAp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYPav2ZxtgJA5IEsN9oLEgxcWqZNIo5ebzXu1siAKJ9LTcR7i
	M3j/EJT5AqNuOLhHzwkRoHOTp94gRRTbx14wtPA2FQaBde+SZ8G1
X-Gm-Gg: ASbGncseiUUFhHrc/6T8vunEiwOXjKfoxfEQbWQHbKac/zjVnv6b6v8x8nOsuJ+EQs/
	F4a9yKvXlWjfud6VFJ4G7AjBn+34ZTSVe/4Fy8GLG9WQYO/QxCQyK9laAPVlBojX6qyHqPo/8Q7
	tHZfz7UMt6tnRToMqqZXUStn4eHdyA5hNfo0l4h0QcF7rSk4z67sNtL4Z9UK4rIcTbRcl53w1zx
	kaWsqLtre6GUg7A0nCVRyseksZYs4SlOts+BCwy9COzR9SlJhXcIltU2p7Q22eprPNyLX/CSn5I
	AbWTWwWWAINiytnGZmF76YjhK1oq0NmuhbQycfCs/nWfD57ZkaYx
X-Google-Smtp-Source: AGHT+IEgRKX+oyGpIsnDWhFvqxcCziTobqDn3/PrRCiAKcBkYfTRfJ6anJjN3N2XsbwH0jJcI/Ef6g==
X-Received: by 2002:a05:600d:113:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-441ab3e0330mr1733975e9.7.1745835928683;
        Mon, 28 Apr 2025 03:25:28 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:28 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 3/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Date: Mon, 28 Apr 2025 13:25:08 +0300
Message-ID: <20250428102516.933571-4-demonsingur@gmail.com>
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

The i2c_atr_get_mapping_by_addr() function handles three separate
usecases: finding an existing mapping, creating a new mapping, or
replacing an existing mapping if a new mapping cannot be created
because there aren't enough aliases available.

Split up the function into three different functions handling its
individual usecases to prepare for better usage of each one.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 110 ++++++++++++++++++++++++++++++------------
 1 file changed, 78 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 939fb95fe781..184c57c31e60 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -239,9 +239,23 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
 	spin_unlock(&alias_pool->lock);
 }
 
-/* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+{
+	struct i2c_atr_alias_pair *c2a;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
+
+	list_for_each_entry(c2a, &chan->alias_pairs, node) {
+		if (c2a->addr == addr)
+			return c2a;
+	}
+
+	return NULL;
+}
+
+static struct i2c_atr_alias_pair *
+i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
@@ -254,41 +268,57 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 
 	alias_pairs = &chan->alias_pairs;
 
-	list_for_each_entry(c2a, alias_pairs, node) {
-		if (c2a->addr == addr)
-			return c2a;
+	if (unlikely(list_empty(alias_pairs)))
+		return NULL;
+
+	list_for_each_entry_reverse(c2a, alias_pairs, node) {
+		if (!c2a->fixed) {
+			found = true;
+			break;
+		}
 	}
 
+	if (!found)
+		return NULL;
+
+	atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
+	c2a->addr = addr;
+
+	list_move(&c2a->node, alias_pairs);
+
+	alias = c2a->alias;
+
+	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
+	if (ret) {
+		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
+			addr, chan->chan_id, ret);
+		i2c_atr_destroy_c2a(&c2a);
+		i2c_atr_release_alias(chan->alias_pool, alias);
+		return NULL;
+	}
+
+	return c2a;
+}
+
+static struct i2c_atr_alias_pair *
+i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+{
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_atr_alias_pair *c2a;
+	u16 alias;
+	int ret;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
+
 	ret = i2c_atr_reserve_alias(chan->alias_pool);
-	if (ret < 0) {
-		// If no free aliases are left, replace an existing one
-		if (unlikely(list_empty(alias_pairs)))
-			return NULL;
+	if (ret < 0)
+		return NULL;
 
-		list_for_each_entry_reverse(c2a, alias_pairs, node) {
-			if (!c2a->fixed) {
-				found = true;
-				break;
-			}
-		}
+	alias = ret;
 
-		if (!found)
-			return NULL;
-
-		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
-		c2a->addr = addr;
-
-		// Move updated entry to beginning of list
-		list_move(&c2a->node, alias_pairs);
-
-		alias = c2a->alias;
-	} else {
-		alias = ret;
-
-		c2a = i2c_atr_create_c2a(chan, alias, addr);
-		if (!c2a)
-			goto err_release_alias;
-	}
+	c2a = i2c_atr_create_c2a(chan, alias, addr);
+	if (!c2a)
+		goto err_release_alias;
 
 	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
 	if (ret) {
@@ -306,6 +336,22 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 	return NULL;
 }
 
+static struct i2c_atr_alias_pair *
+i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+{
+	struct i2c_atr_alias_pair *c2a;
+
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	if (c2a)
+		return c2a;
+
+	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
+	if (c2a)
+		return c2a;
+
+	return i2c_atr_replace_mapping_by_addr(chan, addr);
+}
+
 /*
  * Replace all message addresses with their aliases, saving the original
  * addresses.
-- 
2.49.0


