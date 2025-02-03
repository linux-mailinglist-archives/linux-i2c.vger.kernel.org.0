Return-Path: <linux-i2c+bounces-9267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09870A25927
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 13:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697CF3A44A8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E402046BE;
	Mon,  3 Feb 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNR07H6U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB5204696;
	Mon,  3 Feb 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584999; cv=none; b=LzWFqK0TfertaWKSKmachGNUg+D3q7GJTN+jZ+wxDrcpayV3vEVnJeIlS4ntl97L3ovvh846zyVY89YcZ3oU+vLtH22hEC8CKpl0RoJiNlYmpSsJfIg8I4cwUyLeUUOjAfBMMjfP9hP3ml/RqNgg1yODN9a3/0gXES3qygdUJ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584999; c=relaxed/simple;
	bh=jPZm8GNgti5PehUYmH/DBEYzWooi10IL4H1OU2vb6QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mO30scg5oibMdgD7/dMj2ZOrHkGkX4vVDKKd+m/g8bui98ugtQesMNkm4S9iTR7a9PfD3dm56YE/IGbHhcFgdoP1iEmtOn13QJUwloKRSnzWcI9FUqcPp/kxSXIp4H8U2Yk6uw0JAcEvbRE1k79UYSRMzVUWSr2gbKb5jaVKLO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNR07H6U; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2323409f8f.0;
        Mon, 03 Feb 2025 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584996; x=1739189796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcYd0DDtGT0W8tBu7DjwocumUzGM2umiKoOO1mgVdB0=;
        b=jNR07H6UfzoCt5x+j9wIcEzzj2cCH400cXhphzW4diW7TDny+Gy6QYG8S7fD3KE7FW
         1V/cyQP4iroIH4X2YAbNyJyZf8P23kjKsUOZESWrubtdPlLdPSrjKrBZa/IfCu7kw+po
         WnRF+w34vwa4UqcF9os08oSxEj8Xc2ImFD4SxysoIYpw3qJ84/WWl9mSngzKkb3qWCHJ
         JjqW/AVu/e4GthJUONtjy2QSAn14OF7oQqObozOG+eaHv6qpvmgOZ1/NF52Kjb7pBOc1
         IvNO70YxjmeOO0E3hZWKJPggN7zxe/L1InvHUIagQ9aIitRnMF3NLStOHYhphSkffWZH
         ZoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584996; x=1739189796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcYd0DDtGT0W8tBu7DjwocumUzGM2umiKoOO1mgVdB0=;
        b=PVOlM3jcQ8qzCkxn52wqFxTNAux0tHwqHcRXtq1eyJwugMj75W8RwrQ5PQ7GqSGfTj
         H2bGz9hkakn2++TDSxEEKjxWP/DJAcK3vPeI2TIau7fIFxBL3hnQFbjgI2/So0QUl8Vv
         kJzrrJaG6HF10ObU5anHYzQx8ZOgXUKnjyvGxAtOhIE4VjQo5lwirdVk79vvEHgQePqI
         rb/Ob97Ug2X9luyU9txLsmH49IDElfbLIuwTmA83GLASNpkt09gVXDg+ZYXlDIFGIdW7
         GB4RWPnPK+5b5eraw7obYPjs+IDKaXEaLIJoqQzFhPC1/tINre2iu8qVRTlMS6sOcwcD
         EmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8OPXW5ImXTe/T8iNDyhIE5luAh3JvHwlhPOIK2wEenxXbi+7Lbg1tkUTmKS+359GFeVdtuy0aBOE=@vger.kernel.org, AJvYcCXzPLEJcDxTgT4cx6/lz/a8koCaGWrBgcysCuMowf2YdNypAj0iO80aHpqJQkPXeG+a0oL90j8ekotZQ/GW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7iyHq/+yzF+IuUsvSHSWUbuRImlfqNluGRqMGtTs5nNsQ+ii
	WKPMl+FTWmbHWcJn8TV4mI/Pg9Hkd6LXk13IxsrrOBCnVQcS7tre
X-Gm-Gg: ASbGncvOTQ4h0w/WS/gAOdoRIH7x33mJslmYmvoCT21UHSYr1OB5zIltrOqDgmmfwr4
	P9MuvaeSI+HcMThQCC2JmmToKSUhFfvjhNOq8wgb1dSoruga4wu9ESdGH36JfxLL92/GDT0E7Jz
	fabw/O22OCSYWbUbIMLAzBQA/4ErLzv7i3SV3sYV0uZkOqwG0kCHHPlgpHORBI+TO98kP+8QvX9
	vCj0GhV/5cOWZulbOIET8EFFUK+20iQsYKGQ6NROdhBagBttWNeatcw0vE7WajSEy/nHwqn7geZ
	+folAwHV0lg+o3Da4d2jJ0V6Ql8=
X-Google-Smtp-Source: AGHT+IFxH48P1t8DtTnljE2QrlAPAk8tRIERmlgs/Yt3gwlH8008dXaDyknlKWGr+EskI03a1pq+jA==
X-Received: by 2002:a5d:6da7:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38c520a3857mr17368156f8f.36.1738584995733;
        Mon, 03 Feb 2025 04:16:35 -0800 (PST)
Received: from demon-pc.localdomain ([86.121.79.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa3dsm12805326f8f.93.2025.02.03.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:16:35 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 2/3] i2c: atr: deduplicate logic in attach_addr()
Date: Mon,  3 Feb 2025 14:15:16 +0200
Message-ID: <20250203121629.2027871-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121629.2027871-1-demonsingur@gmail.com>
References: <20250203121629.2027871-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is mainly the same logic as in i2c_atr_find_mapping_by_addr(),
except for the missing dynamic detach / attach.

There's actually no reason for that logic to not be run, since it is
possible for a single channel to exceed alias pooling capabilities and
to need to remove some aliases before even finishing adding the
channels.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 39b3b95c6842a..13f7e07fd8e87 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -488,41 +488,22 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
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
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_create_c2a(chan, alias, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		ret = -ENOMEM;
-		goto err_release_alias;
+		dev_err(atr->dev, "failed to find a free alias\n");
+		mutex_unlock(&chan->alias_pairs_lock);
+		return -EBUSY;
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
-out_unlock:
 	mutex_unlock(&chan->alias_pairs_lock);
-	return ret;
+
+	return 0;
 }
 
 static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
-- 
2.48.1


