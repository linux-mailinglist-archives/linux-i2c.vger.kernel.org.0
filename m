Return-Path: <linux-i2c+bounces-8187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE01D9D7D35
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 09:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D55EB246E8
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 08:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0F218F2FC;
	Mon, 25 Nov 2024 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VV+H+okm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7D7082C;
	Mon, 25 Nov 2024 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524337; cv=none; b=PuBtxJbRsnQvzRrsPXVhHdg7aWl7SD/ho6wEkDMje++oDnE3ynkLw1Sli9pXans/p5e6kh4KNeJ8B1FMTw0/P12TQSPah+Dh0k1ZDGTOU8uaXqp5QdtlKp1mYXMGYn8wh5LROMumjOwoROtIv2hhTWy98tWsz/LfE+SvEgjrmxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524337; c=relaxed/simple;
	bh=1ypPzc3wV+lBm0DYM/aNzTLOzfM+uS1LxxpyOA8V4G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ma/VEZWC+YakVQDoTkopMkNMWB+374rDnJE3qmjCFAzgWRtZ7aECN+TjcA2zIaj3tE4ak3gQqnMARs3A3mbdcnxq3oTPDIX0DS2O88sL1iIwL08ZnYC8Ia9cwj1e2Qzk/mFS0HEWllEn7+JQjdxtJBlc07hXSM5CMw9MoQuW4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VV+H+okm; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6BF61BF203;
	Mon, 25 Nov 2024 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732524332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFZV/j2cdKSUUBE7wpD1K2bQ3OXCC6ZtMchgh75jPUI=;
	b=VV+H+okmbq8ZZ2DF156wnPWf+TJ2sKnipOcwPu2DAbk8+4Wcx8AQHj/BlFCPuuW2K8ZykT
	68Tm6WuXLOxteuMwUuJBs0KK9ByR1dEV1deXQQWmf1AdMRsAp2VOGFxJDn85nfb3chn0OI
	RU93VUQxrtjnWiiij6E0eYGD5lErAXr4e9yGcNLQ7Fj0yH0jlnO8ogVm7H5iQYrOs3rQab
	sK4EAqKgZUm1RCsRz0A2NENAPLg5mKpnIWxlYSDZlLgFP5XMSj3tv5xRfKFgL1+OREeUju
	pid/N+keMGCGSbv5Uvydxisjw+IoIpDiZV3HkUgkqm6QRo5s7dZngO8bb0QVjg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 25 Nov 2024 09:45:16 +0100
Subject: [PATCH v3 2/9] media: i2c: ds90ub960: Replace aliased clients list
 with bitmap
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-fpc202-v3-2-34e86bcb5b56@bootlin.com>
References: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
In-Reply-To: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
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

The ds90ub960 driver currently uses a list of i2c_client structs to keep
track of used I2C address translator (ATR) alias slots for each RX port.

Keeping these i2c_client structs in the alias slot list isn't actually
needed, the driver only needs to know if a specific alias slot is already
in use or not.

Convert the aliased_clients list to a bitmap named "alias_use_mask". This
will allow removing the "client" parameter from the i2c-atr callbacks in a
future patch.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/media/i2c/ds90ub960.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647624be005da33a6412da2493413b4..f86028894c78187257efc8fd70812387000796f7 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -468,7 +468,7 @@ struct ub960_rxport {
 		};
 	} eq;
 
-	const struct i2c_client *aliased_clients[UB960_MAX_PORT_ALIASES];
+	DECLARE_BITMAP(alias_use_mask, UB960_MAX_PORT_ALIASES);
 };
 
 struct ub960_asd {
@@ -1032,17 +1032,13 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
-	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
-		if (!rxport->aliased_clients[reg_idx])
-			break;
-	}
-
-	if (reg_idx == ARRAY_SIZE(rxport->aliased_clients)) {
+	reg_idx = find_first_zero_bit(rxport->alias_use_mask, UB960_MAX_PORT_ALIASES);
+	if (reg_idx >= UB960_MAX_PORT_ALIASES) {
 		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
 		return -EADDRNOTAVAIL;
 	}
 
-	rxport->aliased_clients[reg_idx] = client;
+	set_bit(reg_idx, rxport->alias_use_mask);
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
 			   client->addr << 1);
@@ -1063,18 +1059,15 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
-	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
-		if (rxport->aliased_clients[reg_idx] == client)
-			break;
-	}
+	reg_idx = find_first_zero_bit(rxport->alias_use_mask, UB960_MAX_PORT_ALIASES);
 
-	if (reg_idx == ARRAY_SIZE(rxport->aliased_clients)) {
+	if (reg_idx >= UB960_MAX_PORT_ALIASES) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
 		return;
 	}
 
-	rxport->aliased_clients[reg_idx] = NULL;
+	clear_bit(reg_idx, rxport->alias_use_mask);
 
 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
 
@@ -3404,6 +3397,8 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 	if (ret)
 		goto err_put_remote_fwnode;
 
+	bitmap_zero(rxport->alias_use_mask, UB960_MAX_PORT_ALIASES);
+
 	return 0;
 
 err_put_remote_fwnode:

-- 
2.47.0


