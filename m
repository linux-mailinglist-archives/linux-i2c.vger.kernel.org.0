Return-Path: <linux-i2c+bounces-10659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37930A9EDEA
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7BA17B7EA
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA6D267B88;
	Mon, 28 Apr 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIjoUvrO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1E26772D;
	Mon, 28 Apr 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835941; cv=none; b=mOQhSAI5EdmdxQA61hd0Sb9DUC2VF56cFS+pvINGZ0Byv7Pr44eq0hwFTf9BgeBsf2mze4lUNQHcmIxSJO1sVWFbCvJ9R9JeZfZKdzFU2hXM7y/r755mkkFWCEo7dOQKc0ClARXBYU5FV4p8IyxOJeNVRA2BrJ+syMJ0/slXT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835941; c=relaxed/simple;
	bh=kS2ojk5mFcuTEOL5Av4Vkzo/0K2ukqo/hTTjuCtnp6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiUWyDVyGimqZdWyRYB97A+ZwgN1f8dz645nxvRkTN+LWVZ/6lXbMq8un4oiwn8m/1fKhxjoNSG+guGbHBnIK7xG24nzUY2D40iZ472ywZah2xyA4Y2oBjHZs2QlCm4P0CczJ25sQNEiO548jQVO8WsNoCtNFY0yOk+n66iVeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIjoUvrO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0618746bso33052345e9.2;
        Mon, 28 Apr 2025 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835939; x=1746440739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjAprgRPYSxAxvUhwkUwVVhY0k0mTTyvi9RIp/BHqvw=;
        b=CIjoUvrOH0DVkDgM5KcM/jTWFjW0kqE2YYBjpmrlyvNIdIW+YNfj6MzjbzeI8CAgqf
         qLtcxnN2RsyPRq0pYdweAZxtol7ivEjugxBMnHyuvhRmaKd0JkW8XPpOx/VrphlrQwkO
         CGsBNx5m71r/cQPmxfHC/8Et6Y4a91xhytzvh8wApAmdA7e7sK9Wa3XDVL0mmqsISEI5
         UbIK2oWaoPj8qvoFmN6lgZVH/6Z1pCfqWrRbbhhQbpHD9C1B29cqVEQX+e7OdqZlOUMz
         DLQLwnXInjK52//enYOPvAFgbrCSjDI6FxhcQ0qv9tedl21othXNh5TsGzPb6D7Ki3OM
         al6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835939; x=1746440739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjAprgRPYSxAxvUhwkUwVVhY0k0mTTyvi9RIp/BHqvw=;
        b=tMdGgG7xFpOxlIg22YseQVqxgwt3Xz8uy8MLP1S4Z8Pb3LQQOEoOuydSDOrl6DJ7ob
         vkBy1B276PQ6HrNd08aYeEd6/Wl/RCv0A6TyLyudEbGYWNUZK6qxnBAYCJTIWSOyK4zK
         JogUVX2mdt4pm2zf2/P2xERe/fvzsLF/FvHuIAoZiSGjyFPLGTCXpbeXZYsp9ezNbQ9h
         umX5KT+xuUh8lvBYzMN160Tl+CngwxFj0W9AN5D7MxQ9YpGQ0G56hvJHEw+SzyDq5SNr
         golX1Ob/5BgokxQOktQil50wuNY+DGXJTgKPVuMF72MGazIhCPj1j/6sRbP+VDIDAIfC
         SpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRyddcg+q19T/EhmRpxi1BOW+xb0U2iMKUavU3tlnh9zdZ7WV6uLerMawM6do7HSu4xDgNWWv40KcIjnM=@vger.kernel.org, AJvYcCWg41IQ1juUKxc5ie8Ypn8ZSrnRQMZ4v4BT04qPZ0TPo4/cI86O1QhIFIby1zgRuQo7gHfts4ZSw0Y=@vger.kernel.org, AJvYcCXosWw080p3RokKwlInU07p3SwMGeM1txFSZkJmWvfFLQmND1JWKTRWWoXZxYCPwYs+/OlHhkyS00OAxZcs@vger.kernel.org
X-Gm-Message-State: AOJu0YySCZmYTTdDNyjLJl20C6OnsNgEl9+zLv4BNhfrV48O4Ym/TPh7
	ZbhiX52X7ZPNTHJ2PuD1z/e1vT5kJLCqpoYTnZcta1r/WLxlJt2j
X-Gm-Gg: ASbGncu+x9C31mqnUVFSMWrV+k5NZ25o3O0kKm1/oBzY22nXJ3Ca6tuLU87JZk9vFzf
	RlWnQz3ggn/4rL1v0HRY4mCyTnpzPCor3pOdZ0z9rR5ivo9t6KFZBys2hQ5POTomEYA7hzHaMUi
	MDv5pYdbJwGEfi3qKLTaFRsWd8FksuiWlkqOeMGyELsNOf9GKhEBNNAO8j4iXBJkbbnOdo4/emk
	Q5W3k4SLqmaPLuO+cpOClDmVuAbuWjjd0wqinkRC9Xyi2HEcdAL6GD5klFJg02s4n3UAoKOFPaY
	/0TeBW6uUlcRhfZfWPiiHeszgd3jmV2UM33Uud3Gh0xBH/BfhVJn
X-Google-Smtp-Source: AGHT+IGf803XhAxyWvzPOPB67XfZ8fR9gRzbDLwOjSE9C/XNYZFv05wocFOc4tpdshofY79Pu6jGbQ==
X-Received: by 2002:a05:600c:1f91:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-440ab7b7969mr86232935e9.10.1745835938636;
        Mon, 28 Apr 2025 03:25:38 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:38 -0700 (PDT)
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
Subject: [PATCH v4 9/9] i2c: atr: add passthrough flag
Date: Mon, 28 Apr 2025 13:25:14 +0300
Message-ID: <20250428102516.933571-10-demonsingur@gmail.com>
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

Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
the child ATRs need to be forwarded as-is if the parent I2C ATR can
only do static mapping.

In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
address remapping hardware capabilities, but it is able to select which
GMSL link to talk to, allowing it to change the address of the
serializer.

The child ATRs need to have their alias pools defined in such a way to
prevent overlapping addresses between them, but there's no way around
this without orchestration between multiple ATR instances.

To allow for this use-case, add a flag that allows unmapped addresses
to be passed through, since they are already remapped by the child ATRs.

There's no case where an address that has not been remapped by the child
ATR will hit the parent ATR.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c   | 7 +++++--
 include/linux/i2c-atr.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 721dd680f2ac..eccb85c34609 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -394,6 +394,9 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
+			if (atr->flags & I2C_ATR_F_PASSTHROUGH)
+				continue;
+
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
 
@@ -486,13 +489,13 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
 	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 
-	if (!c2a) {
+	if (!c2a && !(atr->flags & I2C_ATR_F_PASSTHROUGH)) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
 		mutex_unlock(&chan->alias_pairs_lock);
 		return -ENXIO;
 	}
 
-	alias = c2a->alias;
+	alias = c2a ? c2a->alias : addr;
 
 	mutex_unlock(&chan->alias_pairs_lock);
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 7c6a9627191d..f979b931ca05 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -22,9 +22,11 @@ struct i2c_atr;
  * enum i2c_atr_flags - Flags for an I2C ATR driver
  *
  * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static mapping
+ * @I2C_ATR_F_PASSTHROUGH: Allow unmapped incoming addresses to pass through
  */
 enum i2c_atr_flags {
 	I2C_ATR_F_STATIC = BIT(0),
+	I2C_ATR_F_PASSTHROUGH = BIT(1),
 };
 
 /**
-- 
2.49.0


