Return-Path: <linux-i2c+bounces-8826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C809FE635
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 14:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDFF27A1348
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 13:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2FD1A8412;
	Mon, 30 Dec 2024 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fhqg5qnz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813ADEAD0;
	Mon, 30 Dec 2024 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564948; cv=none; b=d1L6Dj5Nkaz8iVSmKuw58BZDbfpvLRDeT0ok9Vos7LWxKTn7+KbsSFCqmB8ScOcqJRKVdPE3es7jOpiQjlS3jFz+CXawP9cUa3N4E2cSkNmwGp9h9szN/Z94zrcA92hp5zurWKMrceF4PmPNNJGaAhoUvpIM5lHezNPddA2SRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564948; c=relaxed/simple;
	bh=7qjxaDb1n/cfOMOXwRC1Z14jSBnm4PHKXXck7whflZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHEv1koyAy1yano44dP+s+sCr5h4BjOxNXZAQKYNbS0C6tZAxGGgnYb9oBZA+CuJFe9MvWehFZVAWBtZjP/P1ae0NOUXBk9/4OWVX3IuvcQeX/VgNA24F0fL0j3v8cvAxGmAzrMUFzVFaeVZQ7rQKX3A6Er1ekDC7OmDq6fo4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fhqg5qnz; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB5FD40011;
	Mon, 30 Dec 2024 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735564943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7w9qi7FvqEzP4F7I6TnPP8j1jGVlHkoBFUCaIMCoHaM=;
	b=Fhqg5qnzouWXrUuwi56MI2tkGUV3IxQOHgaa20Xd2zGvB5ZrcovsT4rps6+1YQkJWr/ort
	qvoNI3gmJNc32+qOvVdzovETW0Q5GtzRSTmFSszVp9jud6uwfTW8LkqSm/0/79sErDK1hq
	qTHPlISpDH55RI0vnTgMNts0P/JIesQNLa5AT5KoXsUoujhcE7LQ2mJNvUmvUZdXmXW7D3
	GQzt1SvlyWUaLothrTqD0Droq2xs2vRrnGb8XYF7v2gFnPMPKGPJ6jYkxPfAkCMQ45GVWe
	82P7lSu8aX8YXR279xN5EAZjrnCHUE+SwS22VOiS/QMi32N175/yzFPNuOaq7g==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 30 Dec 2024 14:22:08 +0100
Subject: [PATCH v4 6/9] i2c: rename field 'alias_list' of struct
 i2c_atr_chan to 'alias_pairs'
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-fpc202-v4-6-761b297dc697@bootlin.com>
References: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
In-Reply-To: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
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
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
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
index ab759db56c546b2e26cd938dc9e0171df5473a8a..4652e9c2917ebdc817a5a661642e9f535e421c1a 100644
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
2.47.1


