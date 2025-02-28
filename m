Return-Path: <linux-i2c+bounces-9656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D1A49D2C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED28E1893914
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DC5280A36;
	Fri, 28 Feb 2025 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9IxeuWp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495527781E;
	Fri, 28 Feb 2025 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755875; cv=none; b=PFrPlOHg5voSLz3SoyCGwN55DItwbA2yy2MtNLtH240t0M1uzcoVh1gjK4B4dacJulR+p8Hll+SFaIKby/evf9B6VCROlJV9oBTfqQ4Uggscc6bVwjX5nGmRFhRkGRtcEM/SXRpBM3qX2W+sOzy7iqS0cAXyCyxJQEv8Iz9cm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755875; c=relaxed/simple;
	bh=+c/cArmccdVpgW/XqUAwxxkRjm/IBO9LbeKsevVUHyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Krac9PrHdJnVwP4BxckZCnuXZEICoQi2Kz4uW6THvlkrwPsndLmZ47USSyTzWnORPxGJQS69cyzJA04y21J78nA94ZhoOg/9PDmCJV5z+eayDxX3VOmCq2gkhXtlrUXrMY7MwoZdl4VS+ur91cfw4QhY3re3ZJ+twmV9ja73M/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9IxeuWp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so20271525e9.1;
        Fri, 28 Feb 2025 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755871; x=1741360671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXNpYBoe/Rd5GuuvNB+oq/lSRtvK1so1zgVywfK3t8s=;
        b=T9IxeuWpJ3ZkcmcQr4xUdpvh30E/cQWR4+8lpm5cZ9xDMODdQeYHpFepmWb7CeV+AI
         PaXUAFrpFTvUFP5AVGBdqn+ONmARED5p6PMVBTKtPaxlGuVUmknjO9vZ4rmj7UEtu1a0
         VU7VCx6jAfoU0SgimnS08+d1n36qhi9OXw+a7DDLYYc+13OVVGKTSbiNLc8XUCzYAxip
         SuAXq7dDcMTXLUTlv5ZprY3Jr6uclQvyOvoIclgXRvlAF4SzPPAXKJm+Uk1pzLqWZho6
         cqT67mQgyYiE2DDC+aUXFvexwZKS+pB2HlLypvFkiHz3/Z36yxLOmKTgXrOoL/ouLMEu
         zYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755871; x=1741360671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXNpYBoe/Rd5GuuvNB+oq/lSRtvK1so1zgVywfK3t8s=;
        b=eJvCk/OZMZQrMf6tZMyLkDwOch2bBDJkHbv1BdWGPn2DTQvi8dn0kWs/vy+Yb7sTgc
         iGSsaJRp6TiCPJjUAA9INqS518DIA42RkrpzyfkrK2RLl8mNFwOzo6Ev+uzE6j4WQGlk
         JXBCrseadyYb47rRzwzr8IOJv2fnHAi5R24oGzlYws6Q8s+1nQNqiVJdno/Gc/F7AYfv
         NvaXI6LBZJP6Gvuu16trOAEKprRRV4YVyXJVVfMGELC62Y/J+Fys9xbKzDAotYlJoHPf
         chFMMCeYbe6n+vZBLZ8vCIn7Jp6UzaJeD3w4GIpLfFRiayylBVQjrc0+oWCFQygXD9ui
         00BA==
X-Forwarded-Encrypted: i=1; AJvYcCU5783qmkKWn2aKo+yHW2hpp2CjeG0ocPs0iDPwOUUTQ49gcXbbvnu/+fIgZNi221+WSIQpDQtGPz8=@vger.kernel.org, AJvYcCWMTTcpIhlzRIZKMi8LZf04ApFHmymd+YPpd2Q1FjoKBtsR5G6L2Tg8l+uPA2o5z4fORoIzqo9k5DH2z1I=@vger.kernel.org, AJvYcCX+9/ob5Dvw1yNuuX8lh1XqJ3Z65GxfxsnKgaLfKqXs0WWxRcOxQ4EcKclowUZbl0KVXu4lLcl1XOPys7Iv@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfitdIPTTIZkL8Qga6sSP8DPYQLN7I8Zg4lFKI5FMkAFJaXzn
	SgYkHSvCcIDYyZcvAvMyZ8EZi8tF0JOf7l8cxg68K/XSJHwAwFcI
X-Gm-Gg: ASbGncuk6LiKuQqZ7qqTORCbv0CfvvlfjTuH3kDumu5FIbJ6WNytJ42AwolfI9Ux501
	f8tGju40QEn49z5U999JY4g4aXR3Jec53cQy6vzOjpnQGPN7sisa+VMFYPQ2toKzefltqcFZsdY
	7Dlv1AURlnnP+qThNkCecfw7bzfo5EXmrWxUmr1QdTCe7OBpUWrIOro7V6d9iUrDvcdASIjf/aS
	+gzcrZj5ePmTCTfRTW5bwgEwrbG81+ZUr30Lk7mhCca3j3wD7lItwiGBOm3fXZFovWuK4OwxUP9
	rryukpb5KzSbP4G1564GVH6wzf1fUgF/7czUwJM=
X-Google-Smtp-Source: AGHT+IHgnDNSyRbxWFIVxBnQrBG4eQUmoRauNdsSwxjsBbalYes6/9RG6l4xH2PwkzDkC3v2abvGCg==
X-Received: by 2002:a05:600c:1c8e:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-43ba6744a10mr25188575e9.26.1740755870539;
        Fri, 28 Feb 2025 07:17:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:50 -0800 (PST)
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
Subject: [PATCH v3 9/9] i2c: atr: add passthrough flag
Date: Fri, 28 Feb 2025 17:17:26 +0200
Message-ID: <20250228151730.1874916-10-demonsingur@gmail.com>
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
index 699cf23185c0..c7d0a30e7c39 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -390,6 +390,9 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
+			if (atr->flags & I2C_ATR_F_PASSTHROUGH)
+				continue;
+
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
 
@@ -482,13 +485,13 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
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
2.48.1


