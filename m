Return-Path: <linux-i2c+bounces-10867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73FAADEDF
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31E94985CBD
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B916525F7A0;
	Wed,  7 May 2025 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0N/H+w7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5B25E830;
	Wed,  7 May 2025 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620370; cv=none; b=dISbYWbgToWOg5qsLF3LnVB64aW1BJwrw4ktXNzik47ia6ytBpV4T1mlUzOL7+5uz3QMRUwxiRo0jKM3ioxd9MJ11llmGGbmkAq6j92ZXt+oA5+6CU1/HBo7UUCPSQzFKeeqruzhBJ2otWxqwano344KWB1jXFt7zpY8N7wldFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620370; c=relaxed/simple;
	bh=y31c164//hMoRMj4bwFFX6K1nZlMX0bLwVirQFOWUx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVjemuTvSqQXlYct2TWtAxay1QM7b8QbdvnCCe95p0r/Ch60d8jOY51wQVjJnYqdfQRVzdKxaRdcMgFNVI7m7fxEY1FdfrV24e2cpt8PydtAyYSlKMj2UN/adtq3fxThY3SWqbHdd9qbcamTwa8LBXlOKZEMR82lVSxRRrOLEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0N/H+w7; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso1775797a12.1;
        Wed, 07 May 2025 05:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620367; x=1747225167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrRU6Pf/P1bThTd+6V5PvGeSOBGAjbmMmA+OOg2zIk8=;
        b=U0N/H+w7Bv0ym4jmZHPd2ndtlIWeFKciUmqqhebIowjyPA+1lG9yzk9FptY0OiY1H/
         is5rN635pdtjfnMp9NBocRdwhFQG2XZ5H98+jYiwV2f36jKox4pZOlnx7ZxS8yXsxRt+
         TjGA4QzTdCtFGmXrr19Z8XZZ/WAJg2yg8aCT7GY2FheFdK9qLFcycQuj2dthh9vfDRJC
         l6LiiCA+8Ib2RianoOqNGWOJOmy6zVu1GJXFWsHl4GDpFPxcrAMlWgAXOxvKlgK1sn20
         RQNUVIL69YWWghvUuv5issg7+93PrMm3/RfKl4qGK17YOd68If2o5pj5KHWff2xsRN+a
         74Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620367; x=1747225167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrRU6Pf/P1bThTd+6V5PvGeSOBGAjbmMmA+OOg2zIk8=;
        b=BKmH2vxFwoBU25WG3siyttoAr2PQ8GtN8rGV+5+srcBXGVujD1Hovmfw5NCAF3bNtt
         UJxY+Ifoko8iXcQFMzxaCwRB386Gd6cKIsQSA16e0RhrfdWUXNE88DhSPcRyy3WgEaTs
         wSFffiJ9bXq2Jb1VF1M4avqe15nW293Iz0foJF7JQ5s6y4E3YNza7dlsAwjf1U016A9M
         tXua6wDEc69AEk8YL3tdlE4gWVuhQTfTuLsAwBYJmfgiUk32s0ZW0yFFXTxnSedXtFSM
         KS8At/JVfFJvQpDz+5OQ4vyTGCzoTf/ZJSR+Ti/YXNty1OvBvoUodKhPkiIz3FEBJ3RL
         mzTw==
X-Forwarded-Encrypted: i=1; AJvYcCU8B5qqz0k+kNTZwwEyIxJgXKtBhKGtzodxet8TcSY/BcjDqDa6gqMpyIBz2W7mBrvXsFzxENc+bhs=@vger.kernel.org, AJvYcCVQKZc8ypgYKF9Sj6vefmAtNwA3sjGKt+Lp6LK/toe6fAf1Xk0vVq35hsVKzXqXVKhDrDwaIAOFBGeJxQtE@vger.kernel.org, AJvYcCXSeRhrlKuWtrK3l2hx6RpaMB6NExAwFrcJD1ddun5MwyEPvuHgGGno+Od8mYtTt4QgUwcwi9iRY+GidO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hMy7NTUDsVrqE8f3wI+B9SvQ1vQqyWVJf+9IXMOy7F6qoD+k
	qejEZEmPD3S6hnrhBnJXtWFRtRw8kJ94nX6c1ikXSd44DPI6jydw
X-Gm-Gg: ASbGncsCneEOVT0c9dNp4Xc2YNNYmYV2xBZcMS37gqaG+wp7hT3J/CEkga5e/TzNZzh
	effYxqrgLVZlwnZ29LwqWlabRPvCvoaGjQrMKoPrSKjkFrykraqZKY80NXrXAoS29I2SseOQW/5
	oXntomi2RmUe7G379z1r4cBBwRZJo4zCCzR7hagx3WqaMsZaysKHuPt8E/OQ7anWycHsUCRleIf
	28y9Mqb+2FAVfmcxKvSJFGy2rebCMA7f/nKNJAQJO8Zas2E3HdyS6xyO+qPVtDVF97mwsds6iJs
	9T3Jz/0zPEBaTrktNNfB4v+wyR+cJhej9c3YlLgClsClOwMtkFcn
X-Google-Smtp-Source: AGHT+IFIJc5xU1Unm+agSmBC+K37E72qe4SuokRlUVPAh6NESxpxRoYFKRESXNTMv2a66Z/L4gRzcw==
X-Received: by 2002:a05:6402:34d5:b0:5fb:5be8:3e2c with SMTP id 4fb4d7f45d1cf-5fbe766e7abmr2764976a12.9.1746620366664;
        Wed, 07 May 2025 05:19:26 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:26 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 3/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Date: Wed,  7 May 2025 15:19:09 +0300
Message-ID: <20250507121917.2364416-4-demonsingur@gmail.com>
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

The i2c_atr_get_mapping_by_addr() function handles three separate
usecases: finding an existing mapping, creating a new mapping, or
replacing an existing mapping if a new mapping cannot be created
because there aren't enough aliases available.

Split up the function into three different functions handling its
individual usecases to prepare for better usage of each one.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 122 +++++++++++++++++++++++++++++-------------
 1 file changed, 84 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 939fb95fe781..215b6773fe06 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -239,56 +239,40 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
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
+i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
-	struct list_head *alias_pairs;
-	bool found = false;
 	u16 alias;
 	int ret;
 
 	lockdep_assert_held(&chan->alias_pairs_lock);
 
-	alias_pairs = &chan->alias_pairs;
-
-	list_for_each_entry(c2a, alias_pairs, node) {
-		if (c2a->addr == addr)
-			return c2a;
-	}
-
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
@@ -306,6 +290,68 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 	return NULL;
 }
 
+static struct i2c_atr_alias_pair *
+i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+{
+	struct i2c_atr *atr = chan->atr;
+	struct i2c_atr_alias_pair *c2a;
+	struct list_head *alias_pairs;
+	bool found = false;
+	u16 alias;
+	int ret;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
+
+	alias_pairs = &chan->alias_pairs;
+
+	if (unlikely(list_empty(alias_pairs)))
+		return NULL;
+
+	list_for_each_entry_reverse(c2a, alias_pairs, node) {
+		if (!c2a->fixed) {
+			found = true;
+			break;
+		}
+	}
+
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


