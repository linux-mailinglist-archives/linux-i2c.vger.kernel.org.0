Return-Path: <linux-i2c+bounces-3016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E88AA46E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 22:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E5ED285236
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 20:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3933194C72;
	Thu, 18 Apr 2024 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvdxzcIW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A318E6D1C7;
	Thu, 18 Apr 2024 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473741; cv=none; b=ZyHq+ObfqUwPPHjRccesAjCbUNyNSwK0qwe/7YBT/yzktdGEeddrZWc8vj7dmKVIBpeHB6d80L3Wo/uAJF7sgm/OWe8awmL/zBDqn4ti2Ipbcot1CoFESCAhhN1CCnY7pPKGJr/5u5Mr38Axj0tnF+yLs6Cc0crwRlg6/1Rjjzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473741; c=relaxed/simple;
	bh=70x3DGOL23OgLSvI4imCf9PVOWcUoaYm5Xaq1sY53bc=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=J/WxEA8kWO5c9pTpi23iZH6rI/ASR6MQWPfKpG5OGR6ohLZSK0DBZDXgwtsIm6MsgONLNFPocxBqDYI/5uf0DHcwd8XHa7usz8OpeuoRCJu5KdASHrUpTxD3dOUkebqYNCbqcVhhItAQXvMikkPoUOx+4NRNbCQMQ0smmjJqcIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvdxzcIW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41905b15705so784055e9.1;
        Thu, 18 Apr 2024 13:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713473738; x=1714078538; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:autocrypt:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6G6hXATHHbhhEyyLqUvtbfj42Xjg4y1kL4uuSMBOaA=;
        b=AvdxzcIW60XuT7zdXo+bP5xW6TBc1GMvR3KgQeSRkiG8AmRwFVZntZ5tKEBLZn5ZzX
         8hOI4HLB8cZueXJ4llfHKzJc3ld24kPu2z+VpTAeehQja4wBzpUEzzcuGRHPQTyhb6HJ
         QRimi9T/wtHqoVZhb6GNtvSIkmGyFUmuWhHl4pYNSrZY7mj0q+297aJHTgbQ+qQyK3wk
         79XcwqAxChFH+oQfauNZdVznrVRjlgoWfqbCxjAdm4wz8bvJMFIkibafwCSnH/05G2qo
         Q2vtxs+nl+s+lyLbTtEfDX1DVyC7J7Q1lcIOGjmMOoPnc6FdlsfTZQ9ctw7lhcJdegXM
         i8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473738; x=1714078538;
        h=content-transfer-encoding:subject:cc:autocrypt:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6G6hXATHHbhhEyyLqUvtbfj42Xjg4y1kL4uuSMBOaA=;
        b=tWZdHUzljlFqbb4mXZYOTUI9aye54cMLyMS5KR4Gm+PoHucutMHJOSDg7Fn0gwlkeZ
         qFI7th6HjKGEzbZA2INShnuLVarawc4xfoLMh3yZ/4dqwPuFBbVaVr442xUqcHip+d9G
         VFhHkmZny5ICYZrxA3ApUD3tjR3zLqcpom6FEOmHiAI8vkfqbxbY/6weRMPFBNEjAQpO
         xILvGXdJDBzu6BV4Rh1w0bW2FfYLnqrhrmqpxIvQg6I53L6yhlyCe2HUijS1cx54BQ7I
         2L69FDovzAt9jp5P2zTp9gLfy9Z65Ef9oYzWdAXm9zCKKLvGOBmR8nyh7nnmf5TviQPI
         lVdw==
X-Forwarded-Encrypted: i=1; AJvYcCUY310GF5wfAPgq9J4uQPp2Jkb4W612L9UqysX1K3NyzwNRTxBCe96jq1raZi2cuOTno27o3C82ZlaGjzttCr5mwlftMwgShJslt+8xbUuQPW7KD3YNeaZ2V+rzxPafNTUSjrwCFZvwUpxdGQ6gprrGkVDJKpmHAWfJ9YPL22FKwFvEWx7p8t/3TJnQhAtbC4VgCHkZuRd0civwmezD
X-Gm-Message-State: AOJu0Yz0Wz4eHls0ywL6JhQSzZDFB7dAvAZ+RPS/bIBZsU14wCOrHs8X
	WDRzistSkWb5MweroC5qRWkJt6UO5joMCpooGnq0oEcX7N/PzviO
X-Google-Smtp-Source: AGHT+IG0lh5CvZoLRcJQEBh9+F8J+kd12EiPNafW79t0BfSpd/Y2P/zkaJFg3Orj4hayd226eac+zw==
X-Received: by 2002:adf:f2d1:0:b0:346:c912:3e97 with SMTP id d17-20020adff2d1000000b00346c9123e97mr48482wrp.44.1713473737630;
        Thu, 18 Apr 2024 13:55:37 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7a7c:3800:df8:a4c3:282a:f888? (dynamic-2a01-0c22-7a7c-3800-0df8-a4c3-282a-f888.c22.pool.telefonica.de. [2a01:c22:7a7c:3800:df8:a4c3:282a:f888])
        by smtp.googlemail.com with ESMTPSA id u17-20020adfeb51000000b00347321735a6sm2669086wrn.66.2024.04.18.13.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 13:55:37 -0700 (PDT)
Message-ID: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
Date: Thu, 18 Apr 2024 22:55:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Vadim Pasternak <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij
 <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH] i2c: mux: Remove class argument from i2c_mux_add_adapter()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
instantiation") removed the last call to i2c_mux_add_adapter() with a
non-null class argument. Therefore the class argument can be removed.

Note: Class-based device instantiation is a legacy mechanism which
shouldn't be used in new code, so we can rule out that this argument
may be needed again in the future.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/bridge/sii902x.c           |  2 +-
 drivers/i2c/i2c-mux.c                      | 24 +---------------------
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  2 +-
 drivers/i2c/muxes/i2c-mux-gpio.c           |  2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c          |  2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c        |  2 +-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c        |  2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c        |  2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c        |  2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c        |  2 +-
 drivers/i2c/muxes/i2c-mux-reg.c            |  2 +-
 drivers/iio/gyro/mpu3050-i2c.c             |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c  |  2 +-
 drivers/media/dvb-frontends/af9013.c       |  2 +-
 drivers/media/dvb-frontends/lgdt3306a.c    |  2 +-
 drivers/media/dvb-frontends/m88ds3103.c    |  2 +-
 drivers/media/dvb-frontends/rtl2830.c      |  2 +-
 drivers/media/dvb-frontends/rtl2832.c      |  2 +-
 drivers/media/dvb-frontends/si2168.c       |  2 +-
 drivers/media/i2c/max9286.c                |  2 +-
 drivers/media/usb/cx231xx/cx231xx-i2c.c    |  5 +----
 drivers/of/unittest.c                      |  2 +-
 include/linux/i2c-mux.h                    |  3 +--
 23 files changed, 23 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 8f84e9824..2fbeda902 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1092,7 +1092,7 @@ static int sii902x_init(struct sii902x *sii902x)
 	}
 
 	sii902x->i2cmux->priv = sii902x;
-	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
+	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0);
 	if (ret)
 		goto err_unreg_audio;
 
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 57ff09f18..fda72e8be 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -127,19 +127,6 @@ static u32 i2c_mux_functionality(struct i2c_adapter *adap)
 	return parent->algo->functionality(parent);
 }
 
-/* Return all parent classes, merged */
-static unsigned int i2c_mux_parent_classes(struct i2c_adapter *parent)
-{
-	unsigned int class = 0;
-
-	do {
-		class |= parent->class;
-		parent = i2c_parent_is_i2c_adapter(parent);
-	} while (parent);
-
-	return class;
-}
-
 static void i2c_mux_lock_bus(struct i2c_adapter *adapter, unsigned int flags)
 {
 	struct i2c_mux_priv *priv = adapter->algo_data;
@@ -281,8 +268,7 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 };
 
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
-			u32 force_nr, u32 chan_id,
-			unsigned int class)
+			u32 force_nr, u32 chan_id)
 {
 	struct i2c_adapter *parent = muxc->parent;
 	struct i2c_mux_priv *priv;
@@ -340,14 +326,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	else
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
-	/* Sanity check on class */
-	if (i2c_mux_parent_classes(parent) & class & ~I2C_CLASS_DEPRECATED)
-		dev_err(&parent->dev,
-			"Segment %d behind mux can't share classes with ancestors\n",
-			chan_id);
-	else
-		priv->adap.class = class;
-
 	/*
 	 * Try to populate the mux adapter's of_node, expands to
 	 * nothing if !CONFIG_OF.
diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
index 24168e9f7..7aa6e795d 100644
--- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
+++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
@@ -167,7 +167,7 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
 	}
 
 	/* Actually add the mux adapter */
-	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(muxc, 0, 0);
 	if (ret)
 		i2c_put_adapter(muxc->parent);
 
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 0fbb33a3d..d6bbb8b68 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -207,7 +207,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < mux->data.n_values; i++) {
 		u32 nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
 
-		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
+		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
 		if (ret)
 			goto add_adapter_failed;
 	}
diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index 8305661e1..10d63307b 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -124,7 +124,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
 			goto err_children;
 		}
 
-		ret = i2c_mux_add_adapter(muxc, 0, chan, 0);
+		ret = i2c_mux_add_adapter(muxc, 0, chan);
 		if (ret)
 			goto err_children;
 	}
diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 23766d853..19a7c3709 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -279,7 +279,7 @@ static int ltc4306_probe(struct i2c_client *client)
 
 	/* Now create an adapter for each channel */
 	for (num = 0; num < chip->nchans; num++) {
-		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
+		ret = i2c_mux_add_adapter(muxc, 0, num);
 		if (ret) {
 			i2c_mux_del_adapters(muxc);
 			return ret;
diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 4c6ed1d58..3f06aa333 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -154,7 +154,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 
 	/* Create an adapter for each channel. */
 	for (num = 0; num < pdata->num_adaps; num++) {
-		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
+		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num]);
 		if (err)
 			goto virt_reg_failed;
 	}
diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index ce0fb6924..e28694d99 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -314,7 +314,7 @@ static int pca9541_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, muxc);
 
-	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(muxc, 0, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index c3f4ff08a..6f8401825 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -644,7 +644,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 	/* Now create an adapter for each channel */
 	for (num = 0; num < data->chip->nchans; num++) {
-		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
+		ret = i2c_mux_add_adapter(muxc, 0, num);
 		if (ret)
 			goto fail_cleanup;
 	}
diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
index 6ebca7bfd..02aaf0781 100644
--- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
@@ -151,7 +151,7 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
 
 	/* Do not add any adapter for the idle state (if it's there at all). */
 	for (i = 0; i < num_names - !!muxc->deselect; i++) {
-		ret = i2c_mux_add_adapter(muxc, 0, i, 0);
+		ret = i2c_mux_add_adapter(muxc, 0, i);
 		if (ret)
 			goto err_del_adapter;
 	}
diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index 8489971ba..ef765fcd3 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -213,7 +213,7 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 	for (i = 0; i < mux->data.n_values; i++) {
 		nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
 
-		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
+		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
 		if (ret)
 			goto err_del_mux_adapters;
 	}
diff --git a/drivers/iio/gyro/mpu3050-i2c.c b/drivers/iio/gyro/mpu3050-i2c.c
index 52b6feed2..29ecfa6fd 100644
--- a/drivers/iio/gyro/mpu3050-i2c.c
+++ b/drivers/iio/gyro/mpu3050-i2c.c
@@ -72,7 +72,7 @@ static int mpu3050_i2c_probe(struct i2c_client *client)
 	else {
 		mpu3050->i2cmux->priv = mpu3050;
 		/* Ignore failure, not critical */
-		i2c_mux_add_adapter(mpu3050->i2cmux, 0, 0, 0);
+		i2c_mux_add_adapter(mpu3050->i2cmux, 0, 0);
 	}
 
 	return 0;
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
index 410ea39fd..0e03137fb 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
@@ -142,7 +142,7 @@ static int inv_mpu_probe(struct i2c_client *client)
 		if (!st->muxc)
 			return -ENOMEM;
 		st->muxc->priv = dev_get_drvdata(&client->dev);
-		result = i2c_mux_add_adapter(st->muxc, 0, 0, 0);
+		result = i2c_mux_add_adapter(st->muxc, 0, 0);
 		if (result)
 			return result;
 		result = inv_mpu_acpi_create_mux_client(client);
diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-frontends/af9013.c
index a829c8979..5afdbe244 100644
--- a/drivers/media/dvb-frontends/af9013.c
+++ b/drivers/media/dvb-frontends/af9013.c
@@ -1480,7 +1480,7 @@ static int af9013_probe(struct i2c_client *client)
 		goto err_regmap_exit;
 	}
 	state->muxc->priv = state;
-	ret = i2c_mux_add_adapter(state->muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(state->muxc, 0, 0);
 	if (ret)
 		goto err_regmap_exit;
 
diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 263887592..91c71b24c 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2203,7 +2203,7 @@ static int lgdt3306a_probe(struct i2c_client *client)
 		goto err_kfree;
 	}
 	state->muxc->priv = client;
-	ret = i2c_mux_add_adapter(state->muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(state->muxc, 0, 0);
 	if (ret)
 		goto err_kfree;
 
diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index e0272054f..6c69bcc7a 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1866,7 +1866,7 @@ static int m88ds3103_probe(struct i2c_client *client)
 		goto err_kfree;
 	}
 	dev->muxc->priv = dev;
-	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
 	if (ret)
 		goto err_kfree;
 
diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
index 35c969fd2..30d10fe4b 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -838,7 +838,7 @@ static int rtl2830_probe(struct i2c_client *client)
 		goto err_regmap_exit;
 	}
 	dev->muxc->priv = client;
-	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
 	if (ret)
 		goto err_regmap_exit;
 
diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index 601cf45c3..5142820b1 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1082,7 +1082,7 @@ static int rtl2832_probe(struct i2c_client *client)
 		goto err_regmap_exit;
 	}
 	dev->muxc->priv = dev;
-	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
 	if (ret)
 		goto err_regmap_exit;
 
diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index dae1f2153..26828fd41 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -744,7 +744,7 @@ static int si2168_probe(struct i2c_client *client)
 		goto err_kfree;
 	}
 	dev->muxc->priv = client;
-	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
+	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
 	if (ret)
 		goto err_kfree;
 
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index d685d445c..dfcb3fc03 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -383,7 +383,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
 	for_each_source(priv, source) {
 		unsigned int index = to_index(priv, source);
 
-		ret = i2c_mux_add_adapter(priv->mux, 0, index, 0);
+		ret = i2c_mux_add_adapter(priv->mux, 0, index);
 		if (ret < 0)
 			goto error;
 	}
diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index c6659253c..6da8e7943 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -567,10 +567,7 @@ int cx231xx_i2c_mux_create(struct cx231xx *dev)
 
 int cx231xx_i2c_mux_register(struct cx231xx *dev, int mux_no)
 {
-	return i2c_mux_add_adapter(dev->muxc,
-				   0,
-				   mux_no /* chan_id */,
-				   0 /* class */);
+	return i2c_mux_add_adapter(dev->muxc, 0, mux_no);
 }
 
 void cx231xx_i2c_mux_unregister(struct cx231xx *dev)
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 6b5c36b6a..c8ee866d7 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2815,7 +2815,7 @@ static int unittest_i2c_mux_probe(struct i2c_client *client)
 	if (!muxc)
 		return -ENOMEM;
 	for (i = 0; i < nchans; i++) {
-		if (i2c_mux_add_adapter(muxc, 0, i, 0)) {
+		if (i2c_mux_add_adapter(muxc, 0, i)) {
 			dev_err(dev, "Failed to register mux #%d\n", i);
 			i2c_mux_del_adapters(muxc);
 			return -ENODEV;
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 98ef73b7c..1784ac7af 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -56,8 +56,7 @@ struct i2c_adapter *i2c_root_adapter(struct device *dev);
  * callback functions to perform hardware-specific mux control.
  */
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
-			u32 force_nr, u32 chan_id,
-			unsigned int class);
+			u32 force_nr, u32 chan_id);
 
 void i2c_mux_del_adapters(struct i2c_mux_core *muxc);
 
-- 
2.44.0


