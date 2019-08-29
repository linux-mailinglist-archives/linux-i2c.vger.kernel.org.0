Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05D9A0F5E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 04:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfH2CE4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 22:04:56 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:28575 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726384AbfH2CEz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Aug 2019 22:04:55 -0400
X-UUID: ac46628743ee478f872d918a93a30ef0-20190829
X-UUID: ac46628743ee478f872d918a93a30ef0-20190829
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 511660189; Thu, 29 Aug 2019 10:04:49 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 10:04:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 10:04:54 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH] misc: eeprom: at24: support pm_runtime control
Date:   Thu, 29 Aug 2019 10:04:46 +0800
Message-ID: <20190829020446.27176-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Although in the most platforms, the power of eeprom and i2c
are alway on, some platforms disable the eeprom and i2c power
in order to meet low power request.
This patch add the pm_runtime ops to control power to support
all platforms.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/misc/eeprom/at24.c | 61 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 35bf2477693d..2843e4b4aacd 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -23,6 +23,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 
 /* Address pointer is 16 bit. */
@@ -68,6 +69,12 @@
  * which won't work on pure SMBus systems.
  */
 
+static const char * const at24_supply_names[] = {
+	"power", "i2c",
+};
+
+#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
+
 struct at24_client {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -92,6 +99,8 @@ struct at24_data {
 
 	struct gpio_desc *wp_gpio;
 
+	bool has_supplies;
+	struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us, and we'll use them with SMBus calls.
@@ -663,6 +672,17 @@ static int at24_probe(struct i2c_client *client)
 	at24->client[0].client = client;
 	at24->client[0].regmap = regmap;
 
+	for (i = 0; i < AT24_NUM_SUPPLIES; i++)
+		at24->supplies[i].supply = at24_supply_names[i];
+	err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
+				       AT24_NUM_SUPPLIES,
+				       at24->supplies);
+	if (err == -EPROBE_DEFER) {
+		dev_err(dev, "Failed to get power regulators\n");
+		return err;
+	}
+	at24->has_supplies = !err ? true : false;
+
 	at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
 	if (IS_ERR(at24->wp_gpio))
 		return PTR_ERR(at24->wp_gpio);
@@ -705,13 +725,21 @@ static int at24_probe(struct i2c_client *client)
 	/* enable runtime pm */
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+	if (at24->has_supplies) {
+		err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
+		if (err) {
+			dev_err(dev, "Failed to enable power regulators\n");
+			return err;
+		}
+	}
 
 	/*
 	 * Perform a one-byte test read to verify that the
 	 * chip is functional.
 	 */
 	err = at24_read(at24, 0, &test_byte, 1);
-	pm_runtime_idle(dev);
+	pm_runtime_put(dev);
 	if (err) {
 		pm_runtime_disable(dev);
 		return -ENODEV;
@@ -726,15 +754,46 @@ static int at24_probe(struct i2c_client *client)
 
 static int at24_remove(struct i2c_client *client)
 {
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	if (at24->has_supplies)
+		regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
 
 	return 0;
 }
 
+static int __maybe_unused at24_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
+	if (at24->has_supplies)
+		return regulator_bulk_disable(AT24_NUM_SUPPLIES,
+					      at24->supplies);
+
+	return 0;
+}
+
+static int __maybe_unused at24_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
+	if (at24->has_supplies)
+		return regulator_bulk_enable(AT24_NUM_SUPPLIES,
+					     at24->supplies);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(at24_pm_ops, at24_suspend, at24_resume);
+
 static struct i2c_driver at24_driver = {
 	.driver = {
 		.name = "at24",
+		.pm = &at24_pm_ops,
 		.of_match_table = at24_of_match,
 		.acpi_match_table = ACPI_PTR(at24_acpi_ids),
 	},
-- 
2.18.0

