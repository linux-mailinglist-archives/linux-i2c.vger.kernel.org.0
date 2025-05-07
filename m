Return-Path: <linux-i2c+bounces-10869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF9AADEE0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EEC85003D2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F5F2620D5;
	Wed,  7 May 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQMgKwu1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED7625F996;
	Wed,  7 May 2025 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620374; cv=none; b=RiKtWXsdsr7IYv5/X68xYmwjqhUH8bypFjcAcLpjsT5NUEGlXHkNEZ9NwNfo/EmMBsQ3sXzCeOumgIfkla5MnlG1+qP42EGVk0XSUvV7ozWPjSoWYhiLusEF53GvBmZaVFov6rvlyi7MRExZGvjJBuk+fWksrFvskCiOxLdDQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620374; c=relaxed/simple;
	bh=xdQ82gGemJr1IKvKrbJ2QMrqcxyvWLY/s332uTcfUmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPLwN82ainHiTvl0pRWgc2suvk6hHHz4eNUefUmRq6qsMneioRGBDlZGVzZEs4ddJ86v5RrR/Tj8+NJrrOjiE+sdyJQ4O76qqlAtB5r9DsZsxfYVZ/XJwF9e2fOsF5ydkAbYOrbAm5UVO7qa0VljjFBsxQHgkg/XX8wWLvBNC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQMgKwu1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so7767394a12.1;
        Wed, 07 May 2025 05:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620371; x=1747225171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhvHD8kwauiST7C/SyOHrSilHwCFK0vC3xiPchPq8NA=;
        b=IQMgKwu1wGIY4j6LElUo5i7LpH7FM1JjIlx5ChwcuYfyfSTXjMJMuu35SrcnTSMRqM
         wlI6JXVMXcCeA9WAmkXK+uEM0+Z4/dzMpMpxF7j+lls16EFy+OzxZP0Bvq/ZA/B/N5TH
         Rie+wQ2Hw/6YNv+z0xL4fCz7+GWPuBrTvP07urRrngn+gR/cV52RST7thkdSC6khxFZq
         LfJEnM+CpOlwsb7TRexSnchz/Q47wTJE27huf5Bf/0LNwzKfAyCP2jMoIc5YR3xNYW+D
         1Fgs2w3Qp8+ioZc4HG4MoF1thAzNqqzTwn6qFN5b/5zTP7qRgJo4rS+Ag36O73+p0A9T
         rQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620371; x=1747225171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhvHD8kwauiST7C/SyOHrSilHwCFK0vC3xiPchPq8NA=;
        b=Nb9EEz5auiOsllhtJC1sPR+nkrI6Vv0NDcf9oTsUGmxQViYZGiKzgczbpBgXWkEX8o
         d8qpLN7T8oQUHUd1b84p+kq5EcL8ob82AtHQoXOnKx2Euy/3YINvT4sjElHP9owSy685
         q08S1kFJpgcT2LpsaeFP5ilrmKeaMUwPSCbzDbC3R7R5YpqvFHn0iNKXUl/iJOijF4E8
         TSlBWjyD0KYS2M6iX5xwU4g1dp4pAFYPviJL1GxYoieiNZmoOinUyR+WNNoICRicalPR
         S3b5V56J1ObBqKua5sxo5a7/DCkKyByzMbTIoCPz5vOnkoWgF2DzobA2zstnxdKGIqrs
         ZENA==
X-Forwarded-Encrypted: i=1; AJvYcCWPGo7GC1evq8I2gTKKJG4myw+b+NquAEXSTI9KINgtRZg9G9JlWZcwkR4ns2ggDgk107U9yCoLUyxIsz4=@vger.kernel.org, AJvYcCX+dmGLV5JUSfmqyX/f93HbSuJS1Ao2GjWjG0BhVX44H+YGW9S99OH4KV3VcW4LOrIHm7b5TtBBpQDkysl6@vger.kernel.org, AJvYcCXcwacX9rSKZCQjAkL/iqh99luwcLn3VzkGDFjm+5JFkiTUpxl3yseNP3ga6nGnYaWQ/nwxY5kgg5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+bLTK7wO+ibvdDm7GZvF6lVCdXMCMFbmi78fa3JDfIXCYt18K
	bSNwu9ug+vPmhGx3+DP1tYrOGq9gXRB+3KorZB28oG7fPaBoqeoQI2LI8w==
X-Gm-Gg: ASbGncvHmGr2cSlb7KW2fkcLnVWhLzc3IorumpGang73QRpxsfUOUGACn775g6rq90B
	pmPjx3LuTgbKcb09/a+VYk5qY4vplra4j0l7kZpyIhwR9kMDj3+33yOADEKrwdQuHoUvzc73oei
	yYG5w9b9H6nrsOwF1VSFlu38eyHbITepBaHKSTqUaP5O1yDGIbTLhpQT2rfpTthYJmMiseYoIAz
	qhsesU/XM6CANe7mntv0sgmX/oLnxrj/4hJ9deGNAHcxU93jxvlMr0eIFWctenjGjqASSNn3NHn
	hi6zYmJqqDT1eAgqg4yGvB8yaoiCsTy7PlwOalT4Pi25Osa47k6X
X-Google-Smtp-Source: AGHT+IGGroLXZEK0/AsAn75xHrdlHzx76LtjWKt7DEFfQTsNpsDC7acgvYNZrfAmH5zGlgClKELL9A==
X-Received: by 2002:a17:907:9814:b0:ad1:8dde:5b7a with SMTP id a640c23a62f3a-ad1e8d055a7mr283204266b.43.1746620370865;
        Wed, 07 May 2025 05:19:30 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:29 -0700 (PDT)
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
Subject: [PATCH v5 5/9] i2c: atr: deduplicate logic in attach_addr()
Date: Wed,  7 May 2025 15:19:11 +0300
Message-ID: <20250507121917.2364416-6-demonsingur@gmail.com>
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

This is the same logic as in i2c_atr_create_mapping_by_addr().

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 178b203c8777..ae5c2ee629f0 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -538,38 +538,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	struct i2c_atr_chan *chan = adapter->algo_data;
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
-	u16 alias;
-	int ret;
-
-	ret = i2c_atr_reserve_alias(chan->alias_pool);
-	if (ret < 0) {
-		dev_err(atr->dev, "failed to find a free alias\n");
-		return ret;
-	}
-
-	alias = ret;
+	int ret = 0;
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_create_c2a(chan, alias, addr);
+	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		ret = -ENOMEM;
-		goto err_release_alias;
+		dev_err(atr->dev, "failed to find a free alias\n");
+		ret = -EBUSY;
+		goto out_unlock;
 	}
 
-	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
-	if (ret)
-		goto err_del_c2a;
-
 	dev_dbg(atr->dev, "chan%u: using alias 0x%02x for addr 0x%02x\n",
-		chan->chan_id, alias, addr);
+		chan->chan_id, c2a->alias, addr);
 
-	goto out_unlock;
-
-err_del_c2a:
-	i2c_atr_destroy_c2a(&c2a);
-err_release_alias:
-	i2c_atr_release_alias(chan->alias_pool, alias);
 out_unlock:
 	mutex_unlock(&chan->alias_pairs_lock);
 	return ret;
-- 
2.49.0


