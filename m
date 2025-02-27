Return-Path: <linux-i2c+bounces-9609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2F1A47A14
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 11:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8F71892263
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE1522A7F7;
	Thu, 27 Feb 2025 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eQdevDeo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016921B9EE;
	Thu, 27 Feb 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651723; cv=none; b=AQ1nxNGEzKUDbxm6Tan59qni6GeUW5QUZV1kgpJVakvuyWhZn8Ds570mWxQ9INqd6/w04FtKmnJq2I43G1GkxKXt7HiTHLUODOeB/qa3ygd0/f4aPT1iJiJNuJ6aTpmUxRTwDbh4ww4HiZPXMyva/TQdDRzrvjZz11cZHITb8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651723; c=relaxed/simple;
	bh=EoOK3hu4+P00KuxGjfl9D8WRjeanZM0PCU3rUB+LrRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMWegc2Glqs/XmMdVk4dXxHM+zi2JuPeGrvHqzvVwkPnsr398G/PJ9PyVhpD2VXlzcYaJSi1oudISvZGvKCr0qCmR3TyQJ5TQTjZ0Im4pFg/FVXLfRRKoJg41kP95RCFa2ZkRtmuHdsyNe5RWUhxFROroDjVy3FZCPs0Sqwrl7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eQdevDeo; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 327EA431BA;
	Thu, 27 Feb 2025 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740651719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=615K8IHxeuVTuiuHgeRfdTow1610ajhWJBEUO6S5fCk=;
	b=eQdevDeoL8zZM1DGS4n1L8OHty1Aeg46Gh/wuTyqGqukYNBYoo2C1L5NsNpGiAxD1HUw89
	TJJy1NMop0/zZx33oz8liWugv5mFpW6DHwHNrrJsoI0YBfQXuQvJFaVaEJbSKNld3XXik/
	v6iR8Eit5QBM91wEfp0DDDoV4F0m71D9M+t/qWedebfExLw5Ksx9KeY5v7eDSTnm0a3B2Q
	J/K+B/fiOhsVbZgvE4zjbrNQiXuGKKIzsZ5f7nUVdW7zqgCQpdJiSPfcoVbwGlmF7f8dbJ
	GfX1/U+vZVqxUlPe7GYEKkuL6+a5piG15Q0KtQLaVWE+rNx8GwQ/svXspKvGmQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 27 Feb 2025 11:21:50 +0100
Subject: [PATCH v8 2/9] media: i2c: ds90ub960: Replace aliased clients list
 with address list
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fpc202-v8-2-b7994117fbe2@bootlin.com>
References: <20250227-fpc202-v8-0-b7994117fbe2@bootlin.com>
In-Reply-To: <20250227-fpc202-v8-0-b7994117fbe2@bootlin.com>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjedvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelieefteelffeuheevtdetkefhfffhteffkefgtefhkeevudeutdeugfffheegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudefngdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepr
 ghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurhgrghgrnhdrtghvvghtihgtsegrmhgurdgtohhm
X-GND-Sasl: romain.gantois@bootlin.com

The ds90ub960 driver currently uses a list of i2c_client structs to keep
track of used I2C address translator (ATR) alias slots for each RX port.

Keeping these i2c_client structs in the alias slot list isn't actually
needed, the driver only needs to know the client address for each slot.

Convert the aliased_clients list to a list of aliased client addresses.
This will allow removing the "client" parameter from the i2c-atr callbacks
in a future patch.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/media/i2c/ds90ub960.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5dde8452739b64dd5b847a7bc1dac556ea43ca6c..e1d53ef087538f7df2c992612e70ce6a3e24906b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -478,7 +478,7 @@ struct ub960_rxport {
 		};
 	} eq;
 
-	const struct i2c_client *aliased_clients[UB960_MAX_PORT_ALIASES];
+	u16 aliased_addrs[UB960_MAX_PORT_ALIASES];
 };
 
 struct ub960_asd {
@@ -1054,17 +1054,17 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
-	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
-		if (!rxport->aliased_clients[reg_idx])
+	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
+		if (!rxport->aliased_addrs[reg_idx])
 			break;
 	}
 
-	if (reg_idx == ARRAY_SIZE(rxport->aliased_clients)) {
+	if (reg_idx == ARRAY_SIZE(rxport->aliased_addrs)) {
 		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
 		return -EADDRNOTAVAIL;
 	}
 
-	rxport->aliased_clients[reg_idx] = client;
+	rxport->aliased_addrs[reg_idx] = client->addr;
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
 			   client->addr << 1);
@@ -1085,18 +1085,18 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
-	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
-		if (rxport->aliased_clients[reg_idx] == client)
+	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
+		if (rxport->aliased_addrs[reg_idx] == client->addr)
 			break;
 	}
 
-	if (reg_idx == ARRAY_SIZE(rxport->aliased_clients)) {
+	if (reg_idx == ARRAY_SIZE(rxport->aliased_addrs)) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
 		return;
 	}
 
-	rxport->aliased_clients[reg_idx] = NULL;
+	rxport->aliased_addrs[reg_idx] = 0;
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
 

-- 
2.48.1


