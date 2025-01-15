Return-Path: <linux-i2c+bounces-9100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245EFA11DA4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 10:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49FD97A3592
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 09:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE81423F26B;
	Wed, 15 Jan 2025 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q9jmNSr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D7248194;
	Wed, 15 Jan 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933170; cv=none; b=JIqq475R3vvqtQ4yoE/47VYqNQgqpLGWidyd/okFk1UDq1RIEgIDRhBG4ZlVss6LuriBzwpztC/l+RHMdN9pmvPLCE7LxiVg8E/rk7gUx6gXXIWjgnj7UvqluIppJbydwnr/aC5jUJBn35BBOFArVLmGv9ItbkWLD6d39fREiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933170; c=relaxed/simple;
	bh=/u6Z70HltpNm709SIsczeyre2BDQ22jOY7EfZq/dd/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4GOj0HoIXiw4VtUSP0o/Yf01Zwp034KsEMRY6Vsd+5xJeoX8pht40DWSr70WaK8tFuq6QSikZFbBxSAtuUIcCGGIa5En5/MGxIXTNTkws0SuNeaDuxkZM/omYcZEBYo60+lQ1bajDr9ZUgvhI6MrbdRe3/naQqHKuD0JGKuzDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q9jmNSr2; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C350FF802;
	Wed, 15 Jan 2025 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736933166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdyqF/MNpk1AC1etMIMx4Zbfpq93DP6GrcctH+T5wdE=;
	b=Q9jmNSr2sHsuPO+mBaGl0/l+DeEW6anIMnXB4Q7nDHIFiTQ9J4kmPMTNz0Sow4vzuneYwE
	s5gTYf+iG0ernqXdxWygidXBz7g1HsmDQRY0p4sZ9Qepw0GjUBzineUg+DZQuP12Es4K1k
	bfSQSJ4Rdgibok97E0TUYoaL1n8nHYzKWjtQQhA/sEqIjfIMWaOXNFxiSVNLqr+1RkpT4x
	JAirvKZhM9s+5xWFXauYRj9WIbbzxfllY7P0Xx91t+RvX/yF5akaOEt4ZYHfgTmdeNB+/0
	WRMuZN1voJftRFyMHnINDS1e+YM16G/KLZuPr5rbLKgCqNf10ugLFzBMp21l8w==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 15 Jan 2025 10:25:39 +0100
Subject: [PATCH v6 2/9] media: i2c: ds90ub960: Replace aliased clients list
 with address list
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-fpc202-v6-2-d47a34820753@bootlin.com>
References: <20250115-fpc202-v6-0-d47a34820753@bootlin.com>
In-Reply-To: <20250115-fpc202-v6-0-d47a34820753@bootlin.com>
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
needed, the driver only needs to know the client address for each slot.

Convert the aliased_clients list to a list of aliased client addresses.
This will allow removing the "client" parameter from the i2c-atr callbacks
in a future patch.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/media/i2c/ds90ub960.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 33f362a008757578e4c96e6ea7bed2e590776d8d..13fb6020364d2b2d774400755f65da19365f220b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -467,7 +467,7 @@ struct ub960_rxport {
 		};
 	} eq;
 
-	const struct i2c_client *aliased_clients[UB960_MAX_PORT_ALIASES];
+	u16 aliased_addrs[UB960_MAX_PORT_ALIASES];
 };
 
 struct ub960_asd {
@@ -1031,17 +1031,17 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
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
@@ -1062,18 +1062,18 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
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
2.47.1


