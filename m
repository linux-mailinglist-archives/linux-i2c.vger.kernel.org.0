Return-Path: <linux-i2c+bounces-10871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E5AADEE5
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDF361C05FAE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A4E2641F8;
	Wed,  7 May 2025 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkzqlYwQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D2262FE1;
	Wed,  7 May 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620377; cv=none; b=WyhYA/E+WJVG83i2jLKt+NLOCrAjJSYBAE538AOkrclnwbDdd9TmueLoGk1axRnmJP6xYxuBJrvqNq15pweDToGyB9hYQwpsRb1VHXj9asvQzThUOEKpuVsvayr/ZKYsJZNaJCOakaKCQtitP0IBUJVcVeaJgXNURiI1RU0J2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620377; c=relaxed/simple;
	bh=HM6DuinZx2sh+jnebnCxT6tDq2JN3DjrUqzB8IGTLFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+emsB1F+EX5Ix0zFrTK2LT42VNCQ4wR/f3uKlOm39SxAEvWvdqKuZ+Zxx373PaQbcDrtoQbUHP9qt03rG1z6bpluEk/E6RZuHc5l2aB8K+pA7z3aH+eHx0mXgvXvfTAjIrxk+2G1/gp+lBC/cf8MbbV18xwJXtUvW4xkvn9B6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkzqlYwQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso12817539a12.2;
        Wed, 07 May 2025 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620374; x=1747225174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flOyTeGVhHyrcy5QyC0fGApva7GlKNGyqlIku/vedqo=;
        b=TkzqlYwQxFITD1QATy4TaSczSkk6e4BuLaiMbto5xQrQq3aIoOYT5+eIVfNTJVV3Lm
         BpMJp4oHYeVn1hcFxkGYy1/RBFqecGS0HLblJcAf1IvOyqrn+mQuIi6yjAYMIPhdn30a
         wX4JozuytDTrGarXGYHX7qhEL7uXQYYwaM5p6GTzmIbQx08lReMwO/sdnVDtZWjUK0/i
         tDae4ncsnHSs0xZS6Im/tQ/Jgau5ncaJsa5VrTNtxJTHzgvSqHWlPEJK777eH6M0tqZh
         uXA7270QlorSWVPYeHqg1PEZFXNO9jHvZ4uCNezbUQvHSKhhnq3J++b1Sf6nZ0AfXK6e
         g1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620374; x=1747225174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flOyTeGVhHyrcy5QyC0fGApva7GlKNGyqlIku/vedqo=;
        b=hN0qbT6ufKdj8BzdtstgCK1Sr2FWUGryoikMSR8SajCDFoDTS1uEtoJiCAOw576JxR
         6uvaDeoPRsyyM31qrNoKnAemrPN/SrBEAlcs2tK+HvT0CCbC5F5bUQoYscQlNlchXLcF
         oNo5DJs72MwbQhXr9kI4XEXCT8ykzyPycm5+fDgnmPjn//F3HdRw5bdUInjgoHF/Qr1C
         bZnKWlX3w+Drvd0SzKZ3lF39zkzVME2cSDJKaQ8mIgkZNK1OCp3LBqrNFeyhT1076uM4
         Y2sLBje5ZU4ridvFjHn/y2GS758hu4eOAULCWIoNhzTxX4LfLnDmCKxEqIVsi2vZ0Brn
         b1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWU2k7k9DfutDzoi+4nWXRmNNRm49Sf5JvpDbFJsXHF2JqM/bwQR/r3FMSsEn8ndi2wL4StLHyDHOo=@vger.kernel.org, AJvYcCWd7UumGLBpgySdm7N4c+4NsyU/DnsYMwuzyQn+ghtmuxPMkRGO7/wJsd9IlG5j8qBa5rx7KeHnAW8rnE0=@vger.kernel.org, AJvYcCXXdcsxz5MQqpaZfEdylshu8KBpEmvzijVFUbOaZdA7RBoQ/PsotK1TZxfjUYiEcXLzgD34DlbD+R3be2xF@vger.kernel.org
X-Gm-Message-State: AOJu0YyJK3RKYPkz1VSxxR25Ty/05ra7c9qxFVnb195EAaIJVwHKSlMp
	F7JnKrSsquWZ5H8lG5ZO8ylQ9JGGyl36IeHrLg/Qc6idcbyR1A6m
X-Gm-Gg: ASbGncsqZbbClbFpzsq8ZiI3Or1zLeHf7AwwiL0bMWOgI0t63f62egozQW+Ph7iyuCP
	LrO7bqeMB/w5miPKdAx2CMhB7JXfSYrXOuPkviftQnD95n57lLYqHY0IzRzCloZ5NxLT9MWg5Hd
	cA4xRDi05Q57fUk07wu9u6FJ7PLOwesDFnEuYS5T7mAUIyoMwxjUPNKu1zBWNa6DXBQoqBxWIC1
	uGJhkKlX/kMynwyN8SZPulDOP9g2ILkeVHJXBaerQ9CvbySwtt6DW9Ia1HATC3YCoobvup+6Tyl
	CQqoiLmhiy3KWM+3zBq7ykQq0BFwhnDFUPAf9dE9cZp6oo5KRs5g
X-Google-Smtp-Source: AGHT+IFXxlV6jbXujbUAb2lsCzZuE2meSKGq3ePsN0BK3i/iCUSHX/XmMKa+JC7qeZBiNLyqyUxaEw==
X-Received: by 2002:a05:6402:1941:b0:5fb:9f73:d0e3 with SMTP id 4fb4d7f45d1cf-5fbe9e29f20mr2446496a12.18.1746620374056;
        Wed, 07 May 2025 05:19:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:33 -0700 (PDT)
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
Subject: [PATCH v5 7/9] i2c: atr: add flags parameter to i2c_atr_new()
Date: Wed,  7 May 2025 15:19:13 +0300
Message-ID: <20250507121917.2364416-8-demonsingur@gmail.com>
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

In preparation for adding multiple flags that change the behavior,
add a flags parameter to i2c_atr_new() and an i2c_atr_flags enum.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c         |  6 +++++-
 drivers/media/i2c/ds90ub960.c |  2 +-
 drivers/misc/ti_fpc202.c      |  2 +-
 include/linux/i2c-atr.h       | 10 +++++++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 91aabfb4379b..121cabbdb85d 100644
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


