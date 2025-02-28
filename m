Return-Path: <linux-i2c+bounces-9649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D739A49D13
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D8DE17383E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BFC271281;
	Fri, 28 Feb 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nATbu7EY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345F270EA4;
	Fri, 28 Feb 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755864; cv=none; b=tn+Uha1J3hnjEfKQ9zcyNPMzCXwwENkWI7HwZ0P7xa+fr9XR/FxsrMKZQCT/uX2SzkhtoA8A6h7VvfnTuI/bLUdCa9UxunaukFv1MElinSGuK+pgcqa9ezLaZ8uVws8dMJvVWweI7QITup+CVAMJlaAD7MZeRKZidMHsGOolwM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755864; c=relaxed/simple;
	bh=btY97WZkaRxfvJGaZV4/irpvLakBopADE7uOu87iIqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAYsNtvcnFtbrYAfYEF7Ags9fuRSPUToE43nth3IajfLzvn0sVJlqoYrszL3XVZLBisvVjey3/rIxh6mTh9ycmwJek4akG4zmPuyFGA+pgi6Aha70Dct/r3exGvEAguLmJk7RyLkzTiQRlSS0kdjKbbf+W+umr+hgt2rox+UKNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nATbu7EY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43989226283so15044735e9.1;
        Fri, 28 Feb 2025 07:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755861; x=1741360661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4qqqIezndnbu9odHIxE2+Bj8cVf+2ZH/Pr987aq8jU=;
        b=nATbu7EYaLKu6/JI2/5lLWF8cgkU2vZHhLqi3IxZpCbiFUgNK8gNLKNfTCuu9vai0/
         iVQ3utg9MKjCJRx+Rs8Ywu57JAuMhf9MRboGlHmuA+c0mMv8WX6gUJnlzGBhhPdxR33u
         xOlRV/cAhR5pYiTmi++P3AOp4XNv3FD08ypfIChXHh9QK/ecsF1BsVhsaiGsaWrt85Jx
         0IhCqnoTWduMQ0DY5Im0rV2iFbgxbbIOglypNnpPYGLZD/F7xQhJRY/+GuM5cdAMin2I
         d3V5GT3ruTy1sJ2ZUOOrKRfHgEbZylrfY0e1+JqtVJX0CwCUUEvQVC3GzYzg4mN7RUh4
         ym8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755861; x=1741360661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4qqqIezndnbu9odHIxE2+Bj8cVf+2ZH/Pr987aq8jU=;
        b=uhAMFeocLAj212s00wqmm2w5KvR5X88T0UtFNJtSuFrLTVBh6wVam88rUpYHe5ib+o
         10yyAiieAowKvOPyXBdMY5jUTQzhnTF69cCp/l81y5/VOVOJhEdIH9XTrB/QXfnwZq0+
         O4hByfViJr500fwUlibOV4na0Rap1n99TqG8JPSOzHB82vbciSfulIY6xy/mYOwVxr5K
         bExoyDMATjvCq/PW3rVN9DewsB9DM+4wBI6UuBZctJFSCU53RS+C6cn07ieFHAZkJ1eK
         Oj3i7auUBivXVvpcWBD1Kjcqw9Lc+8/zE4ySCGZE3EucAPZ1KpZrL+ZSSfHSMNNzJr/u
         80rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjOGM4aPGVfThJ5gQxIeY/lj/OXNSMIntYOH+HAO2o1sZ3RM5YNeLkDGkM+htOTDz1S9iASJr6fOU=@vger.kernel.org, AJvYcCVVljFB+35+6ntdAWj77gU2HR2cO2eDgZzu5zVcBR2E65J3RJW1q2GPqPrrvkPQTnEIRjAO1bOaSNjVmG8=@vger.kernel.org, AJvYcCWCpGVHHKEKjVLiXd7Jl6DdB49dyjvEImxMcobm6X8VU43cFUHSiIu/AznEvAZPJRR6NAKA1mS3a8ZIWZi8@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/mgI7fvz5cKbA8hyDiLexO4SjggdueQ1a82cnVLflBzkG0eh
	dg6Mz7wT1S6pfD5/NYc6jZAj7lOc23TNBV/siatwUcNK98U0vewR
X-Gm-Gg: ASbGncsHaYPwL278/WInZI8cJ1EXwWl4mCGHE+h+c4f3KUV27PKp31F3rJ4K+XE8Gol
	p5HDp+qnk38kB2Vu50kefOT84MkRHAr1rCppxikFRs0mWqz9X79NI6VQ23WYjOrCGHU9M175W2m
	uZ4Y7e6Yo8eQPOIS2HW/SS025nrPZdvGvdQ3OsOkPJ0in+dNspq0TPJ/iX4oeUNub8sdfadqKHn
	2t5NGzDYQ/u/h62TLZ3Hq4H5eStRv/kFZqS/FdAQYrrFg4Arm6fJRzMQpbkLPJL5eKa/2/gHUp+
	gVlNlQwfkmMC4bvF2sUb9psOWNfWLS6GMDE9iig=
X-Google-Smtp-Source: AGHT+IFj0DbA75z47DexBVK3a9hAgTjGol+BBEne4fOVKGatR0z7tCNeQN0gg2MRn9Z+nbrtgRypGw==
X-Received: by 2002:a05:600c:4685:b0:439:9a5b:87d4 with SMTP id 5b1f17b1804b1-43ba67047bemr31688125e9.13.1740755861070;
        Fri, 28 Feb 2025 07:17:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:40 -0800 (PST)
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
Subject: [PATCH v3 3/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Date: Fri, 28 Feb 2025 17:17:20 +0200
Message-ID: <20250228151730.1874916-4-demonsingur@gmail.com>
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

The i2c_atr_get_mapping_by_addr() function handles three separate
usecases: finding an existing mapping, creating a new mapping, or
replacing an existing mapping if a new mapping cannot be created
because there aren't enough aliases available.

Split up the function into three different functions handling its
individual usecases to prepare for better usage of each one.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 104 ++++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f2485d1670a2..fc92ed930877 100644
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
@@ -253,38 +267,54 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 
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
+		i2c_atr_destroy_c2a(&c2a);
+		i2c_atr_release_alias(chan->alias_pool, alias);
+		return NULL;
 	}
 
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
@@ -302,6 +332,22 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
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


