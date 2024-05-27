Return-Path: <linux-i2c+bounces-3680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A11298CFF30
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 13:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFEA31C2220C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 11:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AAD15E5CD;
	Mon, 27 May 2024 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YWG0pUdO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559815DBC6;
	Mon, 27 May 2024 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809965; cv=none; b=f8oijMWzHKdejf7VDLJz9Q50UezRIdPjp0Qgl9mFtCHYfYQTOn6D3UrbgRyBIpWwwHrlZYHWz8KVlFElQdEVfpliDHRdNzF6tYdcsnpr+G0vursBZwp6yB62h3nG4Cn2J38qW1Tc1kiG6B1ozSwzqVavnPiq/KZKIS35IXjoOCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809965; c=relaxed/simple;
	bh=CziR8tGg5qwYNvJIC+QQYLKyVrnjY04Q5lyj/7UJ7ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUul2IMY59h61Zmxp63qh/sv8V3ogoUk1z5diW4HnA7qL9to23RhKxVaTaapQxUmHedLf/rBjDigJnRHKaSPJUlwXCp9jeMyydooGL4lvj9zu5W8i5n4OVywZbzw7IzeunLsTXhWL9OzCPXrYShlyIc71V98LOtsgFAJKqNHcEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YWG0pUdO; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id B4BA61C0008;
	Mon, 27 May 2024 11:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716809956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzjZT6VO3PxtG5290LSf4VPSnmjoCdCbJpas0iFjQn4=;
	b=YWG0pUdOVE5ttqrJyGb+Y9ye+4BRUS6/YkTrUf+78IMYXx8jFDFyaPYa1Fj/cEYPtuAmbC
	8lmCWTvWanyDCzHd5zuq30E4O+i2G74wW5dqt856qXVCE+JqaDPFlfNKMdQIAnv/U5R+Ky
	4FcHVkstnXr3R4eSSgB/VwFyLuS2L82wQBqFaxppOxc6CBUx3YMfN/As5cC9fhKqNHcsCG
	EDmRIUfC0nc/LZqh7tB6ST78SuHrYuDGxaZ+CB5A3SPGw6ykF70tsfJXkTKkUqqA3z2+eM
	qCeWsHKHOFtivTHWQPVPWw4Nwx2Jk/uh23u9qf6utgYGOJmMVyDGXe/5nFYpZg==
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
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 3/3] i2c: mux: gpio: Add support for the 'transition-delay-ms' property
Date: Mon, 27 May 2024 13:39:08 +0200
Message-ID: <20240527113908.127893-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
References: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
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

Add support for the 'transition-delay-ms' device-tree property. When set,
the i2c_mux_gpio_select() applies a delay before returning, leaving
enough time to the hardware to switch to the new bus.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c           | 6 ++++++
 include/linux/platform_data/i2c-mux-gpio.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index c61e9d9ea695..d2cbbaa09485 100644
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
+		mdelay(mux->data.transition_delay);
+
 	return 0;
 }
 
@@ -116,6 +120,8 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	if (device_property_read_u32(dev, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
+	device_property_read_u32(dev, "transition-delay-ms", &mux->data.transition_delay);
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


