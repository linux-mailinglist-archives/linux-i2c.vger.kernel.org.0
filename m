Return-Path: <linux-i2c+bounces-10652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A965A9EDD3
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68EB416D2DF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E1F262FD8;
	Mon, 28 Apr 2025 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvpAt4pj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27426159B;
	Mon, 28 Apr 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835930; cv=none; b=LchptBlsqgPg+mhmIUCU8xQP+bYb+u09BVaYaWtPY0jrlKZqXruT6nf3vfZk9jyDiVICrcGssQNZd8A/mW6Z74naV2lLtgFsiRf5TLymyoELSDB6wV9Xikno2yHwVrvZW9UuVWk8FsKtxYT1Znplf372XltuexJOUTUk5SJ0/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835930; c=relaxed/simple;
	bh=+AQ0SV4y9SOynEjrUKoCWXryMwMdnBPwBDQOwExX91w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzUWFw2Nd4Q6gJsS8ttbmAq4uKNbcb2ebC+RSrbnQPrj5fmPW82lsQDr1ntXmNmWYt2pgqkBATwu6Qj2KKGJjNDGGYBz25ZPCX+hHaAB0NXf2nAp+SJ4LbCoNryYsWHYmryui3XS/8wWFT/dKDukPW2GPp6oIa9jj2ji48EQjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvpAt4pj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0618746bso33051265e9.2;
        Mon, 28 Apr 2025 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835927; x=1746440727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64HdmDgSJzT3obYsv1Sc9fPDQRvmKtwbW3ohFuTxJ+w=;
        b=AvpAt4pjSw8bjkRZ+sFacm0tJsAw7WKvlmYJkM6hfkgK8WiQTy46TluXYFXT/rsDti
         ZwA1SG+UHlH520BnDQ/WSrXmH99lmObdvafzrmN0a4pip22RDgNeCgVSKvc/xupo6WQo
         uAyGv7UQbqU9bFENSK6tIuKzkM2NFkRzxYZBmIMeoevITUBTiBpcSgdLvdjTI98cFuqh
         et37rPZh+z/e8EaSkDUwsUK1reOxtkzqcFQ8CNYGGdLQYu+X5MM7faEpEUdXZk6sxrZA
         6d+5M71kjpboo7ZAaqdcZxnEkOe5wJzi0GPXeZwJiEpxHpHP2rAaethfdtnhhmFq4a8g
         mNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835927; x=1746440727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64HdmDgSJzT3obYsv1Sc9fPDQRvmKtwbW3ohFuTxJ+w=;
        b=OAFtccmSsIuqCobIpqupQfw80vZ4dyraSRI+MHcXHX/AkroB92bojT8XhkIy8kVJuC
         WLows3c4ZpBCdiF9MHKHYFOvVOMZmBJByVLzqj/wUSSfZ8VukZIl/b/SMYes7CeWqdws
         ZTwSBGs+G+5TSahd/0Ryrh28o1FWCg/Rf8lBfDLyA3yECBxD9xJP/zG2AAgQtFTTzfP5
         O2IKuneT9Hxa8680rSVxQumG6RhwjH1rey/bY6OHzN01QqpHuUZkFMxenBUvv+WwGEBt
         YKLziV//vQgo120Phf+JhgrjLfgDnyCDIz+Quj3rH3huFb6KoiZbpiA2wJ4Pg8H08eHO
         ePOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDrMG7EI0IMppEgn8j4REBrY4Zs1fh/Tuene7jsSNFLFnaeNDSMyhRYmSp4K1deYehGJViQl5l8v3zfj8=@vger.kernel.org, AJvYcCWd6VCOcgXeBVUpDRcWFaEPMUNGDZyYGWVb8rzDGKmUvDNR0LxfXX9iW8XsQGw0AgLHdo2fYcTxk/TUdY65@vger.kernel.org, AJvYcCWjSkzPQx6jK54/8/PK1HAWdxLRJn9EmZBXTPKJi5sRBIle74vwjjHYjYQOlBKfel0tRoAX6k2wkZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywun5oQOR3v6u2HKM7koKs/GhkIvus6Ns6GbShuR7Mof/xm1D7+
	cqdVEVaK5Bp0dstYQQMTAHoV7ZyTkcWZEGL6XXx4nQcezG2sPDoF0Z1EZA==
X-Gm-Gg: ASbGncvoL0I8gCcf/5Ise3axBA+FFU463/8JSWet42cNIHVIEotU8d7ikA8DUoBcwS3
	zGzbTOckfHFewOroZrJSsHRJqe5nuuyaAGMz8XWFHU81g1zxQpscH3eO/yjCXmikBHm8WWnK/D7
	NoCzRtCbR62iKrR1FqxGdIU7iNqUle1n5GO07E5Lk1Z37tnCdMC2AwnAKJj+o8SifL+nxMWxRul
	DxNON7VmraOJwh3pBdA/oM4yV+EyBK3U8K1SOZH6yWJVQz9KdadK8698ERevuEMVQfflx5ukniX
	wtZuPy3jOrmFGhnwA/YW6mQ30UKIMtFjngct1R856CRm0muW1mTI
X-Google-Smtp-Source: AGHT+IH7c9EYNf2PsbHIDdFvLQS3jair3TtOnzOUM1G1gWQjTFtEtlVk0ndSqjG9bgLstniU3NGWPA==
X-Received: by 2002:a05:600c:1d20:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-440ab7b279fmr71033455e9.14.1745835927104;
        Mon, 28 Apr 2025 03:25:27 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:26 -0700 (PDT)
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
Subject: [PATCH v4 2/9] i2c: atr: find_mapping() -> get_mapping()
Date: Mon, 28 Apr 2025 13:25:07 +0300
Message-ID: <20250428102516.933571-3-demonsingur@gmail.com>
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

A find operation implies that a null result is not an error.

Use get naming to clarify things and to prepare for splitting up the
logic inside this function.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index a79ca87e8bbd..939fb95fe781 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -241,7 +241,7 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
 
 /* Must be called with alias_pairs_lock held */
 static struct i2c_atr_alias_pair *
-i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
+i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
@@ -339,7 +339,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(chan, msgs[i].addr);
+		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
@@ -432,7 +432,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
@@ -540,7 +540,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
-- 
2.49.0


