Return-Path: <linux-i2c+bounces-9570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B466A43DE2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8462017B378
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DD726868B;
	Tue, 25 Feb 2025 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOkVzakz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759B326772C;
	Tue, 25 Feb 2025 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483595; cv=none; b=OrMW0A3tQPA8g6tDyXjQR0tcPcXAX0EZvw5OALMNjT4lc67vg6MBiPxUrlH3xudeL8Ser+DIBAgT2XWA7hHKXpkTk3bSSKrNmey2lfxgq/k8tBwqJwbMZJB3xE+mfqYSpzPVl/wigJm7+qIoQxVpO4PEGCnlAT1qPgy9cqI8Wuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483595; c=relaxed/simple;
	bh=7TxkqXWDv9/J0gExxnhE5AVNOVkTjQZXHN47CMBPykw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJZGOKtuLiBde0P6zRN9iiEkK/R8IeJ4RqeXo6HKttQFdqpVu3vdTThQ6/m6chzHnW20Mv0QTF5zNmmdhPjIWko+2c8zsvP7o71kBYmJ0f0S3Ohc8/9iKWyalEgaoaO34k0WPNNJ/ywRsy7EYBgnQuKb4R37VREMUORz5cOgha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOkVzakz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390cf7458f5so430822f8f.2;
        Tue, 25 Feb 2025 03:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483592; x=1741088392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wbt4xnMBI7Rp7/hDbllmHky/DOcNS7OlMn9aWWBaof8=;
        b=TOkVzakzaw3oH/5L1BhKmUwLI61pRavBhITqpSYl1W1IHRWvBZwUzAH6cjpsqTPeIc
         A3Cs+c5TrC0qOaj/CyYJLWHzPmHzRWuOf2eptjGIFavxYs3pEmQlUyCq2t5bgiUfmtz7
         oq9/e3q7+0Z4W5Aea1hZyDERJodoE7XakYSOfRWLTBwQFKxY1X5E5MDa56hArCO6kYlT
         ZfrT17JZIh32O+obfkvYja70h22PBBF6Yf4HDcLSvNKqzpDcbVBLqVxYKorYFujI1HCJ
         JsU/Mitde0bUr0GbmMBQm43xCEpHQ3r18CER+/jwjK73TM3qfoYeKmtQxTyVmvcRRKqV
         T8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483592; x=1741088392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wbt4xnMBI7Rp7/hDbllmHky/DOcNS7OlMn9aWWBaof8=;
        b=o8I3MSkfDSRv/4H3/+RQjhPvCkTzooUO9Rt4aq61pePhTlOAmQE0dov2FFhPgW1t8o
         3yHro6N+8jTUOKoBGfb2eoIX+jkxBaUCkwnQ+MyPIRlHGDlpFLTgykVHfOqMbsELz1Ab
         vKVK2DWMYQBsHNRWRw94sEG6UBeAaQ/977QG7HpMYAEO74ZE48TzKmZ8EB0tm7DHQggo
         Oz4ub478HsrjddFZTgtGIjkSvTBBA5u0bPvmdGSrY0SeEUPFyybwZqErSgDG2HnKEG2U
         dTyVOoicoLUgPKpliHmzI0K99qUpNQKnBkivy00+PSRCR7g2c1HXnFyvrGRKoEnSAXlU
         Ykhw==
X-Forwarded-Encrypted: i=1; AJvYcCVcHUQBVzVeGLy85y257YybYi3BAHXiN7BjFZXdVbgxRIit4li2InWNSNNAM9B+Ncm4FiBmP82SYGs=@vger.kernel.org, AJvYcCVpabOUUvqjYqBHwHv3AsmAaCke+J9dciriDPCPH6Ury9mo5QtVGgXNEs2ouQcd/FpW11IEmnnzo5aaWOqR@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7O1sd0Y4UrU85W/1gHJBgHMlOxOMbVBwn8EMkeDm1Hi7AXMH
	fq+lV509XPIl0lv/vZo7KVHkypVPof+x3XVRg7L84wljnN8Fc3ia
X-Gm-Gg: ASbGncuGDGG+J/wjBqyXDsJjq9pMX2blcJ41wKH63W7krAVq3KAe8jtJmoNodIINq2K
	AQ1Pz+VyWr369hNSCvPrUA16mabEVoueUP00yLIhGqzvI3rrm6MoIMZhT4TM15rXn4x4xB7Yxpy
	xrrzbcE7IPX8sTq1sk7V78kkEZ57S0zZ/Mc+fjrnH8Q5FUX7+yjslj2N60wL2wc4IQrFNNE77/B
	cEVgM/k4AVBHZvtHCNXJJDM+OWV1W5JDKnWGTB6pezhTWQSKjNhA16oPCf6GDNzCqHjEGxnY5ix
	awq/1NYWSglSMUpLgyTUZ7V1eJ6eCGUPulYR2qs=
X-Google-Smtp-Source: AGHT+IEaMkYOoSEDX7p4FCMlk7XsckWrJ+m7bwOu1v1Nli5vkMiQTiK+6D848dTqjat/oAJmsfuIlQ==
X-Received: by 2002:adf:eb50:0:b0:38f:3245:21fc with SMTP id ffacd0b85a97d-390cc63c407mr2131844f8f.50.1740483591686;
        Tue, 25 Feb 2025 03:39:51 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:51 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 4/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Date: Tue, 25 Feb 2025 13:39:32 +0200
Message-ID: <20250225113939.49811-5-demonsingur@gmail.com>
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

The i2c_atr_get_mapping_by_addr() function handles three separate
usecases: finding an existing mapping, creating a new mapping, or
replacing an existing mapping if a new mapping cannot be created
because there aren't enough aliases available.

Split up the function into three different functions handling its
individual usecases to prepare for better usage of each one.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 108 ++++++++++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f2485d1670a2..9c4e9e8ec802 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -239,9 +239,26 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
 	spin_unlock(&alias_pool->lock);
 }
 
-/* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+{
+	struct i2c_atr_alias_pair *c2a;
+	struct list_head *alias_pairs;
+
+	lockdep_assert_held(&chan->alias_pairs_lock);
+
+	alias_pairs = &chan->alias_pairs;
+
+	list_for_each_entry(c2a, alias_pairs, node) {
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
@@ -253,38 +270,55 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 
 	alias_pairs = &chan->alias_pairs;
 
-	list_for_each_entry(c2a, alias_pairs, node) {
-		if (c2a->addr == addr)
-			return c2a;
+	if (unlikely(list_empty(alias_pairs)))
+		return NULL;
+
+	list_for_each_entry_reverse(c2a, alias_pairs, node)
+		if (!c2a->fixed)
+			break;
+
+	if (c2a->fixed)
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
+		goto err_del_c2a;
 	}
 
+	return c2a;
+
+err_del_c2a:
+	i2c_atr_destroy_c2a(&c2a);
+	i2c_atr_release_alias(chan->alias_pool, alias);
+	return NULL;
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
 	ret = i2c_atr_reserve_alias(chan->alias_pool);
-	if (ret < 0) {
-		// If no free aliases are left, replace an existing one
-		if (unlikely(list_empty(alias_pairs)))
-			return NULL;
+	if (ret < 0)
+		return NULL;
 
-		list_for_each_entry_reverse(c2a, alias_pairs, node)
-			if (!c2a->fixed)
-				break;
+	alias = ret;
 
-		if (c2a->fixed)
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
@@ -302,6 +336,22 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
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
2.48.1


