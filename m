Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575F7DBFD9
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 10:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632788AbfJRI0F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 04:26:05 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:55287 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2505018AbfJRI0F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Oct 2019 04:26:05 -0400
X-UUID: 9d3e8ea6f4eb4433a2f8d4ec13f5a3c0-20191018
X-UUID: 9d3e8ea6f4eb4433a2f8d4ec13f5a3c0-20191018
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1741489180; Fri, 18 Oct 2019 16:25:59 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 18 Oct 2019 16:25:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 18 Oct 2019 16:25:56 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v4] misc: eeprom: at24: support pm_runtime control
Date:   Fri, 18 Oct 2019 16:25:56 +0800
Message-ID: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
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

Changes since v3:
 - remove redundant calling function
 - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
 - change supply name

Changes since v2:
 - rebase onto v5.4-rc1
 - pm_runtime_disable and regulator_bulk_disable at
   err return in probe function

Changes since v1:
 - remove redundant code
 - fixup coding style

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 2cccd82a3106..68ced4f25916 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -22,6 +22,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 
 /* Address pointer is 16 bit. */
@@ -67,6 +68,12 @@
  * which won't work on pure SMBus systems.
  */
 
+static const char * const at24_supply_names[] = {
+	"vcc", "i2c",
+};
+
+#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
+
 struct at24_client {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -91,6 +98,8 @@ struct at24_data {
 
 	struct gpio_desc *wp_gpio;
 
+	bool has_supplies;
+	struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us, and we'll use them with SMBus calls.
@@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
 	at24->client[0].client = client;
 	at24->client[0].regmap = regmap;
 
+	regulator_bulk_set_supply_names(at24->supplies,
+					at24_supply_names, AT24_NUM_SUPPLIES);
+	err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
+				       AT24_NUM_SUPPLIES, at24->supplies);
+	if (err == -ENODEV)
+		at24->has_supplies = NULL;
+	else if (err == 0)
+		at24->has_supplies = !err;
+	else
+		return err;
+
 	at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
 	if (IS_ERR(at24->wp_gpio))
 		return PTR_ERR(at24->wp_gpio);
@@ -701,6 +721,14 @@ static int at24_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, at24);
 
+	if (at24->has_supplies) {
+		err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
+		if (err) {
+			dev_err(dev, "Failed to enable power regulators\n");
+			return err;
+		}
+	}
+
 	/* enable runtime pm */
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -713,6 +741,9 @@ static int at24_probe(struct i2c_client *client)
 	pm_runtime_idle(dev);
 	if (err) {
 		pm_runtime_disable(dev);
+		if (at24->has_supplies)
+			regulator_bulk_disable(AT24_NUM_SUPPLIES,
+					       at24->supplies);
 		return -ENODEV;
 	}
 
@@ -725,15 +756,48 @@ static int at24_probe(struct i2c_client *client)
 
 static int at24_remove(struct i2c_client *client)
 {
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	if (at24->has_supplies)
+		regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
+
+	return 0;
+}
+
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
 
 	return 0;
 }
 
+static const struct dev_pm_ops at24_pm_ops = {
+	SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
+};
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

