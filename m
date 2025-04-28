Return-Path: <linux-i2c+bounces-10657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA74A9EDE2
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACC357A6578
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8EE2676FA;
	Mon, 28 Apr 2025 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DimRz8HA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829DB266F01;
	Mon, 28 Apr 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835939; cv=none; b=GokPLLLSkT3nazUpHPAZ/GVcxzSeN/wFDSWZZEYw4J6rnoxawOJLoHV8V5ron8wCeefUlO8XQNOz0s/j9KOy376ceIbrbTb9N6UEpCxUUkIuIz2jyDpz/N9qyxO1RGIqtZxHNql526ew2QImKEoMtTBiYzgpfCSofT7SeGFu5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835939; c=relaxed/simple;
	bh=Yd2vMpYi0+0z4E9zqttUfGUuVEr/75KkabGIZyNs+a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vC3qAD+q8mo/+xykih53YJlI91E82ovdY+hGFb/iGVjUTFw4QAQ1DuzCDF+MdCbPb0ql5peydQc4R96vxlYNriM8+HV/k4ajUSOzzmRzY+e7odl05/u23aMlwCQGa7PfjHJUJ+mctCzC6EVaCM8p0Ex+JOQjXh0fp/5EOUwYLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DimRz8HA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so43940415e9.1;
        Mon, 28 Apr 2025 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835936; x=1746440736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPp64yHTXuxSiEPljoQLCKKjc0l5YBL7EmvCMv5vIpY=;
        b=DimRz8HA12d7WlNR9vJ8OD1d/umChhO+uY0Q8YkbfQlMquxJnPX1+Zo/4qjdO7ErXP
         irm4L/MSHKKt2KTiTtFB7u+FXfJFlPfVnq2f2y1GJ7u0YwSQXcPdmcJDieIPwv62majV
         pxl2GzxGDsEPwgFi67ujClGWyHmfSkH1k4Yo7nf/XU0zfyWl4JiMvRdD69+wxBjbG0My
         0r0cJBZUKAioHUWd6WOsSLFPq4MILD2z1CbGp0LJSzfY0kynGHi7GdM1ZGgYz0bDwVtt
         3jFKz1L3bihugbA0ncz204Jlbr+hBNi8DMto7Vr74gI0nddNODEBBSUcY6Nw7OYcAyo2
         kFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835936; x=1746440736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPp64yHTXuxSiEPljoQLCKKjc0l5YBL7EmvCMv5vIpY=;
        b=oLRKb+VahgLkIPhCGIFXoGIi0+eJanHVNk2xUNqkInGOkEIon9fmrH/zj9acdBdwTp
         h0Fvibzn341z3XmT4olvWUlhAkTBqIrpJ1Aic7ghdqBzzQ6gPpDbyaWYHlM4B0FIU+vL
         INozKghZUt70eqHI+3V8ULmoElsU1oTj3IAN8Y7p8GpgDqwLQ0Wf/ucNoUvTOISxPMEm
         VEI/mkAbqrsGzjAZLol8tDzpF4JO9E5b9MxK+LIVVB4QbpdLMf+/iUvmALKrhW9ZoH9N
         YI/h4DbrOvrRCWvRZImu4b4ZDo6RsPLHknJhbJMUXGveTQEV0uheBNQcIhIF8hA/0aE/
         akmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfOLCrIQFFSdjNnrTxTlRdd2Ed0kWYFLIhUesFSbkduin4XMvQlE12lx8VlvzRqMsFhhFnSLpyCcQ=@vger.kernel.org, AJvYcCWeFvfyTlqKJZt1bqMEiv84Skcsb79Q/9jeVfvGCj8LpJTf9sHTSwpR7if/FK9TqAYca8OU/01yxhR3TnRZ@vger.kernel.org, AJvYcCXIHHYX5E1Euz+eInTtc9pAGH6Qot4wUBNA0qZqPhFh6Oh1GeGOuXHeIOwqQovUfbdJEAB4+L2lzPoafOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MnLvrFABpF6LaXzYM1e6MbQ4E86HF0ISW1WIhkBGYNgVo0pj
	/bSLOW+7I/WeseYpC6XZmBUodzFDGq0nCzw52tgIk+1rISAhTh0g
X-Gm-Gg: ASbGncvFMSChJQxT3eCLJ5UEHUgal4i6s4x6g8S50M3NEpIbltouEi7kKvXyyMwcz9y
	tfNBZIHTFSpiCX/V2CfwDKqlq7+A0V+LJTdzxOzO6ttqWgnwDXIFSF0HPZQQO4SVT5uiWM581JG
	2Zxo+QEomiTDT0OKbej39mPzQZ2Hdl8UwNfFVhF94G6Auh2fkD1lAMylfWwzZAQot9A2VKj6Wfb
	DMw6Li9UwIczQ3kDwna560wqlYisGcvV2z3njL6tBH69DPz/XaHxD8RlkdS87aubsEWBtFteyHl
	mCU7chO1SJi9bSBpIWQcn79U47U5dOZqIuqPlSt9klXngHgxls12
X-Google-Smtp-Source: AGHT+IEpAHMq+MFTC1tThZUM3+JYaCNjx4gCIRGGoBaWPaCDm2GpqjOAR6SQcGlHnG8dbYro9yY5/w==
X-Received: by 2002:a05:600c:1f82:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-440a66aae34mr84858505e9.21.1745835935597;
        Mon, 28 Apr 2025 03:25:35 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:35 -0700 (PDT)
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
Subject: [PATCH v4 7/9] i2c: atr: add flags parameter to i2c_atr_new()
Date: Mon, 28 Apr 2025 13:25:12 +0300
Message-ID: <20250428102516.933571-8-demonsingur@gmail.com>
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

In preparation for adding multiple flags that change the behavior,
add a flags parameter to i2c_atr_new() and an i2c_atr_flags enum.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c         |  6 +++++-
 drivers/media/i2c/ds90ub960.c |  2 +-
 drivers/misc/ti_fpc202.c      |  2 +-
 include/linux/i2c-atr.h       | 10 +++++++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 7214a59ddf15..e2350fcf3d68 100644
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
 
@@ -703,7 +705,8 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 }
 
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters)
+			    const struct i2c_atr_ops *ops, int max_adapters,
+			    u32 flags)
 {
 	struct i2c_atr *atr;
 	int ret;
@@ -725,6 +728,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	atr->dev = dev;
 	atr->ops = ops;
 	atr->max_adapters = max_adapters;
+	atr->flags = flags;
 
 	if (parent->algo->master_xfer)
 		atr->algo.master_xfer = i2c_atr_master_xfer;
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 869e32bd07e8..6f475bae94b3 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1122,7 +1122,7 @@ static int ub960_init_atr(struct ub960_data *priv)
 	struct i2c_adapter *parent_adap = priv->client->adapter;
 
 	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
-				priv->hw_data->num_rxports);
+				priv->hw_data->num_rxports, 0);
 	if (IS_ERR(priv->atr))
 		return PTR_ERR(priv->atr);
 
diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
index b9c9ee4bfc4e..f7cde245ac95 100644
--- a/drivers/misc/ti_fpc202.c
+++ b/drivers/misc/ti_fpc202.c
@@ -349,7 +349,7 @@ static int fpc202_probe(struct i2c_client *client)
 		goto disable_gpio;
 	}
 
-	priv->atr = i2c_atr_new(client->adapter, dev, &fpc202_atr_ops, 2);
+	priv->atr = i2c_atr_new(client->adapter, dev, &fpc202_atr_ops, 2, 0);
 	if (IS_ERR(priv->atr)) {
 		ret = PTR_ERR(priv->atr);
 		dev_err(dev, "failed to create i2c atr err %d\n", ret);
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 1c3a5bcd939f..5082f4dd0e23 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -18,6 +18,12 @@ struct device;
 struct fwnode_handle;
 struct i2c_atr;
 
+/**
+ * enum i2c_atr_flags - Flags for an I2C ATR driver
+ */
+enum i2c_atr_flags {
+};
+
 /**
  * struct i2c_atr_ops - Callbacks from ATR to the device driver.
  * @attach_addr: Notify the driver of a new device connected on a child
@@ -65,6 +71,7 @@ struct i2c_atr_adap_desc {
  * @dev:          The device acting as an ATR
  * @ops:          Driver-specific callbacks
  * @max_adapters: Maximum number of child adapters
+ * @flags:        Flags for ATR
  *
  * The new ATR helper is connected to the parent adapter but has no child
  * adapters. Call i2c_atr_add_adapter() to add some.
@@ -74,7 +81,8 @@ struct i2c_atr_adap_desc {
  * Return: pointer to the new ATR helper object, or ERR_PTR
  */
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters);
+			    const struct i2c_atr_ops *ops, int max_adapters,
+			    u32 flags);
 
 /**
  * i2c_atr_delete - Delete an I2C ATR helper.
-- 
2.49.0


