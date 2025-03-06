Return-Path: <linux-i2c+bounces-9745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB62A55091
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 17:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4D897A5E32
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 16:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B521ABB9;
	Thu,  6 Mar 2025 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ESTS56vi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED3C215F6B;
	Thu,  6 Mar 2025 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278224; cv=none; b=OpQo5i4ewMDwJ+yJ4VhmP4wfL237g5cvbMSr2pvFgJpP84RG7gCv/fZ6jrGUa8iK1MPxV7t/vN/T27gOG2c9MNXQqfpR1k2MgIJ0Pi6rSblftK2fBedrkNps3/O3ep60lUsvM56qxRJ6c6qhqNh9ZaSjNCPT/x3fVKRa3Ejfqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278224; c=relaxed/simple;
	bh=Li8GISF5fQmLTIv6nGYlL30wkgVM4CdH3ZqxzaZPdsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSJMJzd2j6o5vC8I1CRLr7Ie4aGUjur+XIt2VXvmNBTr8jxnVx/Udr/MSFCE7j35wOFlfxUESpf4p/RXe6Q+KUMv7gjAWLTRck16yWThYxKrU/LixlcW34zPTlRAreC9caBKSq/W/ZvtujSU4kDq4gzPW6SRj0V43ArK67a08FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ESTS56vi; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97A2E44431;
	Thu,  6 Mar 2025 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741278220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tmXJmi+FA7gxKXpiGa4G/vN8jCryF71d3m8WEEKWeU=;
	b=ESTS56viqTcaCPRg1EhPL8i1Cy38eoH0nuQxl0uptpO0OB/eEEFcvscLrHGbWbwaATP7NN
	WvxrK+O9FM+02B3H8LUuUZqVopUjdEOp43VskiRUpFgWDqmU3jx1ug8OfxkySRKikuZkEx
	CA6lXxa8sOCs7CI/ihmw6BesTLQSEvISe+ul88wrF/7S1l9JEgMmiWEV5MMO+gpwUBQLGX
	AAFu83eEqFjfZqBi1fJp1DFtZiLn9Mk720F4GCR34PuCOSYPySZJYXavG9Ifr6DPNxkJVM
	wgxy6zzyuYpisCuraZxYQJNZZwbmrOtJg8Qe8PT9cIT8BN2MQTwhl+BlTzj4HQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 06 Mar 2025 17:23:27 +0100
Subject: [PATCH v9 6/9] i2c: rename field 'alias_list' of struct
 i2c_atr_chan to 'alias_pairs'
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-fpc202-v9-6-2779af6780f6@bootlin.com>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
In-Reply-To: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekleeifeetleffueehvedtteekhfffhfetffekgfethfekveduuedtuefgffehgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddufegnpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmr
 ghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

The "alias_list" field of struct i2c_atr_chan describes translation table
entries programmed in the ATR channel. This terminology will become more
confusing when per-channel alias pool support is introduced, as struct
i2c_atr_chan will gain a new field called "alias_pool", which will describe
aliases which are available to the ATR channel.

Rename the "alias_list" field to "alias_pairs" to clearly distinguish it
from the future "alias_pool" field.

No functional change is intended.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index e9c6b85e3e4a4ff84fdf9ad139f05fdceb441120..01f8c6f6e68a0a6012101a201c3fd8c7c0f25b47 100644
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
2.48.1


