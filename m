Return-Path: <linux-i2c+bounces-8832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 268639FE650
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 14:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD6271882091
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 13:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFFA1ACED2;
	Mon, 30 Dec 2024 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hjwFdsZf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E61A8402;
	Mon, 30 Dec 2024 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564951; cv=none; b=PnwSdB4tQELix2iSfZGp9bfO/Lsstuo8bOfnbz0x/qCKiD1ky8qVTDZQlNJ6bipI223DYimojrwh2IOrwTSp9PMPYfTrdhzFzoCAjsaVvLxfYJWsaZoJSbxxqDBQh+LOYoegJgPcxCb9xcvsIzW28vvB+QXi9sjpnLQ7z5MB2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564951; c=relaxed/simple;
	bh=Vf4cU8hGlN5CKeJUZ8FSEdnC2aYtMBXX+DP3iTawkkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6xSDQgSuzeE3+ZrH4AdKsugr+XUG/u5iW6cc4+AqX0+517L0LF2KovMq0QLleW+ZULYFC9jpOHNdYUMXFVAv+XUmmZZ3W6jDmIo1Y9XKDxW0kML+iuCNORpYO1/J8sl8P0P1JXpkke3She++SEXFLVwR90Nn+hLmy9kBc8Go+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hjwFdsZf; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE65C4000D;
	Mon, 30 Dec 2024 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735564940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weXE6sdWg+2ApzA4KB1Gsr+ncUYzthpY4lVGqGGpBzo=;
	b=hjwFdsZfhrMFu9fZEdhwtY4FpbEAOF9yNAwp846Ed3fhfDaXCI+vqE+PX7gzgZbRR0ym3Z
	Q4DVR8fi5+S7NAg4ERQMrI01CULib15DSWk6SigWvIXD7bCmNi9Jww9BpcC5y3WCMVkdDS
	Yk2Jl7cfOyI0aluwe6b6jc5uY/3PnxqZO8NkeXprxuBLq+YklVwlL4XZSKrzQyNXTfKN9o
	AvoU7JPQEmVq0b7rolidnCqM08WqtmIcMZKN+Jg5cP3CmIBDW+adQhT3cEyuPovuVmXEDR
	PtEv7b04+RAcWhX/byNRInmDR5WvlaWDm6Z59ZkYwsPgJfZjlM47HggGtV8p5g==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 30 Dec 2024 14:22:05 +0100
Subject: [PATCH v4 3/9] media: i2c: ds90ub960: Protect alias_use_mask with
 a mutex
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-fpc202-v4-3-761b297dc697@bootlin.com>
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

The aliased_addrs list represents the occupation of an RX port's hardware
alias table. This list and the underlying hardware table are only accessed
in the attach/detach_client() callbacks.

These functions are only called from a bus notifier handler in i2c-atr.c,
which is always called with the notifier chain's semaphore held. This
indirectly prevents concurrent access to the aliased_addrs list.
However, more explicit and direct locking is preferable. Moreover, with the
introduction of dynamic address translation in a future patch, the
attach/detach_client() callbacks will be called from outside of the
notifier chain's read section.

Introduce a mutex to protect access to the aliased_addrs list and its
underlying hardware table.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/media/i2c/ds90ub960.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 7534ddf2079fef466d3a114f0be98599427639fa..0510427ac4e9214132bcdf3fa18873ec78c48a5e 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -467,6 +467,8 @@ struct ub960_rxport {
 		};
 	} eq;
 
+	/* lock for aliased_addrs and associated registers */
+	struct mutex aliased_addrs_lock;
 	u16 aliased_addrs[UB960_MAX_PORT_ALIASES];
 };
 
@@ -1030,6 +1032,9 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct ub960_rxport *rxport = priv->rxports[chan_id];
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
+	int ret = 0;
+
+	mutex_lock(&rxport->aliased_addrs_lock);
 
 	for (reg_idx = 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
 		if (!rxport->aliased_addrs[reg_idx])
@@ -1038,7 +1043,8 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 
 	if (reg_idx == UB960_MAX_PORT_ALIASES) {
 		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
-		return -EADDRNOTAVAIL;
+		ret = -EADDRNOTAVAIL;
+		goto out_unlock;
 	}
 
 	rxport->aliased_addrs[reg_idx] = client->addr;
@@ -1051,7 +1057,9 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
 		rxport->nport, client->addr, alias, reg_idx);
 
-	return 0;
+out_unlock:
+	mutex_unlock(&rxport->aliased_addrs_lock);
+	return ret;
 }
 
 static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
@@ -1062,6 +1070,8 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
+	mutex_lock(&rxport->aliased_addrs_lock);
+
 	for (reg_idx = 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
 		if (rxport->aliased_addrs[reg_idx] == client->addr)
 			break;
@@ -1070,7 +1080,7 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	if (reg_idx == UB960_MAX_PORT_ALIASES) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
-		return;
+		goto out_unlock;
 	}
 
 	rxport->aliased_addrs[reg_idx] = 0;
@@ -1079,6 +1089,9 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 
 	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
 		client->addr, reg_idx);
+
+out_unlock:
+	mutex_unlock(&rxport->aliased_addrs_lock);
 }
 
 static const struct i2c_atr_ops ub960_atr_ops = {
@@ -3181,6 +3194,8 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 		fwnode_handle_put(rxport->source.ep_fwnode);
 		fwnode_handle_put(rxport->ser.fwnode);
 
+		mutex_destroy(&rxport->aliased_addrs_lock);
+
 		kfree(rxport);
 		priv->rxports[nport] = NULL;
 	}
@@ -3401,6 +3416,8 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 	if (ret)
 		goto err_put_remote_fwnode;
 
+	mutex_init(&rxport->aliased_addrs_lock);
+
 	return 0;
 
 err_put_remote_fwnode:

-- 
2.47.1


