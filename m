Return-Path: <linux-i2c+bounces-3701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E72068D32C7
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 11:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 238B81C23448
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 09:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F3516E871;
	Wed, 29 May 2024 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H0r7cZOl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFD16A375;
	Wed, 29 May 2024 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974275; cv=none; b=jzDvHMKmJwQDatC+GOCUmzYzlcCr3P0IbcdugnXv4Vm2bT9RYetYz2YCoIqzeEB/4N9n7BSyA0aiD6h9IT5fPmz3IfjQ74k9Ft7oDgwNbKcVXJdAegXnar4/Y5YLQC0J2kTzfC/dWVGUTEP/vzKYAyWv6yK6ZC+FrPoLB2+ybdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974275; c=relaxed/simple;
	bh=rAquyJjGl8AvRSJGDILkpKhh6ptv3dUO3G5M0U8rfq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5+maAOZGZl46JWZclXq75OTkL10LVPByac2XVAMsSatWBDxKGdxdoGIzthf2p8S2O1gZldLTVyyoNezoDXB4Ey6rjFeipXLfj1/N4g/drqM2OuAJakRVz/hdL+KHqYQ0GYA6L8rQvVbJtjQlpN5C0MKrPUlDd1EPlrVkky3rtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H0r7cZOl; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id C6BE740009;
	Wed, 29 May 2024 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716974266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avFH+TZR+wV/3lFdLJG11Lahbf9QsDr/KQUzB649vpc=;
	b=H0r7cZOlg4xUHgNF6KRBu97q0RWPV3zMDpjmjiulr6EXDEx6COUcc3lg9xIFuVgh2VSavM
	gmc8kRdvwLGhIuv2r3BIjci74MoiNRvmyaHCT4Vb3thdGVp8ZxfjJMJaAFEPMmAVa87/3q
	e2icDhz1jZ/B+C1kUeJZk+C1SMksPhIIs5ZcRJvLoCs2jJsNqX9eSLZi77E1ZhBNfNekhR
	G9wmNVj5Onn+u6wxN/yx+mdNd64sPFiAKkwmkE9gsFBhZ/nAJzOCfGcMkTJ7vHqZgAjYz0
	ucQHGCC1flZTO6ft8JxV3hgffAu4ruTLIIy0uwLJ47b2crTb6QfquWIywBlyfw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v2 3/3] i2c: mux: gpio: Add support for the 'transition-delay-us' property
Date: Wed, 29 May 2024 11:17:39 +0200
Message-ID: <20240529091739.10808-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Some hardware need some time to switch from a bus to another. This can
cause the first transfers following the selection of a bus to fail.
There is no way to configure this kind of waiting time in the driver.

Add support for the 'transition-delay-us' device-tree property. When set,
the i2c_mux_gpio_select() applies a delay before returning, leaving
enough time to the hardware to switch to the new bus.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c           | 6 ++++++
 include/linux/platform_data/i2c-mux-gpio.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index c61e9d9ea695..b9cfc80660e2 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
@@ -37,6 +38,9 @@ static int i2c_mux_gpio_select(struct i2c_mux_core *muxc, u32 chan)
 
 	i2c_mux_gpio_set(mux, chan);
 
+	if (mux->data.transition_delay)
+		udelay(mux->data.transition_delay);
+
 	return 0;
 }
 
@@ -116,6 +120,8 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	if (device_property_read_u32(dev, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
+	device_property_read_u32(dev, "transition-delay-us", &mux->data.transition_delay);
+
 	return 0;
 }
 
diff --git a/include/linux/platform_data/i2c-mux-gpio.h b/include/linux/platform_data/i2c-mux-gpio.h
index 816a4cd3ccb5..c449f714d32b 100644
--- a/include/linux/platform_data/i2c-mux-gpio.h
+++ b/include/linux/platform_data/i2c-mux-gpio.h
@@ -19,6 +19,7 @@
  *	position
  * @n_values: Number of multiplexer positions (busses to instantiate)
  * @idle: Bitmask to write to MUX when idle or GPIO_I2CMUX_NO_IDLE if not used
+ * @transition_delay: Delay to wait when a new bus is selected
  */
 struct i2c_mux_gpio_platform_data {
 	int parent;
@@ -26,6 +27,7 @@ struct i2c_mux_gpio_platform_data {
 	const unsigned *values;
 	int n_values;
 	unsigned idle;
+	int transition_delay;
 };
 
 #endif /* _LINUX_I2C_MUX_GPIO_H */
-- 
2.44.0


