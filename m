Return-Path: <linux-i2c+bounces-9286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C881A26E4F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 10:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 504177A4FC2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 09:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52582207E14;
	Tue,  4 Feb 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y85470om"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940D207A27;
	Tue,  4 Feb 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661366; cv=none; b=A9hRWB3rv8PCPSdzbbgJtdDGayaaEPLN37zlEHB16g0F32Ihbo3VNDCcETH+iiLCllTfQJbLYF/MlznXX5qTYZ2Sg95AyZOSh6wE83bZvsz03N4DcgvYt0yn0w8O1+CaQ7X/9vNTxqzJHE9YxemBY6/E7BgV3bcOv4OU/1JnWJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661366; c=relaxed/simple;
	bh=PWVjDlbY+5QXMES1Jg43CGsHf063LAxvEUnul1zh5kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzRDxGoxtTAKfg6vOg+Ohj+BuHH551ejochcyHO09yHpPrnReucf9rhKSEyEJst0pwPenI/U8f61m4ifC493QSpD/o1pOxRN8Hcvy/s6VqhjK6FOuJdbtMO+lUSilxXaoGAl8vzQRpb+upL0QxKOwYRZSK8aUb7dRwVzk6Uer4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y85470om; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C808843423;
	Tue,  4 Feb 2025 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738661361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTmcIxBFhs+q9FfJ0TmuNV/3ZVPBqmxE+uUND15pWMY=;
	b=Y85470omv+PEK8UOJ3mUTZmtHMB2wygbE1Wc7a0qyLFuhXob012694idgZH4CY/FyIBRFB
	9d02rPJD+EIssAuPkUIWBfuZfY0NURE+2XRTMj4wHjKGlLHFiwnYjv85KbzGyGYCqc/anj
	0C67LnFX8wlXdf+G8Gu/8cnPMifQTDFAUOydmuvob1vqgRXiunXn1Te71e0eJH4/dF1HLn
	QXUv4nshOZL2wxH6kkASYN9OPPnfWN1SaZpOnbvd9kQ7NFoL2shUotEqBQgbAkVFwreoJJ
	22y5em54/2zPjC8QdrNHLgheNj+DHXUvd9CHKcnLmhu9+r/NMydH3HwBNARb2A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 04 Feb 2025 10:29:13 +0100
Subject: [PATCH v7 2/9] media: i2c: ds90ub960: Replace aliased clients list
 with address list
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-fpc202-v7-2-78b4b8a35cf1@bootlin.com>
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
In-Reply-To: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelieefteelffeuheevtdetkefhfffhteffkefgtefhkeevudeutdeugfffheegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudefngdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghrvghkrdhkihgvrhhnrghnsegrmhgurdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghns
 ehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegurhgrghgrnhdrtghvvghtihgtsegrmhgurdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrgh
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
2.47.1


