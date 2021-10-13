Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA0242C281
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 16:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235662AbhJMOPN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 10:15:13 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:5438 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhJMOPN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 10:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634134390; x=1665670390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XwFxZzbdV+FjwFqNLqNmM3P65mE3OIvnLElxkhz2zRE=;
  b=hXRKc7FDBxxIkPHroZEibE6KS1YXnZybQxL7BhQx5fxPW5Ad5Rq7HTnz
   g27xd5/rMR/FCi4ZJZBaBQBG6HghovDeMCdmn+857jvl263Yog5X34Kcq
   GSEEsbiypNa6kh2zlJR3FsJWLWWTnyiUs1XeKRg/SF4dZQtnPJEsul0O3
   kpueo9pYE3OVZ/+1Y7MKPkIPGKGB90NeKM6SXzmo/17oUA/ocX4mfbjpo
   IeJfesOO68gVPOU6golghAHu5T/FVudOeyX6VMDjgmR6pURodbZUTsmGs
   zixG4EbNTRjj4vfe9wOdD0ibR6OAFLm1zY33JRIKMpHwTbWeR6SztgJkv
   Q==;
IronPort-SDR: uutPBZhzUAMA/q7T3VprZA70/jge25CgEEz8VinJFExlOzb7MSRSHwzN9NIix7IUhOincCcFW6
 N3RUmreMhE+mJzEL/1EFblto+EBTOybImZDUvAQQ3sN7N1lSnuY0eoVxaL9PZE8Q5HqA8BMJTW
 KIezk2m0DJSiPMZ5NrNKDNacqCNCFVevxdE5oNdmRLwbcgCj7wpfRKqU2Ai2iSXF0ZK6YUq4Kv
 rlI4DoA7ctSctEnrmhrSOnYgstgPJIx9GxszyItnWkMJSLoQ/Vpd+9Du5RdrFLe+nY98zb6SXH
 2/6gj7rproxGmcvHK7ZGqSTg
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="72800409"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 07:09:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 07:09:51 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 07:09:50 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <peter.korsgaard@barco.com>, <lars.povlsen@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 2/2] i2c: i2c-mux-gpio: Add support 'select-delay' property
Date:   Wed, 13 Oct 2021 16:10:03 +0200
Message-ID: <20211013141003.2388495-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use select-delay property to add a delay once the mux state is changed.
This is required on some platforms to allow the GPIO signals to get
stabilized.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index bac415a52b78..1cc69eb67221 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/bits.h>
 #include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+
 /* FIXME: stop poking around inside gpiolib */
 #include "../../gpio/gpiolib.h"
 
@@ -20,6 +22,7 @@ struct gpiomux {
 	struct i2c_mux_gpio_platform_data data;
 	int ngpios;
 	struct gpio_desc **gpios;
+	int select_delay;
 };
 
 static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
@@ -29,6 +32,8 @@ static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
 	values[0] = val;
 
 	gpiod_set_array_value_cansleep(mux->ngpios, mux->gpios, NULL, values);
+	if (mux->select_delay)
+		udelay(mux->select_delay);
 }
 
 static int i2c_mux_gpio_select(struct i2c_mux_core *muxc, u32 chan)
@@ -153,6 +158,8 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
+	fwnode_property_read_u32(dev->fwnode, "select-delay", &mux->select_delay);
+
 	return 0;
 }
 
-- 
2.33.0

