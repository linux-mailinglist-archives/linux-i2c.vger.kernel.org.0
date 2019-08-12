Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9E98AB83
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 01:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfHLXxI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 19:53:08 -0400
Received: from enpas.org ([46.38.239.100]:55726 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbfHLXxI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 19:53:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id E6B28100171;
        Mon, 12 Aug 2019 23:53:05 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH v2 2/4] i2c/busses/i2c-icy: Add LTC2990 present on 2019 board revision
Date:   Tue, 13 Aug 2019 01:52:35 +0200
Message-Id: <20190812235237.21797-2-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812235237.21797-1-max@enpas.org>
References: <20190812235237.21797-1-max@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since the 2019 a1k.org community re-print of these PCBs sports an
LTC2990 hwmon chip as an example use case, let this driver autoprobe
for that as well. If it is present, modprobing ltc2990 is sufficient.

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/i2c/busses/i2c-icy.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 7910f035b..8125683c5 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -59,6 +59,7 @@ struct icy_i2c {
 
 	void __iomem *reg_s0;
 	void __iomem *reg_s1;
+	struct i2c_client *client_ltc2990;
 };
 
 
@@ -105,6 +106,13 @@ static void icy_pcf_waitforpin(void *data)
 /*
  * Main i2c-icy part
  */
+static struct i2c_board_info icy_ltc2990_info = {
+	I2C_BOARD_INFO("ltc2990", 0x4c),
+};
+
+static unsigned short const icy_ltc2990_addresses[] = {0x4c, I2C_CLIENT_END};
+
+
 static int icy_probe(struct zorro_dev *z,
 			 const struct zorro_device_id *ent)
 {
@@ -153,6 +161,18 @@ static int icy_probe(struct zorro_dev *z,
 	dev_info(&z->dev, "ICY I2C controller at %#x, IRQ not implemented\n",
 		 z->resource.start);
 
+	/*
+	 * The 2019 a1k.org PCBs have an LTC2990 at 0x4c, so start
+	 * it automatically once ltc2990 is modprobed.
+	 *
+	 * in0 is the voltage of the internal 5V power supply.
+	 * temp1 is the temperature inside the chip.
+	 */
+	i2c->client_ltc2990 = i2c_new_probed_device(&i2c->adapter,
+						    &icy_ltc2990_info,
+						    icy_ltc2990_addresses,
+						    NULL);
+
 	return 0;
 }
 
@@ -160,6 +180,8 @@ static void icy_remove(struct zorro_dev *z)
 {
 	struct icy_i2c *i2c = dev_get_drvdata(&z->dev);
 
+	i2c_unregister_device(i2c->client_ltc2990);
+
 	i2c_del_adapter(&i2c->adapter);
 }
 
-- 
2.11.0

