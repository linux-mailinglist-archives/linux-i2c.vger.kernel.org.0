Return-Path: <linux-i2c+bounces-8022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B379D0E42
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 11:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13E0EB28B55
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 10:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63DC19992E;
	Mon, 18 Nov 2024 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UX9PcVPj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4EE194AD9;
	Mon, 18 Nov 2024 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924803; cv=none; b=Wm5lWAoMpsOzSfAmLDfu4HYR9QAgDsOkVBKu7xFFyR68AthvIVWfh/+ocW+xkdTklaudn4gyub+qHX4BRRWnBtNr+mZ/F4X4N1dJyberXnDwFb1Aaq48fDEY6/hFRMlrpc9RcwiVaRJuymZMZHNNs/YLpHDuU/iRPbC4sNcoSdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924803; c=relaxed/simple;
	bh=u3850H6HDMj3d6UhcPkiKAmao322p05bJ/lEKAJSgtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrPv/ZiAz/Bxv6g6bsWNT7lB1twC/+rKmZFppLQ96Z6CZhyQXhV1AEAW0jwfjzntnSbD8775MuDcFQV1RKJPENky4F91YOqDbUOvQPqnmm6S/B2Z/K7qKJjeaCTaPOBCYWM6njnoF7I5zkendNnmLOZUNQjmWGqbuDdSJ6k6NnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UX9PcVPj; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB6831BF20C;
	Mon, 18 Nov 2024 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731924793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5zllN3RyR2rCAMaUjg2lao0VPW3ctT8CwfZRn1byPs=;
	b=UX9PcVPjRBWLIzEfn9P/N46Ynn6F07EIuBVQUVLkYUc4x94kXVnnEtXRhpXAxMshgQiOgu
	YSfPuZcJKeAtNNBP3oxfiRyWipCSdg0tEBW2LApq47KDdf9s+IenOOEi7OuPJMHKcPO8x/
	yfF/QiberNkJfjifjcEu7ChY/4LpCP34xrUEsBWL6jIhrogvH/ShpTlBlp6GR/exNnsUJd
	8QDyEzkyN7RqBI2EO2p34QTqVVlVjRs3TFAg/dOr/dGThKwuA/C6efOCPiZjaJA+JuyCco
	IPp7y4WI6rzfAVhLkcSXQGr8pnpTwYY8ajU9Vv6hoI7Kt+ENdG7tkcq9g0UHXw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 18 Nov 2024 11:13:02 +0100
Subject: [PATCH v2 3/9] media: i2c: ds90ub960: Protect alias_use_mask with
 a mutex
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-fpc202-v2-3-744e4f192a2d@bootlin.com>
References: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
In-Reply-To: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
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

The alias_use_mask bitmap represents the occupation of an RX port's
hardware alias table. This bitmap and the underlying hardware table are
only accessed in the attach/detach_client() callbacks.

These functions are only called from a bus notifier handler in i2c-atr.c,
which is always called with the notifier chain's semaphore held. This
indirectly prevents concurrent access to the alias_use_mask bitmap.
However, more explicit and direct locking is preferable. Moreover, with the
introduction of dynamic address translation in a future patch, the
attach/detach_client() callbacks will be called from outside of the
notifier chain's read section.

Introduce a mutex to protect access to the alias_use_mask bitmap and its
underlying hardware table.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/media/i2c/ds90ub960.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index f86028894c78187257efc8fd70812387000796f7..84aa976bed2d74f1d639684601f4c1c38d748188 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -468,6 +468,8 @@ struct ub960_rxport {
 		};
 	} eq;
 
+	/* lock for alias_use_mask and associated registers */
+	struct mutex alias_mask_lock;
 	DECLARE_BITMAP(alias_use_mask, UB960_MAX_PORT_ALIASES);
 };
 
@@ -1031,11 +1033,15 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct ub960_rxport *rxport = priv->rxports[chan_id];
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
+	int ret = 0;
+
+	mutex_lock(&rxport->alias_mask_lock);
 
 	reg_idx = find_first_zero_bit(rxport->alias_use_mask, UB960_MAX_PORT_ALIASES);
 	if (reg_idx >= UB960_MAX_PORT_ALIASES) {
 		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
-		return -EADDRNOTAVAIL;
+		ret = -EADDRNOTAVAIL;
+		goto out_unlock;
 	}
 
 	set_bit(reg_idx, rxport->alias_use_mask);
@@ -1048,7 +1054,9 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
 		rxport->nport, client->addr, alias, reg_idx);
 
-	return 0;
+out_unlock:
+	mutex_unlock(&rxport->alias_mask_lock);
+	return ret;
 }
 
 static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
@@ -1059,12 +1067,14 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
+	mutex_lock(&rxport->alias_mask_lock);
+
 	reg_idx = find_first_zero_bit(rxport->alias_use_mask, UB960_MAX_PORT_ALIASES);
 
 	if (reg_idx >= UB960_MAX_PORT_ALIASES) {
 		dev_err(dev, "rx%u: client 0x%02x is not mapped!\n",
 			rxport->nport, client->addr);
-		return;
+		goto out_unlock;
 	}
 
 	clear_bit(reg_idx, rxport->alias_use_mask);
@@ -1073,6 +1083,9 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 
 	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
 		client->addr, reg_idx);
+
+out_unlock:
+	mutex_unlock(&rxport->alias_mask_lock);
 }
 
 static const struct i2c_atr_ops ub960_atr_ops = {
@@ -3177,6 +3190,8 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 		fwnode_handle_put(rxport->source.ep_fwnode);
 		fwnode_handle_put(rxport->ser.fwnode);
 
+		mutex_destroy(&rxport->alias_mask_lock);
+
 		kfree(rxport);
 		priv->rxports[nport] = NULL;
 	}
@@ -3398,6 +3413,7 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 		goto err_put_remote_fwnode;
 
 	bitmap_zero(rxport->alias_use_mask, UB960_MAX_PORT_ALIASES);
+	mutex_init(&rxport->alias_mask_lock);
 
 	return 0;
 

-- 
2.47.0


