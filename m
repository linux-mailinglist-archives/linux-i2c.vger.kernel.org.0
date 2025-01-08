Return-Path: <linux-i2c+bounces-8978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62DA0615B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 17:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 065C03A3197
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 16:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF601FFC77;
	Wed,  8 Jan 2025 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ErTi809w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A281FECD0;
	Wed,  8 Jan 2025 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352863; cv=none; b=oZPE+U+SVdjAuvt6YinrW06W6gIspg/KpBlwUqwH4WlYP2zmLkMoS3CzgmSRckA2lVO59+lhK427NWdSCR3kpAIBY7tyx0u1djTFVgUPUnDGe1GErWDEleqOUJMAyJovroirk3kV/D5iktPJ4shCaP9L7iqZtWEy873hZ5cgU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352863; c=relaxed/simple;
	bh=ASQ6Fw5qjJ/O0iPC+m3DVBcrmxyvL2adNzVtUrBPFi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T14XpqkDcK13r7ecB7U0qH2Ddk7+AnFSOTIpHDhj8ImM9xWmgh8nIiujvzFbmOt2sPLcn9FvfHPpHZTBf8ZNjmx2fXUwuBE/Zqw361T6YqTF3AYKNbRyZuLOldcq53pk7kzak/IBNhnzsDM5rFvdIQjoIZ3ghHK5y3h+GknKvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ErTi809w; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38B266000E;
	Wed,  8 Jan 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736352853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOSmciKpV7p8jAIDgx8nyxSnPVuTNrLy1iE6XeNvccY=;
	b=ErTi809wrb77MY3QjF9yK4K/inmL0JeGEOKOVC1HZAmOlSvQZY7b3V24fP6K9XuP6p47Te
	BCe+a9k3hpXhNDjIsTjwqY5G73b6P0dPrGmQrylBrojfTlJNEoSs17hEYCTwP2TzyMc+jq
	oEkkJqOYKxalKEYsFdnpycMXaZvulOgfpGyKhzZa+rNLsHlC+Hq/S2OJVFNIqU8Al/hypO
	XbbpOFeEOrFtgAFjrKSUTXfHqAbb2MWNESM4pe6DMu6v+tEAJz2HLxDqkFQzSsYoxOtHyi
	QT3tALebcZvL9LGB7DLWZJDcDxBXPh3d8zT6oMZd2jhGXOYF2jG/iLlknyDZ5A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 08 Jan 2025 17:14:04 +0100
Subject: [PATCH v5 3/9] media: i2c: ds90ub960: Protect alias_use_mask with
 a mutex
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-fpc202-v5-3-a439ab999d5a@bootlin.com>
References: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com>
In-Reply-To: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com>
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
 drivers/media/i2c/ds90ub960.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 13fb6020364d2b2d774400755f65da19365f220b..0c83c07c287c5eb168ec5d761f3d803c96d1e649 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -27,6 +27,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/fwnode.h>
@@ -467,6 +468,8 @@ struct ub960_rxport {
 		};
 	} eq;
 
+	/* lock for aliased_addrs and associated registers */
+	struct mutex aliased_addrs_lock;
 	u16 aliased_addrs[UB960_MAX_PORT_ALIASES];
 };
 
@@ -1031,6 +1034,8 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
+	guard(mutex)(&rxport->aliased_addrs_lock);
+
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
 		if (!rxport->aliased_addrs[reg_idx])
 			break;
@@ -1062,6 +1067,8 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
+	guard(mutex)(&rxport->aliased_addrs_lock);
+
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
 		if (rxport->aliased_addrs[reg_idx] == client->addr)
 			break;
@@ -3181,6 +3188,8 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 		fwnode_handle_put(rxport->source.ep_fwnode);
 		fwnode_handle_put(rxport->ser.fwnode);
 
+		mutex_destroy(&rxport->aliased_addrs_lock);
+
 		kfree(rxport);
 		priv->rxports[nport] = NULL;
 	}
@@ -3401,6 +3410,8 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 	if (ret)
 		goto err_put_remote_fwnode;
 
+	mutex_init(&rxport->aliased_addrs_lock);
+
 	return 0;
 
 err_put_remote_fwnode:

-- 
2.47.1


