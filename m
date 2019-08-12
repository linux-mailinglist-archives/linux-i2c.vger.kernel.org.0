Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5D88AB79
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 01:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfHLXxJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 19:53:09 -0400
Received: from enpas.org ([46.38.239.100]:55746 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfHLXxJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 19:53:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id B7B7D100704;
        Mon, 12 Aug 2019 23:53:06 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH v2 4/4] i2c/busses/i2c-icy: Add platform_data for LTC2990
Date:   Tue, 13 Aug 2019 01:52:37 +0200
Message-Id: <20190812235237.21797-4-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812235237.21797-1-max@enpas.org>
References: <20190812235237.21797-1-max@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This enables the three additional inputs available on the 2019 a1k.org
reprint of the ICY board:

  in1 will be the voltage of the 5V rail, divided by 2.
  in2 will be the voltage of the 12V rail, divided by 4.
  temp3 will be measured using a PCB loop next the chip.

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/i2c/busses/i2c-icy.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 8125683c5..6ad9910a0 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -42,6 +42,7 @@
 
 #include <linux/i2c.h>
 #include <linux/i2c-algo-pcf.h>
+#include <linux/platform_data/ltc2990.h>
 
 #include <asm/amigaints.h>
 #include <linux/zorro.h>
@@ -106,8 +107,21 @@ static void icy_pcf_waitforpin(void *data)
 /*
  * Main i2c-icy part
  */
+static struct ltc2990_platform_data icy_ltc2990_platform_data = {
+	/*
+	 * Additional sensors exposed by this platform data:
+	 *
+	 * in1 will be the voltage of the 5V rail, divided by 2.
+	 * in2 will be the voltage of the 12V rail, divided by 4.
+	 * temp3 will be measured using a PCB loop next the chip.
+	 */
+	.meas_mode = {0, 3},
+};
+
 static struct i2c_board_info icy_ltc2990_info = {
-	I2C_BOARD_INFO("ltc2990", 0x4c),
+	.type		= "ltc2990",
+	.addr		= 0x4c,
+	.platform_data	= &icy_ltc2990_platform_data,
 };
 
 static unsigned short const icy_ltc2990_addresses[] = {0x4c, I2C_CLIENT_END};
@@ -167,6 +181,8 @@ static int icy_probe(struct zorro_dev *z,
 	 *
 	 * in0 is the voltage of the internal 5V power supply.
 	 * temp1 is the temperature inside the chip.
+	 *
+	 * See platform data above for in1, in2, temp3.
 	 */
 	i2c->client_ltc2990 = i2c_new_probed_device(&i2c->adapter,
 						    &icy_ltc2990_info,
-- 
2.11.0

