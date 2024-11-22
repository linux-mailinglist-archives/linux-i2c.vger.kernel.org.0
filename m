Return-Path: <linux-i2c+bounces-8146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2970D9D5EC5
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3E4283471
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844B31DF267;
	Fri, 22 Nov 2024 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nduAWYyu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76DE1DEFF4;
	Fri, 22 Nov 2024 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278410; cv=none; b=RHTe8pYuOYcGLhDW32R+57MVOj48lO7mxIMmNQsVMJ2RzkP/JzWDLpgfwz856Qx/GGpEwAiiiTsLiWNgvftDHHAgl12pcFDv1enBYDN+2+rD56zNpRtf6frVeQ9pC0xCHOTW/qVdkP65PPwX4hnwQ+A69/F6de7Dttq6tDGeWUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278410; c=relaxed/simple;
	bh=xiTFw+i+dSlZoPxbHDTsWbl3qCOr3GxjBtlNQkPNP9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJMBtMcNrQtVdy1QUvwbFYywFHpWgNlHZ+azgfbAU/XZcuTEbL0gdOo+zNit62l37Kww8Hx4WbjMVMyx1pRDB1YQMt1i1FaEb7KWR3I7PTfdROOVzS1u4JmvJqfNdHGsZG68hRt6W2IknctYSoyCMbUpvYmqw8ChoYqTxekQon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nduAWYyu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F023C10B9;
	Fri, 22 Nov 2024 13:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732278380;
	bh=xiTFw+i+dSlZoPxbHDTsWbl3qCOr3GxjBtlNQkPNP9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nduAWYyunmY5bC5wCazUhGER8g3Rpn2YqPRQvzc6fza+Ym0GAnhStjVHG/+KK74Bl
	 vGscsYiVRYDRHayVahiDBfO2CKUHBPysq0KPU+cFw+blC/FQVNiLtOsUFGUbmMi8fu
	 8JKSS833B7FQ6386bfm69TJXnwWczudF3ZPzqNvg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 22 Nov 2024 14:26:20 +0200
Subject: [PATCH v2 3/3] i2c: atr: Fix lockdep for nested ATRs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-i2c-atr-fixes-v2-3-0acd325b6916@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
In-Reply-To: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Cosmin Tanislav <demonsingur@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2993;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=AgIuE1jkRE8lF7XkNaap1BLjaTjFArq2xCNquRONpxw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQHh8A7VPrkIzRqsK5LqgqbHpAJ570VNLlnsrM
 KgeqzpRrW2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0B4fAAKCRD6PaqMvJYe
 9b1tD/4/OgUxPLaZ2YsVgt0pTy2KlWhhUuX9c53dYxuBhyZnxF/jErYeyrOYPZUlPqmjfn4ZMqe
 POw/oudIelF/udTqGQJij3MviMeKXFPyiJR2qIkF47R/Ox/2oTyIoqKvyg9Y7WtYqblcmZAlcSz
 ZvuBdyHGtpi2dW0hQ9K4k1t/+Yk/ANuYZ/gbYwSS5gQigoElmS3CnLmxpv79ecy32Z2FiAM+XOH
 uQTlEE78gpuppJx+MEQkvRRxkfZmT2wdlfakL4zMrXs/FT2iZ+xPKzn5wMqR7aLD6+lS1uIbBv3
 IjrmyUGUp4cBPBxyUT+srCdCzWmDNHbaZI+cRTH3lg1OZcv9sz8bIWnUySnmZVYqx6saAuSUvC6
 zoE470ZeHLG3JP7mqeMzTUdyfNHkByhmgkHTKboxKtWI5Ebxk6U/66FzFghIqpixE83wRDtZvl7
 bndJ6HDhEcsrSPqHQDOi2WGvoktFAtCpon78fjmGoz8l4PjZwt90e/iO2wJj6XNprn+gIldeyTG
 s5U7jRFXxwxRKCO+LLWYArpPsvbKWjubdntWtjPprtlx4KLISs8LndG+n4RzbAle3RgRAM+Dlo0
 7lP7pNh1scDF9SK+PRorpFBZj87ViJBmMXjxYQKr0nQMZ4ha65htjIrBoi4OCA75mWxW2soEqJ0
 SrufTl9/QEZWnpQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

When we have an ATR, and another ATR as a subdevice of the first ATR,
we get lockdep warnings for the i2c_atr.lock and
i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
for the locks, and doesn't see the locks of the separate ATR instances
as separate.

Fix this by generating a dynamic lock key per lock instance.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/i2c/i2c-atr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 5adb720af84e..5cc18606bca9 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -54,6 +54,7 @@ struct i2c_atr_chan {
 
 	/* Lock orig_addrs during xfer */
 	struct mutex orig_addrs_lock;
+	struct lock_class_key orig_addrs_lock_key;
 	u16 *orig_addrs;
 	unsigned int orig_addrs_size;
 };
@@ -84,6 +85,7 @@ struct i2c_atr {
 	struct i2c_algorithm algo;
 	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
 	struct mutex lock;
+	struct lock_class_key lock_key;
 	int max_adapters;
 
 	size_t num_aliases;
@@ -505,7 +507,9 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	if (!atr)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_init(&atr->lock);
+	lockdep_register_key(&atr->lock_key);
+	mutex_init_with_key(&atr->lock, &atr->lock_key);
+
 	spin_lock_init(&atr->alias_mask_lock);
 
 	atr->parent = parent;
@@ -535,6 +539,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	kfree(atr->aliases);
 err_destroy_mutex:
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 
 	return ERR_PTR(ret);
@@ -552,6 +557,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 	bitmap_free(atr->alias_use_mask);
 	kfree(atr->aliases);
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
@@ -586,7 +592,8 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	chan->atr = atr;
 	chan->chan_id = chan_id;
 	INIT_LIST_HEAD(&chan->alias_list);
-	mutex_init(&chan->orig_addrs_lock);
+	lockdep_register_key(&chan->orig_addrs_lock_key);
+	mutex_init_with_key(&chan->orig_addrs_lock, &chan->orig_addrs_lock_key);
 
 	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
 		 i2c_adapter_id(parent), chan_id);
@@ -646,6 +653,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 err_fwnode_put:
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
 	kfree(chan);
 	return ret;
 }
@@ -679,6 +687,7 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }

-- 
2.43.0


