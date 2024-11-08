Return-Path: <linux-i2c+bounces-7897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 815949C20AC
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 16:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AAB28553E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 15:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A5F21FD8A;
	Fri,  8 Nov 2024 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a1PqIS7m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB00D21C180;
	Fri,  8 Nov 2024 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080238; cv=none; b=J3evwKMpxyZz2XXzRvawDKG2OP8X7ez/KhAWvG0k++WqoDv75VE5C4qEa5oAVYWlWDje+igMycQRrQKnP/O0XhUEaV6DZQ7Uth9XmMemrsAke9KeM1InquUZaNd1gBaAQlIa4la/ZeDDj698a4idpBzp0VA90QmNJk5Osap9oOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080238; c=relaxed/simple;
	bh=0UI7/fLHKcX0p3XbFYY9tt17q1z2hrScWfZKi46Mzbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAv9H3auwKv4HCF62QPlfevnrMhCTi3FGX+/8C7UANbtm1iSE1+TYn4/kt+5x0b06FVsi7LKDC8Xz922N2TbMS38uJ261LUVXSrMrtLX7Set+iy4t2XXDmwl7fwXtXZ8A/SRBGR69LJhm3+9y8yzCgbs05/Vx0IeLW6rB8lUh+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a1PqIS7m; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B9B120013;
	Fri,  8 Nov 2024 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731080234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJgfCjnvNvvTwyd/QBAk+QnMdb9ttUUXMA4mNlEtL4o=;
	b=a1PqIS7mPvwcDqHrlP2l1iMSJciWUUFBQyu5tCqQOsPge2mPlU1qHfBbXa2rEsQKNGYCBi
	PW1I6J6i79fmbqT5hNepb8YWARbivT1l2G7ZkQsO4VOtj01UJc2RCq9VyadPJEygKxiuKv
	mOk7BLtUH3JesEMRVCLUkpT8tdSXfygGGhQkv3Za/fKpOjW6HKVyMRr3XGKQKdFqWbgk7u
	q5LL6QTZr13hToDqv0t1lzqMmiT6DTHX23wLELp6BqPVdsdvGjhN5ISJ3nZrjewWhm5Hpu
	R13Ug+zLMAPUR9a6q28mpRVmZ4u1Wv9xV1s+m1XCDZENILGU97KdyboC/5PSAQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 08 Nov 2024 16:36:58 +0100
Subject: [PATCH 6/9] i2c: rename field 'alias_list' of struct i2c_atr_chan
 to 'alias_pairs'
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fpc202-v1-6-fe42c698bc92@bootlin.com>
References: <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
In-Reply-To: <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

The "alias_list" field of struct i2c_atr_chan describes translation table
entries programmed in the ATR channel. This terminology will become more
confusing when per-channel alias pool support is introduced, as struct
i2c_atr_chan will gain a new field called "alias_pool", which will describe
aliases which are available to the ATR channel.

Rename the "alias_list" field to "alias_pairs" to clearly distinguish it
from the future "alias_pool" field.

No functional change is intended.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index c873fe52288175151040a4c32e6ed07735586004..84d82c09708ae39cf5501a1fb67e8f2af2bb5446 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -56,7 +56,7 @@ struct i2c_atr_alias_pool {
  * @adap:            The &struct i2c_adapter for the channel
  * @atr:             The parent I2C ATR
  * @chan_id:         The ID of this channel
- * @alias_list:      List of @struct i2c_atr_alias_pair containing the
+ * @alias_pairs:     List of @struct i2c_atr_alias_pair containing the
  *                   assigned aliases
  * @orig_addrs_lock: Mutex protecting @orig_addrs
  * @orig_addrs:      Buffer used to store the original addresses during transmit
@@ -67,7 +67,7 @@ struct i2c_atr_chan {
 	struct i2c_atr *atr;
 	u32 chan_id;
 
-	struct list_head alias_list;
+	struct list_head alias_pairs;
 
 	/* Lock orig_addrs during xfer */
 	struct mutex orig_addrs_lock;
@@ -192,7 +192,7 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 	for (i = 0; i < num; i++) {
 		chan->orig_addrs[i] = msgs[i].addr;
 
-		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list,
+		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs,
 						   msgs[i].addr);
 		if (!c2a) {
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
@@ -262,7 +262,7 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct i2c_adapter *parent = atr->parent;
 	struct i2c_atr_alias_pair *c2a;
 
-	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
+	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs, addr);
 	if (!c2a) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
 		return -ENXIO;
@@ -380,7 +380,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 
 	c2a->addr = addr;
 	c2a->alias = alias;
-	list_add(&c2a->node, &chan->alias_list);
+	list_add(&c2a->node, &chan->alias_pairs);
 
 	return 0;
 
@@ -401,7 +401,7 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	atr->ops->detach_addr(atr, chan->chan_id, addr);
 
-	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list, addr);
+	c2a = i2c_atr_find_mapping_by_addr(&chan->alias_pairs, addr);
 	if (!c2a) {
 		 /* This should never happen */
 		dev_warn(atr->dev, "Unable to find address mapping\n");
@@ -621,7 +621,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 
 	chan->atr = atr;
 	chan->chan_id = chan_id;
-	INIT_LIST_HEAD(&chan->alias_list);
+	INIT_LIST_HEAD(&chan->alias_pairs);
 	mutex_init(&chan->orig_addrs_lock);
 
 	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",

-- 
2.47.0


