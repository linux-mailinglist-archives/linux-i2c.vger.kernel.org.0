Return-Path: <linux-i2c+bounces-9654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D6A49D22
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14C863B2F73
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310982777EE;
	Fri, 28 Feb 2025 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2IMOReV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8EB27602F;
	Fri, 28 Feb 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755871; cv=none; b=FVJtPPE6m7z+ibB+iWUc3vg0djzzoS2b2o1+AIJQZ/Dp2x+xD6WWv/TkyC+eySYLjzz6cpfdbk/Edw9HRnmEX/jprKz6LDKEdnNjuU2yZN+nYZn5RSGgI5alo8lub507AP/myqVmMkYteE5JIFLU2Qc62LM8uiQzKwLHs7/ku1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755871; c=relaxed/simple;
	bh=ibCylPXjBgc2FHLI8Fp0ByxmvYZUrtJ6yUxl/i+JtB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/ynip75EWH5manoF1gXKB4POxtKt2uRKH+lPa1smqjKn/sb1pNj391o5nsxKIFXOAqJymnrgeAzpEtCswdDc9Y5aHHcFN4QMX8ITItgQo4sU0QEZbYeLhl98ETHPjcjkIkxIwz9UvLpCvm7ZuqYBGp4rKm6Kd1/EqziCiXi6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2IMOReV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4399deda4bfso15151935e9.0;
        Fri, 28 Feb 2025 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755867; x=1741360667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17F8jSd86fgXEXfgeJWAHgHI2hl8MFGJk/kzd0Ybbcw=;
        b=V2IMOReVO6ZtqhiqoxKqnTJlk8v27AbN/rI/lJCWQo79S3wPuZ2xnkOpsmDD0L9Any
         mp/+RAVcC+Qo5ltApFeYEdjMgflu/IfN0ciFe9dWcT/GV8YFnOTcFjbwROwtG4jUhQgH
         71Sx0sScCsR6Itz6sidvaf1CFE1Z/Ap25Z6iSEnl8zWKpMmCqmM7VZzeZPqckW+H7OqO
         7JX5y7Ekm21uwd9eVvR1HhfLYFYZb0Ly/N4kHbihxUsztZj9pHBQtBhWRA87JIIpv0d2
         gOtgd024N+CsH4Uwm278/MWc1JWZeipa/il4Ppo1U257xy10Q6wiHT1YK5YQg/484dGN
         sxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755867; x=1741360667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17F8jSd86fgXEXfgeJWAHgHI2hl8MFGJk/kzd0Ybbcw=;
        b=aT2UPboVNbVAVn/q6AhfgZTs5Z5AvkNd8J8f6p+XVqHZWSwGNXTufVxBT/WHeUykhh
         eMRA5OoM+IHSfBBq4OUZcKrc9cndQaoefJGeRYzERwbOlNULCfU7mVSoGdCp7b6TgchS
         2MvltGA4AXuZ6FwI1YK4vsaNkhrjVEOX283AmjSWkm3XMIfXSqw+dY+hJFv8zHxxAEBB
         9cCZhc+TPt3ETageEHZHafG1v3sDrk6Z4af9bKezQUBZ50pPIYc2uFJiyQtbgNYmsZLE
         8DGiLDbKwL7hFkxBybCZ0SGWRrzeMpk4abtKxQYuG/MVfG0033Z1nzCOJfy7Rnl0yjQB
         WtTA==
X-Forwarded-Encrypted: i=1; AJvYcCUJAEHVOesFYMpNoaSXCxpxf86STNKq1kEDf+H4NFqW1TX7feT54k1ldDnVEG1mQP3hEiJMkigRyT0MJYTb@vger.kernel.org, AJvYcCUoPH5Br4rdJrSxIMmejaJ7jElz4bdrWMn+kUGLJWjnW1XuYY6lbIPJ1ncMPnrqNi3/i7XmJOIIvtghbyw=@vger.kernel.org, AJvYcCXws/ZBOsDZ9ZFgS97a0VY6Pfog6Vs6NDUyVKciGDLOtCP1UFTmeIzzrVRl3bP/7zHQkc0VHK2TKnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylnC74dV5EcVqlsbJrxHqM9K6RpMzoZh6EW0USQzTY49puR6eC
	RsmjIWJCv9XKLsIHMb7cXHvXG2UDYW+FMkYIvb0r36manUM+bINL
X-Gm-Gg: ASbGncsCxwkw552xsQolBBfx1THNQkvrZD8ySAt45eg1KZrLSqpy7WIPBQ7DyST07/q
	5X38xvrdv1lmU2K0svooxnXCSu6H5YoMgCpJs+yHD3xfaFgHXWrGh1v5ug9PlekXQPgSMm3LsIS
	mXzBvtfEYw5Uk+QVHVikW0L9jiFA9XFXDPguBQRMLjQgCsNNP8Ewyy0abxJ9qtiyiynhAc1lQxU
	q4GgpSiXToyIndm6UKJr/t1FeIwwis7nViJ2OFrQ8yxULZQsfdttsJPT/3TYpq7zbdrfRjYFDs7
	aZx81f/mRCFS/75fcq9QmhVn/Qy5M1wVDvr1F04=
X-Google-Smtp-Source: AGHT+IHUCCC1ZbzfmdybGFRCF44znxIZOOHkvN3g/bRKCJ4+JQ01IVGUGOvU111eCMRxYegqYl8+aA==
X-Received: by 2002:a05:600c:1387:b0:439:91dd:cfa3 with SMTP id 5b1f17b1804b1-43ba6760305mr31995755e9.29.1740755867222;
        Fri, 28 Feb 2025 07:17:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:46 -0800 (PST)
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
Subject: [PATCH v3 7/9] i2c: atr: add flags parameter to i2c_atr_new()
Date: Fri, 28 Feb 2025 17:17:24 +0200
Message-ID: <20250228151730.1874916-8-demonsingur@gmail.com>
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
index 80a76fe4bf51..b3ad70a9d5f8 100644
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
 
@@ -699,7 +701,8 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
 }
 
 struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
-			    const struct i2c_atr_ops *ops, int max_adapters)
+			    const struct i2c_atr_ops *ops, int max_adapters,
+			    u32 flags)
 {
 	struct i2c_atr *atr;
 	int ret;
@@ -721,6 +724,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
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
2.48.1


