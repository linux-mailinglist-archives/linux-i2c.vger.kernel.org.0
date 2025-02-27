Return-Path: <linux-i2c+bounces-9610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE301A47A1C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 11:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 909A63B3541
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 10:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8376422AE76;
	Thu, 27 Feb 2025 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gzdgkjO0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7221C18F;
	Thu, 27 Feb 2025 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651724; cv=none; b=lgJ4cgyHqA0BYLRZ8UfTFwoRBklRkbvpovq0fyF58wlDP6XWu8VmpFrvuYfvv7hItyYnPoxB3nPaNyA6uHX216YIjfNKtg8Kpe93w4K/teiWjccPNsirLCb2qd6ce5U3QN3ierNJazd4AM/vFw3nPWi9tE7z7VVEKZzJqEMJQuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651724; c=relaxed/simple;
	bh=BBtj3Mwf7zGRNgb0IC5jOBEMA+1tBFrQ51xMHJp6tUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbJ/LtboTYdPLad2gFskUfOvQMjX5Q/kaiM8fMgq2YATY0PDf83XhD6w5iZEqcvR4AuCkhwbVf/6i3vNcUB1Gq44rYVFZyD+fisQ9JY+ZxllIUIfitoc25KTq6WqP59LwPpv5qgbmrbpPsPkLz+Kb9li7fS900bppK1h+mFf4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gzdgkjO0; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B48943217;
	Thu, 27 Feb 2025 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740651720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aE8uWqg0n8aCFliC3uASiOBweWjYLEMfGVFEkQo2L90=;
	b=gzdgkjO0LnHzuG4pXDbRs0gAAhDEru6WY2owdFQlnIFfMYDcLbmQ+om1nmVf+89l8ab/12
	1YqSpkMvAnnCiweVf9aFn1UiZtKYXBHfT6LTlNHY507Yi6uk9uUPLIjrlhMLPmbLrIdCEh
	e6w+kn97voIXwcOVqPQqN3MDuNxYiV/hK2uOQ1xa0PvpqdACl3uj3RIhevRd+h6bmVfiCk
	h2is5jLK641AvlVamp0z3fnqWTHY+TQELHOjfJn9dpd6NH4/LdGkUnA2HkvUzL+0+qXCSn
	hLQ6wd5FusDO9Bx0JdmipfssDRCejM3pagv+vzQUSm0OSucT6kwAsVqeeHi6XQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 27 Feb 2025 11:21:51 +0100
Subject: [PATCH v8 3/9] media: i2c: ds90ub960: Protect alias_use_mask with
 a mutex
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fpc202-v8-3-b7994117fbe2@bootlin.com>
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

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/media/i2c/ds90ub960.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index e1d53ef087538f7df2c992612e70ce6a3e24906b..5969692480409a1632ac05e43c58df479982bdd5 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -27,6 +27,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/fwnode.h>
@@ -478,6 +479,8 @@ struct ub960_rxport {
 		};
 	} eq;
 
+	/* lock for aliased_addrs and associated registers */
+	struct mutex aliased_addrs_lock;
 	u16 aliased_addrs[UB960_MAX_PORT_ALIASES];
 };
 
@@ -1054,6 +1057,8 @@ static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
+	guard(mutex)(&rxport->aliased_addrs_lock);
+
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
 		if (!rxport->aliased_addrs[reg_idx])
 			break;
@@ -1085,6 +1090,8 @@ static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
 	struct device *dev = &priv->client->dev;
 	unsigned int reg_idx;
 
+	guard(mutex)(&rxport->aliased_addrs_lock);
+
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
 		if (rxport->aliased_addrs[reg_idx] == client->addr)
 			break;
@@ -3236,6 +3243,8 @@ static void ub960_rxport_free_ports(struct ub960_data *priv)
 		fwnode_handle_put(rxport->source.ep_fwnode);
 		fwnode_handle_put(rxport->ser.fwnode);
 
+		mutex_destroy(&rxport->aliased_addrs_lock);
+
 		kfree(rxport);
 		priv->rxports[nport] = NULL;
 	}
@@ -3456,6 +3465,8 @@ static int ub960_parse_dt_rxport(struct ub960_data *priv, unsigned int nport,
 	if (ret)
 		goto err_put_remote_fwnode;
 
+	mutex_init(&rxport->aliased_addrs_lock);
+
 	return 0;
 
 err_put_remote_fwnode:

-- 
2.48.1


