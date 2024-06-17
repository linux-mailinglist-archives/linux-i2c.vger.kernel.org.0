Return-Path: <linux-i2c+bounces-4062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606890ADA3
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 14:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1871F21C07
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8DC195966;
	Mon, 17 Jun 2024 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p3i7z+U3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF91953A4;
	Mon, 17 Jun 2024 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626109; cv=none; b=hY0yV1i8Y0uy0K4yuJFn4dUgHispBHSfs/4jgeOkbSU0b9gFtjJZT4qz62XPLr0+fv5YjVmNncMN3BmW2AQagmFcH0j5NifHYL/RdgnMIzW6z+S+5WBnbnCMLVSFu0tPfJLTaC9TK5brWnk9TlzAIFTos5tDTpYL509SwTJx/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626109; c=relaxed/simple;
	bh=TfKKBv8AFhA+vH8mhW8s7HZ2r28DhWriurHkhv7w9+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGaRq/uHDrlvaQXI8EyXauYxOCH+4C4cIdYNbBoFw3z4YiaTRu5RT6FMXqmUEgw1WBX/fi5Ke/HhzvmdRYc+BPpculzZUVTSoXRi+DlH2upMoUfmw56jPHK9vDyxM3krK4pamt7GzzIxbD0un2ewwVsu/HmxUvOSXg2bOw7J8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p3i7z+U3; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 0123B40009;
	Mon, 17 Jun 2024 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718626105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bbFLl2ripxc9Dqv54mu21YE1HBXoGgxRaBaWn9NKxQ=;
	b=p3i7z+U3yCQnjYykDY+5OanbA4Bkc++6/CmQ5ttudqGf6fHxaaxptox5joY7/rzFj+JERP
	ThK2G9nJlrLzc85+e0aOTNZGUiSjrS0keA/9hAZWMIFuywrdzKOIye4miuyswWmphWfmor
	LiUZ3rUz+Wa5Rezf1TeHuHmd0JNHkTJOv0VjmXYaXrhWPI5JwQLj3n4TpfIyK0OrFjxctF
	kf6NFyHg/0vLv53mmSwreL6LRu2eY+LP0zj9CbkW7zi0sgNiM3Kue4aBD5MiGsItXJ11ej
	k/tO9ZQAkkxGoow+p2GRrOibHVFmTCOxUu+bL0ng1w0hVHk1lCRuEoK1ufyxmQ==
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
Subject: [PATCH v3 3/3] i2c: mux: gpio: Add support for the 'settle-time-us' property
Date: Mon, 17 Jun 2024 14:08:18 +0200
Message-ID: <20240617120818.81237-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
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

Add support for the 'settle-time-us' device-tree property. When set,
the i2c_mux_gpio_select() applies a delay before returning, leaving
enough time to the hardware to switch to the new bus.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c           | 6 ++++++
 include/linux/platform_data/i2c-mux-gpio.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index c61e9d9ea695..944577bb09c1 100644
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
 
+	if (mux->data.settle_time)
+		fsleep(mux->data.settle_time);
+
 	return 0;
 }
 
@@ -116,6 +120,8 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	if (device_property_read_u32(dev, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
+	device_property_read_u32(dev, "settle-time-us", &mux->data.settle_time);
+
 	return 0;
 }
 
diff --git a/include/linux/platform_data/i2c-mux-gpio.h b/include/linux/platform_data/i2c-mux-gpio.h
index 816a4cd3ccb5..b548588aa1f2 100644
--- a/include/linux/platform_data/i2c-mux-gpio.h
+++ b/include/linux/platform_data/i2c-mux-gpio.h
@@ -19,6 +19,7 @@
  *	position
  * @n_values: Number of multiplexer positions (busses to instantiate)
  * @idle: Bitmask to write to MUX when idle or GPIO_I2CMUX_NO_IDLE if not used
+ * @settle_time: Delay to wait when a new bus is selected
  */
 struct i2c_mux_gpio_platform_data {
 	int parent;
@@ -26,6 +27,7 @@ struct i2c_mux_gpio_platform_data {
 	const unsigned *values;
 	int n_values;
 	unsigned idle;
+	int settle_time;
 };
 
 #endif /* _LINUX_I2C_MUX_GPIO_H */
-- 
2.45.0


