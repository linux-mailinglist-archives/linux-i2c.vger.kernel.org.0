Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B3CA4DC6
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 05:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbfIBDcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Sep 2019 23:32:21 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:45001 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729333AbfIBDcV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Sep 2019 23:32:21 -0400
X-UUID: 1315deb52f844755ba11aabf65006759-20190902
X-UUID: 1315deb52f844755ba11aabf65006759-20190902
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1199839143; Mon, 02 Sep 2019 11:32:16 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Sep 2019 11:32:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Sep 2019 11:32:08 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v1] misc: eeprom: at24: support pm_runtime control
Date:   Mon, 2 Sep 2019 11:32:05 +0800
Message-ID: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
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

Changes since v1:
 - remove redundant code
 - fixup coding style

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/misc/eeprom/at24.c | 59 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 35bf2477693d..ce17e82eedca 100644
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
@@ -663,6 +672,15 @@ static int at24_probe(struct i2c_client *client)
 	at24->client[0].client = client;
 	at24->client[0].regmap = regmap;
 
+	for (i = 0; i < AT24_NUM_SUPPLIES; i++)
+		at24->supplies[i].supply = at24_supply_names[i];
+
+	err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
+				       AT24_NUM_SUPPLIES, at24->supplies);
+	if (err == -EPROBE_DEFER)
+		return err;
+	at24->has_supplies = !err;
+
 	at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
 	if (IS_ERR(at24->wp_gpio))
 		return PTR_ERR(at24->wp_gpio);
@@ -705,13 +723,21 @@ static int at24_probe(struct i2c_client *client)
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
@@ -726,15 +752,46 @@ static int at24_probe(struct i2c_client *client)
 
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

